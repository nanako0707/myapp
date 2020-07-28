class PurchasesController < ApplicationController
  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    #テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def plan
    Payjp::Plan.create(
      :amount => 1000,
      :interval => 'month',
      :billing_day => 27,
      :currency => 'jpy',
    )
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Subscription.create(
    :customer => card.customer_id, 
    :plan => plan,
    )
    user = User.where(id: current_user.id)
    user.update(premium: true)
    redirect_to action: 'done' 
  end

  def cancel
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    subscription = Payjp::Subscription.retrieve('sub_2a8f597af1fd191e7254de2adbbc')
    subscription.cancel
    user = User.where(id: current_user.id)
    user.update(premium: false)
    redirect_to action: 'canceled' 
  end
end

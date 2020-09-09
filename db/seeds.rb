User.create!(
  name: "admin",
  email: ENV['SENDGRID_DOMAIN'],
  password: "000000",
  password_confirmation: "000000",
  premium: true,
  admin: true
)

2.times do |n|
  email = Faker::Internet.email
  name = Faker::Name.name
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    premium: false,
    admin: false
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: 'マンマ',
    content: '
**準備するもの**
`機械出し`
- マンマコンテナ
- 生食500ml
- ドレッシング材(パット付きテガダーム)

**Dr.確認**
- 50万倍ボスミン

**手順**
1. 麻酔導入
2. 局所注射(50万倍ボスミン 10ml 23Gカテラン針)
3. 皮切(No.15メス)
4. 剥離(ペアン) + 結紮(3-0シルク)
5. 乳房摘出(頭側黒糸: 3-0ブラックシルク+ヘガール持針器 足側白糸: 3-0シルク+マチュー)
6. 洗浄(生食1000ml)
7. 閉創(3-0バイクリル+5-0黒ナイロン)',
    status: '編集済み',
    medical_department: '乳腺外科',
    image: File.open("./app/assets/images/pexels-freestocksorg-4074689.jpg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: '大動脈弁置換術',
    content: '
**準備するもの**
`外回り`
- 人工心肺
- ヘパリン

**Dr.確認**
`機械出し`
- 人工弁のサイズ

**手順**
1. 麻酔導入
2. 皮切(胸骨正中切開) No.15メス
3. 大動脈切開
4. 弁の切除
5. 人工弁の選択と弁のサイズ決定
6. 人工弁の逢着
7. 閉創',
    status: '編集中',
    medical_department: '心臓血管外科',
    image: File.open("./app/assets/images/photo-1564732278233-674355414c2c.jpeg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: '結腸切除',
    content: '
**準備するもの**
`機械出し`
- 自動吻合器
- タオル大4枚

**Dr.確認**
`機械出し`
- 自動吻合器の種類

**手順**
1. 麻酔導入
2. 皮切 正中切開(No.15メス) 
3. 開腹(腹腔内タオルの枚数をカウントする)
4. 大網の切離
5. 腸間膜の切開と腸管切離・吻合
6. 腹腔内洗浄(生食2L)
7. 閉腹',
    status: '編集済み',
    medical_department: '消化器外科',
    image: File.open("./app/assets/images/photo-1564732278233-674355414c2c.jpeg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: '開頭腫瘍摘出術',
    content: '
**準備するもの**
`機械出し`
- 開頭コンテナ

**Dr.確認**
- 局所注射種類

**手順**
1. 麻酔導入
2. 局所注射
3. 皮切(No.15メス)
4. 頭蓋骨の取り外し(骨片を保管する)
5. 腫瘍摘出
6. 縫合',
    status: '編集中',
    medical_department: '脳神経外科',
    image: File.open("./app/assets/images/photo-1564732278233-674355414c2c.jpeg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: 'カイザー',
    content: '
**準備するもの**
`機械出し`
- 生食500ml
- 農盆

**Dr.確認**
`機械出し`
- オキシトシン1単位

**手順**
1. 脊椎麻酔
2. 体位固定
3. ドレーピング
4. 皮切(No.15メス)
5. 腹膜切開
6. 人工破膜(外回り: 破膜時間・出産・胎盤摘出時間の記録)
7. 子宮切開
8. 出産
9. 胎盤摘出
10. 子宮縫合
11. 閉腹',
    status: '編集済み',
    medical_department: '産婦人科',
    image: File.open("./app/assets/images/pexels-freestocksorg-4074689.jpg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: '白内障手術',
    content: '
**準備するもの**
- 点眼麻酔

**手順**
1. 点眼麻酔
2. 創口作成
3. 眼粘弾剤注入
4. 前囊切開
5. 水晶体乳化吸引
6. 眼内レンズ挿入
7. 眼粘弾剤除去
8. 創口閉鎖',
    status: '編集中',
    medical_department: '眼科',
    image: File.open("./app/assets/images/surgical-tools-5016048_960_720.jpg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: '腫瘍切除術',
    content: '
**準備するもの**
`機械出し`
- 生食500ml

**Dr.確認**
- 局所注射の有無

**手順**
1. 麻酔導入
2. 局所注射
3. 皮切(No.15メス)
4. 腫瘍切除
5. 洗浄
6. 縫合',
    status: '編集済み',
    medical_department: '整形外科',
    image: File.open("./app/assets/images/tool-586818_960_720.jpg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: 'ティンパノ(鼓膜形成術)',
    content: '
**準備するもの**
`機械出し`
- 生食500ml

**Dr.確認**
- 20万倍ボスミン

**手順**
1. 麻酔導入
2. 局所注射
3. 皮切(No.15メス)
4. 鼓膜形成材料の採取(耳後部の皮下結合組織)
5. 穿孔辺縁の切除
6. 形成材料の残存鼓膜への接着
7. フィブリン糊による固定
8. 閉創',
    status: '編集中',
    medical_department: '耳鼻咽喉科',
    image: File.open("./app/assets/images/tool-586818_960_720.jpg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: '腹腔鏡下鼠径ヘルニア根治術',
    content: '
**準備するもの**
`機械出し`
- 生食500ml

`外回り`
- 腹腔鏡用モニター

**Dr.確認**
- 1%Eキシロカイン
- 腹腔鏡用トロッカー種類

**手順**
1. 麻酔導入
2. 局所注射(1%Eキシロカイン)
3. 皮切(No.11メス)
4. トロッカー挿入
5. 内視鏡挿入→腹腔内観察
6. 鼠径部から、ヘルニアの穴を閉鎖(Dr.に針糸を確認)
7. 閉創',
    status: '編集済み',
    medical_department: '小児科',
    image: File.open("./app/assets/images/cirurgical-instruments-2058089_960_720.jpg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: '顔面骨ORIF',
    content: '
**準備するもの**
`機械出し`
- 生食500ml
- プレート

**Dr.確認**
- 5000倍ボスミン
- 20万倍ボスミン

**手順**
1. 麻酔導入
2. 局所注射(20万倍ボスミン)
3. 皮切(No.15メス)
4. プレート固定
5. 洗浄
6. 閉創',
    status: '編集中',
    medical_department: '形成外科',
    image: File.open("./app/assets/images/photo-1560269941-141b145a1b57.jpeg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: 'VATS',
    content: '
**準備するもの**
`機械出し`
- 生食500ml
- グリセリン

`外回り`
- 胸腔鏡用モニター

**Dr.確認**
- トロッカー種類
- 開胸器の種類・大きさ
- 自動縫合器の種類

**手順**
1. 麻酔導入
2. 皮切(No.15メス)
3. 小開胸(開胸器)
4. トロッカー用皮切(No.11メス)
5. トロッカー挿入(グリセリン)
6. 肺動脈の剥離
7. 肺動脈の固定後、縫合切離
8. 肺静脈を露出
9. 自動縫合器で肺静脈を縫合切離
10. ラップザックに肺を入れ、体外へ摘出
11. 洗浄
12. ドレーン挿入
13. 閉創',
    status: '編集済み',
    medical_department: '呼吸器外科',
    image: File.open("./app/assets/images/cirurgical-instruments-2058089_960_720.jpg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: '抜歯術',
    content: '
**Dr.確認**
- 局所注射の種類
- ダイヤモンドバーの種類

**手順**
1. 麻酔導入
2. 歯肉切開及び粘膜骨膜弁剥離(剥離子)
3. 歯冠分割+摘出(ダイヤモンドバー準備)
4. 抜歯',
    status: '編集中',
    medical_department: '顎口腔外科',
    image: File.open("./app/assets/images/dentist-1517717_960_720.jpg")
  )
end

User.all.each do |user|
  user.surgical_operations.create!(
    title: 'TVT',
    content: '
**準備するもの**
`機械出し`
- ポリプロピレン製テープ
- TVT手術キット(アドバンテージフィット)

**手順**
1. 麻酔導入
2. 膣口の入り口付近の切開
3. 尿道周囲の剥離
4. 膣から下腹部へ、ポリプロピレン製テープを通して尿道を支える
5. 閉創',
    status: '編集済み',
    medical_department: '泌尿器科',
    image: File.open("./app/assets/images/photo-1561328165-f0b762a9508e.jpeg")
  )
end

readings_list = []
User.all.ids.each do |user_id|
  SurgicalOperation.all.each do |surgical_operation|
    readings_list << { user_id: user_id, surgical_operation_id: surgical_operation.id }
  end
end
Reading.create!(readings_list)

const starRating = (element, config = {}) => {
  if (!element) {
    return false
  }
  if (element.previousElementSibling && element.previousElementSibling.classList.contains('star-rating')) {
    element.previousElementSibling.remove()
  }
  const stars = 5
  element.setAttribute('hidden', true)
  element.value = element.value > stars ? stars : element.value
  const size = config.size || element.dataset.starRatingSize || 24
  const width = size * stars
  const initValue = (100 / stars) * element.value
  element.insertAdjacentHTML('beforebegin', `<div class="star-rating"><div class="star-rating-value" style="width: ${initValue}%" data-star-rating-width="${initValue}%"></div></div>`)
  const container = element.previousSibling
  const children = container.getElementsByClassName('star-rating-value')[0]

  container.style.width = width + 'px'
  container.style.height = size + 'px'
  container.style.backgroundSize = size + 'px'
  children.style.backgroundSize = size + 'px'
  element.readOnly && (container.style.cursor = 'auto')

  if (element.readOnly === false) {
    const getPercent = e => {
      const rect = e.target.getBoundingClientRect()
      const x = e.clientX - rect.left
      const percent = x / container.offsetWidth * 100
      return Math.ceil(Math.ceil(percent) / 10) * 10 + '%'
    }
    const setValue = () => {
      const newValue = children.dataset.starRatingWidth.replace('%', '') / (100 / stars)
      if (element.value != newValue) {
        element.value = newValue
        element.setAttribute('value', newValue)
        element.dispatchEvent(new Event('change'))
      }
    }
    container.addEventListener('mousemove', e => children.style.width = getPercent(e))
    container.addEventListener('mouseleave', () => children.style.width = children.dataset.starRatingWidth)
    container.addEventListener('click', e => {
      children.dataset.starRatingWidth = getPercent(e)
      setValue()
    })
  }
}

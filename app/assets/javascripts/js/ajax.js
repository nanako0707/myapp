'use strict'

// Load css and js plugins
App.loadPlugins = (plugins, script, synchronous) => {

  // Collect loaded plugins
  const loadedScript = [...document.head.querySelectorAll('script[src]')].map(i => i.getAttribute('src'))
  const loadedLink = [...document.head.querySelectorAll('link[href]')].map(i => i.getAttribute('href'))

  let loaded = []

  if (!synchronous) {
    if (script) { // Scripts will be loaded and executed everytime the page is loaded
      for (const url of script) {
        loaded.push(createScript(url, true))
      }
    }
    if (plugins) { // Plugins Will be loaded and executed only once
      for (const url of plugins) {
        url.substring(url.lastIndexOf('.') + 1) === 'css'
          ? loaded.push(createLink(url))
          : loaded.push(createScript(url))
      }
    }
    (!plugins && !script) && loaded.push(Promise.resolve())
  }

  async function sequence() {
    if (script) {
      for (const url of script) {
        await createScript(url, true)
      }
    }
    if (plugins) {
      for (let url of plugins) {
        url.substring(url.lastIndexOf('.') + 1) === 'css'
          ? await createLink(url)
          : await createScript(url)
      }
    }
    (!plugins && !script) && await Promise.resolve()
  }

  function createLink(url) {
    return new Promise((resolve, reject) => {
      if (loadedLink.indexOf(url) === -1) {
        let el = document.createElement('link')
        el.href = url
        el.rel = 'stylesheet'
        el.onload = () => resolve()
        el.onerror = () => reject(new Error('Style load error: ' + url))
        // write link tags just before main style so as not to override the main style
        document.getElementById('main-css').before(el)
      } else {
        resolve()
      }
    })
  }

  function createScript(url, isScript = false) {
    return new Promise((resolve, reject) => {
      if (loadedScript.indexOf(url) === -1 || isScript) {
        let el = document.createElement('script')
        el.src = isScript ? App.addTimestamp(url) : url
        el.onload = () => resolve()
        el.onerror = () => reject(new Error('Script load error: ' + url))
        isScript ? document.head.appendChild(el).parentNode.removeChild(el) : document.head.appendChild(el)
      } else {
        resolve()
      }
    })
  }

  return synchronous ? sequence() : Promise.all(loaded)
}

// Show ajax loader
App.startLoading = () => {
  ajaxloader.classList.add('loading')
  setTimeout(() => {
    if (ajaxloader.classList.contains('loading')) {
      ajaxloader.style.display = ''
      setTimeout(() => ajaxloader.classList.add('show'), 10)
    }
  }, 500) // if the content doesn't appear in half a second (500 ms), then display the loader
}

// Stop ajax loader
App.stopLoading = () => {
  ajaxloader.style.display = 'none'
  ajaxloader.classList.remove('loading','show')
}

/*
when you initiate a plugin on a page and then leave to another page,
it may leave elements that need to be cleaned up manually before loading new page
*/
App.cleanScraps = () => {
  // remove all tags written by some plugins (popover, datepicker, limiterBox..)
  let ajaxJs = document.getElementById('ajax-js')
  let otherTags = []
  while (ajaxJs = ajaxJs.nextElementSibling) {
    ajaxJs.tagName.toLowerCase() != 'script' && otherTags.push(ajaxJs)
  }
  for (const tag of otherTags) {
    tag.parentNode.removeChild(tag)
  }
}

// Run script from text content
App.contentEval = content => {
  const d = document.createElement('div')
  d.innerHTML = content
  // Run script tags
  for (let code of d.querySelectorAll('script')) {
    let script = buildElement('script', code)
    document.head.appendChild(script).parentNode.removeChild(script)
  }
  // Create element with all it's attributes & content
  function buildElement(tag, src) {
    const el = document.createElement(tag)
    src.text && (el.text = src.text)
    const attrs = src.attributes
    if (attrs.length) {
      for (let attr of attrs) {
        el.setAttribute(attr.nodeName, attr.nodeValue)
      }
    }
    return el
  }

  return content.replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, "")
}

App.addTimestamp = (url) => {
  if (url.indexOf('_=') !== -1) {
    return url
  } else {
    const sign = url.indexOf('?') !== -1 ? '&' : '?'
    return url + sign + '_=' + Date.now()
  }
}

// Load url to content
App.loadURL = (url, currentLink, config) => {
  const container = document.querySelector(config.container)
  App.startLoading()
  fetch(App.addTimestamp(url)).then(response => {
    response.text().then(text => {
      // scroll to top
      if (document.querySelector('.main-navbar') && App.lgUp()) {
        const headerHeight = document.querySelector('.main-header').getBoundingClientRect().height
        if (window.scrollY >= headerHeight) {
          window.scrollTo(0, headerHeight)
        }
      } else {
        window.scrollTo(0, 0)
      }

      if (response.ok) {
        App.cleanScraps()
        if (config.breadcrumb) {
          let breadcrumb = App.generateBreadcrumb(currentLink, config)
          breadcrumb && (text = breadcrumb + text)
        }
        container.innerHTML = App.contentEval(text)
        document.body.classList.remove('inner-expand') // close inner expand
        // autofocus
        const autofocusEl = container.querySelector('[autofocus]')
        autofocusEl && autofocusEl.focus()
      } else {
        App.stopLoading()
        container.innerHTML = '<div class="alert alert-danger alert-error-load" role="alert">' + text + '</div>'
      }
    })
  })
}

// Update active menu based on 'current module'
App.updateMenu = currentLink => {
  const nav = document.querySelector('#menu')
  for (const el of nav.querySelectorAll('.active, .show')) {
    currentLink != el && el.classList.remove('active', 'show') // Remove all .active .show
  }
  currentLink.classList.add('active')
  if (!currentLink.classList.contains('nav-link')) {
    // Add .active .show if currentLink is sub
    currentLink.closest('.nav-item').querySelector('.nav-link').classList.add('active', 'show')
  }
  // for 'md down' devices, close sidebar after link clicked
  (App.mdDown() && document.body.classList.contains('sidebar-expand')) && document.querySelector('[data-toggle="sidebar"]').click()
}

// Update active menu to Top navigation
App.updateMenuTop = currentLink => {
  const navbar = document.querySelector('.main-navbar')
  for (const el of navbar.querySelectorAll('.active')) {
    currentLink != el && el.classList.remove('active') // Remove all .active classes
  }
  currentLink.classList.add('active')
  if (!currentLink.classList.contains('nav-link')) {
    // Add .active .show if currentLink is sub
    currentLink.closest('.nav-item').querySelector('.nav-link').classList.add('active')
  }
}

// Generate breadcrumb
App.generateBreadcrumb = (currentLink, config) => {
  if (currentLink.dataset.breadcrumb !== 'false') {
    let item = [`<li class="breadcrumb-item"><a href="#${config.default}">Home</a></li>`]

    if (!currentLink.classList.contains('nav-link')) {
      const parentSub = currentLink.closest('ul').previousElementSibling.innerHTML
        .replace(/<i.*>.*?<\/i>/ig, '')
        .replace(/<span.*>.*?<\/span>/ig, '')
        .replace(/<svg.*>.*?<\/svg>/ig, '').trim()
      item.push(`<li class="breadcrumb-item"><a href="javascript:void(0)">${parentSub}</a></li>`)
    }
    item.push(`<li class="breadcrumb-item active" aria-current="page">${currentLink.innerHTML.replace(/<i.*>.*?<\/i>/ig, '').replace(/<span.*>.*?<\/span>/ig, '').replace(/<svg.*>.*?<\/svg>/ig, '').trim()}</a></li>`)

    return `
      <nav aria-label="breadcrumb" class="main-breadcrumb">
        <ol class="breadcrumb">
          ${item.join('\n')}
        </ol>
      </nav>`;
  }
}

// App ajax function
App.ajax = (config) => {
  const url = location.href.split('#').splice(1).join('#')

  if (url) {
    const currentLink = menu.querySelector('a[href="#' + (url.split('?')[0]).split('/')[0] + '"]')

    // load url to container
    App.loadURL(url + window.location.search, currentLink, config)

    // Update active menu
    currentLink && App.updateMenu(currentLink)
    if (document.querySelector('.main-navbar')) {
      const currentLink2 = document.querySelector('.main-navbar a[href="#' + (url.split('?')[0]).split('/')[0] + '"]')
      currentLink2 && App.updateMenuTop(currentLink2)
    }

    // change page title from global var
    document.title = currentLink
      ? currentLink.innerHTML
        .replace(/<i.*>.*?<\/i>/ig, '')
        .replace(/<svg.*>.*?<\/svg>/ig, '')
        .replace(/<span.*>.*?<\/span>/ig, '').trim()
      : document.title

  } else {
    // Load default url
    window.location.hash = menu.querySelector('a[href="#' + config.default + '"]').getAttribute('href')
  }

  // run on hash change
  window.onhashchange = () => App.ajax(config)

  // reload ajax
  App.ajaxReload = () => {
    App.ajax(config)
  }

  // reload on #refreshPage button clicked
  if (document.querySelector('#refreshPage')) {
    refreshPage.onclick = (e) => {
      App.ajaxReload()
      e.preventDefault()
    }
  }
}

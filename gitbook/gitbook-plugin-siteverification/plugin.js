require(['gitbook'], function(gitbook) {
  function insertAfter(newNode, existNode) {
    var parent = existNode.parentNode
    if (parent.lastChild === existNode) {
      parent.appendChild(newNode)
    } else {
      parent.insertBefore(newNode, existNode.nextSibling)
    }
  }

  function addMeta(type, siteId) {
    var meta = document.createElement('meta')
    meta.setAttribute('name', type + '-site-verification')
    meta.setAttribute('content', siteId)
    var ms = document.getElementsByTagName('meta')
    var m = ms[ms.length - 1]
    insertAfter(meta, m)
  }

  gitbook.events.bind('start', function(e, config) {
    var pluginConfig = config.siteVerification
    var baidu = pluginConfig.baidu
    var google = pluginConfig.google
    if (baidu) {
      if (Array.isArray(baidu)) {
        baidu.forEach(function(id) {
          addMeta('baidu', id)
        })
      } else {
        addMeta('baidu', pluginConfig.baidu)
      }
    }
    if (google) {
      if (Array.isArray(google)) {
        google.forEach(function(id) {
          addMeta('google', id)
        })
      } else {
        addMeta('google', pluginConfig.google)
      }
    }
  })
})

$('.ui.slider.checkbox').checkbox({
  onChecked: function(){
    var url = this.dataset['url'];
    var params = {
      method: 'POST',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.head.querySelector("[name=csrf-token]").content
      },
      body: JSON.stringify({
        taxon_item_id: this.value
      })
    };
    fetch(url, params).then(function(response) {
      return response.text()
    }).then(function(response) {
      var script = document.createElement('script');
      script.text = response;
      document.head.appendChild(script).parentNode.removeChild(script);
    }).catch(function(ex) {
      console.log('parsing failed', ex)
    })
  },
  onUnchecked: function(){
    var url = this.dataset['url'];
    var params = {
      method: 'DELETE',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/javascript',
        'X-CSRF-Token': document.head.querySelector("[name=csrf-token]").content
      }
    };
    fetch(url, params).then(function(response) {
      return response.text()
    }).then(function(response) {
      var script = document.createElement('script');
      script.text = response;
      document.head.appendChild(script).parentNode.removeChild(script);
    }).catch(function(ex) {
      console.log('parsing failed', ex)
    })
  }
});

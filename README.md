# sprockets-vue
A Sprockets transformer that converts .vue file into js object.

# example
* index.vue
```vue
//= require compents/card
<script lang="coffee">
{
  data: ->
    search: ''
    members: []
  components:
    card: VCompents['compents/card']
  methods:
    clear: ->
      this.search = ''
}
</script>

<template>
  <div class="container">
    <div class='search icon-input'>
      <span class="search-icon glyphicon glyphicon-search"></span>
      <input class="form-control" type="text" v-model='search'>
      <span @click='clear' class="clear-icon glyphicon glyphicon-remove"></span>
    </div>
    <card v-for="m in members" :m='m'></card>
  </div>
</template>
```

* application.coffee

```coffee
#= require index

new Vue(
  el: '#search',
  components: {
    'index': VCompents.index
  }
)
```

# compiled javascript

```javascript

;if (typeof(VCompents)==='undefined')VCompents = {};
VCompents['index'] = ({
  data: function() {
    return {
      members: [],
      search: ''
    };
  },
  methods: {
    clear: function() {
      return this.search = '';
    },
  }
});
;VCompents['index'].template = '\n  <div class=\"container\">\n    <div class=\'search icon-input\'>\n      <span class=\"search-icon glyphicon glyphicon-search\"><\/span>\n      <input class=\"form-control\" type=\"text\" v-model=\'search\'>\n      <span @click=\'clear\' class=\"clear-icon glyphicon glyphicon-remove\"><\/span>\n    <\/div>\n    <card v-for=\"m in members\" :m=\'m\'><\/card>\n  <\/div>\n';
```

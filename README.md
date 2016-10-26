# sprockets-vue
A [Sprockets](https://github.com/rails/sprockets) transformer that converts .vue file into js object.

# install
add `gem 'sprockets-vue'` to Gemfile, and run bundle, currently works with sprockets 3.
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

<style lang="scss">
.search{
  .icon-input{
    width: 100%;
  }
}
</style>
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

* application.scss
```scss
//=require index
```

> you can include .vue file in css file, it's style block will be automatic processed.
 you can also use `require_tree` to include all .vue file.😘
 `scoped` will not be supported. 

# advanced
* multi file compent https://github.com/kikyous/sprockets-vue/wiki/multi-file-compent


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

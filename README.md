# sprockets-vue

[![Gem](https://img.shields.io/gem/v/sprockets-vue.svg)](https://rubygems.org/gems/sprockets-vue)
[![Gem](https://img.shields.io/gem/dt/sprockets-vue.svg)](https://rubygems.org/gems/sprockets-vue)

A [Sprockets](https://github.com/rails/sprockets) transformer that converts .vue file into js object.


# heads up!

version 0.1.0 has incompatible changes, attempting to make the syntax
work more similarly to Webpack/vue-loader.

Specifically:

- You should assign `module.exports` variable to make it work! (not vm)
- You should use `VComponents` instead of `VCompents`
- Now supports normal javascript (as well as coffeescript)

# feature

following tag is supported in .vue file
* script (coffeescript and js)
* template (currently html only)
* style (scss, sass and css)

# install
add `gem 'sprockets-vue'` to Gemfile, and run bundle, currently works with sprockets 3.

# example
* index.vue
```vue
//= require components/card
<script lang="coffee">
module.exports = {
  data: ->
    search: ''
    members: []
  components:
    card: VComponents['components/card']
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
    'index': VComponents.index
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
* [multi file component](https://github.com/kikyous/sprockets-vue/wiki/multi-file-component)

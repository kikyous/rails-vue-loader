# rails-vue-loader

[![Gem](https://img.shields.io/gem/v/rails-vue-loader.svg)](https://rubygems.org/gems/rails-vue-loader)
[![Gem](https://img.shields.io/gem/dt/rails-vue-loader.svg)](https://rubygems.org/gems/rails-vue-loader)

rails-vue-loader(formerly sprockets-vue) -- a [Sprockets](https://github.com/rails/sprockets) transformer that converts .vue file into js object.

# feature

following tag is supported in .vue file
* script (coffeescript and js)
* template (currently html only)
* style (scss, sass and css)

# install
add `gem 'rails-vue-loader'` to Gemfile, and run bundle, currently works with sprockets 3.

# example

* app/assets/javascripts/application.coffee

```coffee
#= require index

new Vue(
  el: '#search',
  components: {
    'index': VComponents.index
  }
)
```

* app/assets/javascripts/index.vue *(stored into VComponents.index when required)*
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

* application.scss
```scss
//=require index
```

> you can include .vue file in css file, it's style block will be automatic processed.
 you can also use `require_tree` to include all .vue file.😘
 `scoped` will not be supported. 

# advanced
* [multi file component](https://github.com/kikyous/sprockets-vue/wiki/multi-file-component)

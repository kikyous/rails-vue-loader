# sprockets-vue
A Sprockets transformer that converts .vue file into js object.

* index.vue
```vue

<script lang="coffee">
{
  data: ->
    members: []
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
#= require ./index

new Vue(
  el: '#search',
  components: {
    'index': VCompents['index']
  }
)
```

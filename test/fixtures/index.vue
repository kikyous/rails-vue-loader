//= require components/card
<script lang="coffee">
vm = {
  data: ->
    search: 'test'
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

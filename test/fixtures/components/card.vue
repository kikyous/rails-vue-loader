//= require_self
//= require ./card.tpl
//= require ./card.style
<script lang="coffee">
vm =
  props: ['m']
  data: ->
    m: {}
    expand: false
  computed:
    avatar_url: ->
      if this.m.avatar
        this.m.avatar + '?imageView2/2/w/60/h/60/q/100'
      else
        'http://ww2.sinaimg.cn/large/801b780ajw1f8zvq84qkkj2040040wek.jpg'
</script>

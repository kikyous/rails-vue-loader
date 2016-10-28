<template>
  <div class="panel panel-default" @click='expand=!expand'>
    <div class="panel-heading">
      <h3 class="panel-title">{{m.p_name}}
        <span class="glyphicon glyphicon-user pull-right"></span>
      </h3>
    </div>
    <div class="panel-body">
      <ul class="media-list">
        <li class="media">
          <div class="media-left">
            <img class="avatar media-object" :src="avatar_url">
          </div>
          <div class="media-body">
            <div class="media-heading"> <b>{{m.p_position}}</b> </div>
            <div> {{ m.p_company }} </div>
            <div>
              <a href="tel:{{m.p_phone}}">{{ m.p_phone }}</a>
            </div>

          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

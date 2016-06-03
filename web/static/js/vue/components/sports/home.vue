<template>
  <div class="alert alert-warning alert-dismissable text-center" v-show="!loggedIn">
    <p> You need to be logged in to create a  sport </p>
  </div>
  <ol class="breadcrumb">
    <li v-link-active><a v-link="{path: '/sports'}">List</a></li>
    <li v-link-active v-show="loggedIn"><a v-link="{path: '/sports/new'}">New</a></li>
  </ol>
  <router-view></router-view>
</template>
<style media="screen">
</style>
<script>
  export default{
    data(){
      return{
        loggedIn: false
      }
    },

    created: function(){
      this.$http.get('/api/logged_in').then(function(data){
        this.loggedIn = parseInt(data.data.id) > 0
      }, function(error){

      })
    }
  }
</script>

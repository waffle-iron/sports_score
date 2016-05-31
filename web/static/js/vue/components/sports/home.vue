<template>
  <ol class="breadcrumb">
    <li v-link-active><a v-link="{path: '/sports'}">List</a></li>
    <li v-link-active><a v-link="{path: '/sports/new'}">New</a></li>
  </ol>
  <router-view></router-view>
</template>
<style media="screen">
</style>
<script>
  module.exports = {

  }
</script>

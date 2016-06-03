<template>
  <div class="jumbotron">
    <h3>{{sport | json}}</h3>
    <p></p>
  </div>
</template>
<style>

</style>
<script>
  export default{
    data(){
      return{
        sport: {}
      }
    },

    created: function(){
      this.getSport(this.$route.params.id)
    },
    methods: {
      getSport: function(id){
        this.$http.get('api/sports/'+ id)
        .then(function(response){
          this.sport = response.data.data
        },
        function(error){
          console.log(error)
        })
      }
    }
  }
</script>

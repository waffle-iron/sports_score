<template>
  <h6 class="text-center"> Create your sport </h6>
  <form class="form container" onsubmit="return false;">
    <div class="form-group">
      <label for="sportName"></label>
      <input type="text" class="form-control" id="sportName" v-model="sportName" @keyup.enter="createSport"  placeholder="football">
    </div>

    <button  v-on:click="createSport" type="button" class="btn btn-default btn-primary">
      Submit
    </button>
  </form>
</template>
<script>
  export default{
    data(){
      return{
        sportName: ""
      }
    },
    methods:
    {
      createSport: function(){
        var sport = {name: this.sportName}
        this.$http.post('api/sports', {sport: sport})
        .then(function(data){
          alertify.success(this.sportName + ' ' +data.statusText)
          this.sportName = ""
        }, function(error){
          alertify.error(error.statusText + '<br> Please check that this sport does not already exit!')
        })
      }
    }
  }
</script>

<template>
  <h6 class="text-center"> List of available sports ({{ nbSports }}) </h6>
  <div class="container">
    <div class="form-group">
      <label for=""></label>
      <input v-model="searchTerm" type="text" class="form-control" placeholder="Search for a sport"
      <p class="help-block">Filter the sports</p>
    </div>
    <ul class="list-group">
      <li v-for="sport in sports" class="list-group-item">{{sport.name}}</li>
    </ul>
  </div>

</template>
<script>
export default{
  props: ['sports', 'searchTerm', 'nbSports'],

  created: function(){
    this.init();
  },

  methods: {
    init: function(){
      this.sports = [];
      this.initialSearch();
    },

    initialSearch: function(){
      $.get('/api/sports').done(function(data){
        var received_data = data.data;
        console.log(received_data)
      }).fail(function(error){
        console.log(error)
      })
    },

    search: function(){

    }
  },

  computed: {
    nbSports: function(){
      return this.sports.length
    }
  }
}
</script>

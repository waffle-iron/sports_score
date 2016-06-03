<template>
  <h6 class="text-center"> List of available sports ({{ nbSports }}) </h6>
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-4">
        <div class="form-group">
          <label for=""></label>
          <input v-model="searchTerm" @keyup="search" type="text" class="form-control" placeholder="Search for a sport (3 characters minimum)"
        </div>
        <table class="table table-bordered table-stripped" v-show="nbSports > 0">
          <thead>
            <th>
              Name
            </th>
            <th>
              Created By
            </th>
          </thead>
          <tr v-for="sport in sports">
            <td>
              <a v-link="{ name: 'sport', params: { id: sport.id }}">{{sport.name}}</a>
            </td>
            <td>
              
            </td>
          </tr>
        </table>
      </div>
    </div>
  </div>

</template>
<script>
export default{
  data(){
    return{
      sports: [],
      searchTerm: '',
      currentUser: 0
    }
  },

  created: function(){
    this.sports = [];
    this.searchTerm = '';
    this.initialSearch();
  },

  methods: {
    initialSearch: function(){
      var result = [];
      this.$http.get('/api/sports').then(function(response){
        this.sports = response.data.data;
      }, function(error){
        console.log(error)
      })
    },

    search: function(){
      if(this.searchTerm.length > 2)
      {
        this.$http.post('/api/sports/search', {term: this.searchTerm}).then(function(response){
          this.sports = response.data.data
        }, function(error){
          alertify.error(error)
        })
      }
      if (this.searchTerm.length == 0) {
        this.initialSearch()
      }
    },

    getCurrentUser: funciton(){
      this.$http.get('/api/logged_in').then(function(data){
        this.currentUser = parseInt(data.data.id)
      }, function(error){
        alertify.error(error.statusText)
      })
    }
  },

  computed: {
    nbSports: function(){
      return this.sports.length
    }
  }
}
</script>

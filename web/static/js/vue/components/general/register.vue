<template lang="html">
  <form>
    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" class="form-control" id="username" v-model="username" placeholder="jojo">
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" v-model="email" placeholder="Email">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" v-model="password" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-default" @click="register()">Submit</button>
  </form>
</template>

<script>
export default {
  data: function () {
    return {
      email : '',
      password: '',
      username: '',
      errors: []
    }
  },
  computed: {},
  ready: function () {
    this.clear()
  },
  attached: function () {},
  methods: {
    register: function(){
      if(this.email.length < 1 || this.username.length < 1 || this.username.length < 1)
      {
        alertify.error('All the fields are required')
        return
      }

      var user = {};
      user.email = this.email
      user.username = this.username
      user.password = this.password
      this.$http.post('/register', {user_params: user}, {headers: {'x-csrf-token': window.userToken}}).then(function(response){
        var returnValue = response.data
        if(returnValue.success == true)
        {
          alertify.success(returnValue.message);          
          this.clear()
        }
        else
        {
          $.each(returnValue.errors, function(index, val) {
            alertify.error(val)
          });
        }
      }, function(error){
        alertify.error('An error occured during the registration please try again later')
      })
    },

    clear: function(){
      this.email = ''
      this.password = ''
      this.username = ''
    }
  },
  components: {}
}
</script>

<style lang="css">
</style>

<template lang="html">
  <form onsubmit="return false;">
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" v-model="email" placeholder="Email">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" v-model="password" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-default" @click="login()">Login</button>
    <a v-link="{ path: '/register' }">Register</a>
  </form>
</template>

<script>
export default {
  data: function () {
    return {
      email : '',
      password: ''
    }
  },
  computed: {},
  ready: function () {},
  attached: function () {},
  methods: {
    login: function(){

      var credentials = {}
      credentials.email = this.email
      credentials.password = this.password

      this.$http.post('/login', {user: credentials}, {headers: {'x-csrf-token': window.userToken}}).then(function(response){
        var returnValue = response.data
        if(returnValue.success == true)
        {
          alertify.success(returnValue.message);
          window.location.href = "/"
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
    }
  },
  components: {}
}
</script>

<style lang="css">
</style>

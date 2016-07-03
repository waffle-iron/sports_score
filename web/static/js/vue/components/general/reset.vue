<template lang="html">
  <form onsubmit="return false;">
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" v-model="email" placeholder="Email">
    </div>
    <div class="form-group">
      <label for="key">Key</label>
      <input type="text" class="form-control" id="key" v-model="key" placeholder="dsdvsddfvr4333t34m">
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" class="form-control" id="password" v-model="password" placeholder="Password">
    </div>
    <div class="form-group">
      <label for="passwordConfirm"> Confirm Password</label>
      <input type="password" class="form-control" id="passwordConfirm" v-model="passwordConfirm" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-default" @click="reset()">Reset Password</button>
  </form>
</template>

<script>
export default {
  data: function () {
    return {
      email : '',
      password: '',
      passwordConfirm: '',
      key: ''
    }
  },
  computed: {},
  ready: function () {},
  attached: function () {},
  methods: {
    reset: function(){

      var credentials = {}
      credentials.email = this.email
      credentials.password = this.password
      credentials.comfirm_password = this.passwordConfirm
      credentials.key = this.key

      this.$http.post('/reset', {user: credentials}, {headers: {'x-csrf-token': window.userToken}}).then(function(response){
        var returnValue = response.data
        console.log(returnValue)
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

<template lang="html">
  <form onsubmit="return false;">
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" v-model="email" placeholder="Email">
    </div>
    <button type="submit" class="btn btn-default" @click="reset()">Reset Password</button>
  </form>
</template>

<script>
export default {
  data: function () {
    return {
      email: ''
    }
  },
  computed: {},
  ready: function () {},
  attached: function () {},
  methods: {
    reset: function()
    {
      var user = {}
      user.email = this.email

      this.$http.post('/askreset', {user: user}, {headers: {'x-csrf-token': window.userToken}}).then(function(response){
        var returnValue = response.data
        if(returnValue.success == true)
        {
          alertify.success(returnValue.message);
          this.email = '';
        }
        else
        {
          $.each(returnValue.errors, function(index, val) {
            alertify.error(val)
          });
        }
      }, function(error){
        alertify.error('An error occured during the reset process please try again later')
      })
    }
  },
  components: {}
}
</script>

<style lang="css">
</style>

<template lang="html">
  <form @submit="confirm(); return false;">
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" v-model="email" placeholder="Email">
    </div>
    <div class="form-group">
      <label for="key">Key</label>
      <input type="text" class="form-control" id="key" v-model="key" placeholder="dsdvsddfvr4333t34m">
    </div>
    <button type="submit" class="btn btn-default">Confirm Email</button>
  </form>
</template>

<script>
export default {
  data: function () {
    return {
      email : '',
      key: ''
    }
  },
  computed: {},
  ready: function () {},
  attached: function () {},
  methods: {
    confirm: function(){
      this.$http.post('/confirm', {email: this.email, key: this.key}).then(function(response){
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
        alertify.error('An error occured during the confirmation please try again later')
      })
    },

    clear: function(){
      this.email = ''
      this.key = ''
    }
  },
  components: {}
}
</script>

<style lang="css">
</style>

<template lang="html">
  <form>
    <div class="form-group">
      <label for="exampleInputEmail1">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" v-model="email" placeholder="Email">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1" v-model="password" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
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
  methods: {},
  components: {}
}
</script>

<style lang="css">
</style>

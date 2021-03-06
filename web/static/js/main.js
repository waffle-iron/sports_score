var Vue = require('vue')
var VueRouter = require('vue-router')
var BaseComponentPath = "./vue/components/";


Vue.use(VueRouter)
Vue.use(require('vue-resource'))
Vue.http.headers.common['x-csrf-token'] = window.userToken;
var App = Vue.extend({
})

// Create a router instance.
// You can pass in additional options here, but let's
// keep it simple for now.
var router = new VueRouter({
    history: false,
    linkActiveClass: 'disabled'
})


//The components
var About 	    =  	require(BaseComponentPath + "general/about.vue")
var Login 	    =  	require(BaseComponentPath + "general/login.vue")
var Register 	  =  	require(BaseComponentPath + "general/register.vue")
var Home 	      =	require( BaseComponentPath + "general/home.vue")
var AskReset    = require(BaseComponentPath + "general/ask_reset.vue")
var Reset       = require(BaseComponentPath + "general/reset.vue")
var Confirm     = require(BaseComponentPath + "general/confirm.vue")



//Sports





// Define some routes.
// Each route should map to a component. The "component" can
// either be an actual component constructor created via
// Vue.extend(), or just a component options object.
// We'll talk about nested routes later.
router.map({
	'/': {
		component: Home
	},
  '/about': {
      component: About
  },
  '/login':{
    component: Login
  },
  '/register':{
    component: Register
  },
  '/ask_reset':{
    component: AskReset
  },
  '/reset_password':{
    component: Reset
  },
  '/confirm':{
    component: Confirm
  }
})

router.beforeEach(function () {
    window.scrollTo(0, 0)
})

// Now we can start the app!
// The router will create an instance of App and mount to
// the element matching the selector #app.
router.start(App, '#sportscore')

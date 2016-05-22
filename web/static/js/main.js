var Vue = require('vue')
var VueRouter = require('vue-router')
var VueResource = require('vue-resource')

Vue.use(VueRouter, VueResource)


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
var About 	=  	require("./vue/components/general/about.vue")
var Home 	=	require("./vue/components/general/home.vue")



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
})

router.beforeEach(function () {
    window.scrollTo(0, 0)
})

// Now we can start the app!
// The router will create an instance of App and mount to
// the element matching the selector #app.
router.start(App, '#sportscore')
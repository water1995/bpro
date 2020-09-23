/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');


//Vue.use(require('bootstrap-vue'));

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

/*Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

//import Vue from 'vue';
import VueRouter from 'vue-router';
Vue.use(VueRouter);

import Vuelidate from 'vuelidate';
import 'bootstrap/dist/css/bootstrap.min.css'
Vue.use(Vuelidate);

import routes from './routes';
const router = new VueRouter({
    routes
});

import VModal from 'vue-js-modal';
Vue.use(VModal);


Vue.component('spinner',require('vue-simple-spinner'));

import App from './App.vue';
if(window.Laravel.token != null){
Vue.prototype.token = window.Laravel.token;
}

new Vue({
    router,
    render: h => h(App)
}).$mount('#app');

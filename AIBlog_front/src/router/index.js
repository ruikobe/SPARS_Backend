import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Home from '@/components/Home'
import ArticleList from '@/components/ArticleList'
import CateMana from '@/components/CateMana'
import DataCharts from '@/components/DataCharts'
import PostArticle from '@/components/PostArticle'
import UserMana from '@/components/UserMana'
import BlogDetail from '@/components/BlogDetail'

import Signin from '@/components/SignIn'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      hidden: true,
      component: Login
    }, {
      path:'/signin',
      name:'Register',
      hidden:true,
      component:Signin
    },{
      path: '/home',
      name: '',
      component: Home,
      hidden: true
    }, {
      path: '/home',
      component: Home,
      name: 'News Management',
      iconCls: 'fa fa-file-text-o',
      children: [
        {
          path: '/articleList',
          name: 'News List',
          component: ArticleList,
          meta: {
            keepAlive: true
          }
        }, {
          path: '/postArticle',
          name: 'Post News',
          component: PostArticle,
          meta: {
            keepAlive: false
          }
        }, {
          path: '/blogDetail',
          name: 'Article Details',
          component: BlogDetail,
          hidden: true,
          meta: {
            keepAlive: false
          }
        }, {
          path: '/editBlog',
          name: 'Edit',
          component: PostArticle,
          hidden: true,
          meta: {
            keepAlive: false
          }
        }
      ]
    }, {
      path: '/home',
      component: Home,
      name: 'Users',
      children: [
        {
          path: '/user',
          iconCls: 'fa fa-user-o',
          name: 'Users',
          component: UserMana
        }
      ]
    }, {
      path: '/home',
      component: Home,
      name: 'Categories',
      children: [
        {
          path: '/cateMana',
          iconCls: 'fa fa-reorder',
          name: 'Companies & Stocks',
          component: CateMana
        }
      ]
    }, {
      path: '/home',
      component: Home,
      name: 'Prediction Results',
      iconCls: 'fa fa-bar-chart',
      children: [
        {
          path: '/charts',
          iconCls: 'fa fa-bar-chart',
          name: 'Prediction Results',
          component: DataCharts
        }
      ]
    }
  ]
})

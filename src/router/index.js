import Vue from "vue";
import Router from "vue-router";
import AccountList from "@/components/AccountList";
import AccountDetail from "@/components/AccountDetail";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "AccountList",
      component: AccountList
    },
    {
      path: "/:accountId",
      name: "AccountDetail",
      component: AccountDetail
    }
  ]
});

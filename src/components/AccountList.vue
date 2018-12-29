<template>
  <div>
    <div class="slds-page-header slds-page-header_vertical">
      <div class="slds-media slds-has-divider_bottom-space">
        <div class="slds-media__body">
          <h1 class="slds-page-header__title">Account List Component - Test Rogerio</h1>
        </div>
      </div>
      <ul>
        <li v-for="account in accounts" :key="account.id">
          <router-link :to="account.id">{{ account.name }}</router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    accounts() {
      return this.$store.state.accounts;
    }
  },
  created() {
    console.log("Create Testing....");

    if (!this.accounts) {
      this.$store.dispatch("getAllAccounts");
    }
  }
};
</script>
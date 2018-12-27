<template>
  <div>
    <div class="slds-page-header slds-page-header_vertical">
      <div class="slds-media slds-has-divider_bottom-space">
        <div class="slds-media__body">
          <h1 class="slds-page-header__title">{{ account.name }}</h1>
        </div>
      </div>
      <div class="slds-has-divider_bottom-space">
        <dl class="slds-dl_inline">
          <dt class="slds-dl_inline__label slds-text-color_weak">Name:</dt>
          <dd class="slds-dl_inline__detail">{{ account.name }}</dd>
          <dt class="slds-dl_inline__label slds-text-color_weak">Type:</dt>
          <dd class="slds-dl_inline__detail">{{ account.type }}</dd>
          <dt class="slds-dl_inline__label slds-text-color_weak">Phone:</dt>
          <dd class="slds-dl_inline__detail">{{ account.phone }}</dd>
          <dt class="slds-dl_inline__label slds-text-color_weak">Number Of Employees:</dt>
          <dd class="slds-dl_inline__detail">{{ account.numberOfEmployees }}</dd>
        </dl>
      </div>
      <div>
        <router-link tag="button" class="slds-button slds-button_neutral" to="/">Back</router-link>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  computed: {
    account() {
      return this.$store.getters.getAccount(this.$route.params.accountId);
    }
  },
  created() {
    if (!this.$store.state.accounts) this.$store.dispatch("getAllAccounts");
  }
};
</script>
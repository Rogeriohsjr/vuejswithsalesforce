import LCC from "lightning-container";

const _accounts = [
  { id: "1", name: "Account 1" },
  { id: "2", name: "Account 2" },
  { id: "3", name: "Account 3" }
];

export default {
  getAccounts(callback) {
    if (process.env.NODE_ENV === "production") {
      console.log('Calling Controller VueController.getAccounts');
      LCC.callApex(
        "VueController.getAccounts",
        (result, event) => {
          if (event.status) {
            callback(
              result.map(account => {
                return {
                  id: account.Id,
                  name: account.Name,
                  type: account.Type,
                  numberOfEmployees: account.NumberOfEmployees
                };
              })
            );
          } else if (event.type === "exception") {
            console.log(event.message + " : " + event.where);
          } else {
            console.log("Unknown Error", event);
          }
        },
        { escape: false }
      );
    } else {
      setTimeout(() => callback(_accounts), 100);
    }
  }
};

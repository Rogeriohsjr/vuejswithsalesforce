# vuejs-with-salesforce

> A Vue.js project for Salesforce

This vue.js project works for Visualforce Page(Salesforce Classic) and Salesforce Lightning Experience.

The component for Lightning Experience is located in salesforce/source/aura/VueLightningComponent
> This component has the Vue application

The Visualforce page example that we have which loads the Vue.js project is located in salesforce/source/pages/VueVisualForcePage.page

## Source:
How to create the vue project and call a apex class
> https://medium.com/@ennoucas/creating-a-salesforce-application-with-vue-js-and-webpack-part-1-17c726484f1f
> https://medium.com/@ennoucas/salesforce-lightning-application-with-vue-js-and-webpack-part-2-af0071347274

How to add vue.js project into a lightning component.
> https://developer.salesforce.com/docs/component-library/bundle/lightning:container/documentation

How to make the Lightning Component with Vue.js Project available in Visualforce page.
> https://developer.salesforce.com/docs/atlas.en-us.lightning.meta/lightning/components_visualforce.htm

Basically I am wrapping the Vuejs from Lightning Component inside of a Aura Component, then creating the Aura Component inside of a VisualForce Page.


# How to deploy this repository?

Requirement:
- SFDX
- VSCode with Terminal set to be Bash

1. I am assuming you are testing that in a Developer Org.

You can create one here: https://developer.salesforce.com/signup

2. Download this code.

3. I am using VSCode, so Open the project with VSCode, then go to terminal and type the commands below.

3.1. npm install

3.2. npm run dev


4. Then I access my localhost as the terminal suggested, and I can see the vue application has loaded.

4.1. As you can see it loads the Account and if you click on the link, it will redirect you to the detail.

4.2. After you check that things are working in localhost, you can run the npm deploy in Terminal.


5. Deploying to Salesforce

5.1. Go to VSCode in the Terminal and access the folder called salesforce

5.1. cd salesforce

5.2. Run the command below to connect to your org, it will open the browser for you to type a password and your org name will have an alias below.

sfdx force:auth:web:login --setalias MyOrgDev3 --instanceurl https://login.salesforce.com --setdefaultusername

5.3. Run the command below to deploy the code to your org using the alias that you gave above.

sh deploy.sh -u MyOrgDev3

6. Checking on Salesforce Classic - Non Lightning Expierence.

6.1. Go to your system admin profile, assuming that this is your profile.

6.2. Give access to the vuetab to your profile.

Setup >> Users >> Select your user profile >> My case was System Administrator >> Click on Edit Button >> Search for VueTab and change the dropdown to Default On >> Save it.

6.3. Click on + tab, to see all the tabs, search for VueTab

You should see the app loading, if you didn't open the browser console and check if there is any error in the console if there is, then check the Step below called Enabling Custom Domain.


7. Checking on Salesforce with Lightning Experience.

7.1. Make sure you are on Lightning Experience.

7.2. If you are on Sales >> Home, click on the Engine and Click Edit this Page

7.3. In the Component Search, you will see the VueLightningComponent in Custom Section.

7.3.1. If you don't see that, you might need to deploy your Custom Domain, below there is a step on how to enable Custom Domain.

7.4. When you drag and drop the component it should load your org data.

7.5 For you to see that in Salesforce outside of Edit Mode, then you will need to follow sf standard process to deploy a Home page.

7.5.1. Click on Save, Activate that, choo a App Default or org Defaul save and you will see the app loading.


## Enabling Custom Domain

If we get this error below:

Refused to display 'https://login.salesforce.com/?ec=302&startURL=%2Fvisualforce%2Fsession%3FsfdcIFrameOrigin%3Dhttps%253A%252F%252Fc.na172.visual.force.com%26url%3Dhttps%253A%252F%252Fc.container.lightning.com%252Flcc%252F1588119991000%252FvueApplication%252Findex.html%253FsfdcIFrameOrigin%253Dhttps%25253A%25252F%25252Fc.na172.visual.force.com%2526_CONFIRMATIONTOKEN%253DVmpFPSxNakF5TUMwd05TMHdNbFF3TURvek1Ub3dNaTR6TXpsYSxrZHBCYV9scnh6ZDZ3aERSQzk3dldILE9URmlOR1Ex' in a frame because it set 'X-Frame-Options' to 'deny'.


It means that we would need to enable some things, this usually happens because your org is new and you don't have custom domain.


Setup >> My Domain >> give your domain a name >> clickCheck Availability >> Register Domain >> Wait 10 Min >> Reload the Page >> Click to Log in with your Domain >> sometimes you need to wait more for the dns to propagate >> login in your org >> go to my domain again, and click to deploy to Users.

After the steps above, you should be good to access the page, this applies for Lightning Expirience and Salesforce Classic, because we are using Aura component to load the Vue Project, and aura needs custom domain.



## Disabling Content Security Policy Protection

If you are seeing this error in the console:

Refused to execute inline script because it violates the following Content Security Policy directive: "script-src 'self' chrome-extension: 'unsafe-eval' *.canary.lwc.dev *.visualforce.com https://ssl.gstatic.com/accessibility/ 'nonce-5d0083587d946675db08e85b9a0a85be418f4cfa9f24836aff0e1cfdaa50ec58'". Either the 'unsafe-inline' keyword, a hash ('sha256-CPrKGP6+1rDy4Zf0gWWPjMqAzvAOFS3hd9Ydbbdsa/Y='), or a nonce ('nonce-...') is required to enable inline execution.

You can fix this by disabling the CSP in Setup >> Session Settings >> Search for Enable Stricter Content Security Policy >> Uncheck This and Save



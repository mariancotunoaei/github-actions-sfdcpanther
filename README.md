[![Validate Against Production Org](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-master.yml/badge.svg)](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-master.yml)

[![Validate Against QA Org](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-qa.yml/badge.svg)](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-qa.yml)

[![Validate Against UAT Sandbox Org](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-uat.yml/badge.svg)](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-uat.yml)

[![Validate Against SIT Sandbox Org](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-sit.yml/badge.svg)](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-sit.yml)

[![Validate Against Integration Sandbox Org](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-integration.yml/badge.svg)](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-integration.yml)

[![Validate Against HotFix Sandbox Org](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-hotfix.yml/badge.svg)](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-hotfix.yml)

[![Validate Against Developer Sandbox Org](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-developer.yml/badge.svg)](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/salesforce-dx-developer.yml)

[![Scratch ORG Flow](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/scratch-org-flow.yml/badge.svg)](https://github.com/amitastreait/github-actions-sfdcpanther/actions/workflows/scratch-org-flow.yml)


# GitHub Actions with Salesforce DX to implement CI/CD

This readme file contains all the steps for implementing the GitHub actions with Salesforce DX

## Create Workflow Action

- You can create the GitHub Action from the `"Action"` or you can create a `.yml` file under `.github/workflows/your-action.yml`

Check the screenshot for the same

![Workflow Actions](https://github.com/amitastreait/github-actions-sfdcpanther/blob/master/.github/images/action.PNG)

OR

![Workflow Actions](https://github.com/amitastreait/github-actions-sfdcpanther/blob/master/.github/images/workflow.PNG)

## Install Node.js Environment

To Install Salesforce CLI for out GitHub Repo we need to setup node.js . Use below code for the same

```
- name: 'Setup Node.js environment'
        uses: actions/setup-node@v2.1.5
        with:
            # Set always-auth in npmrc
             always-auth: true
            # Version Spec of the version to use.  Examples: 12.x, 10.15.1, >=10.15.0
             node-version: 12
            # Target architecture for Node to use. Examples: x86, x64. Will use system architecture by default.
             architecture: x64
            # Set this option if you want the action to check for the latest available version that satisfies the version spec
             check-latest: true
            # Used to pull node distributions from node-versions.  Since there's a default, this is typically not supplied by the user.
             token: ${{ github.token }}

```

## Install Salesforce CLI

Once you have installed the NODE.js, now you need to install the SFDX as to execute Salesforce DX command you must need to install the Salesforce DX.

Use below code to intall the CLI.

```
# Install Salesforce CLI
      - name: 'Install Salesforce CLI'
        run: |
            wget https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz
            mkdir sfdx-cli
            tar xJf sfdx-linux-amd64.tar.xz -C sfdx-cli --strip-components 1
            ./sfdx-cli/install

```

## Authenticate Salesforce ORG

Now, it's time to authenticate salesforce org using sfdx command and JWT authentication. To learn more about the authentication part visit below link

-  [JWT Autentication SFDX](https://github.com/amitastreait/sfdcpanther-adventure/blob/master/README.md)

Use below command for the same

```
# Connect with Salesforce ORG
      - name: 'Connect with Salesforce ORG'
        working-directory: .github/jwt/
        run: sfdx auth:jwt:grant --clientid ${{ secrets.SALESFORCE_CONSUMER_KEY }} --jwtkeyfile server.key --username ${{ secrets.SALESFORCE_USERNAME }} -d --instanceurl ${{ secrets.SFDC_PROD_URL }} --setalias ${{ secrets.PROD_ALIAS }}
  

```

## Checkout the Source Code

before you start running any Salesforce DX Commands checkout the source code to latest commit

```
 # Checkout the source code
      - name: 'Checkout source code'
        uses: actions/checkout@v2

```

## Send Success/Error Emails

At the End Send the Emails when Success or Error

```
- name: Send mail
        
        if: failure()
        uses: dawidd6/action-send-mail@v2
        with:
            # mail server settings
            server_address: smtp.gmail.com
            server_port: 465
            # user credentials
            username: ${{ secrets.EMAIL_USERNAME }}
            password: ${{ secrets.EMAIL_PASSWORD }}
            # email subject
            subject: ${{ github.job }} job of ${{ github.repository }} has ${{ job.status }}
            # email body as text
            body: ${{ github.job }} job in worflow ${{ github.workflow }} of ${{ github.repository }} has ${{ job.status }}
            # comma-separated string, send email to
            to: sfdcpanther@gmail.com,amit.a.panther@gmail.com
            # from email name
            from: AMIT SINGH
            # Optional unsigned/invalid certificates allowance:
            ignore_cert: true
            # Optional content type (defaults to text/plain):
            content_type: text/html
            # Optional converting Markdown to HTML (set content_type to text/html too):
            convert_markdown: true

```

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
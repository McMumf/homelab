# HashiCorp's Vault

[Vault](https://developer.hashicorp.com/vault/docs/what-is-vault)

## Post-Installation

### Unseal

Vault will _always_ start in a sealed state. Evertime Vault is started, you will need to unseal it.

Unsealing is an _intentional_ manual step.

Unseal via the UI. Make sure to securely save the information afterwards.

### Create an ACL Policy

Create a read only access user via the Policy tab.

1. Click "Create ACL Policy +"
2. Provide a name i.e., kv-read-only
3. Paste contents of kv-read-only.hcl

### Create an Access Group

1. Navigate to Access
2. Click on Groups under "Organization"
3. Click "Create goup +"
4. Enter the name `kubernetes` and search for the Policy created in the previous section

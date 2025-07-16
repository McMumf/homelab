# Authentik

[Authentik](https://docs.goauthentik.io/docs/) is an identity provider.

## Deployment

### First Time Setup

1. Ensure [vault](../vault/README.md) is setup and configured with a proper `kv`
2. In your vault kv, create a new secret called `authentik`
3. Create kv pairs for the following:
   1. `postgresql_password`
   2. `secret_key`
   3. `email_access_key`
   4. `email_secret_key`
4. Create the External Secret: `kubectl apply -f external-secrets.yaml -n authentik`
5. deploy using helmfile: `helmfile apply`
6. Wait for services to spin up
7. Connect to `https://<ingress-host-name>/if/flow/initial-setup/` to setup the default `akadmin` user
   1. Note: the ending `/` is important
   2. Suggested using a password manager with an email alias with a long, and random, password with special characters, numbers, and upper/lower case letters
8. Continue to setup

### Updating

When updating to a new version, we need to make sure to pass in the postgres auth password:

`helmfile apply --set global.postgresql.auth.password=$(kubectl get secret --namespace "authentik" authentik-secrets -o jsonpath="{.data.password}" | base64 -d)`

## Configuration

### Branding

### Email

1. **Create Password Policy**
    - Name: `password-complexity`
    - Minimum Length: `12`
    - Error Message: `Please enter a minimum of 12 characters with at least 2 uppercase, 2 lowercase, 2 digits, and 2 symbols`
2. **Create Stages**
   1. Identification Stage
        - Name: `recovery-authentication-identification`
        - User Fields: `Username`, `Email`
   2. Email Stage
        - Name: `recovery-email`
        - Subject: `Password Recovery`
        - Template: `Password Reset`
3. **Create Recovery Flow**
    - Name: `Recovery`
    - Title: `Recovery`
    - Slug: `recovery`
    - Designation: `Recovery`
4. **Bind Stages to `Recovery` Flow**
   1. `recovery-authentication-identification`
   2. `recovery-email`
      - Order: `10`
   3. `default-password-change-prompt`
      - Order: `20`
   4. `default-password-change-write`
      - Order: `30`
5. **Add the `password-complexity` policy to `default-password-change-prompt` Validation Policies**
6. **Update the `default-identification-flow` Flow**
   1. Edit `default-authentication-identification` Stage
      1. Set `Password Stage` to `default-authentication-password`
      2. Under "Flow Settings", set `Recvovery Flow` to `recovery`
   2. Delete `default-authentication-password` from stage bindings
7. **Logout and test**

### Invitation Setup

1. **Create a New Group**
    - Name: `Homelab Users`
2. **Create a New Email Stage**
   - Name: `email-account-confirmation`
   - Subject: `Account Confirmation`
   - Template: `Account Confirmation`
3. **Create User Write Stage**
    - Name: `enrollment-invitation-write`
    - Uncheck `Create users as inactive`
    - Group: `Homelab Users`
4. **Create Invitation Stage**
    - Name: `enrollment-invitation`
5. **Create a new Flow**
    - Name: `Enrollment Invitation`
    - Title: `Enrollment Invitation`
    - Slug: `enrollment-invitation`
    - Designation: `Enrollment`
    - Enable compatibility mode under behavior settings
6. **Bind Stages to Enrollment Invitation Flow**
   1. Bind `enrollment-invitation`
        - Order: `10`
   2. Bind `default-source-enrollment-prompt`
        - Order: `20`
   3. Edit `default-source-enrollment-prompt`
        - Ensure the fields for `username`, `name`, `email`, `password`, `password_repeat` are all selected
        - Add `password-complexity` as a validation policy
   4. Bind `enrollment-invitation-write`
        - Order: `30`
   5. Bind `default-source-enrollment-login`
        - Order: `40`
7. **Create Single Use Invitation**
    - Name: `enrollment-invitation-link`
    - Set expiration to how you see fit
    - Flow: `enrollment-invitation`
8. **Send Out Invitation**
    - Expand `enrollment-invitation-link` to retrieve link

### LDAP

1. **Create a new `ldapservice` user**
    - Username: `ldapservice`
    - User Type: `Service Account`
    - Set password for `ldapservice` user
2. **Create `ldapsearch` group**
    - Name: `ldapsearch`
3. **Add `ldapservice` user to the newly created group**
4. **Create Stages**
    1. Create a new Indentification Stage
       - name: `ldap-identification-stage`
       - User fields: `Username`, `Email`
    2. Create a new Password Stage
       - name: `ldap-authentication-password`
    3. Create a new User Login Stage
       - name: `ldap-authentication-login`
5. **Create Flow**
    - Name: `ldap-authentication-flow`
    - Title: `ldap-authentication-flow`
    - Designation: `Authentication`
    - Enable `Compatibility Mode` under behavior settings
6. **Bind Existing Stages to `ldap-authentication-flow`**
    1. `ldap-identification-stage`
        - Order: `10`
    2. `ldap-authentication-login`
        - Order: `30`
7. **Edit `ldap-identification-stage` password to be `ldap-authentication-password`**
8. **Create LDAP Provider**
    - Name: `LDAP`
    - Bind Flow: `ldap-authentication-flow`
    <!-- 3. Search Group: `ldapsearch` -->
9. **Create Application**
    - Name: `LDAP`
    - Slug: `ldap`
    - Provider: `LDAP`
10. **Create Outpost**
    - Name: `LDAP`
    - Type: `LDAP`
    - Add LDAP Application to "Selected Application"
    - Under "Advanced Settings", set `kubernetes_service_type` to `LoadBalancer`
    - Replace `kubernetes_json_patches: null` with the following
        ```yaml
        kubernetes_json_patches:
          service:
            - op: add
            path: /spec/loadBalancerIP
            value: 192.168.69.10
        ```
11. **Assign the Search Permissions**
12. **Test LDAP**

    ```sh
    ldapsearch -x \
        -H ldap://<hostIPaddress> \
        -D "cn=ldapservice,ou=users,DC=ldap,DC=goauthentik,DC=io" \
        -b "DC=ldap,DC=goauthentik,DC=io" \
        '(objectClass=user)' \
        -W
    ```

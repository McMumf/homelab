# Jellyfin

## Configuring

### Networking

1. Configure Server Address Settings
   1. Select `Enable HTTPS`
   2. Enter known proxies: `jellyfin.mcmumf.dev`
2. Configure HTTPS Settings
   1. Check "Require HTTPS"
   2. Search for SSL Cert path
   3. Enter password if necessary

### LDAP

#### Prerequisites

- LDAP Provider
  - In this case, authentik
- Jellyfin's LDAP Plugin Enabled

#### Setup

1. Enter the IP/URL of the LDAP Server
2. Use Secure LDAP or else
3. Enter the Bind User: `cn=ldapservice,ou=ldapservice,dc=ldap,dc=goauthentik,dc=io`
4. Enter the Bind User's password
5. Enter LDAP Base DN: `dc=ldap,dc=goauthentik,dc=io`
6. Click "Start and Test LDAP Server Settings"
7. Enter the LDAP Search Filter: `(memberOf=cn=Jellyfin,ou=groups,dc=ldap,dc=goauthentik,dc=io)`
8. Make sure the following aatribute configs match:
   1. LDAP Search: `uid, cn, mail, displayName`
   2. LDAP Uid: `uid`
   3. LDAP Username: `cn`
   4. LDAP Password: `userPassword`
9. Optional: Enable profile image synchronization
10. Configure Administrators
    1. LDAP Admin Base: `(cn=JellyfinAdmin,dc=goauthentik,dc=io)`
    2. LDAP Admin Filter: `(memberOf=cn=JellyfinAdmin,ou=groups,dc=ldap,dc=goauthentik,dc=io)`
11. Check "Enable User Creation"
12. Configure library access if desired

# OpenEBS

## Helpful Commands

### Deleting Zombie Volumes

```shell
$ kubectl mayastor -n openebs get volumes | awk '$3 ~ /<none>/ { print $1}' | xargs -I {} kubectl mayastor -n openebs delete volume -y {}
The volume is still being referenced by PV pvc-38e5cdb8-476f-4239-9a64-943686a6a7e8
The volume is still being referenced by PV pvc-48ff7a59-4187-42a9-9c76-93287f36dd74
The volume is still being referenced by PV pvc-cc7111b5-41dc-4907-b44f-20a292a8230c
```

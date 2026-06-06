# Democratic CSI

Followed Daniels Techblog for setup: [TrueNAS backed PVCs on Talos Kubernetes using Democratic CSI](https://wazaari.dev/blog/truenas-talos-democratic-csi)

## Configs

### iSCSI

```yaml
driver: freenas-api-iscsi
httpConnection:
    allowInsecure: <true or false>
    apiKey: <TrueNAS API Key>
    host: <Host IP or URL>
    port: <80 or 443 depending on protocol>
    protocol: <http or https>
instance_id: null
iscsi:
    targetPortal: ""
    targetPortals: []
    interface:
    namePrefix: csi-
    nameSuffix: "-cluster"
    targetGroups:
        - targetGroupPortalGroup: 1
          targetGroupInitiatorGroup: 1
          targetGroupAuthType: None
          targetGroupAuthGroup:
    extentCommentTemplate: "{{ parameters.[csi.storage.k8s.io/pvc/namespace] }}/{{ parameters.[csi.storage.k8s.io/pvc/name] }}"
    extentInsecureTpc: true
    extentXenCompat: false
    extentRpm: "SSD"
    extentBlocksize: 512
    extentAvailThreshold: 0
zfs:
    datasetParentName: k8s-storage/iscsi/kubernetes/volumes
    detachedSnapshotsDatasetParentName: k8s-storage/iscsi/kubernetes/snapshots
    zvolCompression:
    zvolDedup:
    zvolEnableReservation: false
    zvolBlocksize:
    datasetProperties:
        "org.freenas:description": "{{ parameters.[csi.storage.k8s.io/pvc/namespace] }}/{{ parameters.[csi.storage.k8s.io/pvc/name] }}"
```

### NFS

```yaml
driver: freenas-api-iscsi
httpConnection:
    allowInsecure: <true or false>
    apiKey: <TrueNAS API Key>
    host: <Host IP or URL>
    port: <80 or 443 depending on protocol>
    protocol: <http or https>
instance_id: null
nfs:
    shareCommentTemplate: "{{ parameters.[csi.storage.k8s.io/pvc/namespace] }}-{{ parameters.[csi.storage.k8s.io/pvc/name] }}"
    shareAlldirs: false
    shareAllowedNetworks:
        - <CIDR range of allowed networks, most likely the VLAN you're running on>
    shareHost: <Host IP or URL>
    shareMapallGroup: nfs
    shareMapallUser: nfs
zfs:
    datasetEnableQuotas: true
    datasetEnableReservation: false
    datasetParentName: k8s-storage/nfs/kubernetes/volumes
    datasetPermissionsGroup: 3002
    datasetPermissionsMode: "0777"
    datasetPermissionsUser: 3002
    detachedSnapshotsDatasetParentName: k8s-storage/nfs/kubernetes/snapshots
    datasetProperties:
    "org.freenas:description": "{{ parameters.[csi.storage.k8s.io/pvc/namespace] }}/{{ parameters.[csi.storage.k8s.io/pvc/name] }}"
```

# ubuntu-openstack-builder
UbuntuでOpenStackパッケージを自前ビルドするやつ

## neutronパッケージをビルドする場合の注意

neutronパッケージのテストにIPv6関連が含まれているため、DockerエンジンでIPv6を有効にしないとテストが通らない。
DockerでIPv6を使うには以下を参考。

[IPv6 with Docker](https://docs.docker.com/engine/userguide/networking/default_network/ipv6/)

### Ubuntu 16.06

```
$ sudo systemctl edit --full docker
-- -- snip -- --
[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd -H fd:// --ipv6 --fixed-cidr-v6="2001:db8:1::/64"  ★ --ipv6以降を追加
ExecReload=/bin/kill -s HUP $MAINPID
-- -- snip -- --
$ sudo systemctl restart docker
```

### Docker for Mac

Preference => Daemon => Advanced を編集し、 `ipv6` と `fixed-cidr-v6` を設定します。

```json
{
  "debug" : true,
  "experimental" : true,
  "ipv6": true,
  "fixed-cidr-v6" : "2001:db8:1::/64"
}
```

## build

```
$ make neutron
```
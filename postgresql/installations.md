# Installations

## [Postgresql 10 on Amazon Linux](https://forums.aws.amazon.com/message.jspa?messageID=840223)

```bash
yum install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm

sed -i "s/rhel-\$releasever-\$basearch/rhel-7.5-x86_64/g" "/etc/yum.repos.d/pgdg-10-centos.repo"

yum install postgresql10
```


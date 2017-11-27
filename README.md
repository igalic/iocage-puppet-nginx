# ioc: Provisning NGINX using Puppet

This is a standard [puppet control-repo](https://github.com/puppetlabs/control-repo).
We use it to gather all the modules needed to install and configure NGINX.

Finally, since this is our first demo, we setup and serve a "Hello, World!" application.

-----

The prerequisite for this provisioning module is that your jail has `puppet5` preinstalled.

-----

To execute this provisoner, clone this repository into `/usr/local/etc/puppet/environments/production`, and run `puppet apply`:

```sh
git clone git@github.com:igalic/iocage-puppet-nginx.git
puppet apply /usr/local/etc/puppet/environments/production/manifests/site.pp
```

------

A complete bootstrap can be accomplished like so:

```
ioc create hallo-welt ip4_addr='172.16.0.6/12'
ioc start hallo-welt
ioc exec hallo-welt env ASSUME_ALWAYS_YES=YES pkg bootstrap
ioc exec hallo-welt pkg install -y puppet5 git-lite rubygem-r10k
ioc exec hallo-welt mkdir -p /etc/puppetlabs/r10k/
cat r10k.yaml | ioc exec hallo-welt tee -a /etc/puppetlabs/r10k/r10k.yaml
ioc exec hallo-welt exec r10k deploy environment -pv
ioc exec hallo-welt exec puppet apply /usr/local/etc/puppet/environments/production/manifests/site.pp
```

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

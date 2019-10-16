# OLM - Operator Lifecycle Manager

Is composed of two operators.

## 1- OLM

It manages the Kubernetes resource  _ClusterServiceVersion._

A  _ClusterServiceVersion \(CSV\)_ represents an Operator. 

* The OLM Operator gates the deployment of an Operator until all of its requirements are present
* It also orchestrates the finer details of upgrading a running Operator to a newer version ensuring safety for all of the objects that the previous Operator was managing

##  2- Catalog

 Users can create _Subscriptions_ to Operators which enforce upgrade policies such as “keep this namespace up to date with alpha etcd Operator”. Subscriptions are realized by the usage of _InstallPlans_. _InstallPlans_ aren’t meant solely for usage by _Subscriptions_, users can also manually create them. _InstallPlans_ resolve dependencies and find all the resources that’d have to be applied to the cluster in order to satisfy the installation of a new Operator




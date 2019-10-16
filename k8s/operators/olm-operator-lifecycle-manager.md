# OLM - Operator Lifecycle Manager

It manages the Kubernetes resource  _ClusterServiceVersion._

A  _ClusterServiceVersion \(CSV\)_ represents an Operator. 

* The OLM Operator gates the deployment of an Operator until all of its requirements are present
* It also orchestrates the finer details of upgrading a running Operator to a newer version ensuring safety for all of the objects that the previous Operator was managing




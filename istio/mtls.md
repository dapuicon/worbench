# mTLS

## Certificates expiration

Istio self-signed certificates have historically had a 1 year default lifetime. If you are using Istio self-signed certificates, you need to schedule regular root transitions before they expire. An expiration of a root certificate may lead to an unexpected cluster-wide outage.

## Enable mTLS

{% embed url="https://archive.istio.io/v1.1/docs/tasks/security/authn-policy/\#globally-enabling-istio-mutual-tls" %}

## Extending Self-Signed Certificate Lifetime <a id="title"></a>

{% embed url="https://archive.istio.io/v1.1/help/ops/security/root-transition/" %}




---

# about me

cloud engineer @ developmentseed

---

# about devseed

devseed is a consultancy focused on open data 

fans of the STAC

part of eoAPI

we see a lot stac APIs

---

# what is stac

...TODO

---

# why stac

OGC supported standard, flexible by virtue of extensions, provides 

---

# state of auth within stac

many strategies

- 🍪
- jwts
- basic auth
- api tokens

---

# most (all?) auth needs fall within three camps

1. route-level auth
2. record-level auth
3. asset-level access

---

# enter: stac-auth-proxy

during this talk, we'll review these three auth scenarios and how we developed `stac-auth-proxy` to address these needs

---

# backstory

conceived at a casual "birds of a feather" during SatSummit Lisbon (2024)

---

# why a proxy?

many stac backends

- stac-fastapi-pgstac [python + postgis]
- stac-fastapi-elasticsearch [python + elasticsearch]
- franklin [...TODO]
- staccato [...TODO]
- stac-server [...TODO]

any viable solution shouldn't require adopters to change their language/datastore

---

# strategy

take advantage of the existing ecosystem of well supported standards both within STAC and external

# how does it work?

the auth proxy works primarily as _middleware_ that validates & augments incoming requests and outgoing responses

we have settled on integrating with OIDC-based auth servers, which grants us support for Keycloak, Auth0, AWS Cognito, etc...

---

# caveat: not necessarily a proxy

the `stac-auth-proxy` is written as a collection ASGI middleware in Python w/ FastAPI. it is available on `PyPI` to be used as a library and should be compatible with any ASGI-based Python API.

```py
configure_app(...)
```

Admittedly, we've only tested this with FastAPI applications

---

# configuration

when running as either a proxy application or as middleware, we lean on environment variables to configure. as middleware, these values can alternatively be provided by keyword arguments

we aim for _sensible-defaults_

https://developmentseed.org/stac-auth-proxy/user-guide/configuration

---

# how do we use it?

base-level of configuration

```dotenv {all|1|2|2-3|all}
UPSTREAM_URL=http://stac:8001
OIDC_DISCOVERY_URL=http://localhost:8888/.well-known/openid-configuration
OIDC_DISCOVERY_INTERNAL_URL=http://oidc:8888/.well-known/openid-configuration
```

---

# route-level auth

```dotenv {4}
UPSTREAM_URL=http://stac:8001
OIDC_DISCOVERY_URL=http://localhost:8888/.well-known/openid-configuration
OIDC_DISCOVERY_INTERNAL_URL=http://oidc:8888/.well-known/openid-configuration
DEFAULT_PUBLIC=false
```

TODO: Explain what the defaults for public endpoints are and why we recommend that some endpoints to be always public

TODO: Demonstrate customizing private endpoints 

# integration w/ [authentication extension](https://github.com/stac-extensions/authentication)

a core principal of the STAC specification is its ability to describe itself.

````md magic-move

```json [foo.js]
{
  ...
  "conformsTo": [
    ...
  ],
  "stac_extensions": [
    ...
  ],
  "links": [
    ...
  ]
}
```
```json [foo.js]
{
  ...
  "stac_extensions": [
    ...
    "https://stac-extensions.github.io/authentication/v1.1.0/schema.json"
  ],
}
```

```json
{
  ...
  "links": [
    ...
    {
      "rel": "data",
      "type": "application/json",
      "title": "Collections available for this Catalog",
      "href": "http://localhost:8000/collections"
    },
  ]
}
```

```json
{
  ...
  "links": [
    ...
    {
      "rel": "data",
      "type": "application/json",
      "title": "Collections available for this Catalog",
      "href": "http://localhost:8000/collections",
      "auth:refs": [
        "oidc"
      ]
    },
  ]
}
```
````
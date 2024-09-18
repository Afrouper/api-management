# API Management
Some simple tests of popular API Management solutions as docker-compose runtimes

## Kong Opensource
* Postgres as database
* Control-Plane for central access
* Data-Plan as gateway instances
  * Connect via mTLS with Control-Plane
* 3 simple echo services as "backend"
* Prometheus & Grafana
* consul
  * not fully configured yet
* keycloak for Token examples

### Run
* Change to folder `kong`
* execute `createClusterCert.sh` to create certifcates
* execute `podman compose up -d` to start environment
* execute `./importConfigs.sh` to import an initial configuration
* Call Services
    * [Simple echo](http://localhost:8000/echo)
    * [RoundRobin Test](http://localhost:8000/all)
* Change or inspect configuration
  * [Kong Admin API](http://localhost:8001)
  * [Kong Manager UI](http://localhost:8002)

## Apache APIsix
* etcd as persistence
* Control-Plane
* Data-Plane
* Admin UI
* consul
  * not fully configured yet
* 3 simple echo services as "backend"

### Run
* Change to folder `apisix`
* Switch to folder `certs` and execute `createCustomCertificates.sh`
* execute `podman compose up -d` to start environment
* Create/Change Configuration
  * Create services and routes with admin api calls in `admin_api.rest`
  * Access [AdminUI](http://localhost:9000)
* Call Services
  * [Simple echo](http://localhost:9080/echo)
  * [RoundRobin Test](http://localhost:9080/all)

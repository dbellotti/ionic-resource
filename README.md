# ionic-resource

An output only concourse.ci resource (at the moment) that will deploy an application to an
Ionic Cloud channel.

## Source Configuration

* `env`: *Required.* The deploy channel to upload the application to.
* `api_token`: *Required.* The organization api token to ask for the latest version deployed.
* `email`: *Required.* The username used to authenticate.
* `password`: *Required.* The password used to authenticate.

## Behaviour

### `out`: Upload/Deploy an application to Ionic Cloud

Uploads an application to the Ionic Cloud deploy channel detailed in the source configuration.

## Pipeline example

```yaml
---
jobs:
- name: job-deploy-app
  plan:
  - get: resource-ionic-app
		trigger: true
  - task: build
    file: resource-ionic-app/build.yml
  - put: resource-deploy-ionic-app

resources:
- name: resource-ionic-app
  type: git
  source:
    uri: https://github.com/orgName/ionicAppRepo.git
- name: resource-deploy-ionic-app
  type: ionic
  source:
    env: staging
    api_token: {{ionic-cloud-api-token}}
    email: {{ionic-cloud-email}}
    password: {{ionic-cloud-password}}

resource_types:
- name: ionic
  type: docker-image
  source:
    repository: dbellotti/ionic-cloud-resource
    tag: latest
```

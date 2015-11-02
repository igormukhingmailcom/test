# Test app

## Run app on AWS EB

Application configured for **automatic deployment** to `staging` environment at AWS EB thanks to [Shippable](https://shippable.com).

Shippable run tests and deploy to EB `staging` environment only if `phpunit` tests passed.

Once QA guys confirm that all OK on `staging` server, you can deploy it to `production` EB environment.

### Deploying to production

#### Manually

Go to `AWS > EB > Application > Application Versions` and manually deploy tested verion to EB `production` environment.

#### Via EB cli

1. Install AWS CLI on Mac OSX:

```
sudo easy_install pip
pip --version # Check pip version
sudo pip install awscli
aws --version # Check aws cli version
```

2. Configure AWS CLI:

Type `aws configure` and put your AWS credentials and default region.

Currently we're using `us-west-2` region.

3. Run next command to deploy given <VERSION> to EB `production` environment:

```
aws elasticbeanstalk update-environment --environment-name production --version-label <VERSION>
```

For  example:

```
aws elasticbeanstalk update-environment --environment-name production --version-label shippable.igormukhin.test.master.23
```

## Run app on Docker at Mac OSX

### Prerequisites

Lets assume that:

- We named our virtual machine as `default` (`docker-machine create --driver=virtualbox default`).
- We added next line `eval "$(docker-machine env default)"` to `~/.bashrc`, so docker can work properly on every terminal window (run `source ~/.bashrc` on current window to apply changes).

### Running on localhost

```
docker-compose up
ssh -L 8080:localhost:8080 -i ~/.docker/machine/machines/default/id_rsa docker@$(docker-machine ip default)
open http://localhost:8080
```

or

```
docker-compose up
open http://$(docker-machine ip default 2>/dev/null):8080
```

## To read

- http://docs.shippable.com/autodeploy-to-ebs/

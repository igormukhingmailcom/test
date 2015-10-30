# Test app

## Run on Mac OSX

### Prerequisites

Lets assume that:

- We named our virtual machine as `default` (`docker-machine create --driver=virtualbox default`).
- We added next line `eval "$(docker-machine env default)"` to `~/.bashrc`, so docker can work properly on every terminal window (run `source ~/.bashrc` on current window to apply changes).

### Running on localhost

```
docker-compose up
ssh -L 8080:localhost:8080 -i ~/.docker/machine/machines/default/id_rsa docker@$(docker-machine ip default)
```

or

```
docker-compose up
open http://$(docker-machine ip default 2>/dev/null):8080
```

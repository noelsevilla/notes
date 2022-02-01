Sometimes you might want to try out some things in Jenkins. However you may not have the appropriate permission levels to do so on a deployed Jenkins instance or that you don't want to potentially break it.

You can however start up a local running instance of Jenkins.

This requires you to have docker running in your local. The [jenkins-on-local](./jenkins-on-local) directory should have all the docker files and scripts you need to have jenkins running in docker in your local environment.

If you need further information about docker, you can watch these clips or read the docker about page [here](https://docs.docker.com/get-started/).

 - [Docker in 100 Seconds](https://www.youtube.com/watch?v=Gjnup-PuquQ&ab_channel=Fireship)

 - [Learn Docker in 7 Easy Steps](https://www.youtube.com/watch?v=gAkwW2tuIqE&ab_channel=Fireship)

 - [Docker Tutorials](https://www.youtube.com/watch?v=gFjxB0Jn8Wo&list=PL6gx4Cwl9DGBkvpSIgwchk0glHLz7CQ-7&ab_channel=thenewboston)

  - Or

 - [Docker Full Course](https://www.youtube.com/watch?v=3c-iBn73dDE&ab_channel=TechWorldwithNana)

**Download docker desktop from [here](https://www.docker.com/get-started).**

If you already have docker installed or have finished installing docker desktop, you can build the jenkins image by running 

`build.sh` from [jenkins-on-local](./jenkins-on-local), and then `run.sh`.

This will make jenkins available on [http://localhost:8080](http://localhost:8080).

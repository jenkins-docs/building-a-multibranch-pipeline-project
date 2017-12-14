# building-a-multibranch-pipeline-project

This repository is for the
[Build a multibranch Pipeline project](https://jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/)
tutorial in the [Jenkins User Documentation](https://jenkins.io/doc/).

The repository contains a simple Node.js and React application which generates
a web page with the content "Welcome to React" and is accompanied by a test to
check that the application renders satisfactorily.

The `jenkins` directory contains an example of the `Jenkinsfile` (i.e. Pipeline)
you'll be creating yourself during the tutorial and the `scripts` subdirectory
contains shell scripts with commands that are executed when Jenkins processes
either the "Deliver for development" or "Deploy for production" stages of your
Pipeline (depending on the branch that Jenkins builds from).

pipeline {
  agent {
    docker {
      args '-p 3000:3000 -p 5000:5000'
      image 'node:8.15.1-alpine'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }
    stage('Test') {
      steps {
        sh './jenkins/scripts/test.sh'
      }
    }
    stage('Deliver for development') {
      steps {
        sh './jenkins/scripts/deliver-for-development.sh'
        sh './jenkins/scripts/kill.sh'
      }
    }
  }
  environment {
    HOME = '.'
    CI = 'true'
  }
}
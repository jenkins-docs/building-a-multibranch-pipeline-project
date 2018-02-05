pipeline {
  agent any
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
      parallel {
        stage('Deliver for development') {
          when {
            branch 'development'
          }
          steps {
            sh './jenkins/scripts/deliver-for-development.sh'
            input 'Finished using the web site? (Click "Proceed" to continue)'
            sh './jenkins/scripts/kill.sh'
          }
        }
        stage('Deliver for stagging') {
          steps {
            echo 'Stagging'
          }
        }
      }
    }
    stage('Prod') {
      steps {
        echo 'Prod'
      }
    }
  }
  environment {
    CI = 'true'
  }
}
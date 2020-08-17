pipeline {
  agent none
  options {
    timeout(time: 1, unit: 'HOURS')
    buildDiscarder(logRotator(numToKeepStr: '20', daysToKeepStr: '10'))
    disableConcurrentBuilds()
    timestamps()
  }
  stages {
    stage('Build and publish') {
      agent { label 'aws.instance-id/i-09bc54b4e29c026ec' }
      tools {
          maven 'maven-3.6.0'
      }
      steps {
        checkout([$class: 'GitSCM', branches: [[name: "${env.BRANCH_NAME}"]],
                userRemoteConfigs: [[url: 'git@github.com:bazaarvoice/building-a-multibranch-pipeline-project.git']]])
        //script { _slackSend() }
        // Build Scaffold artifacts.
        //sh 'mvn clean compile && mvn clean package'
        sh 'echo Helloooo'
        // Build and publish docker images from any branch with tags:
        // ${BRANCH_NAME}
        // ${BRANCH_NAME}-${GIT_SHORT_HASH}-${TIMESTAMP}
        //sh './tools/nexus_build_images.sh'
        // Build and publish Lambda JAR.
        // dir('ScaffoldLambdaFunctions') {
        //   sh './build.sh'
        // }
      }
      post {
          always {
            // Clean-up working dir
            //sh 'mvn clean'
            //_slackSend()
          }
      }
    }
  }
}

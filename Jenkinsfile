pipeline {
    agent any
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'whoami'
                sh 'export PATH=$PATH:/home/jenkins/.nvm/versions/node/v20.18.1/bin/ && npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
    }
}
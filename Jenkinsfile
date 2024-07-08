pipeline {
    agent any
    environment {
        CI = 'true'
    }
    node {
        env.NODEJS_HOME = "${tool 'Node 20.11.1'}"
        // on linux / mac
        env.PATH="${env.NODEJS_HOME}/bin:${env.PATH}"
        // on windows
        env.PATH="${env.NODEJS_HOME};${env.PATH}"
        sh 'npm --version'
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
            when {
                branch 'development' 
            }
            steps {
                sh './jenkins/scripts/deliver-for-development.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'  
            }
            steps {
                sh './jenkins/scripts/deploy-for-production.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
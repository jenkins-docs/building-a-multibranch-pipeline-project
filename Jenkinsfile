pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 5000:5000 -p 3000:3000'
        }
    }
    environment{
        CI='true'
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test'){
            steps{
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver for dev'){
            when{
                branch 'development'
            }
            steps{
                sh './jenkins/scripts/deliver-for-development.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Deliver for deployment'){
            when{
                branch 'deployment'
            }
            steps{
                sh './jenkins/scripts/deploy-for-production.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}

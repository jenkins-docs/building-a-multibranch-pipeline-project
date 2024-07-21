pipeline {
    agent any
    environment {
        CI = 'true'
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
        stage('Deliver for branch_39') {
            when {
                branch 'branch_39'
            }
            steps {
                sh './jenkins/scripts/deliver-for-branch_39.sh'
                input message: 'Finish using the web site? (Click "procceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
       }
       stage('Deploy for branch_production') {
            when {
                branch 'branch_production'
            }
            steps {
                sh './jenkins/scripts/deploy-for-branch_production.sh'
                input message: 'Finished using the web site: (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
       } 
    }
}

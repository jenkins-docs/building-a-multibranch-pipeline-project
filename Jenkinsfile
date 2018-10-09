pipeline {
    agent any
    environment {
        // nnnn
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                echo "build"
            }
        }
        stage('Test') {
            steps {
                echo "tests"
            }
        }
        stage('PR') {
            when {
                changeRequest()
            }
            steps {
                echo "tests development PRRRRR"
            }
        }
        stage('release') {
            when {
                branch '**/release-*'
            }
            steps {
                echo "tests release......................................"
                echo ${GIT_BRANCH}
                def scmVars = checkout scm
                def branchName = scmVars.GIT_BRANCH
                sh("printenv")
            }
        }
        stage('Deliver for TAG') {
            when {
                tag '**/v.1.*'
            }
            steps {
                echo "tests TAG"
                echo ${GIT_BRANCH}
                def scmVars = checkout scm
                def branchName = scmVars.GIT_BRANCH
                sh("printenv")
            }
        }
        stage('Deliver for development') {
            when {
                branch 'development'
            }
            steps {
                echo "tests development"
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                echo "tests production"
            }
        }
    }
}

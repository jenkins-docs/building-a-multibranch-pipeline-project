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
                anyOf {
                    changeRequest()
                    branch '**/release-*';
                    branch 'development'
                }
            }
            steps {
                echo "tests development PRRRRR"
            }
        }
        stage('release') {
            when {
                anyOf {
                    branch '**/release-*';
                    branch 'development'
                }
            }
            steps {
                script {
                    echo "tests release............................................"
                    def scmVars = checkout scm
                    def branchName = scmVars.GIT_BRANCH
                    sh("printenv")
                }
            }
        }
        stage('Deliver for TAG') {
            when {
                tag '**/v.1.*'
            }
            steps {
                script {
                    checkout scm
                    echo "tests TAG.............................................."
                    def scmVars = checkout scm
                    def branchName = scmVars.GIT_BRANCH
                    sh("printenv")
                }
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

pipeline {
    agent { label 'docker-slave' }
    environment {
        CI = 'true'
        NODE_VERSION = '10.16.0'
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                set +ex
                export NVM_DIR="$HOME/.nvm"
                . ~/.nvm/nvm.sh
                nvm install $NODE_VERSION
                set -ex
                npm install
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                set +ex
                . ~/.nvm/nvm.sh
                nvm use $NODE_VERSION
                set -ex
                ./jenkins/scripts/test.sh
                '''
            }
        }
        stage('SonarQube'){
            environment {
                scannerHome = tool 'SonarScanner'
            }
            when { branch 'master' }
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh '''
                    ${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectName=${GIT_URL##*/} \
                        -Dsonar.projectKey=${GIT_URL##*/}
                    '''
                }
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

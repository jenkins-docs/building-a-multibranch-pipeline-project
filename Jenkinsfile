pipeline {
    agent { label jenkins-slave }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                set +ex
                export NVM_DIR="$HOME/.nvm"
                . ~/.nvm/nvm.sh
                nvm install 10.16.3
                set -ex
                npm install
                '''
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
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

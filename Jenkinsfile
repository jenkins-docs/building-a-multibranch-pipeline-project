def properties = readProperties file: './config-manager/dev/jenkins.properties'

pipeline {
    agent any
    environment {
        CI = 'true'
        branch = 'master'
	scmUrl = 'https://github.com/richardjchen/building-a-multibranch-pipeline-project.git'
	development = './config-manager/dev/jenkins.properties'
        production = './config-manager/prod/jenkins.properties'
    }
    stages {
    	  stage('checkout git') {
              steps {
                  git branch: branch, credentialsId: 'richard.jqchen@gmail.com', url: scmUrl
             }
          }	
          stage('Build') {
              steps {
                  echo "build branch successful"
              }
          }
          stage('Test') {
              steps {
                  echo "test successful"
              }
          }
          stage('Deliver for development') {
              when {
                  branch 'development' 
              }
              steps {
                 script {
		     echo "build112 branch successful!"
		     echo "Running build on git repo ${properties.ACR_LOGINSERVER} branch ${properties.ACR_NAMESPACE}"
       		  }
              }
          }
          stage('Deploy for production') {
              when {
                  branch 'production'  
              }
              steps {
	          script {
	               echo "build112 branch successful!"
	      	       echo "Running build on git repo ${properties.ACR_LOGINSERVER} branch ${properties.ACR_NAMESPACE}"
	         }
              }
          }
      }
}

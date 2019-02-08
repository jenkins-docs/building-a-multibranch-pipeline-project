properties = null
properties1 = null

def loadProperties(envfile) {
  node {
         dir('envDir') {
             git url: 'https://github.com/richardjchen/building-a-multibranch-pipeline-project.git'
    	 }
	  
	  echo "file is here1:"
	 
	  echo "file is here2:"
	  
	  def exists = fileExists '/var/jenkins_home/workspace/nch-pipeline-project_development@2/envDir/jenkins.properties'
	  
	  if (exists){
    		echo "jenkins.properties exists"
	  } else {
	       echo "jenkins.properties does not exist"
	  }
	  
	 properties = readProperties file: envfile
	 properties1 = readProperties file: 'jenkins.properties'
         echo "Immediate one ${properties1.ACR_LOGINSERVER}"
  }
}

def getProperties(envfile, name) {
  node { 
	 def exists = fileExists envfile
	 
	 if (exists){
    	       echo "jenkins.properties exists"
    	       properties = readProperties file: envfile
    	       return properties.getProperty(name)
    	       
	 } else {
	       echo "jenkins.properties does not exist"
	       properties = readProperties file: envfile
    	       return properties.getProperty(name)
	 }
    }
}

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
		  script {
		      echo "build branch successful"
		     println getProperties(development, "ACR_LOGINSERVER")
		     echo "Running build on git repo ${properties.ACR_LOGINSERVER} branch ${properties.ACR_NAMESPACE}"
		  }
              }
          }
          stage('Test') {
              steps {
                  
		  script {
		     echo "test successful"
		     println getProperties(development, "ACR_LOGINSERVER")
		     echo "Running build on git repo ${properties.ACR_LOGINSERVER} branch ${properties.ACR_NAMESPACE}"
		  
       		  }
              }
          }
          stage('Deliver for development') {
              when {
                  branch 'development' 
              }
              steps {
                 script {
		     echo "build114 branch successful!"
		     println getProperties(development, "ACR_LOGINSERVER")
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
	               echo "build114 branch successful!"
		       println getProperties(production, "ACR_LOGINSERVER")
	      	       echo "Running build on git repo ${properties.ACR_LOGINSERVER} branch ${properties.ACR_NAMESPACE}"
	         }
              }
          }
      }
}

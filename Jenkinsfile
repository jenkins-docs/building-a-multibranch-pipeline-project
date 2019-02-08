import org.jenkinsci.plugins.pipeline.utility.steps.shaded.org.yaml.snakeyaml.external.biz.base64Coder.Base64Coder

properties = null

def textEncodeBase64(strEncode) {

    def encodedValue = Base64Coder.encodeString(strEncode)

    println "encodedValue--> ${encodedValue}"
    
    return encodedValue
    
}

def textDecodeBase64(strDecode) {

    def decodedValue = Base64Coder.decodeString(strDecode)
    
    println "decodedValue--> ${decodedValue}"
    
    return decodedValue
}

def getProperties(envfile, encodedName) {
  
	 def keyValue = " "
	 def exists = fileExists envfile
	 def decodedName = Base64Coder.decodeString(encodedName)
	
	 println "jenkins.properties encoded key name: ${encodedName}"
	 println "jenkins.properties encoded key name: ${decodedName}"
	
	 if (exists){
    	       println "jenkins.properties file exists"
    	       properties = readProperties file: envfile

	       if (properties.size() > 0){
    		    println "jenkins.properties value exists"
		    keys= properties.keySet()
		    keyValue = properties[decodedName]
		    
		    println "set them up as sytem environment variables for application to grab the value"
		       
		    keys= properties.keySet()
                    for(key in keys) {
                        value = properties["${key}"]
			env."${key}" = "${value}"
                        println "populate them as sytem environment variables: ${value}"
                    }
		       
	        } else {
	             println "jenkins.properties does not exist"
	       }     	    
    	       
	 } else {
	       echo "jenkins.properties does not exist"
	 }
	
	 echo "jenkins.properties keyValue: ${keyValue}"
	
	 def encodedValue = textEncodeBase64(keyValue)
	
	 echo "jenkins.properties encoded keyValue: ${encodedValue}"
	
         return encodedValue
}

pipeline {
    agent any
    environment {
        CI = 'true'
        branch = 'master'
	scmUrl = 'https://github.com/richardjchen/building-a-multibranch-pipeline-project.git'
	development = './config-manager/dev/jenkins.properties'
        production = './config-manager/prod/jenkins.properties'
	serverName = "QUNSX0xPR0lOU0VSVkVS"
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
	  stage('check workspace files') {
              steps {
                  
		  script {
		    	 def  FILES_LIST = sh (script: "ls   '${workspace}'", returnStdout: true).trim()
	                 //DEBUG
                         echo "FILES_LIST : ${FILES_LIST}"
                         //PARSING
                         for(String ele : FILES_LIST.split("\\r?\\n")){ 
                             println ">>>${ele}<<<"     
                         }	  
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
		     println getProperties(development, serverName)
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
		       println getProperties(production, serverName)
	      	       echo "Running build on git repo ${properties.ACR_LOGINSERVER} branch ${properties.ACR_NAMESPACE}"
	         }
              }
          }
      }
}



docker.image('openjdk:8').inside {
    /* One Weird Trick(tm) to allow git(1) to clone inside of a
    * container
    */
    withEnv([
        /* Override the npm cache directory to avoid: EACCES: permission denied, mkdir '/.npm' */
        'npm_config_cache=npm-cache',
        /* set home to our current directory because other bower
        * nonsense breaks with HOME=/, e.g.:
        * EACCES: permission denied, mkdir '/.config'
        */
        'HOME=.',
    ]) {
           pipeline {
                agent {
                    docker {
                        image 'node:6-alpine' 
                        args '-p 3000:3000' 
                    }
                }
                stages {
                    stage('Build') { 
                        steps {
                            sh 'npm install' 
                        }
                    }
                }
            }
    }
}
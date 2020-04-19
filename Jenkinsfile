pipeline {
    
    agent any 
    
    stages {
      stage('Build') {
         steps {
            // Get some code from a GitHub repository
            git 'https://github.com/BrijKaur/EC2JenkinsDocker.git'

            // Run Maven on a Unix agent.
            sh "mvn clean package"

        }

      }
      stage('Deploy') {
         steps {
            sh 'sudo docker build -t brij/tomcat .'
            sh 'sudo docker run -p 8081:8080 brij/tomcat'   
        }

      }
   }
}

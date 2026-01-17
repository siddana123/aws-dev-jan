pipeline {
           agent { label "ubuntu"}
           stages {
           stage('git checkout') {
                                  steps {
                                            // Get some code from a GitHub repository
                                            git 'https://github.com/HouariZegai/Calculator.git'
                                        }
                                  }
           stage('maven build'){
                               steps{
                // Run Maven on a Unix agent.
                                      sh "mvn clean package"
                                     }
                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
                              }

            
        
    }
}

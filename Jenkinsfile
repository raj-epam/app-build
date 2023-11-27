def qa_stage_run=false


pipeline {
      tools {
    maven 'maven-3.6.3' 
  }

    agent any
    stages {
        stage ('checkout') {
            parallel {
                stage('CheckoutTemplate') {
                    steps {
                        sh 'mkdir -p core-template'
                        dir("core-template")
                        {
                            git branch: "main",
                            credentialsId: "raj-epam",
                            url: 'https://github.com/raj-epam/templates.git'
                        }
                    }
                }
                stage('CheckoutCode') {
                    steps {
                        sh 'mkdir -p deployments'
                        dir("deployments")
                        {
                            git branch: "main",
                            credentialsId: "raj-epam",
                            url: 'https://github.com/raj-epam/app-testcase1-deploy.git'
                        }
                    }
                }

            }
        }

    stage ('Build') {
      steps {
        dir("my-webapp") {
        sh 'mvn clean package'
        }
      }
    }



    stage('deployment phase') {
        steps {
            //ssh 
            // echo $(( ($(date +%s) - $(stat test.txt  -c %Y)) / 60 ))
            echo "Hi There"
        }

    }
    }
        post {
            // Clean after build
            always {
                cleanWs(cleanWhenNotBuilt: false,
                        deleteDirs: true,
                        disableDeferredWipeout: true,
                        notFailBuild: true,
                        patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                                [pattern: '.propsfile', type: 'EXCLUDE']])
            }
    }


}



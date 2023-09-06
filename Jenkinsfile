@Library('my-shared-library') _

pipeline{
    agent any

    stages{

        stage('git checkout'){

            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/May0106/mrdevops_java_app.git"
            )
            } 

        }

        stage('Unit Test maven'){

            steps{
               script{
                   
                   mvnTest()
               }
            } 
        }

        stage('Integration Test maven'){

            steps{
               script{
                   
                   mvnIntegrationTest()
               }
            } 
        }
    }
}

@Library('my-shared-library') _

pipeline{
    agent any

    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/delete')
    }

    stages{
        
        
        stage('git checkout'){
        when {expression { params.action == 'create'}} 
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/May0106/mrdevops_java_app.git"
            )
            } 

        }

        stage('Unit Test maven'){
        when {expression { params.action == 'create'}}
            steps{
               script{
                   
                   mvnTest()
               }
            } 
        }

        stage('Integration Test maven'){
        when {expression { params.action == 'create'}}
            steps{
               script{
                   
                   mvnIntegrationTest()
               }
            } 
        }

        stage('static code analysis: sonarqube'){
        when {expression { params.action == 'create'}}
            steps{
               script{
                   
                   def SonarqubecredentialsId = 'sonarqube-api'
                   staticCodeAnalysis(SonarqubecredentialsId)
               }
            } 
        }
    }
}

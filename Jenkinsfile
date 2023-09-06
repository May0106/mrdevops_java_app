@Library('my-shared-library') _

pipeline{
    agent any

    parameters{

        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/delete')
        string(name: 'ImageName', description: "name of the docker build", defaultValue: 'javapp')
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: 'v1')
        string(name: 'AppName', description: "name of the docker Application", defaultValue: 'springboot')

    }

    stages{
        
        
        stage('git checkout'){
        when { expression { params.action == 'create'}} 
            steps{
            gitCheckout(
                branch: "main",
                url: "https://github.com/May0106/mrdevops_java_app.git"
            )
            } 

        }

        stage('Unit Test maven'){
        when { expression { params.action == 'create'}}
            steps{
               script{
                   
                   mvnTest()
               }
            } 
        }

        stage('Integration Test maven'){
        when { expression { params.action == 'create'}}
            steps{
               script{
                   
                   mvnIntegrationTest()
               }
            } 
        }

        stage('static code analysis: sonarqube'){
        when { expression { params.action == 'create'}}
            steps{
               script{
                   
                   def SonarqubecredentialsId = 'sonarqube-api'
                   staticCodeAnalysis(SonarqubecredentialsId)
               }
            } 
        }

        stage('Quality gate status check : sonarqube'){
        when { expression { params.action == 'create'}}
            steps{
               script{
                   
                   def SonarqubecredentialsId = 'sonarqube-api'
                   QualityGateStatus(SonarqubecredentialsId)
               }
            } 
        }

        stage('Maven build : maven'){
        when { expression { params.action == 'create'}}
            steps{
               script{
                   
                   mvnBuild()
               }
            } 
        }

        stage('Docker Iamge Build'){
        when { expression { params.action == 'create'}}
            steps{
               script{
                   
                   DockerBuild("${params.ImageName}","${params.ImageTag}","${params.AppName}")
               }
            } 
        }

        stage('Docker Iamge scan: trivy'){
        when { expression { params.action == 'create'}}
            steps{
               script{
                   
                   dockerimageScan("${params.ImageName}","${params.ImageTag}","${params.AppName}")
               }
            } 
        }
    }
}

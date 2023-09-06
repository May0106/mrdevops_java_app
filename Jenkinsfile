@Library('my-shared-library') _

pipeline{
    agent any

    stages{

        stage('git checkout'){

            steps{
            gtiCheckout(
                branch: "main",
                url: ""
            )
            } 

        }
    }
}

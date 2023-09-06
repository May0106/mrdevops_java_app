@Library('my-shared-library') _

pipeline{
    agent any

    stages{

        stage('git checkout'){

            steps{
            gitCheckout(
                branch: "main",
                url: ""
            )
            } 

        }
    }
}

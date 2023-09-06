pipeline{
    agent any

    stages{

        stage('git checkout'){

            steps{
            gtiCheckout(
                branch: "main",
                url: "https://github.com/May0106/mrdevops_java_app.git"
            )
            } 

        }
    }
}

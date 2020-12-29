cleanBackEnd(){
  ./gradlew clean :backend:build
}

read -n1 -r -p "Lint and run backend unit tests? (Enter y if you do)) " answer
if [[ "$answer" =~ ^([yY])$ ]]
then
 printf "\n cleaning BackEnd"
 cleanBackEnd
fi

cleanClient(){
  ./gradlew clean :some-client:build
}

read -n1 -r -p "Lint and run client unit tests? (Enter y if you do) " answer
if [[ "$answer" =~ ^([yY])$ ]]
then
 printf "\n clean client"
 cleanClient
fi

runIntegrationTests(){
  ./gradlew :backend:integrationTest
}

read -n1 -r -p "Run integrationTests? (Enter y if you do) " answer
if [[ "$answer" =~ ^([yY])$ ]]
then
 printf "\n Running integrationTests"
 runIntegrationTests
fi

lintHer(){
  cd some-webapp || exit
  ng lint --fix
  cd ..
}

read -n1 -r -p "Lint the frontend? (Enter y if you do) " answer

if [[ "$answer" =~ ^([yY])$ ]]
then
 printf "\n linting the webapp"
 lintHer
fi

localiseHer(){
  cd some-webapp || exit
  ng xi18n --output-path locale
  cd ..
}

read -n1 -r -p "localise frontend? (Enter y if you do) " answer

if [[ "$answer" =~ ^([yY])$ ]]
then
 printf "\n localising the webapp"
 localiseHer
fi

testUi(){
  cd some-webapp || exit
  ng test --watch false
  cd ..
}

read -n1 -r -p "Unit test Frontend? (Enter y if you do) " answer

if [[ "$answer" =~ ^([yY])$ ]]
then
 printf "\n testing Ui"
 testUi
fi

testE2e(){
  cd some-webapp || exit
  ng e2e
  cd ..
}

read -n1 -r -p "Run e2e? (Enter y if you do) " answer

if [[ "$answer" =~ ^([yY])$ ]]
then
 printf "\n running e2e"
 testE2e
fi

pushToGit(){
   git add .
   git commit -m "$1"
   git push
}

read -n1 -r -p "Push to git? (Enter y if you do) " answer

if [[ "$answer" =~ ^([yY])$ ]]
then
 read -p "Commit message: " message
 pushToGit "$message"
fi

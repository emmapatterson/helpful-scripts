cleanBackEnd(){
  ./gradlew clean :backend:build
  ./gradlew clean :dams-client:build
}

read -p "Clean backend? (Say y if you do hun) " answer
if [ "$answer" == 'y' ]; then
 echo "clean BackEnd"
 cleanBackEnd
fi

resetDatabase(){
  docker-compose down
  docker-compose up -d
}

read -p "Reset DB? (Say y if you do hun) " resetDb
if [ "$resetDb" == 'y' ]; then
 echo "resetting Database"
 resetDatabase
fi

runIntegrationTests(){
  ./gradlew :backend:integrationTest
}


read -p "Run integrationTests? (Say y if you do hun) " runDem
if [ "$runDem" == 'y' ]; then
 echo "Running integrationTests"
 runIntegrationTests
fi


lintHer(){
  cd dams-webapp
  ng lint
  cd ..
}

read -p "Lint 'er? (Say y if you do hun) " lintHerAye

if [ "$lintHerAye" == 'y' ]; then
 echo "linting the webapp"
 lintHer
fi

testUi(){
  cd dams-webapp
  ng xi18n --output-path locale
  ng test --watch false
  cd ..
}

read -p "Test Frontend? (Say y if you do hun) " testUiAye

if [ "$testUiAye" == 'y' ]; then
 echo "testing Ui"
 testUi
fi

teste2e(){
  cd dams-webapp
  ng e2e
  cd ..
}

read -p "Run e2e? (Say y if you do hun) " teste2eAye

if [ "$teste2eAye" == 'y' ]; then
 echo "running e2e"
 teste2e
fi

pushToGit(){
   git add .
   git commit -m "$1"
   git push
}

read -p "Push to git? (Say y if you do hun) " answer

if [ "$answer" == 'y' ]; then
 read -p  "Commit message: " message
 pushToGit "$message"
fi

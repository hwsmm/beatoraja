#!/bin/bash

repodir=$PWD/
lwjgl=$PWD/../lwjgl/

cd lib
for lwjgljar in lwjgl*.jar
do

new=$(find $lwjgl -name $lwjgljar)
if [ "$new" ]
then
rm $lwjgljar
cp $new $lwjgljar
echo Replaced $lwjgljar
else
echo Not found $lwjgljar
fi

done

gdxurl="https://repo1.maven.org/maven2/com/badlogicgames/gdx"
gdxver=1.12.1

down_maven()
{
url=$1
project=$2
version=$3
suffix=$4

wget $url/$project/$version/$project-$version$suffix.jar \
-O $project$suffix.jar
}

down_maven $gdxurl gdx-backend-lwjgl3 $gdxver
down_maven $gdxurl gdx-freetype $gdxver
down_maven $gdxurl gdx-freetype-platform $gdxver -natives-desktop
down_maven $gdxurl gdx $gdxver
down_maven $gdxurl gdx-platform $gdxver -natives-desktop


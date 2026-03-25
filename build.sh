pushd sing-box
mvn install:install-file -Dfile=libbox.aar -DgroupId=io.github.sagernet -DartifactId=libbox -Dversion="$VERSION" -Dpackaging=aar
popd
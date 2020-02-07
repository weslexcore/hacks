pp () {
  port=$1
  lsof -n -i :$port | grep LISTEN
}

ppkill () {
  port=$1
  lsof -i :$port | awk '{system("kill -9 " $2)}'
}

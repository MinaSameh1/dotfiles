
STATUS=$(xset -q | awk '/Monitor/{print $3}')

case $STATUS in
    "On") slock & xset dpms force off || mpc pause
        ;;
    *) exit 0 ;;
esac

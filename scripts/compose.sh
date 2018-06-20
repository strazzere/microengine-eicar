#
# you need to login into dockerhub
#
clone(){
    say "cloning $1 ..."
    sudo rm -rf ./$1
    git clone git@gitlab.polyswarm.io:polyswarm/$1.git
    cd $1
}

say(){
    echo "==========================================================-"
    echo $1
    echo "==========================================================-"
}

show_yml(){
    say "$1.yml"
    cat $1.yml                        
}

homedir=$(pwd)
tmpdir=$homedir/tmp

#
# Setup & Configuration
#
pip3.6 install pathlib
pip3.6 install websockets

#
# Grap `polyswarmd` Image
#
docker pull polyswarm/polyswarmd

#
# Start `micro engine` Image
#
cd $tmpdir
clone microengine-clamav
git   checkout tutorial # TODO: merge to develop

#
# Start `polyswarmd` Image
#
cd $tmpdir
clone orchestration
git checkout tutorial.clamav-added # TODO: merge to develop

#
# Go to orchestration repository 
#
cd $tmpdir/orchestration

#
# Show the content of yml files
#
show_yml dev
show_yml tutorial.clamav

#
# Compose TODO: tutorial.clamav.yml -> tutorial.yml
#
say "composing ..." 
docker-compose -f dev.yml -f tutorial.clamav.yml up  | tee log

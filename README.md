vagrant-hadoop-dev
==================

Vagrant setup for a hadoop development environment.

## How to run this

    ./download_libs.sh
    vagrant box add base-hadoop http://files.vagrantup.com/lucid64.box
    vagrant up # Take some coffee...
    As soon as you get in... ```cd /vagrant``` ```source
set_environment.zsh```

### Booting up the hadoop cluster

TODO

### Running a hadoop job

TODO

### Running hive

TODO

### Running pig

java -cp pig-0.11.1.jar:/opt/hadoop-1.2.1/conf/ org.apache.pig.Main

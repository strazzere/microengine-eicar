# microengine-eicar

A sample microengine capable of identifying "malintent" in the EICAR test file (and nothing else).
tutorial-eicar instructs the user on building this engine on top of microengine-scratch.

## Usage


Follow the instructions on wiki to launch polyswarmd or execute the following:

```
$ ./scripts/compose.sh
```

### Run the eicar.go loally

If you want to run the eicar.go locally,
then, you need to install the go component dependencies:

```
$ ./scripts/run_engine.sh
```

It installs the dependencies and runs the `scratch.go`

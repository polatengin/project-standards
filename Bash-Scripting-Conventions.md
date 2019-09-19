# Bash Scripting Conventions

Here is the opinionated conventions for Bash Scripts

## Naming variables

All variables should be in ALLCAPS format, without and special character, eg. dash(-), underscore(_) etc.

```bash
USER=`echo whoami`
LISTOFFILES=`echo ls -la`
```

_Benefit of having this naming convention helps to notice all the variables in a Bash script file._

## Bash specific syntax

Almost every Linux distro comes with Bash out-of-the-box.

So, it's _almost_ reliable to use Bash specific syntax, such as, conditions, loops, etc.

We can use Bash specific syntax on Azure DevOps Pipelines for example, because every Hosted Agents comes with Bash installed on it.

But, in case of deploying Bash scripts in a Docker Container, we can't rely on Bash.

Ubuntu, CentOS, Debian, etc. Docker images have Bash, but more minimal Docker images doesn't, such as, Alpine.

Either we build from Ubuntu, CentOS or Debian Docker image (around 600MB) with Bash, or we can build from Alpine Docker image (around 6MB)

Unfortunately, we can't use Bash specific syntax on Alpine Docker images, because it's not pre-installed on the image.

## Function usage

All the scripts should developed in DRY principle, so if part of the script can be reused in somewhere else, it should be extracted as a function and called in multiple places.

```bash
function doit()
{

}

echo DoIt now
doit
echo DoIt again
doit
```

In Bash, you can't call a function which is not declared yet, so, just in case, all the functions should be placed on top of the script files.

In Bash, you can write function definition and body in single line, but it should be avoided because of viewing all the lines at a glance.

If you need to return a value from a Bash function, do it at the very bottom line of the function.

According to Bash language documentation, we can only return single numerical value from a function.

```bash
function sum()
{
    return $1 + $2
}

RESULT=sum 1 3
```

Most of the cases it's not enough to return only one value out from the function.

In that cases, echo a JSON payload to the console only at 1 point in the function and consume it at the caller site.

```bash
function sum()
{
    echo `{ "sum": $1 + $2, "avg": (($1 + $2)/2) }`
}

RESULT=`echo sum 1 3`
```

Afterwards, we can use JQ shell extension tp parse JSON payload

```bash
SUM=$RESULT | jq '.sum'
AVG=$RESULT | jq '.avg'
```

Since `exit` keyword terminates the script execution, it's best to use `return` instead of `exit`

Prefer local variables within functions over global variables, so always declare variables in a function with `local` keyword

```bash
function sum()
{
    local SUM=$1 + $2
    return $SUM
}
```

# Parameters

If a Bash script requires parameters to run, always check if those parameters are set.

```bash
if [ -n "$1" ]; then
    # use first parameter
else
    echo "First parameter cannot be blank"
    return 10
fi
```

In some cases we need to check if all the parameters are set, in those cases we can check the number of the parameters by using `$#` syntax

```bash
NUMBEROFPARAMETERS=$#
```

If we need to iterate over parameters, we can use `$@` syntax

```bash
for var in "$@"; do
    echo "current parameter $var"
done
```

## Calling native commands

In Linux world, almost every parameter of native commands has abbreviations, it's good to avoid using abbreviations.

```bash
#use
rm --recursive --force

#instead of
rm -rf
```

## Debugging

To perform a syntax check/dry run of your bash script run:

```bash
bash -n myscript.sh
```

To produce a trace of every command executed run:

```bash
bash -v myscripts.sh
```

To produce a trace of the expanded command use:

```bash
bash -x myscript.sh
```

-v and -x can also be made permanent by adding `set -o verbose` and `set -o xtrace` to the script prolog. This might be useful if the script is run on a remote machine, e.g. a build-bot and you are logging the output for remote inspection.

## References

https://google.github.io/styleguide/shell.xml

http://guide.bash.academy/

http://www.tldp.org/LDP/abs/html/

https://www.gnu.org/software/bash/manual/bashref.html

https://www.ibm.com/developerworks/library/l-linux-shells/

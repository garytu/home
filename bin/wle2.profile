JAVA_HOME=~/app/ibm-java-x86_64-60
export JAVA_HOME

ANT_HOME=~/app/apache-ant-1.7.1
export ANT_HOME

ANT_OPTS=-Xmx512m
export ANT_OPTS

MAVEN_HOME=~/app/apache-maven-2.2.1
export MAVEN_HOME

M2_HOME=~/app/apache-maven-2.2.1
export M2_HOME

BPM=~/Projects/bpm
export BPM

PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$ANT_HOME/bin:$PATH
export PATH


ULIMIT_NOFILE_REQUIRED=8192
ULIMIT_NOFILE_HARD=$(ulimit -n -H)
ULIMIT_NOFILE=$(ulimit -n)
echo "The maximum number of open file descriptors is ${ULIMIT_NOFILE}."
if [ "${ULIMIT_NOFILE}" -ge "${ULIMIT_NOFILE_REQUIRED}" ] ; then
	echo "The maximum number of open file descriptors is acceptable."
else
	echo "The maximum number of open file descriptors should be increased to at least ${ULIMIT_NOFILE_REQUIRED}."
	echo "The hard limit for the maximum open file descriptors is ${ULIMIT_NOFILE_HARD}."
	if [ "${ULIMIT_NOFILE_REQUIRED}" -le "${ULIMIT_NOFILE_HARD}" -o "${ULIMIT_NOFILE_HARD}" == "unlimited" ] ; then
		echo "Setting the maximum number of open file descriptors to ${ULIMIT_NOFILE_REQUIRED}."
		ulimit -n ${ULIMIT_NOFILE_REQUIRED}
	else
		echo "Unable to automatically increase the maximum number of open file descriptors."
		echo "Enable a hard limit of at least ${ULIMIT_NOFILE_REQUIRED}   for" \
		     "the user $(whoami) in the /etc/security/limits.conf file."
	fi
		
fi

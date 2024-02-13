#!/usr/bin/env sh

echo 'The following "npm" command builds your Node.js/React application for'
echo 'production in the local "build" directory (i.e. within the appropriate'
echo 'subdirectory of "/var/jenkins_home/workspace/"), correctly bundles React'
echo 'in production mode and optimizes the build for the best performance.'
set -x
npm run build
set +x

echo 'The following "npm" command downloads and installs the npm serve module'
echo '(for serving static sites in production environments) to the local'
echo '"node_modules" directory (i.e. within the appropriate subdirectory of'
echo '"/var/jenkins_home/workspace/"), which means that this module should not'
echo 'need to be downloaded after this Pipeline''s initial run for a given'
echo 'branch.'
set -x
npm install serve
set +x

echo 'The following "serve" command runs the npm serve module (downloaded'
echo 'above) deploys your Node.js/React application (built above in production'
echo 'mode) for production and makes the application available for web browsing.'
echo 'The "serve" command has a trailing ampersand so that the command runs'
echo 'as a background process (asynchronously). Otherwise, this command'
echo 'can pause running builds of CI/CD applications indefinitely. "serve"'
echo 'is followed by another command that retrieves the process ID (PID) value'
echo 'of the previously run process (i.e. "serve") and writes this value to'
echo 'the file ".pidfile".'
set -x
# serve -s build -l 5000 &
./node_modules/serve/build/main.js -s build -l 3000 &
echo $! > .pidfile
set +x

echo 'Now...'
echo 'Visit http://localhost:5000 to see your Node.js/React application in action.'
echo '(This is why you specified the "args ''-p 5000:5000''" parameter when you'
echo 'created your initial Pipeline as a Jenkinsfile.)'

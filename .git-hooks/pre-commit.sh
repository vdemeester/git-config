# pre-commit.sh
test -z "${GIT_DIR}" && GITDIR="`pwd`/.git"
# Stash changes
git stash -q --keep-index
# Run any `GITDIR`/hooks/pre-commit.* script
for hook in ${GIT_DIR}/hooks/pre-commit.*; do
    if test -x ${hook}; then
        ${hook}
        hook_result=$?
        if test ${hook_result} -ne 0; then
            echo "${hook} hook returned an error"
            exit 1
        fi
    fi
done
# re apply stashed files
git stash pop -q
# Exiting with success
exit 0

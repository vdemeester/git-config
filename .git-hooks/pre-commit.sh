# pre-commit.sh
# Stash changes
git stash -q --keep-index
# Run any `GITDIR`/hooks/pre-commit.* script
for hook in ${GITDIR}/hooks/pre-commit.*; do
    if test -x ${hook}; then
        ${hook}
    fi
done
# re apply stashed files
git stash pop -q

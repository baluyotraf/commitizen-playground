set -e

N_TAG=$(git tag | wc -l)
git tag | xargs -r git tag -d

if [[ $N_TAG -ne 0 ]]; then
    git reset --hard HEAD~1
fi
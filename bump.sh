
SCRIPT_DIR="$(dirname "$(realpath "${0}")")"
PROJECTS=("repo-a" "repo-b")
CHANGELOG_TEMPLATE="${SCRIPT_DIR}/CHANGELOG.md.j2"
RELATIVE_TEMPLATE="$(realpath --relative-to="${PWD}" "${CHANGELOG_TEMPLATE}")"

echo ${CHANGELOG_TEMPLATE}
echo ${RELATIVE_TEMPLATE}

cz --config pyproject.toml --debug bump --yes

for proj in "${PROJECTS[@]}"; do
    cz --debug \
        --config "${SCRIPT_DIR}/${proj}/pyproject.toml" \
        changelog \
            --template "${RELATIVE_TEMPLATE}" \
            --file-name "${SCRIPT_DIR}/${proj}/CHANGELOG.md"
done

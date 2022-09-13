#! /usr/bin/env bash

HOOKS_DIRECTORY=${HOOKS_DIRECTORY:-hooks}

echo "[INFO] Installing git hooks from directory '${HOOKS_DIRECTORY}'"

# TODO: currently only supporting a subset of hook types, extend if needed
for type in pre-commit prepare-commit-msg commit-msg pre-push; do
  echo "[INFO] Installing hooks of type '${type}'"

  cat << EOF > ".git/hooks/${type}"
  #! /usr/bin/env bash
  
  if [ -d "${HOOKS_DIRECTORY}/${type}" ]; then
    for hook_file in \$(find "${HOOKS_DIRECTORY}/${type}" -type f); do
        echo "[INFO] Executing hook in file '\${hook_file}'"
        bash "\${hook_file}" || exit 1
    done
  fi
EOF

chmod +x ".git/hooks/${type}"
done

echo "[INFO] All hooks are installed!"
#! /bin/sh

HOOKS_DIRECTORY=${HOOKS_DIRECTORY:-hooks}

echo "[INFO] Installing git hooks from directory '${HOOKS_DIRECTORY}'"

# TODO: currently only supporting a subset of hook types, extend if needed
for type in pre-commit prepare-commit-msg commit-msg pre-push; do
  echo "[INFO] Installing hooks of type '${type}'"

  cat << EOF > ".git/hooks/${type}"
  #! /usr/bin/env bash

  execute_hook() {
    echo "[INFO] Executing hook in file '\${1}'"
    sh "\${1}" || exit 1
  }
  
  if [ -d "${HOOKS_DIRECTORY}/${type}" ]; then
    hooks=\$(find "${HOOKS_DIRECTORY}/${type}" -type f)

    for hook in \${hooks}; do
        execute_hook \${hook} || exit 1
        echo ""
    done
  fi
EOF

chmod +x ".git/hooks/${type}"
done

echo "[INFO] All hooks are installed!"
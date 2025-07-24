#!/bin/bash

set -e

echo "🚀 Installing OPAM (official installer)..."
bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"

echo "📥 Initializing OPAM..."
opam init -y
eval $(opam env)

echo "📦 Creating OCaml 5.3.0 switch..."
opam switch create 5.3.0
eval $(opam env)

echo "📦 Installing rlwrap (for better utop experience)..."
sudo apt install -y rlwrap

echo "🔧 Installing utop REPL..."
opam install -y utop

# Определяем файл конфигурации shell для автоподгрузки opam env
SHELL_CONFIG=""

if [[ "$SHELL" == */zsh ]]; then
  SHELL_CONFIG="$HOME/.zshrc"
elif [[ "$SHELL" == */bash ]]; then
  SHELL_CONFIG="$HOME/.bashrc"
else
  SHELL_CONFIG="$HOME/.profile"
fi

# Проверяем, что в конфиге есть строка подгрузки opam env, если нет — добавляем
if ! grep -q 'eval $(opam env)' "$SHELL_CONFIG" 2>/dev/null; then
  echo -e "\n# Load OPAM environment\nif command -v opam >/dev/null 2>&1; then\n  eval \$(opam env)\nfi" >> "$SHELL_CONFIG"
  echo "🔄 Added 'eval \$(opam env)' to $SHELL_CONFIG for automatic environment setup"
else
  echo "ℹ️ OPAM environment already configured in $SHELL_CONFIG"
fi

echo "✅ Installation finished!"
echo "💡 Please restart your terminal or run:"
echo "    source $SHELL_CONFIG"
echo ""
echo "🔍 Verify versions:"
ocaml -version
utop --version

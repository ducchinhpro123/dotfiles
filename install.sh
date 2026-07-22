#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
backup_dir="${XDG_STATE_HOME:-$HOME/.local/state}/dotfiles-backups/$(date +%Y%m%d-%H%M%S)-$$"
backup_used=false
installed=0

while IFS= read -r relative || [[ -n "$relative" ]]; do
    [[ -z "$relative" || "$relative" == \#* ]] && continue

    case "$relative" in
        /*|..|../*|*/..|*/../*)
            printf 'Refusing unsafe manifest path: %s\n' "$relative" >&2
            exit 1
            ;;
    esac

    source_path="$repo_dir/$relative"
    target_path="$HOME/$relative"

    [[ -e "$source_path" ]] || {
        printf 'Missing tracked file: %s\n' "$source_path" >&2
        exit 1
    }

    if [[ -L "$target_path" && "$(readlink -f -- "$target_path")" == "$(readlink -f -- "$source_path")" ]]; then
        printf 'Already linked: ~/%s\n' "$relative"
        continue
    fi

    mkdir -p -- "$(dirname -- "$target_path")"

    if [[ -e "$target_path" || -L "$target_path" ]]; then
        backup_path="$backup_dir/$relative"
        mkdir -p -- "$(dirname -- "$backup_path")"
        mv -- "$target_path" "$backup_path"
        backup_used=true
        printf 'Backed up:    ~/%s\n' "$relative"
    fi

    ln -s -- "$source_path" "$target_path"
    printf 'Linked:       ~/%s\n' "$relative"
    installed=$((installed + 1))
done < "$repo_dir/manifest.txt"

printf '\nInstalled %d link(s).\n' "$installed"
if [[ "$backup_used" == true ]]; then
    printf 'Previous files are in %s\n' "$backup_dir"
fi

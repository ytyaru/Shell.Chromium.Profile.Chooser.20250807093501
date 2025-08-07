#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# Chromiumのプロファイルを選択するダイアログを表示し選択したプロファイルでChromiumを起動する。
#   Chromiumには標準でその機能がないため作成した。Firefoxは-P引数で可能なのだが。
#   依存コマンド: which, jq, zenity
#   動作環境: Raspberry PI OS (Linux Debian 10〜)
# CreatedAt: 2020-10-06
#---------------------------------------------------------------------------
Run() {
	IsIntallJq() { [ -n "$(which jq)" ] && return 0 || return 1; } 
	IntallJq() { sudo apt -y install jq; }
	IsIntallJq || IntallJq

	readonly PATH_PROFILE="$HOME/.config/chromium/Local State"
	Profile() { cat "$PATH_PROFILE"; }
	readonly LAST_ACTIVE_PROFILE="$(jq -r '[ .profile.last_active_profiles ] | flatten | .[]' "$PATH_PROFILE" | head -n 1)"
	readonly PROFILE_DIRS="$(jq -r '[ .profile.info_cache | keys ] | flatten | .[]' "$PATH_PROFILE")"
	readonly PROFILE_NAMES="$(jq -r '.profile.info_cache[].name' "$PATH_PROFILE")"

	readonly PROFILE_NAME_DIR=$(paste -d'\n' <(echo -e "$PROFILE_NAMES") <(echo -e "$PROFILE_DIRS"))
	readonly PROFILES="$(echo -e "$PROFILE_NAME_DIR" | sed "s/^/'/g" | sed "s/$/'/g" | tr '\n' ' ')"
	readonly WIDTH=280
	readonly HEIGHT=$((100 + (25 * $(echo -e "$PROFILE_DIRS" | wc -l))))
	echo $HEIGHT
	ZENITY_CMD="zenity --list --hide-header --title='Chromium ユーザ選択' --text='ユーザを選択してください。' --hide-column=2 --print-column=2 --column='ユーザ名' --column='ディレクトリ名' --width=$WIDTH --height=$HEIGHT $PROFILES"
	SELECTED_PROFILE_DIR="$(eval "$ZENITY_CMD")"
	chromium-browser --profile-directory="$SELECTED_PROFILE_DIR"
}
Run "$@"

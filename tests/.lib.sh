#!/usr/bin/env bash

set -e
set -u
set -o pipefail


###
### Run
###
function run() {
	local cmd="${1}"
	local to_stdout=0

	# Output to stdout instead?
	if [ "${#}" -eq "2" ]; then
		to_stdout="${2}"
	fi

	local red="\033[0;31m"
	local green="\033[0;32m"
	local yellow="\033[0;33m"
	local reset="\033[0m"

	if [ "${to_stdout}" -eq "0" ]; then
		printf "${yellow}[%s] ${red}%s \$ ${green}${cmd}${reset}\n" "$(hostname)" "$(whoami)" >&2
	else
		printf "${yellow}[%s] ${red}%s \$ ${green}${cmd}${reset}\n" "$(hostname)" "$(whoami)"
	fi

	if sh -c "${cmd}"; then
		if [ "${to_stdout}" -eq "0" ]; then
			printf "${green}[%s]${reset}\n" "OK" >&2
		else
			printf "${green}[%s]${reset}\n" "OK"
		fi
		return 0
	else
		if [ "${to_stdout}" -eq "0" ]; then
			printf "${red}[%s]${reset}\n" "NO" >&2
		else
			printf "${red}[%s]${reset}\n" "NO"
		fi
		return 1
	fi
}


###
### Run (must fail in order to succeed)
###
function run_fail() {
	local cmd="${1}"
	local to_stdout=0

	# Output to stdout instead?
	if [ "${#}" -eq "2" ]; then
		to_stdout="${2}"
	fi

	local red="\033[0;31m"
	local green="\033[0;32m"
	local yellow="\033[0;33m"
	local reset="\033[0m"

	if [ "${to_stdout}" -eq "0" ]; then
		printf "${yellow}[%s] ${red}%s \$ ${yellow}[NOT] ${green}${cmd}${reset}\n" "$(hostname)" "$(whoami)" >&2
	else
		printf "${yellow}[%s] ${red}%s \$ ${yellow}[NOT] ${green}${cmd}${reset}\n" "$(hostname)" "$(whoami)"
	fi

	if ! sh -c "${cmd}"; then
		if [ "${to_stdout}" -eq "0" ]; then
			printf "${green}[%s]${reset}\n" "OK" >&2
		else
			printf "${green}[%s]${reset}\n" "OK"
		fi
		return 0
	else
		if [ "${to_stdout}" -eq "0" ]; then
			printf "${red}[%s]${reset}\n" "NO" >&2
		else
			printf "${red}[%s]${reset}\n" "NO"
		fi
		return 1
	fi
}

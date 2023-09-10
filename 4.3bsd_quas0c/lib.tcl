proc shell_cmd {cmd {check_error true}} {
    expect "# "
    send "$cmd\r"
    if {$check_error == true} {
	expect "# "
	send "echo \$?\r"
	expect "0\r"
    }
}

proc write_file {path contents} {
    expect "# "
    send "cat >\"$path\" <<EOF\r"
    expect "> "
    send "$contents"
    send "EOF\r"
    expect "# "
    send "echo \$?\r"
    expect "0"
}

proc halt {} {
    expect "# "
    send "halt\r"

    expect "sim> "
}

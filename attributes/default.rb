default['initial_setup']['packages'] = ["sshpass", "bash-completion", "unattended-upgrades", "htop", "figlet"]
default['initial_setup']['timezone'] = "Etc/GMT"
default['initial_setup']['ssh_known_hosts'] = []

default['initial_setup']['users'] = {
	"default_user" => {
		"groups" => [],
		"password" => "Qwerty!@",
		"home" => "/home/default_user",
		"shell" => "/bin/bash",
		"ssh_keys" => [],
		"sudo" => {
			"group" => true,
			"nopasswd" => []
		}
	}
}

default['initial_setup']['default']['groups'] = []
default['initial_setup']['default']['password'] = "Qwerty!@"
default['initial_setup']['default']['shell'] = "/bin/bash"
default['initial_setup']['default']['ssh_keys'] = []
default['initial_setup']['default']['sudo'] = { "group" => false, "nopasswd" => [] }

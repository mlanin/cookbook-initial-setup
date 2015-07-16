default['debian_setup']['packages'] = ["sshpass", "bash-completion", "unattended-upgrades", "htop", "figlet"]

default['debian_setup']['timezone'] = "Etc/GMT"

default['debian_setup']['users'] = {
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

default['debian_setup']['default']['groups'] = []
default['debian_setup']['default']['password'] = "Qwerty!@"
default['debian_setup']['default']['shell'] = "/bin/bash"
default['debian_setup']['default']['ssh_keys'] = []
default['debian_setup']['default']['sudo'] = { "group" => false, "nopasswd" => [] }

	## Test the connection by running the following command:

```bash
sudo salt-ssh -i '*' test.ping
```
### Run a Shell Command

Salt lets you remotely execute shell commands across multiple systems using cmd.run:

```bash
sudo salt-ssh '*' cmd.run 'ls -l /etc'
```

Show Disk Usage

```bash
sudo salt-ssh '*' disk.usage
```

Install a Package

```bash
sudo salt-ssh '*' pkg.install cowsay
```

List network interfaces

```bash
sudo salt-ssh '*' network.interfaces
```

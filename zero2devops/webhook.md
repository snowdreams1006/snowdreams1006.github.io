# webhook

> https://snapcraft.io/install/webhook/centos

```bash
sudo yum install -y epel-release
```

```bash
sudo yum install -y snapd
```

```bash
sudo systemctl enable --now snapd.socket
```

```bash
sudo ln -s /var/lib/snapd/snap /snap
```

```bash
sudo snap install webhook
```

```json
[
  {
    "id": "redeploy-webhook",
    "execute-command": "/root/snap/webhook/redeploy.sh",
    "command-working-directory": "/root/snap/webhook"
  }
]
```

```bash
#! /bin/sh

echo "Hi,WebHook"
```

```bash
webhook -hooks hooks.json -verbose
```

```
http://snowdreams1006.cn:9000/hooks/redeploy-webhook
```

```
https://webhook.snowdreams1006.cn/hooks/redeploy-webhook
```

## 卸载

```bash
sudo yum remove -y epel-release
```

```bash
sudo yum remove -y snapd
```

```bash
sudo systemctl disable --now snapd.socket
```

```bash
sudo rm -rf /snap
```

```bash
sudo snap remove webhook
```

## centos install webhook

```bash
docker pull almir/webhook
```

```json
[
  {
    "id": "test",
    "execute-command": "/etc/webhook/redeploy.sh",
    "command-working-directory": "/etc/webhook"
  }
]
```

```bash
#! /bin/sh

echo "Test WebHook"

curl https://sc.ftqq.com/SCU67099T95840f46f3bad01fae1c893c968be0e25dd94acd8217a.send?text=test&desp=Message from [webhook.snowdreams1006.cn/hooks/test](https://webhook.snowdreams1006.cn/hooks/test)
```

```bash
docker run -d -p 9000:9000 -v /root/webhook:/etc/webhook --name=webhook \
  almir/webhook -verbose -hooks=/etc/webhook/hooks.json -hotreload
```

```bash
#! /bin/sh

echo "Test WebHook"

docker ps
```

```bash
chmod 777 docker.sock
```

```bash
docker run -d -p 9000:9000 --name=webhook \
	-v /root/webhook:/etc/webhook \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /usr/bin/docker:/usr/bin/docker \
  almir/webhook -verbose -hooks=/etc/webhook/hooks.json -hotreload
```

```bash
curl https://webhook.snowdreams1006.cn/hooks/test
```


```bash
docker pull hongkongkiwi/webhook
```

- hooks.json

```json
[
  {
    "id": "test",
    "execute-command": "/etc/webhook/test.sh",
    "command-working-directory": "/etc/webhook"
  }
]
```

- test.sh

```bash
#! /bin/sh

echo "Test WebHook"

docker stop resume
```

- docker run

```bash
docker run -d -p 9000:9000 --name=webhook \
	-v /root/webhook:/etc/webhook \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /usr/bin/docker:/usr/bin/docker \
  hongkongkiwi/webhook -verbose -hooks=/etc/webhook/hooks.json -hotreload
```

> `chmod 777 docker.sock`

- trigger

```bash
curl https://webhook.snowdreams1006.cn/hooks/test
```





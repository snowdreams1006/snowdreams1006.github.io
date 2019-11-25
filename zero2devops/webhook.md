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

## hooks.json

```bash
[
  {
    "id": "test",
    "execute-command": "/etc/webhook/test.sh",
    "command-working-directory": "/etc/webhook",
    "response-message": "Test received successfully!"
  },
  {
    "id": "github",
    "execute-command": "/etc/webhook/github.sh",
    "command-working-directory": "/etc/webhook",
    "response-message": "Github received successfully!",
    "pass-arguments-to-command":
    [
      {
        "source": "payload",
        "name": "head_commit.id"
      },
      {
        "source": "payload",
        "name": "pusher.name"
      },
      {
        "source": "payload",
        "name": "pusher.email"
      }
    ],
    "trigger-rule":
    {
      "and":
      [
        {
          "match":
          {
            "type": "payload-hash-sha1",
            "secret": "blog.snowdreams1006.cn",
            "parameter":
            {
              "source": "header",
              "name": "X-Hub-Signature"
            }
          }
        },
        {
          "match":
          {
            "type": "value",
            "value": "refs/heads/master",
            "parameter":
            {
              "source": "payload",
              "name": "ref"
            }
          }
        }
      ]
    }
  },
  {
    "id": "query",
    "execute-command": "/etc/webhook/query.sh",
    "command-working-directory": "/etc/webhook",
    "response-message": "Query received successfully!"
  },
  {
    "id": "file",
    "execute-command": "/etc/webhook/file.sh",
    "command-working-directory": "/etc/webhook",
    "response-message": "File received successfully!",
    "pass-file-to-command":
    [
      {
        "source": "payload",
  "name": "file",
        "envname": "ENV_VARIABLE", 
        "base64decode": false
      }
    ],
    "include-command-output-in-response": true
  }
]
```

- test.sh

```bash
#! /bin/sh

echo "Test received successfully!"
```

- github.sh

```bash
#! /bin/sh

echo "Github received successfully!"
```

- query.sh

```bash
#! /bin/sh

echo "Query received successfully!"
```

- file.sh

```bash
#! /bin/sh

echo "File received successfully!"
```

- trigger

```bash
curl https://webhook.snowdreams1006.cn/hooks/test
```

```bash
curl https://webhook.snowdreams1006.cn/hooks/github
```

```bash
curl https://webhook.snowdreams1006.cn/hooks/query
```

```json
{
  "file":"iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2lpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wUmlnaHRzPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvcmlnaHRzLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcFJpZ2h0czpNYXJrZWQ9IkZhbHNlIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjEzMTA4RDI0QzMxQjExRTBCMzYzRjY1QUQ1Njc4QzFBIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjEzMTA4RDIzQzMxQjExRTBCMzYzRjY1QUQ1Njc4QzFBIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzMgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ1dWlkOkFDMUYyRTgzMzI0QURGMTFBQUI4QzUzOTBEODVCNUIzIiBzdFJlZjpkb2N1bWVudElEPSJ1dWlkOkM5RDM0OTY2NEEzQ0REMTFCMDhBQkJCQ0ZGMTcyMTU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+IBFgEwAAAmJJREFUeNqkk89rE1EQx2d/NNq0xcYYayPYJDWC9ODBsKIgAREjBmvEg2cvHnr05KHQ9iB49SL+/BMEfxBQKHgwCEbTNNIYaqgaoanFJi+rcXezye4689jYkIMIDnx47837zrx583YFx3Hgf0xA6/dJyAkkgUy4vgryAnmNWH9L4EVmotFoKplMHgoGg6PkrFarjXQ6/bFcLj/G5W1E+3NaX4KZeDx+dX5+7kg4HBlmrC6JoiDFYrGhROLM/mp1Y6JSqdCd3/SW0GUqEAjkl5ZyHTSHKBQKnO6a9khD2m5cr91IJBJ1VVWdiM/n6LruNJtNDs3JR3ukIW03SHTHi8iVsbG9I51OG1bW16HVasHQZopDc/JZVgdIQ1o3BmTkEnJXURS/KIpgGAYPkCQJPi0u8uzDKQN0XQPbtgE1MmrHs9nsfSqAEjxCNtHxZHLy4G4smUQgyzL4LzOegDGGp1ucVqsNqKVrpJCM7F4hg6iaZvhqtZrg8XjA4xnAU3XeKLqWaRImoIZeQXVjQO5pYp4xNVirsR1erxer2O4yfa227WCwhtWoJmn7m0h270NxmemFW4706zMm8GCgxBGEASCfhnukIW03iFdQnOPz0LNKp3362JqQzSw4u2LXBe+Bs3xD+/oc1NxN55RiC9fOme0LEQiRf2rBzaKEeJJ37ZWTVunBeGN2WmQjg/DeLTVP89nzAive2dMwlo9bpFVC2xWMZr+A720FVn88fAUb3wDMOjyN7YNc6TvUSHQ4AH6TOUdLL7em68UtWPsJqxgTpgeiLu1EBt1R+Me/mF7CQPTfAgwAGxY2vOTrR3oAAAAASUVORK5CYII="
}
```

```bash
curl -H "Content-Type:application/json" -X POST -d @file.json \
https://webhook.snowdreams1006.cn/hooks/file
```

```bash
#! /bin/sh

echo "Query received successfully!"

curl https://sc.ftqq.com/SCU67099T95840f46f3bad01fae1c893c968be0e25dd94acd8217a.send?text=服务器又发来新消息啦!&desp=欢迎访问[雪之梦技术驿站](https://blob.snowdreams1006.cn/),请关注微信公众号:「 雪之梦技术驿站 」 ![wechat:snowdreams1006](https://snowdreams1006.github.io/snowdreams1006-wechat-public.jpeg)
```

```bash
#! /bin/sh

echo "Query received successfully!"

curl https://sc.ftqq.com/SCU67099T95840f46f3bad01fae1c893c968be0e25dd94acd8217a.send?text=服务器又发来新消息啦!&desp=欢迎访问雪之梦技术驿站 : https://blob.snowdreams1006.cn
```

```bash
#! /bin/sh

echo "Query received successfully!"

curl -i -X GET \
 "https://sc.ftqq.com/SCU67099T95840f46f3bad01fae1c893c968be0e25dd94acd8217a.send?text=%E6%9C%8D%E5%8A%A1%E5%99%A8%E5%8F%88%E5%8F%91%E6%9D%A5%E6%96%B0%E6%B6%88%E6%81%AF%E5%95%A6!&desp=%E6%AC%A2%E8%BF%8E%E8%AE%BF%E9%97%AE%5B%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99%5D(https%3A%2F%2Fblob.snowdreams1006.cn%3FtokenId%3D$(uuidgen))%2C%E8%AF%B7%E5%85%B3%E6%B3%A8%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%8F%B7%3A%E3%80%8C+%E9%9B%AA%E4%B9%8B%E6%A2%A6%E6%8A%80%E6%9C%AF%E9%A9%BF%E7%AB%99+%E3%80%8D+!%5Bwechat%3Asnowdreams1006%5D(https%3A%2F%2Fsnowdreams1006.github.io%2Fsnowdreams1006-wechat-public.jpeg)" 
```

```bash
curl https://webhook.snowdreams1006.cn/hooks/query
```
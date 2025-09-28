# npm 快速入门

> [淘宝 NPM 镜像](https://developer.aliyun.com/mirror/NPM?from=tnpm)

```bash
npm install --registry=https://registry.npm.taobao.org
```

> --registry=https://registry.npm.taobao.org

- install

```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

- config

```bash
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"
```

```bash
# Or alias it in .bashrc or .zshrc
echo '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"' >> ~/.zshrc && source ~/.zshrc
```


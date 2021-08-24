## tofu-project-default

> tofu 项目工程模板



### 如何使用

```sh
## 从github中clone
git clone --depth=1 https://github.com/d80x86/tofu-project-default.git new_name

## 进入项目
cd new_name

## 安装tofu framework
./tofu install

## 运行(开发模式)
./tofu console

## 运行(生产模式)
./tofu start

```



### 可选操作

```sh
## 移除无用的旧git信息
rm -rf .git

## 添加
echo '/lua_modules' >> .gitignore
```





[en](./README.en.md)

# Chromium.Profile.Chooser

　Chromiumのプロファイルを選択するGUIダイアログを出して起動させるBashスクリプト。

# 特徴

* `firefox -P`のChromium版。標準では備わっていないため自作した

# 開発環境

* <time datetime="2025-08-07T09:33:42Z+09:00">2025-08-07</time>
* [Raspbierry Pi](https://ja.wikipedia.org/wiki/Raspberry_Pi) 4 Model B Rev 1.2
* [Raspberry Pi OS](https://ja.wikipedia.org/wiki/Raspbian) buster 10.0 2020-08-20 <small>[setup](http://ytyaru.hatenablog.com/entry/2020/10/06/111111)</small>
* bash 5.2.15(1)-release

# インストール

```sh
git clone https://github.com/ytyaru/Shell.Chromium.Profile.Chooser.20250807093501
```

# 使い方

```sh
cd Shell.Chromium.Profile.Chooser.20250807093501/src
chmod +x choose_chromium_profile.sh
./choose_chromium_profile.sh
```

# 注意

* 依存コマンド: `which`, `jq`, `zenity`

# 著者

　ytyaru

* [![github](http://www.google.com/s2/favicons?domain=github.com)](https://github.com/ytyaru "github")
* [![hatena](http://www.google.com/s2/favicons?domain=www.hatena.ne.jp)](http://ytyaru.hatenablog.com/ytyaru "hatena")
* [![BlueSky](http://www.google.com/s2/favicons?domain=bsky.app)](https://bsky.app/ "BlueSky")
* [![mastodon](http://www.google.com/s2/favicons?domain=mstdn.jp)](https://mstdn.jp/web/accounts/233143 "mastdon")

# ライセンス

　このソフトウェアはCC0ライセンスである。

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.ja)


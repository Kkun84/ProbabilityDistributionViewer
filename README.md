# ProbabilityDistributionViewer

## Dockerの利用

Dockerに関するシェルスクリプトが`docker/`フォルダにまとめられています．
拡張子が`.sh`のファイルを実行すれば簡単にDockerを利用できます．

| ファイル | 説明 | 引数 (デフォルト値) |
| --- | --- | --- |
| `./docker/build.sh` | DockerfileからDockerイメージを作ります． Dockerイメージの名前は`ProbabilityDistributionViewer`です． |
| `./docker/run.sh` | Dockerイメージ`ProbabilityDistributionViewer`のコンテナを作ります． コンテナの名前は`patch_sets`です．このシェルスクリプトを実行したディレクトリとパス`$DATASET`が示すディレクトリがそれぞれコンテナ内の`/workspace/`と`/dataset/`に**マウントされ，完全に同期されます**．また，5000,6006,8888のポートをホストに割り当てます．環境変数は`.env`ファイルから読み込みます． | コンテナで常時実行するコマンド (fish) |
| `./docker/attach.sh`| `run`で実行したコマンドに復帰します．このコマンドが終了するとコンテナも終了します． |
| `./docker/exec.sh` | 動作中のコンテナで新しいコマンドを実行します． | 実行するコマンド (fish) |
| `./docker/jupyter.sh` | コンテナ内でjupyter-labを実行します．**非常にセキュアでない**ので実行には注意して下さい． | サーバーのポート (8888) |

`.env`の作成には`.env.default`を参考にして下さい．

## Visual Studio Codeの利用

使用するエディタにはVisual Studio Code(以下vscode)をおすすめします．
ダウンロードは[こちら](https://code.visualstudio.com/)です．
vscodeでは，コンテナへのアタッチや高度なデバッグなど，豊富な機能が利用できます．

vscodeの設定ファイルは`.vscode/`にまとめられています．

### 拡張機能

おすすめの拡張機能が`.vscode/extensions.json`にまとめられています．
vscodeの**フォルダーを開く**でこのプロジェクトを開けば，まとめてインストールすることもできます．

### コンテナへのアタッチ

vscodeの作業を動作中のコンテナ内部で行うことができます．
これは，vscode上で**Remote - Containers拡張機能**をインストールすることで利用できます．
拡張機能は[こちら](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)です．

実際にコンテナ内で作業するには，

1. 事前にコンテナを作る（ターミナルで`./docker/run.sh`を実行する）．
1. vscodeのコマンドパレットから**Remote-Containers: Attach to Running Container**を選択する．
1. 動作中のコンテナ一覧が表示されるので，対象のコンテナを選ぶ．

とします．
vscodeの作業をコンテナ内で行う方法は他にもあります．
これらの詳細を知るにはRemote - Containersの拡張機能について調べましょう．

### デバッグ

**F5キー**でデバッグができます．
コンテナにアタッチしていればコンテナ内でもデバッグが可能です．
詳細な説明はしませんが，非常に便利なので利用しましょう．

デバッグの設定は`.vscode/launch.json`に記述されています．

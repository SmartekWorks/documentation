基本概念
===

SWATHubを含めた各種の自動化プラットフォームでは、自動化するためのシナリオをどう作成するかがとても重要です。SWATHubでは下記のステップでシナリオを作成し、実行します。

1. シナリオに必要な**オペレーション**のタイプを明確にします。SWATHubでは特定なアプリを自動化するための**モデルオペレーション**が基礎となり、該当アプリの画面情報を基にモデルを構築し、オペレーションを定義します。
1. 必要な**モデルオペレーション**もしくは**システムオペレーション**を使って、一連の**ステップ**を定義し、**フロー**もしくは**シナリオ**の組み立てを完成します。
1. シナリオをデバッグや、テスト自動化で利用する場合に、**シナリオ**に必要な入力データを**ケース**で定義します。
1. シナリオをデプロイして運用する場合に、**シナリオ**に必要な入力データを**シナリオデータ**で定義します。

下記は関係のあるいくつか重要なコンセプトを紹介します。

オペレーション
---

SWATHubにオペレーションは毎回フローのステップに呼び出した操作を指しています。この操作のタイプによって、オペレーションを下記に分類します。

* モデルオペレーション<sup>1</sup>：操作の対象アプリをモデリングして、定義したオペレーションです。下記の４種類のアプリタイプのモデリングを対応しています。
  * Webモデル：ブラウザを使ってWebアプリに対して操作するためのモデル。
  * モバイルモデル：モバイル端末を使って、Nativeアプリに対して操作するためのモデル。
  * GUIモデル：GUI画面に対して操作するためのモデル。
  * APIモデル：Webサービスに対して操作するためのモデル。
* システムオペレーション：SWATHubは提供したOSや、ブラウザ、マイクロソフトオフィス、PDFなど汎用的なオペレーションです。

?> 1. 4種類のモデルオペレーションは実際のアプリに対してモデルを構築してオペレーションを定義するものです。詳細について、モデルオペレーションの章を参照してください。

ステップ
---

ステップとはフローもしくはシナリオの中の具体的な操作のことです。この操作はモデルオペレーションやシステムオペレーションでも良いですし、フローの呼び出しでも良いです。

ステップには下記の要素が含まれています。

* コンポーネント：該当ステップの操作を定義するオペレーションもしくはフローの情報。ステップを定義するときにコンポーネントをドラッグ＆ドロップで関連性を定義しています。
* データ：ステップのコンポーネントを実行するための入力データ、実行完了後に出力するデータです。。
* オプションとタイトル：ステップごとに実行の振る舞いを細かく制御する[オプション](flow_step_option)と表示用のタイトルを定義することが可能です。

フロー
---

フローとは業務単位で意味を持つ一連のシナリオをまとめたものです。直接実行することはできませんが、シナリオもしくはその他のフローから呼び出すことが可能です。

フローには下記の要素が含まれています。

* 入出力引数：フローの実行に必要な入力データ、実行後に出力するデータの定義です。
* ステップのリスト：フローを順番に実行する一連のステップです。

通常のフロー以外に、システムオペレーション（例えば、[フロー制御オペレーション](sop_control)のIF/ELSE、WHILE、TRY/CATCHなど）を呼び出す特殊フローもあります。ここではフローブロックと呼びます。定義する場所が違いますが、定義の方法はフローと同じです。

シナリオ
---

シナリオとは一連の操作をまとめたものです。そのため、シナリオはデバッグ、テスト、デプロイ、自動実行<sup>1</sup>の対象です。

シナリオには下記の要素が含まれています。

* 入出力引数：シナリオの実行に必要な入力データ、実行後に出力するデータの定義です。
* ステップのリスト：シナリオを順番に実行する一連のステップです。

?> 1. シナリオを実行するために、シナリオの定義の他にシナリオに必要な入力データを外部から提供する必要があります。例えば、デバッグで必要なケースや、デプロイのシナリオデータ。

ケースとシナリオデータ
---

ケースとはテストやデバッグを目的にしたシナリオに付加する外部データです。ケースのデータはSWATHubロボットがオンライン設計モードのみで利用可能です。

ロボットはオフライン実行モードでシナリオを業務運用で利用する場合に、その外部データをシナリオデータファイルとしてロボットにデプロイする必要があります。
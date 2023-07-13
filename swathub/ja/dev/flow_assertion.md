結果検証
===

手動検証
---

* SWATHubは、スクリーンショット、HTMLソース、ダウンロードされたファイル、Javascriptエラーログなどの豊富なテスト結果のエビデンスを提供し、手作業による検証を容易にします。
* テスト結果のエビデンスは、さらなる検証のために、XLS、HTML、ZIPなどのいくつかの形式でエクスポートできます。
* SWATHubは、テストエビデンスを取得するAPIを提供しています。それらを利用してざまざまの検証ツールが実装できます。弊社が提供した[検証用ツール](#検証用ツール)をベースにさらにカスタマイズすることも可能です。

自動検証
---

SWATHubは、ブラウザのURL、Webページのタイトル、特定のWebオブジェクトのテキストとスタイル、Javascriptポップアップのテキストなど、Webアプリケーションのさまざまな側面に対して自動検証ができます。

* フロー制御の[アサーション](sop_control.md#アサーション)：JavaScriptでフローにある変数などに対して検証。
* ブラウザ機能の[アサーション](sop_browser.md#アサーション)：ウィンドウにある画面の要素やスタイルに対して検証。
* モバイルアプリの[モバイルアサーション](sop_mobileapp.md#モバイルアサーション)：ネイティブのアプリの要素に対して検証。
* Databaseの[アサーション](sop_database.md#アサーション)：データベースの内容に対して検証。

事前に設定した期待値に対する検証の他に、SWATHubは実行結果をベースラインのテスト結果と比較するような検証機能も提供します。スクリーンショット、HTMLソース、ダウンロードされたファイル、APIの戻りなどざまざまな内容が比較対象になります。詳細について、[こちら](flow_step_option.md#stepdiff)を参照して下さい。

検証用ツール
---

テスト機能に関して、SWATHubはあらゆる種類のユーザーシナリオを容易にし、お客様がご利用中のITシステムと統合させるためのさまざまなツールを提供します。 [Github](https://github.com/SmartekWorks)には多くのツールが公開されており、さまざまな要件を満たすためにこれらのツールを利用するために必要な技術サポートを提供しています。

* [テスト結果出力ツール](https://github.com/SmartekWorks/result-export)は、テスト結果をさまざまな形式にエクスポートするためのデスクトップツールです。 各テスト結果は次のいずれかの形式でファイルとしてエクスポートされます。すべてのスクリーンショットとパラメータを含むExcelファイル、すべてのページHTMLファイルを含むzipファイル、検証用のすべてのエビデンスとページナレッジを持つzipファイル。
* [スクリーンショット比較ツール](https://github.com/SmartekWorks/screenshot-diff)は、複数のExcelファイルからスクリーンショットをエクスポートし、1つのExcelファイルに統合してテスターがこれらのテスト結果の違いを簡単に検証できるデスクトップツールです。
* [HTML比較ツール](https://github.com/SmartekWorks/html-diff)は、2回の実行のすべてのHTMLソースを比較するブラウザベースのツールです。 2つのHTMLファイルの違いが強調表示されます。 CSSセレクタを追加すると、タイムスタンプ、フローティングバナーなど、動的コンテンツを比較対象から除外できます。
* [テストシナリオ出力ツール](https://github.com/SmartekWorks/scenarios-export)は、シナリオグループ内のすべてのシナリオの詳細情報をエクスポートするためのサンプル実装です。 シナリオステップは、すべてのネストされたフローとパラメータを含むように拡張されます。出力はCSVテキストファイルです。
* [シナリオグループ出力ツール](https://github.com/SmartekWorks/testset-export)は、シナリオグループ内のすべてのテストシナリオとテストケースをエクスポートするためのサンプル実装です。出力はJSONテキストファイルです
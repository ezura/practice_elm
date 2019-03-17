## elm

### Syntax
`{- text -}`: 複数行コメント
`{-| text -}`; ドキュメントコメント。下に説明対象のものがないとエラーになる。

enum を Custom type と呼ぶ。(0.18 では union type)
associated value を持てる。

`Array` と `List` がある。

#### パイプ

`|>`: 左の値を右の関数に渡していくようなイメージ (method chain のような動き)
`>>`: 関数合成。`|>` と同じ向き
`<|`: `|>` と逆向き
`<<`: `<<` と逆向き

### command
* `elm reactor`: 組み込みサーバ
* `elm make {file} --debug: デバッグモード`
* `elm install elm-community/list-extra`: パッケージのインストール例。elm.json に依存関係が記載される。使いたいファイルで `import List.Extra exposing (..)` して使う。

## VS Code
terminal: Cmd+Shift+`

## 所感

* format が実質決定されてる (他の言語みたいにある程度 linter のルールカスタマイズできない)
  - とはいえ、案外ルール少なそう？
  - スペースの数とか関数の後の改行とかで論争したくないし、elm みたいに指定してしまうの結構ありだと思う。
* Debug.todo
  - runtime で落ちるのか…と思ったけど、--optimize フラグ使った時はコンパイルできないので安心した。製品版は --optimize するだろうから、結果的に開発環境でだけ使う約束が強制されて良さそう。
* HTML の仕様的に正しくない構造でも作れちゃうっぽい。

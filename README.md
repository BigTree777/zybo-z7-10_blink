# Zybo Z7-10 RGB LED Blink

Zybo Z7-10のRGB LEDを一定間隔で切り替える, シンプルなVivadoプロジェクトです.

## 対象環境

- ボード: Digilent Zybo Z7-10
- FPGA: AMD/Xilinx Zynq-7000 `xc7z010clg400-1`
- 開発ツール: Vivado 2026.1
- 記述言語: Verilog HDL
- システムクロック: 125 MHz

## 動作

26ビットカウンタで125 MHzのシステムクロックを分周し, 約1.86 HzでRGB LEDの表示を切り替えます.

| 順番 | `LED_RGB` | 表示色 |
|---:|:---:|---|
| 1 | `3'b100` | 赤 |
| 2 | `3'b010` | 緑 |
| 3 | `3'b001` | 青 |
| 4 | `3'b111` | 白 |
| 5 | `3'b000` | 消灯 |

約2.684秒で一巡し, その後は同じパターンを繰り返します.

`RST`はHighアクティブの同期リセットです.
リセットするとカウンタが0に戻り, LEDは赤になります.

## ピン割り当て

すべてのI/Oに`LVCMOS33`を使用します.

| 信号 | FPGAピン | 用途 |
|---|---|---|
| `CLK` | K17 | 125 MHzシステムクロック |
| `RST` | Y16 | リセット入力 |
| `LED_RGB[2]` | V16 | 赤色LED |
| `LED_RGB[1]` | F17 | 緑色LED |
| `LED_RGB[0]` | M17 | 青色LED |

## プロジェクト構成

```text
.
├── blink.xpr
└── blink.srcs
    ├── constrs_1/new/blink.xdc
    └── sources_1/new/blink.v
```

- `blink.xpr`: Vivadoプロジェクトファイル
- `blink.v`: トップモジュールとLED制御回路
- `blink.xdc`: クロック条件およびピン制約

## ビルドと書き込み

1. Vivado 2026.1で`blink.xpr`を開きます.
2. **Generate Bitstream**を実行します.
3. Zybo Z7-10を接続し, **Open Hardware Manager**から生成したビットストリームを書き込みます.

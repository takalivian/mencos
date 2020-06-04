# トップカテゴリー
skin, make, hair, shaver, fragrance, bath = Category.create([{name: "スキンケア"}, {name: "メイクアップ"}, {name: "ヘアスタイリング剤"}, {name: "シェーバー"}, {name: "フレグランス"}, {name: "バス用品"}])

# スキンケア
skin_wash, lotion, emulsion, all_in, sunscreen, lip, skin_other = skin.children.create([{name: "洗顔"}, {name: "化粧水"}, {name: "乳液"}, {name: "オールインワン"}, {name: "日焼け止め"}, {name: "リップクリーム"}, {name: "その他"}])

# メイクアップ
base, face, make_other = make.children.create([{name: "ベースメイク"}, {name: "フェイスメイク"}, {name: "その他"}])

# ヘアスタイリング剤
wax, color, iron, hair_other = hair.children.create([{name: "ワックス"}, {name: "カラー剤"}, {name: "アイロン"}, {name: "その他"}])

# シェーバー
electric, razor, cream, shaver_other = shaver.children.create([{name: "電動"}, {name: "カミソリ"}, {name: "シェーバークリーム"}, {name: "その他"}])

# フレグランス
perfume, antiperspirant, aroma, fragrance_other = fragrance.children.create([{name: "香水"}, {name: "制汗剤"}, {name: "アロマオイル"}, {name: "その他"}])

# バス用品
shampoo, rinse, body, hairdryer, bath_other = bath.children.create([{name: "シャンプー"}, {name: "リンス"}, {name: "ボディウォッシュ"}, {name: "ドライヤー"}, {name: "その他"}])
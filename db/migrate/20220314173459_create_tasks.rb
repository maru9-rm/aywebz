class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      # 学年 
      t.integer :grade, null: false
      # 科目名
      t.string :title, null: false 
      # テキスト名やプリント名
      t.string :source
      # 主にページ数などの詳細情報
      t.string :detail
      # 合格基準
      t.string :criterion
      # 科目名
      t.integer :subject
      # 実施日
      t.date :testday, default: -> { 'NOW()' }
      # 達成日
      t.date :passday
      # 状態 終わったらdoneとかにして非表示にする予定
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end

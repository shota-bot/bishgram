class Member < ActiveHash::Base
  self.data = [
    { id: 1, name: '___' },
    { id: 2, name: 'アイナ・ジ・エンド' },
    { id: 3, name: 'セントチヒロ・チッチ' },
    { id: 4, name: 'モモコグミカンパニー' },
    { id: 5, name: 'ハシヤスメ・アツコ' },
    { id: 6, name: 'リンリン' },
    { id: 7, name: 'アユニ・D' },
    { id: 8, name: '清掃員' }
  ]

  include ActiveHash::Associations
  has_many :post_member_relations

  def posts
    post_member_relations.map(&:post)
  end
end

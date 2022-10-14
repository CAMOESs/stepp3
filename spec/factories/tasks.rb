# 「FactoryBotを使用します」という記述
FactoryBot.define do
    # 作成するテストデータの名前を「task」とします
    # 「task」のように実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを作成されます
    #factory :task do
     # title { '書類作成' }
      #content { '企画書を作成する。' }
    #end
    # 作成するテストデータの名前を「second_task」とします
    # 「second_task」のように存在しないクラス名をつける場合、`class`オプションを使ってどのクラスのテストデータを作成するかを明示する必要がります
    #factory :second_task, class: Task do
     # title { 'メール送信' }
      #content { '顧客へ営業のメールを送る。' }
    #end

    factory :first_task, class: Task do
      title { 'メール送信' }
      content { '顧客へ営業のメールを送る。' }
      deadline_on {'2025-02-18'}
      priority {'中'}
      status {'未着手'}
    end
    factory :second_task, class: Task do
      title { 'メール送信' }
      content { '顧客へ営業のメールを送る。' }
      deadline_on {'2025-02-17'}
      priority {'高'}
      status {'着手中'}
    end
    factory :third_task, class: Task do
      title { 'メール送信' }
      content { '顧客へ営業のメールを送る。' }
      deadline_on {'2025-02-16'}
      priority {'低'}
      status {'完了'}
    end
    			
  end
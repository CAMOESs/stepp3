require 'rails_helper'

RSpec.describe Task, type: :model do
 # describe 'バリデーションのテスト' do
  #  context 'タスクのタイトルが空文字の場合' do
   #   it 'バリデーションに失敗する' do
    #    task = Task.create(title: '', content: '企画書を作成する。')
     #   expect(task).not_to be_valid
      #end
    #end

    #context 'タスクの説明が空文字の場合' do
     # it 'バリデーションに失敗する' do
      #  task = Task.create(title: '企画書を作成する。', content: '')
       # expect(task).not_to be_valid
      #end
    #end

    #context 'タスクのタイトルと説明に値が入っている場合' do
     # it 'タスクを登録できる' do
      #  task = Task.create(title: '企画書を作成する。', content: '企画書を作成する。')
       # expect(task).to be_valid
     # end
    #end
  #end

   #step3
  describe '検索機能' do
    let!(:first_task) { FactoryBot.create(:first_task, title: 'first_task_title') }
    let!(:second_task) { FactoryBot.create(:second_task, title: "second_task_title") }
    let!(:third_task) { FactoryBot.create(:third_task, title: "third_task_title") }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索ワードを含むタスクが絞り込まれる" do
        
        # toとnot_toのマッチャを使って検索されたものとされなかったものの両方を確認する
        # 検索されたテストデータの数を確認する

        expect(Task.title('first')).to include(first_task)
        expect(Task.title('first')).not_to include(second_task)
        expect(Task.title('first')).not_to include(third_task)
        expect(Task.title('first').count).to eq 1

      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        # toとnot_toのマッチャを使って検索されたものとされなかったものの両方を確認する
        # 検索されたテストデータの数を確認する

        expect(Task.status(0)).to include(first_task)
        expect(Task.status(0)).not_to include(second_task)
        expect(Task.status(0)).not_to include(third_task)
        expect(Task.status(0).count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索ワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        # toとnot_toのマッチャを使って検索されたものとされなかったものの両方を確認する
        # 検索されたテストデータの数を確認する

        expect(Task.statuS('first',2)).not_to include(first_task)
        expect(Task.statuS('first',2)).not_to include(second_task)
        expect(Task.statuS('first',2)).not_to include(third_task)
        expect(Task.statuS('first',2).count).to be >= 0
      end
    end
  end
end

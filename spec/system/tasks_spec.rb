require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do

    describe '一覧表示機能' do
        #context '一覧画面に遷移した場合' do
        #    it '登録済みのタスク一覧が表示される' do
                # テストで使用するためのタスクを登録
         #       FactoryBot.create(:task)
                # タスク一覧画面に遷移
          #      visit tasks_path
                # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
           #     expect(page).to have_content '書類作成'
                # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
            #end
        #end
        describe 'ソート機能' do
          let!(:first_task) { FactoryBot.create(:first_task, title: 'first_task_title') }
          let!(:second_task) { FactoryBot.create(:second_task, title: "second_task_title") }
          let!(:third_task) { FactoryBot.create(:third_task, title: "third_task_title") }
            context '「終了期限でソートする」というリンクをクリックした場合' do
              it "終了期限昇順に並び替えられたタスク一覧が表示される" do
                # allメソッドを使って複数のテストデータの並び順を確認する
                visit tasks_path
                #task_list = all('body tr')
                len = page.all('.XPath').length
                tab = []
                task_list = page.all('.XPath')
                len.times do |n|
                  tab << task_list[n].text
                end
                tab1 = tab.sort {|a, b| a <=> b}
                expect(tab).to eq(tab1)
                
              end
            end
            context '「優先度でソートする」というリンクをクリックした場合' do
              it "優先度の高い順に並び替えられたタスク一覧が表示される" do
                # allメソッドを使って複数のテストデータの並び順を確認する
                visit "http://localhost:3000/?class=btn+btn-link&sort_priority=true"
                #task_list = all('body tr')
                len = page.all('.XPy').length
                tab = []
                task_list = page.all('.XPy')
                len.times do |n|
                  tab << task_list[n].text
                end
                expect(tab.uniq!).to eq(["低", "中", "高"])
              end
            end
        end
          describe '検索機能' do
            let!(:first_task) { FactoryBot.create(:first_task, title: 'first_task_title') }
            let!(:second_task) { FactoryBot.create(:second_task, title: "second_task_title") }
            let!(:third_task) { FactoryBot.create(:third_task, title: "third_task_title") }
            context 'タイトルであいまい検索をした場合' do
              it "検索ワードを含むタスクのみ表示される" do
                # toとnot_toのマッチャを使って表示されるものとされないものの両方を確認する
                search = Task.titlE('first')
                len = page.all('.XPt').length
                tab = []
                task_list = page.all('.XPt')
                len.times do |n|
                  tab << task_list[n].text
                end
                tab.length.times{|i| expect( i).to include("first")}
              end
            end
            context 'ステータスで検索した場合' do
              it "検索したステータスに一致するタスクのみ表示される" do
                # toとnot_toのマッチャを使って表示されるものとされないものの両方を確認する
                search = Task.statuS(0)
                len = page.all('.XPs').length
                tab = []
                task_list = page.all('.XPs')
                len.times do |n|
                  tab << task_list[n].text
                end
                tab.length.times{|i| expect( i).to include("未着手")}
              end
            end
            context 'タイトルとステータスで検索した場合' do
              it "検索ワードをタイトルに含み、かつステータスに一致するタスクのみ表示される" do
                # toとnot_toのマッチャを使って表示されるものとされないものの両方を確認する
                search = Task.StatuS(:second_task_title,1)
                len = page.all('.XPs').length
                tab = []
                task_list = page.all('.XPs')
                len.times do |n|
                  tab << task_list[n].text
                end
                tab.length.times{|i| expect( i).to include("着手中")}
                len = page.all('.XPt').length
                tab = []
                task_list = page.all('.XPt')
                len.times do |n|
                  tab << task_list[n].text
                end
                tab.length.times{|i| expect( i).to include("second_task_title")}
                
              end
            end
          end
    end

    #describe '登録機能' do
        #context 'タスクを登録した場合' do
         #   it '登録したタスクが表示される' do
                # テストで使用するためのタスクを登録
          #      FactoryBot.create(:task,title: 'bien')
                # タスク一覧画面に遷移
          #      visit root_path
                # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
          #      expect(page).to have_content 'bien'
                # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
         #   end
       # end
  #  end
=begin
    describe '詳細表示機能' do
        context '任意のタスク詳細画面に遷移した場合' do
            it 'そのタスクの内容が表示される' do
                # テストで使用するためのタスクを登録
                @task = FactoryBot.create(:task, content: 'content')
                # タスク一覧画面に遷移
                visit task_path(@task.id)
                # visit（遷移）したpage（この場合、タスク一覧画面）に"書類作成"という文字列が、have_content（含まれていること）をexpect（確認・期待）する
                expect(page).to have_content 'content'
                # expectの結果が「真」であれば成功、「偽」であれば失敗としてテスト結果が出力される
            end
        end
    end

    describe 'list display' do
        context 'fonction when transitioning to' do
            it 'the list screen a list of registered tasks is displayed' do
                @task = FactoryBot.create(:task, content: 'content')
                visit new_task_path
                expect(page).not_to have_content 'New Task Page'
            end
        end
    end

    describe 'registration function' do
        context 'when you register a task' do
            it 'the registered tasks is displayed' do
                @task = FactoryBot.create(:task, content: 'content')
                visit tasks_path
                expect(page).to have_content @task.title
            end
        end
    end

    describe 'detailed display' do
        context 'fonction when transitioning to any task details screen' do
            it 'the contents of the task are displayed' do
                @task = FactoryBot.create(:task, content: 'content')
                visit task_path(@task.id)
                expect(page).to have_content @task.content
            end
        end
    end

    describe 'list display function' do
        context 'when transitioning to the context list screen' do
            it 'created task is displayed in descending order of creation date' do
                @task = FactoryBot.create(:task, content: 'content',created_at: '2022/10/04 11:26')
                @task1 = FactoryBot.create(:task, content: 'content',created_at: '2022/08/03 11:26')
                @task2 = FactoryBot.create(:task, content: 'content',created_at: '2022/09/02 16:26')
                @task = FactoryBot.create(:task, content: 'content',created_at: '2022/05/01 15:26')

                visit tasks_path
                #task_list = all('body tr')
                len = page.all('.XPath').length
                tab = []
                task_list = page.all('.XPath')
                len.times do |n|
                    tab << task_list[n].text
                end
                tab1 = tab.sort {|a, b| b <=> a}
                expect(tab).to eq(tab1)
            end
        end

        context 'if you create a new task do' do
            it 'new tasks appear on  top' do
                @task = FactoryBot.create(:task, content: 'content',created_at: Date.current)
                sleep 1
                @task1 = FactoryBot.create(:task, content: 'content',created_at: Date.current)
                sleep 1
                @task2 = FactoryBot.create(:task, content: 'content',created_at: Date.current)
                sleep 1
                @task3 = FactoryBot.create(:task, content: 'content',created_at:  Date.current)
                visit tasks_path
                #task_list = all('body tr')
                len = page.all('.XPath').length
                tab = []
                task_list = page.all('.XPath')
                len.times do |n|
                    tab << task_list[n].text
                end
                tab1 = tab.sort {|a, b| b <=> a}
                expect(@task3.created_at).to eq(tab1[1])
            end
        end
    end

    describe 'List display function' do
        # let!を使ってテストデータを変数として定義することで、複数のテストでテストデータを共有できる
        let!(:task) { FactoryBot.create(:task, title: 'task_title') }
        # 「When transitioning to the list screen」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
        before do
          visit tasks_path
        end
   
       context 'When transitioning to the list screen' do
         it 'The created task list is displayed' do
           # task = FactoryBot.create(:task, title: 'task')
           # visit tasks_path
           # omit
           expect(page).to have_content task.title
         end
       end
   
       context '新たにタスクを作成した場合' do
         it '新しいタスクが一番上に表示される' do
           # task = FactoryBot.create(:task, title: 'task')
           # visit tasks_path
           # omit
         end
       end
     end
=end
end

describe 'mixin_comment:verify' do
  before do
    Rails.application.load_tasks
  end

  let :task do
    Rake::Task[self.class.description]
  end

  it 'has errors' do
    expect { task.invoke }.to_not raise_error
  end
end

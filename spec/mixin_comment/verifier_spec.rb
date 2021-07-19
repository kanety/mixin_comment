describe MixinComment::Verifier do
  let :dir do
    Rails.root.join('app').to_s
  end

  it 'verifies' do
    result = MixinComment.verify(dir).group_by(&:label)

    expect(result['required methods'].map(&:errors)).to include([[Item, 'method2']])
    expect(result['required class methods'].map(&:errors)).to include([[Item, 'method2']])
    expect(result['required override methods'].map(&:errors)).to include([[Item, 'override_method2']])
    expect(result['required columns'].map(&:errors)).to include([[Record, 'column2']])
    expect(result['required associations'].map(&:errors)).to include([[Record, 'assoc2']])
  end
end

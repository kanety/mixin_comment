describe MixinComment::Part do
  context 'without error' do
    let :part do
      MixinComment::Part.new('A', 'required methods', ['method'])
    end

    it 'has errors' do
      expect(part.errors).to eq([])
      expect(part.has_errors?).to eq(false)
    end
  end

  context 'with error' do
    let :part do
      MixinComment::Part.new('A', 'required methods', ['method']).tap do |part|
        part.errors << 'error'
      end
    end

    it 'has errors' do
      expect(part.errors).to eq(['error'])
      expect(part.has_errors?).to eq(true)
    end
  end
end

module ResponseMatcher
  describe Settings do
    subject { ResponseMatcher::Settings.config }

    context 'has default settings' do
      it { expect(subject.helpers).to eq([]) }
      it { expect(subject.directory).to eq('spec/schemas') }
    end
  end
end

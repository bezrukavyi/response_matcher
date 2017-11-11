module ResponseMatcher
  describe ParseSchema do
    context 'Render schema' do
      before do
        allow(Settings.config).to receive(:directory).and_return('spec/fixtures/schemas')
      end

      let(:dummy) { double('dummy', name: 'name', id: 'id') }

      it 'without attributes' do
        subject = described_class.new('without_attributes')
        expect(subject.response).to eq(data: {})
      end

      it 'with attributes' do
        subject = described_class.new('with_attributes', object: dummy)

        expect(subject.response).to eq(data: {
          id: dummy.id,
          name: dummy.name
        })
      end

      it 'with nested schema' do
        nested_dummy = double('nested_dummy', name: 'nested_name', id: 'nested_id')
        subject = described_class.new('with_nested_schema', object: dummy, nested_object: nested_dummy)

        expect(subject.response).to eq(
          {
            data: {
              id: dummy.id,
              name: dummy.name
            },
            nested_data: {
              data: {
                id: nested_dummy.id,
                name: nested_dummy.name
              }
            }
          }
        )
      end
    end
  end
end

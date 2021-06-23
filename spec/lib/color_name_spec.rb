# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ColorName do
  describe '.get' do
    let(:subject) { ColorName.get(hex) }

    context 'with valid short hex' do
      let(:hex) { '#f00' }

      it 'returns proper name of color' do
        expect(subject).to eq('Red')
      end
    end

    context 'with valid full hex' do
      let(:hex) { '#e02253' }

      it 'returns proper name of color' do
        expect(subject).to eq('Amaranth')
      end
    end

    context 'with invalid hex' do
      let(:hex) { '#g00' }

      it 'raises InvalidColor error' do
        expect { subject }.to raise_error(ArgumentError, 'Invalid hex: "#g00"')
      end
    end
  end
end

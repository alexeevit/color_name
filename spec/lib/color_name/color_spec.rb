# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ColorName::Color do
  let(:hex) { '#FFC300' }
  let(:subject) { ColorName::Color.new(hex) }

  describe '#initialize' do
    context 'with full hex' do
      it 'creates object' do
        expect { subject }.not_to raise_error
      end
    end

    context 'with short hex' do
      let(:hex) { '#FF0' }

      it 'creates object' do
        expect { subject }.not_to raise_error
      end
    end

    context 'with invalid hex' do
      let(:hex) { '#GF0' }

      it 'raises InvalidColor error' do
        expect { subject }.to raise_error(ColorName::InvalidColor)
      end
    end
  end

  describe '#name' do
    context 'with amber' do
      it 'returns proper name of color' do
        expect(subject.name).to eq('Amber')
      end
    end

    context 'with amaranth' do
      let(:hex) { '#e02253' }

      it 'returns proper name of color' do
        expect(subject.name).to eq('Amaranth')
      end
    end
  end

  describe '#rgb' do
    let(:rgb) { [255, 195, 0] }

    it 'returns correct value' do
      expect(subject.rgb).to eq(rgb)
    end
  end

  describe '#hsl' do
    let(:hsl) { [46, 1, 0.5] }

    it 'returns correct value' do
      expect(subject.hsl).to eq(hsl)
    end
  end
end

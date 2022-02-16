# frozen_string_literal: true

require 'spec_helper'
indent_default = '  '

describe 'bareos_settings' do
  context 'type is an hashed addresses value' do
    %w[addresses].each do |type|
      it 'runs with compatible values' do
        val = {
          'ip' => {
            'addr' => '1.2.3.4',
            'port' => '1205'
          }
        }
        result = "#{indent_default}Test = {
#{indent_default}#{indent_default}ip = {
#{indent_default}#{indent_default}#{indent_default}addr = 1.2.3.4
#{indent_default}#{indent_default}#{indent_default}port = 1205
#{indent_default}#{indent_default}}
#{indent_default}}"
        expect(subject).to run.with_params([val, 'Test', type, true]).and_return(result)
      end
    end
  end

  context 'type is an hashed value' do
    %w[include_exclude_item runscript hash].each do |type|
      it 'runs with compatible values' do
        val = {
          'My Directive' => 'content',
          'Array' => %w[a1 b2],
          'Second Hash' => {
            'Res' => 'Val'
          }
        }
        result = "#{indent_default}Test {
#{indent_default}#{indent_default}My Directive = content
#{indent_default}#{indent_default}Array = a1
#{indent_default}#{indent_default}Array = b2
#{indent_default}#{indent_default}Second Hash {
#{indent_default}#{indent_default}#{indent_default}Res = Val
#{indent_default}#{indent_default}}
#{indent_default}}"
        expect(subject).to run.with_params([val, 'Test', type, true]).and_return(result)
      end
    end
  end

  context 'value can be an array' do
    it 'any type with _list suffix' do
      val = %w[first second]
      result = "#{indent_default}Test = first
#{indent_default}Test = second"
      expect(subject).to run.with_params([val, 'Test', 'string_noquote_list', true]).and_return(result)
    end

    it 'type is runscript_short' do
      val = %w[first second]
      result = "#{indent_default}Test = \"first\"
#{indent_default}Test = \"second\""
      expect(subject).to run.with_params([val, 'Test', 'runscript_short', true]).and_return(result)
    end

    it 'type is acl' do
      val = %w[first second]
      result = "#{indent_default}Test = first
#{indent_default}Test = second"
      expect(subject).to run.with_params([val, 'Test', 'acl', true]).and_return(result)
    end

    it 'type is runscript' do
      val = [
        { 'Test A' => 'value' },
        { 'Test B' => 'value' }
      ]
      result = "#{indent_default}Test {
#{indent_default}#{indent_default}Test A = value
#{indent_default}}
#{indent_default}Test {
#{indent_default}#{indent_default}Test B = value
#{indent_default}}"
      expect(subject).to run.with_params([val, 'Test', 'runscript', true]).and_return(result)
    end
  end
end

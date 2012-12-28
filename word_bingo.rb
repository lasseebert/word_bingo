#!/usr/bin/env ruby

require 'prawn'
require "prawn/measurement_extensions"

TOKENS_PER_BOARD = 15
TOKENS_PER_ROW = 5
BOARDS_PER_PAGE = 4

def print_usage
  puts 'Usage: word_bingo <word-file> <number of boards>'
  exit 1
end

# Must be two argument
if ARGV.length != 2
  print_usage
end

# Assign arguments
file_path = ARGV[0]
number_of_boards = ARGV[1].to_i

# File must exist
unless File.exists? file_path
  puts "File does not exists: #{file_path}"
  exit 1
end

# number of boards must be positive
if number_of_boards < 1
  puts 'number of boards must be positive'
  exit 1
end

# Read file, split in lines
tokens = IO.readlines file_path
tokens.each do |token|
  token.gsub! /\n/, ''
end
tokens = tokens.select { |token| !(token =~ /^#/ || token == '') }
if tokens.length < TOKENS_PER_BOARD
  puts "There should be at least #{TOKENS_PER_BOARD} lines in the file"
  exit 1
end

# Make bingo boards
boards = []
(1..number_of_boards).each do
  boards << tokens.shuffle[0...TOKENS_PER_BOARD]
end

# Create pdf doc
pdf_options = {
  page_size: 'A4', 
  left_margin: 1.cm, 
  right_margin: 1.cm,
  top_margin: 1.cm,
  bottom_margin: 1.cm
}
table_options = {
  cell_style: {
    padding_top: 0.5.cm,
    padding_bottom: 0.5.cm
  }
}
pdf = Prawn::Document.generate('bingo.pdf', pdf_options) do |pdf|
  boards.each_with_index do |board, index|
    board_layout = board.each_slice(TOKENS_PER_ROW).to_a
    pdf.table(board_layout, table_options) do |table|
      table.width = 19.cm
    end

    if index < boards.length - 1
      if index % BOARDS_PER_PAGE == BOARDS_PER_PAGE - 1
        pdf.start_new_page
      else
        pdf.move_down 2.cm
      end
    end
  end
end



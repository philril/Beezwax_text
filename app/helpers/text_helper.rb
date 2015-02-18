helpers do

  def fix_spaces(input)
    result = {
      'spaces_added' => {"count" => 0, "index" => []},
      'spaces_removed' => {"count" => 0, "index" => []}
    }

    text = input.split('')
    text.each_with_index do |char, index|
      if char == "." && index != input.length - 1
        if text[index + 1] != " "
          text.insert(index + 1, " ")
          result['spaces_added']['count'] += 1
          result['spaces_added']['index'] << index + 1
        end
      elsif char == " " && index > 0
        if text[index - 1] == " "
          text[index] = ""
          result['spaces_removed']['count'] += 1
          result['spaces_removed']['index'] << index
        end
      end
    end
    result['output'] = text.join("")
    result
  end

end
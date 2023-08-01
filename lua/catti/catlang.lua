M = {}

local function translate_word_to_catlang(word)
    local length_of_word = #word

    if length_of_word <= 1 then
        if word == "q" then
            return word
        end
        return "e"

    elseif length_of_word <= 2 then
        local word_chooser = math.random(4)
        if word_chooser == 1 then
            return "me"
        elseif word_chooser == 2 then
            return "mi"
        elseif word_chooser == 3 then
            return "mo"
        else
            return "ee"
        end

    elseif length_of_word <= 5 then
        local word_chooser = math.random(7)
        if word_chooser == 1 then
            return "Mee"
        elseif word_chooser == 2 then
            return "meow"
        elseif word_chooser == 3 then
            return "meoww"
        elseif word_chooser == 4 then
            return "meeow"
        elseif word_chooser == 5 then
            return "meoOw"
        elseif word_chooser == 6 then
            return "mmeoW"
        else
            return "meeee"
        end

    elseif length_of_word <= 10 then
        local word_chooser = math.random(7)
        if word_chooser == 1 then
            return "meeeeee"
        elseif word_chooser == 2 then
            return "MEOW"
        elseif word_chooser == 3 then
            return "MEEeeoW"
        elseif word_chooser == 3 then
            return "meow"
        elseif word_chooser == 4 then
            return "mEooWwww"
        elseif word_chooser == 5 then
            return "MeoWWwwO"
        elseif word_chooser == 6 then
            return "meeeeeeooOOW"
        else
            return "mEEEEeeee Oww"
        end
    else
        return "PSSsssT"
    end
end

M.translate_to_catlang = function(line)
    line = line or " "
    -- line = a string
    local word_pattern = "%w+"

    local translated_line = line:gsub(word_pattern, translate_word_to_catlang)

    return translated_line
end

return M

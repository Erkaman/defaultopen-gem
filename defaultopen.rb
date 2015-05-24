module DefaultOpen

  def DefaultOpen.open(filename)

    if  (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil then
      # windows
      cmd = ""
    elsif (/darwin/ =~ RUBY_PLATFORM) != nil
      cmd = "open #{filename}"
      # OS X
    else
      cmd = ""
      # else, we assume Linux/Unix.
    end

    system(cmd)
  end
end

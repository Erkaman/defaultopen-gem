module DefaultOpen

  def DefaultOpen.open(filename)

    if  (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil then
      # windows
      return system "start #{filename}"
    elsif (/darwin/ =~ RUBY_PLATFORM) != nil
      # OS X
      return system "open #{filename}"
    else
      # else, we assume Linux/Unix.

      if system("xdg-open #{filename}") != nil then
        return true
      end

      if system("gnome-open #{filename}") != nil then
        return true
      end

      if system("kfmclient exec #{filename}") != nil then
        return true
      end

      return false

    end
  end
end

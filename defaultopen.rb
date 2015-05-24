module DefaultOpen

  def DefaultOpen.open(filename)

    if  (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil then
      # windows
      cmd = ""
    elsif (/darwin/ =~ RUBY_PLATFORM) != nil
      return system "open #{filename}"
      # OS X
    else
      # else, we assume Linux/Unix.

      if system "xdg-open #{filename}" != nil then
        return true
      end

      if system "gnome-open #{filename}" != nil then
        return true
      end

      if system "kfmclient exec #{filename}" != nil then
        return true
      end

      return false

    end
  end
end

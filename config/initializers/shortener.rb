Shortener::Regexp = /[#{Shortener::CHARSETS[Shortener.charset].join}]{#{Shortener.unique_key_length}}/

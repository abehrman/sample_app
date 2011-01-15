module Paperclip
  class Polaroid < Processor

    def initialize(file, options, attachment)
      super
      @file = file
      @instance = options[:instance]
      defaults = {
        :shadow_color => "#9F9B92",
        :shadow_offsets => "75x3+4+5",
        :rotation => rand(10) - 5,
        :border_color => "#e0e0e0",
        :border => "8x8",
        :background => "#ffffff",
        :polaroid => true
      }
      @options = defaults.merge(options)
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
    end

    def make
      return @file unless options[:polaroid] == true

      src = @file
      dst = Tempfile.new([@basename, @format].compact.join("."))
      dst.binmode
      
      command = <<-end_command
"#{ File.expand_path(src.path) }[0]"
#{ transformation_command }
"#{ File.expand_path(dst.path) }"
end_command
      
      begin
        success = Paperclip.run("convert", command.gsub(/\s+/, " ").gsub("(", "\\\\(").gsub(")", "\\\\)"))
      rescue PaperclipCommandLineError
       raise PaperclipError, "There was an error processing the thumbnail for #{@basename}" if @whiny
      end
      dst
    end
    
    # Returns the command ImageMagick's +convert+ needs to transform the image
    # into the thumbnail.
    def transformation_command
      trans = "-bordercolor \"#{@options[:border_color]}\""
      trans << " -border #{@options[:border]}"
      trans << " ( +clone -background \"#{@options[:shadow_color]}\" -shadow #{@options[:shadow_offsets]} )"
      trans << " +swap -background \"#{@options[:background]}\" -layers \"merge\" +repage"
      trans << " -rotate \"#{@options[:rotation]}\""
      trans << " -trim"
      trans
    end
    
  end
end
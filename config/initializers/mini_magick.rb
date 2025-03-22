# Configure mini_magick as a replacement for RMagick
require 'mini_magick'

# Set path to ImageMagick if needed
if Gem.win_platform?
  MiniMagick.configure do |config|
    # Try to find ImageMagick in common Windows installation paths
    possible_paths = [
      "C:/Program Files/ImageMagick-7.1.1-Q16-HDRI",
      "C:/Program Files/ImageMagick-7.1.1-Q16",
      "C:/Program Files/ImageMagick-7.1.0-Q16-HDRI",
      "C:/Program Files/ImageMagick-7.0.11-Q16-HDRI"
    ]
    
    # Use the first existing path
    im_path = possible_paths.find { |path| Dir.exist?(path) }
    config.cli_path = im_path if im_path
  end
end

# Add RMagick compatibility methods if needed by application code
module RMagickCompat
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def read(file_path)
      MiniMagick::Image.open(file_path)
    end
  end
  
  def write(file_path)
    self.write(file_path)
  end
end

# Create a simple compatibility layer if needed
module Magick
  class Image
    include RMagickCompat
  end
end

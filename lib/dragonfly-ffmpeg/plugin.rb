#
# Author:: Jamie Winsor (<jamie@vialstudios.com>)
# Copyright:: 2011, En Masse Entertainment, Inc
# License:: Apache License, Version 2.0
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module EnMasse
  module Dragonfly
    module FFMPEG
      class Plugin
        
        def call(app, opts={})
            app.add_analyser :video_properties, FFMPEG::Analyser.new
            app.add_analyser :frame_rate do |content|
              content.analyse(:video_properties).frame_rate(content)
            end  
        end
        
      end  
    end
  end
end

require 'shoes'
Shoes.app(title: "Desktop Background to Screen Saver", width: 600, height: 400, :align => 'center') do
  background white
  stack margin: 10 do
    stack margin: 10 do
      background gainsboro
      subtitle "Click to Install or Uninstall\n", :align => 'center'
    end
  end


  stack align: 'center'
    flow do
      button 'Click to install', size: 29, :margin_left => '65%' do
      @out = `./app/install_driver.sh`
      end
      button 'Click to uninstall', size: 29, :margin_left => '185%' do
      @out = `./app/uninstall_driver.sh`
      end
    end

    flow do
      stack width: 65 do
        #note: image numbers are not unique. Maybe use classes to solve this problem.
        @image2 = image 'images/install.png',:margin_left => '33%'.click do |button|
          @out = `./app/install_driver.sh`
        end
      end
      stack width: 100 do
        @image = image 'images/uninstall.png',:margin_left => '260%'
        @image.click do |button|
            @out = `./app/uninstall_driver.sh`
        end
      end
  end

#  stack margin: 10 do
#    background gainsboro
#    subtitle "I just want to build"
#  end
end

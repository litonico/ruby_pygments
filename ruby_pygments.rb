require 'posix/spawn'
require 'timeout'

module Ruby_Pygments
    include POSIX::Spawn
    extend self

    path = File.expand_path('../',__FILE__)
    script = "python3 #{path}/python_interface.py"

    codestr = 'print(x)'
    lexerstr = 'python'
    formatterstr = 'html'

    @pid, @in, @out, @err = popen4(script)
    Timeout::timeout(8){
        @in.write("{
                    'code': '#{codestr}',
                    'formatter': '#{formatterstr}',
                    'lexer': '#{lexerstr}',
                    }")
        @in.close
        puts @out.read
    }

    py_error = @err.read
    if not py_error.empty?
        raise "Python Exception: #{py_error}"
    end
    @err.close
    
end

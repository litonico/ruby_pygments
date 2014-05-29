require 'posix/spawn'

module Ruby_Pygments
    include POSIX::Spawn
    extend self

    script = "python3 python_interface.py"
    @pid, @in, @out, @err = popen4(script)
    puts @out.read
    puts @err.read
end

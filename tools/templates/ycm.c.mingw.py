import os
import ycm_core

flags = [
    '-Wall'
    , '-Wextra'
    , '-Wno-long-long'
    , '-Wno-variadic-macros'
    , '-fexceptions'
    , '-DNDEBUG'
    , '-DUSE_CLANG_COMPLETER'
    , '-std=c99'
    , '-x'
    , 'c'
    , '-isystem'
    , 'D:/MinGW/lib/gcc/mingw32/4.8.1/include'
    , '-isystem'
    , 'D:/MinGW/lib/gcc/mingw32/4.8.1/include-fixed'
    , '-isystem'
    , 'D:/MinGW/mingw32/include'
    , '-isystem'
    , 'D:/MinGW/include'
    , '-I'
    , '.'
]

compilation_database_folder = ''
if compilation_database_folder:
    database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
    database = None


def DirectoryOfThisScript():
    return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
    if not working_directory:
        return list( flags )
    new_flags = []
    make_next_absolute = False
    path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
    for flag in flags:
        new_flag = flagi
        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith( '/' ):
                new_flag = os.path.join( working_directory, flag )i
        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                breaki
            if flag.startswith( path_flag ):
                path = flag[ len( path_flag ): ]
                new_flag = path_flag + os.path.join( working_directory, path )
                breaki
        if new_flag:
          new_flags.append( new_flag )
    return new_flags


def FlagsForFile( filename ):
    if database:
        # Bear in mind that compilation_info.compiler_flags_ does NOT return a
        # python list, but a "list-like" StringVec object
        compilation_info = database.GetCompilationInfoForFile( filename )
        final_flags = MakeRelativePathsInFlagsAbsolute(
            compilation_info.compiler_flags_,
            compilation_info.compiler_working_dir_ )
    else:
        relative_to = DirectoryOfThisScript()
        final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )
    return {
        'flags': final_flags,
        'do_cache': True
    }

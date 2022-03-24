Content-Type: multipart/mixed; boundary="===============3365167801484412722=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyndbg-next 6/7] include/linux/cpp_magic.h:224:9: sparse: this was the original definition
Date: Thu, 24 Mar 2022 23:44:15 +0800
Message-ID: <202203242303.jFVYHAkh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3365167801484412722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyndbg-next
head:   e603de8993c46111c3ceeee8a8b9d5e7fa9af7cd
commit: bd35fd3540c38d57ed3f80330e0f76417a4fa9e3 [6/7] dyndbg: WIP use symb=
olic class names
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/202=
20324/202203242303.jFVYHAkh-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/jimc/linux/commit/bd35fd3540c38d57ed3f80330e0f=
76417a4fa9e3
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dyndbg-next
        git checkout bd35fd3540c38d57ed3f80330e0f76417a4fa9e3
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/media/tuners/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/media/tuners/xc4000.c: note: in included file:
   drivers/media/tuners/tuner-xc2028-types.h:77:9: sparse: sparse: preproce=
ssor token IF redefined
   drivers/media/tuners/xc4000.c: note: in included file (through include/l=
inux/dynamic_debug.h, include/linux/acpi.h, include/linux/i2c.h):
>> include/linux/cpp_magic.h:224:9: sparse: this was the original definition
--
   drivers/media/tuners/tuner-xc2028.c: note: in included file:
   drivers/media/tuners/tuner-xc2028-types.h:77:9: sparse: sparse: preproce=
ssor token IF redefined
   drivers/media/tuners/tuner-xc2028.c: note: in included file (through inc=
lude/linux/dynamic_debug.h, include/linux/acpi.h, include/linux/i2c.h):
>> include/linux/cpp_magic.h:224:9: sparse: this was the original definition

vim +224 include/linux/cpp_magic.h

24fbdc7f0df092 Jim Cromie 2022-03-20  207  =

24fbdc7f0df092 Jim Cromie 2022-03-20  208  =

24fbdc7f0df092 Jim Cromie 2022-03-20  209  /**
24fbdc7f0df092 Jim Cromie 2022-03-20  210   * Macro if statement. Usage:
24fbdc7f0df092 Jim Cromie 2022-03-20  211   *
24fbdc7f0df092 Jim Cromie 2022-03-20  212   *   IF(c)(expansion when true)
24fbdc7f0df092 Jim Cromie 2022-03-20  213   *
24fbdc7f0df092 Jim Cromie 2022-03-20  214   * Here's how:
24fbdc7f0df092 Jim Cromie 2022-03-20  215   *
24fbdc7f0df092 Jim Cromie 2022-03-20  216   * 1. The preprocessor expands t=
he arguments to _IF casting the condition to '0'
24fbdc7f0df092 Jim Cromie 2022-03-20  217   *    or '1'.
24fbdc7f0df092 Jim Cromie 2022-03-20  218   * 2. The casted condition is co=
ncatencated with _IF_ giving _IF_0 or _IF_1.
24fbdc7f0df092 Jim Cromie 2022-03-20  219   * 3. The _IF_0 and _IF_1 macros=
 either returns the argument or doesn't (e.g.
24fbdc7f0df092 Jim Cromie 2022-03-20  220   *    they implement the "choice=
 selection" part of the macro).
24fbdc7f0df092 Jim Cromie 2022-03-20  221   * 4. Note that the "true" claus=
e is in the extra set of brackets; thus these
24fbdc7f0df092 Jim Cromie 2022-03-20  222   *    become the arguments to _I=
F_0 or _IF_1 and thus a selection is made!
24fbdc7f0df092 Jim Cromie 2022-03-20  223   */
24fbdc7f0df092 Jim Cromie 2022-03-20 @224  #define IF(c) _IF(BOOL(c))
24fbdc7f0df092 Jim Cromie 2022-03-20  225  #define _IF(c) CAT(_IF_,c)
24fbdc7f0df092 Jim Cromie 2022-03-20  226  #define _IF_0(...)
24fbdc7f0df092 Jim Cromie 2022-03-20  227  #define _IF_1(...) __VA_ARGS__
24fbdc7f0df092 Jim Cromie 2022-03-20  228  =


:::::: The code at line 224 was first introduced by commit
:::::: 24fbdc7f0df092d60d756acb563d188b95ee0ac2 dyndbg: add cpp-magic heade=
r for MAP macro

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3365167801484412722==--


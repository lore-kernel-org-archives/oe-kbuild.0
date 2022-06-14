Content-Type: multipart/mixed; boundary="===============5089823925514882682=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/include/asm/uaccess.h:574:9: warning: use of NULL 'to' where non-null expected [CWE-476]
Date: Wed, 15 Jun 2022 00:08:41 +0800
Message-ID: <202206142337.p32gdP03-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5089823925514882682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/arm/include/asm/uaccess.h:574:9: warning: use of NULL 'to' where non-=
null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Micha=C5=82 K=C4=99pie=C5=84" <kernel@kempniu.pl>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 6420ac0af95dbcb2fd8452e2d551ab50e1bbad83 mtdchar: prevent unbounded=
 allocation in MEMWRITE ioctl
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220611 (https://download.01.org/0day-ci/archi=
ve/20220614/202206142337.p32gdP03-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6420ac0af95dbcb2fd8452e2d551ab50e1bbad83
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6420ac0af95dbcb2fd8452e2d551ab50e1bbad83
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from drivers/mtd/mtdchar.c:7:
   include/linux/mtd/mtd.h: In function '_copy_from_user':
>> arch/arm/include/asm/uaccess.h:574:9: warning: use of NULL 'to' where no=
n-null expected [CWE-476] [-Wanalyzer-null-argument]
     574 |         memcpy(to, (const void __force *)from, n);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'mtdchar_unlocked_ioctl': events 1-2
       |
       |drivers/mtd/mtdchar.c:1089:13:
       | 1089 | static long mtdchar_unlocked_ioctl(struct file *file, u_int=
 cmd, u_long arg)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'mtdchar_unlocked_ioctl'
       |......
       | 1097 |         ret =3D mtdchar_ioctl(file, cmd, arg);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'mtdchar_ioctl' from 'mtdchar_unl=
ocked_ioctl'
       |
       +--> 'mtdchar_ioctl': events 3-8
              |
              |  688 | static int mtdchar_ioctl(struct file *file, u_int cm=
d, u_long arg)
              |      |            ^~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'mtdchar_ioctl'
              |......
              |  734 |                 if (!(file->f_mode & FMODE_WRITE))
              |      |                    ~
              |      |                    |
              |      |                    (4) following 'false' branch...
              |......
              |  742 |         switch (cmd) {
              |      |         ~~~~~~
              |      |         |
              |      |         (5) ...to here
              |      |         (6) following 'case 4713:' branch...
              |......
              |  877 |         case MEMWRITE:
              |      |         ~~~~
              |      |         |
              |      |         (7) ...to here
              |  878 |         {
              |  879 |                 ret =3D mtdchar_write_ioctl(mtd,
              |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (8) calling 'mtdchar_write_ioc=
tl' from 'mtdchar_ioctl'
              |  880 |                       (struct mtd_write_req __user *=
)arg);
              |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
              |
              +--> 'mtdchar_write_ioctl': events 9-14
                     |
                     |  593 | static int mtdchar_write_ioctl(struct mtd_inf=
o *mtd,
                     |      |            ^~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'mtdchar_write_ioctl'
                     |......
                     |  603 |         if (copy_from_user(&req, argp, sizeof=
(req)))
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'false' branch (whe=
n 'n =3D=3D 0')...
                     |......
                     |  606 |         usr_data =3D (const void __user *)(ui=
ntptr_t)req.usr_data;
                     |      |                                              =
      ~~~~~~~~~~~~
                     |      |                                              =
         |
                     |      |                                              =
         (11) ...to here
                     |......
                     |  609 |         if (!master->_write_oob)
                     |      |            ~
                     |      |            |
                     |      |            (12) following 'false' branch...
                     |......
                     |  612 |         if (!usr_data)
                     |      |            ~
                     |      |            |
                     |      |            (13) ...to here
                     |......
                     |  618 |         if (req.start + req.len > mtd->size)
                     |      |            ~
                     |      |            |
                     |      |            (14) following 'false' branch...
                     |
                   'mtdchar_write_ioctl': event 15
                     |
                     |include/linux/compiler-gcc.h:42:45:
                     |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(_=
_UNIQUE_ID_, prefix), __COUNTER__)
                     |      |                                             ^=
~~~~~~~~~~~
                     |      |                                             |
                     |      |                                             (=
15) ...to here
   include/linux/minmax.h:31:27: note: in definition of macro '__cmp_once'
                     |   31 |                 typeof(x) unique_x =3D (x);  =
             \
                     |      |                           ^~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
                     |   60 | #define __PASTE(a,b) ___PASTE(a,b)
                     |      |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
                     |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(_=
_UNIQUE_ID_, prefix), __COUNTER__)
                     |      |                             ^~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
                     |   60 | #define __PASTE(a,b) ___PASTE(a,b)
                     |      |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
                     |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(_=
_UNIQUE_ID_, prefix), __COUNTER__)
                     |      |                                     ^~~~~~~
   include/linux/minmax.h:38:34: note: in expansion of macro '__UNIQUE_ID'

vim +/to +574 arch/arm/include/asm/uaccess.h

3fba7e23f754a9 arch/arm/include/asm/uaccess.h Russell King   2015-08-19  56=
9  =

9641c7cc5a7f6d include/asm-arm/uaccess.h      Russell King   2006-06-21  57=
0  #else
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
1  static inline unsigned long
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
2  raw_copy_from_user(void *to, const void __user *from, unsigned long n)
32b143637e8180 arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  57=
3  {
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21 @57=
4  	memcpy(to, (const void __force *)from, n);
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
5  	return 0;
32b143637e8180 arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  57=
6  }
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
7  static inline unsigned long
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
8  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
32b143637e8180 arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  57=
9  {
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  58=
0  	memcpy((void __force *)to, from, n);
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  58=
1  	return 0;
^1da177e4c3f41 include/asm-arm/uaccess.h      Linus Torvalds 2005-04-16  58=
2  }
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  58=
3  #define __clear_user(addr, n)		(memset((void __force *)addr, 0, n), 0)
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  58=
4  #endif
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  58=
5  #define INLINE_COPY_TO_USER
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  58=
6  #define INLINE_COPY_FROM_USER
^1da177e4c3f41 include/asm-arm/uaccess.h      Linus Torvalds 2005-04-16  58=
7  =


:::::: The code at line 574 was first introduced by commit
:::::: 4de5b63e76b2e672478e49622dabe2666b7f727f arm: switch to RAW_COPY_USER

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5089823925514882682==--


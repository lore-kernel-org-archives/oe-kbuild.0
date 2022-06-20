Content-Type: multipart/mixed; boundary="===============8297727404170821880=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/fortify-string.h:19:33: warning: use of NULL 'name' where non-null expected [CWE-476]
Date: Mon, 20 Jun 2022 13:48:47 +0800
Message-ID: <202206201338.bKapPUnp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8297727404170821880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/fortify-string.h:19:33: warning: use of NULL 'name' where no=
n-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 6e5be40d32fb1907285277c02e74493ed43d77fe fs/ntfs3: Add NTFS3 in fs/=
Kconfig and fs/Makefile
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220620/202206201338.bKapPUnp-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6e5be40d32fb1907285277c02e74493ed43d77fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6e5be40d32fb1907285277c02e74493ed43d77fe
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/string.h:262,
                    from include/linux/bitmap.h:10,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/blkdev.h:5,
                    from fs/ntfs3/attrib.c:9:
   include/linux/fortify-string.h: In function 'attr_set_size':
>> include/linux/fortify-string.h:19:33: warning: use of NULL 'name' where =
non-null expected [CWE-476] [-Wanalyzer-null-argument]
      19 | #define __underlying_memcmp     __builtin_memcmp
         |                                 ^
   include/linux/fortify-string.h:235:16: note: in expansion of macro '__un=
derlying_memcmp'
     235 |         return __underlying_memcmp(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~
     'attr_collapse_range': events 1-6
       |
       |fs/ntfs3/attrib.c:1688:5:
       | 1688 | int attr_collapse_range(struct ntfs_inode *ni, u64 vbo, u64=
 bytes)
       |      |     ^~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'attr_collapse_range'
       |......
       | 1702 |         if (!bytes)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'bytes !=3D 0=
')...
       |......
       | 1706 |         attr_b =3D ni_find_attr(ni, NULL, &le_b, ATTR_DATA,=
 NULL, 0, NULL, &mi_b);
       |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (3) ...to here
       | 1707 |         if (!attr_b)
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'attr_b' is n=
on-NULL)...
       |......
       | 1710 |         if (!attr_b->non_res) {
       |      |            ~ ~~~~~~~~~~~~~~~
       |      |            |       |
       |      |            |       (5) ...to here
       |      |            (6) following 'false' branch...
       |
     'attr_collapse_range': events 7-12
       |
       | 1715 |         data_size =3D le64_to_cpu(attr_b->nres.data_size);
       |......
       | 1727 |         if ((vbo & mask) || (bytes & mask)) {
       |      |            ~       =

       |      |            |
       |      |            (8) following 'false' branch...
       |......
       | 1732 |         if (vbo > data_size)
       |      |            ~       =

       |      |            |
       |      |            (9) ...to here
       |      |            (10) following 'false' branch (when 'data_size >=
=3D vbo')...
       |......
       | 1735 |         down_write(&ni->file.run_lock);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (11) ...to here
       | 1736 | =

       | 1737 |         if (vbo + bytes >=3D data_size) {
       |      |            ~       =

       |      |            |
       |      |            (12) following 'true' branch...
       |
     'attr_collapse_range': event 13
       |
       |include/linux/compiler-gcc.h:42:45:
       |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, p=
refix), __COUNTER__)
       |      |                                             ^~~~~~~~~~~~
       |      |                                             |
       |      |                                             (13) ...to here
   include/linux/minmax.h:31:27: note: in definition of macro '__cmp_once'
       |   31 |                 typeof(x) unique_x =3D (x);               \
       |      |                           ^~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
       |   60 | #define __PASTE(a,b) ___PASTE(a,b)
       |      |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
       |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, p=
refix), __COUNTER__)
       |      |                             ^~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
       |   60 | #define __PASTE(a,b) ___PASTE(a,b)
       |      |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
       |   42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, p=
refix), __COUNTER__)
       |      |                                     ^~~~~~~
   include/linux/minmax.h:38:34: note: in expansion of macro '__UNIQUE_ID'
       |   38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE=
_ID(__y), op))
       |      |                                  ^~~~~~~~~~~
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
       |   45 | #define min(x, y)       __careful_cmp(x, y, <)
       |      |                         ^~~~~~~~~~~~~
   fs/ntfs3/attrib.c:1738:33: note: in expansion of macro 'min'
       | 1738 |                 u64 new_valid =3D min(ni->i_valid, vbo);
       |      |                                 ^~~
       |
     'attr_collapse_range': event 14
       |
       | 1742 |                 err =3D attr_set_size(ni, ATTR_DATA, NULL, =
0, &ni->file.run, vbo,
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (14) calling 'attr_set_size' from 'at=
tr_collapse_range'
       | 1743 |                                     &new_valid, true, NULL);
       |      |                                     ~~~~~~~~~~~~~~~~~~~~~~~
       |
       +--> 'attr_set_size': events 15-24

vim +/name +19 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25   4  =

a28a6e860c6cf2 Francis Laniel 2021-02-25   5  =

a28a6e860c6cf2 Francis Laniel 2021-02-25   6  #if defined(CONFIG_KASAN_GENE=
RIC) || defined(CONFIG_KASAN_SW_TAGS)
a28a6e860c6cf2 Francis Laniel 2021-02-25   7  extern void *__underlying_mem=
chr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
a28a6e860c6cf2 Francis Laniel 2021-02-25   8  extern int __underlying_memcm=
p(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
a28a6e860c6cf2 Francis Laniel 2021-02-25   9  extern void *__underlying_mem=
cpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  10  extern void *__underlying_mem=
move(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
a28a6e860c6cf2 Francis Laniel 2021-02-25  11  extern void *__underlying_mem=
set(void *p, int c, __kernel_size_t size) __RENAME(memset);
a28a6e860c6cf2 Francis Laniel 2021-02-25  12  extern char *__underlying_str=
cat(char *p, const char *q) __RENAME(strcat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  13  extern char *__underlying_str=
cpy(char *p, const char *q) __RENAME(strcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  14  extern __kernel_size_t __unde=
rlying_strlen(const char *p) __RENAME(strlen);
a28a6e860c6cf2 Francis Laniel 2021-02-25  15  extern char *__underlying_str=
ncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  16  extern char *__underlying_str=
ncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  17  #else
a28a6e860c6cf2 Francis Laniel 2021-02-25  18  #define __underlying_memchr	_=
_builtin_memchr
a28a6e860c6cf2 Francis Laniel 2021-02-25 @19  #define __underlying_memcmp	_=
_builtin_memcmp
a28a6e860c6cf2 Francis Laniel 2021-02-25  20  #define __underlying_memcpy	_=
_builtin_memcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  21  #define __underlying_memmove	=
__builtin_memmove
a28a6e860c6cf2 Francis Laniel 2021-02-25  22  #define __underlying_memset	_=
_builtin_memset
a28a6e860c6cf2 Francis Laniel 2021-02-25  23  #define __underlying_strcat	_=
_builtin_strcat
a28a6e860c6cf2 Francis Laniel 2021-02-25  24  #define __underlying_strcpy	_=
_builtin_strcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  25  #define __underlying_strlen	_=
_builtin_strlen
a28a6e860c6cf2 Francis Laniel 2021-02-25  26  #define __underlying_strncat	=
__builtin_strncat
a28a6e860c6cf2 Francis Laniel 2021-02-25  27  #define __underlying_strncpy	=
__builtin_strncpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  28  #endif
a28a6e860c6cf2 Francis Laniel 2021-02-25  29  =


:::::: The code at line 19 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified fu=
nctions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8297727404170821880==--


Content-Type: multipart/mixed; boundary="===============2701276468231759558=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 142/411] include/linux/fortify-string.h:45:33: warning: use of NULL 'ifp' where non-null expected [CWE-476]
Date: Sun, 31 Jul 2022 09:13:47 +0800
Message-ID: <202207310943.CazSEYbl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2701276468231759558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/fortify-string.h:45:33: warning: use of NULL 'ifp' where non=
-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   1d79555b9e2bc74efef217aee3f208794112be10
commit: bbad4483f77af34666ccb231b429012b00275c32 [142/411] xfs: repair inod=
e block maps
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
731/202207310943.CazSEYbl-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Dbbad4483f77af34666ccb231b429012b00275c32
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout bbad4483f77af34666ccb231b429012b00275c32
        # save the config file
        make ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
       |      | ^~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xfs_bmbt_init_cursor'
       |......
       |  594 |         struct xfs_ifork        *ifp =3D xfs_ifork_ptr(ip, =
whichfork);
       |      |                                        ~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       |      |                                        |
       |      |                                        (2) calling 'xfs_ifo=
rk_ptr' from 'xfs_bmbt_init_cursor'
       |
       +--> 'xfs_ifork_ptr': events 3-4
              |
              |fs/xfs/xfs_inode.h:86:1:
              |   86 | xfs_ifork_ptr(
              |      | ^~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'xfs_ifork_ptr'
              |......
              |   94 |                 if (!xfs_inode_has_attr_fork(ip))
              |      |                    ~
              |      |                    |
              |      |                    (4) following 'true' branch...
              |
            'xfs_ifork_ptr': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'xfs_bmbt_init_cursor': events 6-7
       |
       |fs/xfs/libxfs/xfs_bmap_btree.c:594:40:
       |  594 |         struct xfs_ifork        *ifp =3D xfs_ifork_ptr(ip, =
whichfork);
       |      |                                        ^~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       |      |                                        |
       |      |                                        (6) return of NULL t=
o 'xfs_bmbt_init_cursor' from 'xfs_ifork_ptr'
       |......
       |  597 |         cur =3D xfs_bmbt_init_common(mp, tp, ip, whichfork);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (7) calling 'xfs_bmbt_init_common' from 'xfs_=
bmbt_init_cursor'
       |
       +--> 'xfs_bmbt_init_common': event 8
              |
              |  558 | xfs_bmbt_init_common(
              |      | ^~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (8) entry to 'xfs_bmbt_init_common'
              |
            'xfs_bmbt_init_common': event 9
              |
              |fs/xfs/xfs_linux.h:206:33:
              |  206 |         (likely(expr) ? (void)0 : assfail(NULL, #exp=
r, __FILE__, __LINE__))
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (9) following 'false=
' branch...
   fs/xfs/libxfs/xfs_bmap_btree.c:566:9: note: in expansion of macro 'ASSER=
T'
              |  566 |         ASSERT(whichfork !=3D XFS_COW_FORK);
              |      |         ^~~~~~
              |
            'xfs_bmbt_init_common': event 10
              |
              |  568 |         cur =3D xfs_btree_alloc_cursor(mp, tp, XFS_B=
TNUM_BMAP,
              |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
              |      |               |
              |      |               (10) ...to here
              |  569 |                         mp->m_bm_maxlevels[whichfork=
], xfs_bmbt_cur_cache);
              |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'xfs_bmbt_init_cursor': event 11
       |
       |  597 |         cur =3D xfs_bmbt_init_common(mp, tp, ip, whichfork);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (11) returning to 'xfs_bmbt_init_cursor' from=
 'xfs_bmbt_init_common'
       |
     'xfs_bmbt_init_cursor': event 12
       |
       |  599 |         cur->bc_nlevels =3D be16_to_cpu(ifp->if_broot->bb_l=
evel) + 1;
       |      |                                       ~~~^~~~~~~~~~
       |      |                                          |
       |      |                                          (12) dereference o=
f NULL 'ifp'
   include/uapi/linux/swab.h:102:54: note: in definition of macro '__swab16'
       |  102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
       |      |                                                      ^
   include/linux/byteorder/generic.h:97:21: note: in expansion of macro '__=
be16_to_cpu'
       |   97 | #define be16_to_cpu __be16_to_cpu
       |      |                     ^~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:599:27: note: in expansion of macro 'be16=
_to_cpu'
       |  599 |         cur->bc_nlevels =3D be16_to_cpu(ifp->if_broot->bb_l=
evel) + 1;
       |      |                           ^~~~~~~~~~~
       |
   In file included from include/linux/string.h:253,
                    from include/linux/uuid.h:12,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/libxfs/xfs_bmap_btree.c:6:
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_commit_staged_btre=
e':
>> include/linux/fortify-string.h:45:33: warning: use of NULL 'ifp' where n=
on-null expected [CWE-476] [-Wanalyzer-null-argument]
      45 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__und=
erlying_memcpy'
     378 |         __underlying_##op(p, q, __fortify_size);                =
        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
     385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,          =
        \
         |                          ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:670:9: note: in expansion of macro 'memcp=
y'
     670 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork));
         |         ^~~~~~
     'xfs_bmbt_commit_staged_btree': events 1-2
       |
       |  647 | xfs_bmbt_commit_staged_btree(
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xfs_bmbt_commit_staged_btree'
       |......
       |  668 |         ifp =3D xfs_ifork_ptr(cur->bc_ino.ip, whichfork);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'xfs_ifork_ptr' from 'xfs_bmbt_co=
mmit_staged_btree'
       |
       +--> 'xfs_ifork_ptr': events 3-4
              |
              |fs/xfs/xfs_inode.h:86:1:
              |   86 | xfs_ifork_ptr(
              |      | ^~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'xfs_ifork_ptr'
              |......
              |   94 |                 if (!xfs_inode_has_attr_fork(ip))
              |      |                    ~
              |      |                    |
              |      |                    (4) following 'true' branch...
              |
            'xfs_ifork_ptr': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'xfs_bmbt_commit_staged_btree': event 6
       |
       |fs/xfs/libxfs/xfs_bmap_btree.c:668:15:
       |  668 |         ifp =3D xfs_ifork_ptr(cur->bc_ino.ip, whichfork);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (6) returning to 'xfs_bmbt_commit_staged_btre=
e' from 'xfs_ifork_ptr'
       |
     'xfs_bmbt_commit_staged_btree': event 7
       |
       |include/linux/fortify-string.h:368:12:
       |  368 |         if ((p_size !=3D (size_t)(-1) && p_size < size) ||
       |      |            ^
       |      |            |
       |      |            (7) following 'false' branch...
       |
     'xfs_bmbt_commit_staged_btree': event 8
       |
       |fs/xfs/libxfs/xfs_bmap_btree.c:670:26:
       |  670 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork=
));
       |      |                     ~~~~~^~~~~~~~~
       |      |                          |
       |      |                          (8) ...to here
   include/linux/fortify-string.h:378:30: note: in definition of macro '__f=
ortify_memcpy_chk'
       |  378 |         __underlying_##op(p, q, __fortify_size);           =
             \
       |      |                              ^
   fs/xfs/libxfs/xfs_bmap_btree.c:670:9: note: in expansion of macro 'memcp=
y'
       |  670 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork=
));
       |      |         ^~~~~~
       |
     'xfs_bmbt_commit_staged_btree': event 9
       |
       |include/linux/fortify-string.h:45:33:
       |   45 | #define __underlying_memcpy     __builtin_memcpy
       |      |                                 ^
       |      |                                 |
       |      |                                 (9) argument 1 ('ifp') NULL=
 where non-null expected
   include/linux/fortify-string.h:378:9: note: in expansion of macro '__und=
erlying_memcpy'
       |  378 |         __underlying_##op(p, q, __fortify_size);           =
             \
       |      |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:385:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
       |  385 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,     =
             \
       |      |                          ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.c:670:9: note: in expansion of macro 'memcp=
y'
       |  670 |         memcpy(ifp, ifake->if_fork, sizeof(struct xfs_ifork=
));
       |      |         ^~~~~~
       |
   <built-in>: note: argument 1 of '__builtin_memcpy' must be non-null
   In file included from include/linux/string.h:5,
                    from include/linux/uuid.h:12,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/libxfs/xfs_bmap_btree.c:6:
   fs/xfs/libxfs/xfs_bmap_btree.c: In function 'xfs_bmbt_change_owner':
   fs/xfs/libxfs/xfs_bmap_btree.c:767:44: warning: dereference of NULL '0' =
[CWE-476] [-Wanalyzer-null-dereference]
     767 |         ASSERT(xfs_ifork_ptr(ip, whichfork)->if_format =3D=3D XF=
S_DINODE_FMT_BTREE);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~

vim +/ifp +45 include/linux/fortify-string.h

3009f891bb9f32 Kees Cook      2021-08-02  30  =

a28a6e860c6cf2 Francis Laniel 2021-02-25  31  #if defined(CONFIG_KASAN_GENE=
RIC) || defined(CONFIG_KASAN_SW_TAGS)
a28a6e860c6cf2 Francis Laniel 2021-02-25  32  extern void *__underlying_mem=
chr(const void *p, int c, __kernel_size_t size) __RENAME(memchr);
a28a6e860c6cf2 Francis Laniel 2021-02-25  33  extern int __underlying_memcm=
p(const void *p, const void *q, __kernel_size_t size) __RENAME(memcmp);
a28a6e860c6cf2 Francis Laniel 2021-02-25  34  extern void *__underlying_mem=
cpy(void *p, const void *q, __kernel_size_t size) __RENAME(memcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  35  extern void *__underlying_mem=
move(void *p, const void *q, __kernel_size_t size) __RENAME(memmove);
a28a6e860c6cf2 Francis Laniel 2021-02-25  36  extern void *__underlying_mem=
set(void *p, int c, __kernel_size_t size) __RENAME(memset);
a28a6e860c6cf2 Francis Laniel 2021-02-25  37  extern char *__underlying_str=
cat(char *p, const char *q) __RENAME(strcat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  38  extern char *__underlying_str=
cpy(char *p, const char *q) __RENAME(strcpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  39  extern __kernel_size_t __unde=
rlying_strlen(const char *p) __RENAME(strlen);
a28a6e860c6cf2 Francis Laniel 2021-02-25  40  extern char *__underlying_str=
ncat(char *p, const char *q, __kernel_size_t count) __RENAME(strncat);
a28a6e860c6cf2 Francis Laniel 2021-02-25  41  extern char *__underlying_str=
ncpy(char *p, const char *q, __kernel_size_t size) __RENAME(strncpy);
a28a6e860c6cf2 Francis Laniel 2021-02-25  42  #else
a28a6e860c6cf2 Francis Laniel 2021-02-25  43  #define __underlying_memchr	_=
_builtin_memchr
a28a6e860c6cf2 Francis Laniel 2021-02-25  44  #define __underlying_memcmp	_=
_builtin_memcmp
a28a6e860c6cf2 Francis Laniel 2021-02-25 @45  #define __underlying_memcpy	_=
_builtin_memcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  46  #define __underlying_memmove	=
__builtin_memmove
a28a6e860c6cf2 Francis Laniel 2021-02-25  47  #define __underlying_memset	_=
_builtin_memset
a28a6e860c6cf2 Francis Laniel 2021-02-25  48  #define __underlying_strcat	_=
_builtin_strcat
a28a6e860c6cf2 Francis Laniel 2021-02-25  49  #define __underlying_strcpy	_=
_builtin_strcpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  50  #define __underlying_strlen	_=
_builtin_strlen
a28a6e860c6cf2 Francis Laniel 2021-02-25  51  #define __underlying_strncat	=
__builtin_strncat
a28a6e860c6cf2 Francis Laniel 2021-02-25  52  #define __underlying_strncpy	=
__builtin_strncpy
a28a6e860c6cf2 Francis Laniel 2021-02-25  53  #endif
a28a6e860c6cf2 Francis Laniel 2021-02-25  54  =


:::::: The code at line 45 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified fu=
nctions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2701276468231759558==--


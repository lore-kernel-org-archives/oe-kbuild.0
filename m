Content-Type: multipart/mixed; boundary="===============5456043030665699048=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 2/7] include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: dereference of NULL 'bh' [CWE-476]
Date: Sat, 18 Jun 2022 14:26:45 +0800
Message-ID: <202206181418.hvdOKkJ4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5456043030665699048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/a=
sm-generic/bitops/generic-non-atomic.h:127:27: warning: dereference of NULL=
 'bh' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: b9944c14c86ab2ac2a97aeec1426812751e0039b [2/7] bitops: always defin=
e asm-generic non-atomic bitops
:::::: branch date: 16 hours ago
:::::: commit date: 18 hours ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220618/202206181418.hvdOKkJ4-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/b9944c14c86ab2ac2a97aeec=
1426812751e0039b
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout b9944c14c86ab2ac2a97aeec1426812751e0039b
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/asm-generic/bitops/non-atomic.h:5,
                    from arch/arm/include/asm/bitops.h:123,
                    from include/linux/bitops.h:33,
                    from include/linux/kernel.h:22,
                    from fs/buffer.c:22:
   include/asm-generic/bitops/generic-non-atomic.h: In function 'create_emp=
ty_buffers':
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: derefer=
ence of NULL 'bh' [CWE-476] [-Wanalyzer-null-dereference]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'block_truncate_page': event 1
       |
       |fs/buffer.c:2861:5:
       | 2861 | int block_truncate_page(struct address_space *mapping,
       |      |     ^~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'block_truncate_page'
       |
     'block_truncate_page': event 2
       |
       |cc1:
       | (2): '=1B[01m=1B[Kbh=1B[m=1B[K' is NULL
       |
     'block_truncate_page': events 3-6
       |
       | 2878 |         if (!length)
       |      |            ^
       |      |            |
       |      |            (3) following 'false' branch (when 'length !=3D =
0')...
       |......
       | 2881 |         length =3D blocksize - length;
       |      |         ~~~~~~
       |      |         |
       |      |         (4) ...to here
       |......
       | 2886 |         if (!page)
       |      |            ~
       |      |            |
       |      |            (5) following 'false' branch...
       |......
       | 2889 |         if (!page_has_buffers(page))
       |      |         ~~  =

       |      |         |
       |      |         (6) ...to here
       |
     'block_truncate_page': event 7
       |
       |include/linux/mmdebug.h:20:20:
       |   20 |                 if (unlikely(cond)) {                      =
             \
       |      |                    ^
       |      |                    |
       |      |                    (7) following 'false' branch...
   include/linux/mmdebug.h:94:39: note: in expansion of macro 'VM_BUG_ON_PA=
GE'
       |   94 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, =
page)
       |      |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:370:17: note: in expansion of macro 'VM_BUG_O=
N_PGFLAGS'
       |  370 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page)=
;            \
       |      |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:372:33: note: in expansion of macro 'PF_POISO=
NED_CHECK'
       |  372 | #define PF_ANY(page, enforce)   PF_POISONED_CHECK(page)
       |      |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:32: note: in expansion of macro 'PF_ANY'
       |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
       |      |                                ^~~~~~
   include/linux/page-flags.h:447:9: note: in expansion of macro 'TESTPAGEF=
LAG'
       |  447 |         TESTPAGEFLAG(uname, lname, policy)                 =
             \
       |      |         ^~~~~~~~~~~~
   include/linux/page-flags.h:530:1: note: in expansion of macro 'PAGEFLAG'
       |  530 | PAGEFLAG(Private, private, PF_ANY)
       |      | ^~~~~~~~
       |
     'block_truncate_page': event 8
       |
       |include/linux/compiler-gcc.h:63:12:
       |   63 |         do {                                    \
       |      |            ^
       |      |            |
       |      |            (8) ...to here
   arch/arm/include/asm/bug.h:54:9: note: in expansion of macro 'unreachabl=
e'
       |   54 |         unreachable();                                     =
     \
       |      |         ^~~~~~~~~~~
   arch/arm/include/asm/bug.h:24:33: note: in expansion of macro '__BUG'
       |   24 | #define _BUG(file, line, value) __BUG(file, line, value)
       |      |                                 ^~~~~
   arch/arm/include/asm/bug.h:23:15: note: in expansion of macro '_BUG'
       |   23 | #define BUG() _BUG(__FILE__, __LINE__, BUG_INSTR_VALUE)
       |      |               ^~~~
   include/linux/mmdebug.h:22:25: note: in expansion of macro 'BUG'
       |   22 |                         BUG();                             =
             \
       |      |                         ^~~
   include/linux/mmdebug.h:94:39: note: in expansion of macro 'VM_BUG_ON_PA=
GE'
       |   94 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, =
page)
       |      |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:370:17: note: in expansion of macro 'VM_BUG_O=
N_PGFLAGS'
       |  370 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page)=
;            \
       |      |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:372:33: note: in expansion of macro 'PF_POISO=
NED_CHECK'
       |  372 | #define PF_ANY(page, enforce)   PF_POISONED_CHECK(page)
       |      |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:32: note: in expansion of macro 'PF_ANY'
       |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
       |      |                                ^~~~~~
   include/linux/page-flags.h:447:9: note: in expansion of macro 'TESTPAGEF=
LAG'
       |  447 |         TESTPAGEFLAG(uname, lname, policy)                 =
             \
       |      |         ^~~~~~~~~~~~
   include/linux/page-flags.h:530:1: note: in expansion of macro 'PAGEFLAG'
       |  530 | PAGEFLAG(Private, private, PF_ANY)
       |      | ^~~~~~~~
--
              |  275 |                 return head - 1;
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (61) ...to here
              |
            'create_empty_buffers': event 62
              |
              |include/linux/mmdebug.h:20:20:
              |   20 |                 if (unlikely(cond)) {               =
                    \
              |      |                    ^
              |      |                    |
              |      |                    (62) following 'false' branch...
   include/linux/mmdebug.h:94:39: note: in expansion of macro 'VM_BUG_ON_PA=
GE'
              |   94 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE=
(cond, page)
              |      |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:370:17: note: in expansion of macro 'VM_BUG_O=
N_PGFLAGS'
              |  370 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page)=
, page);            \
              |      |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:373:33: note: in expansion of macro 'PF_POISO=
NED_CHECK'
              |  373 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(co=
mpound_head(page))
              |      |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:32: note: in expansion of macro 'PF_HEAD'
              |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flag=
s); }
              |      |                                ^~~~~~
   include/linux/page-flags.h:447:9: note: in expansion of macro 'TESTPAGEF=
LAG'
              |  447 |         TESTPAGEFLAG(uname, lname, policy)          =
                    \
              |      |         ^~~~~~~~~~~~
   include/linux/page-flags.h:498:1: note: in expansion of macro 'PAGEFLAG'
              |  498 | PAGEFLAG(Dirty, dirty, PF_HEAD) TESTSCFLAG(Dirty, di=
rty, PF_HEAD)
              |      | ^~~~~~~~
              |
            'create_empty_buffers': event 63
              |
              |include/linux/compiler-gcc.h:63:12:
              |   63 |         do {                                    \
              |      |            ^
              |      |            |
              |      |            (63) ...to here
   arch/arm/include/asm/bug.h:54:9: note: in expansion of macro 'unreachabl=
e'
              |   54 |         unreachable();                              =
            \
              |      |         ^~~~~~~~~~~
   arch/arm/include/asm/bug.h:24:33: note: in expansion of macro '__BUG'
              |   24 | #define _BUG(file, line, value) __BUG(file, line, va=
lue)
              |      |                                 ^~~~~
   arch/arm/include/asm/bug.h:23:15: note: in expansion of macro '_BUG'
              |   23 | #define BUG() _BUG(__FILE__, __LINE__, BUG_INSTR_VAL=
UE)
              |      |               ^~~~
   include/linux/mmdebug.h:22:25: note: in expansion of macro 'BUG'
              |   22 |                         BUG();                      =
                    \
              |      |                         ^~~
   include/linux/mmdebug.h:94:39: note: in expansion of macro 'VM_BUG_ON_PA=
GE'
              |   94 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE=
(cond, page)
              |      |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:370:17: note: in expansion of macro 'VM_BUG_O=
N_PGFLAGS'
              |  370 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page)=
, page);            \
              |      |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:373:33: note: in expansion of macro 'PF_POISO=
NED_CHECK'
              |  373 | #define PF_HEAD(page, enforce)  PF_POISONED_CHECK(co=
mpound_head(page))
              |      |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:32: note: in expansion of macro 'PF_HEAD'
              |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flag=
s); }
              |      |                                ^~~~~~
   include/linux/page-flags.h:447:9: note: in expansion of macro 'TESTPAGEF=
LAG'
              |  447 |         TESTPAGEFLAG(uname, lname, policy)          =
                    \
              |      |         ^~~~~~~~~~~~
   include/linux/page-flags.h:498:1: note: in expansion of macro 'PAGEFLAG'
              |  498 | PAGEFLAG(Dirty, dirty, PF_HEAD) TESTSCFLAG(Dirty, di=
rty, PF_HEAD)
              |      | ^~~~~~~~
              |
            'create_empty_buffers': events 64-65
              |
              |  274 |         if (unlikely(head & 1))
              |      |            ^
              |      |            |
              |      |            (64) following 'true' branch...
              |  275 |                 return head - 1;
              |      |                 ~~~~~~
              |      |                 |
              |      |                 (65) ...to here
              |
            'create_empty_buffers': events 66-67
              |
              |fs/buffer.c:1571:28:
              | 1571 |                         if (PageDirty(page))
              |      |                            ^
              |      |                            |
              |      |                            (66) following 'true' bra=
nch...
              | 1572 |                                 set_buffer_dirty(bh);
              |      |                                 ~~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (67) ...to here
              |
            'create_empty_buffers': event 68
              |
              |include/asm-generic/bitops/generic-non-atomic.h:127:27:
              |  127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (B=
ITS_PER_LONG-1)));
              |      |                       ~~~~^~~~~~~~~~~~~~
              |      |                           |
              |      |                           (68) dereference of NULL '=
bh'
              |
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: derefer=
ence of NULL 'bh' [CWE-476] [-Wanalyzer-null-dereference]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'block_truncate_page': event 1
       |
       |fs/buffer.c:2861:5:
       | 2861 | int block_truncate_page(struct address_space *mapping,
       |      |     ^~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'block_truncate_page'
       |
     'block_truncate_page': event 2
       |
       |cc1:
       | (2): '=1B[01m=1B[Kbh=1B[m=1B[K' is NULL
       |
     'block_truncate_page': events 3-6
       |
       | 2878 |         if (!length)
       |      |            ^
       |      |            |
       |      |            (3) following 'false' branch (when 'length !=3D =
0')...
       |......
       | 2881 |         length =3D blocksize - length;
       |      |         ~~~~~~
       |      |         |
       |      |         (4) ...to here
       |......
       | 2886 |         if (!page)
       |      |            ~
       |      |            |
       |      |            (5) following 'false' branch...
       |......
       | 2889 |         if (!page_has_buffers(page))
       |      |         ~~  =

       |      |         |
       |      |         (6) ...to here
       |
     'block_truncate_page': event 7
       |
       |include/linux/mmdebug.h:20:20:
       |   20 |                 if (unlikely(cond)) {                      =
             \
       |      |                    ^
       |      |                    |
       |      |                    (7) following 'false' branch...
   include/linux/mmdebug.h:94:39: note: in expansion of macro 'VM_BUG_ON_PA=
GE'
       |   94 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, =
page)
       |      |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:370:17: note: in expansion of macro 'VM_BUG_O=
N_PGFLAGS'
       |  370 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page)=
;            \
       |      |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:372:33: note: in expansion of macro 'PF_POISO=
NED_CHECK'
       |  372 | #define PF_ANY(page, enforce)   PF_POISONED_CHECK(page)
       |      |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:32: note: in expansion of macro 'PF_ANY'
       |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
       |      |                                ^~~~~~
   include/linux/page-flags.h:447:9: note: in expansion of macro 'TESTPAGEF=
LAG'
       |  447 |         TESTPAGEFLAG(uname, lname, policy)                 =
             \
       |      |         ^~~~~~~~~~~~
   include/linux/page-flags.h:530:1: note: in expansion of macro 'PAGEFLAG'
       |  530 | PAGEFLAG(Private, private, PF_ANY)
       |      | ^~~~~~~~
       |
     'block_truncate_page': event 8
       |
       |include/linux/compiler-gcc.h:63:12:
       |   63 |         do {                                    \
       |      |            ^
       |      |            |
       |      |            (8) ...to here
   arch/arm/include/asm/bug.h:54:9: note: in expansion of macro 'unreachabl=
e'
       |   54 |         unreachable();                                     =
     \
       |      |         ^~~~~~~~~~~
   arch/arm/include/asm/bug.h:24:33: note: in expansion of macro '__BUG'
       |   24 | #define _BUG(file, line, value) __BUG(file, line, value)
       |      |                                 ^~~~~
   arch/arm/include/asm/bug.h:23:15: note: in expansion of macro '_BUG'
       |   23 | #define BUG() _BUG(__FILE__, __LINE__, BUG_INSTR_VALUE)
       |      |               ^~~~
   include/linux/mmdebug.h:22:25: note: in expansion of macro 'BUG'
       |   22 |                         BUG();                             =
             \
       |      |                         ^~~
   include/linux/mmdebug.h:94:39: note: in expansion of macro 'VM_BUG_ON_PA=
GE'
       |   94 | #define VM_BUG_ON_PGFLAGS(cond, page) VM_BUG_ON_PAGE(cond, =
page)
       |      |                                       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:370:17: note: in expansion of macro 'VM_BUG_O=
N_PGFLAGS'
       |  370 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page)=
;            \
       |      |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:372:33: note: in expansion of macro 'PF_POISO=
NED_CHECK'
       |  372 | #define PF_ANY(page, enforce)   PF_POISONED_CHECK(page)
       |      |                                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:402:32: note: in expansion of macro 'PF_ANY'
       |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
       |      |                                ^~~~~~
   include/linux/page-flags.h:447:9: note: in expansion of macro 'TESTPAGEF=
LAG'
       |  447 |         TESTPAGEFLAG(uname, lname, policy)                 =
             \
       |      |         ^~~~~~~~~~~~
   include/linux/page-flags.h:530:1: note: in expansion of macro 'PAGEFLAG'
       |  530 | PAGEFLAG(Private, private, PF_ANY)
       |      | ^~~~~~~~
--
   In file included from include/asm-generic/bitops/non-atomic.h:5,
                    from arch/arm/include/asm/bitops.h:123,
                    from include/linux/bitops.h:33,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from fs/ext4/ialloc.c:16:
   fs/ext4/ialloc.c: In function '__ext4_new_inode':
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: derefer=
ence of NULL 'grp' [CWE-476] [-Wanalyzer-null-dereference]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     '__ext4_new_inode': events 1-9
       |
       |fs/ext4/ialloc.c:949:12:
       |  949 |         if (!dir || !dir->i_nlink)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       |  952 |         sb =3D dir->i_sb;
       |      |         ~~  =

       |      |         |
       |      |         (2) ...to here
       |......
       |  955 |         if (unlikely(ext4_forced_shutdown(sbi)))
       |      |            ~
       |      |            |
       |      |            (3) following 'false' branch...
       |......
       |  958 |         ngroups =3D ext4_get_groups_count(sb);
       |      |         ~~~~~~~
       |      |         |
       |      |         (4) ...to here
       |......
       |  961 |         if (!inode)
       |      |            ~
       |      |            |
       |      |            (5) following 'false' branch (when 'inode' is no=
n-NULL)...
       |  962 |                 return ERR_PTR(-ENOMEM);
       |  963 |         ei =3D EXT4_I(inode);
       |      |         ~~  =

       |      |         |
       |      |         (6) ...to here
       |......
       |  994 |         if (err)
       |      |            ~
       |      |            |
       |      |            (7) following 'false' branch (when 'err =3D=3D 0=
')...
       |......
       |  997 |         if (!handle && sbi->s_journal && !(i_flags & EXT4_E=
A_INODE_FL)) {
       |      |         ~~  =

       |      |         |
       |      |         (8) ...to here
       |......
       | 1024 |         if (ret2 =3D=3D -1)
       |      |            ~
       |      |            |
       |      |            (9) following 'false' branch (when 'ret2 !=3D -1=
')...
       |
     '__ext4_new_inode': event 10
       |
       |cc1:
       | (10): ...to here
       |
     '__ext4_new_inode': events 11-18
       |
       | 1032 |         for (i =3D 0; i < ngroups; i++, ino =3D 0) {
       |      |                     ~~^~~~~~~~~
       |      |                       |
       |      |                       (11) following 'true' branch (when 'i=
 < ngroups')...
       | 1033 |                 err =3D -EIO;
       |      |                 ~~~    =

       |      |                 |
       |      |                 (12) ...to here
       |......
       | 1036 |                 if (!gdp)
       |      |                    ~   =

       |      |                    |
       |      |                    (13) following 'false' branch (when 'gdp=
' is non-NULL)...
       |......
       | 1042 |                 if (ext4_free_inodes_count(sb, gdp) =3D=3D =
0)
       |      |                 ~~ ~   =

       |      |                 |  |
       |      |                 |  (15) following 'false' branch...
       |      |                 (14) ...to here
       |......
       | 1045 |                 if (!(sbi->s_mount_state & EXT4_FC_REPLAY))=
 {
       |      |                 ~~ ~   =

       |      |                 |  |
       |      |                 |  (17) following 'false' branch...
       |      |                 (16) ...to here
       |......
       | 1055 |                 brelse(inode_bitmap_bh);
       |      |                 ~~~~~~ =

       |      |                 |
       |      |                 (18) ...to here
       |
     '__ext4_new_inode': event 19
       |
       |include/linux/buffer_head.h:289:12:
       |  289 |         if (bh)
       |      |            ^
       |      |            |
       |      |            (19) following 'false' branch (when 'inode_bitma=
p_bh' is NULL)...
       |
     '__ext4_new_inode': events 20-21
       |
       |fs/ext4/ialloc.c:1056:17:
       | 1056 |                 inode_bitmap_bh =3D ext4_read_inode_bitmap(=
sb, group);
--
   In file included from include/asm-generic/bitops/non-atomic.h:5,
                    from arch/arm/include/asm/bitops.h:123,
                    from include/linux/bitops.h:33,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/percpu.h:6,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/net/sock.h:38,
                    from net/tipc/bearer.c:37:
   include/asm-generic/bitops/generic-non-atomic.h: In function 'tipc_beare=
r_xmit':
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: derefer=
ence of NULL '*(struct tipc_net *)ptr.bearer_list[<unknown>]' [CWE-476] [-W=
analyzer-null-dereference]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'tipc_bearer_xmit': events 1-6
       |
       |net/tipc/bearer.c:569:6:
       |  569 | void tipc_bearer_xmit(struct net *net, u32 bearer_id,
       |      |      ^~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to 'tipc_bearer_xmit'
       |......
       |  577 |         if (skb_queue_empty(xmitq))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  580 |         rcu_read_lock();
       |      |         ~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |  581 |         b =3D bearer_get(net, bearer_id);
       |  582 |         if (unlikely(!b))
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch...
       |  583 |                 __skb_queue_purge(xmitq);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (5) ...to here
       |      |                 (6) calling '__skb_queue_purge' from 'tipc_=
bearer_xmit'
       |
       +--> '__skb_queue_purge': events 7-8
              |
              |include/linux/skbuff.h:3207:20:
              | 3207 | static inline void __skb_queue_purge(struct sk_buff_=
head *list)
              |      |                    ^~~~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (7) entry to '__skb_queue_purge'
              |......
              | 3210 |         while ((skb =3D __skb_dequeue(list)) !=3D NU=
LL)
              |      |                       ~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (8) calling '__skb_dequeue' fr=
om '__skb_queue_purge'
              |
              +--> '__skb_dequeue': events 9-13
                     |
                     | 2178 |         if (skb =3D=3D (struct sk_buff *)list=
_)
                     |      |            ~                   =

                     |      |            |
                     |      |            (10) following 'false' branch (whe=
n 'list !=3D skb')...
                     | 2179 |                 skb =3D NULL;
                     | 2180 |         return skb;
                     |      |         ~~~~~~                 =

                     |      |         |
                     |      |         (11) ...to here
                     |......
                     | 2480 | static inline struct sk_buff *__skb_dequeue(s=
truct sk_buff_head *list)
                     |      |                               ^~~~~~~~~~~~~
                     |      |                               |
                     |      |                               (9) entry to '_=
_skb_dequeue'
                     |......
                     | 2483 |         if (skb)
                     |      |            ~                   =

                     |      |            |
                     |      |            (12) following 'false' branch (whe=
n 'skb' is NULL)...
                     | 2484 |                 __skb_unlink(skb, list);
                     | 2485 |         return skb;
                     |      |         ~~~~~~                 =

                     |      |         |
                     |      |         (13) ...to here
                     |
              <------+
              |
            '__skb_queue_purge': event 14
              |
              | 3210 |         while ((skb =3D __skb_dequeue(list)) !=3D NU=
LL)
              |      |                       ^~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (14) returning to '__skb_queue=
_purge' from '__skb_dequeue'
              |
            '__skb_queue_purge': events 15-16
              |
              | 3210 |         while ((skb =3D __skb_dequeue(list)) !=3D NU=
LL)
              | 3211 |                 kfree_skb(skb);
              | 3212 | }
              |      | ~                                           =

              |      | |
              |      | (16) ...to here
              |
       <------+
       |
     'tipc_bearer_xmit': event 17
       |
       |net/tipc/bearer.c:583:17:
       |  583 |                 __skb_queue_purge(xmitq);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (17) returning to 'tipc_bearer_xmit' from '=
__skb_queue_purge'
       |
     'tipc_bearer_xmit': event 18
       |
--
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from fs/btrfs/sysfs.c:6:
   include/linux/atomic/atomic-instrumented.h: In function 'btrfs_discardab=
le_extents_show':
   include/asm-generic/rwonce.h:44:26: warning: dereference of NULL '0' [CW=
E-476] [-Wanalyzer-null-dereference]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   arch/arm/include/asm/atomic.h:25:33: note: in expansion of macro 'READ_O=
NCE'
      25 | #define arch_atomic_read(v)     READ_ONCE((v)->counter)
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:28:16: note: in expansion of =
macro 'arch_atomic_read'
      28 |         return arch_atomic_read(v);
         |                ^~~~~~~~~~~~~~~~
     'btrfs_discardable_extents_show': events 1-2
       |
       |fs/btrfs/sysfs.c:1138:12:
       |  451 |         return sysfs_emit(buf, "%d\n",
       |      |         ~~~~~~
       |      |         |
       |      |         (2) ...to here
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
     'btrfs_discardable_extents_show': event 3
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (3) dereference of NULL '<unknown>'
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   arch/arm/include/asm/atomic.h:25:33: note: in expansion of macro 'READ_O=
NCE'
       |   25 | #define arch_atomic_read(v)     READ_ONCE((v)->counter)
       |      |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:28:16: note: in expansion of =
macro 'arch_atomic_read'
       |   28 |         return arch_atomic_read(v);
       |      |                ^~~~~~~~~~~~~~~~
       |
   In file included from include/asm-generic/bitops/non-atomic.h:5,
                    from arch/arm/include/asm/bitops.h:123,
                    from include/linux/bitops.h:33,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from fs/btrfs/sysfs.c:6:
   include/linux/atomic/atomic-instrumented.h: In function 'quota_override_=
show':
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: derefer=
ence of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'quota_override_show': events 1-2
       |
       |fs/btrfs/sysfs.c:1138:12:
       |  888 |         int quota_override;
       |      |         ~~~ =

       |      |         |
       |      |         (2) ...to here
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
     'quota_override_show': event 3
       |
       |include/asm-generic/bitops/generic-non-atomic.h:127:27:
       |  127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER=
_LONG-1)));
       |      |                       ~~~~^~~~~~~~~~~~~~
       |      |                           |
       |      |                           (3) dereference of NULL '<unknown=
>'
       |
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from fs/btrfs/sysfs.c:6:
   include/linux/atomic/atomic-instrumented.h: In function 'btrfs_discard_i=
ops_limit_show':
   include/asm-generic/rwonce.h:44:26: warning: dereference of NULL '0' [CW=
E-476] [-Wanalyzer-null-dereference]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   fs/btrfs/sysfs.c:496:27: note: in expansion of macro 'READ_ONCE'
     496 |                           READ_ONCE(fs_info->discard_ctl.iops_li=
mit));
         |                           ^~~~~~~~~
     'btrfs_discard_iops_limit_show': events 1-2
       |
       |  495 |         return sysfs_emit(buf, "%u\n",
       |      |         ~~~~~~
       |      |         |
       |      |         (2) ...to here
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
     'btrfs_discard_iops_limit_show': event 3
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (3) dereference of NULL '<unknown>'
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   fs/btrfs/sysfs.c:496:27: note: in expansion of macro 'READ_ONCE'
       |  496 |                           READ_ONCE(fs_info->discard_ctl.io=
ps_limit));
       |      |                           ^~~~~~~~~
       |
   include/linux/atomic/atomic-instrumented.h: In function 'btrfs_discard_i=
ops_limit_store':
   include/asm-generic/rwonce.h:55:37: warning: dereference of NULL '0' [CW=
E-476] [-Wanalyzer-null-dereference]
      55 |         *(volatile typeof(x) *)&(x) =3D (val);                  =
          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_=
ONCE'
      61 |         __WRITE_ONCE(x, val);                                   =
        \
         |         ^~~~~~~~~~~~
   fs/btrfs/sysfs.c:512:9: note: in expansion of macro 'WRITE_ONCE'
     512 |         WRITE_ONCE(discard_ctl->iops_limit, iops_limit);
         |         ^~~~~~~~~~
     'btrfs_discard_iops_limit_store': events 1-3
       |
       |  504 |         struct btrfs_discard_ctl *discard_ctl =3D &fs_info-=
>discard_ctl;
       |      |         ~~~~~~
       |      |         |
       |      |         (2) ...to here
       |......
       |  509 |         if (ret)
       |      |            ~
       |      |            |
       |      |            (3) following 'false' branch...
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
     'btrfs_discard_iops_limit_store': event 4
       |
       |include/asm-generic/rwonce.h:59:1:
       |   59 | do {                                                       =
             \
       |      | ^~
--
       |......
       |  282 |         for (i =3D 0; i < ARRAY_SIZE(octets); i++) {
       |  283 |                 if (octets[i] > 255)
       |      |                 ~~ ~   =

       |      |                 |  |
       |      |                 |  (8) following 'false' branch...
       |      |                 (7) ...to here
       |  284 |                         return -ERANGE;
       |  285 |                 be32_add_cpu(&ipv4_addr, octets[i] << (i * =
8));
       |      |                 ~~~~~~~~~~~~
       |      |                 |
       |      |                 (9) ...to here
       |
     'o2nm_node_ipv4_address_store': events 12-14
       |
       |  148 |                 : NULL;
       |......
       |  290 |         if (!cluster) {
       |      |         ~~       =

       |      |         |
       |      |         (13) ...to here
       |......
       |  297 |         if (o2nm_node_ip_tree_lookup(cluster, ipv4_addr, &p=
, &parent))
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |      |             |
       |      |             (14) calling 'o2nm_node_ip_tree_lookup' from 'o=
2nm_node_ipv4_address_store'
       |
       +--> 'o2nm_node_ip_tree_lookup': events 15-21
              |
              |   64 | static struct o2nm_node *o2nm_node_ip_tree_lookup(st=
ruct o2nm_cluster *cluster,
              |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (15) entry to 'o2nm_node_ip=
_tree_lookup'
              |......
              |   73 |         while (*p) {
              |      |                ~          =

              |      |                |
              |      |                (16) following 'false' branch...
              |......
              |   91 |         if (ret_p !=3D NULL)
              |      |         ~~ ~              =

              |      |         |  |
              |      |         |  (18) following 'true' branch (when 'ret_p=
' is non-NULL)...
              |      |         (17) ...to here
              |   92 |                 *ret_p =3D p;
              |      |                 ~         =

              |      |                 |
              |      |                 (19) ...to here
              |   93 |         if (ret_parent !=3D NULL)
              |      |            ~              =

              |      |            |
              |      |            (20) following 'true' branch (when 'ret_p=
arent' is non-NULL)...
              |   94 |                 *ret_parent =3D parent;
              |      |                 ~         =

              |      |                 |
              |      |                 (21) ...to here
              |
       <------+
       |
     'o2nm_node_ipv4_address_store': events 22-24
       |
       |  297 |         if (o2nm_node_ip_tree_lookup(cluster, ipv4_addr, &p=
, &parent))
       |      |            ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |      |            ||
       |      |            |(22) returning to 'o2nm_node_ipv4_address_store=
' from 'o2nm_node_ip_tree_lookup'
       |      |            (23) following 'false' branch...
       |  298 |                 ret =3D -EEXIST;
       |  299 |         else if (test_and_set_bit(O2NM_NODE_ATTR_ADDRESS,
       |      |              ~~
       |      |              |
       |      |              (24) ...to here
       |
     'o2nm_node_ipv4_address_store': event 25
       |
       |arch/arm/include/asm/bitops.h:82:13:
       |   82 |         res =3D *p;
       |      |         ~~~~^~~~
       |      |             |
       |      |             (25) dereference of NULL '<unknown>'
       |
   In file included from include/asm-generic/bitops/non-atomic.h:5,
                    from arch/arm/include/asm/bitops.h:123,
                    from include/linux/bitops.h:33,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from fs/ocfs2/cluster/nodemanager.c:6:
   fs/ocfs2/cluster/nodemanager.c: In function 'o2nm_node_local_store':
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: derefer=
ence of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'o2nm_node_local_store': event 1
       |
       |fs/ocfs2/cluster/nodemanager.c:153:69:
       |  153 |         return item ? container_of(item, struct o2nm_node, =
nd_item) : NULL;
       |
     'o2nm_node_local_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'o2nm_node_local_store': events 3-4
       |
       |  332 |         if (!p || (*p && (*p !=3D '\n')))
       |      |            ^       ~~
       |      |            |       |
       |      |            |       (4) ...to here
       |      |            (3) following 'false' branch...
       |
     'o2nm_node_local_store': event 5
       |
       |include/asm-generic/bitops/generic-non-atomic.h:127:27:
       |  127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER=
_LONG-1)));
       |      |                       ~~~~^~~~~~~~~~~~~~
       |      |                           |
       |      |                           (5) dereference of NULL '<unknown=
>'
       |
   fs/ocfs2/cluster/nodemanager.c: In function 'o2nm_node_num_store':
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: derefer=
ence of NULL '0' [CWE-476] [-Wanalyzer-null-dereference]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'o2nm_node_num_store': event 1
       |
       |fs/ocfs2/cluster/nodemanager.c:153:69:
       |  153 |         return item ? container_of(item, struct o2nm_node, =
nd_item) : NULL;
       |
     'o2nm_node_num_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'o2nm_node_num_store': events 3-6
       |
       |  193 |         if (!p || (*p && (*p !=3D '\n')))
       |      |            ^       ~~
       |      |            |       |
       |      |            |       (4) ...to here
       |      |            (3) following 'false' branch...
       |......
       |  196 |         if (tmp >=3D O2NM_MAX_NODES)
       |      |            ~
       |      |            |
       |      |            (5) following 'false' branch (when 'tmp <=3D 254=
')...
       |......
       |  203 |         if (!test_bit(O2NM_NODE_ATTR_ADDRESS, &node->nd_set=
_attributes) ||
       |      |         ~~  =

       |      |         |
       |      |         (6) ...to here
       |
     'o2nm_node_num_store': event 7
       |
       |include/asm-generic/bitops/generic-non-atomic.h:127:27:
       |  127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER=
_LONG-1)));
       |      |                       ~~~~^~~~~~~~~~~~~~
       |      |                           |
       |      |                           (7) dereference of NULL '<unknown=
>'
       |
   In file included from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from fs/ocfs2/cluster/nodemanager.c:6:
   fs/ocfs2/cluster/nodemanager.c: In function 'o2nm_node_ipv4_address_stor=
e':
   include/linux/rbtree.h:63:23: warning: dereference of NULL '0' [CWE-476]=
 [-Wanalyzer-null-dereference]
      63 |         node->rb_left =3D node->rb_right =3D NULL;
     'o2nm_node_ipv4_address_store': event 1
       |
       |fs/ocfs2/cluster/nodemanager.c:266:16:
       |  266 | static ssize_t o2nm_node_ipv4_address_store(struct config_i=
tem *item,
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (1) entry to 'o2nm_node_ipv4_address_store'
       |
     'o2nm_node_ipv4_address_store': event 2
       |
       |  153 |         return item ? container_of(item, struct o2nm_node, =
nd_item) : NULL;
       |
     'o2nm_node_ipv4_address_store': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'o2nm_node_ipv4_address_store': event 4
       |
       |  279 |         if (ret !=3D 4)
       |      |            ^
       |      |            |
       |      |            (4) following 'false' branch (when 'ret =3D=3D 4=
')...
       |
     'o2nm_node_ipv4_address_store': event 5
       |
       |cc1:
       | (5): ...to here
       |
     'o2nm_node_ipv4_address_store': events 6-11
       |
       |  171 |         if (node->nd_item.ci_parent)
       |      |            ~           =

       |      |            |
       |      |            (10) following 'true' branch...
       |  172 |                 return to_o2nm_cluster(node->nd_item.ci_par=
ent->ci_parent);
       |      |                 ~~~~~~ =

       |      |                 |
       |      |                 (11) ...to here
       |......
       |  282 |         for (i =3D 0; i < ARRAY_SIZE(octets); i++) {
       |  283 |                 if (octets[i] > 255)
       |      |                 ~~ ~   =

       |      |                 |  |
       |      |                 |  (8) following 'false' branch...
       |      |                 (7) ...to here
       |  284 |                         return -ERANGE;
       |  285 |                 be32_add_cpu(&ipv4_addr, octets[i] << (i * =
8));
       |      |                 ~~~~~~~~~~~~
       |      |                 |
       |      |                 (9) ...to here
       |
     'o2nm_node_ipv4_address_store': events 12-14
       |

vim +/bh +127 include/asm-generic/bitops/generic-non-atomic.h

b9944c14c86ab2 Alexander Lobakin 2022-05-07  113  =

b9944c14c86ab2 Alexander Lobakin 2022-05-07  114  /**
b9944c14c86ab2 Alexander Lobakin 2022-05-07  115   * generic_test_bit - Det=
ermine whether a bit is set
b9944c14c86ab2 Alexander Lobakin 2022-05-07  116   * @nr: bit number to test
b9944c14c86ab2 Alexander Lobakin 2022-05-07  117   * @addr: Address to star=
t counting from
b9944c14c86ab2 Alexander Lobakin 2022-05-07  118   */
b9944c14c86ab2 Alexander Lobakin 2022-05-07  119  static __always_inline int
b9944c14c86ab2 Alexander Lobakin 2022-05-07  120  generic_test_bit(unsigned=
 int nr, const volatile unsigned long *addr)
b9944c14c86ab2 Alexander Lobakin 2022-05-07  121  {
b9944c14c86ab2 Alexander Lobakin 2022-05-07  122  	/*
b9944c14c86ab2 Alexander Lobakin 2022-05-07  123  	 * Unlike the bitops wit=
h the '__' prefix above, this one *is* atomic,
b9944c14c86ab2 Alexander Lobakin 2022-05-07  124  	 * so `volatile` must al=
ways stay here with no cast-aways. See
b9944c14c86ab2 Alexander Lobakin 2022-05-07  125  	 * `Documentation/atomic=
_bitops.txt` for the details.
b9944c14c86ab2 Alexander Lobakin 2022-05-07  126  	 */
b9944c14c86ab2 Alexander Lobakin 2022-05-07 @127  	return 1UL & (addr[BIT_W=
ORD(nr)] >> (nr & (BITS_PER_LONG-1)));
b9944c14c86ab2 Alexander Lobakin 2022-05-07  128  }
b9944c14c86ab2 Alexander Lobakin 2022-05-07  129  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5456043030665699048==--


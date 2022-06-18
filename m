Content-Type: multipart/mixed; boundary="===============5473701697288975509=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 6/7] include/linux/bitops.h:52:11: warning: dereference of NULL 'bh' [CWE-476]
Date: Sat, 18 Jun 2022 17:38:26 +0800
Message-ID: <202206181751.bC1tbnVx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5473701697288975509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/l=
inux/bitops.h:52:11: warning: dereference of NULL 'bh' [CWE-476] [-Wanalyze=
r-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: a8846f7b2f123f210694db27803e17fae1c15cbe [6/7] bitops: let optimize=
 out non-atomic bitops on compile-time constants
:::::: branch date: 20 hours ago
:::::: commit date: 21 hours ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220618/202206181751.bC1tbnVx-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/a8846f7b2f123f210694db27=
803e17fae1c15cbe
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout a8846f7b2f123f210694db27803e17fae1c15cbe
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
                                 'folio_flags': event 80
                                   |
                                   |include/linux/mmdebug.h:20:20:
                                   |   20 |                 if (unlikely(co=
nd)) {                                   \
                                   |      |                    ^
                                   |      |                    |
                                   |      |                    (80) followi=
ng 'false' branch...
   include/linux/mmdebug.h:94:39: note: in expansion of macro 'VM_BUG_ON_PA=
GE'
                                   |   94 | #define VM_BUG_ON_PGFLAGS(cond,=
 page) VM_BUG_ON_PAGE(cond, page)
                                   |      |                                =
       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:339:9: note: in expansion of macro 'VM_BUG_ON=
_PGFLAGS'
                                   |  339 |         VM_BUG_ON_PGFLAGS(n > 0=
 && !test_bit(PG_head, &page->flags), page);
                                   |      |         ^~~~~~~~~~~~~~~~~
                                   |
                                 'folio_flags': event 81
                                   |
                                   |include/linux/compiler-gcc.h:63:12:
                                   |   63 |         do {                   =
                 \
                                   |      |            ^
                                   |      |            |
                                   |      |            (81) ...to here
   arch/arm/include/asm/bug.h:54:9: note: in expansion of macro 'unreachabl=
e'
                                   |   54 |         unreachable();         =
                                 \
                                   |      |         ^~~~~~~~~~~
   arch/arm/include/asm/bug.h:24:33: note: in expansion of macro '__BUG'
                                   |   24 | #define _BUG(file, line, value)=
 __BUG(file, line, value)
                                   |      |                                =
 ^~~~~
   arch/arm/include/asm/bug.h:23:15: note: in expansion of macro '_BUG'
                                   |   23 | #define BUG() _BUG(__FILE__, __=
LINE__, BUG_INSTR_VALUE)
                                   |      |               ^~~~
   include/linux/mmdebug.h:22:25: note: in expansion of macro 'BUG'
                                   |   22 |                         BUG(); =
                                         \
                                   |      |                         ^~~
   include/linux/mmdebug.h:94:39: note: in expansion of macro 'VM_BUG_ON_PA=
GE'
                                   |   94 | #define VM_BUG_ON_PGFLAGS(cond,=
 page) VM_BUG_ON_PAGE(cond, page)
                                   |      |                                =
       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:339:9: note: in expansion of macro 'VM_BUG_ON=
_PGFLAGS'
                                   |  339 |         VM_BUG_ON_PGFLAGS(n > 0=
 && !test_bit(PG_head, &page->flags), page);
                                   |      |         ^~~~~~~~~~~~~~~~~
                                   |
                            <------+
                            |
                          'folio_test_uptodate': event 82
                            |
                            |  714 |         bool ret =3D test_bit(PG_uptod=
ate, folio_flags(folio, 0));
                            |      |                                       =
   ^~~~~~~~~~~~~~~~~~~~~
                            |      |                                       =
   |
                            |      |                                       =
   (82) returning to 'folio_test_uptodate' from 'folio_flags'
   include/linux/bitops.h:53:39: note: in definition of macro 'bitop'
                            |   53 |          const##op(nr, addr) : op(nr, =
addr))
                            |      |                                       =
^~~~
   include/linux/page-flags.h:714:20: note: in expansion of macro 'test_bit'
                            |  714 |         bool ret =3D test_bit(PG_uptod=
ate, folio_flags(folio, 0));
                            |      |                    ^~~~~~~~
                            |
                     <------+
                     |
                   'PageUptodate': event 83
                     |
                     |  731 |         return folio_test_uptodate(page_folio=
(page));
                     |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
                     |      |                |
                     |      |                (83) returning to 'PageUptodat=
e' from 'folio_test_uptodate'
                     |
              <------+
              |
            'create_empty_buffers': events 84-86
              |
              |fs/buffer.c:1573:29:
              | 1573 |                         if (PageUptodate(page))
              |      |                            ~^~~~~~~~~~~~~~~~~~
              |      |                            ||
              |      |                            |(84) returning to 'creat=
e_empty_buffers' from 'PageUptodate'
              |      |                            (85) following 'true' bra=
nch...
              | 1574 |                                 set_buffer_uptodate(=
bh);
              |      |                                 ~~~~~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (86) ...to here
              |
            'create_empty_buffers': event 87
              |
              |include/linux/buffer_head.h:90:13:
              |   90 |         if (!test_bit(BH_##bit, &(bh)->b_state))    =
                    \
              |      |             ^
              |      |             |
              |      |             (87) following 'false' branch...
   include/linux/buffer_head.h:120:1: note: in expansion of macro 'BUFFER_F=
NS'
              |  120 | BUFFER_FNS(Uptodate, uptodate)
              |      | ^~~~~~~~~~
              |
            'create_empty_buffers': events 88-89
              |
              |include/asm-generic/bitops/generic-non-atomic.h:127:9:
              |  127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (B=
ITS_PER_LONG-1)));
              |      |         ^~~~~~        ~~~~~~~~~~~~~~~~~~
              |      |         |                 |
              |      |         (88) ...to here   (89) dereference of NULL '=
bh'
              |
   In file included from include/linux/kernel.h:22,
                    from fs/buffer.c:22:
>> include/linux/bitops.h:52:11: warning: dereference of NULL 'bh' [CWE-476=
] [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   include/linux/buffer_head.h:90:14: note: in expansion of macro 'test_bit'
      90 |         if (!test_bit(BH_##bit, &(bh)->b_state))                =
        \
         |              ^~~~~~~~
   include/linux/buffer_head.h:120:1: note: in expansion of macro 'BUFFER_F=
NS'
     120 | BUFFER_FNS(Uptodate, uptodate)
         | ^~~~~~~~~~
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
   include/linux/bitops.h:53:39: note: in definition of macro 'bitop'
       |   53 |          const##op(nr, addr) : op(nr, addr))
       |      |                                       ^~~~
   include/linux/page-flags.h:402:10: note: in expansion of macro 'test_bit'
       |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
       |      |          ^~~~~~~~
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
   include/linux/bitops.h:53:39: note: in definition of macro 'bitop'
       |   53 |          const##op(nr, addr) : op(nr, addr))
       |      |                                       ^~~~
   include/linux/page-flags.h:402:10: note: in expansion of macro 'test_bit'
       |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
       |      |          ^~~~~~~~
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
--
   arch/arm/include/asm/bug.h:24:33: note: in expansion of macro '__BUG'
                                   |   24 | #define _BUG(file, line, value)=
 __BUG(file, line, value)
                                   |      |                                =
 ^~~~~
   arch/arm/include/asm/bug.h:23:15: note: in expansion of macro '_BUG'
                                   |   23 | #define BUG() _BUG(__FILE__, __=
LINE__, BUG_INSTR_VALUE)
                                   |      |               ^~~~
   include/linux/mmdebug.h:22:25: note: in expansion of macro 'BUG'
                                   |   22 |                         BUG(); =
                                         \
                                   |      |                         ^~~
   include/linux/mmdebug.h:94:39: note: in expansion of macro 'VM_BUG_ON_PA=
GE'
                                   |   94 | #define VM_BUG_ON_PGFLAGS(cond,=
 page) VM_BUG_ON_PAGE(cond, page)
                                   |      |                                =
       ^~~~~~~~~~~~~~
   include/linux/page-flags.h:339:9: note: in expansion of macro 'VM_BUG_ON=
_PGFLAGS'
                                   |  339 |         VM_BUG_ON_PGFLAGS(n > 0=
 && !test_bit(PG_head, &page->flags), page);
                                   |      |         ^~~~~~~~~~~~~~~~~
                                   |
                            <------+
                            |
                          'folio_test_uptodate': event 82
                            |
                            |  714 |         bool ret =3D test_bit(PG_uptod=
ate, folio_flags(folio, 0));
                            |      |                                       =
   ^~~~~~~~~~~~~~~~~~~~~
                            |      |                                       =
   |
                            |      |                                       =
   (82) returning to 'folio_test_uptodate' from 'folio_flags'
   include/linux/bitops.h:53:39: note: in definition of macro 'bitop'
                            |   53 |          const##op(nr, addr) : op(nr, =
addr))
                            |      |                                       =
^~~~
   include/linux/page-flags.h:714:20: note: in expansion of macro 'test_bit'
                            |  714 |         bool ret =3D test_bit(PG_uptod=
ate, folio_flags(folio, 0));
                            |      |                    ^~~~~~~~
                            |
                     <------+
                     |
                   'PageUptodate': event 83
                     |
                     |  731 |         return folio_test_uptodate(page_folio=
(page));
                     |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
                     |      |                |
                     |      |                (83) returning to 'PageUptodat=
e' from 'folio_test_uptodate'
                     |
              <------+
              |
            'create_empty_buffers': events 84-86
              |
              |fs/buffer.c:1573:29:
              | 1573 |                         if (PageUptodate(page))
              |      |                            ~^~~~~~~~~~~~~~~~~~
              |      |                            ||
              |      |                            |(84) returning to 'creat=
e_empty_buffers' from 'PageUptodate'
              |      |                            (85) following 'true' bra=
nch...
              | 1574 |                                 set_buffer_uptodate(=
bh);
              |      |                                 ~~~~~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (86) ...to here
              |
            'create_empty_buffers': event 87
              |
              |include/linux/buffer_head.h:90:13:
              |   90 |         if (!test_bit(BH_##bit, &(bh)->b_state))    =
                    \
              |      |             ^
              |      |             |
              |      |             (87) following 'true' branch...
   include/linux/buffer_head.h:120:1: note: in expansion of macro 'BUFFER_F=
NS'
              |  120 | BUFFER_FNS(Uptodate, uptodate)
              |      | ^~~~~~~~~~
              |
            'create_empty_buffers': event 88
              |
              |include/linux/bitops.h:52:11:
              |   52 |           __builtin_constant_p(*(const unsigned long=
 *)(addr))) ?       \
              |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
              |      |           |
              |      |           (88) ...to here
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
              |   61 | #define test_bit(nr, addr)              bitop(_test_=
bit, nr, addr)
              |      |                                         ^~~~~
   include/linux/buffer_head.h:90:14: note: in expansion of macro 'test_bit'
              |   90 |         if (!test_bit(BH_##bit, &(bh)->b_state))    =
                    \
              |      |              ^~~~~~~~
   include/linux/buffer_head.h:120:1: note: in expansion of macro 'BUFFER_F=
NS'
              |  120 | BUFFER_FNS(Uptodate, uptodate)
              |      | ^~~~~~~~~~
              |
            'create_empty_buffers': event 89
              |
              |include/linux/bitops.h:52:11:
              |   52 |           __builtin_constant_p(*(const unsigned long=
 *)(addr))) ?       \
              |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
              |      |           |
              |      |           (89) dereference of NULL 'bh'
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
              |   61 | #define test_bit(nr, addr)              bitop(_test_=
bit, nr, addr)
              |      |                                         ^~~~~
   include/linux/buffer_head.h:90:14: note: in expansion of macro 'test_bit'
              |   90 |         if (!test_bit(BH_##bit, &(bh)->b_state))    =
                    \
              |      |              ^~~~~~~~
   include/linux/buffer_head.h:120:1: note: in expansion of macro 'BUFFER_F=
NS'
              |  120 | BUFFER_FNS(Uptodate, uptodate)
              |      | ^~~~~~~~~~
              |
>> include/linux/bitops.h:52:11: warning: dereference of NULL 'bh' [CWE-476=
] [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   include/linux/buffer_head.h:90:14: note: in expansion of macro 'test_bit'
      90 |         if (!test_bit(BH_##bit, &(bh)->b_state))                =
        \
         |              ^~~~~~~~
   include/linux/buffer_head.h:121:1: note: in expansion of macro 'BUFFER_F=
NS'
     121 | BUFFER_FNS(Dirty, dirty)
         | ^~~~~~~~~~
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
   include/linux/bitops.h:53:39: note: in definition of macro 'bitop'
       |   53 |          const##op(nr, addr) : op(nr, addr))
       |      |                                       ^~~~
   include/linux/page-flags.h:402:10: note: in expansion of macro 'test_bit'
       |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
       |      |          ^~~~~~~~
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
   include/linux/bitops.h:53:39: note: in definition of macro 'bitop'
       |   53 |          const##op(nr, addr) : op(nr, addr))
       |      |                                       ^~~~
   include/linux/page-flags.h:402:10: note: in expansion of macro 'test_bit'
       |  402 | { return test_bit(PG_##lname, &policy(page, 0)->flags); }
       |      |          ^~~~~~~~
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
--
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
       |      |                 ^~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (20) ...to here
       | 1057 |                 /* Skip groups with suspicious inode tables=
 */
       | 1058 |                 if (((!(sbi->s_mount_state & EXT4_FC_REPLAY=
))
       |      |                    ~
       |      |                    |
       |      |                    (21) following 'true' branch...
       |
     '__ext4_new_inode': event 22
       |
       |fs/ext4/ext4.h:3435:56:
       | 3435 |         (test_bit(EXT4_GROUP_INFO_IBITMAP_CORRUPT_BIT, &((g=
rp)->bb_state)))
   include/linux/bitops.h:50:44: note: in definition of macro 'bitop'
       |   50 |           __builtin_constant_p((uintptr_t)(addr) !=3D (uint=
ptr_t)NULL) && \
       |      |                                            ^~~~
   fs/ext4/ext4.h:3435:10: note: in expansion of macro 'test_bit'
       | 3435 |         (test_bit(EXT4_GROUP_INFO_IBITMAP_CORRUPT_BIT, &((g=
rp)->bb_state)))
       |      |          ^~~~~~~~
   fs/ext4/ialloc.c:1059:25: note: in expansion of macro 'EXT4_MB_GRP_IBITM=
AP_CORRUPT'
       | 1059 |                      && EXT4_MB_GRP_IBITMAP_CORRUPT(grp)) ||
       |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     '__ext4_new_inode': event 23
       |
       | 1058 |                 if (((!(sbi->s_mount_state & EXT4_FC_REPLAY=
))
       |      |                    ^
       |      |                    |
       |      |                    (23) following 'false' branch...
       |
     '__ext4_new_inode': events 24-25
       |
       |include/asm-generic/bitops/generic-non-atomic.h:127:9:
       |  127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER=
_LONG-1)));
       |      |         ^~~~~~        ~~~~~~~~~~~~~~~~~~
       |      |         |                 |
       |      |         (24) ...to here   (25) dereference of NULL 'grp'
       |
   In file included from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from fs/ext4/ialloc.c:16:
>> include/linux/bitops.h:52:11: warning: dereference of NULL 'grp' [CWE-47=
6] [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   fs/ext4/ext4.h:3435:10: note: in expansion of macro 'test_bit'
    3435 |         (test_bit(EXT4_GROUP_INFO_IBITMAP_CORRUPT_BIT, &((grp)->=
bb_state)))
         |          ^~~~~~~~
   fs/ext4/ialloc.c:1059:25: note: in expansion of macro 'EXT4_MB_GRP_IBITM=
AP_CORRUPT'
    1059 |                      && EXT4_MB_GRP_IBITMAP_CORRUPT(grp)) ||
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
     '__ext4_new_inode': events 1-9
       |
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
--
   In file included from include/linux/string.h:5,
                    from include/linux/uuid.h:12,
                    from fs/xfs/xfs_linux.h:10,
                    from fs/xfs/xfs.h:22,
                    from fs/xfs/xfs_log_recover.c:6:
   fs/xfs/xfs_log_recover.c: In function 'xlog_header_check_mount':
>> fs/xfs/xfs_log_recover.c:244:20: warning: dereference of NULL 'head' [CW=
E-476] [-Wanalyzer-null-dereference]
     244 |         ASSERT(head->h_magicno =3D=3D cpu_to_be32(XLOG_HEADER_MA=
GIC_NUM));
         |                ~~~~^~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   fs/xfs/xfs_log_recover.c:244:9: note: in expansion of macro 'ASSERT'
     244 |         ASSERT(head->h_magicno =3D=3D cpu_to_be32(XLOG_HEADER_MA=
GIC_NUM));
         |         ^~~~~~
     'xlog_recover': events 1-2
       |
       | 3334 | xlog_recover(
       |      | ^~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xlog_recover'
       |......
       | 3341 |         error =3D xlog_find_tail(log, &head_blk, &tail_blk);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (2) calling 'xlog_find_tail' from 'xlog_rec=
over'
       |
       +--> 'xlog_find_tail': event 3
              |
              | 1239 | xlog_find_tail(
              |      | ^~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'xlog_find_tail'
              |
            'xlog_find_tail': event 4
              |
              |cc1:
              | (4): '=1B[01m=1B[Krhead=1B[m=1B[K' is NULL
              |
            'xlog_find_tail': event 5
              |
              | 1256 |         if ((error =3D xlog_find_head(log, head_blk)=
))
              |      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (5) calling 'xlog_find_head' fr=
om 'xlog_find_tail'
              |
              +--> 'xlog_find_head': events 6-7
                     |
                     |  498 | xlog_find_head(
                     |      | ^~~~~~~~~~~~~~
                     |      | |
                     |      | (6) entry to 'xlog_find_head'
                     |......
                     |  511 |         error =3D xlog_find_zeroed(log, &firs=
t_blk);
                     |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
                     |      |                 |
                     |      |                 (7) calling 'xlog_find_zeroed=
' from 'xlog_find_head'
                     |
                     +--> 'xlog_find_zeroed': events 8-9
                            |
                            | 1392 | xlog_find_zeroed(
                            |      | ^~~~~~~~~~~~~~~~
                            |      | |
                            |      | (8) entry to 'xlog_find_zeroed'
                            |......
                            | 1406 |         buffer =3D xlog_alloc_buffer(l=
og, 1);
                            |      |                  ~~~~~~~~~~~~~~~~~~~~~=
~~~~
                            |      |                  |
                            |      |                  (9) calling 'xlog_all=
oc_buffer' from 'xlog_find_zeroed'
                            |
                            +--> 'xlog_alloc_buffer': event 10
                                   |
                                   |   73 | xlog_alloc_buffer(
                                   |      | ^~~~~~~~~~~~~~~~~
                                   |      | |
                                   |      | (10) entry to 'xlog_alloc_buffe=
r'
                                   |
                                 'xlog_alloc_buffer': event 11
                                   |
                                   |fs/xfs/xfs_linux.h:223:9:
                                   |  223 |         (unlikely(expr) ? xfs_c=
orruption_error(#expr, XFS_ERRLEVEL_LOW, (mp), \
                                   |      |         ^
                                   |      |         |
                                   |      |         (11) following 'false' =
branch...
   fs/xfs/xfs_log_recover.c:81:13: note: in expansion of macro 'XFS_IS_CORR=
UPT'
                                   |   81 |         if (XFS_IS_CORRUPT(log-=
>l_mp, !xlog_verify_bno(log, 0, nbblks))) {
                                   |      |             ^~~~~~~~~~~~~~
                                   |
                                 'xlog_alloc_buffer': events 12-14
                                   |
                                   |  101 |         if (nbblks > 1 && log->=
l_sectBBsize > 1)
                                   |      |         ^~ ~
                                   |      |         |  |
                                   |      |         |  (13) following 'fals=
e' branch (when 'nbblks <=3D 1')...
                                   |      |         (12) ...to here
                                   |  102 |                 nbblks +=3D log=
->l_sectBBsize;
                                   |  103 |         nbblks =3D round_up(nbb=
lks, log->l_sectBBsize);
                                   |      |         ~~~~~~
                                   |      |         |
                                   |      |         (14) ...to here
                                   |
                            <------+
                            |
                          'xlog_find_zeroed': events 15-18
                            |
                            | 1406 |         buffer =3D xlog_alloc_buffer(l=
og, 1);
                            |      |                  ^~~~~~~~~~~~~~~~~~~~~=
~~~~
--
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
       +--> 'o2nm_node_ip_tree_lookup': events 15-19
              |
              |   64 | static struct o2nm_node *o2nm_node_ip_tree_lookup(st=
ruct o2nm_cluster *cluster,
              |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (15) entry to 'o2nm_node_ip=
_tree_lookup'
              |......
              |   91 |         if (ret_p !=3D NULL)
              |      |            ~              =

              |      |            |
              |      |            (16) following 'true' branch (when 'ret_p=
' is non-NULL)...
              |   92 |                 *ret_p =3D p;
              |      |                 ~         =

              |      |                 |
              |      |                 (17) ...to here
              |   93 |         if (ret_parent !=3D NULL)
              |      |            ~              =

              |      |            |
              |      |            (18) following 'true' branch (when 'ret_p=
arent' is non-NULL)...
              |   94 |                 *ret_parent =3D parent;
              |      |                 ~         =

              |      |                 |
              |      |                 (19) ...to here
              |
       <------+
       |
     'o2nm_node_ipv4_address_store': events 20-24
       |
       |  297 |         if (o2nm_node_ip_tree_lookup(cluster, ipv4_addr, &p=
, &parent))
       |      |            ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |      |            ||
       |      |            |(20) returning to 'o2nm_node_ipv4_address_store=
' from 'o2nm_node_ip_tree_lookup'
       |      |            (21) following 'false' branch...
       |  298 |                 ret =3D -EEXIST;
       |  299 |         else if (test_and_set_bit(O2NM_NODE_ATTR_ADDRESS,
       |      |              ~~ ~
       |      |              |  |
       |      |              |  (23) following 'false' branch...
       |      |              (22) ...to here
       |......
       |  303 |                 rb_link_node(&node->nd_ip_node, parent, p);
       |      |                 ~~~~~~~~~~~~
       |      |                 |
       |      |                 (24) ...to here
       |
     'o2nm_node_ipv4_address_store': event 25
       |
       |include/linux/rbtree.h:63:23:
       |   63 |         node->rb_left =3D node->rb_right =3D NULL;
       |
   fs/ocfs2/cluster/nodemanager.c: In function 'o2nm_node_num_show':
   fs/ocfs2/cluster/nodemanager.c:164:56: warning: dereference of NULL '0' =
[CWE-476] [-Wanalyzer-null-dereference]
     164 |         return sprintf(page, "%d\n", to_o2nm_node(item)->nd_num);
         |                                      ~~~~~~~~~~~~~~~~~~^~~~~~~~
     'o2nm_node_num_show': event 1
       |
       |  153 |         return item ? container_of(item, struct o2nm_node, =
nd_item) : NULL;
       |
     'o2nm_node_num_show': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'o2nm_node_num_show': event 3
       |
       |  164 |         return sprintf(page, "%d\n", to_o2nm_node(item)->nd=
_num);
       |      |                                      ~~~~~~~~~~~~~~~~~~^~~~=
~~~~
       |      |                                                        |
       |      |                                                        (3) =
dereference of NULL '<unknown>'
       |
   In file included from include/linux/log2.h:12,
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
   fs/ocfs2/cluster/nodemanager.c: In function 'o2nm_node_num_store':
>> include/linux/bitops.h:52:11: warning: dereference of NULL '0' [CWE-476]=
 [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   fs/ocfs2/cluster/nodemanager.c:203:14: note: in expansion of macro 'test=
_bit'
     203 |         if (!test_bit(O2NM_NODE_ATTR_ADDRESS, &node->nd_set_attr=
ibutes) ||
         |              ^~~~~~~~
     'o2nm_node_num_store': event 1
       |
       |  153 |         return item ? container_of(item, struct o2nm_node, =
nd_item) : NULL;
       |
     'o2nm_node_num_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'o2nm_node_num_store': events 3-7
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
       |      |         ~~ ~
       |      |         |  |
       |      |         |  (7) following 'true' branch...
       |      |         (6) ...to here
       |
     'o2nm_node_num_store': event 8
       |
       |include/linux/bitops.h:52:11:
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |           |
       |      |           (8) ...to here
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   fs/ocfs2/cluster/nodemanager.c:203:14: note: in expansion of macro 'test=
_bit'
       |  203 |         if (!test_bit(O2NM_NODE_ATTR_ADDRESS, &node->nd_set=
_attributes) ||
       |      |              ^~~~~~~~
       |
     'o2nm_node_num_store': event 9
       |
       |include/linux/bitops.h:52:11:
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |           |
       |      |           (9) dereference of NULL '<unknown>'
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   fs/ocfs2/cluster/nodemanager.c:203:14: note: in expansion of macro 'test=
_bit'
       |  203 |         if (!test_bit(O2NM_NODE_ATTR_ADDRESS, &node->nd_set=
_attributes) ||
       |      |              ^~~~~~~~
       |
   fs/ocfs2/cluster/nodemanager.c:222:30: warning: dereference of NULL '0' =
[CWE-476] [-Wanalyzer-null-dereference]
     222 |                 node->nd_num =3D tmp;
         |                 ~~~~~~~~~~~~~^~~~~
     'o2nm_node_num_store': event 1
       |
       |  153 |         return item ? container_of(item, struct o2nm_node, =
nd_item) : NULL;
       |
     'o2nm_node_num_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'o2nm_node_num_store': events 3-10
       |
       |  171 |         if (node->nd_item.ci_parent)
       |      |            ~
       |      |            |
       |      |            (9) following 'true' branch...
       |  172 |                 return to_o2nm_cluster(node->nd_item.ci_par=
ent->ci_parent);
       |      |                 ~~~~~~
       |      |                 |
       |      |                 (10) ...to here
       |......
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
       |      |         ~~                                                 =
             ~~
--
       |      |                 |                      |
       |      |                 |                      (17) '0' is NULL
       |      |                 (16) ...to here        (18) '0' is NULL
       |  222 |                 node->nd_num =3D tmp;
       |      |                 ~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (19) dereference of NULL '<unk=
nown>'
       |
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/arm/include/uapi/asm/byteorder.h:20,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arm/include/asm/bitops.h:267,
                    from include/linux/bitops.h:67,
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
   fs/ocfs2/cluster/nodemanager.c: In function 'o2nm_node_ipv4_port_show':
   fs/ocfs2/cluster/nodemanager.c:235:62: warning: dereference of NULL '0' =
[CWE-476] [-Wanalyzer-null-dereference]
     235 |         return sprintf(page, "%u\n", ntohs(to_o2nm_node(item)->n=
d_ipv4_port));
   include/uapi/linux/byteorder/big_endian.h:43:51: note: in definition of =
macro '__be16_to_cpu'
      43 | #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
         |                                                   ^
   include/linux/byteorder/generic.h:142:18: note: in expansion of macro '_=
__ntohs'
     142 | #define ntohs(x) ___ntohs(x)
         |                  ^~~~~~~~
   fs/ocfs2/cluster/nodemanager.c:235:38: note: in expansion of macro 'ntoh=
s'
     235 |         return sprintf(page, "%u\n", ntohs(to_o2nm_node(item)->n=
d_ipv4_port));
         |                                      ^~~~~
     'o2nm_node_ipv4_port_show': event 1
       |
       |  153 |         return item ? container_of(item, struct o2nm_node, =
nd_item) : NULL;
       |
     'o2nm_node_ipv4_port_show': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'o2nm_node_ipv4_port_show': event 3
       |
       |  235 |         return sprintf(page, "%u\n", ntohs(to_o2nm_node(ite=
m)->nd_ipv4_port));
   include/uapi/linux/byteorder/big_endian.h:43:51: note: in definition of =
macro '__be16_to_cpu'
       |   43 | #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
       |      |                                                   ^
   include/linux/byteorder/generic.h:142:18: note: in expansion of macro '_=
__ntohs'
       |  142 | #define ntohs(x) ___ntohs(x)
       |      |                  ^~~~~~~~
   fs/ocfs2/cluster/nodemanager.c:235:38: note: in expansion of macro 'ntoh=
s'
       |  235 |         return sprintf(page, "%u\n", ntohs(to_o2nm_node(ite=
m)->nd_ipv4_port));
       |      |                                      ^~~~~
       |
   fs/ocfs2/cluster/nodemanager.c: In function 'o2nm_node_local_show':
   fs/ocfs2/cluster/nodemanager.c:319:16: warning: dereference of NULL '0' =
[CWE-476] [-Wanalyzer-null-dereference]
     319 |         return sprintf(page, "%d\n", to_o2nm_node(item)->nd_loca=
l);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
     'o2nm_node_local_show': event 1
       |
       |  153 |         return item ? container_of(item, struct o2nm_node, =
nd_item) : NULL;
       |
     'o2nm_node_local_show': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'o2nm_node_local_show': event 3
       |
       |  319 |         return sprintf(page, "%d\n", to_o2nm_node(item)->nd=
_local);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |                |
       |      |                (3) dereference of NULL '<unknown>'
       |
   In file included from include/linux/log2.h:12,
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
>> include/linux/bitops.h:52:11: warning: dereference of NULL '0' [CWE-476]=
 [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   fs/ocfs2/cluster/nodemanager.c:339:14: note: in expansion of macro 'test=
_bit'
     339 |         if (!test_bit(O2NM_NODE_ATTR_ADDRESS, &node->nd_set_attr=
ibutes) ||
         |              ^~~~~~~~
     'o2nm_node_local_store': event 1
       |
       |  153 |         return item ? container_of(item, struct o2nm_node, =
nd_item) : NULL;
       |
     'o2nm_node_local_store': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'o2nm_node_local_store': events 3-5
       |
       |  332 |         if (!p || (*p && (*p !=3D '\n')))
       |      |            ^       ~~
       |      |            |       |
       |      |            |       (4) ...to here
       |      |            (3) following 'false' branch...
       |......
       |  339 |         if (!test_bit(O2NM_NODE_ATTR_ADDRESS, &node->nd_set=
_attributes) ||
       |      |            ~
       |      |            |
       |      |            (5) following 'true' branch...
       |
     'o2nm_node_local_store': event 6
       |
       |include/linux/bitops.h:52:11:
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |           |
       |      |           (6) ...to here
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   fs/ocfs2/cluster/nodemanager.c:339:14: note: in expansion of macro 'test=
_bit'
       |  339 |         if (!test_bit(O2NM_NODE_ATTR_ADDRESS, &node->nd_set=
_attributes) ||
       |      |              ^~~~~~~~
       |
     'o2nm_node_local_store': event 7
       |
       |include/linux/bitops.h:52:11:
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |           |
       |      |           (7) dereference of NULL '<unknown>'
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   fs/ocfs2/cluster/nodemanager.c:339:14: note: in expansion of macro 'test=
_bit'
       |  339 |         if (!test_bit(O2NM_NODE_ATTR_ADDRESS, &node->nd_set=
_attributes) ||
       |      |              ^~~~~~~~
       |
   fs/ocfs2/cluster/nodemanager.c: In function 'o2nm_cluster_idle_timeout_m=
s_show':
   fs/ocfs2/cluster/nodemanager.c:447:16: warning: dereference of NULL '0' =
[CWE-476] [-Wanalyzer-null-dereference]
     447 |         return sprintf(page, "%u\n", to_o2nm_cluster(item)->cl_i=
dle_timeout_ms);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
     'o2nm_cluster_idle_timeout_ms_show': events 1-3
       |
       |  148 |                 : NULL;
       |......
       |  447 |         return sprintf(page, "%u\n", to_o2nm_cluster(item)-=
>cl_idle_timeout_ms);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) ...to here
       |      |                (3) dereference of NULL '<unknown>'
       |
   fs/ocfs2/cluster/nodemanager.c: In function 'o2nm_cluster_idle_timeout_m=
s_store':
   fs/ocfs2/cluster/nodemanager.c:460:28: warning: dereference of NULL '0' =
[CWE-476] [-Wanalyzer-null-dereference]
     460 |                 if (cluster->cl_idle_timeout_ms !=3D val
         |                     ~~~~~~~^~~~~~~~~~~~~~~~~~~~
     'o2nm_cluster_idle_timeout_ms_store': event 1
       |
       |  450 | static ssize_t o2nm_cluster_idle_timeout_ms_store(struct co=
nfig_item *item,
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (1) entry to 'o2nm_cluster_idle_timeout_ms_s=
tore'
       |
     'o2nm_cluster_idle_timeout_ms_store': events 2-4
       |
       |  148 |                 : NULL;
       |......
       |  454 |         ssize_t ret;
       |      |         ~~~~~~~  =

       |      |         |
       |      |         (3) ...to here
       |......
       |  457 |         ret =3D  o2nm_cluster_attr_write(page, count, &val);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (4) calling 'o2nm_cluster_attr_write' from '=
o2nm_cluster_idle_timeout_ms_store'
       |
       +--> 'o2nm_cluster_attr_write': events 5-11
              |
              |  424 | static ssize_t o2nm_cluster_attr_write(const char *p=
age, ssize_t count,
--
   In file included from net/netfilter/ipset/ip_set_hash_ipmac.c:194:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_ipmac6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_197->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipmac6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipmac.c:189:25:
       |  189 | #define MTYPE           hash_ipmac6
       |      |                         ^~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipmac6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipmac6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipmac6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                 ~  =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'hash_ipmac6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipmac6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipmac6_add': events 7-9
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |  862 |                 u32 e;
       |      |                 ~~~
       |      |                 |
       |      |                 (8) ...to here
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ~
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipmac6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipmac6_add': event 11
       |
       |net/netfilter/ipset/ip_set_hash_ipmac.c:189:25:
       |  189 | #define MTYPE           hash_ipmac6
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:277:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:277:45: note: in expansion of macr=
o 'MTYPE'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
--
   In file included from net/netfilter/ipset/ip_set_hash_ipmark.c:211:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_ipmark6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_197->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipmark6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipmark.c:208:25:
       |  208 | #define MTYPE           hash_ipmark6
       |      |                         ^~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipmark6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipmark6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipmark6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                 ~  =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'hash_ipmark6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipmark6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipmark6_add': events 7-9
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |  862 |                 u32 e;
       |      |                 ~~~
       |      |                 |
       |      |                 (8) ...to here
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ~
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipmark6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipmark6_add': event 11
       |
       |net/netfilter/ipset/ip_set_hash_ipmark.c:208:25:
       |  208 | #define MTYPE           hash_ipmark6
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:277:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:277:45: note: in expansion of macr=
o 'MTYPE'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
--
   In file included from net/netfilter/ipset/ip_set_hash_ipport.c:246:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_ipport6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_197->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipport6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipport.c:243:25:
       |  243 | #define MTYPE           hash_ipport6
       |      |                         ^~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipport6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipport6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipport6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                 ~  =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'hash_ipport6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipport6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipport6_add': events 7-9
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |  862 |                 u32 e;
       |      |                 ~~~
       |      |                 |
       |      |                 (8) ...to here
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ~
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipport6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipport6_add': event 11
       |
       |net/netfilter/ipset/ip_set_hash_ipport.c:243:25:
       |  243 | #define MTYPE           hash_ipport6
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:277:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:277:45: note: in expansion of macr=
o 'MTYPE'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
--
   In file included from net/netfilter/ipset/ip_set_hash_ipportip.c:256:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_ipportip6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_197->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipportip6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipportip.c:253:25:
       |  253 | #define MTYPE           hash_ipportip6
       |      |                         ^~~~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipportip6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipportip6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipportip6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                 ~  =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'hash_ipportip6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipportip6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipportip6_add': events 7-9
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |  862 |                 u32 e;
       |      |                 ~~~
       |      |                 |
       |      |                 (8) ...to here
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ~
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipportip6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipportip6_add': event 11
       |
       |net/netfilter/ipset/ip_set_hash_ipportip.c:253:25:
       |  253 | #define MTYPE           hash_ipportip6
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:277:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:277:45: note: in expansion of macr=
o 'MTYPE'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
--
   In file included from net/netfilter/ipset/ip_set_hash_ipportnet.c:385:
   net/netfilter/ipset/ip_set_hash_ipportnet.c: In function 'hash_ipportnet=
6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_209->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_ipportnet6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_ipportnet.c:382:25:
       |  382 | #define MTYPE           hash_ipportnet6
       |      |                         ^~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_ipportnet6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_ipportnet6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_ipportnet6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                 ~  =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'hash_ipportnet6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_ipportnet6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_ipportnet6_add': events 7-9
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |  862 |                 u32 e;
       |      |                 ~~~
       |      |                 |
       |      |                 (8) ...to here
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ~
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_ipportnet6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_ipportnet6_add': event 11
       |
       |net/netfilter/ipset/ip_set_hash_ipportnet.c:382:25:
       |  382 | #define MTYPE           hash_ipportnet6
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:277:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:277:45: note: in expansion of macr=
o 'MTYPE'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
--
   In file included from net/netfilter/ipset/ip_set_hash_netiface.c:378:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_netiface6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_212->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_netiface6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_netiface.c:374:25:
       |  374 | #define MTYPE           hash_netiface6
       |      |                         ^~~~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_netiface6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_netiface6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_netiface6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                 ~  =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'hash_netiface6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_netiface6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_netiface6_add': events 7-9
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |  862 |                 u32 e;
       |      |                 ~~~
       |      |                 |
       |      |                 (8) ...to here
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ~
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_netiface6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_netiface6_add': event 11
       |
       |net/netfilter/ipset/ip_set_hash_netiface.c:374:25:
       |  374 | #define MTYPE           hash_netiface6
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:277:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:277:45: note: in expansion of macr=
o 'MTYPE'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
--
   In file included from net/netfilter/ipset/ip_set_hash_netnet.c:378:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_netnet6_add':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_211->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_netnet6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_netnet.c:375:25:
       |  375 | #define MTYPE           hash_netnet6
       |      |                         ^~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_netnet6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_netnet6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_netnet6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                 ~  =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'hash_netnet6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_netnet6_add' from 'jhash2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_netnet6_add': events 7-9
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |  862 |                 u32 e;
       |      |                 ~~~
       |      |                 |
       |      |                 (8) ...to here
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ~
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_netnet6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_netnet6_add': event 11
       |
       |net/netfilter/ipset/ip_set_hash_netnet.c:375:25:
       |  375 | #define MTYPE           hash_netnet6
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:277:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:277:45: note: in expansion of macr=
o 'MTYPE'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
--
   In file included from net/netfilter/ipset/ip_set_hash_netportnet.c:433:
   net/netfilter/ipset/ip_set_hash_gen.h: In function 'hash_netportnet6_add=
':
>> net/netfilter/ipset/ip_set_hash_gen.h:894:26: warning: dereference of NU=
LL '*h_211->table.bucket[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
     894 |         for (i =3D 0; i < n->pos; i++) {
         |                         ~^~~~~
     'hash_netportnet6_add': event 1
       |
       |net/netfilter/ipset/ip_set_hash_netportnet.c:430:25:
       |  430 | #define MTYPE           hash_netportnet6
       |      |                         ^~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (1) entry to 'hash_netportnet6_add'
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:267:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:267:45: note: in expansion of macr=
o 'MTYPE'
       |  267 | #define mtype_add               IPSET_TOKEN(MTYPE, _add)
       |      |                                             ^~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:841:1: note: in expansion of macro=
 'mtype_add'
       |  841 | mtype_add(struct ip_set *set, void *value, const struct ip_=
set_ext *ext,
       |      | ^~~~~~~~~
       |
     'hash_netportnet6_add': event 2
       |
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'jhash2' from 'hash_netportnet6_add'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
       +--> 'jhash2': events 3-5
              |
              |include/linux/jhash.h:117:19:
              |  117 | static inline u32 jhash2(const u32 *k, u32 length, u=
32 initval)
              |      |                   ^~~~~~
              |      |                   |
              |      |                   (3) entry to 'jhash2'
              |......
              |  125 |         while (length > 3) {
              |      |                ~~~~~~~~~~
              |      |                       |
              |      |                       (4) following 'true' branch (w=
hen 'length > 3')...
              |  126 |                 a +=3D k[0];
              |      |                 ~  =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'hash_netportnet6_add': event 6
       |
       |net/netfilter/ipset/ip_set_hash_gen.h:296:9:
       |  296 |         jhash2(__k, __l, initval) & jhash_mask(htable_bits)=
;    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) returning to 'hash_netportnet6_add' from 'jhash=
2'
   net/netfilter/ipset/ip_set_hash_gen.h:856:15: note: in expansion of macr=
o 'HKEY'
       |  856 |         key =3D HKEY(value, h->initval, t->htable_bits);
       |      |               ^~~~
       |
     'hash_netportnet6_add': events 7-9
       |
       |  861 |         if (elements >=3D maxelem) {
       |      |            ^
       |      |            |
       |      |            (7) following 'true' branch (when 'elements >=3D=
 maxelem')...
       |  862 |                 u32 e;
       |      |                 ~~~
       |      |                 |
       |      |                 (8) ...to here
       |  863 |                 if (SET_WITH_TIMEOUT(set)) {
       |      |                    ~
       |      |                    |
       |      |                    (9) following 'true' branch...
       |
     'hash_netportnet6_add': event 10
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (10) ...to here
   include/linux/bottom_half.h:33:30: note: in expansion of macro '_THIS_IP=
_'
       |   33 |         __local_bh_enable_ip(_THIS_IP_, SOFTIRQ_DISABLE_OFF=
SET);
       |      |                              ^~~~~~~~~
       |
     'hash_netportnet6_add': event 11
       |
       |net/netfilter/ipset/ip_set_hash_netportnet.c:430:25:
       |  430 | #define MTYPE           hash_netportnet6
   include/linux/netfilter/ipset/ip_set.h:526:41: note: in definition of ma=
cro 'IPSET_CONCAT'
       |  526 | #define IPSET_CONCAT(a, b)              a##b
       |      |                                         ^
   net/netfilter/ipset/ip_set_hash_gen.h:277:33: note: in expansion of macr=
o 'IPSET_TOKEN'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
       |      |                                 ^~~~~~~~~~~
   net/netfilter/ipset/ip_set_hash_gen.h:277:45: note: in expansion of macr=
o 'MTYPE'
       |  277 | #define mtype_gc_do             IPSET_TOKEN(MTYPE, _gc_do)
--
       |      | (4) ...to here
   fs/btrfs/sysfs.c:573:9: note: in expansion of macro 'WRITE_ONCE'
       |  573 |         WRITE_ONCE(discard_ctl->max_discard_size, max_disca=
rd_size);
       |      |         ^~~~~~~~~~
       |
     'btrfs_discard_max_discard_size_store': event 5
       |
       |include/asm-generic/rwonce.h:55:37:
       |   55 |         *(volatile typeof(x) *)&(x) =3D (val);             =
               \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
       |      |                                     |
       |      |                                     (5) dereference of NULL=
 '<unknown>'
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_=
ONCE'
       |   61 |         __WRITE_ONCE(x, val);                              =
             \
       |      |         ^~~~~~~~~~~~
   fs/btrfs/sysfs.c:573:9: note: in expansion of macro 'WRITE_ONCE'
       |  573 |         WRITE_ONCE(discard_ctl->max_discard_size, max_disca=
rd_size);
       |      |         ^~~~~~~~~~
       |
   include/linux/atomic/atomic-instrumented.h: In function 'btrfs_label_sho=
w':
   fs/btrfs/sysfs.c:807:30: warning: dereference of NULL '0' [CWE-476] [-Wa=
nalyzer-null-dereference]
     807 |         char *label =3D fs_info->super_copy->label;
         |                       ~~~~~~~^~~~~~~~~~~~
     'btrfs_label_show': events 1-3
       |
       |  807 |         char *label =3D fs_info->super_copy->label;
       |      |         ~~~~          ~~~~~~~~~~~~~~~~~~~
       |      |         |                    |
       |      |         (2) ...to here       (3) dereference of NULL '<unkn=
own>'
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
   include/linux/atomic/atomic-instrumented.h: In function 'btrfs_nodesize_=
show':
   fs/btrfs/sysfs.c:859:47: warning: dereference of NULL '0' [CWE-476] [-Wa=
nalyzer-null-dereference]
     859 |         return sysfs_emit(buf, "%u\n", fs_info->super_copy->node=
size);
         |                                        ~~~~~~~^~~~~~~~~~~~
     'btrfs_nodesize_show': events 1-3
       |
       |  859 |         return sysfs_emit(buf, "%u\n", fs_info->super_copy-=
>nodesize);
       |      |         ~~~~~~                         ~~~~~~~~~~~~~~~~~~~
       |      |         |                                     |
       |      |         (2) ...to here                        (3) dereferen=
ce of NULL '<unknown>'
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
   include/linux/atomic/atomic-instrumented.h: In function 'btrfs_sectorsiz=
e_show':
   fs/btrfs/sysfs.c:869:47: warning: dereference of NULL '0' [CWE-476] [-Wa=
nalyzer-null-dereference]
     869 |         return sysfs_emit(buf, "%u\n", fs_info->super_copy->sect=
orsize);
         |                                        ~~~~~~~^~~~~~~~~~~~
     'btrfs_sectorsize_show': events 1-3
       |
       |  869 |         return sysfs_emit(buf, "%u\n", fs_info->super_copy-=
>sectorsize);
       |      |         ~~~~~~                         ~~~~~~~~~~~~~~~~~~~
       |      |         |                                     |
       |      |         (2) ...to here                        (3) dereferen=
ce of NULL '<unknown>'
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
   include/linux/atomic/atomic-instrumented.h: In function 'btrfs_clone_ali=
gnment_show':
   fs/btrfs/sysfs.c:879:47: warning: dereference of NULL '0' [CWE-476] [-Wa=
nalyzer-null-dereference]
     879 |         return sysfs_emit(buf, "%u\n", fs_info->super_copy->sect=
orsize);
         |                                        ~~~~~~~^~~~~~~~~~~~
     'btrfs_clone_alignment_show': events 1-3
       |
       |  879 |         return sysfs_emit(buf, "%u\n", fs_info->super_copy-=
>sectorsize);
       |      |         ~~~~~~                         ~~~~~~~~~~~~~~~~~~~
       |      |         |                                     |
       |      |         (2) ...to here                        (3) dereferen=
ce of NULL '<unknown>'
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
   In file included from include/linux/log2.h:12,
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
>> include/linux/bitops.h:52:11: warning: dereference of NULL '0' [CWE-476]=
 [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   fs/btrfs/sysfs.c:890:26: note: in expansion of macro 'test_bit'
     890 |         quota_override =3D test_bit(BTRFS_FS_QUOTA_OVERRIDE, &fs=
_info->flags);
         |                          ^~~~~~~~
     'quota_override_show': events 1-2
       |
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
       |include/linux/bitops.h:53:30:
       |   49 |         ((__builtin_constant_p(nr) &&                      =
             \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |   50 |           __builtin_constant_p((uintptr_t)(addr) !=3D (uint=
ptr_t)NULL) && \
       |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |   51 |           (uintptr_t)(addr) !=3D (uintptr_t)NULL &&        =
               \
       |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |   53 |          const##op(nr, addr) : op(nr, addr))
       |      |          ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (3) following 'true' branch...
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   fs/btrfs/sysfs.c:890:26: note: in expansion of macro 'test_bit'
       |  890 |         quota_override =3D test_bit(BTRFS_FS_QUOTA_OVERRIDE=
, &fs_info->flags);
       |      |                          ^~~~~~~~
       |
     'quota_override_show': event 4
       |
       |include/linux/bitops.h:52:11:
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |           |
       |      |           (4) ...to here
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   fs/btrfs/sysfs.c:890:26: note: in expansion of macro 'test_bit'
       |  890 |         quota_override =3D test_bit(BTRFS_FS_QUOTA_OVERRIDE=
, &fs_info->flags);
       |      |                          ^~~~~~~~
       |
     'quota_override_show': event 5
       |
       |include/linux/bitops.h:52:11:
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |           |
       |      |           (5) dereference of NULL '<unknown>'
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   fs/btrfs/sysfs.c:890:26: note: in expansion of macro 'test_bit'
       |  890 |         quota_override =3D test_bit(BTRFS_FS_QUOTA_OVERRIDE=
, &fs_info->flags);
       |      |                          ^~~~~~~~
       |
   include/linux/atomic/atomic-instrumented.h: In function 'btrfs_metadata_=
uuid_show':
   fs/btrfs/sysfs.c:929:48: warning: dereference of NULL '0' [CWE-476] [-Wa=
nalyzer-null-dereference]
     929 |         return sysfs_emit(buf, "%pU\n", fs_info->fs_devices->met=
adata_uuid);
         |                                         ~~~~~~~^~~~~~~~~~~~
     'btrfs_metadata_uuid_show': events 1-3
       |
       |  929 |         return sysfs_emit(buf, "%pU\n", fs_info->fs_devices=
->metadata_uuid);
       |      |         ~~~~~~                          ~~~~~~~~~~~~~~~~~~~
       |      |         |                                      |
       |      |         (2) ...to here                         (3) derefere=
nce of NULL '<unknown>'
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |
   include/linux/atomic/atomic-instrumented.h: In function 'btrfs_checksum_=
show':
   fs/btrfs/sysfs.c:938:54: warning: dereference of NULL '0' [CWE-476] [-Wa=
nalyzer-null-dereference]
     938 |         u16 csum_type =3D btrfs_super_csum_type(fs_info->super_c=
opy);
         |                                               ~~~~~~~^~~~~~~~~~~~
     'btrfs_checksum_show': events 1-3
       |
       |  938 |         u16 csum_type =3D btrfs_super_csum_type(fs_info->su=
per_copy);
       |      |         ~~~                                   ~~~~~~~~~~~~~=
~~~~~~
       |      |         |                                            |
       |      |         (2) ...to here                               (3) de=
reference of NULL '<unknown>'
       |......
       | 1138 |         if (kobj->ktype !=3D &btrfs_ktype)
       |      |            ^
       |      |            |
--
              | 3211 |                 kfree_skb(skb);
              | 3212 | }
              |      | ~                                           =

              |      | |
              |      | (14) ...to here
              |
       <------+
       |
     'tipc_bearer_xmit': event 15
       |
       |net/tipc/bearer.c:583:17:
       |  583 |                 __skb_queue_purge(xmitq);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (15) returning to 'tipc_bearer_xmit' from '=
__skb_queue_purge'
       |
     'tipc_bearer_xmit': event 16
       |
       |include/linux/skbuff.h:3928:26:
       | 3928 |                      skb !=3D (struct sk_buff *)(queue);   =
                       \
   net/tipc/bearer.c:584:9: note: in expansion of macro 'skb_queue_walk_saf=
e'
       |  584 |         skb_queue_walk_safe(xmitq, skb, tmp) {
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'tipc_bearer_xmit': events 17-18
       |
       |  585 |                 __skb_dequeue(xmitq);
       |      |                 ^~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (17) ...to here
       |      |                 (18) calling '__skb_dequeue' from 'tipc_bea=
rer_xmit'
       |
       +--> '__skb_dequeue': events 19-23
              |
              |include/linux/skbuff.h:2480:31:
              | 2178 |         if (skb =3D=3D (struct sk_buff *)list_)
              |      |            ~                   =

              |      |            |
              |      |            (20) following 'false' branch (when 'list=
 !=3D skb')...
              | 2179 |                 skb =3D NULL;
              | 2180 |         return skb;
              |      |         ~~~~~~                 =

              |      |         |
              |      |         (21) ...to here
              |......
              | 2480 | static inline struct sk_buff *__skb_dequeue(struct s=
k_buff_head *list)
              |      |                               ^~~~~~~~~~~~~
              |      |                               |
              |      |                               (19) entry to '__skb_d=
equeue'
              |......
              | 2483 |         if (skb)
              |      |            ~                   =

              |      |            |
              |      |            (22) following 'false' branch (when 'skb'=
 is NULL)...
              | 2484 |                 __skb_unlink(skb, list);
              | 2485 |         return skb;
              |      |         ~~~~~~                 =

              |      |         |
              |      |         (23) ...to here
              |
       <------+
       |
     'tipc_bearer_xmit': event 24
       |
       |net/tipc/bearer.c:585:17:
       |  585 |                 __skb_dequeue(xmitq);
       |      |                 ^~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (24) returning to 'tipc_bearer_xmit' from '=
__skb_dequeue'
       |
     'tipc_bearer_xmit': event 25
       |
       |include/linux/compiler.h:77:25:
       |   77 | # define likely(x)      __builtin_expect(!!(x), 1)
       |      |                         ^~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (25) following 'false' branch...
   net/tipc/bearer.c:586:21: note: in expansion of macro 'likely'
       |  586 |                 if (likely(test_bit(0, &b->up) || msg_is_re=
set(buf_msg(skb)))) {
       |      |                     ^~~~~~
       |
     'tipc_bearer_xmit': events 26-27
       |
       |include/asm-generic/bitops/generic-non-atomic.h:127:9:
       |  127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER=
_LONG-1)));
       |      |         ^~~~~~        ~~~~~~~~~~~~~~~~~~
       |      |         |                 |
       |      |         (26) ...to here   (27) dereference of NULL '*(struc=
t tipc_net *)ptr.bearer_list[<unknown>]'
       |
   In file included from include/uapi/linux/swab.h:6,
                    from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/net/sock.h:38,
                    from net/tipc/bearer.c:37:
>> include/linux/bitops.h:52:11: warning: dereference of NULL '*(struct tip=
c_net *)ptr.bearer_list[<unknown>]' [CWE-476] [-Wanalyzer-null-dereference]
      52 |           __builtin_constant_p(*(const unsigned long *)(addr))) =
?       \
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, add=
r)
         |                                         ^~~~~
   net/tipc/bearer.c:586:28: note: in expansion of macro 'test_bit'
     586 |                 if (likely(test_bit(0, &b->up) || msg_is_reset(b=
uf_msg(skb)))) {
         |                            ^~~~~~~~
     'tipc_bearer_xmit': events 1-6
       |
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
              +--> '__skb_dequeue': events 9-11
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
                     |
              <------+
              |
            '__skb_queue_purge': event 12
              |
              | 3210 |         while ((skb =3D __skb_dequeue(list)) !=3D NU=
LL)
              |      |                       ^~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (12) returning to '__skb_queue=
_purge' from '__skb_dequeue'
              |
            '__skb_queue_purge': events 13-14
              |
              | 3210 |         while ((skb =3D __skb_dequeue(list)) !=3D NU=
LL)
              | 3211 |                 kfree_skb(skb);
              | 3212 | }
              |      | ~                                           =

              |      | |
              |      | (14) ...to here
              |
       <------+
       |
     'tipc_bearer_xmit': event 15
       |
       |net/tipc/bearer.c:583:17:
       |  583 |                 __skb_queue_purge(xmitq);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (15) returning to 'tipc_bearer_xmit' from '=
__skb_queue_purge'
       |
     'tipc_bearer_xmit': event 16
       |
       |include/linux/skbuff.h:3928:26:
       | 3928 |                      skb !=3D (struct sk_buff *)(queue);   =
                       \
--
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/kernel.h:20,
                    from net/mptcp/subflow.c:9:
   net/mptcp/subflow.c: In function 'subflow_syn_recv_sock':
>> include/asm-generic/rwonce.h:55:37: warning: dereference of NULL 'new_ms=
k' [CWE-476] [-Wanalyzer-null-dereference]
      55 |         *(volatile typeof(x) *)&(x) =3D (val);                  =
          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_=
ONCE'
      61 |         __WRITE_ONCE(x, val);                                   =
        \
         |         ^~~~~~~~~~~~
   net/mptcp/subflow.c:670:9: note: in expansion of macro 'WRITE_ONCE'
     670 |         WRITE_ONCE(msk->fully_established, true);
         |         ^~~~~~~~~~
     'subflow_syn_recv_sock': events 1-14
       |
       |  734 |         if (child && *own_req) {
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |  735 |                 struct mptcp_subflow_context *ctx =3D mptcp=
_subflow_ctx(child);
       |      |                 ~~~~~~
       |      |                 |
       |      |                 (2) ...to here
       |......
       |  743 |                 if (!ctx || fallback) {
       |      |                    ~
       |      |                    |
       |      |                    (3) following 'false' branch...
       |......
       |  754 |                 ctx->setsockopt_seq =3D listener->setsockop=
t_seq;
       |      |                 ~~~
       |      |                 |
       |      |                 (4) ...to here
       |  755 | =

       |  756 |                 if (ctx->mp_capable) {
       |      |                    ~
       |      |                    |
       |      |                    (5) following 'true' branch...
       |......
       |  760 |                         inet_sk_state_store((void *)new_msk=
, TCP_ESTABLISHED);
       |      |                         ~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (6) ...to here
       |......
       |  774 |                         ctx->conn =3D new_msk;
       |      |                         ~~~~~~~~~~~~~~~~~~~
       |      |                                   |
       |      |                                   (7) 'new_msk' is NULL
       |      |                                   (8) 'new_msk' is NULL
       |      |                                   (9) 'new_msk' is NULL
       |      |                                   (10) 'new_msk' is NULL
       |      |                                   (11) 'new_msk' is NULL
       |      |                                   (12) 'new_msk' is NULL
       |......
       |  780 |                         if (mp_opt.suboptions & OPTIONS_MPT=
CP_MPC)
       |      |                            ~
       |      |                            |
       |      |                            (13) following 'true' branch...
       |  781 |                                 mptcp_subflow_fully_establi=
shed(ctx, &mp_opt);
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |                                 |
       |      |                                 (14) ...to here
       |
     'subflow_syn_recv_sock': event 15
       |
       |include/asm-generic/rwonce.h:55:37:
       |   55 |         *(volatile typeof(x) *)&(x) =3D (val);             =
               \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
       |      |                                     |
       |      |                                     (15) dereference of NUL=
L 'new_msk'
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_=
ONCE'
       |   61 |         __WRITE_ONCE(x, val);                              =
             \
       |      |         ^~~~~~~~~~~~
   net/mptcp/subflow.c:670:9: note: in expansion of macro 'WRITE_ONCE'
       |  670 |         WRITE_ONCE(msk->fully_established, true);
       |      |         ^~~~~~~~~~
       |
>> include/asm-generic/rwonce.h:55:37: warning: dereference of NULL 'new_ms=
k' [CWE-476] [-Wanalyzer-null-dereference]
      55 |         *(volatile typeof(x) *)&(x) =3D (val);                  =
          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_=
ONCE'
      61 |         __WRITE_ONCE(x, val);                                   =
        \
         |         ^~~~~~~~~~~~
   net/mptcp/subflow.c:765:25: note: in expansion of macro 'WRITE_ONCE'
     765 |                         WRITE_ONCE(mptcp_sk(new_msk)->first, chi=
ld);
         |                         ^~~~~~~~~~
     'subflow_syn_recv_sock': events 1-7
       |
       |  734 |         if (child && *own_req) {
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |  735 |                 struct mptcp_subflow_context *ctx =3D mptcp=
_subflow_ctx(child);
       |      |                 ~~~~~~
       |      |                 |
       |      |                 (2) ...to here
       |......
       |  743 |                 if (!ctx || fallback) {
       |      |                    ~
       |      |                    |
       |      |                    (3) following 'false' branch...
       |......
       |  754 |                 ctx->setsockopt_seq =3D listener->setsockop=
t_seq;
       |      |                 ~~~
       |      |                 |
       |      |                 (4) ...to here
       |  755 | =

       |  756 |                 if (ctx->mp_capable) {
       |      |                    ~
       |      |                    |
       |      |                    (5) following 'true' branch...
       |......
       |  760 |                         inet_sk_state_store((void *)new_msk=
, TCP_ESTABLISHED);
       |      |                         ~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (6) ...to here
       |......
       |  774 |                         ctx->conn =3D new_msk;
       |      |                         ~~~~~~~~~~~~~~~~~~~
       |      |                                   |
       |      |                                   (7) 'new_msk' is NULL
       |
     'subflow_syn_recv_sock': event 8
       |
       |include/asm-generic/rwonce.h:55:37:
       |   55 |         *(volatile typeof(x) *)&(x) =3D (val);             =
               \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
       |      |                                     |
       |      |                                     (8) dereference of NULL=
 'new_msk'
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_=
ONCE'
       |   61 |         __WRITE_ONCE(x, val);                              =
             \
       |      |         ^~~~~~~~~~~~
   net/mptcp/subflow.c:765:25: note: in expansion of macro 'WRITE_ONCE'
       |  765 |                         WRITE_ONCE(mptcp_sk(new_msk)->first=
, child);
       |      |                         ^~~~~~~~~~
       |
   net/mptcp/subflow.c: In function 'subflow_check_data_avail':
   net/mptcp/subflow.c:1270:36: warning: dereference of NULL 'skb' [CWE-476=
] [-Wanalyzer-null-dereference]
    1270 |         subflow->map_data_len =3D skb->len;
         |                                 ~~~^~~~~
     'subflow_check_data_avail': events 1-2
       |
       | 1177 |         if (subflow->data_avail)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       | 1180 |         msk =3D mptcp_sk(subflow->conn);
       |      |         ~~~ =

       |      |         |
       |      |         (2) ...to here
       |
     'subflow_check_data_avail': events 3-4
       |
       |include/linux/skbuff.h:2178:12:
       | 2178 |         if (skb =3D=3D (struct sk_buff *)list_)
       |      |            ^
       |      |            |
       |      |            (3) following 'true' branch...
       | 2179 |                 skb =3D NULL;
       |      |                 ~~~
       |      |                 |
       |      |                 (4) ...to here
       |
     'subflow_check_data_avail': event 5
       |
       |net/mptcp/subflow.c:1270:36:
       | 1270 |         subflow->map_data_len =3D skb->len;
       |      |                                 ~~~^~~~~
       |      |                                    |
       |      |                                    (5) dereference of NULL =
'skb'
       |

vim +/bh +52 include/linux/bitops.h

521611f961a7dd Alexander Lobakin 2022-05-09  35  =

a8846f7b2f123f Alexander Lobakin 2022-05-12  36  /*
a8846f7b2f123f Alexander Lobakin 2022-05-12  37   * Many architecture-speci=
fic non-atomic bitops contain inline asm code and due
a8846f7b2f123f Alexander Lobakin 2022-05-12  38   * to that the compiler ca=
n't optimize them to compile-time expressions or
a8846f7b2f123f Alexander Lobakin 2022-05-12  39   * constants. In contrary,=
 gen_*() helpers are defined in pure C and compilers
a8846f7b2f123f Alexander Lobakin 2022-05-12  40   * optimize them just well.
a8846f7b2f123f Alexander Lobakin 2022-05-12  41   * Therefore, to make `uns=
igned long foo =3D 0; __set_bit(BAR, &foo)` effectively
a8846f7b2f123f Alexander Lobakin 2022-05-12  42   * equal to `unsigned long=
 foo =3D BIT(BAR)`, pick the generic C alternative when
a8846f7b2f123f Alexander Lobakin 2022-05-12  43   * the arguments can be re=
solved at compile time. That expression itself is a
a8846f7b2f123f Alexander Lobakin 2022-05-12  44   * constant and doesn't br=
ing any functional changes to the rest of cases.
a8846f7b2f123f Alexander Lobakin 2022-05-12  45   * The casts to `uintptr_t=
` are needed to mitigate `-Waddress` warnings when
a8846f7b2f123f Alexander Lobakin 2022-05-12  46   * passing a bitmap from .=
bss or .data (-> `!!addr` is always true).
a8846f7b2f123f Alexander Lobakin 2022-05-12  47   */
54dcb250626d4e Alexander Lobakin 2022-06-16  48  #define bitop(op, nr, addr=
)						\
a8846f7b2f123f Alexander Lobakin 2022-05-12  49  	((__builtin_constant_p(nr=
) &&					\
a8846f7b2f123f Alexander Lobakin 2022-05-12  50  	  __builtin_constant_p((u=
intptr_t)(addr) !=3D (uintptr_t)NULL) &&	\
a8846f7b2f123f Alexander Lobakin 2022-05-12  51  	  (uintptr_t)(addr) !=3D =
(uintptr_t)NULL &&			\
a8846f7b2f123f Alexander Lobakin 2022-05-12 @52  	  __builtin_constant_p(*(=
const unsigned long *)(addr))) ?	\
a8846f7b2f123f Alexander Lobakin 2022-05-12  53  	 const##op(nr, addr) : op=
(nr, addr))
54dcb250626d4e Alexander Lobakin 2022-06-16  54  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5473701697288975509==--


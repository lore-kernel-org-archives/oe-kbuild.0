Content-Type: multipart/mixed; boundary="===============5033108964794678170=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 2/7] include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: dereference of NULL 'curf' [CWE-476]
Date: Mon, 20 Jun 2022 12:26:22 +0800
Message-ID: <202206201148.11KJKPXE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5033108964794678170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/a=
sm-generic/bitops/generic-non-atomic.h:127:27: warning: dereference of NULL=
 'curf' [CWE-476] [-Wanalyzer-null-dereference]"
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220619 (https://download.01.org/0day-ci/archi=
ve/20220620/202206201148.11KJKPXE-lkp(a)intel.com/config)
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
   fs/reiserfs/fix_node.c: In function 'dc_check_balance_leaf':
   fs/reiserfs/fix_node.c:1938:13: warning: variable 'maxsize' set but not =
used [-Wunused-but-set-variable]
    1938 |         int maxsize, ret;
         |             ^~~~~~~
   fs/reiserfs/fix_node.c:1935:13: warning: variable 'levbytes' set but not=
 used [-Wunused-but-set-variable]
    1935 |         int levbytes;
         |             ^~~~~~~~
   In file included from include/asm-generic/bitops/non-atomic.h:5,
                    from arch/arm/include/asm/bitops.h:123,
                    from include/linux/bitops.h:33,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from fs/reiserfs/fix_node.c:5:
   fs/reiserfs/reiserfs.h: In function 'get_far_parent':
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: derefer=
ence of NULL 'curf' [CWE-476] [-Wanalyzer-null-dereference]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'fix_nodes': events 1-4
       |
       |fs/reiserfs/fix_node.c:2545:5:
       | 2545 | int fix_nodes(int op_mode, struct tree_balance *tb,
       |      |     ^~~~~~~~~
       |      |     |
       |      |     (1) entry to 'fix_nodes'
       |......
       | 2574 |         if (FILESYSTEM_CHANGED_TB(tb))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 2578 |         if (buffer_locked(tbS0)) {
       |      |         ~~
       |      |         |
       |      |         (3) ...to here
       |......
       | 2625 |         if (get_mem_for_virtual_node(tb) =3D=3D REPEAT_SEAR=
CH)
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |
     'fix_nodes': event 5
       |
       |cc1:
       | (5): ...to here
       |
     'fix_nodes': events 6-10
       |
       | 2630 |         for (h =3D 0; h < MAX_HEIGHT && tb->insert_size[h];=
 h++) {
       |      |                     ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
       |      |                                    |
       |      |                                    (6) following 'true' bra=
nch...
       | 2631 |                 ret =3D get_direct_parent(tb, h);
       |      |                 ~~~                 =

       |      |                 |
       |      |                 (7) ...to here
       | 2632 |                 if (ret !=3D CARRY_ON)
       |      |                    ~                =

       |      |                    |
       |      |                    (8) following 'false' branch (when 'ret =
=3D=3D 0')...
       |......
       | 2635 |                 ret =3D check_balance(op_mode, tb, h, item_=
num,
       |      |                 ~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |                 |     |
       |      |                 |     (10) calling 'check_balance' from 'fi=
x_nodes'
       |      |                 (9) ...to here
       | 2636 |                                     pos_in_item, ins_ih, da=
ta);
       |      |                                     ~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |
       +--> 'check_balance': events 11-14
              |
              | 2061 | static int check_balance(int mode,
              |      |            ^~~~~~~~~~~~~
              |      |            |
              |      |            (11) entry to 'check_balance'
              |......
              | 2082 |         if (tb->insert_size[h] > 0)
              |      |            ~
              |      |            |
              |      |            (12) following 'true' branch...
              | 2083 |                 return ip_check_balance(tb, h);
              |      |                 ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |      |
              |      |                 |      (14) calling 'ip_check_balanc=
e' from 'check_balance'
              |      |                 (13) ...to here
              |
              +--> 'ip_check_balance': events 15-18
                     |
                     | 1324 | static int ip_check_balance(struct tree_balan=
ce *tb, int h)
                     |      |            ^~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (15) entry to 'ip_check_balance'
                     |......
                     | 1377 |         if (!Sh) {
                     |      |            ~
                     |      |            |
                     |      |            (16) following 'false' branch (whe=
n 'Sh' is non-NULL)...
                     |......
                     | 1397 |         ret =3D get_parents(tb, h);
                     |      |         ~~~   ~~~~~~~~~~~~~~~~~~
                     |      |         |     |
                     |      |         |     (18) calling 'get_parents' from=
 'ip_check_balance'
                     |      |         (17) ...to here
                     |
                     +--> 'get_parents': event 19
                            |
                            | 1172 | static int get_parents(struct tree_bal=
ance *tb, int h)
                            |      |            ^~~~~~~~~~~
                            |      |            |
                            |      |            (19) entry to 'get_parents'
                            |
                          'get_parents': event 20
                            |
                            |cc1:
                            | (20): '=1B[01m=1B[Kcurf=1B[m=1B[K' is NULL
                            |
                          'get_parents': event 21
                            |
                            |cc1:
                            | (21): '=1B[01m=1B[Kcurf=1B[m=1B[K' is NULL
                            |
                          'get_parents': events 22-26
                            |
                            | 1181 |         if (path_offset <=3D FIRST_PAT=
H_ELEMENT_OFFSET) {
                            |      |            ^
                            |      |            |
                            |      |            (22) following 'false' bran=
ch (when 'path_offset > 2')...
                            |......
                            | 1199 |         position =3D PATH_OFFSET_POSIT=
ION(path, path_offset - 1);
                            |      |         ~~~~~~~~
                            |      |         |
                            |      |         (23) ...to here
                            | 1200 |         if (position) {
                            |      |            ~
                            |      |            |
                            |      |            (24) following 'false' bran=
ch (when 'position =3D=3D 0')...
                            |......
                            | 1216 |                 if ((ret =3D get_far_p=
arent(tb, h + 1, &curf,
                            |      |                 ~~         ~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
                            |      |                 |          |
                            |      |                 |          (26) callin=
g 'get_far_parent' from 'get_parents'
                            |      |                 (25) ...to here
                            | 1217 |                                       =
            &curcf,
                            |      |                                       =
            ~~~~~~~
                            | 1218 |                                       =
            LEFT_PARENTS)) !=3D CARRY_ON)
                            |      |                                       =
            ~~~~~~~~~~~~~
                            |
                            +--> 'get_far_parent': events 27-28
                                   |
                                   | 1023 | static int get_far_parent(struc=
t tree_balance *tb,
                                   |      |            ^~~~~~~~~~~~~~
                                   |      |            |
                                   |      |            (27) entry to 'get_f=
ar_parent'
                                   |......
                                   | 1086 |         if (counter =3D=3D FIRS=
T_PATH_ELEMENT_OFFSET) {
                                   |      |            ~
                                   |      |            |
                                   |      |            (28) following 'fals=
e' branch (when 'counter !=3D 2')...
                                   |
                                 'get_far_parent': event 29
                                   |
                                   |fs/reiserfs/reiserfs.h:920:41:
                                   |  920 | #define RFALSE( cond, format, a=
rgs... ) do {;} while( 0 )
                                   |      |                                =
         ^~
                                   |      |                                =
         |
                                   |      |                                =
         (29) ...to here
   fs/reiserfs/fix_node.c:1101:9: note: in expansion of macro 'RFALSE'
                                   | 1101 |         RFALSE(B_LEVEL(*pcom_fa=
ther) <=3D DISK_LEAF_NODE_LEVEL,
                                   |      |         ^~~~~~
                                   |
                                 'get_far_parent': event 30
                                   |
                                   | 1107 |         if (buffer_locked(*pcom=
_father)) {
                                   |      |             ^~~~~~~~~~~~~~~~~~~=
~~~~~~~~
                                   |      |             |
                                   |      |             (30) 'curf' is NULL
                                   |
                                 'get_far_parent': event 31
                                   |
                                   |include/asm-generic/bitops/generic-non-=
atomic.h:127:27:
                                   |  127 |         return 1UL & (addr[BIT_=
WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                                   |      |                       ~~~~^~~~~=
~~~~~~~~~
                                   |      |                           |
                                   |      |                           (31) =
dereference of NULL '*pcom_father'
                                   |
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: derefer=
ence of NULL 'curcf' [CWE-476] [-Wanalyzer-null-dereference]
     'fix_nodes': events 1-4
       |
       |fs/reiserfs/fix_node.c:2545:5:
       | 2545 | int fix_nodes(int op_mode, struct tree_balance *tb,
       |      |     ^~~~~~~~~
       |      |     |
       |      |     (1) entry to 'fix_nodes'
       |......
       | 2574 |         if (FILESYSTEM_CHANGED_TB(tb))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 2578 |         if (buffer_locked(tbS0)) {
       |      |         ~~
       |      |         |
       |      |         (3) ...to here
       |......
       | 2625 |         if (get_mem_for_virtual_node(tb) =3D=3D REPEAT_SEAR=
CH)
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |
     'fix_nodes': event 5
       |
       |cc1:
       | (5): ...to here
       |
     'fix_nodes': events 6-10
       |
       | 2630 |         for (h =3D 0; h < MAX_HEIGHT && tb->insert_size[h];=
 h++) {
       |      |                     ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
       |      |                                    |
       |      |                                    (6) following 'true' bra=
nch...
       | 2631 |                 ret =3D get_direct_parent(tb, h);
       |      |                 ~~~                 =

       |      |                 |
       |      |                 (7) ...to here
       | 2632 |                 if (ret !=3D CARRY_ON)
       |      |                    ~                =

       |      |                    |
       |      |                    (8) following 'false' branch (when 'ret =
=3D=3D 0')...
       |......
       | 2635 |                 ret =3D check_balance(op_mode, tb, h, item_=
num,
       |      |                 ~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |                 |     |
       |      |                 |     (10) calling 'check_balance' from 'fi=
x_nodes'
       |      |                 (9) ...to here
       | 2636 |                                     pos_in_item, ins_ih, da=
ta);
       |      |                                     ~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |
       +--> 'check_balance': events 11-14
              |
              | 2061 | static int check_balance(int mode,
              |      |            ^~~~~~~~~~~~~
              |      |            |
              |      |            (11) entry to 'check_balance'
              |......
              | 2082 |         if (tb->insert_size[h] > 0)
              |      |            ~
              |      |            |
              |      |            (12) following 'true' branch...
              | 2083 |                 return ip_check_balance(tb, h);
              |      |                 ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |      |
              |      |                 |      (14) calling 'ip_check_balanc=
e' from 'check_balance'
              |      |                 (13) ...to here
              |
              +--> 'ip_check_balance': events 15-18
                     |
                     | 1324 | static int ip_check_balance(struct tree_balan=
ce *tb, int h)
                     |      |            ^~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (15) entry to 'ip_check_balance'
                     |......
                     | 1377 |         if (!Sh) {
                     |      |            ~
                     |      |            |
                     |      |            (16) following 'false' branch (whe=
n 'Sh' is non-NULL)...
                     |......
                     | 1397 |         ret =3D get_parents(tb, h);
                     |      |         ~~~   ~~~~~~~~~~~~~~~~~~
                     |      |         |     |
                     |      |         |     (18) calling 'get_parents' from=
 'ip_check_balance'
                     |      |         (17) ...to here
                     |
                     +--> 'get_parents': event 19
                            |
                            | 1172 | static int get_parents(struct tree_bal=
ance *tb, int h)
                            |      |            ^~~~~~~~~~~
                            |      |            |
                            |      |            (19) entry to 'get_parents'
                            |
                          'get_parents': event 20
                            |
                            |cc1:
                            | (20): '=1B[01m=1B[Kcurf=1B[m=1B[K' is NULL
                            |
                          'get_parents': event 21
                            |

vim +/curf +127 include/asm-generic/bitops/generic-non-atomic.h

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
--===============5033108964794678170==--


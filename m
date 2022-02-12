Content-Type: multipart/mixed; boundary="===============0874656493220152650=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3235/5417] include/net/page_pool.h:238:11: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sat, 12 Feb 2022 21:11:50 +0800
Message-ID: <202202122127.Qk6f1tlD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0874656493220152650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Duyck <alexanderduyck@fb.com>
CC: Ilias Apalodimas <ilias.apalodimas@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d9bd4ad4ca08b1114e814c2c42383b8b13be631
commit: 52cc6ffc0ab2c61a76127b9347567fc97c15582f [3235/5417] page_pool: Ref=
actor page_pool to enable fragmenting after allocation
:::::: branch date: 29 hours ago
:::::: commit date: 9 days ago
config: riscv-randconfig-c006-20220211 (https://download.01.org/0day-ci/arc=
hive/20220212/202202122127.Qk6f1tlD-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f=
774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D52cc6ffc0ab2c61a76127b9347567fc97c15582f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 52cc6ffc0ab2c61a76127b9347567fc97c15582f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                            ^~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7107:8: note: Taking fal=
se branch
                   else if (port =3D=3D 1)
                        ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7111:26: note: Division =
by zero
                           size =3D size_remainder / remaining_ports_count;
                                  ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7214:26: warning: Divisi=
on by zero [clang-analyzer-core.DivideZero]
                           size =3D size_remainder / remaining_ports_count;
                                  ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7200:2: note: Assuming '=
port' is >=3D 3
           for_each_clear_bit(port, &port_map, MVPP2_LOOPBACK_PORT_INDEX)
           ^
   include/linux/find.h:295:7: note: expanded from macro 'for_each_clear_bi=
t'
                (bit) < (size);                                    \
                ^~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7200:2: note: Loop condi=
tion is false. Execution continues on line 7204
           for_each_clear_bit(port, &port_map, MVPP2_LOOPBACK_PORT_INDEX)
           ^
   include/linux/find.h:294:2: note: expanded from macro 'for_each_clear_bi=
t'
           for ((bit) =3D find_next_zero_bit((addr), (size), 0);     \
           ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7207:2: note: Assuming '=
port' is < 3
           for_each_set_bit(port, &port_map, MVPP2_LOOPBACK_PORT_INDEX) {
           ^
   include/linux/find.h:284:7: note: expanded from macro 'for_each_set_bit'
                (bit) < (size);                                    \
                ^~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7207:2: note: Loop condi=
tion is true.  Entering loop body
           for_each_set_bit(port, &port_map, MVPP2_LOOPBACK_PORT_INDEX) {
           ^
   include/linux/find.h:283:2: note: expanded from macro 'for_each_set_bit'
           for ((bit) =3D find_next_bit((addr), (size), 0);          \
           ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7208:7: note: Assuming '=
remaining_ports_count' is equal to 1
                   if (remaining_ports_count =3D=3D 1)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7208:3: note: Taking tru=
e branch
                   if (remaining_ports_count =3D=3D 1)
                   ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7209:11: note: '__UNIQUE=
_ID___x788' is >=3D '__UNIQUE_ID___y789'
                           size =3D min(size_remainder,
                                  ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7209:11: note: '?' condi=
tion is false
                           size =3D min(size_remainder,
                                  ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7217:3: note: The value =
0 is assigned to 'remaining_ports_count'
                   remaining_ports_count--;
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7207:2: note: Assuming '=
port' is < 3
           for_each_set_bit(port, &port_map, MVPP2_LOOPBACK_PORT_INDEX) {
           ^
   include/linux/find.h:284:7: note: expanded from macro 'for_each_set_bit'
                (bit) < (size);                                    \
                ^~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7207:2: note: Loop condi=
tion is true.  Entering loop body
           for_each_set_bit(port, &port_map, MVPP2_LOOPBACK_PORT_INDEX) {
           ^
   include/linux/find.h:283:2: note: expanded from macro 'for_each_set_bit'
           for ((bit) =3D find_next_bit((addr), (size), 0);          \
           ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7208:7: note: 'remaining=
_ports_count' is not equal to 1
                   if (remaining_ports_count =3D=3D 1)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7208:3: note: Taking fal=
se branch
                   if (remaining_ports_count =3D=3D 1)
                   ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7211:12: note: Assuming =
'port' is not equal to 0
                   else if (port =3D=3D 0)
                            ^~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7211:8: note: Taking fal=
se branch
                   else if (port =3D=3D 0)
                        ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:7214:26: note: Division =
by zero
                           size =3D size_remainder / remaining_ports_count;
                                  ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>> include/net/page_pool.h:238:11: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           return !(pool->p.flags & PP_FLAG_PAGE_FRAG) ||
                    ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3884:13: note: Left side=
 of '||' is false
           xdp_prog =3D READ_ONCE(port->xdp_prog);
                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3884:13: note: Left side=
 of '||' is false
           xdp_prog =3D READ_ONCE(port->xdp_prog);
                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3884:13: note: Left side=
 of '||' is true
           xdp_prog =3D READ_ONCE(port->xdp_prog);
                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3884:13: note: Taking fa=
lse branch
           xdp_prog =3D READ_ONCE(port->xdp_prog);
                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3884:13: note: Loop cond=
ition is false.  Exiting loop
           xdp_prog =3D READ_ONCE(port->xdp_prog);
                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3888:6: note: Assuming '=
rx_todo' is <=3D 'rx_received'
           if (rx_todo > rx_received)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3888:2: note: Taking fal=
se branch
           if (rx_todo > rx_received)
           ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3891:9: note: Assuming '=
rx_done' is < 'rx_todo'
           while (rx_done < rx_todo) {
                  ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3891:2: note: Loop condi=
tion is true.  Entering loop body
           while (rx_done < rx_todo) {
           ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3894:3: note: 'pp' initi=
alized to a null pointer value
                   struct page_pool *pp =3D NULL;
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3919:7: note: Assuming f=
ield 'percpu_pools' is 0
                   if (port->priv->percpu_pools) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3919:3: note: Taking fal=
se branch
                   if (port->priv->percpu_pools) {
                   ^
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3931:7: note: Assuming t=
he condition is false
                   if (rx_status & MVPP2_RXD_BUF_HDR)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:3931:3: note: Taking fal=
se branch
                   if (rx_status & MVPP2_RXD_BUF_HDR)

vim +238 include/net/page_pool.h

52cc6ffc0ab2c6 Alexander Duyck 2022-01-31  233  =

52cc6ffc0ab2c6 Alexander Duyck 2022-01-31  234  static inline bool page_poo=
l_is_last_frag(struct page_pool *pool,
52cc6ffc0ab2c6 Alexander Duyck 2022-01-31  235  					  struct page *page)
52cc6ffc0ab2c6 Alexander Duyck 2022-01-31  236  {
52cc6ffc0ab2c6 Alexander Duyck 2022-01-31  237  	/* If fragments aren't ena=
bled or count is 0 we were the last user */
52cc6ffc0ab2c6 Alexander Duyck 2022-01-31 @238  	return !(pool->p.flags & P=
P_FLAG_PAGE_FRAG) ||
52cc6ffc0ab2c6 Alexander Duyck 2022-01-31  239  	       (page_pool_defrag_p=
age(page, 1) =3D=3D 0);
52cc6ffc0ab2c6 Alexander Duyck 2022-01-31  240  }
52cc6ffc0ab2c6 Alexander Duyck 2022-01-31  241  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0874656493220152650==--


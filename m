Content-Type: multipart/mixed; boundary="===============5884689119617654076=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/etherdevice.h:337:19: warning: dereference of NULL 'failover_dev' [CWE-476]
Date: Sun, 19 Jun 2022 10:01:11 +0800
Message-ID: <202206190916.8g53PU1y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5884689119617654076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/etherdevice.h:337:19: warning: dereference of NULL 'failover=
_dev' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yajun Deng <yajun.deng@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: b37a466837393af72fe8bcb8f1436410f3f173f3 netdevice: add the case if=
 dev is NULL
date:   11 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220619/202206190916.8g53PU1y-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db37a466837393af72fe8bcb8f1436410f3f173f3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b37a466837393af72fe8bcb8f1436410f3f173f3
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from net/core/failover.c:11:
   net/core/failover.c: In function 'failover_existing_slave_register':
>> include/linux/etherdevice.h:337:19: warning: dereference of NULL 'failov=
er_dev' [CWE-476] [-Wanalyzer-null-dereference]
     337 |         return ((a[0] ^ b[0]) | (a[1] ^ b[1]) | (a[2] ^ b[2])) =
=3D=3D 0;
         |                  ~^~~
     'failover_register.part.0': events 1-2
       |
       |net/core/failover.c:242:18:
       |  242 | struct failover *failover_register(struct net_device *dev,
       |      |                  ^~~~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (1) entry to 'failover_register.part.0'
       |......
       |  251 |         if (!failover)
       |      |            ~      =

       |      |            |
       |      |            (2) following 'false' branch...
       |
     'failover_register.part.0': event 3
       |
       |include/linux/compiler.h:86:20:
       |   86 | # define barrier() __asm__ __volatile__("": : :"memory")
       |      |                    ^~~~~~~
       |      |                    |
       |      |                    (3) ...to here
   include/asm-generic/barrier.h:163:9: note: in expansion of macro 'barrie=
r'
       |  163 |         barrier();                                         =
             \
       |      |         ^~~~~~~
   include/linux/rcupdate.h:452:17: note: in expansion of macro 'smp_store_=
release'
       |  452 |                 smp_store_release(&p, RCU_INITIALIZER((type=
of(p))_r_a_p__v)); \
       |      |                 ^~~~~~~~~~~~~~~~~
   net/core/failover.c:254:9: note: in expansion of macro 'rcu_assign_point=
er'
       |  254 |         rcu_assign_pointer(failover->ops, ops);
       |      |         ^~~~~~~~~~~~~~~~~~
       |
     'failover_register.part.0': event 4
       |
       |  255 |         dev_hold(dev);
       |      |         ^~~~~~~~~~~~~
       |      |         |
       |      |         (4) calling 'dev_hold' from 'failover_register.part=
.0'
       |
       +--> 'dev_hold': events 5-7
              |
              |include/linux/netdevice.h:4161:20:
              | 4161 | static inline void dev_hold(struct net_device *dev)
              |      |                    ^~~~~~~~
              |      |                    |
              |      |                    (5) entry to 'dev_hold'
              | 4162 | {
              | 4163 |         if (dev) {
              |      |            ~        =

              |      |            |
              |      |            (6) following 'false' branch (when 'dev' =
is NULL)...
              |......
              | 4170 | }
              |      | ~                   =

              |      | |
              |      | (7) ...to here
              |
       <------+
       |
     'failover_register.part.0': events 8-9
       |
       |net/core/failover.c:255:9:
       |  255 |         dev_hold(dev);
       |      |         ^~~~~~~~~~~~~
       |      |         |
       |      |         (8) returning to 'failover_register.part.0' from 'd=
ev_hold'
       |......
       |  265 |         failover_existing_slave_register(dev);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (9) calling 'failover_existing_slave_register' from=
 'failover_register.part.0'
       |
       +--> 'failover_existing_slave_register': event 10
              |
              |  215 | failover_existing_slave_register(struct net_device *=
failover_dev)
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (10) entry to 'failover_existing_slave_register'
              |
            'failover_existing_slave_register': event 11
              |
              |include/linux/list.h:629:14:
              |  629 |              !list_entry_is_head(pos, head, member);=
                    \
              |      |              ^
              |      |              |
              |      |              (11) following 'true' branch...
   include/linux/netdevice.h:2877:17: note: in expansion of macro 'list_for=
_each_entry'
              | 2877 |                 list_for_each_entry(d, &(net)->dev_b=
ase_head, dev_list)
              |      |                 ^~~~~~~~~~~~~~~~~~~
   net/core/failover.c:221:9: note: in expansion of macro 'for_each_netdev'
              |  221 |         for_each_netdev(net, dev) {
              |      |         ^~~~~~~~~~~~~~~
              |
            'failover_existing_slave_register': event 12
              |
              |include/linux/netdevice.h:5188:19:
              | 5188 |         return dev->priv_flags & IFF_FAILOVER;
              |      |                ~~~^~~~~~~~~~~~
              |      |                   |
              |      |                   (12) ...to here

vim +/failover_dev +337 include/linux/etherdevice.h

83a093b486ecfd Bj=C3=B8rn Mork        2013-08-30  316  =

a599b0f54d233d Joe Perches       2012-05-08  317  /**
a599b0f54d233d Joe Perches       2012-05-08  318   * ether_addr_equal - Com=
pare two Ethernet addresses
a599b0f54d233d Joe Perches       2012-05-08  319   * @addr1: Pointer to a s=
ix-byte array containing the Ethernet address
a599b0f54d233d Joe Perches       2012-05-08  320   * @addr2: Pointer other =
six-byte array containing the Ethernet address
a599b0f54d233d Joe Perches       2012-05-08  321   *
048b899ce38c3e stephen hemminger 2012-05-17  322   * Compare two Ethernet a=
ddresses, returns true if equal
0d74c42f788caf Joe Perches       2013-12-05  323   *
0d74c42f788caf Joe Perches       2013-12-05  324   * Please note: addr1 & a=
ddr2 must both be aligned to u16.
a599b0f54d233d Joe Perches       2012-05-08  325   */
a599b0f54d233d Joe Perches       2012-05-08  326  static inline bool ether_=
addr_equal(const u8 *addr1, const u8 *addr2)
a599b0f54d233d Joe Perches       2012-05-08  327  {
0d74c42f788caf Joe Perches       2013-12-05  328  #if defined(CONFIG_HAVE_E=
FFICIENT_UNALIGNED_ACCESS)
0d74c42f788caf Joe Perches       2013-12-05  329  	u32 fold =3D ((*(const u=
32 *)addr1) ^ (*(const u32 *)addr2)) |
0d74c42f788caf Joe Perches       2013-12-05  330  		   ((*(const u16 *)(add=
r1 + 4)) ^ (*(const u16 *)(addr2 + 4)));
a599b0f54d233d Joe Perches       2012-05-08  331  =

0d74c42f788caf Joe Perches       2013-12-05  332  	return fold =3D=3D 0;
1f87e235e6fb92 Eric Dumazet      2008-11-23  333  #else
0d74c42f788caf Joe Perches       2013-12-05  334  	const u16 *a =3D (const =
u16 *)addr1;
0d74c42f788caf Joe Perches       2013-12-05  335  	const u16 *b =3D (const =
u16 *)addr2;
0d74c42f788caf Joe Perches       2013-12-05  336  =

0d74c42f788caf Joe Perches       2013-12-05 @337  	return ((a[0] ^ b[0]) | =
(a[1] ^ b[1]) | (a[2] ^ b[2])) =3D=3D 0;
1f87e235e6fb92 Eric Dumazet      2008-11-23  338  #endif
1f87e235e6fb92 Eric Dumazet      2008-11-23  339  }
1f87e235e6fb92 Eric Dumazet      2008-11-23  340  =


:::::: The code at line 337 was first introduced by commit
:::::: 0d74c42f788caf3cad727c61c490d9459bc8918b ether_addr_equal: Optimize =
implementation, remove unused compare_ether_addr

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5884689119617654076==--


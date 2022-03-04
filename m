Content-Type: multipart/mixed; boundary="===============0982466457806054825=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6772/10468] drivers/net/bonding/bond_main.c:2800:21: warning: Value stored to 'slave_dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 04 Mar 2022 12:29:25 +0800
Message-ID: <202203041208.mKiWBSgw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0982466457806054825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hangbin Liu <liuhangbin@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   91265a6da44d13296bdb5b3fbafa19d06be462f2
commit: 1fcd5d448c59ca2703504806eb8131ce8e411a70 [6772/10468] Bonding: spli=
t bond_handle_vlan from bond_arp_send
:::::: branch date: 19 hours ago
:::::: commit date: 11 days ago
config: riscv-randconfig-c006-20220303 (https://download.01.org/0day-ci/arc=
hive/20220304/202203041208.mKiWBSgw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D1fcd5d448c59ca2703504806eb8131ce8e411a70
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1fcd5d448c59ca2703504806eb8131ce8e411a70
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/lapb/lapb_iface.c:202:2: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           lapb_put(lapb);
           ^        ~~~~
   net/lapb/lapb_iface.c:177:2: note: Loop condition is false.  Exiting loop
           write_lock_bh(&lapb_list_lock);
           ^
   include/linux/rwlock.h:95:30: note: expanded from macro 'write_lock_bh'
   #define write_lock_bh(lock)             _raw_write_lock_bh(lock)
                                           ^
   include/linux/spinlock_api_up.h:65:35: note: expanded from macro '_raw_w=
rite_lock_bh'
   #define _raw_write_lock_bh(lock)                __LOCK_BH(lock)
                                                   ^
   include/linux/spinlock_api_up.h:34:63: note: expanded from macro '__LOCK=
_BH'
     do { __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); ___LOCK(lo=
ck); } while (0)
                                                                 ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   net/lapb/lapb_iface.c:177:2: note: Loop condition is false.  Exiting loop
           write_lock_bh(&lapb_list_lock);
           ^
   include/linux/rwlock.h:95:30: note: expanded from macro 'write_lock_bh'
   #define write_lock_bh(lock)             _raw_write_lock_bh(lock)
                                           ^
   include/linux/spinlock_api_up.h:65:35: note: expanded from macro '_raw_w=
rite_lock_bh'
   #define _raw_write_lock_bh(lock)                __LOCK_BH(lock)
                                                   ^
   include/linux/spinlock_api_up.h:34:3: note: expanded from macro '__LOCK_=
BH'
     do { __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); ___LOCK(lo=
ck); } while (0)
     ^
   net/lapb/lapb_iface.c:179:6: note: Assuming 'lapb' is non-null
           if (!lapb)
               ^~~~~
   net/lapb/lapb_iface.c:179:2: note: Taking false branch
           if (!lapb)
           ^
   net/lapb/lapb_iface.c:184:2: note: Loop condition is false. Execution co=
ntinues on line 187
           while (refcount_read(&lapb->refcnt) > 2)
           ^
   net/lapb/lapb_iface.c:200:2: note: Calling '__lapb_remove_cb'
           __lapb_remove_cb(lapb);
           ^~~~~~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:66:6: note: Assuming field 'next' is non-null
           if (lapb->node.next) {
               ^~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:66:2: note: Taking true branch
           if (lapb->node.next) {
           ^
   net/lapb/lapb_iface.c:68:3: note: Calling 'lapb_put'
                   lapb_put(lapb);
                   ^~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:57:2: note: Taking true branch
           if (refcount_dec_and_test(&lapb->refcnt))
           ^
   net/lapb/lapb_iface.c:58:3: note: Calling 'lapb_free_cb'
                   lapb_free_cb(lapb);
                   ^~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:47:2: note: Memory is released
           kfree(lapb);
           ^~~~~~~~~~~
   net/lapb/lapb_iface.c:58:3: note: Returning; memory was released via 1st=
 parameter
                   lapb_free_cb(lapb);
                   ^~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:68:3: note: Returning; memory was released via 1st=
 parameter
                   lapb_put(lapb);
                   ^~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:200:2: note: Returning; memory was released via 1s=
t parameter
           __lapb_remove_cb(lapb);
           ^~~~~~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:202:2: note: Use of memory after it is freed
           lapb_put(lapb);
           ^        ~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/net/bonding/bond_main.c:1698:2: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
           strcpy(info->slave_name, slave->dev->name);
           ^~~~~~
   drivers/net/bonding/bond_main.c:1698:2: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
           strcpy(info->slave_name, slave->dev->name);
           ^~~~~~
   drivers/net/bonding/bond_main.c:2799:21: warning: Value stored to 'bond_=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct net_device *bond_dev =3D slave->bond->dev;
                              ^~~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:2799:21: note: Value stored to 'bond_dev=
' during its initialization is never read
           struct net_device *bond_dev =3D slave->bond->dev;
                              ^~~~~~~~   ~~~~~~~~~~~~~~~~
>> drivers/net/bonding/bond_main.c:2800:21: warning: Value stored to 'slave=
_dev' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct net_device *slave_dev =3D slave->dev;
                              ^~~~~~~~~   ~~~~~~~~~~
   drivers/net/bonding/bond_main.c:2800:21: note: Value stored to 'slave_de=
v' during its initialization is never read
           struct net_device *slave_dev =3D slave->dev;
                              ^~~~~~~~~   ~~~~~~~~~~
   drivers/net/bonding/bond_main.c:2844:21: warning: Value stored to 'bond_=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct net_device *bond_dev =3D slave->bond->dev;
                              ^~~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_main.c:2844:21: note: Value stored to 'bond_dev=
' during its initialization is never read
           struct net_device *bond_dev =3D slave->bond->dev;
                              ^~~~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/net/bonding/bond_3ad.c:671:14: warning: Access to field 'lag_por=
ts' results in a dereference of a null pointer (loaded from variable 'aggre=
gator') [clang-analyzer-core.NullDereference]
           for (port =3D aggregator->lag_ports; port;
                       ^
   drivers/net/bonding/bond_3ad.c:2335:6: note: Assuming the condition is f=
alse
           if (!bond_has_slaves(bond))
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_3ad.c:2335:2: note: Taking false branch
           if (!bond_has_slaves(bond))
           ^
   drivers/net/bonding/bond_3ad.c:2338:2: note: Taking false branch
           if (bond_agg_timer_advance(bond)) {
           ^
   drivers/net/bonding/bond_3ad.c:2357:2: note: Loop condition is true.  En=
tering loop body
           bond_for_each_slave_rcu(bond, slave, iter) {
           ^
   include/net/bonding.h:87:2: note: expanded from macro 'bond_for_each_sla=
ve_rcu'
           netdev_for_each_lower_private_rcu((bond)->dev, pos, iter)
           ^
   include/linux/netdevice.h:4576:2: note: expanded from macro 'netdev_for_=
each_lower_private_rcu'
           for (iter =3D &(dev)->adj_list.lower, \
           ^
   drivers/net/bonding/bond_3ad.c:2359:7: note: Assuming field 'slave' is n=
on-null
                   if (!port->slave) {
                       ^~~~~~~~~~~~
   drivers/net/bonding/bond_3ad.c:2359:3: note: Taking false branch
                   if (!port->slave) {
                   ^
   drivers/net/bonding/bond_3ad.c:2365:3: note: Calling 'ad_rx_machine'
                   ad_rx_machine(NULL, port);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_3ad.c:1098:6: note: 'lacpdu' is null
           if (lacpdu) {
               ^~~~~~
   drivers/net/bonding/bond_3ad.c:1098:2: note: Taking false branch
           if (lacpdu) {
           ^
   drivers/net/bonding/bond_3ad.c:1105:6: note: Assuming the condition is f=
alse
           if (port->sm_vars & AD_PORT_BEGIN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_3ad.c:1105:2: note: Taking false branch
           if (port->sm_vars & AD_PORT_BEGIN) {
           ^
   drivers/net/bonding/bond_3ad.c:1109:13: note: Left side of '&&' is true
           } else if (!(port->sm_vars & AD_PORT_BEGIN) && !port->is_enabled)
                      ^
   drivers/net/bonding/bond_3ad.c:1109:49: note: Assuming field 'is_enabled=
' is true
           } else if (!(port->sm_vars & AD_PORT_BEGIN) && !port->is_enabled)
                                                          ^~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_3ad.c:1109:9: note: Taking false branch
           } else if (!(port->sm_vars & AD_PORT_BEGIN) && !port->is_enabled)
                  ^
   drivers/net/bonding/bond_3ad.c:1112:11: note: 'lacpdu' is null
           else if (lacpdu && ((port->sm_rx_state =3D=3D AD_RX_EXPIRED) ||
                    ^~~~~~
   drivers/net/bonding/bond_3ad.c:1112:18: note: Left side of '&&' is false
           else if (lacpdu && ((port->sm_rx_state =3D=3D AD_RX_EXPIRED) ||
                           ^
   drivers/net/bonding/bond_3ad.c:1121:7: note: Assuming field 'sm_rx_timer=
_counter' is 0
                   if (port->sm_rx_timer_counter &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/bonding/bond_3ad.c:1121:33: note: Left side of '&&' is false
                   if (port->sm_rx_timer_counter &&
                                                 ^
   drivers/net/bonding/bond_3ad.c:1135:4: note: Control jumps to the 'defau=
lt' case at line 1145
                           switch (port->sm_rx_state) {
                           ^
   drivers/net/bonding/bond_3ad.c:1146:5: note:  Execution continues on lin=
e 1153
                                   break;
                                   ^
   drivers/net/bonding/bond_3ad.c:1153:28: note: 'last_state' is equal to f=
ield 'sm_rx_state'
           if ((port->sm_rx_state !=3D last_state) || (lacpdu)) {
                                     ^~~~~~~~~~
   drivers/net/bonding/bond_3ad.c:1153:6: note: Left side of '||' is false
           if ((port->sm_rx_state !=3D last_state) || (lacpdu)) {
               ^
   drivers/net/bonding/bond_3ad.c:1153:44: note: 'lacpdu' is null
           if ((port->sm_rx_state !=3D last_state) || (lacpdu)) {
                                                     ^~~~~~
   drivers/net/bonding/bond_3ad.c:1153:2: note: Taking false branch
           if ((port->sm_rx_state !=3D last_state) || (lacpdu)) {
           ^
   drivers/net/bonding/bond_3ad.c:1220:1: note: Returning without writing t=
o 'port->aggregator'
   }
   ^
   drivers/net/bonding/bond_3ad.c:2365:3: note: Returning from 'ad_rx_machi=
ne'
                   ad_rx_machine(NULL, port);

vim +/slave_dev +2800 drivers/net/bonding/bond_main.c

f5b2b966f032f2 Jay Vosburgh     2006-09-22  2795  =

1fcd5d448c59ca Hangbin Liu      2022-02-21  2796  static bool bond_handle_v=
lan(struct slave *slave, struct bond_vlan_tag *tags,
1fcd5d448c59ca Hangbin Liu      2022-02-21  2797  			     struct sk_buff *s=
kb)
c3ade5cad07f4d Jay Vosburgh     2005-06-26  2798  {
e2a7420df2e013 Jarod Wilson     2019-06-07  2799  	struct net_device *bond_=
dev =3D slave->bond->dev;
1fcd5d448c59ca Hangbin Liu      2022-02-21 @2800  	struct net_device *slave=
_dev =3D slave->dev;
1fcd5d448c59ca Hangbin Liu      2022-02-21  2801  	struct bond_vlan_tag *ou=
ter_tag =3D tags;
44a4085538c844 Vlad Yasevich    2014-05-16  2802  =

3e403a77779faf Veaceslav Falico 2014-07-17  2803  	if (!tags || tags->vlan_=
proto =3D=3D VLAN_N_VID)
1fcd5d448c59ca Hangbin Liu      2022-02-21  2804  		return true;
3e403a77779faf Veaceslav Falico 2014-07-17  2805  =

3e403a77779faf Veaceslav Falico 2014-07-17  2806  	tags++;
3e403a77779faf Veaceslav Falico 2014-07-17  2807  =

44a4085538c844 Vlad Yasevich    2014-05-16  2808  	/* Go through all the ta=
gs backwards and add them to the packet */
3e403a77779faf Veaceslav Falico 2014-07-17  2809  	while (tags->vlan_proto =
!=3D VLAN_N_VID) {
3e403a77779faf Veaceslav Falico 2014-07-17  2810  		if (!tags->vlan_id) {
3e403a77779faf Veaceslav Falico 2014-07-17  2811  			tags++;
44a4085538c844 Vlad Yasevich    2014-05-16  2812  			continue;
3e403a77779faf Veaceslav Falico 2014-07-17  2813  		}
44a4085538c844 Vlad Yasevich    2014-05-16  2814  =

e2a7420df2e013 Jarod Wilson     2019-06-07  2815  		slave_dbg(bond_dev, sla=
ve_dev, "inner tag: proto %X vid %X\n",
3e403a77779faf Veaceslav Falico 2014-07-17  2816  			  ntohs(outer_tag->vla=
n_proto), tags->vlan_id);
62749e2cb3c4a7 Jiri Pirko       2014-11-19  2817  		skb =3D vlan_insert_tag=
_set_proto(skb, tags->vlan_proto,
3e403a77779faf Veaceslav Falico 2014-07-17  2818  						tags->vlan_id);
c3ade5cad07f4d Jay Vosburgh     2005-06-26  2819  		if (!skb) {
4873ac3c8ed3b0 dingtianhong     2014-03-25  2820  			net_err_ratelimited("f=
ailed to insert inner VLAN tag\n");
1fcd5d448c59ca Hangbin Liu      2022-02-21  2821  			return false;
fbd929f2dce460 dingtianhong     2014-03-25  2822  		}
3e403a77779faf Veaceslav Falico 2014-07-17  2823  =

3e403a77779faf Veaceslav Falico 2014-07-17  2824  		tags++;
fbd929f2dce460 dingtianhong     2014-03-25  2825  	}
44a4085538c844 Vlad Yasevich    2014-05-16  2826  	/* Set the outer tag */
3e403a77779faf Veaceslav Falico 2014-07-17  2827  	if (outer_tag->vlan_id) {
e2a7420df2e013 Jarod Wilson     2019-06-07  2828  		slave_dbg(bond_dev, sla=
ve_dev, "outer tag: proto %X vid %X\n",
3e403a77779faf Veaceslav Falico 2014-07-17  2829  			  ntohs(outer_tag->vla=
n_proto), outer_tag->vlan_id);
b4bef1b57544b1 Jiri Pirko       2014-11-19  2830  		__vlan_hwaccel_put_tag(=
skb, outer_tag->vlan_proto,
3e403a77779faf Veaceslav Falico 2014-07-17  2831  				       outer_tag->vla=
n_id);
c3ade5cad07f4d Jay Vosburgh     2005-06-26  2832  	}
3e403a77779faf Veaceslav Falico 2014-07-17  2833  =

1fcd5d448c59ca Hangbin Liu      2022-02-21  2834  	return true;
1fcd5d448c59ca Hangbin Liu      2022-02-21  2835  }
1fcd5d448c59ca Hangbin Liu      2022-02-21  2836  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0982466457806054825==--


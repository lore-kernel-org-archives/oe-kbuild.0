Content-Type: multipart/mixed; boundary="===============2179261781845328943=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/bonding/bond_main.c:2800:21: warning: Value stored to 'slave_dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 22 Jun 2022 00:41:03 +0800
Message-ID: <202206220016.ZPjyiSyW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2179261781845328943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/bonding/bond_main.c:2800:21: warning: Value stored to 'slave_dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hangbin Liu <liuhangbin@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   78ca55889a549a9a194c6ec666836329b774ab6d
commit: 1fcd5d448c59ca2703504806eb8131ce8e411a70 Bonding: split bond_handle=
_vlan from bond_arp_send
date:   4 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220622/202206220016.ZPjyiSyW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa=
7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1fcd5d448c59ca2703504806eb8131ce8e411a70
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1fcd5d448c59ca2703504806eb8131ce8e411a70
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ret =3D 0;
                           ^     ~
   fs/btrfs/extent-tree.c:5366:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
   fs/btrfs/extent-tree.c:6003:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/btrfs/extent-tree.c:6003:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   1 warning generated.
   block/blk-mq-cpumap.c:21:33: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           return qmap->queue_offset + (q % nr_queues);
                                          ^
   block/blk-mq-cpumap.c:38:2: note: 'nr_queues' initialized here
           unsigned int nr_queues =3D qmap->nr_queues;
           ^~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:41:2: note: Loop condition is true.  Entering loop=
 body
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:41:2: note: Loop condition is false. Execution con=
tinues on line 48
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:48:2: note: Loop condition is true.  Entering loop=
 body
           for_each_present_cpu(cpu) {
           ^
   include/linux/cpumask.h:816:36: note: expanded from macro 'for_each_pres=
ent_cpu'
   #define for_each_present_cpu(cpu)  for_each_cpu((cpu), cpu_present_mask)
                                      ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:49:7: note: Assuming 'q' is >=3D 'nr_queues'
                   if (q >=3D nr_queues)
                       ^~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:49:3: note: Taking true branch
                   if (q >=3D nr_queues)
                   ^
   block/blk-mq-cpumap.c:50:4: note:  Execution continues on line 54
                           break;
                           ^
   block/blk-mq-cpumap.c:54:2: note: Loop condition is true.  Entering loop=
 body
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:55:3: note: Taking false branch
                   if (map[cpu] !=3D -1)
                   ^
   block/blk-mq-cpumap.c:63:7: note: 'q' is >=3D 'nr_queues'
                   if (q < nr_queues) {
                       ^
   block/blk-mq-cpumap.c:63:3: note: Taking false branch
                   if (q < nr_queues) {
                   ^
   block/blk-mq-cpumap.c:67:8: note: 'first_sibling' is equal to 'cpu'
                           if (first_sibling =3D=3D cpu)
                               ^~~~~~~~~~~~~
   block/blk-mq-cpumap.c:67:4: note: Taking true branch
                           if (first_sibling =3D=3D cpu)
                           ^
   block/blk-mq-cpumap.c:68:34: note: Passing the value 0 via 2nd parameter=
 'nr_queues'
                                   map[cpu] =3D queue_index(qmap, nr_queues=
, q++);
                                                                ^~~~~~~~~
   block/blk-mq-cpumap.c:68:16: note: Calling 'queue_index'
                                   map[cpu] =3D queue_index(qmap, nr_queues=
, q++);
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   block/blk-mq-cpumap.c:21:33: note: Division by zero
           return qmap->queue_offset + (q % nr_queues);
                                        ~~^~~~~~~~~~~
   5 warnings generated.
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
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
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
                   ^~~~~~~~~~~~~~~~~~~~~~~~~

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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2179261781845328943==--


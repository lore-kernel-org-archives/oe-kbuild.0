Content-Type: multipart/mixed; boundary="===============5368238724123504932=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/bonding/bond_main.c:2800:21: warning: Value stored to 'slave_dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 28 Mar 2022 07:32:34 +0800
Message-ID: <202203280750.wtJGjsgw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5368238724123504932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hangbin Liu <liuhangbin@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50d602d81f35621042fa0cdae25808662caffda8
commit: 1fcd5d448c59ca2703504806eb8131ce8e411a70 Bonding: split bond_handle=
_vlan from bond_arp_send
date:   5 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220325 (https://download.01.org/0day-ci/archi=
ve/20220328/202203280750.wtJGjsgw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/infiniband/core/cm.c:1130:6: note: Assuming field 'timewait_info=
' is null
           if (cm_id_priv->timewait_info) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cm.c:1130:2: note: Taking false branch
           if (cm_id_priv->timewait_info) {
           ^
   drivers/infiniband/core/cm.c:1136:2: note: Assuming field 'listen_sharec=
ount' is 0
           WARN_ON(cm_id_priv->listen_sharecount);
           ^
   include/asm-generic/bug.h:121:23: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                ^~~~~~~~~~~~
   drivers/infiniband/core/cm.c:1136:2: note: Taking false branch
           WARN_ON(cm_id_priv->listen_sharecount);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/infiniband/core/cm.c:1137:2: note: Assuming '__ret_warn_on' is 0
           WARN_ON(!RB_EMPTY_NODE(&cm_id_priv->service_node));
           ^
   include/asm-generic/bug.h:122:6: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   drivers/infiniband/core/cm.c:1137:2: note: Taking false branch
           WARN_ON(!RB_EMPTY_NODE(&cm_id_priv->service_node));
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/infiniband/core/cm.c:1138:6: note: Assuming the condition is fal=
se
           if (!RB_EMPTY_NODE(&cm_id_priv->sidr_id_node))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cm.c:1138:2: note: Taking false branch
           if (!RB_EMPTY_NODE(&cm_id_priv->sidr_id_node))
           ^
   drivers/infiniband/core/cm.c:1146:2: note: Loop condition is true.  Ente=
ring loop body
           while ((work =3D cm_dequeue_work(cm_id_priv)) !=3D NULL)
           ^
   drivers/infiniband/core/cm.c:1147:3: note: Calling 'cm_free_work'
                   cm_free_work(work);
                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cm.c:890:6: note: Assuming field 'mad_recv_wc' i=
s null
           if (work->mad_recv_wc)
               ^~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cm.c:890:2: note: Taking false branch
           if (work->mad_recv_wc)
           ^
   drivers/infiniband/core/cm.c:892:2: note: Memory is released
           kfree(work);
           ^~~~~~~~~~~
   drivers/infiniband/core/cm.c:1147:3: note: Returning; memory was released
                   cm_free_work(work);
                   ^~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cm.c:1146:17: note: Calling 'cm_dequeue_work'
           while ((work =3D cm_dequeue_work(cm_id_priv)) !=3D NULL)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cm.c:880:6: note: Assuming the condition is false
           if (list_empty(&cm_id_priv->work_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/cm.c:880:2: note: Taking false branch
           if (list_empty(&cm_id_priv->work_list))
           ^
   drivers/infiniband/core/cm.c:884:2: note: Calling 'list_del'
           list_del(&work->list);
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/net/ieee802154/mcr20a.c:1118:2: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(lp->regmap_dar, DAR_PHY_CTRL1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ieee802154/mcr20a.c:1118:2: note: Value stored to 'ret' is n=
ever read
           ret =3D regmap_update_bits(lp->regmap_dar, DAR_PHY_CTRL1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
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
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5368238724123504932==--


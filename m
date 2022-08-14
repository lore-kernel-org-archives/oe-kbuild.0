Content-Type: multipart/mixed; boundary="===============8139870788399244318=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bridge/br_netlink.c:99:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 15 Aug 2022 03:05:09 +0800
Message-ID: <202208150251.XooRqOY3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8139870788399244318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 net/bridge/br_netlink.c:99:13: warning: use of uninitialized value '<unkno=
wn>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d6a0f4da9275f6c212de33777778673ba91241a
commit: b03fc1173c0c2bb8fad61902a862985cecdc4b1b bitops: let optimize out n=
on-atomic bitops on compile-time constants
date:   6 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220722 (https://download.01.org/0day-ci/archi=
ve/20220815/202208150251.XooRqOY3-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db03fc1173c0c2bb8fad61902a862985cecdc4b1b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b03fc1173c0c2bb8fad61902a862985cecdc4b1b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
                            |   91 | #define NL_SET_ERR_MSG(extack, msg) do=
 {                \
                            |      |                                       =
 ^
                            |      |                                       =
 |
                            |      |                                       =
 (57) ...to here
   include/linux/netlink.h:102:9: note: in expansion of macro 'NL_SET_ERR_M=
SG'
                            |  102 |         NL_SET_ERR_MSG((extack), KBUIL=
D_MODNAME ": " msg)
                            |      |         ^~~~~~~~~~~~~~
   net/bridge/br_private.h:662:17: note: in expansion of macro 'NL_SET_ERR_=
MSG_MOD'
                            |  662 |                 NL_SET_ERR_MSG_MOD(ext=
ack, "Pvid isn't allowed in a range");
                            |      |                 ^~~~~~~~~~~~~~~~~~
                            |
                     <------+
                     |
                   'br_process_vlan_info': events 58-62
                     |
                     |net/bridge/br_netlink.c:738:22:
                     |  738 |                 if (!br_vlan_valid_range(vinf=
o_curr, *vinfo_last, extack))
                     |      |                    ~ ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                    | |
                     |      |                    | (58) returning to 'br_pr=
ocess_vlan_info' from 'br_vlan_valid_range'
                     |      |                    (59) following 'true' bran=
ch...
                     |......
                     |  741 |                 memcpy(&tmp_vinfo, *vinfo_las=
t,
                     |      |                 ~~~~~~
                     |      |                 |
                     |      |                 (60) ...to here
                     |  742 |                        sizeof(struct bridge_v=
lan_info));
                     |  743 |                 for (v =3D (*vinfo_last)->vid=
; v <=3D vinfo_curr->vid; v++) {
                     |      |                                              =
~~~~~~~~~~~~~~~~~~~~
                     |      |                                              =
  |
                     |      |                                              =
  (61) following 'false' branch...
                     |......
                     |  766 |                 if (v_change_start)
                     |      |                 ~~    =

                     |      |                 |
                     |      |                 (62) ...to here
                     |
                   'br_process_vlan_info': event 63
                     |
                     |cc1:
                     | (63): use of uninitialized value '=1B[01m=1B[K<unkno=
wn>=1B[m=1B[K' here
                     |
   In file included from include/net/rtnetlink.h:6,
                    from net/bridge/br_netlink.c:12:
   include/net/netlink.h: In function 'nla_get_u64':
   include/net/netlink.h:1617:13: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1617 |         u64 tmp;
         |             ^~~
     'br_changelink': events 1-8
       |
       |net/bridge/br_netlink.c:1212:12:
       | 1212 | static int br_changelink(struct net_device *brdev, struct n=
lattr *tb[],
       |      |            ^~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'br_changelink'
       |......
       | 1219 |         if (!data)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'data' is non=
-NULL)...
       |......
       | 1222 |         if (data[IFLA_BR_FORWARD_DELAY]) {
       |      |         ~~  =

       |      |         |
       |      |         (3) ...to here
       |......
       | 1260 |         if (data[IFLA_BR_VLAN_FILTERING]) {
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 1302 |         if (data[IFLA_BR_GROUP_FWD_MASK]) {
       |      |         ~~  =

       |      |         |
       |      |         (5) ...to here
       |......
       | 1390 |         if (data[IFLA_BR_MCAST_LAST_MEMBER_INTVL]) {
       |      |            ~
       |      |            |
       |      |            (6) following 'true' branch...
       | 1391 |                 u64 val =3D nla_get_u64(data[IFLA_BR_MCAST_=
LAST_MEMBER_INTVL]);
       |      |                 ~~~       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
       |      |                 |         |
       |      |                 |         (8) calling 'nla_get_u64' from 'b=
r_changelink'
       |      |                 (7) ...to here
       |
       +--> 'nla_get_u64': events 9-10
              |
              |include/net/netlink.h:1615:19:
              | 1615 | static inline u64 nla_get_u64(const struct nlattr *n=
la)
              |      |                   ^~~~~~~~~~~
              |      |                   |
              |      |                   (9) entry to 'nla_get_u64'
              | 1616 | {
              | 1617 |         u64 tmp;
              |      |             ~~~    =

              |      |             |
              |      |             (10) use of uninitialized value '<unknow=
n>' here
              |
   net/bridge/br_netlink.c: In function 'br_get_link_af_size_filtered':
>> net/bridge/br_netlink.c:99:13: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      99 |         u32 num_cfm_peer_mep_infos;
         |             ^~~~~~~~~~~~~~~~~~~~~~
     'br_setlink': event 1
       |
       | 1026 | int br_setlink(struct net_device *dev, struct nlmsghdr *nlh=
, u16 flags,
       |      |     ^~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'br_setlink'
       |
     'br_setlink': event 2
       |
       |net/bridge/br_private.h:432:56:
       |  432 |                 rtnl_dereference(dev->rx_handler_data) : NU=
LL;
       |
     'br_setlink': event 3
       |
       |include/linux/rcupdate.h:348:32:
       |  348 | #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
       |      |                                ^~
       |      |                                |
       |      |                                (3) ...to here
   include/linux/rcupdate.h:399:9: note: in expansion of macro 'RCU_LOCKDEP=
_WARN'
       |  399 |         RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_=
protected() usage"); \
       |      |         ^~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:595:9: note: in expansion of macro '__rcu_deref=
erence_protected'
       |  595 |         __rcu_dereference_protected((p), __UNIQUE_ID(rcu), =
(c), __rcu)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rtnetlink.h:81:9: note: in expansion of macro 'rcu_derefer=
ence_protected'
       |   81 |         rcu_dereference_protected(p, lockdep_rtnl_is_held())
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/bridge/br_private.h:432:17: note: in expansion of macro 'rtnl_derefe=
rence'
       |  432 |                 rtnl_dereference(dev->rx_handler_data) : NU=
LL;
       |      |                 ^~~~~~~~~~~~~~~~
       |
     'br_setlink': events 4-6
       |
       |net/bridge/br_netlink.c:1046:12:
       | 1046 |         if (!p && !afspec)
       |      |            ^
       |      |            |
       |      |            (4) following 'false' branch...
       |......
       | 1049 |         if (p && protinfo) {
       |      |             ~~~~~~~~~~~~~
       |      |               |
       |      |               (5) ...to here
       |......
       | 1063 |                         if (nla_len(protinfo) < sizeof(u8))
       |      |                            ~
       |      |                            |
       |      |                            (6) following 'false' branch...
       |
     'br_setlink': event 7
       |
       |include/linux/instruction_pointer.h:6:41:
       |    6 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned l=
ong)&&__here; })
       |      |                                         ^~~~~~
       |      |                                         |
       |      |                                         (7) ...to here
   include/linux/spinlock_api_up.h:34:30: note: in expansion of macro '_THI=
S_IP_'
       |   34 |   do { __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET=
); ___LOCK(lock); } while (0)
       |      |                              ^~~~~~~~~
   include/linux/spinlock_api_up.h:63:49: note: in expansion of macro '__LO=
CK_BH'
       |   63 | #define _raw_spin_lock_bh(lock)                 __LOCK_BH(l=
ock)
       |      |                                                 ^~~~~~~~~
   include/linux/spinlock.h:273:41: note: in expansion of macro '_raw_spin_=
lock_bh'
       |  273 | #define raw_spin_lock_bh(lock)          _raw_spin_lock_bh(l=
ock)
       |      |                                         ^~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:354:9: note: in expansion of macro 'raw_spin_lo=
ck_bh'
       |  354 |         raw_spin_lock_bh(&lock->rlock);
       |      |         ^~~~~~~~~~~~~~~~
       |
     'br_setlink': events 8-14
       |
       |net/bridge/br_netlink.c:1070:20:
       |  649 |         return br_info_notify(event, br, port, filter);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (14) calling 'br_info_notify' from 'br_setli=
nk'
       |......
       | 1070 |                 if (err)
       |      |                    ^
       |      |                    |
       |      |                    (8) following 'false' branch (when 'err =
=3D=3D 0')...
       | 1071 |                         goto out;
       | 1072 |                 changed =3D true;
       |      |                 ~~~~~~~
       |      |                 |
       |      |                 (9) ...to here
       |......
       | 1075 |         if (afspec)
       |      |            ~        =

       |      |            |
       |      |            (10) following 'false' branch (when 'afspec' is =
NULL)...
       |......
       | 1078 |         if (changed)
       |      |         ~~ ~        =

       |      |         |  |
       |      |         |  (12) following 'true' branch...
       |      |         (11) ...to here

vim +99 net/bridge/br_netlink.c

2594e9064a5763 Nikolay Aleksandrov 2015-09-25   92  =

fed0a159c8c5e4 Roopa Prabhu        2015-02-25   93  static size_t br_get_li=
nk_af_size_filtered(const struct net_device *dev,
fed0a159c8c5e4 Roopa Prabhu        2015-02-25   94  					   u32 filter_mask)
b7853d73e39b09 Roopa Prabhu        2015-02-21   95  {
2594e9064a5763 Nikolay Aleksandrov 2015-09-25   96  	struct net_bridge_vlan=
_group *vg =3D NULL;
efa5356b0d9753 Roopa Prabhu        2017-01-31   97  	struct net_bridge_port=
 *p =3D NULL;
b6d0425b816eed Henrik Bjoernlund   2020-10-27   98  	struct net_bridge *br =
=3D NULL;
b6d0425b816eed Henrik Bjoernlund   2020-10-27  @99  	u32 num_cfm_peer_mep_i=
nfos;
b6d0425b816eed Henrik Bjoernlund   2020-10-27  100  	u32 num_cfm_mep_infos;
efa5356b0d9753 Roopa Prabhu        2017-01-31  101  	size_t vinfo_sz =3D 0;
b6d0425b816eed Henrik Bjoernlund   2020-10-27  102  	int num_vlan_infos;
b7853d73e39b09 Roopa Prabhu        2015-02-21  103  =

2f56f6be47dbc6 Johannes Berg       2015-03-03  104  	rcu_read_lock();
35f861e3c58e12 Julian Wiedmann     2019-03-29  105  	if (netif_is_bridge_po=
rt(dev)) {
59259ff7a81b9e Zhang Zhengming     2021-04-28  106  		p =3D br_port_get_che=
ck_rcu(dev);
59259ff7a81b9e Zhang Zhengming     2021-04-28  107  		if (p)
907b1e6e83ed25 Nikolay Aleksandrov 2015-10-12  108  			vg =3D nbp_vlan_grou=
p_rcu(p);
254ec036db1123 Kyungrok Chung      2021-10-16  109  	} else if (netif_is_br=
idge_master(dev)) {
2594e9064a5763 Nikolay Aleksandrov 2015-09-25  110  		br =3D netdev_priv(de=
v);
907b1e6e83ed25 Nikolay Aleksandrov 2015-10-12  111  		vg =3D br_vlan_group_=
rcu(br);
2594e9064a5763 Nikolay Aleksandrov 2015-09-25  112  	}
77751ee8aec3e1 Nikolay Aleksandrov 2015-09-30  113  	num_vlan_infos =3D br_=
get_num_vlan_infos(vg, filter_mask);
2f56f6be47dbc6 Johannes Berg       2015-03-03  114  	rcu_read_unlock();
2f56f6be47dbc6 Johannes Berg       2015-03-03  115  =

efa5356b0d9753 Roopa Prabhu        2017-01-31  116  	if (p && (p->flags & B=
R_VLAN_TUNNEL))
efa5356b0d9753 Roopa Prabhu        2017-01-31  117  		vinfo_sz +=3D br_get_=
vlan_tunnel_info_size(vg);
efa5356b0d9753 Roopa Prabhu        2017-01-31  118  =

b7853d73e39b09 Roopa Prabhu        2015-02-21  119  	/* Each VLAN is return=
ed in bridge_vlan_info along with flags */
efa5356b0d9753 Roopa Prabhu        2017-01-31  120  	vinfo_sz +=3D num_vlan=
_infos * nla_total_size(sizeof(struct bridge_vlan_info));
efa5356b0d9753 Roopa Prabhu        2017-01-31  121  =

a911ad18a56aee Tobias Waldekranz   2022-03-22  122  	if (p && vg && (filter=
_mask & RTEXT_FILTER_MST))
122c29486e1ff7 Tobias Waldekranz   2022-03-16  123  		vinfo_sz +=3D br_mst_=
info_size(vg);
122c29486e1ff7 Tobias Waldekranz   2022-03-16  124  =

b6d0425b816eed Henrik Bjoernlund   2020-10-27  125  	if (!(filter_mask & RT=
EXT_FILTER_CFM_STATUS))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  126  		return vinfo_sz;
b6d0425b816eed Henrik Bjoernlund   2020-10-27  127  =

b6d0425b816eed Henrik Bjoernlund   2020-10-27  128  	if (!br)
b6d0425b816eed Henrik Bjoernlund   2020-10-27  129  		return vinfo_sz;
b6d0425b816eed Henrik Bjoernlund   2020-10-27  130  =

b6d0425b816eed Henrik Bjoernlund   2020-10-27  131  	/* CFM status info mus=
t be added */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  132  	br_cfm_mep_count(br, &=
num_cfm_mep_infos);
b6d0425b816eed Henrik Bjoernlund   2020-10-27  133  	br_cfm_peer_mep_count(=
br, &num_cfm_peer_mep_infos);
b6d0425b816eed Henrik Bjoernlund   2020-10-27  134  =

b6d0425b816eed Henrik Bjoernlund   2020-10-27  135  	vinfo_sz +=3D nla_tota=
l_size(0);	/* IFLA_BRIDGE_CFM */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  136  	/* For each status str=
uct the MEP instance (u32) is added */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  137  	/* MEP instance (u32) =
+ br_cfm_mep_status */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  138  	vinfo_sz +=3D num_cfm_=
mep_infos *
b6d0425b816eed Henrik Bjoernlund   2020-10-27  139  		     /*IFLA_BRIDGE_CF=
M_MEP_STATUS_INSTANCE */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  140  		    (nla_total_size(s=
izeof(u32))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  141  		     /* IFLA_BRIDGE_C=
FM_MEP_STATUS_OPCODE_UNEXP_SEEN */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  142  		     + nla_total_size=
(sizeof(u32))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  143  		     /* IFLA_BRIDGE_C=
FM_MEP_STATUS_VERSION_UNEXP_SEEN */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  144  		     + nla_total_size=
(sizeof(u32))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  145  		     /* IFLA_BRIDGE_C=
FM_MEP_STATUS_RX_LEVEL_LOW_SEEN */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  146  		     + nla_total_size=
(sizeof(u32)));
b6d0425b816eed Henrik Bjoernlund   2020-10-27  147  	/* MEP instance (u32) =
+ br_cfm_cc_peer_status */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  148  	vinfo_sz +=3D num_cfm_=
peer_mep_infos *
b6d0425b816eed Henrik Bjoernlund   2020-10-27  149  		     /* IFLA_BRIDGE_C=
FM_CC_PEER_STATUS_INSTANCE */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  150  		    (nla_total_size(s=
izeof(u32))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  151  		     /* IFLA_BRIDGE_C=
FM_CC_PEER_STATUS_PEER_MEPID */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  152  		     + nla_total_size=
(sizeof(u32))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  153  		     /* IFLA_BRIDGE_C=
FM_CC_PEER_STATUS_CCM_DEFECT */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  154  		     + nla_total_size=
(sizeof(u32))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  155  		     /* IFLA_BRIDGE_C=
FM_CC_PEER_STATUS_RDI */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  156  		     + nla_total_size=
(sizeof(u32))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  157  		     /* IFLA_BRIDGE_C=
FM_CC_PEER_STATUS_PORT_TLV_VALUE */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  158  		     + nla_total_size=
(sizeof(u8))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  159  		     /* IFLA_BRIDGE_C=
FM_CC_PEER_STATUS_IF_TLV_VALUE */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  160  		     + nla_total_size=
(sizeof(u8))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  161  		     /* IFLA_BRIDGE_C=
FM_CC_PEER_STATUS_SEEN */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  162  		     + nla_total_size=
(sizeof(u32))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  163  		     /* IFLA_BRIDGE_C=
FM_CC_PEER_STATUS_TLV_SEEN */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  164  		     + nla_total_size=
(sizeof(u32))
b6d0425b816eed Henrik Bjoernlund   2020-10-27  165  		     /* IFLA_BRIDGE_C=
FM_CC_PEER_STATUS_SEQ_UNEXP_SEEN */
b6d0425b816eed Henrik Bjoernlund   2020-10-27  166  		     + nla_total_size=
(sizeof(u32)));
b6d0425b816eed Henrik Bjoernlund   2020-10-27  167  =

efa5356b0d9753 Roopa Prabhu        2017-01-31  168  	return vinfo_sz;
b7853d73e39b09 Roopa Prabhu        2015-02-21  169  }
b7853d73e39b09 Roopa Prabhu        2015-02-21  170  =


:::::: The code at line 99 was first introduced by commit
:::::: b6d0425b816eed4dbd6fc590b27dbc7a113c0248 bridge: cfm: Netlink Notifi=
cations.

:::::: TO: Henrik Bjoernlund <henrik.bjoernlund@microchip.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8139870788399244318==--


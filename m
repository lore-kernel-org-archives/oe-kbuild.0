Content-Type: multipart/mixed; boundary="===============1806766152898206931=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:gearboxes 5/72] net/core/rtnetlink.c:5311:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Fri, 25 Feb 2022 21:49:16 +0800
Message-ID: <202202252123.8OOEl3w7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1806766152898206931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Petr Machata <petrm@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw gearboxes
head:   d58a6e73f8b9fad6ad13c269b9670388f242de6c
commit: ef1f07a8a52555ed2311efa7c44da698079e6278 [5/72] net: rtnetlink: rtn=
l_fill_statsinfo(): Permit non-EMSGSIZE error returns
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20225/202202252123.8OOEl3w7-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jpirko/linux_mlxsw/commit/ef1f07a8a52555ed2311=
efa7c44da698079e6278
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw gearboxes
        git checkout ef1f07a8a52555ed2311efa7c44da698079e6278
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   net/core/rtnetlink.c:2710:28: warning: Array access (from variable 'ifna=
me') results in a null pointer dereference [clang-analyzer-core.NullDerefer=
ence]
           if (ifm->ifi_index > 0 && ifname[0]) {
                                     ^~~~~~
   net/core/rtnetlink.c:2616:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/core/rtnetlink.c:2616:2: note: Taking false branch
           if (err < 0)
           ^
   net/core/rtnetlink.c:2619:6: note: Assuming the condition is false
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
               ^~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2619:6: note: Left side of '||' is false
   net/core/rtnetlink.c:2619:29: note: Assuming the condition is false
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
                                      ^~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2619:6: note: Left side of '||' is false
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
               ^
   net/core/rtnetlink.c:2619:51: note: Assuming the condition is true
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
                                                            ^~~~~~~~~~~~~~~=
~~~~~~~~
   net/core/rtnetlink.c:2619:2: note: Taking true branch
           if (tb[IFLA_NET_NS_PID] || tb[IFLA_NET_NS_FD] || tb[IFLA_TARGET_=
NETNSID]) {
           ^
   net/core/rtnetlink.c:2620:21: note: Assuming 'ifname' is null
                   const char *pat =3D ifname && ifname[0] ? ifname : NULL;
                                     ^~~~~~
   net/core/rtnetlink.c:2620:28: note: Left side of '&&' is false
                   const char *pat =3D ifname && ifname[0] ? ifname : NULL;
                                            ^
   net/core/rtnetlink.c:2626:7: note: Calling 'IS_ERR'
                   if (IS_ERR(net)) {
                       ^~~~~~~~~~~
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2626:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(net)) {
                       ^~~~~~~~~~~
   net/core/rtnetlink.c:2626:3: note: Taking false branch
                   if (IS_ERR(net)) {
                   ^
   net/core/rtnetlink.c:2631:7: note: Assuming the condition is false
                   if (tb[IFLA_NEW_IFINDEX])
                       ^~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2631:3: note: Taking false branch
                   if (tb[IFLA_NEW_IFINDEX])
                   ^
   net/core/rtnetlink.c:2638:7: note: Assuming 'err' is 0
                   if (err)
                       ^~~
   net/core/rtnetlink.c:2638:3: note: Taking false branch
                   if (err)
                   ^
   net/core/rtnetlink.c:2643:6: note: Assuming the condition is false
           if (tb[IFLA_MAP]) {
               ^~~~~~~~~~~~
   net/core/rtnetlink.c:2643:2: note: Taking false branch
           if (tb[IFLA_MAP]) {
           ^
   net/core/rtnetlink.c:2672:6: note: Assuming the condition is false
           if (tb[IFLA_ADDRESS]) {
               ^~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2672:2: note: Taking false branch
           if (tb[IFLA_ADDRESS]) {
           ^
   net/core/rtnetlink.c:2693:6: note: Assuming the condition is false
           if (tb[IFLA_MTU]) {
               ^~~~~~~~~~~~
   net/core/rtnetlink.c:2693:2: note: Taking false branch
           if (tb[IFLA_MTU]) {
           ^
   net/core/rtnetlink.c:2700:6: note: Assuming the condition is false
           if (tb[IFLA_GROUP]) {
               ^~~~~~~~~~~~~~
   net/core/rtnetlink.c:2700:2: note: Taking false branch
           if (tb[IFLA_GROUP]) {
           ^
   net/core/rtnetlink.c:2710:6: note: Assuming field 'ifi_index' is > 0
           if (ifm->ifi_index > 0 && ifname[0]) {
               ^~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:2710:6: note: Left side of '&&' is true
   net/core/rtnetlink.c:2710:28: note: Array access (from variable 'ifname'=
) results in a null pointer dereference
           if (ifm->ifi_index > 0 && ifname[0]) {
                                     ^~~~~~
   net/core/rtnetlink.c:2833:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/core/rtnetlink.c:2833:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   net/core/rtnetlink.c:2868:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/core/rtnetlink.c:2868:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
>> net/core/rtnetlink.c:5311:2: warning: Undefined or garbage value returne=
d to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return err;
           ^
   net/core/rtnetlink.c:5554:6: note: 'err' is 0
           if (err)
               ^~~
   net/core/rtnetlink.c:5554:2: note: Taking false branch
           if (err)
           ^
   net/core/rtnetlink.c:5558:6: note: Assuming field 'filter_mask' is not e=
qual to 0
           if (!ifsm->filter_mask) {
               ^~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:5558:2: note: Taking false branch
           if (!ifsm->filter_mask) {
           ^
   net/core/rtnetlink.c:5565:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   net/core/rtnetlink.c:5565:2: note: Taking false branch
           if (err)
           ^
   net/core/rtnetlink.c:5568:16: note: Assuming the condition is true
           for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
                         ^~~~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:5568:2: note: Loop condition is true.  Entering loo=
p body
           for (h =3D s_h; h < NETDEV_HASHENTRIES; h++, s_idx =3D 0) {
           ^
   net/core/rtnetlink.c:5571:3: note: Assuming '____ptr' is non-null
                   hlist_for_each_entry(dev, head, index_hlist) {
                   ^
   include/linux/list.h:1003:13: note: expanded from macro 'hlist_for_each_=
entry'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*(pos)), mem=
ber);\
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/list.h:993:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^~~~~~~
   net/core/rtnetlink.c:5571:3: note: '?' condition is true
                   hlist_for_each_entry(dev, head, index_hlist) {
                   ^
   include/linux/list.h:1003:13: note: expanded from macro 'hlist_for_each_=
entry'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*(pos)), mem=
ber);\
                      ^
   include/linux/list.h:993:5: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
              ^
   net/core/rtnetlink.c:5571:3: note: Loop condition is true.  Entering loo=
p body
                   hlist_for_each_entry(dev, head, index_hlist) {
                   ^
   include/linux/list.h:1003:2: note: expanded from macro 'hlist_for_each_e=
ntry'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*(pos)), mem=
ber);\
           ^
   net/core/rtnetlink.c:5572:8: note: Assuming 'idx' is >=3D 's_idx'
                           if (idx < s_idx)
                               ^~~~~~~~~~~
   net/core/rtnetlink.c:5572:4: note: Taking false branch
                           if (idx < s_idx)
                           ^
   net/core/rtnetlink.c:5574:10: note: Calling 'rtnl_fill_statsinfo'
                           err =3D rtnl_fill_statsinfo(skb, dev, RTM_NEWSTA=
TS,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/rtnetlink.c:5159:2: note: 'err' declared without an initial val=
ue
           int err;
           ^~~~~~~
   net/core/rtnetlink.c:5161:2: note: Assuming the condition is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:12: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   net/core/rtnetlink.c:5161:2: note: '__ret_do_once' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/rtnetlink.c:5161:2: note: Left side of '&&' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \

vim +5311 net/core/rtnetlink.c

a79159c08b5a56 Petr Machata        2022-02-21  5146  =

10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5147  static int rtnl_fill_s=
tatsinfo(struct sk_buff *skb, struct net_device *dev,
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5148  			       int type, u3=
2 pid, u32 seq, u32 change,
a79159c08b5a56 Petr Machata        2022-02-21  5149  			       unsigned int=
 flags,
a79159c08b5a56 Petr Machata        2022-02-21  5150  			       const struct=
 rtnl_stats_dump_filters *filters,
33f11b46a4f00f Petr Machata        2022-02-21  5151  			       int *idxattr=
, int *prividx,
33f11b46a4f00f Petr Machata        2022-02-21  5152  			       struct netli=
nk_ext_ack *extack)
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5153  {
a79159c08b5a56 Petr Machata        2022-02-21  5154  	unsigned int filter_m=
ask =3D filters->mask[0];
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5155  	struct if_stats_msg *=
ifsm;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5156  	struct nlmsghdr *nlh;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5157  	struct nlattr *attr;
e8872a25a05efc Nikolay Aleksandrov 2016-04-30  5158  	int s_prividx =3D *pr=
ividx;
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5159  	int err;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5160  =

10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5161  	ASSERT_RTNL();
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5162  =

10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5163  	nlh =3D nlmsg_put(skb=
, pid, seq, type, sizeof(*ifsm), flags);
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5164  	if (!nlh)
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5165  		return -EMSGSIZE;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5166  =

10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5167  	ifsm =3D nlmsg_data(n=
lh);
ce024f42c2e28b Nikolay Aleksandrov 2017-10-03  5168  	ifsm->family =3D PF_U=
NSPEC;
ce024f42c2e28b Nikolay Aleksandrov 2017-10-03  5169  	ifsm->pad1 =3D 0;
ce024f42c2e28b Nikolay Aleksandrov 2017-10-03  5170  	ifsm->pad2 =3D 0;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5171  	ifsm->ifindex =3D dev=
->ifindex;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5172  	ifsm->filter_mask =3D=
 filter_mask;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5173  =

e8872a25a05efc Nikolay Aleksandrov 2016-04-30  5174  	if (stats_attr_valid(=
filter_mask, IFLA_STATS_LINK_64, *idxattr)) {
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5175  		struct rtnl_link_sta=
ts64 *sp;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5176  =

58414d32a37e4c Nicolas Dichtel     2016-04-21  5177  		attr =3D nla_reserve=
_64bit(skb, IFLA_STATS_LINK_64,
58414d32a37e4c Nicolas Dichtel     2016-04-21  5178  					 sizeof(struct rt=
nl_link_stats64),
58414d32a37e4c Nicolas Dichtel     2016-04-21  5179  					 IFLA_STATS_UNSPE=
C);
ef1f07a8a52555 Petr Machata        2022-02-21  5180  		if (!attr) {
ef1f07a8a52555 Petr Machata        2022-02-21  5181  			err =3D -EMSGSIZE;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5182  			goto nla_put_failur=
e;
ef1f07a8a52555 Petr Machata        2022-02-21  5183  		}
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5184  =

10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5185  		sp =3D nla_data(attr=
);
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5186  		dev_get_stats(dev, s=
p);
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5187  	}
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5188  =

97a47facf3468f Nikolay Aleksandrov 2016-04-30  5189  	if (stats_attr_valid(=
filter_mask, IFLA_STATS_LINK_XSTATS, *idxattr)) {
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5190  		const struct rtnl_li=
nk_ops *ops =3D dev->rtnl_link_ops;
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5191  =

97a47facf3468f Nikolay Aleksandrov 2016-04-30  5192  		if (ops && ops->fill=
_linkxstats) {
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5193  			*idxattr =3D IFLA_S=
TATS_LINK_XSTATS;
ae0be8de9a53cd Michal Kubecek      2019-04-26  5194  			attr =3D nla_nest_s=
tart_noflag(skb,
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5195  						     IFLA_STATS_=
LINK_XSTATS);
ef1f07a8a52555 Petr Machata        2022-02-21  5196  			if (!attr) {
ef1f07a8a52555 Petr Machata        2022-02-21  5197  				err =3D -EMSGSIZE;
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5198  				goto nla_put_failu=
re;
ef1f07a8a52555 Petr Machata        2022-02-21  5199  			}
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5200  =

80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5201  			err =3D ops->fill_l=
inkxstats(skb, dev, prividx, *idxattr);
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5202  			nla_nest_end(skb, a=
ttr);
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5203  			if (err)
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5204  				goto nla_put_failu=
re;
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5205  			*idxattr =3D 0;
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5206  		}
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5207  	}
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5208  =

80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5209  	if (stats_attr_valid(=
filter_mask, IFLA_STATS_LINK_XSTATS_SLAVE,
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5210  			     *idxattr)) {
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5211  		const struct rtnl_li=
nk_ops *ops =3D NULL;
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5212  		const struct net_dev=
ice *master;
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5213  =

80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5214  		master =3D netdev_ma=
ster_upper_dev_get(dev);
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5215  		if (master)
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5216  			ops =3D master->rtn=
l_link_ops;
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5217  		if (ops && ops->fill=
_linkxstats) {
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5218  			*idxattr =3D IFLA_S=
TATS_LINK_XSTATS_SLAVE;
ae0be8de9a53cd Michal Kubecek      2019-04-26  5219  			attr =3D nla_nest_s=
tart_noflag(skb,
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5220  						     IFLA_STATS_=
LINK_XSTATS_SLAVE);
ef1f07a8a52555 Petr Machata        2022-02-21  5221  			if (!attr) {
ef1f07a8a52555 Petr Machata        2022-02-21  5222  				err =3D -EMSGSIZE;
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5223  				goto nla_put_failu=
re;
ef1f07a8a52555 Petr Machata        2022-02-21  5224  			}
80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5225  =

80e73cc563c435 Nikolay Aleksandrov 2016-06-28  5226  			err =3D ops->fill_l=
inkxstats(skb, dev, prividx, *idxattr);
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5227  			nla_nest_end(skb, a=
ttr);
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5228  			if (err)
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5229  				goto nla_put_failu=
re;
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5230  			*idxattr =3D 0;
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5231  		}
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5232  	}
97a47facf3468f Nikolay Aleksandrov 2016-04-30  5233  =

69ae6ad2ff3791 Nogah Frankel       2016-09-16  5234  	if (stats_attr_valid(=
filter_mask, IFLA_STATS_LINK_OFFLOAD_XSTATS,
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5235  			     *idxattr)) {
a79159c08b5a56 Petr Machata        2022-02-21  5236  		u32 off_filter_mask;
a79159c08b5a56 Petr Machata        2022-02-21  5237  =

a79159c08b5a56 Petr Machata        2022-02-21  5238  		off_filter_mask =3D =
filters->mask[IFLA_STATS_LINK_OFFLOAD_XSTATS];
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5239  		*idxattr =3D IFLA_ST=
ATS_LINK_OFFLOAD_XSTATS;
ae0be8de9a53cd Michal Kubecek      2019-04-26  5240  		attr =3D nla_nest_st=
art_noflag(skb,
ae0be8de9a53cd Michal Kubecek      2019-04-26  5241  					     IFLA_STATS_L=
INK_OFFLOAD_XSTATS);
ef1f07a8a52555 Petr Machata        2022-02-21  5242  		if (!attr) {
ef1f07a8a52555 Petr Machata        2022-02-21  5243  			err =3D -EMSGSIZE;
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5244  			goto nla_put_failur=
e;
ef1f07a8a52555 Petr Machata        2022-02-21  5245  		}
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5246  =

a79159c08b5a56 Petr Machata        2022-02-21  5247  		err =3D rtnl_offload=
_xstats_fill(skb, dev, prividx,
33f11b46a4f00f Petr Machata        2022-02-21  5248  					       off_filter=
_mask, extack);
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5249  		if (err =3D=3D -ENOD=
ATA)
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5250  			nla_nest_cancel(skb=
, attr);
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5251  		else
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5252  			nla_nest_end(skb, a=
ttr);
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5253  =

69ae6ad2ff3791 Nogah Frankel       2016-09-16  5254  		if (err && err !=3D =
-ENODATA)
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5255  			goto nla_put_failur=
e;
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5256  		*idxattr =3D 0;
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5257  	}
69ae6ad2ff3791 Nogah Frankel       2016-09-16  5258  =

aefb4d4ad83b60 Robert Shearman     2017-01-16  5259  	if (stats_attr_valid(=
filter_mask, IFLA_STATS_AF_SPEC, *idxattr)) {
aefb4d4ad83b60 Robert Shearman     2017-01-16  5260  		struct rtnl_af_ops *=
af_ops;
aefb4d4ad83b60 Robert Shearman     2017-01-16  5261  =

aefb4d4ad83b60 Robert Shearman     2017-01-16  5262  		*idxattr =3D IFLA_ST=
ATS_AF_SPEC;
ae0be8de9a53cd Michal Kubecek      2019-04-26  5263  		attr =3D nla_nest_st=
art_noflag(skb, IFLA_STATS_AF_SPEC);
ef1f07a8a52555 Petr Machata        2022-02-21  5264  		if (!attr) {
ef1f07a8a52555 Petr Machata        2022-02-21  5265  			err =3D -EMSGSIZE;
aefb4d4ad83b60 Robert Shearman     2017-01-16  5266  			goto nla_put_failur=
e;
ef1f07a8a52555 Petr Machata        2022-02-21  5267  		}
aefb4d4ad83b60 Robert Shearman     2017-01-16  5268  =

5fa85a09390c4a Florian Westphal    2017-10-16  5269  		rcu_read_lock();
5fa85a09390c4a Florian Westphal    2017-10-16  5270  		list_for_each_entry_=
rcu(af_ops, &rtnl_af_ops, list) {
aefb4d4ad83b60 Robert Shearman     2017-01-16  5271  			if (af_ops->fill_st=
ats_af) {
aefb4d4ad83b60 Robert Shearman     2017-01-16  5272  				struct nlattr *af;
aefb4d4ad83b60 Robert Shearman     2017-01-16  5273  				int err;
aefb4d4ad83b60 Robert Shearman     2017-01-16  5274  =

ae0be8de9a53cd Michal Kubecek      2019-04-26  5275  				af =3D nla_nest_st=
art_noflag(skb,
ae0be8de9a53cd Michal Kubecek      2019-04-26  5276  							   af_ops->fami=
ly);
5fa85a09390c4a Florian Westphal    2017-10-16  5277  				if (!af) {
5fa85a09390c4a Florian Westphal    2017-10-16  5278  					rcu_read_unlock();
aefb4d4ad83b60 Robert Shearman     2017-01-16  5279  					goto nla_put_fail=
ure;
5fa85a09390c4a Florian Westphal    2017-10-16  5280  				}
aefb4d4ad83b60 Robert Shearman     2017-01-16  5281  				err =3D af_ops->fi=
ll_stats_af(skb, dev);
aefb4d4ad83b60 Robert Shearman     2017-01-16  5282  =

5fa85a09390c4a Florian Westphal    2017-10-16  5283  				if (err =3D=3D -EN=
ODATA) {
aefb4d4ad83b60 Robert Shearman     2017-01-16  5284  					nla_nest_cancel(s=
kb, af);
5fa85a09390c4a Florian Westphal    2017-10-16  5285  				} else if (err < 0=
) {
5fa85a09390c4a Florian Westphal    2017-10-16  5286  					rcu_read_unlock();
aefb4d4ad83b60 Robert Shearman     2017-01-16  5287  					goto nla_put_fail=
ure;
5fa85a09390c4a Florian Westphal    2017-10-16  5288  				}
aefb4d4ad83b60 Robert Shearman     2017-01-16  5289  =

aefb4d4ad83b60 Robert Shearman     2017-01-16  5290  				nla_nest_end(skb, =
af);
aefb4d4ad83b60 Robert Shearman     2017-01-16  5291  			}
aefb4d4ad83b60 Robert Shearman     2017-01-16  5292  		}
5fa85a09390c4a Florian Westphal    2017-10-16  5293  		rcu_read_unlock();
aefb4d4ad83b60 Robert Shearman     2017-01-16  5294  =

aefb4d4ad83b60 Robert Shearman     2017-01-16  5295  		nla_nest_end(skb, at=
tr);
aefb4d4ad83b60 Robert Shearman     2017-01-16  5296  =

aefb4d4ad83b60 Robert Shearman     2017-01-16  5297  		*idxattr =3D 0;
aefb4d4ad83b60 Robert Shearman     2017-01-16  5298  	}
aefb4d4ad83b60 Robert Shearman     2017-01-16  5299  =

10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5300  	nlmsg_end(skb, nlh);
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5301  =

10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5302  	return 0;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5303  =

10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5304  nla_put_failure:
e8872a25a05efc Nikolay Aleksandrov 2016-04-30  5305  	/* not a multi messag=
e or no progress mean a real error */
e8872a25a05efc Nikolay Aleksandrov 2016-04-30  5306  	if (!(flags & NLM_F_M=
ULTI) || s_prividx =3D=3D *prividx)
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5307  		nlmsg_cancel(skb, nl=
h);
e8872a25a05efc Nikolay Aleksandrov 2016-04-30  5308  	else
e8872a25a05efc Nikolay Aleksandrov 2016-04-30  5309  		nlmsg_end(skb, nlh);
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5310  =

ef1f07a8a52555 Petr Machata        2022-02-21 @5311  	return err;
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5312  }
10c9ead9f3c6bb Roopa Prabhu        2016-04-20  5313  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1806766152898206931==--


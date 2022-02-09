Content-Type: multipart/mixed; boundary="===============6672086460184729697=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [saeed:net-next-mlx5 24/149] net/mptcp/pm_netlink.c:1224:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Thu, 10 Feb 2022 06:59:11 +0800
Message-ID: <202202100630.4DQ68SDT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6672086460184729697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Geliang Tang <geliang.tang@suse.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Mat Martineau <mathew.j.martineau@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git net=
-next-mlx5
head:   645c8116a15fb54da78658990992296831729f62
commit: 09f12c3ab7a5dc30c4efc6a530891f377d9ba1f4 [24/149] mptcp: allow to u=
se port and non-signal in set_flags
:::::: branch date: 6 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20210/202202100630.4DQ68SDT-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git/c=
ommit/?id=3D09f12c3ab7a5dc30c4efc6a530891f377d9ba1f4
        git remote add saeed https://git.kernel.org/pub/scm/linux/kernel/gi=
t/saeed/linux.git
        git fetch --no-tags saeed net-next-mlx5
        git checkout 09f12c3ab7a5dc30c4efc6a530891f377d9ba1f4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^
   net/mptcp/pm_netlink.c:1789:2: note: Taking false branch
           if (addr.addr.family =3D=3D AF_UNSPEC) {
           ^
   net/mptcp/pm_netlink.c:1797:7: note: 'entry' is non-null
           if (!entry) {
                ^~~~~
   net/mptcp/pm_netlink.c:1797:2: note: Taking false branch
           if (!entry) {
           ^
   net/mptcp/pm_netlink.c:1801:49: note: Left side of '&&' is false
           if ((addr.flags & MPTCP_PM_ADDR_FLAG_FULLMESH) &&
                                                          ^
   net/mptcp/pm_netlink.c:1812:2: note: Calling 'mptcp_nl_set_flags'
           mptcp_nl_set_flags(net, &addr.addr, bkup, changed);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1749:9: note: Assuming the condition is true
           while ((msk =3D mptcp_token_iter_next(net, &s_slot, &s_num)) !=
=3D NULL) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/mptcp/pm_netlink.c:1749:2: note: Loop condition is true.  Entering l=
oop body
           while ((msk =3D mptcp_token_iter_next(net, &s_slot, &s_num)) !=
=3D NULL) {
           ^
   net/mptcp/pm_netlink.c:1752:7: note: Assuming the condition is false
                   if (list_empty(&msk->conn_list))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1752:3: note: Taking false branch
                   if (list_empty(&msk->conn_list))
                   ^
   net/mptcp/pm_netlink.c:1757:7: note: Assuming the condition is true
                   if (changed & MPTCP_PM_ADDR_FLAG_BACKUP)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1757:3: note: Taking true branch
                   if (changed & MPTCP_PM_ADDR_FLAG_BACKUP)
                   ^
   net/mptcp/pm_netlink.c:1758:10: note: Calling 'mptcp_pm_nl_mp_prio_send_=
ack'
                           ret =3D mptcp_pm_nl_mp_prio_send_ack(msk, addr, =
bkup);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/mptcp/pm_netlink.c:718:2: note: Taking false branch
           pr_debug("bkup=3D%d", bkup);
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/mptcp/pm_netlink.c:720:2: note: Loop condition is true.  Entering lo=
op body
           mptcp_for_each_subflow(msk, subflow) {
           ^
   net/mptcp/protocol.h:294:2: note: expanded from macro 'mptcp_for_each_su=
bflow'
           list_for_each_entry(__subflow, &((__msk)->conn_list), node)
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   net/mptcp/pm_netlink.c:725:3: note: Calling 'local_address'
                   local_address((struct sock_common *)ssk, &local);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:101:6: note: Assuming field 'family' is not equal=
 to AF_INET
           if (addr->family =3D=3D AF_INET)
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:101:2: note: Taking false branch
           if (addr->family =3D=3D AF_INET)
           ^
   net/mptcp/pm_netlink.c:104:11: note: Assuming field 'family' is not equa=
l to AF_INET6
           else if (addr->family =3D=3D AF_INET6)
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:104:7: note: Taking false branch
           else if (addr->family =3D=3D AF_INET6)
                ^
   net/mptcp/pm_netlink.c:725:3: note: Returning from 'local_address'
                   local_address((struct sock_common *)ssk, &local);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:726:8: note: Calling 'addresses_equal'
                   if (!addresses_equal(&local, addr, addr->port))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:63:6: note: Assuming 'a->family' is not equal to =
'b->family'
           if (a->family =3D=3D b->family) {
               ^~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:63:2: note: Taking false branch
           if (a->family =3D=3D b->family) {
           ^
   net/mptcp/pm_netlink.c:69:16: note: Field 'family' is not equal to AF_IN=
ET
           } else if (a->family =3D=3D AF_INET) {
                         ^
   net/mptcp/pm_netlink.c:69:9: note: Taking false branch
           } else if (a->family =3D=3D AF_INET) {
                  ^
   net/mptcp/pm_netlink.c:72:13: note: Assuming field 'family' is equal to =
AF_INET
           } else if (b->family =3D=3D AF_INET) {
                      ^~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:72:9: note: Taking true branch
           } else if (b->family =3D=3D AF_INET) {
                  ^
   net/mptcp/pm_netlink.c:73:7: note: Calling 'ipv6_addr_v4mapped'
                   if (ipv6_addr_v4mapped(&a->addr6))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/ipv6.h:705:43: note: The left operand of '^' is a garbage va=
lue
                   (__force unsigned long)(a->s6_addr32[2] ^
                                           ~~~~~~~~~~~~~~~ ^
>> net/mptcp/pm_netlink.c:1224:6: warning: Branch condition evaluates to a =
garbage value [clang-analyzer-core.uninitialized.Branch]
           if (addr.addr.port && !(addr.flags & MPTCP_PM_ADDR_FLAG_SIGNAL))=
 {
               ^~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1220:8: note: Calling 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, true, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1119:6: note: Assuming 'attr' is non-null
           if (!attr) {
               ^~~~~
   net/mptcp/pm_netlink.c:1119:2: note: Taking false branch
           if (!attr) {
           ^
   net/mptcp/pm_netlink.c:1127:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   net/mptcp/pm_netlink.c:1127:2: note: Taking true branch
           if (err)
           ^
   net/mptcp/pm_netlink.c:1128:3: note: Returning without writing to 'entry=
->addr.port'
                   return err;
                   ^
   net/mptcp/pm_netlink.c:1220:8: note: Returning from 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, true, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1221:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   net/mptcp/pm_netlink.c:1221:2: note: Taking false branch
           if (ret < 0)
           ^
   net/mptcp/pm_netlink.c:1224:6: note: Branch condition evaluates to a gar=
bage value
           if (addr.addr.port && !(addr.flags & MPTCP_PM_ADDR_FLAG_SIGNAL))=
 {
               ^~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1407:19: warning: The left operand of '=3D=3D' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (addr.addr.id =3D=3D 0)
               ~~~~~~~~~~~~ ^
   net/mptcp/pm_netlink.c:1398:8: note: Calling 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, false, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1119:6: note: Assuming 'attr' is non-null
           if (!attr) {
               ^~~~~
   net/mptcp/pm_netlink.c:1119:2: note: Taking false branch
           if (!attr) {
           ^
   net/mptcp/pm_netlink.c:1127:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   net/mptcp/pm_netlink.c:1127:2: note: Taking true branch
           if (err)
           ^
   net/mptcp/pm_netlink.c:1128:3: note: Returning without writing to 'entry=
->addr.id'
                   return err;
                   ^
   net/mptcp/pm_netlink.c:1398:8: note: Returning from 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, false, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1399:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   net/mptcp/pm_netlink.c:1399:2: note: Taking false branch
           if (ret < 0)
           ^
   net/mptcp/pm_netlink.c:1407:19: note: The left operand of '=3D=3D' is a =
garbage value
           if (addr.addr.id =3D=3D 0)
               ~~~~~~~~~~~~ ^
   net/mptcp/pm_netlink.c:1589:10: warning: 2nd function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           entry =3D __lookup_addr_by_id(pernet, addr.addr.id);
                   ^                           ~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1572:8: note: Calling 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, false, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1119:6: note: Assuming 'attr' is non-null
           if (!attr) {
               ^~~~~
   net/mptcp/pm_netlink.c:1119:2: note: Taking false branch
           if (!attr) {
           ^
   net/mptcp/pm_netlink.c:1127:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   net/mptcp/pm_netlink.c:1127:2: note: Taking true branch
           if (err)
           ^
   net/mptcp/pm_netlink.c:1128:3: note: Returning without writing to 'entry=
->addr.id'
                   return err;
                   ^
   net/mptcp/pm_netlink.c:1572:8: note: Returning from 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, false, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1573:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   net/mptcp/pm_netlink.c:1573:2: note: Taking false branch
           if (ret < 0)
           ^
   net/mptcp/pm_netlink.c:1577:6: note: Assuming 'msg' is non-null
           if (!msg)
               ^~~~
   net/mptcp/pm_netlink.c:1577:2: note: Taking false branch
           if (!msg)

vim +1224 net/mptcp/pm_netlink.c

875b76718f68bac Geliang Tang 2021-02-01  1212  =

01cacb00b35cb62 Paolo Abeni  2020-03-27  1213  static int mptcp_nl_cmd_add_=
addr(struct sk_buff *skb, struct genl_info *info)
01cacb00b35cb62 Paolo Abeni  2020-03-27  1214  {
01cacb00b35cb62 Paolo Abeni  2020-03-27  1215  	struct nlattr *attr =3D inf=
o->attrs[MPTCP_PM_ATTR_ADDR];
01cacb00b35cb62 Paolo Abeni  2020-03-27  1216  	struct pm_nl_pernet *pernet=
 =3D genl_info_pm_nl(info);
01cacb00b35cb62 Paolo Abeni  2020-03-27  1217  	struct mptcp_pm_addr_entry =
addr, *entry;
01cacb00b35cb62 Paolo Abeni  2020-03-27  1218  	int ret;
01cacb00b35cb62 Paolo Abeni  2020-03-27  1219  =

01cacb00b35cb62 Paolo Abeni  2020-03-27  1220  	ret =3D mptcp_pm_parse_addr=
(attr, info, true, &addr);
01cacb00b35cb62 Paolo Abeni  2020-03-27  1221  	if (ret < 0)
01cacb00b35cb62 Paolo Abeni  2020-03-27  1222  		return ret;
01cacb00b35cb62 Paolo Abeni  2020-03-27  1223  =

09f12c3ab7a5dc3 Geliang Tang 2022-02-04 @1224  	if (addr.addr.port && !(add=
r.flags & MPTCP_PM_ADDR_FLAG_SIGNAL)) {
09f12c3ab7a5dc3 Geliang Tang 2022-02-04  1225  		GENL_SET_ERR_MSG(info, "fl=
ags must have signal when using port");
09f12c3ab7a5dc3 Geliang Tang 2022-02-04  1226  		return -EINVAL;
09f12c3ab7a5dc3 Geliang Tang 2022-02-04  1227  	}
09f12c3ab7a5dc3 Geliang Tang 2022-02-04  1228  =

01cacb00b35cb62 Paolo Abeni  2020-03-27  1229  	entry =3D kmalloc(sizeof(*e=
ntry), GFP_KERNEL);
01cacb00b35cb62 Paolo Abeni  2020-03-27  1230  	if (!entry) {
01cacb00b35cb62 Paolo Abeni  2020-03-27  1231  		GENL_SET_ERR_MSG(info, "ca=
n't allocate addr");
01cacb00b35cb62 Paolo Abeni  2020-03-27  1232  		return -ENOMEM;
01cacb00b35cb62 Paolo Abeni  2020-03-27  1233  	}
01cacb00b35cb62 Paolo Abeni  2020-03-27  1234  =

01cacb00b35cb62 Paolo Abeni  2020-03-27  1235  	*entry =3D addr;
1729cf186d8a5d7 Geliang Tang 2021-02-01  1236  	if (entry->addr.port) {
1729cf186d8a5d7 Geliang Tang 2021-02-01  1237  		ret =3D mptcp_pm_nl_create=
_listen_socket(skb->sk, entry);
1729cf186d8a5d7 Geliang Tang 2021-02-01  1238  		if (ret) {
1729cf186d8a5d7 Geliang Tang 2021-02-01  1239  			GENL_SET_ERR_MSG(info, "c=
reate listen socket error");
1729cf186d8a5d7 Geliang Tang 2021-02-01  1240  			kfree(entry);
1729cf186d8a5d7 Geliang Tang 2021-02-01  1241  			return ret;
1729cf186d8a5d7 Geliang Tang 2021-02-01  1242  		}
1729cf186d8a5d7 Geliang Tang 2021-02-01  1243  	}
01cacb00b35cb62 Paolo Abeni  2020-03-27  1244  	ret =3D mptcp_pm_nl_append_=
new_local_addr(pernet, entry);
01cacb00b35cb62 Paolo Abeni  2020-03-27  1245  	if (ret < 0) {
01cacb00b35cb62 Paolo Abeni  2020-03-27  1246  		GENL_SET_ERR_MSG(info, "to=
o many addresses or duplicate one");
1729cf186d8a5d7 Geliang Tang 2021-02-01  1247  		if (entry->lsk)
1729cf186d8a5d7 Geliang Tang 2021-02-01  1248  			sock_release(entry->lsk);
01cacb00b35cb62 Paolo Abeni  2020-03-27  1249  		kfree(entry);
01cacb00b35cb62 Paolo Abeni  2020-03-27  1250  		return ret;
01cacb00b35cb62 Paolo Abeni  2020-03-27  1251  	}
01cacb00b35cb62 Paolo Abeni  2020-03-27  1252  =

875b76718f68bac Geliang Tang 2021-02-01  1253  	mptcp_nl_add_subflow_or_sig=
nal_addr(sock_net(skb->sk));
875b76718f68bac Geliang Tang 2021-02-01  1254  =

01cacb00b35cb62 Paolo Abeni  2020-03-27  1255  	return 0;
01cacb00b35cb62 Paolo Abeni  2020-03-27  1256  }
01cacb00b35cb62 Paolo Abeni  2020-03-27  1257  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6672086460184729697==--


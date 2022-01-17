Content-Type: multipart/mixed; boundary="===============3998427166550035586=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH mptcp-next v2 04/10] mptcp: allow to use port and non-signal in set_flags
Date: Mon, 17 Jan 2022 08:57:54 +0800
Message-ID: <202201170809.mnbOMph4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3998427166550035586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <3be4e9906eafe7efb2326e47f75ef26cc1031427.1642320655.git.gelia=
ng.tang@suse.com>
References: <3be4e9906eafe7efb2326e47f75ef26cc1031427.1642320655.git.gelian=
g.tang@suse.com>
TO: Geliang Tang <geliang.tang@suse.com>
TO: mptcp(a)lists.linux.dev
CC: Geliang Tang <geliang.tang@suse.com>

Hi Geliang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mptcp/export]
[cannot apply to shuah-kselftest/next linus/master v5.16 next-20220116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Geliang-Tang/set-flags-and=
-selftests/20220116-162051
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20117/202201170809.mnbOMph4-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c63a31=
75c2947e8c1a2d3bbe16a8586600705c54)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/019a14644e4d438da92165724=
463810bca38eeec
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Geliang-Tang/set-flags-and-selftes=
ts/20220116-162051
        git checkout 019a14644e4d438da92165724463810bca38eeec
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   net/mptcp/pm_netlink.c:1783:2: note: Taking false branch
           if (addr.addr.family =3D=3D AF_UNSPEC) {
           ^
   net/mptcp/pm_netlink.c:1791:7: note: 'entry' is non-null
           if (!entry) {
                ^~~~~
   net/mptcp/pm_netlink.c:1791:2: note: Taking false branch
           if (!entry) {
           ^
   net/mptcp/pm_netlink.c:1795:49: note: Left side of '&&' is false
           if ((addr.flags & MPTCP_PM_ADDR_FLAG_FULLMESH) &&
                                                          ^
   net/mptcp/pm_netlink.c:1806:2: note: Calling 'mptcp_nl_set_flags'
           mptcp_nl_set_flags(net, &addr.addr, bkup, changed);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1743:9: note: Assuming the condition is true
           while ((msk =3D mptcp_token_iter_next(net, &s_slot, &s_num)) !=
=3D NULL) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/mptcp/pm_netlink.c:1743:2: note: Loop condition is true.  Entering l=
oop body
           while ((msk =3D mptcp_token_iter_next(net, &s_slot, &s_num)) !=
=3D NULL) {
           ^
   net/mptcp/pm_netlink.c:1746:7: note: Assuming the condition is false
                   if (list_empty(&msk->conn_list) || mptcp_pm_is_userspace=
(msk))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1746:7: note: Left side of '||' is false
   net/mptcp/pm_netlink.c:1746:3: note: Taking false branch
                   if (list_empty(&msk->conn_list) || mptcp_pm_is_userspace=
(msk))
                   ^
   net/mptcp/pm_netlink.c:1751:7: note: Assuming the condition is true
                   if (changed & MPTCP_PM_ADDR_FLAG_BACKUP)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1751:3: note: Taking true branch
                   if (changed & MPTCP_PM_ADDR_FLAG_BACKUP)
                   ^
   net/mptcp/pm_netlink.c:1752:10: note: Calling 'mptcp_pm_nl_mp_prio_send_=
ack'
                           ret =3D mptcp_pm_nl_mp_prio_send_ack(msk, addr, =
bkup);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   net/mptcp/pm_netlink.c:718:2: note: Taking false branch
           pr_debug("bkup=3D%d", bkup);
           ^
   include/linux/printk.h:580:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/mptcp/pm_netlink.c:720:2: note: Loop condition is true.  Entering lo=
op body
           mptcp_for_each_subflow(msk, subflow) {
           ^
   net/mptcp/protocol.h:304:2: note: expanded from macro 'mptcp_for_each_su=
bflow'
           list_for_each_entry(__subflow, &((__msk)->conn_list), node)
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
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
   include/net/ipv6.h:698:43: note: The left operand of '^' is a garbage va=
lue
                   (__force unsigned long)(a->s6_addr32[2] ^
                                           ~~~~~~~~~~~~~~~ ^
>> net/mptcp/pm_netlink.c:1213:6: warning: Branch condition evaluates to a =
garbage value [clang-analyzer-core.uninitialized.Branch]
           if (addr.addr.port && !(addr.flags & MPTCP_PM_ADDR_FLAG_SIGNAL))=
 {
               ^~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1209:8: note: Calling 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, true, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1107:6: note: Assuming 'attr' is non-null
           if (!attr) {
               ^~~~~
   net/mptcp/pm_netlink.c:1107:2: note: Taking false branch
           if (!attr) {
           ^
   net/mptcp/pm_netlink.c:1115:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   net/mptcp/pm_netlink.c:1115:2: note: Taking true branch
           if (err)
           ^
   net/mptcp/pm_netlink.c:1116:3: note: Returning without writing to 'entry=
->addr.port'
                   return err;
                   ^
   net/mptcp/pm_netlink.c:1209:8: note: Returning from 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, true, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1210:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   net/mptcp/pm_netlink.c:1210:2: note: Taking false branch
           if (ret < 0)
           ^
   net/mptcp/pm_netlink.c:1213:6: note: Branch condition evaluates to a gar=
bage value
           if (addr.addr.port && !(addr.flags & MPTCP_PM_ADDR_FLAG_SIGNAL))=
 {
               ^~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1399:19: warning: The left operand of '=3D=3D' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (addr.addr.id =3D=3D 0)
               ~~~~~~~~~~~~ ^
   net/mptcp/pm_netlink.c:1390:8: note: Calling 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, false, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1107:6: note: Assuming 'attr' is non-null
           if (!attr) {
               ^~~~~
   net/mptcp/pm_netlink.c:1107:2: note: Taking false branch
           if (!attr) {
           ^
   net/mptcp/pm_netlink.c:1115:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   net/mptcp/pm_netlink.c:1115:2: note: Taking true branch
           if (err)
           ^
   net/mptcp/pm_netlink.c:1116:3: note: Returning without writing to 'entry=
->addr.id'
                   return err;
                   ^
   net/mptcp/pm_netlink.c:1390:8: note: Returning from 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, false, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1391:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   net/mptcp/pm_netlink.c:1391:2: note: Taking false branch
           if (ret < 0)
           ^
   net/mptcp/pm_netlink.c:1399:19: note: The left operand of '=3D=3D' is a =
garbage value
           if (addr.addr.id =3D=3D 0)
               ~~~~~~~~~~~~ ^
   net/mptcp/pm_netlink.c:1583:10: warning: 2nd function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           entry =3D __lookup_addr_by_id(pernet, addr.addr.id);
                   ^                           ~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1566:8: note: Calling 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, false, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1107:6: note: Assuming 'attr' is non-null
           if (!attr) {
               ^~~~~
   net/mptcp/pm_netlink.c:1107:2: note: Taking false branch
           if (!attr) {
           ^
   net/mptcp/pm_netlink.c:1115:6: note: Assuming 'err' is not equal to 0
           if (err)
               ^~~
   net/mptcp/pm_netlink.c:1115:2: note: Taking true branch
           if (err)
           ^
   net/mptcp/pm_netlink.c:1116:3: note: Returning without writing to 'entry=
->addr.id'
                   return err;
                   ^
   net/mptcp/pm_netlink.c:1566:8: note: Returning from 'mptcp_pm_parse_addr'
           ret =3D mptcp_pm_parse_addr(attr, info, false, &addr);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/pm_netlink.c:1567:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   net/mptcp/pm_netlink.c:1567:2: note: Taking false branch
           if (ret < 0)
           ^
   net/mptcp/pm_netlink.c:1571:6: note: Assuming 'msg' is non-null
           if (!msg)
               ^~~~
   net/mptcp/pm_netlink.c:1571:2: note: Taking false branch
           if (!msg)

vim +1213 net/mptcp/pm_netlink.c

875b76718f68ba Geliang Tang 2021-02-01  1201  =

01cacb00b35cb6 Paolo Abeni  2020-03-27  1202  static int mptcp_nl_cmd_add_a=
ddr(struct sk_buff *skb, struct genl_info *info)
01cacb00b35cb6 Paolo Abeni  2020-03-27  1203  {
01cacb00b35cb6 Paolo Abeni  2020-03-27  1204  	struct nlattr *attr =3D info=
->attrs[MPTCP_PM_ATTR_ADDR];
01cacb00b35cb6 Paolo Abeni  2020-03-27  1205  	struct pm_nl_pernet *pernet =
=3D genl_info_pm_nl(info);
01cacb00b35cb6 Paolo Abeni  2020-03-27  1206  	struct mptcp_pm_addr_entry a=
ddr, *entry;
01cacb00b35cb6 Paolo Abeni  2020-03-27  1207  	int ret;
01cacb00b35cb6 Paolo Abeni  2020-03-27  1208  =

01cacb00b35cb6 Paolo Abeni  2020-03-27  1209  	ret =3D mptcp_pm_parse_addr(=
attr, info, true, &addr);
01cacb00b35cb6 Paolo Abeni  2020-03-27  1210  	if (ret < 0)
01cacb00b35cb6 Paolo Abeni  2020-03-27  1211  		return ret;
01cacb00b35cb6 Paolo Abeni  2020-03-27  1212  =

019a14644e4d43 Geliang Tang 2022-01-16 @1213  	if (addr.addr.port && !(addr=
.flags & MPTCP_PM_ADDR_FLAG_SIGNAL)) {
019a14644e4d43 Geliang Tang 2022-01-16  1214  		GENL_SET_ERR_MSG(info, "fla=
gs must have signal when using port");
019a14644e4d43 Geliang Tang 2022-01-16  1215  		return -EINVAL;
019a14644e4d43 Geliang Tang 2022-01-16  1216  	}
019a14644e4d43 Geliang Tang 2022-01-16  1217  =

01cacb00b35cb6 Paolo Abeni  2020-03-27  1218  	entry =3D kmalloc(sizeof(*en=
try), GFP_KERNEL);
01cacb00b35cb6 Paolo Abeni  2020-03-27  1219  	if (!entry) {
01cacb00b35cb6 Paolo Abeni  2020-03-27  1220  		GENL_SET_ERR_MSG(info, "can=
't allocate addr");
01cacb00b35cb6 Paolo Abeni  2020-03-27  1221  		return -ENOMEM;
01cacb00b35cb6 Paolo Abeni  2020-03-27  1222  	}
01cacb00b35cb6 Paolo Abeni  2020-03-27  1223  =

01cacb00b35cb6 Paolo Abeni  2020-03-27  1224  	*entry =3D addr;
1729cf186d8a5d Geliang Tang 2021-02-01  1225  	if (entry->addr.port) {
1729cf186d8a5d Geliang Tang 2021-02-01  1226  		ret =3D mptcp_pm_nl_create_=
listen_socket(skb->sk, entry);
1729cf186d8a5d Geliang Tang 2021-02-01  1227  		if (ret) {
1729cf186d8a5d Geliang Tang 2021-02-01  1228  			GENL_SET_ERR_MSG(info, "cr=
eate listen socket error");
1729cf186d8a5d Geliang Tang 2021-02-01  1229  			kfree(entry);
1729cf186d8a5d Geliang Tang 2021-02-01  1230  			return ret;
1729cf186d8a5d Geliang Tang 2021-02-01  1231  		}
1729cf186d8a5d Geliang Tang 2021-02-01  1232  	}
01cacb00b35cb6 Paolo Abeni  2020-03-27  1233  	ret =3D mptcp_pm_nl_append_n=
ew_local_addr(pernet, entry);
01cacb00b35cb6 Paolo Abeni  2020-03-27  1234  	if (ret < 0) {
01cacb00b35cb6 Paolo Abeni  2020-03-27  1235  		GENL_SET_ERR_MSG(info, "too=
 many addresses or duplicate one");
1729cf186d8a5d Geliang Tang 2021-02-01  1236  		if (entry->lsk)
1729cf186d8a5d Geliang Tang 2021-02-01  1237  			sock_release(entry->lsk);
01cacb00b35cb6 Paolo Abeni  2020-03-27  1238  		kfree(entry);
01cacb00b35cb6 Paolo Abeni  2020-03-27  1239  		return ret;
01cacb00b35cb6 Paolo Abeni  2020-03-27  1240  	}
01cacb00b35cb6 Paolo Abeni  2020-03-27  1241  =

875b76718f68ba Geliang Tang 2021-02-01  1242  	mptcp_nl_add_subflow_or_sign=
al_addr(sock_net(skb->sk));
875b76718f68ba Geliang Tang 2021-02-01  1243  =

01cacb00b35cb6 Paolo Abeni  2020-03-27  1244  	return 0;
01cacb00b35cb6 Paolo Abeni  2020-03-27  1245  }
01cacb00b35cb6 Paolo Abeni  2020-03-27  1246  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3998427166550035586==--


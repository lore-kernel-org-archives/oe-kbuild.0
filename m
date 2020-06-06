Content-Type: multipart/mixed; boundary="===============4598702309212478331=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dsahern-linux:nexthops/active-backup 6/7] net/ipv4/nexthop.c:1687:6: warning: Identical condition 'err', second condition is always false
Date: Sat, 06 Jun 2020 22:43:32 +0800
Message-ID: <202006062228.0Y53svrW%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4598702309212478331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: David Ahern <dsahern@gmail.com>
CC: ASSOGBA Emery <assogba.emery@gmail.com>

tree:   https://github.com/dsahern/linux nexthops/active-backup
head:   ce5c8789f64b22b67d14582c0a9b5d0c75c0fefc
commit: d812063276459dee9973ef8f4789ca63869ba9ae [6/7] nexthops: Add suppor=
t for active-backup nexthop type
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> net/ipv4/nexthop.c:1687:6: warning: Identical condition 'err', second co=
ndition is always false [identicalConditionAfterEarlyExit]
    if (err)
        ^
   net/ipv4/nexthop.c:1680:6: note: first condition
    if (err)
        ^
   net/ipv4/nexthop.c:1687:6: note: second condition
    if (err)
        ^
   net/ipv4/nexthop.c:350:6: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
    err =3D nh_fill_node(skb, nh, event, info->portid, seq, nlflags);
        ^
   net/ipv4/nexthop.c:344:0: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/ipv4/nexthop.c:350:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D nh_fill_node(skb, nh, event, info->portid, seq, nlflags);
        ^
   net/ipv4/nexthop.c:1171:5: warning: Variable 'rc' is reassigned a value =
before the old one has been used. [redundantAssignment]
    rc =3D 0;
       ^
   net/ipv4/nexthop.c:1133:0: note: Variable 'rc' is reassigned a value bef=
ore the old one has been used.
    int rc =3D -EEXIST;
   ^
   net/ipv4/nexthop.c:1171:5: note: Variable 'rc' is reassigned a value bef=
ore the old one has been used.
    rc =3D 0;
       ^
   net/ipv4/nexthop.c:1544:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. 'break;' missing? [redundantAssignInSwit=
ch]
    err =3D -EINVAL;
        ^
   net/ipv4/nexthop.c:1448:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D -EINVAL;
        ^
   net/ipv4/nexthop.c:1544:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D -EINVAL;
        ^
   net/ipv4/nexthop.c:1596:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. 'break;' missing? [redundantAssignInSwit=
ch]
    err =3D 0;
        ^
   net/ipv4/nexthop.c:1544:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D -EINVAL;
        ^
   net/ipv4/nexthop.c:1596:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used. 'break;' missing?
    err =3D 0;
        ^
   net/ipv4/nexthop.c:1714:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D -ENOENT;
        ^
   net/ipv4/nexthop.c:1709:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D -ENOBUFS;
        ^
   net/ipv4/nexthop.c:1714:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D -ENOENT;
        ^
   net/ipv4/nexthop.c:1719:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D nh_fill_node(skb, nh, RTM_NEWNEXTHOP, NETLINK_CB(in_skb).portid,
        ^
   net/ipv4/nexthop.c:1714:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D -ENOENT;
        ^
   net/ipv4/nexthop.c:1719:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D nh_fill_node(skb, nh, RTM_NEWNEXTHOP, NETLINK_CB(in_skb).portid,
        ^

# https://github.com/dsahern/linux/commit/d812063276459dee9973ef8f4789ca638=
69ba9ae
git remote add dsahern-linux https://github.com/dsahern/linux
git remote update dsahern-linux
git checkout d812063276459dee9973ef8f4789ca63869ba9ae
vim +/err +1687 net/ipv4/nexthop.c

ab84be7e54fc3d David Ahern 2019-05-24  1664  =

ab84be7e54fc3d David Ahern 2019-05-24  1665  /* rtnl */
ab84be7e54fc3d David Ahern 2019-05-24  1666  static int rtm_del_nexthop(str=
uct sk_buff *skb, struct nlmsghdr *nlh,
ab84be7e54fc3d David Ahern 2019-05-24  1667  			   struct netlink_ext_ack *=
extack)
ab84be7e54fc3d David Ahern 2019-05-24  1668  {
ab84be7e54fc3d David Ahern 2019-05-24  1669  	struct net *net =3D sock_net(=
skb->sk);
ab84be7e54fc3d David Ahern 2019-05-24  1670  	struct nl_info nlinfo =3D {
ab84be7e54fc3d David Ahern 2019-05-24  1671  		.nlh =3D nlh,
ab84be7e54fc3d David Ahern 2019-05-24  1672  		.nl_net =3D net,
ab84be7e54fc3d David Ahern 2019-05-24  1673  		.portid =3D NETLINK_CB(skb).=
portid,
ab84be7e54fc3d David Ahern 2019-05-24  1674  	};
ab84be7e54fc3d David Ahern 2019-05-24  1675  	struct nexthop *nh;
ab84be7e54fc3d David Ahern 2019-05-24  1676  	int err;
ab84be7e54fc3d David Ahern 2019-05-24  1677  	u32 id;
ab84be7e54fc3d David Ahern 2019-05-24  1678  =

ab84be7e54fc3d David Ahern 2019-05-24  1679  	err =3D nh_valid_get_del_req(=
nlh, &id, extack);
ab84be7e54fc3d David Ahern 2019-05-24  1680  	if (err)
ab84be7e54fc3d David Ahern 2019-05-24  1681  		return err;
ab84be7e54fc3d David Ahern 2019-05-24  1682  =

ab84be7e54fc3d David Ahern 2019-05-24  1683  	nh =3D nexthop_find_by_id(net=
, id);
ab84be7e54fc3d David Ahern 2019-05-24  1684  	if (!nh)
ab84be7e54fc3d David Ahern 2019-05-24  1685  		return -ENOENT;
ab84be7e54fc3d David Ahern 2019-05-24  1686  =

d812063276459d David Ahern 2020-05-18 @1687  	if (err)
d812063276459d David Ahern 2020-05-18  1688  		return err;
d812063276459d David Ahern 2020-05-18  1689  =

430a049190de3c David Ahern 2019-05-24  1690  	remove_nexthop(net, nh, &nlin=
fo);
ab84be7e54fc3d David Ahern 2019-05-24  1691  =

ab84be7e54fc3d David Ahern 2019-05-24  1692  	return 0;
ab84be7e54fc3d David Ahern 2019-05-24  1693  }
ab84be7e54fc3d David Ahern 2019-05-24  1694  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4598702309212478331==--


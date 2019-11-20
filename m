Content-Type: multipart/mixed; boundary="===============5319104039996385661=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [leon-rdma:rdma-next 59/63] net/core/rtnetlink.c:1279 rtnl_fill_vfinfo() warn: check that 'node_guid' doesn't leak information (struct has a hole after 'vf')
Date: Wed, 20 Nov 2019 15:49:00 +0300
Message-ID: <20191120124900.GJ30789@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5319104039996385661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git=
 rdma-next
head:   7f9a863f2a4067a38cc6ad330b9425b3fd2dc67b
commit: a209fe95d542e8e566c74a8cbd2ec49452b9d110 [59/63] net/core: Add supp=
ort for getting VF GUIDs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/core/rtnetlink.c:1279 rtnl_fill_vfinfo() warn: check that 'node_guid' d=
oesn't leak information (struct has a hole after 'vf')
net/core/rtnetlink.c:1281 rtnl_fill_vfinfo() warn: check that 'port_guid' d=
oesn't leak information (struct has a hole after 'vf')

# https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commi=
t/?id=3Da209fe95d542e8e566c74a8cbd2ec49452b9d110
git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/le=
on/linux-rdma.git
git remote update leon-rdma
git checkout a209fe95d542e8e566c74a8cbd2ec49452b9d110
vim +1279 net/core/rtnetlink.c

b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1189  static noinline_for_s=
tack int rtnl_fill_vfinfo(struct sk_buff *skb,
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1190  					       struct ne=
t_device *dev,
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1191  					       int vfs_n=
um,
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1192  					       struct nl=
attr *vfinfo)
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1193  {
01a3d796813d63 Vlad Zolotarov       2015-03-30  1194  	struct ifla_vf_rss_q=
uery_en vf_rss_query_en;
79aab093a0b537 Moshe Shemesh        2016-09-22  1195  	struct nlattr *vf, *=
vfstats, *vfvlanlist;
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1196  	struct ifla_vf_link_=
state vf_linkstate;
79aab093a0b537 Moshe Shemesh        2016-09-22  1197  	struct ifla_vf_vlan_=
info vf_vlan_info;
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1198  	struct ifla_vf_spoof=
chk vf_spoofchk;
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1199  	struct ifla_vf_tx_ra=
te vf_tx_rate;
3b766cd832328f Eran Ben Elisha      2015-06-15  1200  	struct ifla_vf_stats=
 vf_stats;
dd461d6aa89476 Hiroshi Shimamoto    2015-08-28  1201  	struct ifla_vf_trust=
 vf_trust;
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1202  	struct ifla_vf_vlan =
vf_vlan;
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1203  	struct ifla_vf_rate =
vf_rate;
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1204  	struct ifla_vf_mac v=
f_mac;
75345f888f700c Denis Kirjanov       2019-06-17  1205  	struct ifla_vf_broad=
cast vf_broadcast;
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1206  	struct ifla_vf_info =
ivi;
a209fe95d542e8 Danit Goldberg       2019-11-06  1207  	struct ifla_vf_guid =
node_guid;
a209fe95d542e8 Danit Goldberg       2019-11-06  1208  	struct ifla_vf_guid =
port_guid;
5f8444a3fa6170 Greg Rose            2011-10-08  1209  =

0eed9cf58446b2 Mintz, Yuval         2017-06-07  1210  	memset(&ivi, 0, size=
of(ivi));
0eed9cf58446b2 Mintz, Yuval         2017-06-07  1211  =

b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1212  	/* Not all SR-IOV ca=
pable drivers support the
01a3d796813d63 Vlad Zolotarov       2015-03-30  1213  	 * spoofcheck and "R=
SS query enable" query.  Preset to
01a3d796813d63 Vlad Zolotarov       2015-03-30  1214  	 * -1 so the user sp=
ace tool can detect that the driver
01a3d796813d63 Vlad Zolotarov       2015-03-30  1215  	 * didn't report any=
thing.
5f8444a3fa6170 Greg Rose            2011-10-08  1216  	 */
5f8444a3fa6170 Greg Rose            2011-10-08  1217  	ivi.spoofchk =3D -1;
01a3d796813d63 Vlad Zolotarov       2015-03-30  1218  	ivi.rss_query_en =3D=
 -1;
dd461d6aa89476 Hiroshi Shimamoto    2015-08-28  1219  	ivi.trusted =3D -1;
1d8faf48c74b83 Rony Efraim          2013-06-13  1220  	/* The default value=
 for VF link state is "auto"
1d8faf48c74b83 Rony Efraim          2013-06-13  1221  	 * IFLA_VF_LINK_STAT=
E_AUTO which equals zero
1d8faf48c74b83 Rony Efraim          2013-06-13  1222  	 */
1d8faf48c74b83 Rony Efraim          2013-06-13  1223  	ivi.linkstate =3D 0;
79aab093a0b537 Moshe Shemesh        2016-09-22  1224  	/* VLAN Protocol by =
default is 802.1Q */
79aab093a0b537 Moshe Shemesh        2016-09-22  1225  	ivi.vlan_proto =3D h=
tons(ETH_P_8021Q);
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1226  	if (dev->netdev_ops-=
>ndo_get_vf_config(dev, vfs_num, &ivi))
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1227  		return 0;
b22b941b2c253a Hannes Frederic Sowa 2015-11-17  1228  =

775f4f05501b3e Dan Carpenter        2016-10-13  1229  	memset(&vf_vlan_info=
, 0, sizeof(vf_vlan_info));
775f4f05501b3e Dan Carpenter        2016-10-13  1230  =

5f8444a3fa6170 Greg Rose            2011-10-08  1231  	vf_mac.vf =3D
5f8444a3fa6170 Greg Rose            2011-10-08  1232  		vf_vlan.vf =3D
79aab093a0b537 Moshe Shemesh        2016-09-22  1233  		vf_vlan_info.vf =3D
ed616689a3d95e Sucheta Chakraborty  2014-05-22  1234  		vf_rate.vf =3D
5f8444a3fa6170 Greg Rose            2011-10-08  1235  		vf_tx_rate.vf =3D
1d8faf48c74b83 Rony Efraim          2013-06-13  1236  		vf_spoofchk.vf =3D
01a3d796813d63 Vlad Zolotarov       2015-03-30  1237  		vf_linkstate.vf =3D
dd461d6aa89476 Hiroshi Shimamoto    2015-08-28  1238  		vf_rss_query_en.vf =
=3D
dd461d6aa89476 Hiroshi Shimamoto    2015-08-28  1239  		vf_trust.vf =3D ivi=
.vf;
5f8444a3fa6170 Greg Rose            2011-10-08  1240  =

c02db8c6290bb9 Chris Wright         2010-05-16  1241  	memcpy(vf_mac.mac, i=
vi.mac, sizeof(ivi.mac));
75345f888f700c Denis Kirjanov       2019-06-17  1242  	memcpy(vf_broadcast.=
broadcast, dev->broadcast, dev->addr_len);
c02db8c6290bb9 Chris Wright         2010-05-16  1243  	vf_vlan.vlan =3D ivi=
.vlan;
c02db8c6290bb9 Chris Wright         2010-05-16  1244  	vf_vlan.qos =3D ivi.=
qos;
79aab093a0b537 Moshe Shemesh        2016-09-22  1245  	vf_vlan_info.vlan =
=3D ivi.vlan;
79aab093a0b537 Moshe Shemesh        2016-09-22  1246  	vf_vlan_info.qos =3D=
 ivi.qos;
79aab093a0b537 Moshe Shemesh        2016-09-22  1247  	vf_vlan_info.vlan_pr=
oto =3D ivi.vlan_proto;
ed616689a3d95e Sucheta Chakraborty  2014-05-22  1248  	vf_tx_rate.rate =3D =
ivi.max_tx_rate;
ed616689a3d95e Sucheta Chakraborty  2014-05-22  1249  	vf_rate.min_tx_rate =
=3D ivi.min_tx_rate;
ed616689a3d95e Sucheta Chakraborty  2014-05-22  1250  	vf_rate.max_tx_rate =
=3D ivi.max_tx_rate;
5f8444a3fa6170 Greg Rose            2011-10-08  1251  	vf_spoofchk.setting =
=3D ivi.spoofchk;
1d8faf48c74b83 Rony Efraim          2013-06-13  1252  	vf_linkstate.link_st=
ate =3D ivi.linkstate;
01a3d796813d63 Vlad Zolotarov       2015-03-30  1253  	vf_rss_query_en.sett=
ing =3D ivi.rss_query_en;
dd461d6aa89476 Hiroshi Shimamoto    2015-08-28  1254  	vf_trust.setting =3D=
 ivi.trusted;
ae0be8de9a53cd Michal Kubecek       2019-04-26  1255  	vf =3D nla_nest_star=
t_noflag(skb, IFLA_VF_INFO);
79aab093a0b537 Moshe Shemesh        2016-09-22  1256  	if (!vf)
79aab093a0b537 Moshe Shemesh        2016-09-22  1257  		goto nla_put_vfinfo=
_failure;
a6574349d068cb David S. Miller      2012-04-01  1258  	if (nla_put(skb, IFL=
A_VF_MAC, sizeof(vf_mac), &vf_mac) ||
75345f888f700c Denis Kirjanov       2019-06-17  1259  	    nla_put(skb, IFL=
A_VF_BROADCAST, sizeof(vf_broadcast), &vf_broadcast) ||
a6574349d068cb David S. Miller      2012-04-01  1260  	    nla_put(skb, IFL=
A_VF_VLAN, sizeof(vf_vlan), &vf_vlan) ||
ed616689a3d95e Sucheta Chakraborty  2014-05-22  1261  	    nla_put(skb, IFL=
A_VF_RATE, sizeof(vf_rate),
ed616689a3d95e Sucheta Chakraborty  2014-05-22  1262  		    &vf_rate) ||
a6574349d068cb David S. Miller      2012-04-01  1263  	    nla_put(skb, IFL=
A_VF_TX_RATE, sizeof(vf_tx_rate),
a6574349d068cb David S. Miller      2012-04-01  1264  		    &vf_tx_rate) ||
a6574349d068cb David S. Miller      2012-04-01  1265  	    nla_put(skb, IFL=
A_VF_SPOOFCHK, sizeof(vf_spoofchk),
1d8faf48c74b83 Rony Efraim          2013-06-13  1266  		    &vf_spoofchk) ||
1d8faf48c74b83 Rony Efraim          2013-06-13  1267  	    nla_put(skb, IFL=
A_VF_LINK_STATE, sizeof(vf_linkstate),
01a3d796813d63 Vlad Zolotarov       2015-03-30  1268  		    &vf_linkstate) =
||
01a3d796813d63 Vlad Zolotarov       2015-03-30  1269  	    nla_put(skb, IFL=
A_VF_RSS_QUERY_EN,
01a3d796813d63 Vlad Zolotarov       2015-03-30  1270  		    sizeof(vf_rss_q=
uery_en),
dd461d6aa89476 Hiroshi Shimamoto    2015-08-28  1271  		    &vf_rss_query_e=
n) ||
dd461d6aa89476 Hiroshi Shimamoto    2015-08-28  1272  	    nla_put(skb, IFL=
A_VF_TRUST,
dd461d6aa89476 Hiroshi Shimamoto    2015-08-28  1273  		    sizeof(vf_trust=
), &vf_trust))
79aab093a0b537 Moshe Shemesh        2016-09-22  1274  		goto nla_put_vf_fai=
lure;
a209fe95d542e8 Danit Goldberg       2019-11-06  1275  	if (dev->netdev_ops-=
>ndo_get_vf_guid &&
a209fe95d542e8 Danit Goldberg       2019-11-06  1276  	    !dev->netdev_ops=
->ndo_get_vf_guid(dev, vfs_num, &node_guid,
a209fe95d542e8 Danit Goldberg       2019-11-06  1277  					      &port_guid=
)) {
a209fe95d542e8 Danit Goldberg       2019-11-06  1278  		if (nla_put(skb, IF=
LA_VF_IB_NODE_GUID, sizeof(node_guid),
a209fe95d542e8 Danit Goldberg       2019-11-06 @1279  			    &node_guid) ||
a209fe95d542e8 Danit Goldberg       2019-11-06  1280  		    nla_put(skb, IF=
LA_VF_IB_PORT_GUID, sizeof(port_guid),
a209fe95d542e8 Danit Goldberg       2019-11-06 @1281  			    &port_guid))

These definitely seem like real bugs.  We need to

	memset(&node_guid, 0, sizeof(node_guid));
	memset(&port_guid, 0, sizeof(port_guid));

Using an initializer =3D {} is not sufficient to clear struct holes.  I
hope that we don't need to memzero_explicit() these like the very
paranoid folks say.  :(

a209fe95d542e8 Danit Goldberg       2019-11-06  1282  			goto nla_put_vf_fa=
ilure;
a209fe95d542e8 Danit Goldberg       2019-11-06  1283  	}
ae0be8de9a53cd Michal Kubecek       2019-04-26  1284  	vfvlanlist =3D nla_n=
est_start_noflag(skb, IFLA_VF_VLAN_LIST);
79aab093a0b537 Moshe Shemesh        2016-09-22  1285  	if (!vfvlanlist)
79aab093a0b537 Moshe Shemesh        2016-09-22  1286  		goto nla_put_vf_fai=
lure;
79aab093a0b537 Moshe Shemesh        2016-09-22  1287  	if (nla_put(skb, IFL=
A_VF_VLAN_INFO, sizeof(vf_vlan_info),
79aab093a0b537 Moshe Shemesh        2016-09-22  1288  		    &vf_vlan_info))=
 {
79aab093a0b537 Moshe Shemesh        2016-09-22  1289  		nla_nest_cancel(skb=
, vfvlanlist);
79aab093a0b537 Moshe Shemesh        2016-09-22  1290  		goto nla_put_vf_fai=
lure;
79aab093a0b537 Moshe Shemesh        2016-09-22  1291  	}
79aab093a0b537 Moshe Shemesh        2016-09-22  1292  	nla_nest_end(skb, vf=
vlanlist);

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5319104039996385661==--


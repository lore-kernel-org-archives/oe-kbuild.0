Content-Type: multipart/mixed; boundary="===============2064385519548326439=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5141/13159] net/bridge/br_mdb.c:553:6: warning: Variable 'err' is reassigned a value before the old one has been used. 'break; '
Date: Sun, 04 Oct 2020 21:20:38 +0800
Message-ID: <202010042126.UI9NEYn4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2064385519548326439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2172e358cd1713c5b7c31361ac465edfe55e455c
commit: 81f1983852fd1f956c0a1d465cfc6116e99e2adc [5141/13159] net: bridge: =
mdb: use mdb and port entries in notifications
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
compiler: riscv32-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +553 net/bridge/br_mdb.c

47d5b6db2afa766 Andrew Lunn         2017-11-09  503  =

81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  504  void br_mdb_notify(str=
uct net_device *dev,
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  505  		   struct net_bridge=
_mdb_entry *mp,
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  506  		   struct net_bridge=
_port_group *pg,
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  507  		   int type)
45ebcce56823d14 Elad Raz            2016-04-21  508  {
45ebcce56823d14 Elad Raz            2016-04-21  509  	struct br_mdb_complet=
e_info *complete_info;
f1fecb1d10ecc2f Elad Raz            2016-01-10  510  	struct switchdev_obj_=
port_mdb mdb =3D {
f1fecb1d10ecc2f Elad Raz            2016-01-10  511  		.obj =3D {
f1fecb1d10ecc2f Elad Raz            2016-01-10  512  			.id =3D SWITCHDEV_O=
BJ_ID_PORT_MDB,
f1fecb1d10ecc2f Elad Raz            2016-01-10  513  			.flags =3D SWITCHDE=
V_F_DEFER,
f1fecb1d10ecc2f Elad Raz            2016-01-10  514  		},
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  515  		.vid =3D mp->addr.vi=
d,
f1fecb1d10ecc2f Elad Raz            2016-01-10  516  	};
37a393bc4932d7b Cong Wang           2012-12-11  517  	struct net *net =3D d=
ev_net(dev);
37a393bc4932d7b Cong Wang           2012-12-11  518  	struct sk_buff *skb;
37a393bc4932d7b Cong Wang           2012-12-11  519  	int err =3D -ENOBUFS;
37a393bc4932d7b Cong Wang           2012-12-11  520  =

81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  521  	if (pg) {
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  522  		if (mp->addr.proto =
=3D=3D htons(ETH_P_IP))
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  523  			ip_eth_mc_map(mp->a=
ddr.u.ip4, mdb.addr);
f1fecb1d10ecc2f Elad Raz            2016-01-10  524  #if IS_ENABLED(CONFIG_=
IPV6)
f1fecb1d10ecc2f Elad Raz            2016-01-10  525  		else
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  526  			ipv6_eth_mc_map(&mp=
->addr.u.ip6, mdb.addr);
f1fecb1d10ecc2f Elad Raz            2016-01-10  527  #endif
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  528  		mdb.obj.orig_dev =3D=
 pg->port->dev;
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  529  		switch (type) {
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  530  		case RTM_NEWMDB:
45ebcce56823d14 Elad Raz            2016-04-21  531  			complete_info =3D k=
malloc(sizeof(*complete_info), GFP_ATOMIC);
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  532  			if (!complete_info)
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  533  				break;
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  534  			complete_info->port=
 =3D pg->port;
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  535  			complete_info->ip =
=3D mp->addr;
45ebcce56823d14 Elad Raz            2016-04-21  536  			mdb.obj.complete_pr=
iv =3D complete_info;
45ebcce56823d14 Elad Raz            2016-04-21  537  			mdb.obj.complete =
=3D br_mdb_complete;
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  538  			if (switchdev_port_=
obj_add(pg->port->dev, &mdb.obj, NULL))
1bfb15967395764 Eduardo Valentin    2017-07-11  539  				kfree(complete_inf=
o);
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  540  			break;
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  541  		case RTM_DELMDB:
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  542  			switchdev_port_obj_=
del(pg->port->dev, &mdb.obj);
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  543  			break;
45ebcce56823d14 Elad Raz            2016-04-21  544  		}
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  545  	} else {
81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  546  		br_mdb_switchdev_hos=
t(dev, mp, type);
9e8430f8d60d985 Elad Raz            2016-02-03  547  	}
f1fecb1d10ecc2f Elad Raz            2016-01-10  548  =

81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07  549  	skb =3D nlmsg_new(rtn=
l_mdb_nlmsg_size(pg), GFP_ATOMIC);
37a393bc4932d7b Cong Wang           2012-12-11  550  	if (!skb)
37a393bc4932d7b Cong Wang           2012-12-11  551  		goto errout;
37a393bc4932d7b Cong Wang           2012-12-11  552  =

81f1983852fd1f9 Nikolay Aleksandrov 2020-09-07 @553  	err =3D nlmsg_populat=
e_mdb_fill(skb, dev, mp, pg, type);
37a393bc4932d7b Cong Wang           2012-12-11  554  	if (err < 0) {
37a393bc4932d7b Cong Wang           2012-12-11  555  		kfree_skb(skb);
37a393bc4932d7b Cong Wang           2012-12-11  556  		goto errout;
37a393bc4932d7b Cong Wang           2012-12-11  557  	}
37a393bc4932d7b Cong Wang           2012-12-11  558  =

37a393bc4932d7b Cong Wang           2012-12-11  559  	rtnl_notify(skb, net,=
 0, RTNLGRP_MDB, NULL, GFP_ATOMIC);
37a393bc4932d7b Cong Wang           2012-12-11  560  	return;
37a393bc4932d7b Cong Wang           2012-12-11  561  errout:
37a393bc4932d7b Cong Wang           2012-12-11  562  	rtnl_set_sk_err(net, =
RTNLGRP_MDB, err);
37a393bc4932d7b Cong Wang           2012-12-11  563  }
37a393bc4932d7b Cong Wang           2012-12-11  564  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2064385519548326439==--


Content-Type: multipart/mixed; boundary="===============5918537966175363568=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [saeed:net-next-mlx4 60/89] net/hsr/hsr_framereg.c:607 hsr_get_next_node() warn: ignoring unreachable code.
Date: Wed, 09 Feb 2022 08:31:58 +0800
Message-ID: <202202090836.7FkbjQK4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5918537966175363568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Juhee Kang <claudiajkang@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/saeed/linux.git net=
-next-mlx4
head:   c3e676b98326a419f30dd5d956c68fc33323f4fd
commit: 4acc45db711586dadb98e681ccb93f29372907a2 [60/89] net: hsr: use hlis=
t_head instead of list_head for mac addresses
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001-20220207 (https://download.01.org/0day-ci/ar=
chive/20220209/202202090836.7FkbjQK4-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/hsr/hsr_framereg.c:607 hsr_get_next_node() warn: ignoring unreachable c=
ode.

vim +607 net/hsr/hsr_framereg.c

f421436a591d34 Arvid Brodin     2013-10-30  590  =

70ebe4a47185db Arvid Brodin     2014-07-04  591  void *hsr_get_next_node(st=
ruct hsr_priv *hsr, void *_pos,
f421436a591d34 Arvid Brodin     2013-10-30  592  			unsigned char addr[ETH_=
ALEN])
f421436a591d34 Arvid Brodin     2013-10-30  593  {
70ebe4a47185db Arvid Brodin     2014-07-04  594  	struct hsr_node *node;
4acc45db711586 Juhee Kang       2022-02-05  595  	u32 hash;
4acc45db711586 Juhee Kang       2022-02-05  596  =

4acc45db711586 Juhee Kang       2022-02-05  597  	hash =3D hsr_mac_hash(hsr=
, addr);
f421436a591d34 Arvid Brodin     2013-10-30  598  =

f421436a591d34 Arvid Brodin     2013-10-30  599  	if (!_pos) {
4acc45db711586 Juhee Kang       2022-02-05  600  		node =3D hsr_node_get_fi=
rst(&hsr->node_db[hash]);
f421436a591d34 Arvid Brodin     2013-10-30  601  		if (node)
b1b4aa91408028 Murali Karicheri 2019-04-05  602  			ether_addr_copy(addr, n=
ode->macaddress_A);
f421436a591d34 Arvid Brodin     2013-10-30  603  		return node;
f421436a591d34 Arvid Brodin     2013-10-30  604  	}
f421436a591d34 Arvid Brodin     2013-10-30  605  =

f421436a591d34 Arvid Brodin     2013-10-30  606  	node =3D _pos;
4acc45db711586 Juhee Kang       2022-02-05 @607  	hlist_for_each_entry_cont=
inue_rcu(node, mac_list) {
b1b4aa91408028 Murali Karicheri 2019-04-05  608  		ether_addr_copy(addr, no=
de->macaddress_A);
f421436a591d34 Arvid Brodin     2013-10-30  609  		return node;
f421436a591d34 Arvid Brodin     2013-10-30  610  	}
f421436a591d34 Arvid Brodin     2013-10-30  611  =

f421436a591d34 Arvid Brodin     2013-10-30  612  	return NULL;
f421436a591d34 Arvid Brodin     2013-10-30  613  }
f421436a591d34 Arvid Brodin     2013-10-30  614  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5918537966175363568==--


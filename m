Content-Type: multipart/mixed; boundary="===============6205781576925333944=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next] net: hsr: use hlist_head instead of list_head for mac addresses
Date: Mon, 31 Jan 2022 22:59:55 +0800
Message-ID: <202201312206.zqLlgLLt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6205781576925333944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220131090307.2654-1-claudiajkang@gmail.com>
References: <20220131090307.2654-1-claudiajkang@gmail.com>
TO: Juhee Kang <claudiajkang@gmail.com>
TO: davem(a)davemloft.net
TO: kuba(a)kernel.org
TO: netdev(a)vger.kernel.org
TO: arvid.brodin(a)alten.se

Hi Juhee,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Juhee-Kang/net-hsr-use-hli=
st_head-instead-of-list_head-for-mac-addresses/20220131-170414
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
ff58831fa02deb42fd731f830d8d9ec545573c7c
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: nios2-randconfig-m031-20220131 (https://download.01.org/0day-ci/arc=
hive/20220131/202201312206.zqLlgLLt-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/hsr/hsr_framereg.c:603 hsr_get_next_node() warn: ignoring unreachable c=
ode.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +603 net/hsr/hsr_framereg.c

f421436a591d34 Arvid Brodin     2013-10-30  584  =

70ebe4a47185db Arvid Brodin     2014-07-04  585  void *hsr_get_next_node(st=
ruct hsr_priv *hsr, void *_pos,
f421436a591d34 Arvid Brodin     2013-10-30  586  			unsigned char addr[ETH_=
ALEN])
f421436a591d34 Arvid Brodin     2013-10-30  587  {
70ebe4a47185db Arvid Brodin     2014-07-04  588  	struct hsr_node *node;
4610359df4a1f5 Juhee Kang       2022-01-31  589  	u32 hash;
4610359df4a1f5 Juhee Kang       2022-01-31  590  =

4610359df4a1f5 Juhee Kang       2022-01-31  591  	hash =3D hsr_mac_hash(hsr=
, addr);
f421436a591d34 Arvid Brodin     2013-10-30  592  =

f421436a591d34 Arvid Brodin     2013-10-30  593  	if (!_pos) {
4610359df4a1f5 Juhee Kang       2022-01-31  594  		node =3D hlist_empty(&hs=
r->node_db[hash]) ? NULL :
4610359df4a1f5 Juhee Kang       2022-01-31  595  			hlist_entry(hlist_first=
_rcu(&hsr->node_db[hash]),
70ebe4a47185db Arvid Brodin     2014-07-04  596  					      struct hsr_node=
, mac_list);
f421436a591d34 Arvid Brodin     2013-10-30  597  		if (node)
b1b4aa91408028 Murali Karicheri 2019-04-05  598  			ether_addr_copy(addr, n=
ode->macaddress_A);
f421436a591d34 Arvid Brodin     2013-10-30  599  		return node;
f421436a591d34 Arvid Brodin     2013-10-30  600  	}
f421436a591d34 Arvid Brodin     2013-10-30  601  =

f421436a591d34 Arvid Brodin     2013-10-30  602  	node =3D _pos;
4610359df4a1f5 Juhee Kang       2022-01-31 @603  	hlist_for_each_entry_cont=
inue_rcu(node, mac_list) {
b1b4aa91408028 Murali Karicheri 2019-04-05  604  		ether_addr_copy(addr, no=
de->macaddress_A);
f421436a591d34 Arvid Brodin     2013-10-30  605  		return node;
f421436a591d34 Arvid Brodin     2013-10-30  606  	}
f421436a591d34 Arvid Brodin     2013-10-30  607  =

f421436a591d34 Arvid Brodin     2013-10-30  608  	return NULL;
f421436a591d34 Arvid Brodin     2013-10-30  609  }
f421436a591d34 Arvid Brodin     2013-10-30  610  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6205781576925333944==--


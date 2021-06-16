Content-Type: multipart/mixed; boundary="===============2177608880301096947=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/marvell/prestera/prestera_rxtx.c:816:26: warning: Uninitialized variable: dsa [uninitvar]
Date: Wed, 16 Jun 2021 10:35:23 +0800
Message-ID: <202106161021.QCFgT8hA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2177608880301096947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vadym Kochan <vadym.kochan@plvision.eu>
CC: Andrii Savka <andrii.savka@plvision.eu>
CC: Oleksandr Mazur <oleksandr.mazur@plvision.eu>
CC: Serhiy Boiko <serhiy.boiko@plvision.eu>
CC: Serhiy Pshyk <serhiy.pshyk@plvision.eu>
CC: Taras Chornyi <taras.chornyi@plvision.eu>
CC: Volodymyr Mytnyk <volodymyr.mytnyk@plvision.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   94f0b2d4a1d0c52035aef425da5e022bd2cb1c71
commit: 501ef3066c89d7f9045315e1be58749cf9e6814d net: marvell: prestera: Ad=
d driver for Prestera family ASIC devices
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/marvell/prestera/prestera_rxtx.c:816:26: warning: U=
ninitialized variable: dsa [uninitvar]
    if (prestera_dsa_build(&dsa, skb->data + 2 * ETH_ALEN) !=3D 0)
                            ^

vim +816 drivers/net/ethernet/marvell/prestera/prestera_rxtx.c

501ef3066c89d7 Vadym Kochan 2020-09-16  802  =

501ef3066c89d7 Vadym Kochan 2020-09-16  803  netdev_tx_t prestera_rxtx_xmit=
(struct prestera_port *port, struct sk_buff *skb)
501ef3066c89d7 Vadym Kochan 2020-09-16  804  {
501ef3066c89d7 Vadym Kochan 2020-09-16  805  	struct prestera_dsa dsa;
501ef3066c89d7 Vadym Kochan 2020-09-16  806  =

501ef3066c89d7 Vadym Kochan 2020-09-16  807  	dsa.hw_dev_num =3D port->dev_=
id;
501ef3066c89d7 Vadym Kochan 2020-09-16  808  	dsa.port_num =3D port->hw_id;
501ef3066c89d7 Vadym Kochan 2020-09-16  809  =

501ef3066c89d7 Vadym Kochan 2020-09-16  810  	if (skb_cow_head(skb, PRESTER=
A_DSA_HLEN) < 0)
501ef3066c89d7 Vadym Kochan 2020-09-16  811  		return NET_XMIT_DROP;
501ef3066c89d7 Vadym Kochan 2020-09-16  812  =

501ef3066c89d7 Vadym Kochan 2020-09-16  813  	skb_push(skb, PRESTERA_DSA_HL=
EN);
501ef3066c89d7 Vadym Kochan 2020-09-16  814  	memmove(skb->data, skb->data =
+ PRESTERA_DSA_HLEN, 2 * ETH_ALEN);
501ef3066c89d7 Vadym Kochan 2020-09-16  815  =

501ef3066c89d7 Vadym Kochan 2020-09-16 @816  	if (prestera_dsa_build(&dsa, =
skb->data + 2 * ETH_ALEN) !=3D 0)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2177608880301096947==--


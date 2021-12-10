Content-Type: multipart/mixed; boundary="===============0477895956542265016=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/ocelot/felix.c:1329 felix_check_xtr_pkt() error: uninitialized symbol 'err'.
Date: Sat, 11 Dec 2021 03:45:42 +0800
Message-ID: <202112110349.5CNAwmu6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0477895956542265016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c741e49150dbb0c0aebe234389f4aa8b47958fa8
commit: 0a6f17c6ae2116809a7b7eb6dd3eab59ef5460ef net: dsa: tag_ocelot_8021q=
: add support for PTP timestamping
date:   10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-m001-20211210 (https://download.01.org/0day-ci/ar=
chive/20211211/202112110349.5CNAwmu6-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/dsa/ocelot/felix.c:1329 felix_check_xtr_pkt() error: uninitiali=
zed symbol 'err'.

vim +/err +1329 drivers/net/dsa/ocelot/felix.c

c0bcf537667cf8 Yangbo Lu       2019-11-20  1285  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1286  static bool felix_check_xt=
r_pkt(struct ocelot *ocelot, unsigned int ptp_type)
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1287  {
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1288  	struct felix *felix =3D o=
celot_to_felix(ocelot);
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1289  	int err, grp =3D 0;
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1290  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1291  	if (felix->tag_proto !=3D=
 DSA_TAG_PROTO_OCELOT_8021Q)
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1292  		return false;
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1293  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1294  	if (!felix->info->quirk_n=
o_xtr_irq)
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1295  		return false;
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1296  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1297  	if (ptp_type =3D=3D PTP_C=
LASS_NONE)
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1298  		return false;
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1299  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1300  	while (ocelot_read(ocelot=
, QS_XTR_DATA_PRESENT) & BIT(grp)) {
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1301  		struct sk_buff *skb;
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1302  		unsigned int type;
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1303  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1304  		err =3D ocelot_xtr_poll_=
frame(ocelot, grp, &skb);
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1305  		if (err)
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1306  			goto out;
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1307  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1308  		/* We trap to the CPU po=
rt module all PTP frames, but
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1309  		 * felix_rxtstamp() only=
 gets called for event frames.
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1310  		 * So we need to avoid s=
ending duplicate general
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1311  		 * message frames by run=
ning a second BPF classifier
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1312  		 * here and dropping tho=
se.
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1313  		 */
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1314  		__skb_push(skb, ETH_HLEN=
);
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1315  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1316  		type =3D ptp_classify_ra=
w(skb);
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1317  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1318  		__skb_pull(skb, ETH_HLEN=
);
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1319  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1320  		if (type =3D=3D PTP_CLAS=
S_NONE) {
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1321  			kfree_skb(skb);
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1322  			continue;
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1323  		}
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1324  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1325  		netif_rx(skb);
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1326  	}
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1327  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1328  out:
0a6f17c6ae2116 Vladimir Oltean 2021-02-14 @1329  	if (err < 0)
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1330  		ocelot_drain_cpu_queue(o=
celot, 0);
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1331  =

0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1332  	return true;
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1333  }
0a6f17c6ae2116 Vladimir Oltean 2021-02-14  1334  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0477895956542265016==--


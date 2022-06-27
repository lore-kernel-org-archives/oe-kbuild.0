Content-Type: multipart/mixed; boundary="===============6235728424919362275=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/dsa/tag_sja1105.c:432 sja1105_rcv() error: uninitialized symbol 'vid'.
Date: Mon, 27 Jun 2022 03:04:31 +0000
Message-ID: <202206252029.6pIntoLK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6235728424919362275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8c23f235a6a8ae43abea215812eb9d8cf4dd165e
commit: 04a1758348a87eb73b8a4554d0c227831e2bb33e net: dsa: tag_sja1105: fix=
 control packets on SJA1110 being received on an imprecise port
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: nios2-randconfig-m031-20220624
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/dsa/tag_sja1105.c:432 sja1105_rcv() error: uninitialized symbol 'vid'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.
net/dsa/tag_sja1105.c:564 sja1110_rcv() error: uninitialized symbol 'vid'.

vim +/vid +432 net/dsa/tag_sja1105.c

884be12f85666c Vladimir Oltean 2021-07-26  392  =

227d07a07ef126 Vladimir Oltean 2019-05-05  393  static struct sk_buff *sja1=
105_rcv(struct sk_buff *skb,
227d07a07ef126 Vladimir Oltean 2019-05-05  394  				   struct net_device *n=
etdev,
227d07a07ef126 Vladimir Oltean 2019-05-05  395  				   struct packet_type *=
pt)
227d07a07ef126 Vladimir Oltean 2019-05-05  396  {
884be12f85666c Vladimir Oltean 2021-07-26  397  	int source_port =3D -1, sw=
itch_id =3D -1;
e53e18a6fe4d3a Vladimir Oltean 2019-06-08  398  	struct sja1105_meta meta =
=3D {0};
e80f40cbe4dd51 Vladimir Oltean 2020-03-24  399  	struct ethhdr *hdr;
42824463d38d27 Vladimir Oltean 2019-06-08  400  	bool is_link_local;
e53e18a6fe4d3a Vladimir Oltean 2019-06-08  401  	bool is_meta;
884be12f85666c Vladimir Oltean 2021-07-26  402  	u16 vid;
227d07a07ef126 Vladimir Oltean 2019-05-05  403  =

e80f40cbe4dd51 Vladimir Oltean 2020-03-24  404  	hdr =3D eth_hdr(skb);
42824463d38d27 Vladimir Oltean 2019-06-08  405  	is_link_local =3D sja1105_=
is_link_local(skb);
e53e18a6fe4d3a Vladimir Oltean 2019-06-08  406  	is_meta =3D sja1105_is_met=
a_frame(skb);
227d07a07ef126 Vladimir Oltean 2019-05-05  407  =

227d07a07ef126 Vladimir Oltean 2019-05-05  408  	skb->offload_fwd_mark =3D =
1;
227d07a07ef126 Vladimir Oltean 2019-05-05  409  =

233697b3b3f60b Vladimir Oltean 2021-06-11  410  	if (sja1105_skb_has_tag_80=
21q(skb)) {
42824463d38d27 Vladimir Oltean 2019-06-08  411  		/* Normal traffic path. */
04a1758348a87e Vladimir Oltean 2021-07-29  412  		sja1105_vlan_rcv(skb, &so=
urce_port, &switch_id, &vid);
42824463d38d27 Vladimir Oltean 2019-06-08  413  	} else if (is_link_local) {
227d07a07ef126 Vladimir Oltean 2019-05-05  414  		/* Management traffic pat=
h. Switch embeds the switch ID and
227d07a07ef126 Vladimir Oltean 2019-05-05  415  		 * port ID into bytes of =
the destination MAC, courtesy of
227d07a07ef126 Vladimir Oltean 2019-05-05  416  		 * the incl_srcpt options.
227d07a07ef126 Vladimir Oltean 2019-05-05  417  		 */
227d07a07ef126 Vladimir Oltean 2019-05-05  418  		source_port =3D hdr->h_de=
st[3];
227d07a07ef126 Vladimir Oltean 2019-05-05  419  		switch_id =3D hdr->h_dest=
[4];
227d07a07ef126 Vladimir Oltean 2019-05-05  420  		/* Clear the DMAC bytes t=
hat were mangled by the switch */
227d07a07ef126 Vladimir Oltean 2019-05-05  421  		hdr->h_dest[3] =3D 0;
227d07a07ef126 Vladimir Oltean 2019-05-05  422  		hdr->h_dest[4] =3D 0;
e53e18a6fe4d3a Vladimir Oltean 2019-06-08  423  	} else if (is_meta) {
e53e18a6fe4d3a Vladimir Oltean 2019-06-08  424  		sja1105_meta_unpack(skb, =
&meta);
e53e18a6fe4d3a Vladimir Oltean 2019-06-08  425  		source_port =3D meta.sour=
ce_port;
e53e18a6fe4d3a Vladimir Oltean 2019-06-08  426  		switch_id =3D meta.switch=
_id;
227d07a07ef126 Vladimir Oltean 2019-05-05  427  	} else {
42824463d38d27 Vladimir Oltean 2019-06-08  428  		return NULL;
227d07a07ef126 Vladimir Oltean 2019-05-05  429  	}
227d07a07ef126 Vladimir Oltean 2019-05-05  430  =

04a1758348a87e Vladimir Oltean 2021-07-29  431  	if (source_port =3D=3D -1 =
|| switch_id =3D=3D -1)
884be12f85666c Vladimir Oltean 2021-07-26 @432  		skb->dev =3D dsa_find_des=
ignated_bridge_port_by_vid(netdev, vid);
884be12f85666c Vladimir Oltean 2021-07-26  433  	else
227d07a07ef126 Vladimir Oltean 2019-05-05  434  		skb->dev =3D dsa_master_f=
ind_slave(netdev, switch_id, source_port);
227d07a07ef126 Vladimir Oltean 2019-05-05  435  	if (!skb->dev) {
227d07a07ef126 Vladimir Oltean 2019-05-05  436  		netdev_warn(netdev, "Coul=
dn't decode source port\n");
227d07a07ef126 Vladimir Oltean 2019-05-05  437  		return NULL;
227d07a07ef126 Vladimir Oltean 2019-05-05  438  	}
227d07a07ef126 Vladimir Oltean 2019-05-05  439  =

f3097be21bf17a Vladimir Oltean 2019-06-08  440  	return sja1105_rcv_meta_st=
ate_machine(skb, &meta, is_link_local,
f3097be21bf17a Vladimir Oltean 2019-06-08  441  					      is_meta);
227d07a07ef126 Vladimir Oltean 2019-05-05  442  }
227d07a07ef126 Vladimir Oltean 2019-05-05  443  =


:::::: The code at line 432 was first introduced by commit
:::::: 884be12f85666c6e9ff1cf3ead06a7371f6863dc net: dsa: sja1105: add supp=
ort for imprecise RX

:::::: TO: Vladimir Oltean <vladimir.oltean@nxp.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6235728424919362275==--


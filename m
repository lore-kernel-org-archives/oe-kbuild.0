Content-Type: multipart/mixed; boundary="===============7131164003248874442=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/freescale/enetc/enetc.c:356:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Tue, 18 Jan 2022 02:54:20 +0800
Message-ID: <202201180108.LLHw7JDU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7131164003248874442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ioana Ciornei <ioana.ciornei@nxp.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>
CC: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0c947b893d69231a9add855939da7c66237ab44f
commit: fb8629e2cbfce2b695521d6d33d029117ceda007 net: enetc: add support fo=
r software TSO
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/freescale/enetc/enetc.c:356:3: warning: Assignment =
of function parameter has no effect outside the function. Did you forget de=
referencing it? [uselessAssignmentPtrArg]
     tx_swbd =3D &tx_ring->tx_swbd[*i];
     ^

vim +356 drivers/net/ethernet/freescale/enetc/enetc.c

d4fd0404c1c95b Claudiu Manoil 2019-01-22  317  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  318  static void enetc_map_tx_tso=
_hdr(struct enetc_bdr *tx_ring, struct sk_buff *skb,
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  319  				 struct enetc_tx_swbd *t=
x_swbd,
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  320  				 union enetc_tx_bd *txbd=
, int *i, int hdr_len,
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  321  				 int data_len)
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  322  {
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  323  	union enetc_tx_bd txbd_tmp;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  324  	u8 flags =3D 0, e_flags =3D=
 0;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  325  	dma_addr_t addr;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  326  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  327  	enetc_clear_tx_bd(&txbd_tmp=
);
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  328  	addr =3D tx_ring->tso_heade=
rs_dma + *i * TSO_HEADER_SIZE;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  329  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  330  	if (skb_vlan_tag_present(sk=
b))
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  331  		flags |=3D ENETC_TXBD_FLAG=
S_EX;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  332  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  333  	txbd_tmp.addr =3D cpu_to_le=
64(addr);
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  334  	txbd_tmp.buf_len =3D cpu_to=
_le16(hdr_len);
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  335  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  336  	/* first BD needs frm_len a=
nd offload flags set */
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  337  	txbd_tmp.frm_len =3D cpu_to=
_le16(hdr_len + data_len);
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  338  	txbd_tmp.flags =3D flags;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  339  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  340  	/* For the TSO header we do=
 not set the dma address since we do not
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  341  	 * want it unmapped when we=
 do cleanup. We still set len so that we
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  342  	 * count the bytes sent.
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  343  	 */
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  344  	tx_swbd->len =3D hdr_len;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  345  	tx_swbd->do_twostep_tstamp =
=3D false;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  346  	tx_swbd->check_wb =3D false;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  347  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  348  	/* Actually write the heade=
r in the BD */
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  349  	*txbd =3D txbd_tmp;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  350  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  351  	/* Add extension BD for VLA=
N */
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  352  	if (flags & ENETC_TXBD_FLAG=
S_EX) {
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  353  		/* Get the next BD */
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  354  		enetc_bdr_idx_inc(tx_ring,=
 i);
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  355  		txbd =3D ENETC_TXBD(*tx_ri=
ng, *i);
fb8629e2cbfce2 Ioana Ciornei  2021-10-07 @356  		tx_swbd =3D &tx_ring->tx_s=
wbd[*i];
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  357  		prefetchw(txbd);
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  358  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  359  		/* Setup the VLAN fields */
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  360  		enetc_clear_tx_bd(&txbd_tm=
p);
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  361  		txbd_tmp.ext.vid =3D cpu_t=
o_le16(skb_vlan_tag_get(skb));
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  362  		txbd_tmp.ext.tpid =3D 0; /=
* < C-TAG */
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  363  		e_flags |=3D ENETC_TXBD_E_=
FLAGS_VLAN_INS;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  364  =

fb8629e2cbfce2 Ioana Ciornei  2021-10-07  365  		/* Write the BD */
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  366  		txbd_tmp.ext.e_flags =3D e=
_flags;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  367  		*txbd =3D txbd_tmp;
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  368  	}
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  369  }
fb8629e2cbfce2 Ioana Ciornei  2021-10-07  370  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7131164003248874442==--


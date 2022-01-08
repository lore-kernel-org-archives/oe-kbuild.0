Content-Type: multipart/mixed; boundary="===============3494493343013674589=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/freescale/enetc/enetc.c:356:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Sat, 08 Jan 2022 08:41:09 +0800
Message-ID: <202201080629.P60mEKLG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3494493343013674589==
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
head:   ddec8ed2d4905d0967ce2ec432e440e582aa52c6
commit: fb8629e2cbfce2b695521d6d33d029117ceda007 net: enetc: add support fo=
r software TSO
date:   3 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/freescale/fec_main.c:935:34: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
     writel(rxq->bd.dma, fep->hwp + FEC_R_DES_START(i));
                                    ^
   drivers/net/ethernet/freescale/fec_main.c:936:38: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
     writel(PKT_MAXBUF_SIZE, fep->hwp + FEC_R_BUFF_SIZE(i));
                                        ^
   drivers/net/ethernet/freescale/fec_main.c:941:22: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
             fep->hwp + FEC_RCMR(i));
                        ^
   drivers/net/ethernet/freescale/fec_main.c:946:34: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
     writel(txq->bd.dma, fep->hwp + FEC_X_DES_START(i));
                                    ^
   drivers/net/ethernet/freescale/fec_main.c:950:26: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
      writel(DMA_CLASS_EN | IDLE_SLOPE(i),
                            ^
   drivers/net/ethernet/freescale/fec_main.c:951:22: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
             fep->hwp + FEC_DMA_CFG(i));
                        ^
>> drivers/net/ethernet/freescale/fec_main.c:3312:18: warning: Shifting sig=
ned 32-bit value by 31 bits is undefined behaviour. See condition at line 3=
309. [shiftTooManyBitsSigned]
      hash_low |=3D 1 << hash;
                    ^
   drivers/net/ethernet/freescale/fec_main.c:3309:12: note: Assuming that c=
ondition 'hash>31' is not redundant
     if (hash > 31)
              ^
   drivers/net/ethernet/freescale/fec_main.c:3312:18: note: Shift
      hash_low |=3D 1 << hash;
                    ^
>> drivers/net/ethernet/freescale/gianfar_ethtool.c:118:30: warning: Divisi=
on by result of sizeof(). memcpy() expects a size in bytes, did you intend =
to multiply instead? [sizeofDivisionMemfunc]
     memcpy(buf, stat_gstrings, GFAR_STATS_LEN * ETH_GSTRING_LEN);
                                ^
   drivers/net/ethernet/freescale/gianfar_ethtool.c:121:10: warning: Divisi=
on by result of sizeof(). memcpy() expects a size in bytes, did you intend =
to multiply instead? [sizeofDivisionMemfunc]
            GFAR_EXTRA_STATS_LEN * ETH_GSTRING_LEN);
            ^
--
>> drivers/net/ethernet/intel/e1000/e1000_main.c:284:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(IMC, ~0);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:285:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:297:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(IMS, IMS_ENABLE_MASK);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:298:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:334:14: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     u32 manc =3D er32(MANC);
                ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:339:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(MANC, manc);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:348:14: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     u32 manc =3D er32(MANC);
                ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:353:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(MANC, manc);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:401:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(ICS, E1000_ICS_LSC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:454:8: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
      if (er32(MANC) & E1000_MANC_SMBUS_EN)
          ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:496:9: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    rctl =3D er32(RCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:497:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(RCTL, rctl & ~E1000_RCTL_EN);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:503:9: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    tctl =3D er32(TCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:505:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(TCTL, tctl);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:507:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:603:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(PBA, pba);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:612:9: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     pba =3D er32(PBA);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:655:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(PBA, pba);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:678:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(WUC, 0);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:688:14: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     u32 ctrl =3D er32(CTRL);
                ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:694:3: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
     ew32(CTRL, ctrl);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:698:2: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ew32(VET, ETHERNET_IEEE_VLAN_TYPE);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1137:7: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     if (er32(STATUS) & E1000_STATUS_FUNC_1) {
         ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1164:7: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     if (er32(STATUS) & E1000_STATUS_FUNC_1)
         ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1405:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(ICS, E1000_ICS_LSC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1641:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(TIPG, tipg);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1647:3: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     ew32(TADV, adapter->tx_abs_int_delay);
     ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1651:9: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    tctl =3D er32(TCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1677:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(TCTL, tctl);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1788:9: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    rctl =3D er32(RCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1843:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(RCTL, rctl);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1871:9: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    rctl =3D er32(RCTL);
           ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1872:2: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
    ew32(RCTL, rctl & ~E1000_RCTL_EN);
    ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:1878:3: warning: Same valu=
e in both branches of ternary operator. [duplicateValueTernary]
     ew32(RADV, adapter->rx_abs_int_delay);
--
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
--===============3494493343013674589==--


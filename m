Content-Type: multipart/mixed; boundary="===============1628015690353399613=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c:424 ixgbe_fcoe_ddp() warn: potential spectre issue 'fcoe->ddp' [r] (local cap)
Date: Fri, 07 Jan 2022 06:53:09 +0800
Message-ID: <202201070658.LRl1HssZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1628015690353399613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   75acfdb6fd922598a408a0d864486aeb167c1a97
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   8 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-m021-20220105 (https://download.01.org/0day-ci/arch=
ive/20220107/202201070658.LRl1HssZ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c:424 ixgbe_fcoe_ddp() warn: po=
tential spectre issue 'fcoe->ddp' [r] (local cap)

vim +424 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c

68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  370  =

d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  371  /**
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  372   * ixgbe_fcoe_ddp - check ddp status and mark it done
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  373   * @adapter: ixgbe adapter
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  374   * @rx_desc: advanced rx descriptor
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  375   * @skb: the skb holding the received data
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  376   *
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  377   * This checks ddp status.
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  378   *
3d8fd385677292 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-06-08  379   * Returns : < 0 indicates an error or not a FCiE ddp, 0=
 indicates
3d8fd385677292 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-06-08  380   * not passing the skb to ULD, > 0 indicates is the leng=
th of data
3d8fd385677292 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-06-08  381   * being ddped.
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  382   */
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  383  int ixgbe_fcoe_ddp(struct ixgbe_adapter *adapter,
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  384  		   union ixgbe_adv_rx_desc *rx_desc,
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  385  		   struct sk_buff *skb)
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  386  {
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  387  	int rc =3D -EINVAL;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  388  	struct ixgbe_fcoe *fcoe;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  389  	struct ixgbe_fcoe_ddp *ddp;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  390  	struct fc_frame_header *fh;
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  391  	struct fcoe_crc_eof *crc;
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  392  	__le32 fcerr =3D ixgbe_test_staterr(rx_desc, IXGBE_RXDA=
DV_ERR_FCERR);
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  393  	__le32 ddp_err;
ea412015a2e72f drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Vasu Dev      =
  2015-04-09  394  	int ddp_max;
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  395  	u32 fctl;
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  396  	u16 xid;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  397  =

f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  398  	if (fcerr =3D=3D cpu_to_le32(IXGBE_FCERR_BADCRC))
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  399  		skb->ip_summed =3D CHECKSUM_NONE;
bc8acf2c8c3e43 drivers/net/ixgbe/ixgbe_fcoe.c                Eric Dumazet  =
  2010-09-02  400  	else
bc8acf2c8c3e43 drivers/net/ixgbe/ixgbe_fcoe.c                Eric Dumazet  =
  2010-09-02  401  		skb->ip_summed =3D CHECKSUM_UNNECESSARY;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  402  =

be5d507d9af23c drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2010-05-18  403  	if (eth_hdr(skb)->h_proto =3D=3D htons(ETH_P_8021Q))
be5d507d9af23c drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2010-05-18  404  		fh =3D (struct fc_frame_header *)(skb->data +
be5d507d9af23c drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2010-05-18  405  			sizeof(struct vlan_hdr) + sizeof(struct fcoe_hdr));
be5d507d9af23c drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2010-05-18  406  	else
be5d507d9af23c drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2010-05-18  407  		fh =3D (struct fc_frame_header *)(skb->data +
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  408  			sizeof(struct fcoe_hdr));
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  409  =

d4ab88194e982a drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-09-03  410  	fctl =3D ntoh24(fh->fh_f_ctl);
d4ab88194e982a drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-09-03  411  	if (fctl & FC_FC_EX_CTX)
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  412  		xid =3D  be16_to_cpu(fh->fh_ox_id);
d4ab88194e982a drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-09-03  413  	else
d4ab88194e982a drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-09-03  414  		xid =3D  be16_to_cpu(fh->fh_rx_id);
d4ab88194e982a drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-09-03  415  =

ea412015a2e72f drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Vasu Dev      =
  2015-04-09  416  	ddp_max =3D IXGBE_FCOE_DDP_MAX;
ea412015a2e72f drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Vasu Dev      =
  2015-04-09  417  	/* X550 has different DDP Max limit */
ea412015a2e72f drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Vasu Dev      =
  2015-04-09  418  	if (adapter->hw.mac.type =3D=3D ixgbe_mac_X550)
ea412015a2e72f drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Vasu Dev      =
  2015-04-09  419  		ddp_max =3D IXGBE_FCOE_DDP_MAX_X550;
ea412015a2e72f drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Vasu Dev      =
  2015-04-09  420  	if (xid >=3D ddp_max)
e90dd264566405 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Mark Rustad   =
  2014-07-22  421  		return -EINVAL;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  422  =

d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  423  	fcoe =3D &adapter->fcoe;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13 @424  	ddp =3D &fcoe->ddp[xid];
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  425  	if (!ddp->udl)
e90dd264566405 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Mark Rustad   =
  2014-07-22  426  		return -EINVAL;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  427  =

f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  428  	ddp_err =3D ixgbe_test_staterr(rx_desc, IXGBE_RXDADV_ER=
R_FCEOFE |
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  429  					      IXGBE_RXDADV_ERR_FCERR);
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  430  	if (ddp_err)
e90dd264566405 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Mark Rustad   =
  2014-07-22  431  		return -EINVAL;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  432  =

f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  433  	switch (ixgbe_test_staterr(rx_desc, IXGBE_RXDADV_STAT_F=
CSTAT)) {
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  434  	/* return 0 to bypass going to ULD for DDPed data */
a1108ffd18c6e4 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Joe Perches   =
  2014-03-13  435  	case cpu_to_le32(IXGBE_RXDADV_STAT_FCSTAT_DDP):
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  436  		/* update length of DDPed data */
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  437  		ddp->len =3D le32_to_cpu(rx_desc->wb.lower.hi_dword.rs=
s);
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  438  		rc =3D 0;
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  439  		break;
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  440  	/* unmap the sg list when FCPRSP is received */
a1108ffd18c6e4 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Joe Perches   =
  2014-03-13  441  	case cpu_to_le32(IXGBE_RXDADV_STAT_FCSTAT_FCPRSP):
1bf91cdc1bba94 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-05-05  442  		dma_unmap_sg(&adapter->pdev->dev, ddp->sgl,
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  443  			     ddp->sgc, DMA_FROM_DEVICE);
9cfbfa701b5586 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Cathy Zhou    =
  2018-04-13  444  		ddp->err =3D (__force u32)ddp_err;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  445  		ddp->sgl =3D NULL;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  446  		ddp->sgc =3D 0;
5463fce643e8d0 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Jeff Kirsher  =
  2020-06-03  447  		fallthrough;
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  448  	/* if DDP length is present pass it through to ULD */
a1108ffd18c6e4 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Joe Perches   =
  2014-03-13  449  	case cpu_to_le32(IXGBE_RXDADV_STAT_FCSTAT_NODDP):
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  450  		/* update length of DDPed data */
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  451  		ddp->len =3D le32_to_cpu(rx_desc->wb.lower.hi_dword.rs=
s);
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  452  		if (ddp->len)
3d8fd385677292 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-06-08  453  			rc =3D ddp->len;
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  454  		break;
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  455  	/* no match will return as an error */
a1108ffd18c6e4 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Joe Perches   =
  2014-03-13  456  	case cpu_to_le32(IXGBE_RXDADV_STAT_FCSTAT_NOMTCH):
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  457  	default:
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  458  		break;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  459  	}
f56e0cb1fea6aa drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Alexander Duyc=
k 2012-01-31  460  =

68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  461  	/* In target mode, check the last data frame of the seq=
uence.
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  462  	 * For DDP in target mode, data is already DDPed but th=
e header
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  463  	 * indication of the last data frame ould allow is to t=
ell if we
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  464  	 * got all the data and the ULP can send FCP_RSP back, =
as this is
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  465  	 * not a full fcoe frame, we fill the trailer here so i=
t won't be
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  466  	 * dropped by the ULP stack.
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  467  	 */
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  468  	if ((fh->fh_r_ctl =3D=3D FC_RCTL_DD_SOL_DATA) &&
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  469  	    (fctl & FC_FC_END_SEQ)) {
441e1719f21356 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Yi Zou        =
  2012-04-20  470  		skb_linearize(skb);
4df864c1d9afb4 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Johannes Berg =
  2017-06-16  471  		crc =3D skb_put(skb, sizeof(*crc));
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  472  		crc->fcoe_eof =3D FC_EOF_T;
68a683cf6a5ff0 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2011-02-01  473  	}
e90dd264566405 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c Mark Rustad   =
  2014-07-22  474  =

d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  475  	return rc;
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  476  }
d0ed89373f2da1 drivers/net/ixgbe/ixgbe_fcoe.c                Yi Zou        =
  2009-05-13  477  =


:::::: The code at line 424 was first introduced by commit
:::::: d0ed89373f2da1a0d83697d87441e519caf18cf7 ixgbe: Add infrastructure c=
ode for FCoE large receive offload to 82599

:::::: TO: Yi Zou <yi.zou@intel.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1628015690353399613==--


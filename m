Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267A51F4168
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 00:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399838; cv=none; b=tLi++FUOaz8RPNrWPwXHd8WSEFkO+lwHt8Ce2xu4LNBNs6fSjMsPwwy4FC96AxKGHi7mOrBKZBgJOrC3Znul4stsl/cZUvpmYU4Flvn+wdT/AePsnLRvNDewQCjB3gixWwFOKx1xHtSyubFmsJF+7RG3/DVKc542z6JDqqXwoQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399838; c=relaxed/simple;
	bh=tGD8JPm3bPTBosRQLDh5IfA9TgztgRDpQsxj7PQu4bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eXgJMF1GwQ8NStJ100KleHzl/ui7Z5jjntsK4fhO2kE4khk5gNTd2WZnporRdk4wrgOJ5L3MOlhIJH0+04hCp+/GXcQ0CM7vneZ7K/SFU5y2bcgTXRa8quyl9NFDKEQ64GTQNqM4Gm03Dlf86TTyMxLhmY2iCaBVwsmBlu0dJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUyD/q0z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUyD/q0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774399836; x=1805935836;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tGD8JPm3bPTBosRQLDh5IfA9TgztgRDpQsxj7PQu4bc=;
  b=cUyD/q0zpIA7giuQZBaxDVxv+6db7uRs7KyJFySKapwEXK8seFSS2tct
   BVlte9MSgii7RB+jLrVrNJdQebSrWRNTIMMKvV4Hd0ugcJu0SpCsULFcL
   o0bZ2hLjRiR0UGLc6ZfDJz66qeGiqkufleP05SNfxSDtwrI9/oSXxE8FW
   /nD0U0EkmE0bc8vQF4M7Zu82JUZYa7kaUE4Bg9jo2qUNC/o40RblFFSvQ
   DkfY9wNAVqylp+foxZDPIQombHSu0C/6YwWZLdxKl6fxX0RbbKPLlkGlr
   r8qiV5k7cA7RaMpJOwTYFHmJ6zVH8bO7e/EPre/jZzcIrTQxuJSOlctHy
   g==;
X-CSE-ConnectionGUID: aCZW2rQeRcyT83V+XHaIGg==
X-CSE-MsgGUID: zgmDeukhT5a7Tzb/wht3Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="85739687"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="85739687"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 17:50:35 -0700
X-CSE-ConnectionGUID: +KIKznFZQYOGa0UIBvwlOg==
X-CSE-MsgGUID: m1yPA5GmS+aSgXK8rmjccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224780491"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Mar 2026 17:50:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5CS7-000000005en-3Twx;
	Wed, 25 Mar 2026 00:50:31 +0000
Date: Wed, 25 Mar 2026 08:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/chelsio/cxgb/sge.c:1377 sge_rx() warn:
 potential spectre issue 'adapter->port' [r] (local cap)
Message-ID: <202603250802.u2rXtHwG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

Hi Tiwei,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual=
 PCI driver
date:   11 months ago
:::::: branch date: 56 minutes ago
:::::: commit date: 11 months ago
config: um-randconfig-r073-20260325 (https://download.01.org/0day-ci/archiv=
e/20260325/202603250802.u2rXtHwG-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603250802.u2rXtHwG-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/chelsio/cxgb/sge.c:1377 sge_rx() warn: potential spect=
re issue 'adapter->port' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c:482 setup_sge_txq_uld() warn=
: 'txq_info->ntxq' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1748 cudbg_collect_tp_indire=
ct() error: buffer overflow 't5_tp_mib_index_array' 9 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1755 cudbg_collect_tp_indire=
ct() error: buffer overflow 't6_tp_mib_index_array' 6 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3111 cudbg_collect_up_cim_in=
direct() error: buffer overflow 't5_up_cim_reg_array' 13 <=3D 21
drivers/net/ethernet/chelsio/cxgb4/sge.c:2560 cxgb4_ethofld_send_flowc() wa=
rn: missing error code 'ret'
drivers/net/ethernet/chelsio/cxgb4/sge.c:4485 t4_sge_alloc_rxq() warn: pote=
ntial spectre issue 'adap->sge.egr_map' [w]
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1421 cxgb4_port_mirror_allo=
c_queues() warn: 'mirror_rxq->msix->vec' from request_irq() not released on=
 lines: 1421.
drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c:1525 cxgb4_port_mirror_allo=
c() warn: missing error code 'ret'

Old smatch warnings:
drivers/net/ethernet/chelsio/cxgb/sge.c:1376 sge_rx() warn: potential spect=
re issue 'sge->port_stats' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1694 cudbg_collect_tp_indire=
ct() error: buffer overflow 't5_tp_pio_array' 11 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1695 cudbg_collect_tp_indire=
ct() error: buffer overflow 't5_tp_pio_array' 11 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1696 cudbg_collect_tp_indire=
ct() error: buffer overflow 't5_tp_pio_array' 11 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1697 cudbg_collect_tp_indire=
ct() error: buffer overflow 't5_tp_pio_array' 11 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1699 cudbg_collect_tp_indire=
ct() error: buffer overflow 't6_tp_pio_array' 12 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1700 cudbg_collect_tp_indire=
ct() error: buffer overflow 't6_tp_pio_array' 12 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1701 cudbg_collect_tp_indire=
ct() error: buffer overflow 't6_tp_pio_array' 12 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1702 cudbg_collect_tp_indire=
ct() error: buffer overflow 't6_tp_pio_array' 12 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1749 cudbg_collect_tp_indire=
ct() error: buffer overflow 't5_tp_mib_index_array' 9 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1751 cudbg_collect_tp_indire=
ct() error: buffer overflow 't5_tp_mib_index_array' 9 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1753 cudbg_collect_tp_indire=
ct() error: buffer overflow 't5_tp_mib_index_array' 9 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1756 cudbg_collect_tp_indire=
ct() error: buffer overflow 't6_tp_mib_index_array' 6 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1758 cudbg_collect_tp_indire=
ct() error: buffer overflow 't6_tp_mib_index_array' 6 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1760 cudbg_collect_tp_indire=
ct() error: buffer overflow 't6_tp_mib_index_array' 6 <=3D 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3112 cudbg_collect_up_cim_in=
direct() error: buffer overflow 't5_up_cim_reg_array' 13 <=3D 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3114 cudbg_collect_up_cim_in=
direct() error: buffer overflow 't5_up_cim_reg_array' 13 <=3D 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3116 cudbg_collect_up_cim_in=
direct() error: buffer overflow 't5_up_cim_reg_array' 13 <=3D 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3117 cudbg_collect_up_cim_in=
direct() error: buffer overflow 't5_up_cim_reg_array' 13 <=3D 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3424 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3428 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3432 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3436 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3439 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3442 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3445 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3460 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3477 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3489 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3502 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3516 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3522 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3526 cudbg_collect_qdesc() w=
arn: 'size' unsigned <=3D 0
drivers/net/ethernet/chelsio/cxgb4/sge.c:4163 process_intrq() warn: potenti=
al spectre issue 'adap->sge.ingr_map' [w]
drivers/net/ethernet/chelsio/cxgb4/sge.c:4478 t4_sge_alloc_rxq() warn: pote=
ntial spectre issue 'adap->sge.ingr_map' [w]

vim +1377 drivers/net/ethernet/chelsio/cxgb/sge.c

8199d3a79c224b drivers/net/chelsio/sge.c               Christoph Lameter 20=
05-03-30  1346 =20
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1347  /**
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1348   *	sge_rx - process an ingress ethernet packet
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1349   *	@sge: the sge structure
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1350   *	@fl: the free list that contains the packet buffer
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1351   *	@len: the packet length
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1352   *
6167597d442f66 drivers/net/ethernet/chelsio/cxgb/sge.c Jean Sacren       20=
21-11-30  1353   *	Process an ingress ethernet packet and deliver it to the=
 stack.
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1354   */
24a427cf769847 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
07-01-08  1355  static void sge_rx(struct sge *sge, struct freelQ *fl, unsi=
gned int len)
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1356  {
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1357  	struct sk_buff *skb;
24a427cf769847 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
07-01-08  1358  	const struct cpl_rx_pkt *p;
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1359  	struct adapter *adapter =3D sge->adapter;
56f643c28c5df6 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1360  	struct sge_port_stats *st;
30f554f925335a drivers/net/chelsio/sge.c               Micha=C5=82 Miros=C5=
=82aw   2011-04-18  1361  	struct net_device *dev;
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1362 =20
e0e31216ef1d3e drivers/net/ethernet/chelsio/cxgb/sge.c Alexander Duyck   20=
14-12-09  1363  	skb =3D get_packet(adapter, fl, len - sge->rx_pkt_pad);
56f643c28c5df6 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1364  	if (unlikely(!skb)) {
56f643c28c5df6 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1365  		sge->stats.rx_drops++;
24a427cf769847 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
07-01-08  1366  		return;
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1367  	}
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1368 =20
24a427cf769847 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
07-01-08  1369  	p =3D (const struct cpl_rx_pkt *) skb->data;
f1d3d38af75789 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1370  	if (p->iff >=3D adapter->params.nports) {
f1d3d38af75789 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1371  		kfree_skb(skb);
24a427cf769847 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
07-01-08  1372  		return;
f1d3d38af75789 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1373  	}
24a427cf769847 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
07-01-08  1374  	__skb_pull(skb, sizeof(*p));
f1d3d38af75789 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1375 =20
ca0c9584b1f16b drivers/net/chelsio/sge.c               Christoph Lameter 20=
09-10-03  1376  	st =3D this_cpu_ptr(sge->port_stats[p->iff]);
30f554f925335a drivers/net/chelsio/sge.c               Micha=C5=82 Miros=C5=
=82aw   2011-04-18 @1377  	dev =3D adapter->port[p->iff].dev;
56f643c28c5df6 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1378 =20
30f554f925335a drivers/net/chelsio/sge.c               Micha=C5=82 Miros=C5=
=82aw   2011-04-18  1379  	skb->protocol =3D eth_type_trans(skb, dev);
30f554f925335a drivers/net/chelsio/sge.c               Micha=C5=82 Miros=C5=
=82aw   2011-04-18  1380  	if ((dev->features & NETIF_F_RXCSUM) && p->csum =
=3D=3D 0xffff &&
8199d3a79c224b drivers/net/chelsio/sge.c               Christoph Lameter 20=
05-03-30  1381  	    skb->protocol =3D=3D htons(ETH_P_IP) &&
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1382  	    (skb->data[9] =3D=3D IPPROTO_TCP || skb->data[9] =3D=
=3D IPPROTO_UDP)) {
56f643c28c5df6 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1383  		++st->rx_cso_good;
8199d3a79c224b drivers/net/chelsio/sge.c               Christoph Lameter 20=
05-03-30  1384  		skb->ip_summed =3D CHECKSUM_UNNECESSARY;
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1385  	} else
bc8acf2c8c3e43 drivers/net/chelsio/sge.c               Eric Dumazet      20=
10-09-02  1386  		skb_checksum_none_assert(skb);
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1387 =20
133b08513a99d4 drivers/net/chelsio/sge.c               Jiri Pirko        20=
11-07-20  1388  	if (p->vlan_valid) {
56f643c28c5df6 drivers/net/chelsio/sge.c               Stephen Hemminger 20=
06-12-01  1389  		st->vlan_xtract++;
86a9bad3ab6b6f drivers/net/ethernet/chelsio/cxgb/sge.c Patrick McHardy   20=
13-04-19  1390  		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), ntohs(p->=
vlan));
133b08513a99d4 drivers/net/chelsio/sge.c               Jiri Pirko        20=
11-07-20  1391  	}
559fb51ba7e66f drivers/net/chelsio/sge.c               Scott Bardone     20=
05-06-23  1392  	netif_receive_skb(skb);
8199d3a79c224b drivers/net/chelsio/sge.c               Christoph Lameter 20=
05-03-30  1393  }
8199d3a79c224b drivers/net/chelsio/sge.c               Christoph Lameter 20=
05-03-30  1394 =20

:::::: The code at line 1377 was first introduced by commit
:::::: 30f554f925335abad89aaa38eec6828242b27527 net: chelsio: convert to hw=
_features

:::::: TO: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
:::::: CC: David S. Miller <davem@davemloft.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173360;
	b=nb5ZfJIVwS0W76Uv0KsaAb50OLsIa95HEQkSZCP0XYQhs1EdlUsCdNvHkWKaz8MA/Gjc
	 zueyVI66e3DUCXgRvywP/ru7q0RtQre5lMwTvt+WP3oxM0j0khAPMBcc6NPVuGW2esT0l
	 5jRfMlldffY/MBnxKhiPM+8nBSSTFfFZKtcCEIik1ZyZFL62oz/qVgmDM+S6e83ZMSWD5
	 IyPvg6dHkG/Kf7FSjwdL5X8FTykkUQEXrWlj/L+tr73wU1zmiDSfVQbVbuAzjJO1wDLXH
	 Bc29DH02JljtEtA5xsJobk8EJThVgfxuMhfrKPDEhMery72oKsxI1iaTVLA4+Mdb0jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173360;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EGLZowmEM975UeArFJhncMFzCA+fa/mpXLikaXGlNaE=;
	b=JOFzESdESL4fopebg7hn4optr1KLXF4cl4ds9NrfD3geAVp2oaIn5/V5hZyqh2nfgwV7
	 VxYhMWhgImA0G5rTsEuvyXyClGJOUS+xlQFA/2NtTZ6g4iDi4rICxP5IPqE9QE19D7l3T
	 RzVTEKG9JNN0bIalPnX5MVKMHbHg8CYQ7V2x30F2dPQNjPBSr+EmSIS33yZxohs1Oirt1
	 LzBpz4eZj1ocK87+XujA4aU+JoteFxmhHshuCk8zJXBll1q8VLEMNcWwgkHLWaH5arJXq
	 BWpWOMDldulqmJqUMN6kBMmnfQ7BwvBxk0VW+llOoLIV/Uf/MYeChE4agu0iCKEUWZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dCk9Oqpu;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBF8606A33A
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Oct 2026 07:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBBF8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dCk9Oqpu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793173358; x=1824709358;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mZwoEvuTddkDkZH2rbcZgA+Ryq7G/wAkjFPTSuijX0c=;
  b=dCk9OqpuCHEidcYbDAEp35jVxlJFeM4+tMx9iilM8U4w4941NOzUE3ut
   6mZeJRpLBqkK5wBbR8UQNS4oOnoDZPSykR0edcMmWVut0bvQP3C3URE+v
   R0hx0ZGJGwQr9YRUvevAQVkkkgpNvl/gjapeaf9h8hLfWbh4djsUCAxo0
   dMCMejbDY0DfSpozmf8A+bZJR1tYNvkbGiw21/qBLYzB2ru1ctJjkN+rX
   NwFDaDeslsQI/ESZEbq8dzlT9AP5HdnR8bJ0mtWtbi2ik209Y2ELmaVYp
   MDBQLPESs7UUgVUF0Sp3dhSqOLhmLLmw7JZyCAXPb/WFYIdQDW1UBb9vA
   A==;
X-CSE-ConnectionGUID: AeXCZqytTru8NZWuWKGytQ==
X-CSE-MsgGUID: SpLz31TVT6SrN4SFPFAQuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1978428"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1978428"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 00:42:38 -0700
X-CSE-ConnectionGUID: Io51dNFKQOmpkIcVInURtA==
X-CSE-MsgGUID: X/9yr8BtSXmM+Y9qcuj9EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4739065"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2026 00:42:37 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLyIs-000000004nn-0xCg;
	Wed, 28 Oct 2026 07:42:34 +0000
Date: Wed, 28 Oct 2026 08:42:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frank-w-bpi-r2-4.14:7.3-rsslro3 13/17]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5804 mtk_probe() error: buffer
 overflow 'eth->irq_pdma' 4 <= 4
Message-ID: <202610280811.L2WryNtL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rsslro3
head:   1e2ab754d102ac67e5c12206bd1b87738f807ab6
commit: 917f63a9cea12c5fd90dc150688f6869afe24c42 [13/17] net: ethernet: mtk=
_eth_soc: Add LRO support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-r2202-20261028 (https://download.01.org/0day-c=
i/archive/20261028/202610280811.L2WryNtL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610280811.L2WryNtL-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mediatek/mtk_eth_soc.c:5804 mtk_probe() error: buffer =
overflow 'eth->irq_pdma' 4 <=3D 4

vim +5804 drivers/net/ethernet/mediatek/mtk_eth_soc.c

04c7aaccdcf60a Daniel Golle       2025-07-02  5564 =20
656e705243fd0c John Crispin       2016-03-08  5565  static int mtk_probe(st=
ruct platform_device *pdev)
656e705243fd0c John Crispin       2016-03-08  5566  {
04c7aaccdcf60a Daniel Golle       2025-07-02  5567  	struct resource *res =
=3D NULL;
656e705243fd0c John Crispin       2016-03-08  5568  	struct device_node *ma=
c_np;
917f63a9cea12c Mason Chang        2026-05-09  5569  	u8 lro_irq, lro_ring;
656e705243fd0c John Crispin       2016-03-08  5570  	struct mtk_eth *eth;
c81b15ce6facb9 Mason Chang        2026-05-09  5571  	char *irqname;
b8fc9f30821ec0 Ren=C3=A9 van Dorst     2019-08-25  5572  	int err, i;
656e705243fd0c John Crispin       2016-03-08  5573 =20
656e705243fd0c John Crispin       2016-03-08  5574  	eth =3D devm_kzalloc(&=
pdev->dev, sizeof(*eth), GFP_KERNEL);
656e705243fd0c John Crispin       2016-03-08  5575  	if (!eth)
656e705243fd0c John Crispin       2016-03-08  5576  		return -ENOMEM;
656e705243fd0c John Crispin       2016-03-08  5577 =20
eda7d46da443e1 Ryder Lee          2018-04-16  5578  	eth->soc =3D of_device=
_get_match_data(&pdev->dev);
2ec50f574e8198 Sean Wang          2017-07-31  5579 =20
549e5495467ac2 Sean Wang          2016-09-01  5580  	eth->dev =3D &pdev->de=
v;
d776a57e4a284b Felix Fietkau      2022-04-05  5581  	eth->dma_dev =3D &pdev=
->dev;
566495de16580a YueHaibing         2019-08-01  5582  	eth->base =3D devm_pla=
tform_ioremap_resource(pdev, 0);
621e49f6d80a73 Vladimir Zapolskiy 2016-03-23  5583  	if (IS_ERR(eth->base))
621e49f6d80a73 Vladimir Zapolskiy 2016-03-23  5584  		return PTR_ERR(eth->b=
ase);
656e705243fd0c John Crispin       2016-03-08  5585 =20
160d3a9b192985 Lorenzo Bianconi   2022-05-20  5586  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_SOC_MT7628))
296c9120752bab Stefan Roese       2019-08-16  5587  		eth->ip_align =3D NET=
_IP_ALIGN;
296c9120752bab Stefan Roese       2019-08-16  5588 =20
2d75891ebc09ba Daniel Golle       2023-08-22  5589  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_36BIT_DMA)) {
cae1f1c36661f2 Daniel Golle       2024-01-24  5590  		err =3D dma_set_mask(=
&pdev->dev, DMA_BIT_MASK(36));
cae1f1c36661f2 Daniel Golle       2024-01-24  5591  		if (!err)
cae1f1c36661f2 Daniel Golle       2024-01-24  5592  			err =3D dma_set_cohe=
rent_mask(&pdev->dev, DMA_BIT_MASK(32));
cae1f1c36661f2 Daniel Golle       2024-01-24  5593 =20
2d75891ebc09ba Daniel Golle       2023-08-22  5594  		if (err) {
2d75891ebc09ba Daniel Golle       2023-08-22  5595  			dev_err(&pdev->dev, =
"Wrong DMA config\n");
2d75891ebc09ba Daniel Golle       2023-08-22  5596  			return -EINVAL;
2d75891ebc09ba Daniel Golle       2023-08-22  5597  		}
2d75891ebc09ba Daniel Golle       2023-08-22  5598  	}
2d75891ebc09ba Daniel Golle       2023-08-22  5599 =20
656e705243fd0c John Crispin       2016-03-08  5600  	spin_lock_init(&eth->p=
age_lock);
5cce0322cf8cd2 John Crispin       2017-06-19  5601  	spin_lock_init(&eth->t=
x_irq_lock);
5cce0322cf8cd2 John Crispin       2017-06-19  5602  	spin_lock_init(&eth->r=
x_irq_lock);
e9229ffd550b2d Felix Fietkau      2021-04-22  5603  	spin_lock_init(&eth->d=
im_lock);
e9229ffd550b2d Felix Fietkau      2021-04-22  5604 =20
e9229ffd550b2d Felix Fietkau      2021-04-22  5605  	eth->rx_dim.mode =3D D=
IM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d Felix Fietkau      2021-04-22  5606  	INIT_WORK(&eth->rx_dim=
.work, mtk_dim_rx);
93b2591ad0d0c1 Lorenzo Bianconi   2023-01-14  5607  	INIT_DELAYED_WORK(&eth=
->reset.monitor_work, mtk_hw_reset_monitor_work);
e9229ffd550b2d Felix Fietkau      2021-04-22  5608 =20
e9229ffd550b2d Felix Fietkau      2021-04-22  5609  	eth->tx_dim.mode =3D D=
IM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d Felix Fietkau      2021-04-22  5610  	INIT_WORK(&eth->tx_dim=
.work, mtk_dim_tx);
656e705243fd0c John Crispin       2016-03-08  5611 =20
296c9120752bab Stefan Roese       2019-08-16  5612  	if (!MTK_HAS_CAPS(eth-=
>soc->caps, MTK_SOC_MT7628)) {
656e705243fd0c John Crispin       2016-03-08  5613  		eth->ethsys =3D sysco=
n_regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c John Crispin       2016-03-08  5614  							      "mediatek,=
ethsys");
656e705243fd0c John Crispin       2016-03-08  5615  		if (IS_ERR(eth->ethsy=
s)) {
656e705243fd0c John Crispin       2016-03-08  5616  			dev_err(&pdev->dev, =
"no ethsys regmap found\n");
656e705243fd0c John Crispin       2016-03-08  5617  			return PTR_ERR(eth->=
ethsys);
656e705243fd0c John Crispin       2016-03-08  5618  		}
296c9120752bab Stefan Roese       2019-08-16  5619  	}
656e705243fd0c John Crispin       2016-03-08  5620 =20
7093f9d80c7cb8 Sean Wang          2019-06-01  5621  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_INFRA)) {
7093f9d80c7cb8 Sean Wang          2019-06-01  5622  		eth->infra =3D syscon=
_regmap_lookup_by_phandle(pdev->dev.of_node,
7093f9d80c7cb8 Sean Wang          2019-06-01  5623  							     "mediatek,i=
nfracfg");
7093f9d80c7cb8 Sean Wang          2019-06-01  5624  		if (IS_ERR(eth->infra=
)) {
7093f9d80c7cb8 Sean Wang          2019-06-01  5625  			dev_err(&pdev->dev, =
"no infracfg regmap found\n");
7093f9d80c7cb8 Sean Wang          2019-06-01  5626  			return PTR_ERR(eth->=
infra);
7093f9d80c7cb8 Sean Wang          2019-06-01  5627  		}
7093f9d80c7cb8 Sean Wang          2019-06-01  5628  	}
7093f9d80c7cb8 Sean Wang          2019-06-01  5629 =20
d776a57e4a284b Felix Fietkau      2022-04-05  5630  	if (of_dma_is_coherent=
(pdev->dev.of_node)) {
d776a57e4a284b Felix Fietkau      2022-04-05  5631  		struct regmap *cci;
d776a57e4a284b Felix Fietkau      2022-04-05  5632 =20
d776a57e4a284b Felix Fietkau      2022-04-05  5633  		cci =3D syscon_regmap=
_lookup_by_phandle(pdev->dev.of_node,
4263f77a5144f7 Lorenzo Bianconi   2022-04-11  5634  						      "cci-contro=
l-port");
d776a57e4a284b Felix Fietkau      2022-04-05  5635  		/* enable CPU/bus coh=
erency */
d776a57e4a284b Felix Fietkau      2022-04-05  5636  		if (!IS_ERR(cci))
d776a57e4a284b Felix Fietkau      2022-04-05  5637  			regmap_write(cci, 0,=
 3);
d776a57e4a284b Felix Fietkau      2022-04-05  5638  	}
d776a57e4a284b Felix Fietkau      2022-04-05  5639 =20
42c03844e93d56 Sean Wang          2017-07-31  5640  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_SGMII)) {
2a3ec7ae313310 Daniel Golle       2023-03-19  5641  		err =3D mtk_sgmii_ini=
t(eth);
9ffee4a8276c73 Sean Wang          2019-06-01  5642 =20
9ffee4a8276c73 Sean Wang          2019-06-01  5643  		if (err)
9ffee4a8276c73 Sean Wang          2019-06-01  5644  			return err;
42c03844e93d56 Sean Wang          2017-07-31  5645  	}
42c03844e93d56 Sean Wang          2017-07-31  5646 =20
243dc5fb4697a0 Sean Wang          2017-12-20  5647  	if (eth->soc->required=
_pctl) {
656e705243fd0c John Crispin       2016-03-08  5648  		eth->pctl =3D syscon_=
regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c John Crispin       2016-03-08  5649  							    "mediatek,pc=
tl");
656e705243fd0c John Crispin       2016-03-08  5650  		if (IS_ERR(eth->pctl)=
) {
656e705243fd0c John Crispin       2016-03-08  5651  			dev_err(&pdev->dev, =
"no pctl regmap found\n");
2a3ec7ae313310 Daniel Golle       2023-03-19  5652  			err =3D PTR_ERR(eth-=
>pctl);
2a3ec7ae313310 Daniel Golle       2023-03-19  5653  			goto err_destroy_sgm=
ii;
656e705243fd0c John Crispin       2016-03-08  5654  		}
243dc5fb4697a0 Sean Wang          2017-12-20  5655  	}
656e705243fd0c John Crispin       2016-03-08  5656 =20
a008e2a84e6b2b Lorenzo Bianconi   2023-07-25  5657  	if (mtk_is_netsys_v2_o=
r_greater(eth)) {
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5658  		res =3D platform_get_=
resource(pdev, IORESOURCE_MEM, 0);
2a3ec7ae313310 Daniel Golle       2023-03-19  5659  		if (!res) {
2a3ec7ae313310 Daniel Golle       2023-03-19  5660  			err =3D -EINVAL;
2a3ec7ae313310 Daniel Golle       2023-03-19  5661  			goto err_destroy_sgm=
ii;
2a3ec7ae313310 Daniel Golle       2023-03-19  5662  		}
04c7aaccdcf60a Daniel Golle       2025-07-02  5663 =20
ebb1e4f9cf38da Daniel Golle       2023-08-22  5664  		if (MTK_HAS_CAPS(eth-=
>soc->caps, MTK_SRAM)) {
04c7aaccdcf60a Daniel Golle       2025-07-02  5665  			eth->sram_pool =3D o=
f_gen_pool_get(pdev->dev.of_node,
04c7aaccdcf60a Daniel Golle       2025-07-02  5666  							 "sram", 0);
04c7aaccdcf60a Daniel Golle       2025-07-02  5667  			if (!eth->sram_pool)=
 {
04c7aaccdcf60a Daniel Golle       2025-07-02  5668  				if (!mtk_is_netsys_=
v3_or_greater(eth)) {
04c7aaccdcf60a Daniel Golle       2025-07-02  5669  					err =3D mtk_setup_=
legacy_sram(eth, res);
04c7aaccdcf60a Daniel Golle       2025-07-02  5670  					if (err)
04c7aaccdcf60a Daniel Golle       2025-07-02  5671  						goto err_destroy_=
sgmii;
04c7aaccdcf60a Daniel Golle       2025-07-02  5672  				} else {
04c7aaccdcf60a Daniel Golle       2025-07-02  5673  					dev_err(&pdev->dev,
04c7aaccdcf60a Daniel Golle       2025-07-02  5674  						"Could not get SR=
AM pool\n");
ebb1e4f9cf38da Daniel Golle       2023-08-22  5675  					err =3D -EINVAL;
ebb1e4f9cf38da Daniel Golle       2023-08-22  5676  					goto err_destroy_s=
gmii;
ebb1e4f9cf38da Daniel Golle       2023-08-22  5677  				}
ebb1e4f9cf38da Daniel Golle       2023-08-22  5678  			}
ebb1e4f9cf38da Daniel Golle       2023-08-22  5679  		}
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5680  	}
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5681 =20
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5682  	if (eth->soc->offload_=
version) {
804775dfc2885e Felix Fietkau      2022-04-05  5683  		for (i =3D 0;; i++) {
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5684  			struct device_node *=
np;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5685  			phys_addr_t wdma_phy;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5686  			u32 wdma_base;
804775dfc2885e Felix Fietkau      2022-04-05  5687 =20
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5688  			if (i >=3D ARRAY_SIZ=
E(eth->soc->reg_map->wdma_base))
804775dfc2885e Felix Fietkau      2022-04-05  5689  				break;
804775dfc2885e Felix Fietkau      2022-04-05  5690 =20
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5691  			np =3D of_parse_phan=
dle(pdev->dev.of_node,
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5692  					      "mediatek,we=
d", i);
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5693  			if (!np)
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5694  				break;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5695 =20
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5696  			wdma_base =3D eth->s=
oc->reg_map->wdma_base[i];
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5697  			wdma_phy =3D res ? r=
es->start + wdma_base : 0;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5698  			mtk_wed_add_hw(np, e=
th, eth->base + wdma_base,
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5699  				       wdma_phy, i);
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5700  		}
804775dfc2885e Felix Fietkau      2022-04-05  5701  	}
804775dfc2885e Felix Fietkau      2022-04-05  5702 =20
c81b15ce6facb9 Mason Chang        2026-05-09  5703  	err =3D mtk_get_irqs_f=
e(pdev, eth);
ee85b483fefbbe Frank Wunderlich   2025-06-19  5704  	if (err)
b3d0d98179d62f Yang Yingliang     2022-10-17  5705  		goto err_wed_exit;
ee85b483fefbbe Frank Wunderlich   2025-06-19  5706 =20
c81b15ce6facb9 Mason Chang        2026-05-09  5707  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_PDMA_INT)) {
c81b15ce6facb9 Mason Chang        2026-05-09  5708  		err =3D mtk_get_irqs_=
pdma(pdev, eth);
c81b15ce6facb9 Mason Chang        2026-05-09  5709  		if (err)
c81b15ce6facb9 Mason Chang        2026-05-09  5710  			goto err_wed_exit;
c81b15ce6facb9 Mason Chang        2026-05-09  5711  	}
c81b15ce6facb9 Mason Chang        2026-05-09  5712 =20
549e5495467ac2 Sean Wang          2016-09-01  5713  	for (i =3D 0; i < ARRA=
Y_SIZE(eth->clks); i++) {
549e5495467ac2 Sean Wang          2016-09-01  5714  		eth->clks[i] =3D devm=
_clk_get(eth->dev,
549e5495467ac2 Sean Wang          2016-09-01  5715  					    mtk_clks_sourc=
e_name[i]);
549e5495467ac2 Sean Wang          2016-09-01  5716  		if (IS_ERR(eth->clks[=
i])) {
b3d0d98179d62f Yang Yingliang     2022-10-17  5717  			if (PTR_ERR(eth->clk=
s[i]) =3D=3D -EPROBE_DEFER) {
b3d0d98179d62f Yang Yingliang     2022-10-17  5718  				err =3D -EPROBE_DEF=
ER;
b3d0d98179d62f Yang Yingliang     2022-10-17  5719  				goto err_wed_exit;
b3d0d98179d62f Yang Yingliang     2022-10-17  5720  			}
2ec50f574e8198 Sean Wang          2017-07-31  5721  			if (eth->soc->requir=
ed_clks & BIT(i)) {
2ec50f574e8198 Sean Wang          2017-07-31  5722  				dev_err(&pdev->dev,=
 "clock %s not found\n",
2ec50f574e8198 Sean Wang          2017-07-31  5723  					mtk_clks_source_na=
me[i]);
b3d0d98179d62f Yang Yingliang     2022-10-17  5724  				err =3D -EINVAL;
b3d0d98179d62f Yang Yingliang     2022-10-17  5725  				goto err_wed_exit;
2ec50f574e8198 Sean Wang          2017-07-31  5726  			}
2ec50f574e8198 Sean Wang          2017-07-31  5727  			eth->clks[i] =3D NUL=
L;
549e5495467ac2 Sean Wang          2016-09-01  5728  		}
549e5495467ac2 Sean Wang          2016-09-01  5729  	}
656e705243fd0c John Crispin       2016-03-08  5730 =20
656e705243fd0c John Crispin       2016-03-08  5731  	eth->msg_enable =3D ne=
tif_msg_init(mtk_msg_level, MTK_DEFAULT_MSG_ENABLE);
7c78b4ad9bbdbe John Crispin       2016-04-08  5732  	INIT_WORK(&eth->pendin=
g_work, mtk_pending_work);
656e705243fd0c John Crispin       2016-03-08  5733 =20
a9724b9c477f63 Lorenzo Bianconi   2023-01-14  5734  	err =3D mtk_hw_init(et=
h, false);
656e705243fd0c John Crispin       2016-03-08  5735  	if (err)
b3d0d98179d62f Yang Yingliang     2022-10-17  5736  		goto err_wed_exit;
656e705243fd0c John Crispin       2016-03-08  5737 =20
2d14ba7228b0c2 Sean Wang          2018-07-28  5738  	eth->hwlro =3D MTK_HAS=
_CAPS(eth->soc->caps, MTK_HWLRO);
983e1a6c95abf8 Nelson Chang       2016-10-06  5739 =20
656e705243fd0c John Crispin       2016-03-08  5740  	for_each_child_of_node=
(pdev->dev.of_node, mac_np) {
656e705243fd0c John Crispin       2016-03-08  5741  		if (!of_device_is_com=
patible(mac_np,
656e705243fd0c John Crispin       2016-03-08  5742  					     "mediatek,eth=
-mac"))
656e705243fd0c John Crispin       2016-03-08  5743  			continue;
656e705243fd0c John Crispin       2016-03-08  5744 =20
656e705243fd0c John Crispin       2016-03-08  5745  		if (!of_device_is_ava=
ilable(mac_np))
656e705243fd0c John Crispin       2016-03-08  5746  			continue;
656e705243fd0c John Crispin       2016-03-08  5747 =20
656e705243fd0c John Crispin       2016-03-08  5748  		err =3D mtk_add_mac(e=
th, mac_np);
cf36dd2f7793e8 Nishka Dasgupta    2019-07-16  5749  		if (err) {
cf36dd2f7793e8 Nishka Dasgupta    2019-07-16  5750  			of_node_put(mac_np);
8a8a9e89f801ce Sean Wang          2016-09-14  5751  			goto err_deinit_hw;
656e705243fd0c John Crispin       2016-03-08  5752  		}
cf36dd2f7793e8 Nishka Dasgupta    2019-07-16  5753  	}
656e705243fd0c John Crispin       2016-03-08  5754 =20
c81b15ce6facb9 Mason Chang        2026-05-09  5755  	err =3D mtk_napi_init(=
eth);
c81b15ce6facb9 Mason Chang        2026-05-09  5756  	if (err)
c81b15ce6facb9 Mason Chang        2026-05-09  5757  		goto err_free_dev;
c81b15ce6facb9 Mason Chang        2026-05-09  5758 =20
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5759  	if (MTK_HAS_CAPS(=
eth->soc->caps, MTK_SHARED_INT)) {
c81b15ce6facb9 Mason Chang        2026-05-09  5760  		err =3D devm_request_=
irq(eth->dev, eth->irq_fe[MTK_FE_IRQ_SHARED],
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5761  				       mtk_han=
dle_irq, 0,
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5762  				       dev_nam=
e(eth->dev), eth);
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5763  	} else {
c81b15ce6facb9 Mason Chang        2026-05-09  5764  		irqname =3D devm_kasp=
rintf(eth->dev, GFP_KERNEL, "%s TX",
c81b15ce6facb9 Mason Chang        2026-05-09  5765  					 dev_name(eth->dev=
));
c81b15ce6facb9 Mason Chang        2026-05-09  5766  		err =3D devm_request_=
irq(eth->dev, eth->irq_fe[MTK_FE_IRQ_TX],
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5767  				       mtk_han=
dle_irq_tx, 0,
c81b15ce6facb9 Mason Chang        2026-05-09  5768  				       irqname, eth=
);
85574dbf9d12b3 Sean Wang          2016-09-14  5769  		if (err)
85574dbf9d12b3 Sean Wang          2016-09-14  5770  			goto err_free_dev;
85574dbf9d12b3 Sean Wang          2016-09-14  5771 =20
c81b15ce6facb9 Mason Chang        2026-05-09  5772  		if (MTK_HAS_CAPS(eth-=
>soc->caps, MTK_PDMA_INT)) {
c81b15ce6facb9 Mason Chang        2026-05-09  5773  			irqname =3D devm_kas=
printf(eth->dev, GFP_KERNEL, "%s PDMA RX %d",
c81b15ce6facb9 Mason Chang        2026-05-09  5774  						 dev_name(eth->de=
v), 0);
c81b15ce6facb9 Mason Chang        2026-05-09  5775  			err =3D devm_request=
_irq(eth->dev, eth->irq_pdma[0],
c81b15ce6facb9 Mason Chang        2026-05-09  5776  					       mtk_handle_=
irq_rx, IRQF_SHARED,
c81b15ce6facb9 Mason Chang        2026-05-09  5777  					       irqname, &e=
th->rx_napi[0]);
c81b15ce6facb9 Mason Chang        2026-05-09  5778  			if (err)
c81b15ce6facb9 Mason Chang        2026-05-09  5779  				goto err_free_dev;
c81b15ce6facb9 Mason Chang        2026-05-09  5780 =20
c81b15ce6facb9 Mason Chang        2026-05-09  5781  			if (MTK_HAS_CAPS(eth=
->soc->caps, MTK_RSS)) {
c81b15ce6facb9 Mason Chang        2026-05-09  5782  				for (i =3D 1; i < M=
TK_RX_RSS_NUM(eth); i++) {
c81b15ce6facb9 Mason Chang        2026-05-09  5783  					irqname =3D devm_k=
asprintf(eth->dev, GFP_KERNEL,
c81b15ce6facb9 Mason Chang        2026-05-09  5784  								 "%s PDMA RX %d=
",
c81b15ce6facb9 Mason Chang        2026-05-09  5785  								 dev_name(eth->=
dev), i);
c81b15ce6facb9 Mason Chang        2026-05-09  5786  					err =3D devm_reque=
st_irq(eth->dev,
c81b15ce6facb9 Mason Chang        2026-05-09  5787  							       eth->irq_=
pdma[MTK_RSS_RING(i)],
c81b15ce6facb9 Mason Chang        2026-05-09  5788  							       mtk_handl=
e_irq_rx, IRQF_SHARED,
c81b15ce6facb9 Mason Chang        2026-05-09  5789  							       irqname,
c81b15ce6facb9 Mason Chang        2026-05-09  5790  							       &eth->rx_=
napi[MTK_RSS_RING(i)]);
c81b15ce6facb9 Mason Chang        2026-05-09  5791  					if (err)
c81b15ce6facb9 Mason Chang        2026-05-09  5792  						goto err_free_dev;
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5793  				}
c81b15ce6facb9 Mason Chang        2026-05-09  5794  			}
917f63a9cea12c Mason Chang        2026-05-09  5795 =20
917f63a9cea12c Mason Chang        2026-05-09  5796  			if (eth->hwlro) {
917f63a9cea12c Mason Chang        2026-05-09  5797  				for (i =3D 0; i < M=
TK_HW_LRO_RING_NUM(eth); i++) {
917f63a9cea12c Mason Chang        2026-05-09  5798  					lro_irq =3D MTK_HW=
_LRO_IRQ(eth, i);
917f63a9cea12c Mason Chang        2026-05-09  5799  					lro_ring =3D MTK_H=
W_LRO_RING(eth, i);
917f63a9cea12c Mason Chang        2026-05-09  5800  					irqname =3D devm_k=
asprintf(eth->dev, GFP_KERNEL,
917f63a9cea12c Mason Chang        2026-05-09  5801  								 "%s LRO RX %d",
917f63a9cea12c Mason Chang        2026-05-09  5802  								 dev_name(eth->=
dev), i);
917f63a9cea12c Mason Chang        2026-05-09  5803  					err =3D devm_reque=
st_irq(eth->dev,
917f63a9cea12c Mason Chang        2026-05-09 @5804  							       eth->irq_=
pdma[lro_irq],
917f63a9cea12c Mason Chang        2026-05-09  5805  							       mtk_handl=
e_irq_rx, IRQF_SHARED,
917f63a9cea12c Mason Chang        2026-05-09  5806  							       irqname,
917f63a9cea12c Mason Chang        2026-05-09  5807  							       &eth->rx_=
napi[lro_ring]);
917f63a9cea12c Mason Chang        2026-05-09  5808  					if (err)
917f63a9cea12c Mason Chang        2026-05-09  5809  						goto err_free_dev;
917f63a9cea12c Mason Chang        2026-05-09  5810  				}
917f63a9cea12c Mason Chang        2026-05-09  5811  			}
c81b15ce6facb9 Mason Chang        2026-05-09  5812  		} else {
c81b15ce6facb9 Mason Chang        2026-05-09  5813  			irqname =3D devm_kas=
printf(eth->dev, GFP_KERNEL, "%s RX",
c81b15ce6facb9 Mason Chang        2026-05-09  5814  						 dev_name(eth->de=
v));
c81b15ce6facb9 Mason Chang        2026-05-09  5815  			err =3D devm_request=
_irq(eth->dev, eth->irq_fe[MTK_FE_IRQ_RX],
c81b15ce6facb9 Mason Chang        2026-05-09  5816  					       mtk_handle_=
irq_rx, 0,
c81b15ce6facb9 Mason Chang        2026-05-09  5817  					       irqname, &e=
th->rx_napi[0]);
85574dbf9d12b3 Sean Wang          2016-09-14  5818  			if (err)
85574dbf9d12b3 Sean Wang          2016-09-14  5819  				goto err_free_dev;
c81b15ce6facb9 Mason Chang        2026-05-09  5820  		}
c81b15ce6facb9 Mason Chang        2026-05-09  5821  	}
85574dbf9d12b3 Sean Wang          2016-09-14  5822 =20
296c9120752bab Stefan Roese       2019-08-16  5823  	/* No MT7628/88 suppor=
t yet */
296c9120752bab Stefan Roese       2019-08-16  5824  	if (!MTK_HAS_CAPS(eth-=
>soc->caps, MTK_SOC_MT7628)) {
85574dbf9d12b3 Sean Wang          2016-09-14  5825  		err =3D mtk_mdio_init=
(eth);
85574dbf9d12b3 Sean Wang          2016-09-14  5826  		if (err)
85574dbf9d12b3 Sean Wang          2016-09-14  5827  			goto err_free_dev;
296c9120752bab Stefan Roese       2019-08-16  5828  	}
85574dbf9d12b3 Sean Wang          2016-09-14  5829 =20
ba37b7caf1ed23 Felix Fietkau      2021-03-24  5830  	if (eth->soc->offload_=
version) {
dee4dd10c79aac Elad Yifee         2024-06-07  5831  		u8 ppe_num =3D eth->s=
oc->ppe_num;
329bce5139cfb0 Lorenzo Bianconi   2022-09-20  5832 =20
dee4dd10c79aac Elad Yifee         2024-06-07  5833  		ppe_num =3D min_t(u8,=
 ARRAY_SIZE(eth->ppe), ppe_num);
dee4dd10c79aac Elad Yifee         2024-06-07  5834  		for (i =3D 0; i < ppe=
_num; i++) {
dee4dd10c79aac Elad Yifee         2024-06-07  5835  			u32 ppe_addr =3D eth=
->soc->reg_map->ppe_base;
4ff1a3fca766aa Lorenzo Bianconi   2022-09-20  5836 =20
dee4dd10c79aac Elad Yifee         2024-06-07  5837  			ppe_addr +=3D (i =3D=
=3D 2 ? 0xc00 : i * 0x400);
3fbe4d8c0e53e4 Daniel Golle       2023-03-19  5838  			eth->ppe[i] =3D mtk_=
ppe_init(eth, eth->base + ppe_addr, i);
3fbe4d8c0e53e4 Daniel Golle       2023-03-19  5839 =20
4ff1a3fca766aa Lorenzo Bianconi   2022-09-20  5840  			if (!eth->ppe[i]) {
1ccc723b5829d6 Felix Fietkau      2022-04-05  5841  				err =3D -ENOMEM;
603ea5e7ffa73c Yan Cangang        2022-11-20  5842  				goto err_deinit_ppe;
1ccc723b5829d6 Felix Fietkau      2022-04-05  5843  			}
dee4dd10c79aac Elad Yifee         2024-06-07  5844  			err =3D mtk_eth_offl=
oad_init(eth, i);
502e84e2382d92 Felix Fietkau      2021-03-24  5845 =20
502e84e2382d92 Felix Fietkau      2021-03-24  5846  			if (err)
603ea5e7ffa73c Yan Cangang        2022-11-20  5847  				goto err_deinit_ppe;
ba37b7caf1ed23 Felix Fietkau      2021-03-24  5848  		}
dee4dd10c79aac Elad Yifee         2024-06-07  5849  	}
ba37b7caf1ed23 Felix Fietkau      2021-03-24  5850 =20
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5851  	/* we run 2 devices on=
 the same DMA ring so we need a dummy device
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5852  	 * for NAPI to work. A=
llocate it before registering the netdevs so a
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5853  	 * concurrent ndo_open=
 (e.g. netifd bringing the first netdev up the
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5854  	 * instant it is regis=
tered) never observes eth->dummy_dev =3D=3D NULL in
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5855  	 * mtk_dma_init() -> m=
tk_rx_alloc() -> __xdp_rxq_info_reg() (net/core/xdp.c
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5856  	 * "Missing net_device=
 from driver") and fails the first open.
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5857  	 */
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5858  	eth->dummy_dev =3D all=
oc_netdev_dummy(0);
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5859  	if (!eth->dummy_dev) {
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5860  		err =3D -ENOMEM;
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5861  		dev_err(eth->dev, "fa=
iled to allocated dummy device\n");
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5862  		goto err_unreg_netdev;
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5863  	}
dc6006ea545575 Bo-Cun Chen        2026-10-08  5864  	eth->dummy_dev->thread=
ed =3D 1;
dc6006ea545575 Bo-Cun Chen        2026-10-08  5865  	strcpy(eth->dummy_dev-=
>name, "mtk_eth");
dc6006ea545575 Bo-Cun Chen        2026-10-08  5866 =20
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5867  	netif_napi_add(eth->du=
mmy_dev, &eth->tx_napi, mtk_napi_tx);
c81b15ce6facb9 Mason Chang        2026-05-09  5868  	netif_napi_add(eth->du=
mmy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
c81b15ce6facb9 Mason Chang        2026-05-09  5869 =20
c81b15ce6facb9 Mason Chang        2026-05-09  5870  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_RSS)) {
c81b15ce6facb9 Mason Chang        2026-05-09  5871  		for (i =3D 1; i < MTK=
_RX_RSS_NUM(eth); i++)
c81b15ce6facb9 Mason Chang        2026-05-09  5872  			netif_napi_add(eth->=
dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
c81b15ce6facb9 Mason Chang        2026-05-09  5873  				       mtk_napi_rx);
c81b15ce6facb9 Mason Chang        2026-05-09  5874  	}
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5875 =20
917f63a9cea12c Mason Chang        2026-05-09  5876  	if (eth->hwlro) {
917f63a9cea12c Mason Chang        2026-05-09  5877  		for (i =3D 0; i < MTK=
_HW_LRO_RING_NUM(eth); i++) {
917f63a9cea12c Mason Chang        2026-05-09  5878  			netif_napi_add(eth->=
dummy_dev, &eth->rx_napi[MTK_HW_LRO_RING(eth, i)].napi,
917f63a9cea12c Mason Chang        2026-05-09  5879  				       mtk_napi_rx);
917f63a9cea12c Mason Chang        2026-05-09  5880  		}
917f63a9cea12c Mason Chang        2026-05-09  5881  	}
917f63a9cea12c Mason Chang        2026-05-09  5882 =20
85574dbf9d12b3 Sean Wang          2016-09-14  5883  	for (i =3D 0; i < MTK_=
MAX_DEVS; i++) {
85574dbf9d12b3 Sean Wang          2016-09-14  5884  		if (!eth->netdev[i])
85574dbf9d12b3 Sean Wang          2016-09-14  5885  			continue;
85574dbf9d12b3 Sean Wang          2016-09-14  5886 =20
85574dbf9d12b3 Sean Wang          2016-09-14  5887  		err =3D register_netd=
ev(eth->netdev[i]);
85574dbf9d12b3 Sean Wang          2016-09-14  5888  		if (err) {
85574dbf9d12b3 Sean Wang          2016-09-14  5889  			dev_err(eth->dev, "e=
rror bringing up device\n");
310d1ac61a4d5a Lorenzo Bianconi   2026-09-16  5890  			goto err_unreg_netde=
v;
85574dbf9d12b3 Sean Wang          2016-09-14  5891  		} else
85574dbf9d12b3 Sean Wang          2016-09-14  5892  			netif_info(eth, prob=
e, eth->netdev[i],
85574dbf9d12b3 Sean Wang          2016-09-14  5893  				   "mediatek frame =
engine at 0x%08lx, irq %d\n",
c81b15ce6facb9 Mason Chang        2026-05-09  5894  				   eth->netdev[i]->=
base_addr, eth->irq_fe[MTK_FE_IRQ_SHARED]);
85574dbf9d12b3 Sean Wang          2016-09-14  5895  	}
85574dbf9d12b3 Sean Wang          2016-09-14  5896 =20
656e705243fd0c John Crispin       2016-03-08  5897  	platform_set_drvdata(p=
dev, eth);
93b2591ad0d0c1 Lorenzo Bianconi   2023-01-14  5898  	schedule_delayed_work(=
&eth->reset.monitor_work,
93b2591ad0d0c1 Lorenzo Bianconi   2023-01-14  5899  			      MTK_DMA_MONITO=
R_TIMEOUT);
656e705243fd0c John Crispin       2016-03-08  5900 =20
656e705243fd0c John Crispin       2016-03-08  5901  	return 0;
656e705243fd0c John Crispin       2016-03-08  5902 =20
b209bd6d0bffb8 Breno Leitao       2024-04-22  5903  err_unreg_netdev:
b209bd6d0bffb8 Breno Leitao       2024-04-22  5904  	mtk_unreg_dev(eth);
dc6006ea545575 Bo-Cun Chen        2026-10-08  5905  	free_netdev(eth->dummy=
_dev);
603ea5e7ffa73c Yan Cangang        2022-11-20  5906  err_deinit_ppe:
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5907  	/* A netdev opened whi=
le probe was still registering can have queued
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5908  	 * the frame-engine re=
set worker, which takes rtnl and drives the
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5909  	 * hardware; cancel it=
 before anything below is torn down.
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5910  	 */
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5911  	cancel_work_sync(&eth-=
>pending_work);
93d6b8f7fcccf2 Frank Wunderlich   2026-10-25  5912  	mtk_napi_del(eth);
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5913  	if (eth->dummy_dev) {
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5914  		free_netdev(eth->dumm=
y_dev);
6f0c2c4f5e7143 Sandeep Haemoon    2026-09-24  5915  	}
dc6006ea545575 Bo-Cun Chen        2026-10-08  5916 =20
603ea5e7ffa73c Yan Cangang        2022-11-20  5917  	mtk_ppe_deinit(eth);
8a8a9e89f801ce Sean Wang          2016-09-14  5918  	mtk_mdio_cleanup(eth);
656e705243fd0c John Crispin       2016-03-08  5919  err_free_dev:
8a8a9e89f801ce Sean Wang          2016-09-14  5920  	mtk_free_dev(eth);
8a8a9e89f801ce Sean Wang          2016-09-14  5921  err_deinit_hw:
8a8a9e89f801ce Sean Wang          2016-09-14  5922  	mtk_hw_deinit(eth);
b3d0d98179d62f Yang Yingliang     2022-10-17  5923  err_wed_exit:
b3d0d98179d62f Yang Yingliang     2022-10-17  5924  	mtk_wed_exit();
2a3ec7ae313310 Daniel Golle       2023-03-19  5925  err_destroy_sgmii:
2a3ec7ae313310 Daniel Golle       2023-03-19  5926  	mtk_sgmii_destroy(eth);
8a8a9e89f801ce Sean Wang          2016-09-14  5927 =20
656e705243fd0c John Crispin       2016-03-08  5928  	return err;
656e705243fd0c John Crispin       2016-03-08  5929  }
656e705243fd0c John Crispin       2016-03-08  5930 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

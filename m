Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F521B808
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855109; cv=none; b=I6WBUgcz+leqK6Tf4/PdD81GraJTBAU2P5fO4ByjiLLUaBC8wkNt1VXFp/D9xJPQdDK07oT1HeLnc0TgFVUBtsbqMPtwq2Ru+w+TH2v+RXCT/T1QgAxDdHFGNfHZofOyvOPZIJWJNzjaD55PL0bj9YwkfDdw7WaLstOrvPGqB8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855109; c=relaxed/simple;
	bh=l0CF91WUNKS3YINAbRqhc9JnM7moeNEXwegIlH+pBM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iOL14zeU4KzIq4f/1GnkRCOjYUs/PWdzoI+W6d73gQC08sUYu3pVqcc9qyWG8iTpHCRN+hhvU3jFfLCrtPYHPg49AHqDl1XGskHEB/vHuQfk2fUcgD2ospow2WZxkR4DcVU7iiiNRnMwBqKfffPLOreTtc4iHtLLiqwC5XjunD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKL57I/m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKL57I/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778855106; x=1810391106;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l0CF91WUNKS3YINAbRqhc9JnM7moeNEXwegIlH+pBM4=;
  b=cKL57I/m1UljffmiWyRjZz5ffRBYSqR6y+mdXRnCCruvP+EsnSRUHMrC
   M/SycuGPKGYZ4m83bxPFlcBjV+sHztnwfyA0JtEbNwiqnecXNsyhN2qla
   XFZEnaMiV2crKhNsJCa4M0JbewdMGs0N+m6i3XxXK5eGR6hzOH6VCURbA
   vBg8YlE6Xg3iQZaEvZeoWMMvV0LUfGg5FPqH9gYDkd4JPp1VpZCmRILUI
   v+rAx2iANMME1RjX/UBNmWBHrxSR9cDn/FayUSKKu9ei4uFb9jzsMbxd3
   J4gJU8zQVjVjhP/z6YPpL+UfMVZX68eoPsxZpUyc/2K2ICqDwh8YRpJ8h
   Q==;
X-CSE-ConnectionGUID: NZBW3ypYRAaCsb3uhnu6Qw==
X-CSE-MsgGUID: eyQcVw52QJq83lBK+4mTvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83423768"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83423768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 07:25:05 -0700
X-CSE-ConnectionGUID: elPHXJTNS6KbzrytrVU7Bg==
X-CSE-MsgGUID: 8YfMROe8RmCyuXmbs+4hWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="262467527"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2026 07:25:03 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNtTJ-000000001qr-2o6Q;
	Fri, 15 May 2026 14:25:01 +0000
Date: Fri, 15 May 2026 22:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [frank-w-bpi-r2-4.14:7.1-rc 6/154]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5744 mtk_probe() error: buffer
 overflow 'eth->irq_pdma' 4 <= 4
Message-ID: <202605152231.8FnPq8nP-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   767536110bfe28c94ae2e150c083d29f827655cf
commit: c7b863ee195be4fbeeea6cc42cb24ec5f4ff2934 [6/154] net: ethernet: mtk=
_eth_soc: Add LRO support
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: arc-randconfig-r072-20260515 (https://download.01.org/0day-ci/archi=
ve/20260515/202605152231.8FnPq8nP-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605152231.8FnPq8nP-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/mediatek/mtk_eth_soc.c:5744 mtk_probe() error: buffer =
overflow 'eth->irq_pdma' 4 <=3D 4

vim +5744 drivers/net/ethernet/mediatek/mtk_eth_soc.c

04c7aaccdcf60a0 Daniel Golle       2025-07-02  5504 =20
656e705243fd0c2 John Crispin       2016-03-08  5505  static int mtk_probe(s=
truct platform_device *pdev)
656e705243fd0c2 John Crispin       2016-03-08  5506  {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5507  	struct resource *res =
=3D NULL;
656e705243fd0c2 John Crispin       2016-03-08  5508  	struct device_node *m=
ac_np;
c7b863ee195be4f Mason Chang        2025-03-21  5509  	u8 lro_irq, lro_ring;
656e705243fd0c2 John Crispin       2016-03-08  5510  	struct mtk_eth *eth;
b8e7ee1aec16593 Mason Chang        2025-03-19  5511  	char *irqname;
b8fc9f30821ec0c Ren=C3=A9 van Dorst     2019-08-25  5512  	int err, i;
656e705243fd0c2 John Crispin       2016-03-08  5513 =20
656e705243fd0c2 John Crispin       2016-03-08  5514  	eth =3D devm_kzalloc(=
&pdev->dev, sizeof(*eth), GFP_KERNEL);
656e705243fd0c2 John Crispin       2016-03-08  5515  	if (!eth)
656e705243fd0c2 John Crispin       2016-03-08  5516  		return -ENOMEM;
656e705243fd0c2 John Crispin       2016-03-08  5517 =20
eda7d46da443e15 Ryder Lee          2018-04-16  5518  	eth->soc =3D of_devic=
e_get_match_data(&pdev->dev);
2ec50f574e8198b Sean Wang          2017-07-31  5519 =20
549e5495467ac2a Sean Wang          2016-09-01  5520  	eth->dev =3D &pdev->d=
ev;
d776a57e4a284b3 Felix Fietkau      2022-04-05  5521  	eth->dma_dev =3D &pde=
v->dev;
566495de16580a3 YueHaibing         2019-08-01  5522  	eth->base =3D devm_pl=
atform_ioremap_resource(pdev, 0);
621e49f6d80a731 Vladimir Zapolskiy 2016-03-23  5523  	if (IS_ERR(eth->base))
621e49f6d80a731 Vladimir Zapolskiy 2016-03-23  5524  		return PTR_ERR(eth->=
base);
656e705243fd0c2 John Crispin       2016-03-08  5525 =20
160d3a9b192985b Lorenzo Bianconi   2022-05-20  5526  	if (MTK_HAS_CAPS(eth-=
>soc->caps, MTK_SOC_MT7628))
296c9120752bab9 Stefan Roese       2019-08-16  5527  		eth->ip_align =3D NE=
T_IP_ALIGN;
296c9120752bab9 Stefan Roese       2019-08-16  5528 =20
2d75891ebc09ba9 Daniel Golle       2023-08-22  5529  	if (MTK_HAS_CAPS(eth-=
>soc->caps, MTK_36BIT_DMA)) {
cae1f1c36661f28 Daniel Golle       2024-01-24  5530  		err =3D dma_set_mask=
(&pdev->dev, DMA_BIT_MASK(36));
cae1f1c36661f28 Daniel Golle       2024-01-24  5531  		if (!err)
cae1f1c36661f28 Daniel Golle       2024-01-24  5532  			err =3D dma_set_coh=
erent_mask(&pdev->dev, DMA_BIT_MASK(32));
cae1f1c36661f28 Daniel Golle       2024-01-24  5533 =20
2d75891ebc09ba9 Daniel Golle       2023-08-22  5534  		if (err) {
2d75891ebc09ba9 Daniel Golle       2023-08-22  5535  			dev_err(&pdev->dev,=
 "Wrong DMA config\n");
2d75891ebc09ba9 Daniel Golle       2023-08-22  5536  			return -EINVAL;
2d75891ebc09ba9 Daniel Golle       2023-08-22  5537  		}
2d75891ebc09ba9 Daniel Golle       2023-08-22  5538  	}
2d75891ebc09ba9 Daniel Golle       2023-08-22  5539 =20
656e705243fd0c2 John Crispin       2016-03-08  5540  	spin_lock_init(&eth->=
page_lock);
5cce0322cf8cd2c John Crispin       2017-06-19  5541  	spin_lock_init(&eth->=
tx_irq_lock);
5cce0322cf8cd2c John Crispin       2017-06-19  5542  	spin_lock_init(&eth->=
rx_irq_lock);
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5543  	spin_lock_init(&eth->=
dim_lock);
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5544 =20
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5545  	eth->rx_dim.mode =3D =
DIM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5546  	INIT_WORK(&eth->rx_di=
m.work, mtk_dim_rx);
93b2591ad0d0c1d Lorenzo Bianconi   2023-01-14  5547  	INIT_DELAYED_WORK(&et=
h->reset.monitor_work, mtk_hw_reset_monitor_work);
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5548 =20
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5549  	eth->tx_dim.mode =3D =
DIM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d8 Felix Fietkau      2021-04-22  5550  	INIT_WORK(&eth->tx_di=
m.work, mtk_dim_tx);
656e705243fd0c2 John Crispin       2016-03-08  5551 =20
296c9120752bab9 Stefan Roese       2019-08-16  5552  	if (!MTK_HAS_CAPS(eth=
->soc->caps, MTK_SOC_MT7628)) {
656e705243fd0c2 John Crispin       2016-03-08  5553  		eth->ethsys =3D sysc=
on_regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c2 John Crispin       2016-03-08  5554  							      "mediatek=
,ethsys");
656e705243fd0c2 John Crispin       2016-03-08  5555  		if (IS_ERR(eth->eths=
ys)) {
656e705243fd0c2 John Crispin       2016-03-08  5556  			dev_err(&pdev->dev,=
 "no ethsys regmap found\n");
656e705243fd0c2 John Crispin       2016-03-08  5557  			return PTR_ERR(eth-=
>ethsys);
656e705243fd0c2 John Crispin       2016-03-08  5558  		}
296c9120752bab9 Stefan Roese       2019-08-16  5559  	}
656e705243fd0c2 John Crispin       2016-03-08  5560 =20
7093f9d80c7cb82 Sean Wang          2019-06-01  5561  	if (MTK_HAS_CAPS(eth-=
>soc->caps, MTK_INFRA)) {
7093f9d80c7cb82 Sean Wang          2019-06-01  5562  		eth->infra =3D sysco=
n_regmap_lookup_by_phandle(pdev->dev.of_node,
7093f9d80c7cb82 Sean Wang          2019-06-01  5563  							     "mediatek,=
infracfg");
7093f9d80c7cb82 Sean Wang          2019-06-01  5564  		if (IS_ERR(eth->infr=
a)) {
7093f9d80c7cb82 Sean Wang          2019-06-01  5565  			dev_err(&pdev->dev,=
 "no infracfg regmap found\n");
7093f9d80c7cb82 Sean Wang          2019-06-01  5566  			return PTR_ERR(eth-=
>infra);
7093f9d80c7cb82 Sean Wang          2019-06-01  5567  		}
7093f9d80c7cb82 Sean Wang          2019-06-01  5568  	}
7093f9d80c7cb82 Sean Wang          2019-06-01  5569 =20
d776a57e4a284b3 Felix Fietkau      2022-04-05  5570  	if (of_dma_is_coheren=
t(pdev->dev.of_node)) {
d776a57e4a284b3 Felix Fietkau      2022-04-05  5571  		struct regmap *cci;
d776a57e4a284b3 Felix Fietkau      2022-04-05  5572 =20
d776a57e4a284b3 Felix Fietkau      2022-04-05  5573  		cci =3D syscon_regma=
p_lookup_by_phandle(pdev->dev.of_node,
4263f77a5144f70 Lorenzo Bianconi   2022-04-11  5574  						      "cci-contr=
ol-port");
d776a57e4a284b3 Felix Fietkau      2022-04-05  5575  		/* enable CPU/bus co=
herency */
d776a57e4a284b3 Felix Fietkau      2022-04-05  5576  		if (!IS_ERR(cci))
d776a57e4a284b3 Felix Fietkau      2022-04-05  5577  			regmap_write(cci, 0=
, 3);
d776a57e4a284b3 Felix Fietkau      2022-04-05  5578  	}
d776a57e4a284b3 Felix Fietkau      2022-04-05  5579 =20
42c03844e93d564 Sean Wang          2017-07-31  5580  	if (MTK_HAS_CAPS(eth-=
>soc->caps, MTK_SGMII)) {
2a3ec7ae313310c Daniel Golle       2023-03-19  5581  		err =3D mtk_sgmii_in=
it(eth);
9ffee4a8276c734 Sean Wang          2019-06-01  5582 =20
9ffee4a8276c734 Sean Wang          2019-06-01  5583  		if (err)
9ffee4a8276c734 Sean Wang          2019-06-01  5584  			return err;
42c03844e93d564 Sean Wang          2017-07-31  5585  	}
42c03844e93d564 Sean Wang          2017-07-31  5586 =20
243dc5fb4697a0d Sean Wang          2017-12-20  5587  	if (eth->soc->require=
d_pctl) {
656e705243fd0c2 John Crispin       2016-03-08  5588  		eth->pctl =3D syscon=
_regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c2 John Crispin       2016-03-08  5589  							    "mediatek,p=
ctl");
656e705243fd0c2 John Crispin       2016-03-08  5590  		if (IS_ERR(eth->pctl=
)) {
656e705243fd0c2 John Crispin       2016-03-08  5591  			dev_err(&pdev->dev,=
 "no pctl regmap found\n");
2a3ec7ae313310c Daniel Golle       2023-03-19  5592  			err =3D PTR_ERR(eth=
->pctl);
2a3ec7ae313310c Daniel Golle       2023-03-19  5593  			goto err_destroy_sg=
mii;
656e705243fd0c2 John Crispin       2016-03-08  5594  		}
243dc5fb4697a0d Sean Wang          2017-12-20  5595  	}
656e705243fd0c2 John Crispin       2016-03-08  5596 =20
a008e2a84e6b2b5 Lorenzo Bianconi   2023-07-25  5597  	if (mtk_is_netsys_v2_=
or_greater(eth)) {
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5598  		res =3D platform_get=
_resource(pdev, IORESOURCE_MEM, 0);
2a3ec7ae313310c Daniel Golle       2023-03-19  5599  		if (!res) {
2a3ec7ae313310c Daniel Golle       2023-03-19  5600  			err =3D -EINVAL;
2a3ec7ae313310c Daniel Golle       2023-03-19  5601  			goto err_destroy_sg=
mii;
2a3ec7ae313310c Daniel Golle       2023-03-19  5602  		}
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5603 =20
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5604  		if (MTK_HAS_CAPS(eth=
->soc->caps, MTK_SRAM)) {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5605  			eth->sram_pool =3D =
of_gen_pool_get(pdev->dev.of_node,
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5606  							 "sram", 0);
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5607  			if (!eth->sram_pool=
) {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5608  				if (!mtk_is_netsys=
_v3_or_greater(eth)) {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5609  					err =3D mtk_setup=
_legacy_sram(eth, res);
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5610  					if (err)
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5611  						goto err_destroy=
_sgmii;
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5612  				} else {
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5613  					dev_err(&pdev->de=
v,
04c7aaccdcf60a0 Daniel Golle       2025-07-02  5614  						"Could not get S=
RAM pool\n");
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5615  					err =3D -EINVAL;
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5616  					goto err_destroy_=
sgmii;
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5617  				}
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5618  			}
ebb1e4f9cf38da2 Daniel Golle       2023-08-22  5619  		}
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5620  	}
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5621 =20
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5622  	if (eth->soc->offload=
_version) {
804775dfc2885e9 Felix Fietkau      2022-04-05  5623  		for (i =3D 0;; i++) {
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5624  			struct device_node =
*np;
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5625  			phys_addr_t wdma_ph=
y;
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5626  			u32 wdma_base;
804775dfc2885e9 Felix Fietkau      2022-04-05  5627 =20
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5628  			if (i >=3D ARRAY_SI=
ZE(eth->soc->reg_map->wdma_base))
804775dfc2885e9 Felix Fietkau      2022-04-05  5629  				break;
804775dfc2885e9 Felix Fietkau      2022-04-05  5630 =20
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5631  			np =3D of_parse_pha=
ndle(pdev->dev.of_node,
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5632  					      "mediatek,w=
ed", i);
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5633  			if (!np)
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5634  				break;
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5635 =20
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5636  			wdma_base =3D eth->=
soc->reg_map->wdma_base[i];
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5637  			wdma_phy =3D res ? =
res->start + wdma_base : 0;
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5638  			mtk_wed_add_hw(np, =
eth, eth->base + wdma_base,
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5639  				       wdma_phy, i=
);
de84a090d99a3b9 Lorenzo Bianconi   2022-09-20  5640  		}
804775dfc2885e9 Felix Fietkau      2022-04-05  5641  	}
804775dfc2885e9 Felix Fietkau      2022-04-05  5642 =20
b8e7ee1aec16593 Mason Chang        2025-03-19  5643  	err =3D mtk_get_irqs_=
fe(pdev, eth);
b8e7ee1aec16593 Mason Chang        2025-03-19  5644  	if (err)
b8e7ee1aec16593 Mason Chang        2025-03-19  5645  		goto err_wed_exit;
b8e7ee1aec16593 Mason Chang        2025-03-19  5646 =20
b8e7ee1aec16593 Mason Chang        2025-03-19  5647  	if (MTK_HAS_CAPS(eth-=
>soc->caps, MTK_PDMA_INT)) {
b8e7ee1aec16593 Mason Chang        2025-03-19  5648  		err =3D mtk_get_irqs=
_pdma(pdev, eth);
ee85b483fefbbeb Frank Wunderlich   2025-06-19  5649  		if (err)
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5650  			goto err_wed_exit;
b8e7ee1aec16593 Mason Chang        2025-03-19  5651  	}
ee85b483fefbbeb Frank Wunderlich   2025-06-19  5652 =20
549e5495467ac2a Sean Wang          2016-09-01  5653  	for (i =3D 0; i < ARR=
AY_SIZE(eth->clks); i++) {
549e5495467ac2a Sean Wang          2016-09-01  5654  		eth->clks[i] =3D dev=
m_clk_get(eth->dev,
549e5495467ac2a Sean Wang          2016-09-01  5655  					    mtk_clks_sour=
ce_name[i]);
549e5495467ac2a Sean Wang          2016-09-01  5656  		if (IS_ERR(eth->clks=
[i])) {
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5657  			if (PTR_ERR(eth->cl=
ks[i]) =3D=3D -EPROBE_DEFER) {
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5658  				err =3D -EPROBE_DE=
FER;
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5659  				goto err_wed_exit;
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5660  			}
2ec50f574e8198b Sean Wang          2017-07-31  5661  			if (eth->soc->requi=
red_clks & BIT(i)) {
2ec50f574e8198b Sean Wang          2017-07-31  5662  				dev_err(&pdev->dev=
, "clock %s not found\n",
2ec50f574e8198b Sean Wang          2017-07-31  5663  					mtk_clks_source_n=
ame[i]);
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5664  				err =3D -EINVAL;
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5665  				goto err_wed_exit;
2ec50f574e8198b Sean Wang          2017-07-31  5666  			}
2ec50f574e8198b Sean Wang          2017-07-31  5667  			eth->clks[i] =3D NU=
LL;
549e5495467ac2a Sean Wang          2016-09-01  5668  		}
549e5495467ac2a Sean Wang          2016-09-01  5669  	}
656e705243fd0c2 John Crispin       2016-03-08  5670 =20
656e705243fd0c2 John Crispin       2016-03-08  5671  	eth->msg_enable =3D n=
etif_msg_init(mtk_msg_level, MTK_DEFAULT_MSG_ENABLE);
7c78b4ad9bbdbe0 John Crispin       2016-04-08  5672  	INIT_WORK(&eth->pendi=
ng_work, mtk_pending_work);
656e705243fd0c2 John Crispin       2016-03-08  5673 =20
a9724b9c477f63b Lorenzo Bianconi   2023-01-14  5674  	err =3D mtk_hw_init(e=
th, false);
656e705243fd0c2 John Crispin       2016-03-08  5675  	if (err)
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5676  		goto err_wed_exit;
656e705243fd0c2 John Crispin       2016-03-08  5677 =20
2d14ba7228b0c2e Sean Wang          2018-07-28  5678  	eth->hwlro =3D MTK_HA=
S_CAPS(eth->soc->caps, MTK_HWLRO);
983e1a6c95abf80 Nelson Chang       2016-10-06  5679 =20
656e705243fd0c2 John Crispin       2016-03-08  5680  	for_each_child_of_nod=
e(pdev->dev.of_node, mac_np) {
656e705243fd0c2 John Crispin       2016-03-08  5681  		if (!of_device_is_co=
mpatible(mac_np,
656e705243fd0c2 John Crispin       2016-03-08  5682  					     "mediatek,et=
h-mac"))
656e705243fd0c2 John Crispin       2016-03-08  5683  			continue;
656e705243fd0c2 John Crispin       2016-03-08  5684 =20
656e705243fd0c2 John Crispin       2016-03-08  5685  		if (!of_device_is_av=
ailable(mac_np))
656e705243fd0c2 John Crispin       2016-03-08  5686  			continue;
656e705243fd0c2 John Crispin       2016-03-08  5687 =20
656e705243fd0c2 John Crispin       2016-03-08  5688  		err =3D mtk_add_mac(=
eth, mac_np);
cf36dd2f7793e8b Nishka Dasgupta    2019-07-16  5689  		if (err) {
cf36dd2f7793e8b Nishka Dasgupta    2019-07-16  5690  			of_node_put(mac_np);
8a8a9e89f801ce5 Sean Wang          2016-09-14  5691  			goto err_deinit_hw;
656e705243fd0c2 John Crispin       2016-03-08  5692  		}
cf36dd2f7793e8b Nishka Dasgupta    2019-07-16  5693  	}
656e705243fd0c2 John Crispin       2016-03-08  5694 =20
b8e7ee1aec16593 Mason Chang        2025-03-19  5695  	err =3D mtk_napi_init=
(eth);
b8e7ee1aec16593 Mason Chang        2025-03-19  5696  	if (err)
b8e7ee1aec16593 Mason Chang        2025-03-19  5697  		goto err_free_dev;
b8e7ee1aec16593 Mason Chang        2025-03-19  5698 =20
889bcbdeee57376 Bj=C3=B8rn Mork         2019-01-30  5699  	if (MTK_HAS_CAPS=
(eth->soc->caps, MTK_SHARED_INT)) {
b8e7ee1aec16593 Mason Chang        2025-03-19  5700  		err =3D devm_request=
_irq(eth->dev, eth->irq_fe[MTK_FE_IRQ_SHARED],
889bcbdeee57376 Bj=C3=B8rn Mork         2019-01-30  5701  				       mtk_ha=
ndle_irq, 0,
889bcbdeee57376 Bj=C3=B8rn Mork         2019-01-30  5702  				       dev_na=
me(eth->dev), eth);
889bcbdeee57376 Bj=C3=B8rn Mork         2019-01-30  5703  	} else {
b8e7ee1aec16593 Mason Chang        2025-03-19  5704  		irqname =3D devm_kas=
printf(eth->dev, GFP_KERNEL, "%s TX",
b8e7ee1aec16593 Mason Chang        2025-03-19  5705  					 dev_name(eth->de=
v));
b8e7ee1aec16593 Mason Chang        2025-03-19  5706  		err =3D devm_request=
_irq(eth->dev, eth->irq_fe[MTK_FE_IRQ_TX],
889bcbdeee57376 Bj=C3=B8rn Mork         2019-01-30  5707  				       mtk_ha=
ndle_irq_tx, 0,
b8e7ee1aec16593 Mason Chang        2025-03-19  5708  				       irqname, et=
h);
85574dbf9d12b39 Sean Wang          2016-09-14  5709  		if (err)
85574dbf9d12b39 Sean Wang          2016-09-14  5710  			goto err_free_dev;
85574dbf9d12b39 Sean Wang          2016-09-14  5711 =20
b8e7ee1aec16593 Mason Chang        2025-03-19  5712  		if (MTK_HAS_CAPS(eth=
->soc->caps, MTK_PDMA_INT)) {
b8e7ee1aec16593 Mason Chang        2025-03-19  5713  			irqname =3D devm_ka=
sprintf(eth->dev, GFP_KERNEL, "%s PDMA RX %d",
b8e7ee1aec16593 Mason Chang        2025-03-19  5714  						 dev_name(eth->d=
ev), 0);
b8e7ee1aec16593 Mason Chang        2025-03-19  5715  			err =3D devm_reques=
t_irq(eth->dev, eth->irq_pdma[0],
b8e7ee1aec16593 Mason Chang        2025-03-19  5716  					       mtk_handle=
_irq_rx, IRQF_SHARED,
b8e7ee1aec16593 Mason Chang        2025-03-19  5717  					       irqname, &=
eth->rx_napi[0]);
b8e7ee1aec16593 Mason Chang        2025-03-19  5718  			if (err)
b8e7ee1aec16593 Mason Chang        2025-03-19  5719  				goto err_free_dev;
b8e7ee1aec16593 Mason Chang        2025-03-19  5720 =20
b8e7ee1aec16593 Mason Chang        2025-03-19  5721  			if (MTK_HAS_CAPS(et=
h->soc->caps, MTK_RSS)) {
b8e7ee1aec16593 Mason Chang        2025-03-19  5722  				for (i =3D 1; i < =
MTK_RX_RSS_NUM(eth); i++) {
b8e7ee1aec16593 Mason Chang        2025-03-19  5723  					irqname =3D devm_=
kasprintf(eth->dev, GFP_KERNEL,
b8e7ee1aec16593 Mason Chang        2025-03-19  5724  								 "%s PDMA RX %=
d",
b8e7ee1aec16593 Mason Chang        2025-03-19  5725  								 dev_name(eth-=
>dev), i);
b8e7ee1aec16593 Mason Chang        2025-03-19  5726  					err =3D devm_requ=
est_irq(eth->dev,
b8e7ee1aec16593 Mason Chang        2025-03-19  5727  							       eth->irq=
_pdma[MTK_RSS_RING(i)],
b8e7ee1aec16593 Mason Chang        2025-03-19  5728  							       mtk_hand=
le_irq_rx, IRQF_SHARED,
b8e7ee1aec16593 Mason Chang        2025-03-19  5729  							       irqname,
b8e7ee1aec16593 Mason Chang        2025-03-19  5730  							       &eth->rx=
_napi[MTK_RSS_RING(i)]);
b8e7ee1aec16593 Mason Chang        2025-03-19  5731  					if (err)
b8e7ee1aec16593 Mason Chang        2025-03-19  5732  						goto err_free_de=
v;
b8e7ee1aec16593 Mason Chang        2025-03-19  5733  				}
889bcbdeee57376 Bj=C3=B8rn Mork         2019-01-30  5734  			}
c7b863ee195be4f Mason Chang        2025-03-21  5735 =20
c7b863ee195be4f Mason Chang        2025-03-21  5736  			if (eth->hwlro) {
c7b863ee195be4f Mason Chang        2025-03-21  5737  				for (i =3D 0; i < =
MTK_HW_LRO_RING_NUM(eth); i++) {
c7b863ee195be4f Mason Chang        2025-03-21  5738  					lro_irq =3D MTK_H=
W_LRO_IRQ(eth, i);
c7b863ee195be4f Mason Chang        2025-03-21  5739  					lro_ring =3D MTK_=
HW_LRO_RING(eth, i);
c7b863ee195be4f Mason Chang        2025-03-21  5740  					irqname =3D devm_=
kasprintf(eth->dev, GFP_KERNEL,
c7b863ee195be4f Mason Chang        2025-03-21  5741  								 "%s LRO RX %d=
",
c7b863ee195be4f Mason Chang        2025-03-21  5742  								 dev_name(eth-=
>dev), i);
c7b863ee195be4f Mason Chang        2025-03-21  5743  					err =3D devm_requ=
est_irq(eth->dev,
c7b863ee195be4f Mason Chang        2025-03-21 @5744  							       eth->irq=
_pdma[lro_irq],
c7b863ee195be4f Mason Chang        2025-03-21  5745  							       mtk_hand=
le_irq_rx, IRQF_SHARED,
c7b863ee195be4f Mason Chang        2025-03-21  5746  							       irqname,
c7b863ee195be4f Mason Chang        2025-03-21  5747  							       &eth->rx=
_napi[lro_ring]);
c7b863ee195be4f Mason Chang        2025-03-21  5748  					if (err)
c7b863ee195be4f Mason Chang        2025-03-21  5749  						goto err_free_de=
v;
c7b863ee195be4f Mason Chang        2025-03-21  5750  				}
c7b863ee195be4f Mason Chang        2025-03-21  5751  			}
b8e7ee1aec16593 Mason Chang        2025-03-19  5752  		} else {
b8e7ee1aec16593 Mason Chang        2025-03-19  5753  			irqname =3D devm_ka=
sprintf(eth->dev, GFP_KERNEL, "%s RX",
b8e7ee1aec16593 Mason Chang        2025-03-19  5754  						 dev_name(eth->d=
ev));
b8e7ee1aec16593 Mason Chang        2025-03-19  5755  			err =3D devm_reques=
t_irq(eth->dev, eth->irq_fe[MTK_FE_IRQ_RX],
b8e7ee1aec16593 Mason Chang        2025-03-19  5756  					       mtk_handle=
_irq_rx, 0,
b8e7ee1aec16593 Mason Chang        2025-03-19  5757  					       irqname, &=
eth->rx_napi[0]);
85574dbf9d12b39 Sean Wang          2016-09-14  5758  			if (err)
85574dbf9d12b39 Sean Wang          2016-09-14  5759  				goto err_free_dev;
b8e7ee1aec16593 Mason Chang        2025-03-19  5760  		}
b8e7ee1aec16593 Mason Chang        2025-03-19  5761  	}
85574dbf9d12b39 Sean Wang          2016-09-14  5762 =20
296c9120752bab9 Stefan Roese       2019-08-16  5763  	/* No MT7628/88 suppo=
rt yet */
296c9120752bab9 Stefan Roese       2019-08-16  5764  	if (!MTK_HAS_CAPS(eth=
->soc->caps, MTK_SOC_MT7628)) {
85574dbf9d12b39 Sean Wang          2016-09-14  5765  		err =3D mtk_mdio_ini=
t(eth);
85574dbf9d12b39 Sean Wang          2016-09-14  5766  		if (err)
85574dbf9d12b39 Sean Wang          2016-09-14  5767  			goto err_free_dev;
296c9120752bab9 Stefan Roese       2019-08-16  5768  	}
85574dbf9d12b39 Sean Wang          2016-09-14  5769 =20
ba37b7caf1ed239 Felix Fietkau      2021-03-24  5770  	if (eth->soc->offload=
_version) {
dee4dd10c79aaca Elad Yifee         2024-06-07  5771  		u8 ppe_num =3D eth->=
soc->ppe_num;
329bce5139cfb00 Lorenzo Bianconi   2022-09-20  5772 =20
dee4dd10c79aaca Elad Yifee         2024-06-07  5773  		ppe_num =3D min_t(u8=
, ARRAY_SIZE(eth->ppe), ppe_num);
dee4dd10c79aaca Elad Yifee         2024-06-07  5774  		for (i =3D 0; i < pp=
e_num; i++) {
dee4dd10c79aaca Elad Yifee         2024-06-07  5775  			u32 ppe_addr =3D et=
h->soc->reg_map->ppe_base;
4ff1a3fca766aa8 Lorenzo Bianconi   2022-09-20  5776 =20
dee4dd10c79aaca Elad Yifee         2024-06-07  5777  			ppe_addr +=3D (i =
=3D=3D 2 ? 0xc00 : i * 0x400);
3fbe4d8c0e53e40 Daniel Golle       2023-03-19  5778  			eth->ppe[i] =3D mtk=
_ppe_init(eth, eth->base + ppe_addr, i);
3fbe4d8c0e53e40 Daniel Golle       2023-03-19  5779 =20
4ff1a3fca766aa8 Lorenzo Bianconi   2022-09-20  5780  			if (!eth->ppe[i]) {
1ccc723b5829d63 Felix Fietkau      2022-04-05  5781  				err =3D -ENOMEM;
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5782  				goto err_deinit_pp=
e;
1ccc723b5829d63 Felix Fietkau      2022-04-05  5783  			}
dee4dd10c79aaca Elad Yifee         2024-06-07  5784  			err =3D mtk_eth_off=
load_init(eth, i);
502e84e2382d926 Felix Fietkau      2021-03-24  5785 =20
502e84e2382d926 Felix Fietkau      2021-03-24  5786  			if (err)
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5787  				goto err_deinit_pp=
e;
ba37b7caf1ed239 Felix Fietkau      2021-03-24  5788  		}
dee4dd10c79aaca Elad Yifee         2024-06-07  5789  	}
ba37b7caf1ed239 Felix Fietkau      2021-03-24  5790 =20
85574dbf9d12b39 Sean Wang          2016-09-14  5791  	for (i =3D 0; i < MTK=
_MAX_DEVS; i++) {
85574dbf9d12b39 Sean Wang          2016-09-14  5792  		if (!eth->netdev[i])
85574dbf9d12b39 Sean Wang          2016-09-14  5793  			continue;
85574dbf9d12b39 Sean Wang          2016-09-14  5794 =20
85574dbf9d12b39 Sean Wang          2016-09-14  5795  		err =3D register_net=
dev(eth->netdev[i]);
85574dbf9d12b39 Sean Wang          2016-09-14  5796  		if (err) {
85574dbf9d12b39 Sean Wang          2016-09-14  5797  			dev_err(eth->dev, "=
error bringing up device\n");
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5798  			goto err_deinit_ppe;
85574dbf9d12b39 Sean Wang          2016-09-14  5799  		} else
85574dbf9d12b39 Sean Wang          2016-09-14  5800  			netif_info(eth, pro=
be, eth->netdev[i],
85574dbf9d12b39 Sean Wang          2016-09-14  5801  				   "mediatek frame=
 engine at 0x%08lx, irq %d\n",
b8e7ee1aec16593 Mason Chang        2025-03-19  5802  				   eth->netdev[i]-=
>base_addr, eth->irq_fe[MTK_FE_IRQ_SHARED]);
85574dbf9d12b39 Sean Wang          2016-09-14  5803  	}
85574dbf9d12b39 Sean Wang          2016-09-14  5804 =20
656e705243fd0c2 John Crispin       2016-03-08  5805  	/* we run 2 devices o=
n the same DMA ring so we need a dummy device
656e705243fd0c2 John Crispin       2016-03-08  5806  	 * for NAPI to work
656e705243fd0c2 John Crispin       2016-03-08  5807  	 */
b209bd6d0bffb89 Breno Leitao       2024-04-22  5808  	eth->dummy_dev =3D al=
loc_netdev_dummy(0);
b209bd6d0bffb89 Breno Leitao       2024-04-22  5809  	if (!eth->dummy_dev) {
b209bd6d0bffb89 Breno Leitao       2024-04-22  5810  		err =3D -ENOMEM;
b209bd6d0bffb89 Breno Leitao       2024-04-22  5811  		dev_err(eth->dev, "f=
ailed to allocated dummy device\n");
b209bd6d0bffb89 Breno Leitao       2024-04-22  5812  		goto err_unreg_netde=
v;
b209bd6d0bffb89 Breno Leitao       2024-04-22  5813  	}
b209bd6d0bffb89 Breno Leitao       2024-04-22  5814  	netif_napi_add(eth->d=
ummy_dev, &eth->tx_napi, mtk_napi_tx);
b8e7ee1aec16593 Mason Chang        2025-03-19  5815  	netif_napi_add(eth->d=
ummy_dev, &eth->rx_napi[0].napi, mtk_napi_rx);
b8e7ee1aec16593 Mason Chang        2025-03-19  5816 =20
b8e7ee1aec16593 Mason Chang        2025-03-19  5817  	if (MTK_HAS_CAPS(eth-=
>soc->caps, MTK_RSS)) {
b8e7ee1aec16593 Mason Chang        2025-03-19  5818  		for (i =3D 1; i < MT=
K_RX_RSS_NUM(eth); i++)
b8e7ee1aec16593 Mason Chang        2025-03-19  5819  			netif_napi_add(eth-=
>dummy_dev, &eth->rx_napi[MTK_RSS_RING(i)].napi,
b8e7ee1aec16593 Mason Chang        2025-03-19  5820  				       mtk_napi_rx=
);
b8e7ee1aec16593 Mason Chang        2025-03-19  5821  	}
656e705243fd0c2 John Crispin       2016-03-08  5822 =20
c7b863ee195be4f Mason Chang        2025-03-21  5823  	if (eth->hwlro) {
c7b863ee195be4f Mason Chang        2025-03-21  5824  		for (i =3D 0; i < MT=
K_HW_LRO_RING_NUM(eth); i++) {
c7b863ee195be4f Mason Chang        2025-03-21  5825  			netif_napi_add(eth-=
>dummy_dev, &eth->rx_napi[MTK_HW_LRO_RING(eth, i)].napi,
c7b863ee195be4f Mason Chang        2025-03-21  5826  				       mtk_napi_rx=
);
c7b863ee195be4f Mason Chang        2025-03-21  5827  		}
c7b863ee195be4f Mason Chang        2025-03-21  5828  	}
c7b863ee195be4f Mason Chang        2025-03-21  5829 =20
656e705243fd0c2 John Crispin       2016-03-08  5830  	platform_set_drvdata(=
pdev, eth);
93b2591ad0d0c1d Lorenzo Bianconi   2023-01-14  5831  	schedule_delayed_work=
(&eth->reset.monitor_work,
93b2591ad0d0c1d Lorenzo Bianconi   2023-01-14  5832  			      MTK_DMA_MONIT=
OR_TIMEOUT);
656e705243fd0c2 John Crispin       2016-03-08  5833 =20
656e705243fd0c2 John Crispin       2016-03-08  5834  	return 0;
656e705243fd0c2 John Crispin       2016-03-08  5835 =20
b209bd6d0bffb89 Breno Leitao       2024-04-22  5836  err_unreg_netdev:
b209bd6d0bffb89 Breno Leitao       2024-04-22  5837  	mtk_unreg_dev(eth);
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5838  err_deinit_ppe:
603ea5e7ffa73c7 Yan Cangang        2022-11-20  5839  	mtk_ppe_deinit(eth);
8a8a9e89f801ce5 Sean Wang          2016-09-14  5840  	mtk_mdio_cleanup(eth);
656e705243fd0c2 John Crispin       2016-03-08  5841  err_free_dev:
8a8a9e89f801ce5 Sean Wang          2016-09-14  5842  	mtk_free_dev(eth);
8a8a9e89f801ce5 Sean Wang          2016-09-14  5843  err_deinit_hw:
8a8a9e89f801ce5 Sean Wang          2016-09-14  5844  	mtk_hw_deinit(eth);
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5845  err_wed_exit:
b3d0d98179d62f9 Yang Yingliang     2022-10-17  5846  	mtk_wed_exit();
2a3ec7ae313310c Daniel Golle       2023-03-19  5847  err_destroy_sgmii:
2a3ec7ae313310c Daniel Golle       2023-03-19  5848  	mtk_sgmii_destroy(eth=
);
8a8a9e89f801ce5 Sean Wang          2016-09-14  5849 =20
656e705243fd0c2 John Crispin       2016-03-08  5850  	return err;
656e705243fd0c2 John Crispin       2016-03-08  5851  }
656e705243fd0c2 John Crispin       2016-03-08  5852 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

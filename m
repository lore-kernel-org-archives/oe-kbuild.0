Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A761D17BB21
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 19:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770753121; cv=none; b=EHGn7NS9N4KkjkvBzSGKuPOtPtDgNovPwHM/in+9E1aHAA+QiJlAhp8HCf8BNODUp271Ccv8sGp/0/Noll2vL6wxyp0ApkzxDJ7iZsAGWS88hMHnmplIKt0HzgzQUwc+mX2G1Lr93UlI81bd/+FKggKNyGEb1+6NxowrMmpb7b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770753121; c=relaxed/simple;
	bh=tL5+mzXkizubGQlgcJdsgHjJSkVennEg8NBpbUd6HLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M+L7y3Y0dqStqthiqBB9+mibp/8NFJA4wDyhmL+UbE1OeXvoGDrI4idTak8GRI4j4Iu5jJpD3ZMcotAmbDDlDRRSGayPA2o8epwg4WigY8yh2noZa5zqnSlcC021RrCTgkLeubZHC/wV271+pn7W2IxBfVCQ7z0uzTp5Nn0WU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DT3fwX5K; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DT3fwX5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770753119; x=1802289119;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tL5+mzXkizubGQlgcJdsgHjJSkVennEg8NBpbUd6HLk=;
  b=DT3fwX5K7V2d9fIQdWPGERytDzfHTJrBXm3iYUtDhd2yp4SHRmmJYEmE
   3jEgx+v5vZliiIepqCDB0NPz+Egxe3mluyIgQrHq8unbHXM53pRD76c3H
   mtf2v0AGtnFqVzz68FWZHhzB8j9VHvong/0JY7pNitGjku6dbHPceZ3w6
   RXT3L9JF9RkYADljpNt3T5neAL0+HtkJ5doMCYEIqDdl+hzIr6UkLolAz
   ZosJY41A0tg5e05TR7HracLUNLs80lmDrEdCeY73rgS1/8b3f+4g87JMS
   omG9iNYl3ZMqmDK4yX8Uy6yt1C4aRVqEDv2aUyMWjoiaVLxi6VKGfJzKW
   w==;
X-CSE-ConnectionGUID: Yg0ygOVJS7GAhWR+Mtjlyw==
X-CSE-MsgGUID: rU2Ui/KdQIyKdC0tzI8TDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="59458669"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="59458669"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 11:51:58 -0800
X-CSE-ConnectionGUID: u4K9TWS5RrCN7g5/jEUysw==
X-CSE-MsgGUID: WDoJlvC1TDeyVXfDYQnxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249667418"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2026 11:51:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vptm6-00000000pMA-0JQA;
	Tue, 10 Feb 2026 19:51:54 +0000
Date: Wed, 11 Feb 2026 03:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pmdomain/mediatek/mtk-pm-domains.c:824
 scpsys_add_one_domain() error: we previously assumed 'pd->data' could be null
 (see line 799)
Message-ID: <202602110354.a2w7BlHC-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   72c395024dac5e215136cbff793455f065603b06
commit: 88914db077b6c2920b29a3ec76109a2fd3cf8d38 pmdomain: mediatek: Add su=
pport for Hardware Voter power domains
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-r072-20260210 (https://download.01.org/0day-ci/arc=
hive/20260211/202602110354.a2w7BlHC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602110354.a2w7BlHC-lkp@intel.com/

New smatch warnings:
drivers/pmdomain/mediatek/mtk-pm-domains.c:824 scpsys_add_one_domain() erro=
r: we previously assumed 'pd->data' could be null (see line 799)

Old smatch warnings:
drivers/pmdomain/mediatek/mtk-pm-domains.c:1192 scpsys_probe() warn: missin=
g unwind goto?

vim +824 drivers/pmdomain/mediatek/mtk-pm-domains.c

59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  676 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  677  static struct
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  678  generic_pm_domain *scpsys_add_one_domain(struct =
scpsys *scpsys, struct device_node *node)
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  679  {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  680  	const struct scpsys_domain_data *domain_data;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  681  	const struct scpsys_hwv_domain_data *hwv_domain=
_data;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  682  	struct scpsys_domain *pd;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  683  	struct property *prop;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  684  	const char *clk_name;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  685  	int i, ret, num_clks;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  686  	struct clk *clk;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  687  	int clk_ind =3D 0;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  688  	u32 id;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  689 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  690  	ret =3D of_property_read_u32(node, "reg", &id);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  691  	if (ret) {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  692  		dev_err(scpsys->dev, "%pOF: failed to retrieve=
 domain id from reg: %d\n",
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  693  			node, ret);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  694  		return ERR_PTR(-EINVAL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  695  	}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  696 =20
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  697  	switch (scpsys->soc_data->type) {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  698  	case SCPSYS_MTCMOS_TYPE_DIRECT_CTL:
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  699  		if (id >=3D scpsys->soc_data->num_domains) {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  700  			dev_err(scpsys->dev, "%pOF: invalid domain id=
 %d\n", node, id);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  701  			return ERR_PTR(-EINVAL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  702  		}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  703 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  704  		domain_data =3D &scpsys->soc_data->domains_dat=
a[id];
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  705  		hwv_domain_data =3D NULL;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  706 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  707  		if (domain_data->sta_mask =3D=3D 0) {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  708  			dev_err(scpsys->dev, "%pOF: undefined domain =
id %d\n", node, id);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  709  			return ERR_PTR(-EINVAL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  710  		}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  711 =20
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  712  		break;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  713  	case SCPSYS_MTCMOS_TYPE_HW_VOTER:
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  714  		if (id >=3D scpsys->soc_data->num_hwv_domains)=
 {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  715  			dev_err(scpsys->dev, "%pOF: invalid HWV domai=
n id %d\n", node, id);
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  716  			return ERR_PTR(-EINVAL);
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  717  		}
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  718 =20
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  719  		domain_data =3D NULL;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  720  		hwv_domain_data =3D &scpsys->soc_data->hwv_dom=
ains_data[id];
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  721 =20
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  722  		break;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  723  	default:
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  724  		return ERR_PTR(-EINVAL);
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  725  	}
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  726 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  727  	pd =3D devm_kzalloc(scpsys->dev, sizeof(*pd), G=
FP_KERNEL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  728  	if (!pd)
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  729  		return ERR_PTR(-ENOMEM);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  730 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  731  	pd->data =3D domain_data;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  732  	pd->hwv_data =3D hwv_domain_data;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  733  	pd->scpsys =3D scpsys;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  734 =20
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang     =
          2021-01-29  735  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
ca824b2d69c52b drivers/pmdomain/mediatek/mtk-pm-domains.c Chen-Yu Tsai     =
          2024-09-30  736  		pd->supply =3D devm_of_regulator_get_optional(=
scpsys->dev, node, "domain");
391a2e64d757a0 drivers/pmdomain/mediatek/mtk-pm-domains.c Hongbo Li        =
          2024-08-28  737  		if (IS_ERR(pd->supply))
391a2e64d757a0 drivers/pmdomain/mediatek/mtk-pm-domains.c Hongbo Li        =
          2024-08-28  738  			return dev_err_cast_probe(scpsys->dev, pd->su=
pply,
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang     =
          2021-01-29  739  				      "%pOF: failed to get power supply.\n",
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang     =
          2021-01-29  740  				      node);
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang     =
          2021-01-29  741  	}
1b18c0558d092b drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang     =
          2021-01-29  742 =20
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  743  	num_clks =3D of_clk_get_parent_count(node);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  744  	if (num_clks > 0) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  745  		/* Calculate number of subsys_clks */
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  746  		of_property_for_each_string(node, "clock-names=
", prop, clk_name) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  747  			char *subsys;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  748 =20
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  749  			subsys =3D strchr(clk_name, '-');
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  750  			if (subsys)
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  751  				pd->num_subsys_clks++;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  752  			else
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  753  				pd->num_clks++;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  754  		}
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  755 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  756  		pd->clks =3D devm_kcalloc(scpsys->dev, pd->num=
_clks, sizeof(*pd->clks), GFP_KERNEL);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  757  		if (!pd->clks)
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  758  			return ERR_PTR(-ENOMEM);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  759 =20
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  760  		pd->subsys_clks =3D devm_kcalloc(scpsys->dev, =
pd->num_subsys_clks,
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  761  					       sizeof(*pd->subsys_clks), GFP_KERNEL=
);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  762  		if (!pd->subsys_clks)
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  763  			return ERR_PTR(-ENOMEM);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  764 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  765  	}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  766 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  767  	for (i =3D 0; i < pd->num_clks; i++) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  768  		clk =3D of_clk_get(node, i);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  769  		if (IS_ERR(clk)) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  770  			ret =3D PTR_ERR(clk);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  771  			dev_err_probe(scpsys->dev, ret,
385ba16dbf9eda drivers/soc/mediatek/mtk-pm-domains.c      Christophe JAILLE=
T         2022-08-05  772  				      "%pOF: failed to get clk at index %d\n=
", node, i);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  773  			goto err_put_clocks;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  774  		}
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  775 =20
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  776  		pd->clks[clk_ind++].clk =3D clk;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  777  	}
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  778 =20
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  779  	for (i =3D 0; i < pd->num_subsys_clks; i++) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  780  		clk =3D of_clk_get(node, i + clk_ind);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  781  		if (IS_ERR(clk)) {
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  782  			ret =3D PTR_ERR(clk);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  783  			dev_err_probe(scpsys->dev, ret,
385ba16dbf9eda drivers/soc/mediatek/mtk-pm-domains.c      Christophe JAILLE=
T         2022-08-05  784  				      "%pOF: failed to get clk at index %d\n=
", node,
385ba16dbf9eda drivers/soc/mediatek/mtk-pm-domains.c      Christophe JAILLE=
T         2022-08-05  785  				      i + clk_ind);
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  786  			goto err_put_subsys_clocks;
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  787  		}
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  788 =20
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  789  		pd->subsys_clks[i].clk =3D clk;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  790  	}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  791 =20
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  792  	if (scpsys->domains[id]) {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  793  		ret =3D -EINVAL;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  794  		dev_err(scpsys->dev,
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  795  			"power domain with id %d already exists, chec=
k your device-tree\n", id);
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  796  		goto err_put_subsys_clocks;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  797  	}
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  798 =20
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25 @799  	if (pd->data && pd->data->name)
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  800  		pd->genpd.name =3D pd->data->name;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  801  	else if (pd->hwv_data && pd->hwv_data->name)
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  802  		pd->genpd.name =3D pd->hwv_data->name;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  803  	else
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  804  		pd->genpd.name =3D node->name;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  805 =20
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  806  	if (scpsys->soc_data->type =3D=3D SCPSYS_MTCMOS=
_TYPE_DIRECT_CTL) {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  807  		pd->genpd.power_off =3D scpsys_power_off;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  808  		pd->genpd.power_on =3D scpsys_power_on;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  809  	} else {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  810  		pd->genpd.power_off =3D scpsys_hwv_power_off;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  811  		pd->genpd.power_on =3D scpsys_hwv_power_on;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  812 =20
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  813  		/* HW-Voter code can be invoked in atomic cont=
ext */
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  814  		pd->genpd.flags |=3D GENPD_FLAG_IRQ_SAFE;
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  815  	}
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  816 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  817  	/*
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  818  	 * Initially turn on all domains to make the do=
mains usable
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  819  	 * with !CONFIG_PM and to get the hardware in s=
ync with the
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  820  	 * software.  The unused domains will be switch=
ed off during
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  821  	 * late_init time.
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  822  	 */
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30  823  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF=
)) {
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30 @824  		if (scpsys_domain_is_on(pd))
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30  825  			dev_warn(scpsys->dev,
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30  826  				 "%pOF: A default off power domain has been =
ON\n", node);
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30  827  	} else {
88914db077b6c2 drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino =
Del Regno 2025-09-25  828  		ret =3D pd->genpd.power_on(&pd->genpd);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  829  		if (ret < 0) {
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  830  			dev_err(scpsys->dev, "%pOF: failed to power o=
n domain: %d\n", node, ret);
f0fce06e345dc4 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2021-06-01  831  			goto err_put_subsys_clocks;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  832  		}
72be1e7a447add drivers/soc/mediatek/mtk-pm-domains.c      Chunfeng Yun     =
          2022-06-17  833 =20
72be1e7a447add drivers/soc/mediatek/mtk-pm-domains.c      Chunfeng Yun     =
          2022-06-17  834  		if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
72be1e7a447add drivers/soc/mediatek/mtk-pm-domains.c      Chunfeng Yun     =
          2022-06-17  835  			pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30  836  	}
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  837 =20
ac0ca395543af0 drivers/soc/mediatek/mtk-pm-domains.c      Chun-Jie Chen    =
          2022-01-30  838  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
ac0ca395543af0 drivers/soc/mediatek/mtk-pm-domains.c      Chun-Jie Chen    =
          2022-01-30  839  		pd->genpd.flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
ac0ca395543af0 drivers/soc/mediatek/mtk-pm-domains.c      Chun-Jie Chen    =
          2022-01-30  840 =20
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30  841  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF=
))
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30  842  		pm_genpd_init(&pd->genpd, NULL, true);
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30  843  	else
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  844  		pm_genpd_init(&pd->genpd, NULL, false);
c1f3163d8ff36f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu         =
          2020-10-30  845 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  846  	scpsys->domains[id] =3D &pd->genpd;
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  847 =20
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  848  	return scpsys->pd_data.domains[id];
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  849 =20
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  850  err_put_subsys_clocks:
123e8b4fd0cd99 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger =
          2020-10-30  851  	clk_bulk_put(pd->num_subsys_clks, pd->subsys_cl=
ks);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  852  err_put_clocks:
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  853  	clk_bulk_put(pd->num_clks, pd->clks);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  854  	return ERR_PTR(ret);
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  855  }
59b644b01cf48d drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i =
Serra     2020-10-30  856 =20

:::::: The code at line 824 was first introduced by commit
:::::: c1f3163d8ff36f5b75d467bf95581b8f2319cd64 soc: mediatek: pm-domains: =
Add default power off flag

:::::: TO: Weiyi Lu <weiyi.lu@mediatek.com>
:::::: CC: Matthias Brugger <matthias.bgg@gmail.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

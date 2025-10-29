Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E242E2DD4
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750792; cv=none; b=WhIUdsoOVVc/Nrj1EzS2t7aED/M/dKin+dI+TyN2W/1TUsdSekEk597YHJpOd2itZyjN8iyDJfwj+UGg0Jxys8pGAk37x8pV5Gn480qNHjPPy9i4Q0F5r3Nwp24ZpdJVqA+7As4kOCuJKhy+KCZbKADz+jW4qrrG1WJeuQ4/xpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750792; c=relaxed/simple;
	bh=oFOhzZoWi3DR7kDV7SK+jDQR3CIxRZLT1kfKNkn63ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFE2iuauA3lxF514APqWxIOLZS90PbPf+mkH0L5DF/8/HewYbJ6fjYfirlx48ykAT6sqBuxeDE1o/6UqZDAuI2rVCj3/UHqIGotnOfFnWyQKrmauYavSsZjodDbfwZVoqV108YDKvQo5rap72A3qmdHrHjFhH+cW9LpgnveOOpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0Gm5EJe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0Gm5EJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761750790; x=1793286790;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oFOhzZoWi3DR7kDV7SK+jDQR3CIxRZLT1kfKNkn63ck=;
  b=L0Gm5EJekL+QY00RfCKg01alVEejAPIOcgsIZ2/sRaL4pSvQ42iiOmcj
   G6rZaikMbByHWJyiolhlYoHjX2TBnYC4wx+6KcCLrYpso+Ol2B1/IsuQB
   jdi1ff5HYOlpEXiNz9Cjt2UeVJh6t0FRrfG2m3nVZ9x81F+Cz4ATXvN9f
   6NX21SAWkbMCAlqQide+OZyDXOTYRZMDeFfS+0E+CHlhGN4/1ICHTc+8z
   DWoBeMl7G0FPbCw/MAJMe5Z1KPwAPRnjaHaFoBx7tfHU4ZafiAfinrK66
   TDYr1w20CbkMq/PUbK5nsul4glgJ+7lG4hR7R4vgzyrwnaCDY+Nn2rFY5
   A==;
X-CSE-ConnectionGUID: 924LU4z0TFCaHYWtowGsSg==
X-CSE-MsgGUID: nYxpl/y5RNyXrjhXKiKGeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63759372"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63759372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 08:13:10 -0700
X-CSE-ConnectionGUID: QF9EHWewSiWL8qOOwlMTLg==
X-CSE-MsgGUID: jry+tZwzTfmTmj1u6AHnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="222907972"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2025 08:13:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE7rF-000KiJ-0u;
	Wed, 29 Oct 2025 15:13:05 +0000
Date: Wed, 29 Oct 2025 23:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2959/4731]
 drivers/pmdomain/mediatek/mtk-pm-domains.c:824 scpsys_add_one_domain()
 error: we previously assumed 'pd->data' could be null (see line 799)
Message-ID: <202510292330.95H9QLiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 60a6203aef6098e7f0f25c3787ac78f02bc3bd61 [2959/4731] pmdomain: mediatek: Add support for Hardware Voter power domains
:::::: branch date: 12 hours ago
:::::: commit date: 7 days ago
config: um-randconfig-r073-20251025 (https://download.01.org/0day-ci/archive/20251029/202510292330.95H9QLiY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510292330.95H9QLiY-lkp@intel.com/

New smatch warnings:
drivers/pmdomain/mediatek/mtk-pm-domains.c:824 scpsys_add_one_domain() error: we previously assumed 'pd->data' could be null (see line 799)

Old smatch warnings:
drivers/pmdomain/mediatek/mtk-pm-domains.c:1192 scpsys_probe() warn: missing unwind goto?

vim +824 drivers/pmdomain/mediatek/mtk-pm-domains.c

59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  676  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  677  static struct
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  678  generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  679  {
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  680  	const struct scpsys_domain_data *domain_data;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  681  	const struct scpsys_hwv_domain_data *hwv_domain_data;
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  682  	struct scpsys_domain *pd;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  683  	struct property *prop;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  684  	const char *clk_name;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  685  	int i, ret, num_clks;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  686  	struct clk *clk;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  687  	int clk_ind = 0;
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  688  	u32 id;
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  689  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  690  	ret = of_property_read_u32(node, "reg", &id);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  691  	if (ret) {
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  692  		dev_err(scpsys->dev, "%pOF: failed to retrieve domain id from reg: %d\n",
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  693  			node, ret);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  694  		return ERR_PTR(-EINVAL);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  695  	}
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  696  
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  697  	switch (scpsys->soc_data->type) {
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  698  	case SCPSYS_MTCMOS_TYPE_DIRECT_CTL:
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  699  		if (id >= scpsys->soc_data->num_domains) {
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  700  			dev_err(scpsys->dev, "%pOF: invalid domain id %d\n", node, id);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  701  			return ERR_PTR(-EINVAL);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  702  		}
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  703  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  704  		domain_data = &scpsys->soc_data->domains_data[id];
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  705  		hwv_domain_data = NULL;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  706  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  707  		if (domain_data->sta_mask == 0) {
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  708  			dev_err(scpsys->dev, "%pOF: undefined domain id %d\n", node, id);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  709  			return ERR_PTR(-EINVAL);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  710  		}
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  711  
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  712  		break;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  713  	case SCPSYS_MTCMOS_TYPE_HW_VOTER:
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  714  		if (id >= scpsys->soc_data->num_hwv_domains) {
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  715  			dev_err(scpsys->dev, "%pOF: invalid HWV domain id %d\n", node, id);
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  716  			return ERR_PTR(-EINVAL);
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  717  		}
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  718  
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  719  		domain_data = NULL;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  720  		hwv_domain_data = &scpsys->soc_data->hwv_domains_data[id];
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  721  
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  722  		break;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  723  	default:
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  724  		return ERR_PTR(-EINVAL);
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  725  	}
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  726  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  727  	pd = devm_kzalloc(scpsys->dev, sizeof(*pd), GFP_KERNEL);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  728  	if (!pd)
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  729  		return ERR_PTR(-ENOMEM);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  730  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  731  	pd->data = domain_data;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  732  	pd->hwv_data = hwv_domain_data;
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  733  	pd->scpsys = scpsys;
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  734  
1b18c0558d092b2 drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  735  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
ca824b2d69c52b3 drivers/pmdomain/mediatek/mtk-pm-domains.c Chen-Yu Tsai               2024-09-30  736  		pd->supply = devm_of_regulator_get_optional(scpsys->dev, node, "domain");
391a2e64d757a0d drivers/pmdomain/mediatek/mtk-pm-domains.c Hongbo Li                  2024-08-28  737  		if (IS_ERR(pd->supply))
391a2e64d757a0d drivers/pmdomain/mediatek/mtk-pm-domains.c Hongbo Li                  2024-08-28  738  			return dev_err_cast_probe(scpsys->dev, pd->supply,
1b18c0558d092b2 drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  739  				      "%pOF: failed to get power supply.\n",
1b18c0558d092b2 drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  740  				      node);
1b18c0558d092b2 drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  741  	}
1b18c0558d092b2 drivers/soc/mediatek/mtk-pm-domains.c      Hsin-Yi Wang               2021-01-29  742  
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  743  	num_clks = of_clk_get_parent_count(node);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  744  	if (num_clks > 0) {
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  745  		/* Calculate number of subsys_clks */
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  746  		of_property_for_each_string(node, "clock-names", prop, clk_name) {
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  747  			char *subsys;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  748  
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  749  			subsys = strchr(clk_name, '-');
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  750  			if (subsys)
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  751  				pd->num_subsys_clks++;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  752  			else
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  753  				pd->num_clks++;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  754  		}
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  755  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  756  		pd->clks = devm_kcalloc(scpsys->dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  757  		if (!pd->clks)
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  758  			return ERR_PTR(-ENOMEM);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  759  
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  760  		pd->subsys_clks = devm_kcalloc(scpsys->dev, pd->num_subsys_clks,
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  761  					       sizeof(*pd->subsys_clks), GFP_KERNEL);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  762  		if (!pd->subsys_clks)
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  763  			return ERR_PTR(-ENOMEM);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  764  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  765  	}
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  766  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  767  	for (i = 0; i < pd->num_clks; i++) {
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  768  		clk = of_clk_get(node, i);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  769  		if (IS_ERR(clk)) {
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  770  			ret = PTR_ERR(clk);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  771  			dev_err_probe(scpsys->dev, ret,
385ba16dbf9edad drivers/soc/mediatek/mtk-pm-domains.c      Christophe JAILLET         2022-08-05  772  				      "%pOF: failed to get clk at index %d\n", node, i);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  773  			goto err_put_clocks;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  774  		}
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  775  
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  776  		pd->clks[clk_ind++].clk = clk;
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  777  	}
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  778  
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  779  	for (i = 0; i < pd->num_subsys_clks; i++) {
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  780  		clk = of_clk_get(node, i + clk_ind);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  781  		if (IS_ERR(clk)) {
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  782  			ret = PTR_ERR(clk);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  783  			dev_err_probe(scpsys->dev, ret,
385ba16dbf9edad drivers/soc/mediatek/mtk-pm-domains.c      Christophe JAILLET         2022-08-05  784  				      "%pOF: failed to get clk at index %d\n", node,
385ba16dbf9edad drivers/soc/mediatek/mtk-pm-domains.c      Christophe JAILLET         2022-08-05  785  				      i + clk_ind);
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  786  			goto err_put_subsys_clocks;
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  787  		}
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  788  
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  789  		pd->subsys_clks[i].clk = clk;
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  790  	}
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  791  
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  792  	if (scpsys->domains[id]) {
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  793  		ret = -EINVAL;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  794  		dev_err(scpsys->dev,
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  795  			"power domain with id %d already exists, check your device-tree\n", id);
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  796  		goto err_put_subsys_clocks;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  797  	}
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  798  
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25 @799  	if (pd->data && pd->data->name)
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  800  		pd->genpd.name = pd->data->name;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  801  	else if (pd->hwv_data && pd->hwv_data->name)
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  802  		pd->genpd.name = pd->hwv_data->name;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  803  	else
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  804  		pd->genpd.name = node->name;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  805  
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  806  	if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_DIRECT_CTL) {
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  807  		pd->genpd.power_off = scpsys_power_off;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  808  		pd->genpd.power_on = scpsys_power_on;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  809  	} else {
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  810  		pd->genpd.power_off = scpsys_hwv_power_off;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  811  		pd->genpd.power_on = scpsys_hwv_power_on;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  812  
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  813  		/* HW-Voter code can be invoked in atomic context */
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  814  		pd->genpd.flags |= GENPD_FLAG_IRQ_SAFE;
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  815  	}
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  816  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  817  	/*
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  818  	 * Initially turn on all domains to make the domains usable
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  819  	 * with !CONFIG_PM and to get the hardware in sync with the
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  820  	 * software.  The unused domains will be switched off during
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  821  	 * late_init time.
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  822  	 */
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  823  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30 @824  		if (scpsys_domain_is_on(pd))
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  825  			dev_warn(scpsys->dev,
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  826  				 "%pOF: A default off power domain has been ON\n", node);
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  827  	} else {
60a6203aef6098e drivers/pmdomain/mediatek/mtk-pm-domains.c AngeloGioacchino Del Regno 2025-09-25  828  		ret = pd->genpd.power_on(&pd->genpd);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  829  		if (ret < 0) {
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  830  			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
f0fce06e345dc4f drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2021-06-01  831  			goto err_put_subsys_clocks;
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  832  		}
72be1e7a447add1 drivers/soc/mediatek/mtk-pm-domains.c      Chunfeng Yun               2022-06-17  833  
72be1e7a447add1 drivers/soc/mediatek/mtk-pm-domains.c      Chunfeng Yun               2022-06-17  834  		if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
72be1e7a447add1 drivers/soc/mediatek/mtk-pm-domains.c      Chunfeng Yun               2022-06-17  835  			pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  836  	}
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  837  
ac0ca395543af06 drivers/soc/mediatek/mtk-pm-domains.c      Chun-Jie Chen              2022-01-30  838  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
ac0ca395543af06 drivers/soc/mediatek/mtk-pm-domains.c      Chun-Jie Chen              2022-01-30  839  		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
ac0ca395543af06 drivers/soc/mediatek/mtk-pm-domains.c      Chun-Jie Chen              2022-01-30  840  
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  841  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  842  		pm_genpd_init(&pd->genpd, NULL, true);
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  843  	else
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  844  		pm_genpd_init(&pd->genpd, NULL, false);
c1f3163d8ff36f5 drivers/soc/mediatek/mtk-pm-domains.c      Weiyi Lu                   2020-10-30  845  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  846  	scpsys->domains[id] = &pd->genpd;
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  847  
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  848  	return scpsys->pd_data.domains[id];
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  849  
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  850  err_put_subsys_clocks:
123e8b4fd0cd999 drivers/soc/mediatek/mtk-pm-domains.c      Matthias Brugger           2020-10-30  851  	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  852  err_put_clocks:
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  853  	clk_bulk_put(pd->num_clks, pd->clks);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  854  	return ERR_PTR(ret);
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  855  }
59b644b01cf48d6 drivers/soc/mediatek/mtk-pm-domains.c      Enric Balletbo i Serra     2020-10-30  856  

:::::: The code at line 824 was first introduced by commit
:::::: c1f3163d8ff36f5b75d467bf95581b8f2319cd64 soc: mediatek: pm-domains: Add default power off flag

:::::: TO: Weiyi Lu <weiyi.lu@mediatek.com>
:::::: CC: Matthias Brugger <matthias.bgg@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D8B286D7B
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 22:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765578640; cv=none; b=tOkUVxgwIQIWWkktJ9vLhFdKPKNQ7CP3tmpl1eRn0/BCJ9JvDFQlJzfihPtL9xzgcMpceYIl2jkVdyhIuLpNLwBxKJuN27Uua9emfNywYBgNWPDkG1CIxSs+z4SX/NiMToKLX4Q22DDbK+t6EdaJoLPgr8uA7InSbbQxBnwRDlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765578640; c=relaxed/simple;
	bh=2PLzgLTy1jgjK36BQRhGbADnFVD3PQxZXqfgRsM5z2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksbzIkNPK9EW9GHuqrTaGzAO/pFJb+EqGPuVYNEeKUHZdncdCW79uKQ51RkES9m8iDp4sUmx1wXKgpLtGghrARwUvawI7OaANS0RsXO3TmEAr62h3TUTesORUtNYnNt69LJcRA+VWstHRs8r3Mv/NhHulSI66s8Ixp52A9KdSVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPwBbz42; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPwBbz42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765578639; x=1797114639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2PLzgLTy1jgjK36BQRhGbADnFVD3PQxZXqfgRsM5z2w=;
  b=HPwBbz42FLu9GZHbgVE46mYgyA5jDnCEm6/YKawdXuf1JPJ9RF6cmn4S
   OodyBDFJrtW5j9A6TdxTCmM+t5bRKcnzGEY/nVJuG2Qnu9dRvSjIdbPF9
   uwidCIDeYMCspsuivIZoqV2h82R0Za/Hp1Jmred9wxdNwygFrqTxBEV4W
   X6yjrzJlwhJiT9iCzAoJCv+JhaSR4ShYVRXWBzSUTS9a6oUs4TMvnk2n7
   OHIzxKHLJNe5p40HKI8ofqfv76VksLJES5oR6zlJPgjsIq3B5e8EKvbxq
   jxk4WVPjGwGHMZi6yI2lfTfNZBsoTd271usUXgnseNTOXoSumAG2oCE6T
   g==;
X-CSE-ConnectionGUID: 2RqWNEwtSbiRTNDRc9VtmA==
X-CSE-MsgGUID: RG+ZIMZSSeKZizQPNNDWbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78291535"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78291535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:30:35 -0800
X-CSE-ConnectionGUID: bY2sHXR9RcODE3QKgIyYhQ==
X-CSE-MsgGUID: MebIGTFZQaCO4j4m22BLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="220572933"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Dec 2025 14:30:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBeh-000000006hb-47CQ;
	Fri, 12 Dec 2025 22:30:31 +0000
Date: Sat, 13 Dec 2025 06:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/qcom/gdsc.c:578 gdsc_register() error: uninitialized
 symbol 'ret'.
Message-ID: <202512130657.1W4GRHFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 65a733464553ea192797b889d1533a1a37216f32 clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r073-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130657.1W4GRHFY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130657.1W4GRHFY-lkp@intel.com/

smatch warnings:
drivers/clk/qcom/gdsc.c:578 gdsc_register() error: uninitialized symbol 'ret'.

vim +/ret +578 drivers/clk/qcom/gdsc.c

65a733464553ea Bryan O'Donoghue 2025-01-17  525  
c2c7f0a47493ae Rajendra Nayak   2015-12-01  526  int gdsc_register(struct gdsc_desc *desc,
3c53f5e2179874 Rajendra Nayak   2015-08-06  527  		  struct reset_controller_dev *rcdev, struct regmap *regmap)
45dd0e55317ccb Stephen Boyd     2015-08-06  528  {
45dd0e55317ccb Stephen Boyd     2015-08-06  529  	int i, ret;
45dd0e55317ccb Stephen Boyd     2015-08-06  530  	struct genpd_onecell_data *data;
c2c7f0a47493ae Rajendra Nayak   2015-12-01  531  	struct device *dev = desc->dev;
c2c7f0a47493ae Rajendra Nayak   2015-12-01  532  	struct gdsc **scs = desc->scs;
c2c7f0a47493ae Rajendra Nayak   2015-12-01  533  	size_t num = desc->num;
45dd0e55317ccb Stephen Boyd     2015-08-06  534  
45dd0e55317ccb Stephen Boyd     2015-08-06  535  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
45dd0e55317ccb Stephen Boyd     2015-08-06  536  	if (!data)
45dd0e55317ccb Stephen Boyd     2015-08-06  537  		return -ENOMEM;
45dd0e55317ccb Stephen Boyd     2015-08-06  538  
45dd0e55317ccb Stephen Boyd     2015-08-06  539  	data->domains = devm_kcalloc(dev, num, sizeof(*data->domains),
45dd0e55317ccb Stephen Boyd     2015-08-06  540  				     GFP_KERNEL);
45dd0e55317ccb Stephen Boyd     2015-08-06  541  	if (!data->domains)
45dd0e55317ccb Stephen Boyd     2015-08-06  542  		return -ENOMEM;
45dd0e55317ccb Stephen Boyd     2015-08-06  543  
37416e554961b3 Bjorn Andersson  2020-04-17  544  	for (i = 0; i < num; i++) {
37416e554961b3 Bjorn Andersson  2020-04-17  545  		if (!scs[i] || !scs[i]->supply)
37416e554961b3 Bjorn Andersson  2020-04-17  546  			continue;
37416e554961b3 Bjorn Andersson  2020-04-17  547  
6677196fb1932e Johan Hovold     2024-03-25  548  		scs[i]->rsupply = devm_regulator_get_optional(dev, scs[i]->supply);
6677196fb1932e Johan Hovold     2024-03-25  549  		if (IS_ERR(scs[i]->rsupply)) {
6677196fb1932e Johan Hovold     2024-03-25  550  			ret = PTR_ERR(scs[i]->rsupply);
6677196fb1932e Johan Hovold     2024-03-25  551  			if (ret != -ENODEV)
6677196fb1932e Johan Hovold     2024-03-25  552  				return ret;
6677196fb1932e Johan Hovold     2024-03-25  553  
6677196fb1932e Johan Hovold     2024-03-25  554  			scs[i]->rsupply = NULL;
6677196fb1932e Johan Hovold     2024-03-25  555  		}
37416e554961b3 Bjorn Andersson  2020-04-17  556  	}
37416e554961b3 Bjorn Andersson  2020-04-17  557  
45dd0e55317ccb Stephen Boyd     2015-08-06  558  	data->num_domains = num;
45dd0e55317ccb Stephen Boyd     2015-08-06  559  	for (i = 0; i < num; i++) {
45dd0e55317ccb Stephen Boyd     2015-08-06  560  		if (!scs[i])
45dd0e55317ccb Stephen Boyd     2015-08-06  561  			continue;
45dd0e55317ccb Stephen Boyd     2015-08-06  562  		scs[i]->regmap = regmap;
3c53f5e2179874 Rajendra Nayak   2015-08-06  563  		scs[i]->rcdev = rcdev;
45dd0e55317ccb Stephen Boyd     2015-08-06  564  		ret = gdsc_init(scs[i]);
45dd0e55317ccb Stephen Boyd     2015-08-06  565  		if (ret)
45dd0e55317ccb Stephen Boyd     2015-08-06  566  			return ret;
45dd0e55317ccb Stephen Boyd     2015-08-06  567  		data->domains[i] = &scs[i]->pd;
45dd0e55317ccb Stephen Boyd     2015-08-06  568  	}
45dd0e55317ccb Stephen Boyd     2015-08-06  569  
c2c7f0a47493ae Rajendra Nayak   2015-12-01  570  	/* Add subdomains */
c2c7f0a47493ae Rajendra Nayak   2015-12-01  571  	for (i = 0; i < num; i++) {
c2c7f0a47493ae Rajendra Nayak   2015-12-01  572  		if (!scs[i])
c2c7f0a47493ae Rajendra Nayak   2015-12-01  573  			continue;
c2c7f0a47493ae Rajendra Nayak   2015-12-01  574  		if (scs[i]->parent)
65a733464553ea Bryan O'Donoghue 2025-01-17  575  			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
1b771839de0547 Dmitry Baryshkov 2021-08-29  576  		else if (!IS_ERR_OR_NULL(dev->pm_domain))
65a733464553ea Bryan O'Donoghue 2025-01-17  577  			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
65a733464553ea Bryan O'Donoghue 2025-01-17 @578  		if (ret)
65a733464553ea Bryan O'Donoghue 2025-01-17  579  			goto err_pm_subdomain_remove;
c2c7f0a47493ae Rajendra Nayak   2015-12-01  580  	}
c2c7f0a47493ae Rajendra Nayak   2015-12-01  581  
45dd0e55317ccb Stephen Boyd     2015-08-06  582  	return of_genpd_add_provider_onecell(dev->of_node, data);
65a733464553ea Bryan O'Donoghue 2025-01-17  583  
65a733464553ea Bryan O'Donoghue 2025-01-17  584  err_pm_subdomain_remove:
65a733464553ea Bryan O'Donoghue 2025-01-17  585  	gdsc_pm_subdomain_remove(desc, i);
65a733464553ea Bryan O'Donoghue 2025-01-17  586  
65a733464553ea Bryan O'Donoghue 2025-01-17  587  	return ret;
45dd0e55317ccb Stephen Boyd     2015-08-06  588  }
45dd0e55317ccb Stephen Boyd     2015-08-06  589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

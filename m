Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF9500966
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 06:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768114219; cv=none; b=SqEANncoHPBCr8nmg3a4LVVpz1hUar7zaQGqJmvDOPnJAE37wP4ugLi2zRBmHCQWAkc1OWXQikvE05tcGjbmwt4xs19zwQ46yixqZ5xjN8Qw3UHzMz5GFkRoZqKJYQHc/uyK/FnpNb/W1VRxICTvHfqOgihX1z+Yu17soyyc/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768114219; c=relaxed/simple;
	bh=l8e9t46Y2togDs2WHYi73uxDoZ5wD9S13uG417Oqehg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ooogsfmk73NMaUebzoGcM/W0XedMhwXMEZkAzeXJO/lMaRREBaaGRghEW0UkPF/VTfYpBcJgxvpk74vEH8/UPxKJH0XeGGFZabgkvD/4iuDsBFam+wY//um2a3vbnmRAMSUfOkHUHvnZnOn8wOFVCRY1V/uYH8Fe/7W7V4ND6Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKVHd3Tp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKVHd3Tp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768114216; x=1799650216;
  h=date:from:to:cc:subject:message-id;
  bh=l8e9t46Y2togDs2WHYi73uxDoZ5wD9S13uG417Oqehg=;
  b=BKVHd3TpONSl6yyMSuINf6uKePncVXJMxQ7BYaSh2QY2lRXrl0SzcFxB
   TMchNd1i6mZorr+bXAnuUZdEoSmyjNW9snw3nuRnEBUC4dPdAJ7clPr9R
   AJv1np8W+xFsEkaRjB4EueGYtRCbysIWv2NnXgoSpYcKdUm0gaqftsvje
   WnMrtWgs2zdpt9O+xtjE3a3xYpm2VELtshCPvsEksKwvpIv77GgsB8ptf
   0pIOSievdQSEZ+C7cXNxBh91i7eeEgc1TeYPsYJFN+BfhlCKXDoAhP8HX
   JPAea0NfxYDs+OdZ87wBijD5jOJHUz89GvgHUD7doT78G3R/p2JRU6txo
   A==;
X-CSE-ConnectionGUID: agNvvdTbTzu3ga16+gRLLg==
X-CSE-MsgGUID: Fi/2oNFNTdqH2lBAuTlb/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69584330"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; 
   d="scan'208";a="69584330"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 22:50:16 -0800
X-CSE-ConnectionGUID: 5OrPOG8WRI+nEbRsGQ0o4Q==
X-CSE-MsgGUID: aM8J3alORiiVZ6uPYXc2bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="203891363"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jan 2026 22:50:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vepHA-000000009iA-3MMs;
	Sun, 11 Jan 2026 06:50:12 +0000
Date: Sun, 11 Jan 2026 14:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soc/imx/soc-imx8m.c:143 imx8m_soc_prepare() warn:
 'drvdata->ocotp_base' from of_iomap() not released on lines: 139.
Message-ID: <202601111406.ZVV3YaiU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peng Fan <peng.fan@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Marco Felsch <m.felsch@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   755bc1335e3b116b702205b72eb57b7b8aef2bb2
commit: 390c01073f5d0bd64db37926ddb232f33b83620d soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: m68k-randconfig-r072-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111406.ZVV3YaiU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/

smatch warnings:
drivers/soc/imx/soc-imx8m.c:143 imx8m_soc_prepare() warn: 'drvdata->ocotp_base' from of_iomap() not released on lines: 139.

vim +143 drivers/soc/imx/soc-imx8m.c

390c01073f5d0b Peng Fan 2025-04-23  118  
390c01073f5d0b Peng Fan 2025-04-23  119  static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_compatible)
390c01073f5d0b Peng Fan 2025-04-23  120  {
390c01073f5d0b Peng Fan 2025-04-23  121  	struct device_node *np __free(device_node) =
390c01073f5d0b Peng Fan 2025-04-23  122  		of_find_compatible_node(NULL, NULL, ocotp_compatible);
390c01073f5d0b Peng Fan 2025-04-23  123  	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
390c01073f5d0b Peng Fan 2025-04-23  124  	int ret = 0;
390c01073f5d0b Peng Fan 2025-04-23  125  
390c01073f5d0b Peng Fan 2025-04-23  126  	if (!np)
390c01073f5d0b Peng Fan 2025-04-23  127  		return -EINVAL;
390c01073f5d0b Peng Fan 2025-04-23  128  
390c01073f5d0b Peng Fan 2025-04-23  129  	drvdata->ocotp_base = of_iomap(np, 0);
390c01073f5d0b Peng Fan 2025-04-23  130  	if (!drvdata->ocotp_base)
390c01073f5d0b Peng Fan 2025-04-23  131  		return -EINVAL;
390c01073f5d0b Peng Fan 2025-04-23  132  
390c01073f5d0b Peng Fan 2025-04-23  133  	drvdata->clk = of_clk_get_by_name(np, NULL);
390c01073f5d0b Peng Fan 2025-04-23  134  	if (IS_ERR(drvdata->clk)) {
390c01073f5d0b Peng Fan 2025-04-23  135  		ret = PTR_ERR(drvdata->clk);
390c01073f5d0b Peng Fan 2025-04-23  136  		goto err_clk;
390c01073f5d0b Peng Fan 2025-04-23  137  	}
390c01073f5d0b Peng Fan 2025-04-23  138  
390c01073f5d0b Peng Fan 2025-04-23  139  	return clk_prepare_enable(drvdata->clk);
390c01073f5d0b Peng Fan 2025-04-23  140  
390c01073f5d0b Peng Fan 2025-04-23  141  err_clk:
390c01073f5d0b Peng Fan 2025-04-23  142  	iounmap(drvdata->ocotp_base);
390c01073f5d0b Peng Fan 2025-04-23 @143  	return ret;
390c01073f5d0b Peng Fan 2025-04-23  144  }
390c01073f5d0b Peng Fan 2025-04-23  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

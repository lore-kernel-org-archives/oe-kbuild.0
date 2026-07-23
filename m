Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B614E3FCB34
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845401; cv=none; b=n85ilxRIj5BtOy17Tp282FfeGqnbkHnGBDcdaeIWIiKl7hQOrIyJ/kkr1l1Ig0CnGxBpfQqP7uNDBw3e0mc1Bi3fCkBlkwCSZ46j9sHaFK37FqgsPNwr32fZ4fo1B3J+U9XhzZpl2zJfWp89MXlyvv/+YdI8DHmHy/mv56i1d1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845401; c=relaxed/simple;
	bh=TiBEhk4AOuj6t+LT4q7i5rKxi8088avNfBiFZ9X7/P4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cl2eZf0TG33aQTtpAgez1qsLCG9vnNsIqnXUn997YO0+vI13uTmbp1Qm5YHCUKW+6H7hCB8U3Y3Ph18SO14R8mTH4t2Kk/AD8SLHO7V7kG1yuxtCjRRGkR/ynLpMxhU/B0OSGoF7+C+0SetZ81vaIJYkZN6BOtPMOxdCIwZWf2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlQazKBu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlQazKBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784845398; x=1816381398;
  h=date:from:to:cc:subject:message-id;
  bh=TiBEhk4AOuj6t+LT4q7i5rKxi8088avNfBiFZ9X7/P4=;
  b=DlQazKBuboUqIbfaUGGyRJJaPRfVnj/sxoAmSMRlHmR4hVeDEdKP+A9F
   2MhdSIbt3cs/fRLElWsC4djQxG+6EsH3SgM4C1OgQHSrkj3TIW+Wsu+m3
   2O/RthzOKNmyHsD2wEF9nw/gXYwnLGZXVbMk1hmkbzGW3vnzi963gRrGR
   Kh9cwlQ1E9qVRSlp9NnNrWls18fP5PuSChNyULMmXz3wvALD3lI+uJTuk
   L2AIbv79W8UxregAPVCMzn1N+6jq6uRJqiNMkvKb3gUXbd6Gy4hlKkxLD
   xOcMZ2yjk1SoSnAWL+G7qnfvCAT7ZU93tg+UNyiG89ek1u7u2IsXcgcIB
   Q==;
X-CSE-ConnectionGUID: xR7pTwLwR7qTtMNdbGZ0qg==
X-CSE-MsgGUID: VmchXBdgTIGVkyc86UaSXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="73054995"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="73054995"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 15:23:17 -0700
X-CSE-ConnectionGUID: I5wd0DvDTH6s4w4yy/V+RQ==
X-CSE-MsgGUID: 4SDQ6hTbTjagoGzjsSyfNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="281838645"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jul 2026 15:23:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wn1ov-00000000a90-1sjR;
	Thu, 23 Jul 2026 22:23:13 +0000
Date: Fri, 24 Jul 2026 06:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/phy/freescale/phy-fsl-imx8mq-usb.c:133
 tca_blk_typec_switch_set() error: 'imx_phy' dereferencing possible ERR_PTR()
Message-ID: <202607240502.1IavMLfa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Franz Schnyder <franz.schnyder@toradex.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Xu Yang <xu.yang_2@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: 49ccab4bedd4779899246107dc19fb01c5b6fea3 phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
date:   7 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-r072-20260723 (https://download.01.org/0day-ci/archive/20260724/202607240502.1IavMLfa-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 49ccab4bedd4 ("phy: fsl-imx8mq-usb: fix typec orientation switch when built as module")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607240502.1IavMLfa-lkp@intel.com/

smatch warnings:
drivers/phy/freescale/phy-fsl-imx8mq-usb.c:133 tca_blk_typec_switch_set() error: 'imx_phy' dereferencing possible ERR_PTR()

vim +/imx_phy +133 drivers/phy/freescale/phy-fsl-imx8mq-usb.c

efe81bea8915866 Li Jun  2018-11-15  124  
b58f0f86fd6156d Xu Yang 2024-12-04  125  
b58f0f86fd6156d Xu Yang 2024-12-04  126  static void tca_blk_orientation_set(struct tca_blk *tca,
b58f0f86fd6156d Xu Yang 2024-12-04  127  				enum typec_orientation orientation);
b58f0f86fd6156d Xu Yang 2024-12-04  128  
b58f0f86fd6156d Xu Yang 2024-12-04  129  static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
b58f0f86fd6156d Xu Yang 2024-12-04  130  				enum typec_orientation orientation)
b58f0f86fd6156d Xu Yang 2024-12-04  131  {
b58f0f86fd6156d Xu Yang 2024-12-04  132  	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
b58f0f86fd6156d Xu Yang 2024-12-04 @133  	struct tca_blk *tca = imx_phy->tca;
b58f0f86fd6156d Xu Yang 2024-12-04  134  	int ret;
b58f0f86fd6156d Xu Yang 2024-12-04  135  
b58f0f86fd6156d Xu Yang 2024-12-04  136  	if (tca->orientation == orientation)
b58f0f86fd6156d Xu Yang 2024-12-04  137  		return 0;
b58f0f86fd6156d Xu Yang 2024-12-04  138  
b58f0f86fd6156d Xu Yang 2024-12-04  139  	ret = clk_prepare_enable(imx_phy->clk);
b58f0f86fd6156d Xu Yang 2024-12-04  140  	if (ret)
b58f0f86fd6156d Xu Yang 2024-12-04  141  		return ret;
b58f0f86fd6156d Xu Yang 2024-12-04  142  
b58f0f86fd6156d Xu Yang 2024-12-04  143  	tca_blk_orientation_set(tca, orientation);
b58f0f86fd6156d Xu Yang 2024-12-04  144  	clk_disable_unprepare(imx_phy->clk);
b58f0f86fd6156d Xu Yang 2024-12-04  145  
b58f0f86fd6156d Xu Yang 2024-12-04  146  	return 0;
b58f0f86fd6156d Xu Yang 2024-12-04  147  }
b58f0f86fd6156d Xu Yang 2024-12-04  148  

:::::: The code at line 133 was first introduced by commit
:::::: b58f0f86fd6156d7b084257f5c91ceaf7d760927 phy: fsl-imx8mq-usb: add tca function driver for imx95

:::::: TO: Xu Yang <xu.yang_2@nxp.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

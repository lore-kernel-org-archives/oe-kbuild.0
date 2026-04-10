Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3DF3AB286
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809763; cv=none; b=AFjJPN/4WPAuhoSmaCXq2DoYC6wtRSutzVONzbqudhKUYPMkdPzo5EtnNqZyAQ7lVxrhiwGlS+rZM6+rB1qNetxlxxrtI3aVEU+iYXfA5vThb8rEwIs6Z7DsAL2AuOusBAjZPfrEKR9ih3s6SBW9MPzhDSplIH53U7ZWn0A9Xyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809763; c=relaxed/simple;
	bh=09NNK9i56BfTkOzNmEbLyX5rUBz9LHBrCfIwpqaK+F8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SCKBO+N2z+EcoV/9uSNA8ai8noUJpW7PZp+j3JeZphcNtlKO8RgIlMj/+rUgRhpREEpP7cdAHwAk5pFvIW/X4uX2vCUM+8f3PCnnQONl398fx6IhVZAmL4JjEpto61kW22WqLvwad6ai7WDmUK8ECc1KXJMzXrjFrIIRqQV5JoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZR5wuja; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZR5wuja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775809762; x=1807345762;
  h=date:from:to:cc:subject:message-id;
  bh=09NNK9i56BfTkOzNmEbLyX5rUBz9LHBrCfIwpqaK+F8=;
  b=eZR5wujai6JMYV+OxO1WIg+71GVn9NCTfhIzGPkUwZ73ixAfs3jrr2v5
   n6WE7yx5UYVts1ynPMotUdDjU89cPePb97BGoArZfejx/51o1sEd7WB6/
   BXYRE6UPjt/fc2CsXHKiTcHCiGFjLofDpZTYJ2EVLL6jkBEhOe8tf9goq
   tztkFq2Crj0zE7ekGLZTsp4+cl6e+l7D7byTrKfxfrbwVRpvaFeJd8Egu
   bmQwRzbO/iA4OoRExI5uweMgGEdGM7F7nxbIglKb4yPZooJqXpvN9JYQU
   S4SDkdnWSHtQRHL9iGBmA4eMuXR/HmHBPwGypNBFZ1behw47beKDBTn5A
   Q==;
X-CSE-ConnectionGUID: lPl7Dv6iQCqiWTECQmzVNQ==
X-CSE-MsgGUID: 8NDoJxqZTLu1kNqDaDQlzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76716159"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76716159"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:29:21 -0700
X-CSE-ConnectionGUID: fP/4jkVQTrGiOSfjfxr84g==
X-CSE-MsgGUID: eN62wXcFQ1inVWgHZMKI2Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2026 01:29:20 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB7Es-000000003UD-1NDN;
	Fri, 10 Apr 2026 08:29:18 +0000
Date: Fri, 10 Apr 2026 16:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/phy/freescale/phy-fsl-imx8mq-usb.c:133
 tca_blk_typec_switch_set() error: 'imx_phy' dereferencing possible ERR_PTR()
Message-ID: <202604101620.bhqQ71yO-lkp@intel.com>
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
head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
commit: 49ccab4bedd4779899246107dc19fb01c5b6fea3 phy: fsl-imx8mq-usb: fix typec orientation switch when built as module
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: sparc-randconfig-r071-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101620.bhqQ71yO-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 49ccab4bedd4 ("phy: fsl-imx8mq-usb: fix typec orientation switch when built as module")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604101620.bhqQ71yO-lkp@intel.com/

smatch warnings:
drivers/phy/freescale/phy-fsl-imx8mq-usb.c:133 tca_blk_typec_switch_set() error: 'imx_phy' dereferencing possible ERR_PTR()

vim +/imx_phy +133 drivers/phy/freescale/phy-fsl-imx8mq-usb.c

efe81bea891586 Li Jun  2018-11-15  124  
b58f0f86fd6156 Xu Yang 2024-12-04  125  
b58f0f86fd6156 Xu Yang 2024-12-04  126  static void tca_blk_orientation_set(struct tca_blk *tca,
b58f0f86fd6156 Xu Yang 2024-12-04  127  				enum typec_orientation orientation);
b58f0f86fd6156 Xu Yang 2024-12-04  128  
b58f0f86fd6156 Xu Yang 2024-12-04  129  static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
b58f0f86fd6156 Xu Yang 2024-12-04  130  				enum typec_orientation orientation)
b58f0f86fd6156 Xu Yang 2024-12-04  131  {
b58f0f86fd6156 Xu Yang 2024-12-04  132  	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
b58f0f86fd6156 Xu Yang 2024-12-04 @133  	struct tca_blk *tca = imx_phy->tca;
b58f0f86fd6156 Xu Yang 2024-12-04  134  	int ret;
b58f0f86fd6156 Xu Yang 2024-12-04  135  
b58f0f86fd6156 Xu Yang 2024-12-04  136  	if (tca->orientation == orientation)
b58f0f86fd6156 Xu Yang 2024-12-04  137  		return 0;
b58f0f86fd6156 Xu Yang 2024-12-04  138  
b58f0f86fd6156 Xu Yang 2024-12-04  139  	ret = clk_prepare_enable(imx_phy->clk);
b58f0f86fd6156 Xu Yang 2024-12-04  140  	if (ret)
b58f0f86fd6156 Xu Yang 2024-12-04  141  		return ret;
b58f0f86fd6156 Xu Yang 2024-12-04  142  
b58f0f86fd6156 Xu Yang 2024-12-04  143  	tca_blk_orientation_set(tca, orientation);
b58f0f86fd6156 Xu Yang 2024-12-04  144  	clk_disable_unprepare(imx_phy->clk);
b58f0f86fd6156 Xu Yang 2024-12-04  145  
b58f0f86fd6156 Xu Yang 2024-12-04  146  	return 0;
b58f0f86fd6156 Xu Yang 2024-12-04  147  }
b58f0f86fd6156 Xu Yang 2024-12-04  148  

:::::: The code at line 133 was first introduced by commit
:::::: b58f0f86fd6156d7b084257f5c91ceaf7d760927 phy: fsl-imx8mq-usb: add tca function driver for imx95

:::::: TO: Xu Yang <xu.yang_2@nxp.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

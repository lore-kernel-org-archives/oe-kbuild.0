Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476B190664
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211661; cv=none; b=OeKK1i0E2xYbeERx+L6THFgVi+QdRtIFeWDriCHKCx+WnywcbL0BY+XMwzUm1yeYn0Fqo8jBPWpFNUbn721Vh/qAGxAxU43XSTuDcBU7vHnANny8bwRqobbZ0GuaJv7IffZO9qvzjznisFMFyKokxMZLldSWJh0uPGAYk6WUpXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211661; c=relaxed/simple;
	bh=cOx/vgEFwMgLMYnjgpLJUakYEclCa/tKhf5CbznT5dI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NgtL5IyxTx/TBV7lCRO6vWc95sVbKqQ5drimrFB8PsMnTLFJy6RV+UN8ThKTyCqvIjJfxVNL8dbfCBExrT5hTX901edwFXt8LwKgD63mqbLV2HmQpawGl6KNdhorT78rJNkAXolidoQ9XpFbcWx3z6iEjuuCKESwBhMJ/qyDm1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/jdHFIB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/jdHFIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733211660; x=1764747660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cOx/vgEFwMgLMYnjgpLJUakYEclCa/tKhf5CbznT5dI=;
  b=W/jdHFIB2w9n1pj5vgNp6BBTLCN2Mubmy/tsLK05xNIa0jusdAp3GI8C
   OZJiDwR8l/6cnEUekf+Lwel30cjOM5SJu7adYZkI+CeTdzuj3kcmhP6v5
   2/ug6VeYB5KMUJn3Kh/demWzODkpA72nSxtf6HYMLcYLFPnOHs8ATAGBV
   hfnSQGCEfcGHUKxSYOzUlNFvdFdGGu4L7dhBFo7hrJuWqR1zeBpifdN0c
   fium35JCQPco53VOEAiv1irZUqrt0YRuBeoXBAjhPTfnLhbeChMQBTR9s
   NZjtFrUJp6KSbx347yYDTHsHgiHxRa2UF+qa0rTuMJ6CAvopsa7fVd5RT
   A==;
X-CSE-ConnectionGUID: OWKcK5hwTnCmt92u3L1Ltw==
X-CSE-MsgGUID: sz9PrPMtQU6ZLrO3jV3VIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33468503"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33468503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 23:40:59 -0800
X-CSE-ConnectionGUID: zBCInU55SUKOAskzXtjX/w==
X-CSE-MsgGUID: ri7NMqeBQaiFPbbNuCkJTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="98126671"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2024 23:40:59 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tINWh-0000IJ-1J;
	Tue, 03 Dec 2024 07:40:55 +0000
Date: Tue, 3 Dec 2024 15:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c:353:51-53:
 opportunity for str_on_off(on)
Message-ID: <202412031559.HWe1dA4v-lkp@intel.com>
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
CC: Guenter Roeck <linux@roeck-us.net>
CC: Caleb Connolly <caleb.connolly@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: a4422ff221429c600c3dc5d0394fb3738b89d040 usb: typec: qcom: Add Qualcomm PMIC Type-C driver
date:   1 year, 7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 7 months ago
config: loongarch-randconfig-r062-20241111 (https://download.01.org/0day-ci/archive/20241203/202412031559.HWe1dA4v-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412031559.HWe1dA4v-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c:353:51-53: opportunity for str_on_off(on)

vim +353 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c

a4422ff221429c Bryan O'Donoghue 2023-05-08  340  
a4422ff221429c Bryan O'Donoghue 2023-05-08  341  int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, bool on)
a4422ff221429c Bryan O'Donoghue 2023-05-08  342  {
a4422ff221429c Bryan O'Donoghue 2023-05-08  343  	unsigned long flags;
a4422ff221429c Bryan O'Donoghue 2023-05-08  344  	int ret;
a4422ff221429c Bryan O'Donoghue 2023-05-08  345  
a4422ff221429c Bryan O'Donoghue 2023-05-08  346  	spin_lock_irqsave(&pmic_typec_pdphy->lock, flags);
a4422ff221429c Bryan O'Donoghue 2023-05-08  347  
a4422ff221429c Bryan O'Donoghue 2023-05-08  348  	ret = regmap_write(pmic_typec_pdphy->regmap,
a4422ff221429c Bryan O'Donoghue 2023-05-08  349  			   pmic_typec_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG, !on);
a4422ff221429c Bryan O'Donoghue 2023-05-08  350  
a4422ff221429c Bryan O'Donoghue 2023-05-08  351  	spin_unlock_irqrestore(&pmic_typec_pdphy->lock, flags);
a4422ff221429c Bryan O'Donoghue 2023-05-08  352  
a4422ff221429c Bryan O'Donoghue 2023-05-08 @353  	dev_dbg(pmic_typec_pdphy->dev, "set_pd_rx: %s\n", on ? "on" : "off");
a4422ff221429c Bryan O'Donoghue 2023-05-08  354  
a4422ff221429c Bryan O'Donoghue 2023-05-08  355  	return ret;
a4422ff221429c Bryan O'Donoghue 2023-05-08  356  }
a4422ff221429c Bryan O'Donoghue 2023-05-08  357  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

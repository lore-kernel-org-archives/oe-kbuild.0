Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC07C8D7
	for <oe-kbuild@lists.linux.dev>; Sun, 12 May 2024 03:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715484401; cv=none; b=ljTVMe9k4jXM/4kgkHzlLXjQe0djqfwhLwPanW/4wA95CU7Zp1v15PFrSo8BbY3a8P9JFLb3zbTfyA/6Pog4CuokSiGxEnFOicjVpOqLjEB+zI5t+v1Akm6s1vIcgO/lEi8WF86oWssRUhj+Eb85/2aGTK+j2Qj/uBPumst+p00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715484401; c=relaxed/simple;
	bh=MBsJ9mTKrGdfSv7pq9q6dSdMKt3G8isnvrgk096AdlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k5ca1/lH+dukXAVDEi74pv71MVyOLIn6WlNcLPRA6YU5bWnsoMg9FxbwSuA9BsovJkw8GoD9HP/YYlvYihwjFALuKr7yuJZ3fdrqRCDhKAtiIY8hwWLItUyYBghqQKy3rvUDVidWOoNLzF7i/mwkrDvv2qK0L8pN8Xfhd5IaF/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwM+9Sxj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwM+9Sxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715484399; x=1747020399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBsJ9mTKrGdfSv7pq9q6dSdMKt3G8isnvrgk096AdlQ=;
  b=MwM+9Sxj81q1/ACUVMFGD2dXwP5BXl7VpzFew2kH4X2yP45rqfYSLjIT
   hvZujCH23zeGgWuEdEcqZJIQ4eSfWdBl70iHUBZCo1uK8cdu8/1vs0Gj/
   PHvCyVr6K9tJdS/UfmTxCfgtdyhqJshZbDTGP94xCKYrIDUa2R2UA8y6A
   oJILh2Go4FAQXg3LLcT9xlMguhVRl03QnLPQg0eeQJRl93O7coYnm+XzT
   vnDa7nfZoCJXk+XiuBqs/0yYP1N1IEa03O4OYKpsINIolGXfIVbfaTr3q
   xytqxWm8hR2xGclI5C8S3gf82h0U318HVZvLaA9Zc/FBd+79W9GtPS9hD
   A==;
X-CSE-ConnectionGUID: aeZWeW1NSiqCxOtSUchkKw==
X-CSE-MsgGUID: xY5PADSzQqOes/F8sdvCXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11616589"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11616589"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 20:26:39 -0700
X-CSE-ConnectionGUID: sKN1iYliQTuCwEykEj/UMA==
X-CSE-MsgGUID: LjU1VU+0QPK697RTW5RiSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="30122295"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 May 2024 20:26:38 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5zr9-00087b-11;
	Sun, 12 May 2024 03:26:35 +0000
Date: Sun, 12 May 2024 11:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v8 3/3] pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO
 driver
Message-ID: <202405121133.eykxulmj-lkp@intel.com>
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
In-Reply-To: <20240508065141.565848-4-ychuang570808@gmail.com>
References: <20240508065141.565848-4-ychuang570808@gmail.com>
TO: Jacky Huang <ychuang570808@gmail.com>
TO: linus.walleij@linaro.org
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: p.zabel@pengutronix.de
TO: j.neuschaefer@gmx.net
CC: linux-arm-kernel@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: ychuang3@nuvoton.com
CC: schung@nuvoton.com

Hi Jacky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next pza/reset/next robh/for-next linus/master v6.9-rc7 next-20240510]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacky-Huang/dt-bindings-reset-Add-syscon-to-nuvoton-ma35d1-system-management-node/20240508-145358
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20240508065141.565848-4-ychuang570808%40gmail.com
patch subject: [PATCH v8 3/3] pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sparc-randconfig-r081-20240512 (https://download.01.org/0day-ci/archive/20240512/202405121133.eykxulmj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405121133.eykxulmj-lkp@intel.com/

smatch warnings:
drivers/pinctrl/nuvoton/pinctrl-ma35.c:665 ma35_pinconf_set_pull() error: uninitialized symbol 'pull_sel'.

vim +/pull_sel +665 drivers/pinctrl/nuvoton/pinctrl-ma35.c

cb3da13430a6b4 Jacky Huang 2024-05-08  637  
cb3da13430a6b4 Jacky Huang 2024-05-08  638  static int ma35_pinconf_set_pull(struct ma35_pinctrl *npctl, unsigned int pin,
cb3da13430a6b4 Jacky Huang 2024-05-08  639  				 int pull_up)
cb3da13430a6b4 Jacky Huang 2024-05-08  640  {
cb3da13430a6b4 Jacky Huang 2024-05-08  641  	unsigned int port, group_num;
cb3da13430a6b4 Jacky Huang 2024-05-08  642  	void __iomem *base;
cb3da13430a6b4 Jacky Huang 2024-05-08  643  	u32 regval, pull_sel;
cb3da13430a6b4 Jacky Huang 2024-05-08  644  
cb3da13430a6b4 Jacky Huang 2024-05-08  645  	ma35_gpio_cla_port(pin, &group_num, &port);
cb3da13430a6b4 Jacky Huang 2024-05-08  646  	base = npctl->ctrl->pin_banks[group_num].reg_base;
cb3da13430a6b4 Jacky Huang 2024-05-08  647  
cb3da13430a6b4 Jacky Huang 2024-05-08  648  	regval = readl(base + MA35_GP_REG_PUSEL);
cb3da13430a6b4 Jacky Huang 2024-05-08  649  	regval &= ~MA35_GP_PUSEL_MASK(port);
cb3da13430a6b4 Jacky Huang 2024-05-08  650  
cb3da13430a6b4 Jacky Huang 2024-05-08  651  	switch (pull_up) {
cb3da13430a6b4 Jacky Huang 2024-05-08  652  	case PIN_CONFIG_BIAS_PULL_UP:
cb3da13430a6b4 Jacky Huang 2024-05-08  653  		pull_sel = MA35_GP_PUSEL_PULL_UP;
cb3da13430a6b4 Jacky Huang 2024-05-08  654  		break;
cb3da13430a6b4 Jacky Huang 2024-05-08  655  
cb3da13430a6b4 Jacky Huang 2024-05-08  656  	case PIN_CONFIG_BIAS_PULL_DOWN:
cb3da13430a6b4 Jacky Huang 2024-05-08  657  		pull_sel = MA35_GP_PUSEL_PULL_DOWN;
cb3da13430a6b4 Jacky Huang 2024-05-08  658  		break;
cb3da13430a6b4 Jacky Huang 2024-05-08  659  
cb3da13430a6b4 Jacky Huang 2024-05-08  660  	case PIN_CONFIG_BIAS_DISABLE:
cb3da13430a6b4 Jacky Huang 2024-05-08  661  		pull_sel = MA35_GP_PUSEL_DISABLE;
cb3da13430a6b4 Jacky Huang 2024-05-08  662  		break;
cb3da13430a6b4 Jacky Huang 2024-05-08  663  	}
cb3da13430a6b4 Jacky Huang 2024-05-08  664  
cb3da13430a6b4 Jacky Huang 2024-05-08 @665  	regval |= field_prep(MA35_GP_PUSEL_MASK(port), pull_sel);
cb3da13430a6b4 Jacky Huang 2024-05-08  666  	writel(regval, base + MA35_GP_REG_PUSEL);
cb3da13430a6b4 Jacky Huang 2024-05-08  667  
cb3da13430a6b4 Jacky Huang 2024-05-08  668  	return 0;
cb3da13430a6b4 Jacky Huang 2024-05-08  669  }
cb3da13430a6b4 Jacky Huang 2024-05-08  670  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

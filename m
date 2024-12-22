Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ED42A8D0
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 20:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898765; cv=none; b=Twj7w00Ufqhl+nEGFuK4VMoIqPs5GpJ0JxVreqLW551AnbXjZ+lrLMHGAQ4r7ds650TuWPPvupj7+2vJhJRH6Rk4Mj3J3BUHbmExugG8x/bVf1hatPgvo/JtYFLtK6fYi+8x6JieL+iq6bB4oxjCz8PAUMwtqhtt4YMMmdXF8gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898765; c=relaxed/simple;
	bh=kOaM3/PyIVSkcvLCY1UJM0kWou6laBmP35P2LFm/00k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O0k2kELwHCsCQu0aDoi73mb2xHVtRN9n4QR7HJCWMZii8UYJsHTEDujeA5UNTGcKcfJJsQ3v60a7eo/Y9xMgma1qYHmrQiMsG85LjRtC1yS4/u+6LVsBd4n6SD8xqLz8Q1/obaxyWWC6FN4KNVyZwtz67pDOhb7k3IxPEsqMKAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qo1oFU0u; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qo1oFU0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734898763; x=1766434763;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kOaM3/PyIVSkcvLCY1UJM0kWou6laBmP35P2LFm/00k=;
  b=Qo1oFU0uxfkbJ7agfHDupZB/EKiCLrBO8Id0FMQtqYEk7jUS9cF9Pr+R
   ZJTOWLbfG89HD9m13veljK8/2YF0C5oxbA+MWfXLiXxs2VoF28ctSbwrj
   Ie1sz89yN6O5YzS60cXCT1chc/r/nuZN0gngo1X4IWfHQ5dxRxD6atCNl
   PBNPQ2zLAhVwazGYIXeohByp29tO6GV0yxW2E68+vp5E2lO5CJKSPpMAW
   qN0OqIR71b1RYfjHshq17Ca9507FTyGv9wQP4DlkcQUpcPwB8e22Pqivx
   OuJY4rz46UVNIl0XtuOOG73Gb81JspbhYLcESAwWOEU3yxsW/jx1gY2xw
   Q==;
X-CSE-ConnectionGUID: mkrBjgNtQ7CrWvtffqTY0Q==
X-CSE-MsgGUID: BjhoUXTOQ7+L24gKuhBNDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35402762"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35402762"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 12:19:22 -0800
X-CSE-ConnectionGUID: lkwy9GMDQ+mEib36i5VXUw==
X-CSE-MsgGUID: pA0Tm40NQF2BinRGyyENfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99488833"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Dec 2024 12:19:22 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPSQ3-000399-0j;
	Sun, 22 Dec 2024 20:19:19 +0000
Date: Mon, 23 Dec 2024 04:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] pinctrl: bcm63268: Add gpio function
Message-ID: <202412230343.e5klDKSR-lkp@intel.com>
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
In-Reply-To: <20241207223335.17535-1-kylehendrydev@gmail.com>
References: <20241207223335.17535-1-kylehendrydev@gmail.com>
TO: Kyle Hendry <kylehendrydev@gmail.com>
TO: linus.walleij@linaro.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Kyle Hendry <kylehendrydev@gmail.com>

Hi Kyle,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Hendry/pinctrl-bcm63268-Add-gpio-function/20241208-063718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241207223335.17535-1-kylehendrydev%40gmail.com
patch subject: [PATCH] pinctrl: bcm63268: Add gpio function
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-r072-20241219 (https://download.01.org/0day-ci/archive/20241223/202412230343.e5klDKSR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412230343.e5klDKSR-lkp@intel.com/

smatch warnings:
drivers/pinctrl/bcm/pinctrl-bcm63268.c:638 bcm63268_pinctrl_set_mux() error: uninitialized symbol 'reg'.
drivers/pinctrl/bcm/pinctrl-bcm63268.c:638 bcm63268_pinctrl_set_mux() error: uninitialized symbol 'mask'.
drivers/pinctrl/bcm/pinctrl-bcm63268.c:638 bcm63268_pinctrl_set_mux() error: uninitialized symbol 'val'.

vim +/reg +638 drivers/pinctrl/bcm/pinctrl-bcm63268.c

155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  595  
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  596  static int bcm63268_pinctrl_set_mux(struct pinctrl_dev *pctldev,
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  597  				    unsigned selector, unsigned group)
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  598  {
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  599  	struct bcm63xx_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
0e3db16300fbae5 Andy Shevchenko        2022-06-20  600  	const struct pingroup *pg = &bcm63268_groups[group];
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  601  	const struct bcm63268_function *f = &bcm63268_funcs[selector];
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  602  	unsigned i;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  603  	unsigned int reg;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  604  	unsigned int val, mask;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  605  
0e3db16300fbae5 Andy Shevchenko        2022-06-20  606  	for (i = 0; i < pg->npins; i++)
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  607  		bcm63268_set_gpio(pc, pg->pins[i]);
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  608  
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  609  	switch (f->reg) {
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  610  	case BCM63268_LEDCTRL:
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  611  		reg = BCM63268_LED_REG;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  612  		mask = BIT(pg->pins[0]);
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  613  		val = BIT(pg->pins[0]);
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  614  		break;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  615  	case BCM63268_MODE:
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  616  		reg = BCM63268_MODE_REG;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  617  		mask = BIT(pg->pins[0]);
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  618  		val = BIT(pg->pins[0]);
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  619  		break;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  620  	case BCM63268_CTRL:
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  621  		reg = BCM63268_CTRL_REG;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  622  		mask = BIT(pg->pins[0]);
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  623  		val = 0;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  624  		break;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  625  	case BCM63268_BASEMODE:
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  626  		reg = BCM63268_BASEMODE_REG;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  627  		mask = f->mask;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  628  		val = f->mask;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  629  		break;
238592f9a24c78b Kyle Hendry            2024-12-07  630  	case BCM63268_NOREG:
238592f9a24c78b Kyle Hendry            2024-12-07  631  		/*Do nothing, leave registers as default*/
238592f9a24c78b Kyle Hendry            2024-12-07  632  		break;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  633  	default:
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  634  		WARN_ON(1);
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  635  		return -EINVAL;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  636  	}
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  637  
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24 @638  	regmap_update_bits(pc->regs, reg, mask, val);
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  639  
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  640  	return 0;
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  641  }
155cca1b0794a8f Álvaro Fernández Rojas 2021-03-24  642  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

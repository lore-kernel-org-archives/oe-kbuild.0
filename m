Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB291552E0
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Nov 2024 06:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730530705; cv=none; b=AxWLhoS8KZL6TUvjW1xgZsEqIT3/jc8KOfCjkk2BLusX4qs0s5dmJga2iqgb7RtiFsfLv+/U1/69N4qgc2+QLhy3Dem++64TYHoi53hf6MpyWnQkGt7Ir/nLs8OY82DFujA20L6Q0Puuf20jI7GL4I+UWXoh4cjeKjbac/TwIp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730530705; c=relaxed/simple;
	bh=XRaqMlJ8w54WaIsPz4DiID7KozcsionV1ANrffGhEhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=plwOh9eoAODa0NDBhJr/JpL0LRbr1RzXL3RD6YU3NT7DrevlwH9inwiAHsQPqlrZJvBmra8y3ArzkJuK/PCUydMsQYqSo8B5pguPzUrUTuU82IZWxQZMxM938WBF97o5J8aS5EzdlyyufNoFcPG8yWzCzKd+rGOYhFwFrSbgIYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5ewuAPE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5ewuAPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730530704; x=1762066704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XRaqMlJ8w54WaIsPz4DiID7KozcsionV1ANrffGhEhc=;
  b=U5ewuAPE0/BP6KjxXSleb+9WIBwXGiXnqlPmgWc7FrQXx4anVaBHXawt
   h37I+f2rxDaw3WI3Rn7DyexOngMxHDeJJOiMctG/x2404U/Bvo2QKxR17
   7L1YO3N6hGHxvN77uFIjmUQUMzB6VI+axYMPF0emOVgSGOpd6jkDbGgY3
   TUW2p3YEJ2AOgrdk159fdImcKW3j2nLbzsAmFiOOFQb6rSBJaI1rvTM2X
   vF+RJN+wuXhkOCCsbmh57arTG6mv5Ukw5X/efP0DkVWWP0QGoGox96OnC
   XTUcBbB9DzvonbTTZoc4BUJi/VUWViWj6kTjBfNRFiB7b2VvE85SdK3E/
   Q==;
X-CSE-ConnectionGUID: Yev9ugKZRiuZwLksU1iJJg==
X-CSE-MsgGUID: 8cZGbhPqSx2EPmyUw+fPVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30062941"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30062941"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 23:58:21 -0700
X-CSE-ConnectionGUID: LQBiFdd0T8uWbthjruugeg==
X-CSE-MsgGUID: HtXrqJ5jTRmOPwMqc649FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,252,1725346800"; 
   d="scan'208";a="88296877"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Nov 2024 23:58:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t785R-000iXF-18;
	Sat, 02 Nov 2024 06:58:17 +0000
Date: Sat, 2 Nov 2024 14:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <202411021431.282g2yZy-lkp@intel.com>
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
In-Reply-To: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
References: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>
TO: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Chester Lin <chester62515@gmail.com>
TO: Matthias Brugger <mbrugger@suse.com>
TO: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
TO: Larisa Grigore <larisa.grigore@nxp.com>
TO: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Dong Aisheng <aisheng.dong@nxp.com>
TO: Jacky Bai <ping.bai@nxp.com>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: NXP S32 Linux Team <s32@nxp.com>
CC: Christophe Lizzi <clizzi@redhat.com>
CC: Alberto Ruiz <aruizrui@redhat.com>
CC: Enric Balletbo <eballetb@redhat.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: imx@lists.linux.dev

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next lee-mfd/for-mfd-next shawnguo/for-next linus/master lee-mfd/for-mfd-fixes v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20241101-160940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241101080614.1070819-3-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: csky-randconfig-r072-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021431.282g2yZy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411021431.282g2yZy-lkp@intel.com/

smatch warnings:
drivers/mfd/nxp-siul2.c:311 nxp_siul2_init_regmap() error: uninitialized symbol 'ret'.

vim +/ret +311 drivers/mfd/nxp-siul2.c

5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  266  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  267  static int nxp_siul2_init_regmap(struct platform_device *pdev,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  268  				 void __iomem *base, int siul)
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  269  {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  270  	struct regmap_config regmap_configs[SIUL2_NUM_REG_TYPES] = {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  271  		[SIUL2_MPIDR]	= nxp_siul2_regmap_generic_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  272  		[SIUL2_IRQ]	= nxp_siul2_regmap_irq_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  273  		[SIUL2_MSCR]	= nxp_siul2_regmap_generic_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  274  		[SIUL2_IMCR]	= nxp_siul2_regmap_generic_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  275  		[SIUL2_PGPDO]	= nxp_siul2_regmap_pgpdo_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  276  		[SIUL2_PGPDI]	= nxp_siul2_regmap_pgpdi_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  277  	};
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  278  	const struct nxp_siul2_reg_range_info *tmp_range;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  279  	struct regmap_config *tmp_conf;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  280  	struct nxp_siul2_info *info;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  281  	struct nxp_siul2_mfd *priv;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  282  	void __iomem *reg_start;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  283  	int i, ret;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  284  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  285  	priv = platform_get_drvdata(pdev);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  286  	info = &priv->siul2[siul];
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  287  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  288  	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  289  		if (!s32g2_reg_ranges[siul][i].valid)
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  290  			continue;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  291  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  292  		tmp_range = &s32g2_reg_ranges[siul][i];
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  293  		tmp_conf = &regmap_configs[i];
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  294  		tmp_conf->name = tmp_range->reg_name;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  295  		tmp_conf->max_register =
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  296  			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  297  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  298  		if (tmp_conf->cache_type != REGCACHE_NONE)
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  299  			tmp_conf->num_reg_defaults_raw =
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  300  				tmp_conf->max_register / tmp_conf->reg_stride;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  301  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  302  		if (tmp_range->reg_access) {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  303  			tmp_conf->wr_table = tmp_range->reg_access;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  304  			tmp_conf->rd_table = tmp_range->reg_access;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  305  		}
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  306  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  307  		reg_start = base + tmp_range->reg_start_offset;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  308  		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  309  							 tmp_conf);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  310  		if (IS_ERR(info->regmaps[i])) {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01 @311  			dev_err(&pdev->dev, "regmap %d init failed: %d\n", i,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  312  				ret);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  313  			return PTR_ERR(info->regmaps[i]);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  314  		}
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  315  	}
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  316  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  317  	return 0;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  318  }
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

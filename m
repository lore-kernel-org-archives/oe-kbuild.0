Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A00247788
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpvNxGLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700563548; x=1732099548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dlUVWvhrW7TzTKUleQ+fTFAeOpyHsqg3JFL0tByiuUQ=;
  b=XpvNxGLRxok4vjv8G1YfgyHdEuLey2tSjlObMZNjaZPFaIXFM0qAHt3f
   FJUwOTv8HtBruk/M+OReifwZvoGw/EG5bWee5oGGrY12DLKnqwU6NJtaS
   nor2pDFO+OAxhET+qyHxmtWSIrdYhry1tp8aV+TttTWcqS1lPHviJY/Kq
   9G+NB6t1NijaUEt1ics7dsHKiyiEEhurHvFqeU/nJQuPN/alUTXy8NMUH
   YKWkapQXGXJW3xhOJp57YAeYUNccn40ZpBNh/Aq7Qc0Utd4t61kIrcn4B
   FMLIAXNkaGDuuYq95743H8fUnBfMwN7Ixm2gx2kalbBAzwYYJ3ak58a84
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371988227"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371988227"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 02:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="770219842"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="770219842"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Nov 2023 02:45:46 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5OFs-0007hc-13;
	Tue, 21 Nov 2023 10:45:27 +0000
Date: Tue, 21 Nov 2023 18:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/6] irqchip: Introduce RTD1319 support using the
 Realtek common interrupt controller driver
Message-ID: <202311211806.LbiI5eQs-lkp@intel.com>
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
In-Reply-To: <20231117162709.1096585-4-james.tai@realtek.com>
References: <20231117162709.1096585-4-james.tai@realtek.com>
TO: James Tai <james.tai@realtek.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Marc Zyngier <maz@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: James Tai <james.tai@realtek.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on robh/for-next linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Tai/dt-bindings-interrupt-controller-Add-support-for-Realtek-DHC-SoCs/20231118-003036
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20231117162709.1096585-4-james.tai%40realtek.com
patch subject: [PATCH v2 3/6] irqchip: Introduce RTD1319 support using the Realtek common interrupt controller driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: nios2-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231121/202311211806.LbiI5eQs-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211806.LbiI5eQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311211806.LbiI5eQs-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-realtek-intc-common.c:179 realtek_intc_probe() warn: ignoring unreachable code.
drivers/irqchip/irq-realtek-intc-common.c:187 realtek_intc_probe() warn: 'data->base' from of_iomap() not released on lines: 176,182.
drivers/soc/mediatek/mtk-pmic-wrap.c:2660 pwrap_probe() warn: 'wrp->clk_sys' from clk_prepare_enable() not released on lines: 2660.
drivers/soc/mediatek/mtk-pmic-wrap.c:2660 pwrap_probe() warn: 'wrp->clk_tmr' from clk_prepare_enable() not released on lines: 2660.

vim +179 drivers/irqchip/irq-realtek-intc-common.c

40e5ff4eaef72b3 James Tai 2023-11-18  154  
40e5ff4eaef72b3 James Tai 2023-11-18  155  int realtek_intc_probe(struct platform_device *pdev, const struct realtek_intc_info *info)
40e5ff4eaef72b3 James Tai 2023-11-18  156  {
40e5ff4eaef72b3 James Tai 2023-11-18  157  	struct realtek_intc_data *data;
40e5ff4eaef72b3 James Tai 2023-11-18  158  	struct device *dev = &pdev->dev;
40e5ff4eaef72b3 James Tai 2023-11-18  159  	struct device_node *node = dev->of_node;
40e5ff4eaef72b3 James Tai 2023-11-18  160  	int ret, i;
40e5ff4eaef72b3 James Tai 2023-11-18  161  
40e5ff4eaef72b3 James Tai 2023-11-18  162  	data = devm_kzalloc(dev, struct_size(data, subset_data, info->cfg_num), GFP_KERNEL);
40e5ff4eaef72b3 James Tai 2023-11-18  163  	if (!data)
40e5ff4eaef72b3 James Tai 2023-11-18  164  		return -ENOMEM;
40e5ff4eaef72b3 James Tai 2023-11-18  165  
40e5ff4eaef72b3 James Tai 2023-11-18  166  	data->base = of_iomap(node, 0);
40e5ff4eaef72b3 James Tai 2023-11-18  167  	if (!data->base)
40e5ff4eaef72b3 James Tai 2023-11-18  168  		return -ENOMEM;
40e5ff4eaef72b3 James Tai 2023-11-18  169  
40e5ff4eaef72b3 James Tai 2023-11-18  170  	data->info = info;
40e5ff4eaef72b3 James Tai 2023-11-18  171  
40e5ff4eaef72b3 James Tai 2023-11-18  172  	raw_spin_lock_init(&data->lock);
40e5ff4eaef72b3 James Tai 2023-11-18  173  
40e5ff4eaef72b3 James Tai 2023-11-18  174  	data->domain = irq_domain_add_linear(node, 32, &realtek_intc_domain_ops, data);
40e5ff4eaef72b3 James Tai 2023-11-18  175  	if (!data->domain)
40e5ff4eaef72b3 James Tai 2023-11-18  176  		return -ENOMEM;
40e5ff4eaef72b3 James Tai 2023-11-18  177  
40e5ff4eaef72b3 James Tai 2023-11-18  178  	data->subset_data_num = info->cfg_num;
40e5ff4eaef72b3 James Tai 2023-11-18 @179  	for (i = 0; i < info->cfg_num; i++) {
40e5ff4eaef72b3 James Tai 2023-11-18  180  		ret = realtek_intc_subset(node, data, i);
40e5ff4eaef72b3 James Tai 2023-11-18  181  		WARN(ret, "failed to init subset %d: %d", i, ret);
40e5ff4eaef72b3 James Tai 2023-11-18  182  		return -ENOMEM;
40e5ff4eaef72b3 James Tai 2023-11-18  183  	}
40e5ff4eaef72b3 James Tai 2023-11-18  184  
40e5ff4eaef72b3 James Tai 2023-11-18  185  	platform_set_drvdata(pdev, data);
40e5ff4eaef72b3 James Tai 2023-11-18  186  
40e5ff4eaef72b3 James Tai 2023-11-18 @187  	return 0;
40e5ff4eaef72b3 James Tai 2023-11-18  188  }
40e5ff4eaef72b3 James Tai 2023-11-18  189  EXPORT_SYMBOL(realtek_intc_probe);
40e5ff4eaef72b3 James Tai 2023-11-18  190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

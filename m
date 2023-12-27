Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382E15680
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Dec 2023 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJCJY67l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703664379; x=1735200379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=weiSYgf9ZIQBSL/dW7FqQ171iHg0wyQemzo0Hp0r6dk=;
  b=DJCJY67lLRL28v8xD/bjeYqqGQnXp0JowzQW7rGUv+cyb6/kpC0s14ki
   LYSA/GWDDV9Fe9XJrnEc+8i1gGPfRKg7mcSut04B9zv6czEBosmUs9Stl
   fa+0kFz6ckofjBSYvFNVpSIZY2nYJW60wO54kIiQYnkhbTPOoWdIchMIZ
   BX1Zc2ddWsLHFaPz0lEPFexqI/jse9JrxeC/D1FejktM5i4NRH5I6EmrA
   M0CebhVkcYmhypJZY9qSCeJ75MglojVsAM8izNx/FPRKtu6xMMofFisQS
   Uzw+7hSLD5nhKZIRJ24gEZiGiU67+DjETdilg8upkfFGbK4psWo4v0p1G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="375920642"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="375920642"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 00:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="848623684"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="848623684"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2023 00:06:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIOvf-000FCz-0S;
	Wed, 27 Dec 2023 08:06:15 +0000
Date: Wed, 27 Dec 2023 16:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ulf-hansson-pm:multi_pm_domain_helper_wip 10/13]
 drivers/base/power/common.c:233 dev_pm_domain_attach_list() error: we
 previously assumed 'data' could be null (see line 208)
Message-ID: <202312271643.suvQaD6e-lkp@intel.com>
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
TO: Ulf Hansson <ulf.hansson@linaro.org>

tree:   git://git.linaro.org/people/ulf.hansson/linux-pm.git multi_pm_domain_helper_wip
head:   c373a555b9431bd2f822e715240e42435f6cb4a0
commit: 0c4966651a6b06edffb3ca16db814e0c15d7fbb0 [10/13] PM: domains: Add helper function to attach multiple PM domains
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20231227 (https://download.01.org/0day-ci/archive/20231227/202312271643.suvQaD6e-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312271643.suvQaD6e-lkp@intel.com/

smatch warnings:
drivers/base/power/common.c:233 dev_pm_domain_attach_list() error: we previously assumed 'data' could be null (see line 208)

vim +/data +233 drivers/base/power/common.c

27dceb81f445c5 Ulf Hansson 2018-06-29  169  
0c4966651a6b06 Ulf Hansson 2023-12-21  170  /**
0c4966651a6b06 Ulf Hansson 2023-12-21  171   * dev_pm_domain_attach_list - Associate a device with its PM domains.
0c4966651a6b06 Ulf Hansson 2023-12-21  172   * @dev: The device used to lookup the PM domains for.
0c4966651a6b06 Ulf Hansson 2023-12-21  173   * @data: The data used for attaching to the PM domains.
0c4966651a6b06 Ulf Hansson 2023-12-21  174   * @list: An out-parameter with an allocated list of attached PM domains.
0c4966651a6b06 Ulf Hansson 2023-12-21  175   *
0c4966651a6b06 Ulf Hansson 2023-12-21  176   * This function helps to attach a device to its multiple PM domains. The
0c4966651a6b06 Ulf Hansson 2023-12-21  177   * caller, which is typically a driver's probe function, may provide a list of
0c4966651a6b06 Ulf Hansson 2023-12-21  178   * names for the PM domains that we should try to attach the device to, but it
0c4966651a6b06 Ulf Hansson 2023-12-21  179   * may also provide an empty list, in case the attach should be done for all of
0c4966651a6b06 Ulf Hansson 2023-12-21  180   * the available PM domains.
0c4966651a6b06 Ulf Hansson 2023-12-21  181   *
0c4966651a6b06 Ulf Hansson 2023-12-21  182   * Callers must ensure proper synchronization of this function with power
0c4966651a6b06 Ulf Hansson 2023-12-21  183   * management callbacks.
0c4966651a6b06 Ulf Hansson 2023-12-21  184   *
0c4966651a6b06 Ulf Hansson 2023-12-21  185   * Returns the number of attached PM domains or a negative error code in case of
0c4966651a6b06 Ulf Hansson 2023-12-21  186   * a failure. Note that, to detach the list of PM domains, the driver shall call
0c4966651a6b06 Ulf Hansson 2023-12-21  187   * dev_pm_domain_detach_list(), typically during the remove phase.
0c4966651a6b06 Ulf Hansson 2023-12-21  188   */
0c4966651a6b06 Ulf Hansson 2023-12-21  189  int dev_pm_domain_attach_list(struct device *dev,
0c4966651a6b06 Ulf Hansson 2023-12-21  190  			      const struct dev_pm_domain_attach_data *data,
0c4966651a6b06 Ulf Hansson 2023-12-21  191  			      struct dev_pm_domain_list **list)
0c4966651a6b06 Ulf Hansson 2023-12-21  192  {
0c4966651a6b06 Ulf Hansson 2023-12-21  193  	struct device_node *np = dev->of_node;
0c4966651a6b06 Ulf Hansson 2023-12-21  194  	struct dev_pm_domain_list *pds;
0c4966651a6b06 Ulf Hansson 2023-12-21  195  	struct device *pd_dev = NULL;
0c4966651a6b06 Ulf Hansson 2023-12-21  196  	int ret, i, num_pds = 0;
0c4966651a6b06 Ulf Hansson 2023-12-21  197  	bool by_id = true;
0c4966651a6b06 Ulf Hansson 2023-12-21  198  	u32 link_flags = data && data->pd_flags & PD_FLAG_NO_DEV_LINK ? 0 :
0c4966651a6b06 Ulf Hansson 2023-12-21  199  			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME;
0c4966651a6b06 Ulf Hansson 2023-12-21  200  
0c4966651a6b06 Ulf Hansson 2023-12-21  201  	if (dev->pm_domain)
0c4966651a6b06 Ulf Hansson 2023-12-21  202  		return -EEXIST;
0c4966651a6b06 Ulf Hansson 2023-12-21  203  
0c4966651a6b06 Ulf Hansson 2023-12-21  204  	/* For now this is limited to OF based platforms. */
0c4966651a6b06 Ulf Hansson 2023-12-21  205  	if (!np)
0c4966651a6b06 Ulf Hansson 2023-12-21  206  		return 0;
0c4966651a6b06 Ulf Hansson 2023-12-21  207  
0c4966651a6b06 Ulf Hansson 2023-12-21 @208  	if (data && data->pd_names) {
0c4966651a6b06 Ulf Hansson 2023-12-21  209  		num_pds = data->num_pd_names;
0c4966651a6b06 Ulf Hansson 2023-12-21  210  		by_id = false;
0c4966651a6b06 Ulf Hansson 2023-12-21  211  	} else {
0c4966651a6b06 Ulf Hansson 2023-12-21  212  		num_pds = of_count_phandle_with_args(np, "power-domains",
0c4966651a6b06 Ulf Hansson 2023-12-21  213  						     "#power-domain-cells");
0c4966651a6b06 Ulf Hansson 2023-12-21  214  	}
0c4966651a6b06 Ulf Hansson 2023-12-21  215  
0c4966651a6b06 Ulf Hansson 2023-12-21  216  	if (num_pds <= 0)
0c4966651a6b06 Ulf Hansson 2023-12-21  217  		return 0;
0c4966651a6b06 Ulf Hansson 2023-12-21  218  
0c4966651a6b06 Ulf Hansson 2023-12-21  219  	pds = devm_kzalloc(dev, sizeof(*pds), GFP_KERNEL);
0c4966651a6b06 Ulf Hansson 2023-12-21  220  	if (!pds)
0c4966651a6b06 Ulf Hansson 2023-12-21  221  		return -ENOMEM;
0c4966651a6b06 Ulf Hansson 2023-12-21  222  
0c4966651a6b06 Ulf Hansson 2023-12-21  223  	pds->pd_devs = devm_kcalloc(dev, num_pds, sizeof(*pds->pd_devs),
0c4966651a6b06 Ulf Hansson 2023-12-21  224  				    GFP_KERNEL);
0c4966651a6b06 Ulf Hansson 2023-12-21  225  	if (!pds->pd_devs)
0c4966651a6b06 Ulf Hansson 2023-12-21  226  		return -ENOMEM;
0c4966651a6b06 Ulf Hansson 2023-12-21  227  
0c4966651a6b06 Ulf Hansson 2023-12-21  228  	pds->pd_links = devm_kcalloc(dev, num_pds, sizeof(*pds->pd_links),
0c4966651a6b06 Ulf Hansson 2023-12-21  229  				     GFP_KERNEL);
0c4966651a6b06 Ulf Hansson 2023-12-21  230  	if (!pds->pd_links)
0c4966651a6b06 Ulf Hansson 2023-12-21  231  		return -ENOMEM;
0c4966651a6b06 Ulf Hansson 2023-12-21  232  
0c4966651a6b06 Ulf Hansson 2023-12-21 @233  	if (link_flags && data->pd_flags & PD_FLAG_DEV_LINK_ON)
0c4966651a6b06 Ulf Hansson 2023-12-21  234  		link_flags |= DL_FLAG_RPM_ACTIVE;
0c4966651a6b06 Ulf Hansson 2023-12-21  235  
0c4966651a6b06 Ulf Hansson 2023-12-21  236  	for (i = 0; i < num_pds; i++) {
0c4966651a6b06 Ulf Hansson 2023-12-21  237  		if (by_id)
0c4966651a6b06 Ulf Hansson 2023-12-21  238  			pd_dev = dev_pm_domain_attach_by_id(dev, i);
0c4966651a6b06 Ulf Hansson 2023-12-21  239  		else
0c4966651a6b06 Ulf Hansson 2023-12-21  240  			pd_dev = dev_pm_domain_attach_by_name(dev,
0c4966651a6b06 Ulf Hansson 2023-12-21  241  							data->pd_names[i]);
0c4966651a6b06 Ulf Hansson 2023-12-21  242  		if (IS_ERR(pd_dev)) {
0c4966651a6b06 Ulf Hansson 2023-12-21  243  			ret = PTR_ERR(pd_dev);
0c4966651a6b06 Ulf Hansson 2023-12-21  244  			goto err_attach;
0c4966651a6b06 Ulf Hansson 2023-12-21  245  		}
0c4966651a6b06 Ulf Hansson 2023-12-21  246  
0c4966651a6b06 Ulf Hansson 2023-12-21  247  		if (!pd_dev) {
0c4966651a6b06 Ulf Hansson 2023-12-21  248  			ret = -ENODEV;
0c4966651a6b06 Ulf Hansson 2023-12-21  249  			goto err_attach;
0c4966651a6b06 Ulf Hansson 2023-12-21  250  		}
0c4966651a6b06 Ulf Hansson 2023-12-21  251  
0c4966651a6b06 Ulf Hansson 2023-12-21  252  		if (link_flags) {
0c4966651a6b06 Ulf Hansson 2023-12-21  253  			struct device_link *link;
0c4966651a6b06 Ulf Hansson 2023-12-21  254  
0c4966651a6b06 Ulf Hansson 2023-12-21  255  			link = device_link_add(dev, pd_dev, link_flags);
0c4966651a6b06 Ulf Hansson 2023-12-21  256  			if (!link) {
0c4966651a6b06 Ulf Hansson 2023-12-21  257  				ret = -ENODEV;
0c4966651a6b06 Ulf Hansson 2023-12-21  258  				goto err_link;
0c4966651a6b06 Ulf Hansson 2023-12-21  259  			}
0c4966651a6b06 Ulf Hansson 2023-12-21  260  
0c4966651a6b06 Ulf Hansson 2023-12-21  261  			pds->pd_links[i] = link;
0c4966651a6b06 Ulf Hansson 2023-12-21  262  		}
0c4966651a6b06 Ulf Hansson 2023-12-21  263  
0c4966651a6b06 Ulf Hansson 2023-12-21  264  		pds->pd_devs[i] = pd_dev;
0c4966651a6b06 Ulf Hansson 2023-12-21  265  	}
0c4966651a6b06 Ulf Hansson 2023-12-21  266  
0c4966651a6b06 Ulf Hansson 2023-12-21  267  	pds->num_pds = num_pds;
0c4966651a6b06 Ulf Hansson 2023-12-21  268  	*list = pds;
0c4966651a6b06 Ulf Hansson 2023-12-21  269  	return num_pds;
0c4966651a6b06 Ulf Hansson 2023-12-21  270  
0c4966651a6b06 Ulf Hansson 2023-12-21  271  err_link:
0c4966651a6b06 Ulf Hansson 2023-12-21  272  	dev_pm_domain_detach(pd_dev, true);
0c4966651a6b06 Ulf Hansson 2023-12-21  273  err_attach:
0c4966651a6b06 Ulf Hansson 2023-12-21  274  	while (--i >= 0) {
0c4966651a6b06 Ulf Hansson 2023-12-21  275  		if (pds->pd_links[i])
0c4966651a6b06 Ulf Hansson 2023-12-21  276  			device_link_del(pds->pd_links[i]);
0c4966651a6b06 Ulf Hansson 2023-12-21  277  		dev_pm_domain_detach(pds->pd_devs[i], true);
0c4966651a6b06 Ulf Hansson 2023-12-21  278  	}
0c4966651a6b06 Ulf Hansson 2023-12-21  279  	return ret;
0c4966651a6b06 Ulf Hansson 2023-12-21  280  }
0c4966651a6b06 Ulf Hansson 2023-12-21  281  EXPORT_SYMBOL_GPL(dev_pm_domain_attach_list);
0c4966651a6b06 Ulf Hansson 2023-12-21  282  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

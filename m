Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA53126BF1
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 23:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142814; cv=none; b=WqyIKp7A25Iu/F4Xic9Ynb5f6be+q+914Eigl+KgRuSi5TXvlqDDw5QJ0n0BDVxJSDJcpwS4ym2YXl4q5HtIfQPn2qrd5Z9F4Mm0SLYsL/cLdAWhksiyfbS0ALY0i/MaBTN1A27FwQQS2/YtKA7TTCfeLp+e8AUJ/V9IJWPCouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142814; c=relaxed/simple;
	bh=s5KLeFI8aWywiv0dVFNGa2xSshZHuq3cZRxQiXaB0Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WZqTnW++9H3lmkh5OJq+hfz+zfBU2ctP9KWCUGohMHfcOwSh+cl5baKkeMXxe5pywbTSRi/jJWI5hc7IJiMsSfkNFJoHLRHw8KzWN9hXvA5EHCF15rNJ59xUSoxK0+DwAgJODLd2+yuJIRFYY1rBaDfsw6546HXP8CCYmF5FKpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jB/BCr29; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jB/BCr29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746142812; x=1777678812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s5KLeFI8aWywiv0dVFNGa2xSshZHuq3cZRxQiXaB0Yw=;
  b=jB/BCr297QZ8yZZE+mwB/n7SPc9IOCE2ROiJnLSEVFsCTIedgPs/5Na1
   WKVtratj7rZo0Jy+aCbBNfczM9NwydA2lc9jqYqR1CyLE9cd0LLcT5lr+
   UQmbPJYPSnLJu7KT7tEAZZCCsRZNM7GkriOCkjt5TibH05jbRC3VbGT9/
   +EHqZWwtZZhKpkqlrSCPLuKR2YYZsG6egjcCGP3Cr6pqrCtBlJJK/rZhb
   n9JHk9XYqGNECT9og0EihW7uawVXGc7XbzGNpjk2ROE/ttfoeofIS0gMC
   Ra/HLeLojizACmYSHYzCgNm450uuFdWptCHIQxs0o5ZGckHsNBFMgHbVH
   A==;
X-CSE-ConnectionGUID: dgFkWMuSTc+tfzLksznBsQ==
X-CSE-MsgGUID: PJKyuf/4TG2X1AWEmnumOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47080989"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47080989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 16:40:11 -0700
X-CSE-ConnectionGUID: qdqcIQIZQueKjYSSHhVH5g==
X-CSE-MsgGUID: J8MnYMouRDqNk5FFKWlnzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165436556"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 May 2025 16:40:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAdVf-0004RV-23;
	Thu, 01 May 2025 23:40:07 +0000
Date: Fri, 2 May 2025 07:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 3/3] drivers/base/power/common.c:226
 dev_pm_domain_attach_list() warn: double check that we're allocating correct
 size: 8 vs 16
Message-ID: <202505020717.3KCQatR3-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   272d4285dd17049eceb342b5b4f2b4fd346466b5
commit: 77b59b4e6fef43f607a1b823e0ce623c54bbffed [3/3] UPSTREAM: PM: domains: Fix alloc/free in dev_pm_domain_attach|detach_list()
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020717.3KCQatR3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505020717.3KCQatR3-lkp@intel.com/

smatch warnings:
drivers/base/power/common.c:226 dev_pm_domain_attach_list() warn: double check that we're allocating correct size: 8 vs 16

vim +226 drivers/base/power/common.c

27dceb81f445c5 Ulf Hansson 2018-06-29  169  
924cd939d560bc Ulf Hansson 2024-01-30  170  /**
924cd939d560bc Ulf Hansson 2024-01-30  171   * dev_pm_domain_attach_list - Associate a device with its PM domains.
924cd939d560bc Ulf Hansson 2024-01-30  172   * @dev: The device used to lookup the PM domains for.
924cd939d560bc Ulf Hansson 2024-01-30  173   * @data: The data used for attaching to the PM domains.
924cd939d560bc Ulf Hansson 2024-01-30  174   * @list: An out-parameter with an allocated list of attached PM domains.
924cd939d560bc Ulf Hansson 2024-01-30  175   *
924cd939d560bc Ulf Hansson 2024-01-30  176   * This function helps to attach a device to its multiple PM domains. The
924cd939d560bc Ulf Hansson 2024-01-30  177   * caller, which is typically a driver's probe function, may provide a list of
924cd939d560bc Ulf Hansson 2024-01-30  178   * names for the PM domains that we should try to attach the device to, but it
924cd939d560bc Ulf Hansson 2024-01-30  179   * may also provide an empty list, in case the attach should be done for all of
924cd939d560bc Ulf Hansson 2024-01-30  180   * the available PM domains.
924cd939d560bc Ulf Hansson 2024-01-30  181   *
924cd939d560bc Ulf Hansson 2024-01-30  182   * Callers must ensure proper synchronization of this function with power
924cd939d560bc Ulf Hansson 2024-01-30  183   * management callbacks.
924cd939d560bc Ulf Hansson 2024-01-30  184   *
924cd939d560bc Ulf Hansson 2024-01-30  185   * Returns the number of attached PM domains or a negative error code in case of
924cd939d560bc Ulf Hansson 2024-01-30  186   * a failure. Note that, to detach the list of PM domains, the driver shall call
924cd939d560bc Ulf Hansson 2024-01-30  187   * dev_pm_domain_detach_list(), typically during the remove phase.
924cd939d560bc Ulf Hansson 2024-01-30  188   */
924cd939d560bc Ulf Hansson 2024-01-30  189  int dev_pm_domain_attach_list(struct device *dev,
924cd939d560bc Ulf Hansson 2024-01-30  190  			      const struct dev_pm_domain_attach_data *data,
924cd939d560bc Ulf Hansson 2024-01-30  191  			      struct dev_pm_domain_list **list)
924cd939d560bc Ulf Hansson 2024-01-30  192  {
924cd939d560bc Ulf Hansson 2024-01-30  193  	struct device_node *np = dev->of_node;
924cd939d560bc Ulf Hansson 2024-01-30  194  	struct dev_pm_domain_list *pds;
924cd939d560bc Ulf Hansson 2024-01-30  195  	struct device *pd_dev = NULL;
924cd939d560bc Ulf Hansson 2024-01-30  196  	int ret, i, num_pds = 0;
924cd939d560bc Ulf Hansson 2024-01-30  197  	bool by_id = true;
77b59b4e6fef43 Ulf Hansson 2024-10-02  198  	size_t size;
924cd939d560bc Ulf Hansson 2024-01-30  199  	u32 pd_flags = data ? data->pd_flags : 0;
924cd939d560bc Ulf Hansson 2024-01-30  200  	u32 link_flags = pd_flags & PD_FLAG_NO_DEV_LINK ? 0 :
924cd939d560bc Ulf Hansson 2024-01-30  201  			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME;
924cd939d560bc Ulf Hansson 2024-01-30  202  
924cd939d560bc Ulf Hansson 2024-01-30  203  	if (dev->pm_domain)
924cd939d560bc Ulf Hansson 2024-01-30  204  		return -EEXIST;
924cd939d560bc Ulf Hansson 2024-01-30  205  
924cd939d560bc Ulf Hansson 2024-01-30  206  	/* For now this is limited to OF based platforms. */
924cd939d560bc Ulf Hansson 2024-01-30  207  	if (!np)
924cd939d560bc Ulf Hansson 2024-01-30  208  		return 0;
924cd939d560bc Ulf Hansson 2024-01-30  209  
924cd939d560bc Ulf Hansson 2024-01-30  210  	if (data && data->pd_names) {
924cd939d560bc Ulf Hansson 2024-01-30  211  		num_pds = data->num_pd_names;
924cd939d560bc Ulf Hansson 2024-01-30  212  		by_id = false;
924cd939d560bc Ulf Hansson 2024-01-30  213  	} else {
924cd939d560bc Ulf Hansson 2024-01-30  214  		num_pds = of_count_phandle_with_args(np, "power-domains",
924cd939d560bc Ulf Hansson 2024-01-30  215  						     "#power-domain-cells");
924cd939d560bc Ulf Hansson 2024-01-30  216  	}
924cd939d560bc Ulf Hansson 2024-01-30  217  
924cd939d560bc Ulf Hansson 2024-01-30  218  	if (num_pds <= 0)
924cd939d560bc Ulf Hansson 2024-01-30  219  		return 0;
924cd939d560bc Ulf Hansson 2024-01-30  220  
77b59b4e6fef43 Ulf Hansson 2024-10-02  221  	pds = kzalloc(sizeof(*pds), GFP_KERNEL);
924cd939d560bc Ulf Hansson 2024-01-30  222  	if (!pds)
924cd939d560bc Ulf Hansson 2024-01-30  223  		return -ENOMEM;
924cd939d560bc Ulf Hansson 2024-01-30  224  
77b59b4e6fef43 Ulf Hansson 2024-10-02  225  	size = sizeof(*pds->pd_devs) + sizeof(*pds->pd_links);
77b59b4e6fef43 Ulf Hansson 2024-10-02 @226  	pds->pd_devs = kcalloc(num_pds, size, GFP_KERNEL);
77b59b4e6fef43 Ulf Hansson 2024-10-02  227  	if (!pds->pd_devs) {
77b59b4e6fef43 Ulf Hansson 2024-10-02  228  		ret = -ENOMEM;
77b59b4e6fef43 Ulf Hansson 2024-10-02  229  		goto free_pds;
77b59b4e6fef43 Ulf Hansson 2024-10-02  230  	}
77b59b4e6fef43 Ulf Hansson 2024-10-02  231  	pds->pd_links = (void *)(pds->pd_devs + num_pds);
924cd939d560bc Ulf Hansson 2024-01-30  232  
924cd939d560bc Ulf Hansson 2024-01-30  233  	if (link_flags && pd_flags & PD_FLAG_DEV_LINK_ON)
924cd939d560bc Ulf Hansson 2024-01-30  234  		link_flags |= DL_FLAG_RPM_ACTIVE;
924cd939d560bc Ulf Hansson 2024-01-30  235  
924cd939d560bc Ulf Hansson 2024-01-30  236  	for (i = 0; i < num_pds; i++) {
924cd939d560bc Ulf Hansson 2024-01-30  237  		if (by_id)
924cd939d560bc Ulf Hansson 2024-01-30  238  			pd_dev = dev_pm_domain_attach_by_id(dev, i);
924cd939d560bc Ulf Hansson 2024-01-30  239  		else
924cd939d560bc Ulf Hansson 2024-01-30  240  			pd_dev = dev_pm_domain_attach_by_name(dev,
924cd939d560bc Ulf Hansson 2024-01-30  241  							data->pd_names[i]);
924cd939d560bc Ulf Hansson 2024-01-30  242  		if (IS_ERR_OR_NULL(pd_dev)) {
924cd939d560bc Ulf Hansson 2024-01-30  243  			ret = pd_dev ? PTR_ERR(pd_dev) : -ENODEV;
924cd939d560bc Ulf Hansson 2024-01-30  244  			goto err_attach;
924cd939d560bc Ulf Hansson 2024-01-30  245  		}
924cd939d560bc Ulf Hansson 2024-01-30  246  
924cd939d560bc Ulf Hansson 2024-01-30  247  		if (link_flags) {
924cd939d560bc Ulf Hansson 2024-01-30  248  			struct device_link *link;
924cd939d560bc Ulf Hansson 2024-01-30  249  
924cd939d560bc Ulf Hansson 2024-01-30  250  			link = device_link_add(dev, pd_dev, link_flags);
924cd939d560bc Ulf Hansson 2024-01-30  251  			if (!link) {
924cd939d560bc Ulf Hansson 2024-01-30  252  				ret = -ENODEV;
924cd939d560bc Ulf Hansson 2024-01-30  253  				goto err_link;
924cd939d560bc Ulf Hansson 2024-01-30  254  			}
924cd939d560bc Ulf Hansson 2024-01-30  255  
924cd939d560bc Ulf Hansson 2024-01-30  256  			pds->pd_links[i] = link;
924cd939d560bc Ulf Hansson 2024-01-30  257  		}
924cd939d560bc Ulf Hansson 2024-01-30  258  
924cd939d560bc Ulf Hansson 2024-01-30  259  		pds->pd_devs[i] = pd_dev;
924cd939d560bc Ulf Hansson 2024-01-30  260  	}
924cd939d560bc Ulf Hansson 2024-01-30  261  
924cd939d560bc Ulf Hansson 2024-01-30  262  	pds->num_pds = num_pds;
924cd939d560bc Ulf Hansson 2024-01-30  263  	*list = pds;
924cd939d560bc Ulf Hansson 2024-01-30  264  	return num_pds;
924cd939d560bc Ulf Hansson 2024-01-30  265  
924cd939d560bc Ulf Hansson 2024-01-30  266  err_link:
924cd939d560bc Ulf Hansson 2024-01-30  267  	dev_pm_domain_detach(pd_dev, true);
924cd939d560bc Ulf Hansson 2024-01-30  268  err_attach:
924cd939d560bc Ulf Hansson 2024-01-30  269  	while (--i >= 0) {
924cd939d560bc Ulf Hansson 2024-01-30  270  		if (pds->pd_links[i])
924cd939d560bc Ulf Hansson 2024-01-30  271  			device_link_del(pds->pd_links[i]);
924cd939d560bc Ulf Hansson 2024-01-30  272  		dev_pm_domain_detach(pds->pd_devs[i], true);
924cd939d560bc Ulf Hansson 2024-01-30  273  	}
77b59b4e6fef43 Ulf Hansson 2024-10-02  274  	kfree(pds->pd_devs);
77b59b4e6fef43 Ulf Hansson 2024-10-02  275  free_pds:
77b59b4e6fef43 Ulf Hansson 2024-10-02  276  	kfree(pds);
924cd939d560bc Ulf Hansson 2024-01-30  277  	return ret;
924cd939d560bc Ulf Hansson 2024-01-30  278  }
924cd939d560bc Ulf Hansson 2024-01-30  279  EXPORT_SYMBOL_GPL(dev_pm_domain_attach_list);
924cd939d560bc Ulf Hansson 2024-01-30  280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B85366562
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206023; cv=none; b=cMlty9HIsoFI0Ez+1zU1Jx/lwARDIQinQ6ZqqVqhTZLacj7/UHnSDObkF7t/Wn2Z5nfsIMUgWAHelSbN4qDyRc4N7AyXca293ULzQ/EgzlsN0m3XfTdEZFXZVhbCKtCCKLF/ttanVtrZcQD+yG0CRKCOA6g0Gvw/4RK3o+Oz1eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206023; c=relaxed/simple;
	bh=HKBldJ9GTIh7rVrnq4LP/BNVQrTvRRz5RgYwzGP3dSI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uhPgABDyimJ9cWW4xOBFT5aHzsqe5HjdumzwGomg1b94U7AtIVphW2G8J0+e56m55vdqeQgBuIhuNJaAfqFwyVGJZeBy/0xXCBeTF9eDmaLnugnTqujAPOA+Rm3baw+bvufqCFKQOhaptqyscJSNt1urthQuLVn7MEL77tIOviw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5Tqbyy2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5Tqbyy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206022; x=1806742022;
  h=date:from:to:cc:subject:message-id;
  bh=HKBldJ9GTIh7rVrnq4LP/BNVQrTvRRz5RgYwzGP3dSI=;
  b=L5Tqbyy2o8pVDqEGgKU6UnRlZrN2qHFIkUyzinAv+2lhVOMSJxuXMHPz
   pCgD4c8q+U+aM9fO64XB00AXKTVYx6eFLHQ08UxnjH7/fEZR/FW2CxwDL
   YC8fsK0aAYu1UIWyCbOQCRdq7GzFLbOdisoH/NqrhJod1tcKuP5q0t9/q
   slMoxJ6xdAwhfuJdyrv1gc+gb9iIU6HjEJ9AS5wUWD7Tb1vfuFklC68Ji
   izhl1WWdlsb1OVAEfEQUgcEqsJz8TuKX+YfPLTP1lyAEuRBEn5Tsaw4wt
   hI/Zx501H0AbUh8nGm8c0gqxI2Tu+O+sO/XSMJ7GVkaX6UKLMkdFPOPo6
   Q==;
X-CSE-ConnectionGUID: S9DLg6V3Soqo//BQVeeNbQ==
X-CSE-MsgGUID: 6jw4zX1mR8+1JPlYCp3xQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889129"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889129"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:47:00 -0700
X-CSE-ConnectionGUID: dkvcUuy8TtqkG3tpU5vzHQ==
X-CSE-MsgGUID: W4OG272XTSOVTJsQOjXxFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="231605131"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2026 01:47:00 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aB6-0000000016h-36vX;
	Fri, 03 Apr 2026 08:46:56 +0000
Date: Fri, 03 Apr 2026 16:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 8/8]
 drivers/base/power/common.c:226 dev_pm_domain_attach_list() warn: double
 check that we're allocating correct size: 4 vs 8
Message-ID: <202604031237.zHacSBNl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5e515a3e6a73395e13127a3a8172e77da3d9b30
commit: b45e2c927411cd2e48dd5eae01165f2fe01ee27e [8/8] UPSTREAM: PM: domains: Fix alloc/free in dev_pm_domain_attach|detach_list()
:::::: branch date: 30 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20260402 (https://download.01.org/0day-ci/archive/20260403/202604031237.zHacSBNl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604031237.zHacSBNl-lkp@intel.com/

smatch warnings:
drivers/base/power/common.c:226 dev_pm_domain_attach_list() warn: double check that we're allocating correct size: 4 vs 8

vim +226 drivers/base/power/common.c

27dceb81f445c5 Ulf Hansson 2018-06-29  169  
f88293625b3d04 Ulf Hansson 2024-01-26  170  /**
f88293625b3d04 Ulf Hansson 2024-01-26  171   * dev_pm_domain_attach_list - Associate a device with its PM domains.
f88293625b3d04 Ulf Hansson 2024-01-26  172   * @dev: The device used to lookup the PM domains for.
f88293625b3d04 Ulf Hansson 2024-01-26  173   * @data: The data used for attaching to the PM domains.
f88293625b3d04 Ulf Hansson 2024-01-26  174   * @list: An out-parameter with an allocated list of attached PM domains.
f88293625b3d04 Ulf Hansson 2024-01-26  175   *
f88293625b3d04 Ulf Hansson 2024-01-26  176   * This function helps to attach a device to its multiple PM domains. The
f88293625b3d04 Ulf Hansson 2024-01-26  177   * caller, which is typically a driver's probe function, may provide a list of
f88293625b3d04 Ulf Hansson 2024-01-26  178   * names for the PM domains that we should try to attach the device to, but it
f88293625b3d04 Ulf Hansson 2024-01-26  179   * may also provide an empty list, in case the attach should be done for all of
f88293625b3d04 Ulf Hansson 2024-01-26  180   * the available PM domains.
f88293625b3d04 Ulf Hansson 2024-01-26  181   *
f88293625b3d04 Ulf Hansson 2024-01-26  182   * Callers must ensure proper synchronization of this function with power
f88293625b3d04 Ulf Hansson 2024-01-26  183   * management callbacks.
f88293625b3d04 Ulf Hansson 2024-01-26  184   *
f88293625b3d04 Ulf Hansson 2024-01-26  185   * Returns the number of attached PM domains or a negative error code in case of
f88293625b3d04 Ulf Hansson 2024-01-26  186   * a failure. Note that, to detach the list of PM domains, the driver shall call
f88293625b3d04 Ulf Hansson 2024-01-26  187   * dev_pm_domain_detach_list(), typically during the remove phase.
f88293625b3d04 Ulf Hansson 2024-01-26  188   */
f88293625b3d04 Ulf Hansson 2024-01-26  189  int dev_pm_domain_attach_list(struct device *dev,
f88293625b3d04 Ulf Hansson 2024-01-26  190  			      const struct dev_pm_domain_attach_data *data,
f88293625b3d04 Ulf Hansson 2024-01-26  191  			      struct dev_pm_domain_list **list)
f88293625b3d04 Ulf Hansson 2024-01-26  192  {
f88293625b3d04 Ulf Hansson 2024-01-26  193  	struct device_node *np = dev->of_node;
f88293625b3d04 Ulf Hansson 2024-01-26  194  	struct dev_pm_domain_list *pds;
f88293625b3d04 Ulf Hansson 2024-01-26  195  	struct device *pd_dev = NULL;
f88293625b3d04 Ulf Hansson 2024-01-26  196  	int ret, i, num_pds = 0;
f88293625b3d04 Ulf Hansson 2024-01-26  197  	bool by_id = true;
b45e2c927411cd Ulf Hansson 2024-10-02  198  	size_t size;
f88293625b3d04 Ulf Hansson 2024-01-26  199  	u32 pd_flags = data ? data->pd_flags : 0;
f88293625b3d04 Ulf Hansson 2024-01-26  200  	u32 link_flags = pd_flags & PD_FLAG_NO_DEV_LINK ? 0 :
f88293625b3d04 Ulf Hansson 2024-01-26  201  			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME;
f88293625b3d04 Ulf Hansson 2024-01-26  202  
f88293625b3d04 Ulf Hansson 2024-01-26  203  	if (dev->pm_domain)
f88293625b3d04 Ulf Hansson 2024-01-26  204  		return -EEXIST;
f88293625b3d04 Ulf Hansson 2024-01-26  205  
f88293625b3d04 Ulf Hansson 2024-01-26  206  	/* For now this is limited to OF based platforms. */
f88293625b3d04 Ulf Hansson 2024-01-26  207  	if (!np)
f88293625b3d04 Ulf Hansson 2024-01-26  208  		return 0;
f88293625b3d04 Ulf Hansson 2024-01-26  209  
f88293625b3d04 Ulf Hansson 2024-01-26  210  	if (data && data->pd_names) {
f88293625b3d04 Ulf Hansson 2024-01-26  211  		num_pds = data->num_pd_names;
f88293625b3d04 Ulf Hansson 2024-01-26  212  		by_id = false;
f88293625b3d04 Ulf Hansson 2024-01-26  213  	} else {
f88293625b3d04 Ulf Hansson 2024-01-26  214  		num_pds = of_count_phandle_with_args(np, "power-domains",
f88293625b3d04 Ulf Hansson 2024-01-26  215  						     "#power-domain-cells");
f88293625b3d04 Ulf Hansson 2024-01-26  216  	}
f88293625b3d04 Ulf Hansson 2024-01-26  217  
f88293625b3d04 Ulf Hansson 2024-01-26  218  	if (num_pds <= 0)
f88293625b3d04 Ulf Hansson 2024-01-26  219  		return 0;
f88293625b3d04 Ulf Hansson 2024-01-26  220  
b45e2c927411cd Ulf Hansson 2024-10-02  221  	pds = kzalloc(sizeof(*pds), GFP_KERNEL);
f88293625b3d04 Ulf Hansson 2024-01-26  222  	if (!pds)
f88293625b3d04 Ulf Hansson 2024-01-26  223  		return -ENOMEM;
f88293625b3d04 Ulf Hansson 2024-01-26  224  
b45e2c927411cd Ulf Hansson 2024-10-02  225  	size = sizeof(*pds->pd_devs) + sizeof(*pds->pd_links);
b45e2c927411cd Ulf Hansson 2024-10-02 @226  	pds->pd_devs = kcalloc(num_pds, size, GFP_KERNEL);
b45e2c927411cd Ulf Hansson 2024-10-02  227  	if (!pds->pd_devs) {
b45e2c927411cd Ulf Hansson 2024-10-02  228  		ret = -ENOMEM;
b45e2c927411cd Ulf Hansson 2024-10-02  229  		goto free_pds;
b45e2c927411cd Ulf Hansson 2024-10-02  230  	}
b45e2c927411cd Ulf Hansson 2024-10-02  231  	pds->pd_links = (void *)(pds->pd_devs + num_pds);
f88293625b3d04 Ulf Hansson 2024-01-26  232  
f88293625b3d04 Ulf Hansson 2024-01-26  233  	if (link_flags && pd_flags & PD_FLAG_DEV_LINK_ON)
f88293625b3d04 Ulf Hansson 2024-01-26  234  		link_flags |= DL_FLAG_RPM_ACTIVE;
f88293625b3d04 Ulf Hansson 2024-01-26  235  
f88293625b3d04 Ulf Hansson 2024-01-26  236  	for (i = 0; i < num_pds; i++) {
f88293625b3d04 Ulf Hansson 2024-01-26  237  		if (by_id)
f88293625b3d04 Ulf Hansson 2024-01-26  238  			pd_dev = dev_pm_domain_attach_by_id(dev, i);
f88293625b3d04 Ulf Hansson 2024-01-26  239  		else
f88293625b3d04 Ulf Hansson 2024-01-26  240  			pd_dev = dev_pm_domain_attach_by_name(dev,
f88293625b3d04 Ulf Hansson 2024-01-26  241  							data->pd_names[i]);
f88293625b3d04 Ulf Hansson 2024-01-26  242  		if (IS_ERR_OR_NULL(pd_dev)) {
f88293625b3d04 Ulf Hansson 2024-01-26  243  			ret = pd_dev ? PTR_ERR(pd_dev) : -ENODEV;
f88293625b3d04 Ulf Hansson 2024-01-26  244  			goto err_attach;
f88293625b3d04 Ulf Hansson 2024-01-26  245  		}
f88293625b3d04 Ulf Hansson 2024-01-26  246  
f88293625b3d04 Ulf Hansson 2024-01-26  247  		if (link_flags) {
f88293625b3d04 Ulf Hansson 2024-01-26  248  			struct device_link *link;
f88293625b3d04 Ulf Hansson 2024-01-26  249  
f88293625b3d04 Ulf Hansson 2024-01-26  250  			link = device_link_add(dev, pd_dev, link_flags);
f88293625b3d04 Ulf Hansson 2024-01-26  251  			if (!link) {
f88293625b3d04 Ulf Hansson 2024-01-26  252  				ret = -ENODEV;
f88293625b3d04 Ulf Hansson 2024-01-26  253  				goto err_link;
f88293625b3d04 Ulf Hansson 2024-01-26  254  			}
f88293625b3d04 Ulf Hansson 2024-01-26  255  
f88293625b3d04 Ulf Hansson 2024-01-26  256  			pds->pd_links[i] = link;
f88293625b3d04 Ulf Hansson 2024-01-26  257  		}
f88293625b3d04 Ulf Hansson 2024-01-26  258  
f88293625b3d04 Ulf Hansson 2024-01-26  259  		pds->pd_devs[i] = pd_dev;
f88293625b3d04 Ulf Hansson 2024-01-26  260  	}
f88293625b3d04 Ulf Hansson 2024-01-26  261  
f88293625b3d04 Ulf Hansson 2024-01-26  262  	pds->num_pds = num_pds;
f88293625b3d04 Ulf Hansson 2024-01-26  263  	*list = pds;
f88293625b3d04 Ulf Hansson 2024-01-26  264  	return num_pds;
f88293625b3d04 Ulf Hansson 2024-01-26  265  
f88293625b3d04 Ulf Hansson 2024-01-26  266  err_link:
f88293625b3d04 Ulf Hansson 2024-01-26  267  	dev_pm_domain_detach(pd_dev, true);
f88293625b3d04 Ulf Hansson 2024-01-26  268  err_attach:
f88293625b3d04 Ulf Hansson 2024-01-26  269  	while (--i >= 0) {
f88293625b3d04 Ulf Hansson 2024-01-26  270  		if (pds->pd_links[i])
f88293625b3d04 Ulf Hansson 2024-01-26  271  			device_link_del(pds->pd_links[i]);
f88293625b3d04 Ulf Hansson 2024-01-26  272  		dev_pm_domain_detach(pds->pd_devs[i], true);
f88293625b3d04 Ulf Hansson 2024-01-26  273  	}
b45e2c927411cd Ulf Hansson 2024-10-02  274  	kfree(pds->pd_devs);
b45e2c927411cd Ulf Hansson 2024-10-02  275  free_pds:
b45e2c927411cd Ulf Hansson 2024-10-02  276  	kfree(pds);
f88293625b3d04 Ulf Hansson 2024-01-26  277  	return ret;
f88293625b3d04 Ulf Hansson 2024-01-26  278  }
f88293625b3d04 Ulf Hansson 2024-01-26  279  EXPORT_SYMBOL_GPL(dev_pm_domain_attach_list);
f88293625b3d04 Ulf Hansson 2024-01-26  280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B7A3F9F2E
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 18:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139852; cv=none; b=g/QUeexGc9oP81+WYrAeMLBBuTNxM6FFT/yu7wegSsdFkyWTQc861arXjHYAcq1zLmxTyzfXtgplFu1vz7yfap1Lv217wFOhDkajCFQ8D/Dqoybzjm74eWKjbZxx2FmNLAuEsgqH6H9CKZmtJm5l63bF9E/rqhzrUOQAzqJcwYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139852; c=relaxed/simple;
	bh=gxV56yEGVRRL+fZ4zdwc1pQGDBkiMeDvIgCiLnoJzUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Am+K+NoPxzv+Nbfzy7DsnF4Lu/4yfim2f8K1ohOXAFXMgeq/IwZog820ZdAPi+cLN5GKnnbk/xMUhnyw1Z6mgt9ibNgyiBe7iEbnnHevSEC63EJXUJU//llYth/9CNN0bq+gnKy8dnUZB65O/foY8lMPQFe7MUFdLIfpkfwvBEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDvEdRaE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDvEdRaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791139851; x=1822675851;
  h=date:from:to:cc:subject:message-id;
  bh=gxV56yEGVRRL+fZ4zdwc1pQGDBkiMeDvIgCiLnoJzUo=;
  b=fDvEdRaE+bhiyDdLDF0yh9a/SefLR8oBgPKI2cL8Y+2EhOLojlB6ZK56
   /ii8Dtdgx8lWXg4AxY3vuMODN2/nGRu3cxF2Hssm8/X3DG56iIjsELrzX
   PFytH7YqXHfWEcmmtazfq94tykCiAPc1SK5F/7w4o6ue2J+Uu0pwZF5gr
   YXIr11D+UMy+BzIFyGV4StYXBKiOUoniFmsDOY5QQS54JZBOTjoknNbhv
   52LQK5rWNrfCbsBSYAOOxTjSGU56JMgmxdeVkm5IPWGUFHNA0NA+WlkCe
   U0p/Po25cnklIGQWpRX8kLrjHzNkbEoidMpas22YI309r/eW+O3m2f1qx
   g==;
X-CSE-ConnectionGUID: 5T7fa5HTQU+uUlHK3aL4HQ==
X-CSE-MsgGUID: PXHtdjeaQf2T/FIHWSbf6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91683665"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91683665"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 11:50:50 -0700
X-CSE-ConnectionGUID: bkgIJ6Q7Qv2TfSFtgx1jjA==
X-CSE-MsgGUID: dJ3sjOADRJSi77zwEcERPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="276792995"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Oct 2026 11:50:49 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDRIN-000000000Nv-1ocL;
	Sun, 04 Oct 2026 18:50:47 +0000
Date: Sun, 04 Oct 2026 20:49:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpio/gpiolib-shared.c:335
 gpio_shared_make_proxy_dev() warn: missing error code 'ret'
Message-ID: <202610042019.eTtddedV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpio-shared-fix-use-after-free-bug-when-adding-shared-proxies/20261001-163147
head:   33a59c84f6eeb1152ed70c31bdc81f52ed514eee
commit: 33a59c84f6eeb1152ed70c31bdc81f52ed514eee gpio: shared: convert to using software nodes for GPIO shared proxy lookup
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: m68k-randconfig-r2202-20261004 (https://download.01.org/0day-ci/archive/20261004/202610042019.eTtddedV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610042019.eTtddedV-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib-shared.c:335 gpio_shared_make_proxy_dev() warn: missing error code 'ret'

vim +/ret +335 drivers/gpio/gpiolib-shared.c

a060b8c511abb0 Bartosz Golaszewski 2025-11-12  314  
774702a71d51c8 Bartosz Golaszewski 2026-10-01  315  static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
54a2df5afa2382 Bartosz Golaszewski 2025-11-28  316  				      struct gpio_shared_entry *entry,
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  317  				      struct gpio_shared_ref *ref)
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  318  {
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  319  	struct software_node *swnode = &ref->proxy_swnode;
774702a71d51c8 Bartosz Golaszewski 2026-10-01  320  	struct auxiliary_device *adev = &ref->proxy_dev;
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  321  	struct device *dev = &adev->dev;
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  322  	int ret;
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  323  
ea513dd3c06607 Bartosz Golaszewski 2025-12-06  324  	guard(mutex)(&ref->lock);
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  325  
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  326  	memset(adev, 0, sizeof(*adev));
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  327  	memset(swnode, 0, sizeof(*swnode));
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  328  
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  329  	ret = software_node_register(swnode);
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  330  	if (ret)
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  331  		return ret;
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  332  
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  333  	ref->proxy_fwnode = software_node_fwnode(swnode);
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  334  	if (!ref->proxy_fwnode)
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01 @335  		goto err_swnode_unreg;
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  336  
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  337  	adev->id = ref->dev_id;
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  338  	adev->name = "proxy";
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  339  	dev->parent = gdev->dev.parent;
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  340  	dev->platform_data = entry;
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  341  	dev->release = gpio_shared_proxy_dev_release;
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  342  
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  343  	device_set_node(dev, software_node_fwnode(swnode));
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  344  
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  345  	ret = auxiliary_device_init(adev);
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  346  	if (ret)
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  347  		goto err_swnode_unreg;
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  348  
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  349  	ret = auxiliary_device_add(adev);
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  350  	if (ret)
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  351  		goto err_dev_uninit;
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  352  
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  353  	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  354  		 dev_name(&adev->dev), gpio_device_get_label(gdev));
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  355  
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  356  	return 0;
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  357  
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  358  err_dev_uninit:
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  359  	auxiliary_device_uninit(adev);
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  360  err_swnode_unreg:
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  361  	software_node_unregister(swnode);
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  362  
33a59c84f6eeb1 Bartosz Golaszewski 2026-10-01  363  	return ret;
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  364  }
a060b8c511abb0 Bartosz Golaszewski 2025-11-12  365  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

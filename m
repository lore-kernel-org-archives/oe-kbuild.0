Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC173A1E75
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767548784; cv=none; b=I+UAq2lUmoojSnGWsHxZx9LxyIy1tOi+EfhfkPqNEloil46zYyLC2epD6iVj83M/4wtqwdNju9HAyUOhZtryrCBcFU3bYFu+lwYlz9a7xEi+hqpp1mFewKFaYFWk+cPD0BD73jx6kFanSonzQ5ah4wxpKL+GIyS3MaoOUaWBsV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767548784; c=relaxed/simple;
	bh=jAjLBc4fhchhKAdF1V4aejB+DqGJOTH1orPpMraBBJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T6UR8gLWAer69MwgnftJF2IEJ/Txd0NXnkM5z9vUcrA+KMPE/sV4AnRag3E6VUby8dnfQ4xjC4f7Cxs/InoC2EBVz3/3tlVTvK9LGYuM5kHZrVVxFDxU774JaCxtRthbgsyQnfMz8esYQJ6KoG+VJ3U+BEOMMVkzRDwnCZl/feg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbF3k/dz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbF3k/dz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767548782; x=1799084782;
  h=date:from:to:cc:subject:message-id;
  bh=jAjLBc4fhchhKAdF1V4aejB+DqGJOTH1orPpMraBBJ0=;
  b=HbF3k/dzJJGyuQxAWDvaR1OlGzeHMYt35lwVhPRCd6KFfhvXC3rx8/4S
   Qlgn5edFExST0fksk50YiRzeqqpp92OCyMWqS47poYXkZdSV4Eg/KF+zT
   KMOm4mCqHW+X8mhWHKC8Nw+vyTactHz7igMiUMfcBn2+uPKsxjyxbiTrX
   nTHzzyzW8WT/WDqnj3Bw7QZ423BB2+9H7nh7uvuhG1vSW16gOaOaKhEnX
   OiwErxW3Fc74quvQtoKusfackSgUQuc9O7RUp0n0dd4ixUoFuKDQAOQVm
   3XztzopuMqyr3Z2fxhGoZ6L5i8QY7qOPx89bYXNne8MxMOVkoZ4tOGwnV
   g==;
X-CSE-ConnectionGUID: razX4lnlR/uRDvgPsTC4eQ==
X-CSE-MsgGUID: xLTl0HtEQRi2xbtC1ruvbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68841046"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="68841046"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 09:46:21 -0800
X-CSE-ConnectionGUID: S06ESD5oRWaL2BTcbNuiiw==
X-CSE-MsgGUID: e+PELlUBRa6HSH4KYiVY3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="201852664"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jan 2026 09:46:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcSBF-000000000ht-4BZ6;
	Sun, 04 Jan 2026 17:46:17 +0000
Date: Mon, 05 Jan 2026 01:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/hotplug/pnv_php.c:710 pnv_php_alloc_slot() warn:
 address of NULL pointer 'php_slot->bus'
Message-ID: <202601050123.5JEZ4Znh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Timothy Pearson <tpearson@raptorengineering.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   54e82e93ca93e49cb4c33988adec5c8cb9d0df31
commit: 4668619092554e1b95c9a5ac2941ca47ba6d548a PCI: pnv_php: Clean up allocated IRQs on unplug
date:   5 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r071-20260104 (https://download.01.org/0day-ci/archive/20260105/202601050123.5JEZ4Znh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601050123.5JEZ4Znh-lkp@intel.com/

smatch warnings:
drivers/pci/hotplug/pnv_php.c:710 pnv_php_alloc_slot() warn: address of NULL pointer 'php_slot->bus'

vim +710 drivers/pci/hotplug/pnv_php.c

66725152fb9f17b Gavin Shan      2016-05-20  677  
66725152fb9f17b Gavin Shan      2016-05-20  678  static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)
66725152fb9f17b Gavin Shan      2016-05-20  679  {
66725152fb9f17b Gavin Shan      2016-05-20  680  	struct pnv_php_slot *php_slot;
66725152fb9f17b Gavin Shan      2016-05-20  681  	struct pci_bus *bus;
66725152fb9f17b Gavin Shan      2016-05-20  682  	const char *label;
66725152fb9f17b Gavin Shan      2016-05-20  683  	uint64_t id;
39f0d6fbdc3f205 Gavin Shan      2016-09-29  684  	int ret;
66725152fb9f17b Gavin Shan      2016-05-20  685  
39f0d6fbdc3f205 Gavin Shan      2016-09-29  686  	ret = of_property_read_string(dn, "ibm,slot-label", &label);
39f0d6fbdc3f205 Gavin Shan      2016-09-29  687  	if (ret)
66725152fb9f17b Gavin Shan      2016-05-20  688  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  689  
66725152fb9f17b Gavin Shan      2016-05-20  690  	if (pnv_pci_get_slot_id(dn, &id))
66725152fb9f17b Gavin Shan      2016-05-20  691  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  692  
66725152fb9f17b Gavin Shan      2016-05-20  693  	bus = pci_find_bus_by_node(dn);
149ba66a90a3b3c Gavin Shan      2016-09-28  694  	if (!bus)
66725152fb9f17b Gavin Shan      2016-05-20  695  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  696  
66725152fb9f17b Gavin Shan      2016-05-20  697  	php_slot = kzalloc(sizeof(*php_slot), GFP_KERNEL);
149ba66a90a3b3c Gavin Shan      2016-09-28  698  	if (!php_slot)
66725152fb9f17b Gavin Shan      2016-05-20  699  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  700  
66725152fb9f17b Gavin Shan      2016-05-20  701  	php_slot->name = kstrdup(label, GFP_KERNEL);
149ba66a90a3b3c Gavin Shan      2016-09-28  702  	if (!php_slot->name) {
66725152fb9f17b Gavin Shan      2016-05-20  703  		kfree(php_slot);
66725152fb9f17b Gavin Shan      2016-05-20  704  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  705  	}
66725152fb9f17b Gavin Shan      2016-05-20  706  
4668619092554e1 Timothy Pearson 2025-07-15  707  	/* Allocate workqueue for this slot's interrupt handling */
4668619092554e1 Timothy Pearson 2025-07-15  708  	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
4668619092554e1 Timothy Pearson 2025-07-15  709  	if (!php_slot->wq) {
4668619092554e1 Timothy Pearson 2025-07-15 @710  		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
4668619092554e1 Timothy Pearson 2025-07-15  711  		kfree(php_slot->name);
4668619092554e1 Timothy Pearson 2025-07-15  712  		kfree(php_slot);
4668619092554e1 Timothy Pearson 2025-07-15  713  		return NULL;
4668619092554e1 Timothy Pearson 2025-07-15  714  	}
4668619092554e1 Timothy Pearson 2025-07-15  715  
149ba66a90a3b3c Gavin Shan      2016-09-28  716  	if (dn->child && PCI_DN(dn->child))
66725152fb9f17b Gavin Shan      2016-05-20  717  		php_slot->slot_no = PCI_SLOT(PCI_DN(dn->child)->devfn);
66725152fb9f17b Gavin Shan      2016-05-20  718  	else
66725152fb9f17b Gavin Shan      2016-05-20  719  		php_slot->slot_no = -1;   /* Placeholder slot */
66725152fb9f17b Gavin Shan      2016-05-20  720  
66725152fb9f17b Gavin Shan      2016-05-20  721  	kref_init(&php_slot->kref);
66725152fb9f17b Gavin Shan      2016-05-20  722  	php_slot->state	                = PNV_PHP_STATE_INITIALIZED;
66725152fb9f17b Gavin Shan      2016-05-20  723  	php_slot->dn	                = dn;
66725152fb9f17b Gavin Shan      2016-05-20  724  	php_slot->pdev	                = bus->self;
66725152fb9f17b Gavin Shan      2016-05-20  725  	php_slot->bus	                = bus;
66725152fb9f17b Gavin Shan      2016-05-20  726  	php_slot->id	                = id;
66725152fb9f17b Gavin Shan      2016-05-20  727  	php_slot->power_state_check     = false;
66725152fb9f17b Gavin Shan      2016-05-20  728  	php_slot->slot.ops              = &php_slot_ops;
66725152fb9f17b Gavin Shan      2016-05-20  729  
66725152fb9f17b Gavin Shan      2016-05-20  730  	INIT_LIST_HEAD(&php_slot->children);
66725152fb9f17b Gavin Shan      2016-05-20  731  	INIT_LIST_HEAD(&php_slot->link);
66725152fb9f17b Gavin Shan      2016-05-20  732  
66725152fb9f17b Gavin Shan      2016-05-20  733  	return php_slot;
66725152fb9f17b Gavin Shan      2016-05-20  734  }
66725152fb9f17b Gavin Shan      2016-05-20  735  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

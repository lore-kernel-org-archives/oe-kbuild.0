Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A82EBBBC
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765596240; cv=none; b=hDA09qL5TOnzCK8lo9DE+yXevQCHfUAfZEGF0a/JUJnonP6n3jlGmLd8e08YEgV7CHmxR67B/1VYCv96464od+nfSSObiRqi34kAoI0/9eIYK3hlKuBFZdvUGByJSHlPoVDKVi/GuPgXhfGS/Nxwyi2fOH8wHHrt2eg7umPsYzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765596240; c=relaxed/simple;
	bh=Ry2pdGgND4p+Q16zVbEd+Rl2otTT/qbVaGGrvoisKlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r756ULRJHEkb43VF2hHC/tbpnkWEPjTfNtRHGsze5TPxQ2nFvBWZzAynysjCpV0ngCDaAzCPHqz/7V1+bIcXxjYhwbuBfVfmBDJBPHiVabfilOXRwaRYqgxcjMtp5e58PlZffHwSQFuGolx42kjeIxLfGxY0svA97NJiIEOc9yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKrNdJsX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKrNdJsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765596238; x=1797132238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ry2pdGgND4p+Q16zVbEd+Rl2otTT/qbVaGGrvoisKlI=;
  b=BKrNdJsXNnnlt7reQrlVb/OW79t20DsrXSWW9qg+JrFwkvPhmkxgs2aM
   yU4muOOPjnxRQ3tgetu4zK3RSu3Vqzm04RitzT9MRF6uHOg4PK4gb9nHp
   1fYXGJCucvx4ZBW9Vp4cz4h8g1PpkJ5ojBe+ieRVEWf8ooR/Rtde38NeQ
   ksz4Dapi0+bLsuMA05dAIa2J5uKd2006R0J+tRngBIo2IqGOlTBwaOgpj
   lO3t2AuVrX+irgQNbB3A5kjbpw3Ji+yxi0FwErAo5zHWLKdU1g5RzFvhC
   FsSYG3CFWxS3k7JT7eXawxSKkZNs964M+GR7JoyJg8/TBrPsT9+MyR3ot
   A==;
X-CSE-ConnectionGUID: Nh6qPkSYSem4ej4HJrYUGg==
X-CSE-MsgGUID: 3CA8ET1eT2i0hvBuqdwMNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67473346"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67473346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:23:55 -0800
X-CSE-ConnectionGUID: AYsXfBxsSDCJ+qcm4x4FDg==
X-CSE-MsgGUID: Fw2SySe5TzevqHfc0bt7Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202325875"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2025 19:23:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGEZ-000000006zN-47xb;
	Sat, 13 Dec 2025 03:23:51 +0000
Date: Sat, 13 Dec 2025 11:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pci/doe.c:179 pci_doe_sysfs_feature_populate() warn:
 iterator 'i' not incremented
Message-ID: <202512131124.cRghpOvg-lkp@intel.com>
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
TO: Alistair Francis <alistair@alistair23.me>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 2311ab1820fed26caf0095d38ade892770ea574d PCI/DOE: Expose DOE features via sysfs
date:   9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131124.cRghpOvg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131124.cRghpOvg-lkp@intel.com/

New smatch warnings:
drivers/pci/doe.c:179 pci_doe_sysfs_feature_populate() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/pci/doe.c:149 pci_doe_sysfs_feature_remove() warn: iterator 'i' not incremented

vim +/i +179 drivers/pci/doe.c

2311ab1820fed2 Alistair Francis 2025-03-06  157  
2311ab1820fed2 Alistair Francis 2025-03-06  158  static int pci_doe_sysfs_feature_populate(struct pci_dev *pdev,
2311ab1820fed2 Alistair Francis 2025-03-06  159  					  struct pci_doe_mb *doe_mb)
2311ab1820fed2 Alistair Francis 2025-03-06  160  {
2311ab1820fed2 Alistair Francis 2025-03-06  161  	struct device *dev = &pdev->dev;
2311ab1820fed2 Alistair Francis 2025-03-06  162  	struct device_attribute *attrs;
2311ab1820fed2 Alistair Francis 2025-03-06  163  	unsigned long num_features = 0;
2311ab1820fed2 Alistair Francis 2025-03-06  164  	unsigned long vid, type;
2311ab1820fed2 Alistair Francis 2025-03-06  165  	unsigned long i;
2311ab1820fed2 Alistair Francis 2025-03-06  166  	void *entry;
2311ab1820fed2 Alistair Francis 2025-03-06  167  	int ret;
2311ab1820fed2 Alistair Francis 2025-03-06  168  
2311ab1820fed2 Alistair Francis 2025-03-06  169  	xa_for_each(&doe_mb->feats, i, entry)
2311ab1820fed2 Alistair Francis 2025-03-06  170  		num_features++;
2311ab1820fed2 Alistair Francis 2025-03-06  171  
2311ab1820fed2 Alistair Francis 2025-03-06  172  	attrs = kcalloc(num_features, sizeof(*attrs), GFP_KERNEL);
2311ab1820fed2 Alistair Francis 2025-03-06  173  	if (!attrs) {
2311ab1820fed2 Alistair Francis 2025-03-06  174  		pci_warn(pdev, "Failed allocating the device_attribute array\n");
2311ab1820fed2 Alistair Francis 2025-03-06  175  		return -ENOMEM;
2311ab1820fed2 Alistair Francis 2025-03-06  176  	}
2311ab1820fed2 Alistair Francis 2025-03-06  177  
2311ab1820fed2 Alistair Francis 2025-03-06  178  	doe_mb->sysfs_attrs = attrs;
2311ab1820fed2 Alistair Francis 2025-03-06 @179  	xa_for_each(&doe_mb->feats, i, entry) {
2311ab1820fed2 Alistair Francis 2025-03-06  180  		sysfs_attr_init(&attrs[i].attr);
2311ab1820fed2 Alistair Francis 2025-03-06  181  		vid = xa_to_value(entry) >> 8;
2311ab1820fed2 Alistair Francis 2025-03-06  182  		type = xa_to_value(entry) & 0xFF;
2311ab1820fed2 Alistair Francis 2025-03-06  183  
2311ab1820fed2 Alistair Francis 2025-03-06  184  		if (vid == PCI_VENDOR_ID_PCI_SIG &&
2311ab1820fed2 Alistair Francis 2025-03-06  185  		    type == PCI_DOE_FEATURE_DISCOVERY) {
2311ab1820fed2 Alistair Francis 2025-03-06  186  
2311ab1820fed2 Alistair Francis 2025-03-06  187  			/*
2311ab1820fed2 Alistair Francis 2025-03-06  188  			 * DOE Discovery, manually displayed by
2311ab1820fed2 Alistair Francis 2025-03-06  189  			 * `dev_attr_doe_discovery`
2311ab1820fed2 Alistair Francis 2025-03-06  190  			 */
2311ab1820fed2 Alistair Francis 2025-03-06  191  			continue;
2311ab1820fed2 Alistair Francis 2025-03-06  192  		}
2311ab1820fed2 Alistair Francis 2025-03-06  193  
2311ab1820fed2 Alistair Francis 2025-03-06  194  		attrs[i].attr.name = kasprintf(GFP_KERNEL,
2311ab1820fed2 Alistair Francis 2025-03-06  195  					       "%04lx:%02lx", vid, type);
2311ab1820fed2 Alistair Francis 2025-03-06  196  		if (!attrs[i].attr.name) {
2311ab1820fed2 Alistair Francis 2025-03-06  197  			ret = -ENOMEM;
2311ab1820fed2 Alistair Francis 2025-03-06  198  			pci_warn(pdev, "Failed allocating the attribute name\n");
2311ab1820fed2 Alistair Francis 2025-03-06  199  			goto fail;
2311ab1820fed2 Alistair Francis 2025-03-06  200  		}
2311ab1820fed2 Alistair Francis 2025-03-06  201  
2311ab1820fed2 Alistair Francis 2025-03-06  202  		attrs[i].attr.mode = 0444;
2311ab1820fed2 Alistair Francis 2025-03-06  203  		attrs[i].show = pci_doe_sysfs_feature_show;
2311ab1820fed2 Alistair Francis 2025-03-06  204  
2311ab1820fed2 Alistair Francis 2025-03-06  205  		ret = sysfs_add_file_to_group(&dev->kobj, &attrs[i].attr,
2311ab1820fed2 Alistair Francis 2025-03-06  206  					      pci_doe_sysfs_group.name);
2311ab1820fed2 Alistair Francis 2025-03-06  207  		if (ret) {
2311ab1820fed2 Alistair Francis 2025-03-06  208  			attrs[i].show = NULL;
2311ab1820fed2 Alistair Francis 2025-03-06  209  			if (ret != -EEXIST) {
2311ab1820fed2 Alistair Francis 2025-03-06  210  				pci_warn(pdev, "Failed adding %s to sysfs group\n",
2311ab1820fed2 Alistair Francis 2025-03-06  211  					 attrs[i].attr.name);
2311ab1820fed2 Alistair Francis 2025-03-06  212  				goto fail;
2311ab1820fed2 Alistair Francis 2025-03-06  213  			} else
2311ab1820fed2 Alistair Francis 2025-03-06  214  				kfree(attrs[i].attr.name);
2311ab1820fed2 Alistair Francis 2025-03-06  215  		}
2311ab1820fed2 Alistair Francis 2025-03-06  216  	}
2311ab1820fed2 Alistair Francis 2025-03-06  217  
2311ab1820fed2 Alistair Francis 2025-03-06  218  	return 0;
2311ab1820fed2 Alistair Francis 2025-03-06  219  
2311ab1820fed2 Alistair Francis 2025-03-06  220  fail:
2311ab1820fed2 Alistair Francis 2025-03-06  221  	pci_doe_sysfs_feature_remove(pdev, doe_mb);
2311ab1820fed2 Alistair Francis 2025-03-06  222  	return ret;
2311ab1820fed2 Alistair Francis 2025-03-06  223  }
2311ab1820fed2 Alistair Francis 2025-03-06  224  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698525761
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 03:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741577721; cv=none; b=pH+hSSLR5yQzwmhn4Quy4UqUNzKRUUsv/0uh7gVmjcKkvKz2H5Q8PUgaIVJ4JDccEwtnEaLUMHoafsyB1HSLb+ISyImpE5SnM530j/uOfEywcz6z3XODzpLm/JlxYLCdzd62KsmuZilHLNdjqFE0Z6dKJ8uE57LwWvC0p9tFUBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741577721; c=relaxed/simple;
	bh=0GqvVAvlX/diqf/t3wQRiWyO3ZKqlsNm0njeCyH6KT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OuC4Z7c1EDHcbveCpd5jbvSEqn05ccZk9BDCXdLwVFWVa+i+NBM6fNyTXpm9aVo+snMDsIqAkniSHPBt2U8OWvZ+g+B/hTKms4YKZBe/vE61zZsJnp4J4F1NVyuuw5/+xoSkjcyjbaxsnLpA0FssWD9Qmf8Kzg1nauXBvgGbzCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTDwMImp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTDwMImp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741577720; x=1773113720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0GqvVAvlX/diqf/t3wQRiWyO3ZKqlsNm0njeCyH6KT8=;
  b=gTDwMImp9GMgniqsmPGxw8mI50IQF6bBFZTpchCdJeKoVHdYdIGLeP0T
   7IT4gYSwZ/qEQEAYyigKyPb7bvsdbzPUIpZ/wBRtd82clGwxD8Sj9s9D4
   lhU3xcJxAu7nBN7hFIndbYBD00oXMlXumvBsJJYu0lhUUIOHIrnUwycmy
   TCZmPdu/HgwWt+az/1o3IhyfquTth7ffZdRynrSsd1qlXbJv3dUEVt2rL
   WaCM2CFP/qrWFe+pTO5UddBOxLWgXaf3rH4ZINcTUlXSBsv+7hkK9f/8t
   ejpep+oVYV1XAjpwkedJ1KkqeapF3NRA/J2MML7zTpmO7oSkIAWjC7MzE
   Q==;
X-CSE-ConnectionGUID: QnYOYI5NSMCbBHzYMfsSdQ==
X-CSE-MsgGUID: UCnq525/TA60aqDJS/sUNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="45352849"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="45352849"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 20:35:19 -0700
X-CSE-ConnectionGUID: LIWTqjqkQiGFuFMrcW2GUg==
X-CSE-MsgGUID: gX6WnWmJSSeqgnHxSB0Kpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150808151"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2025 20:35:18 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trTv9-0003m0-2b;
	Mon, 10 Mar 2025 03:35:15 +0000
Date: Mon, 10 Mar 2025 11:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pci:doe 3/4] drivers/pci/doe.c:149 pci_doe_sysfs_feature_remove()
 warn: iterator 'i' not incremented
Message-ID: <202503101113.KaXxjd3j-lkp@intel.com>
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
CC: linux-pci@vger.kernel.org
TO: Alistair Francis <alistair@alistair23.me>
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git doe
head:   216235b41a0d1aedc7243d7a93bdcdf5f1649d4a
commit: 87f7d1a95d2f8a5018e2a68a4de3acd48240b7cb [3/4] PCI/DOE: Expose DOE features via sysfs
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101113.KaXxjd3j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503101113.KaXxjd3j-lkp@intel.com/

smatch warnings:
drivers/pci/doe.c:149 pci_doe_sysfs_feature_remove() warn: iterator 'i' not incremented
drivers/pci/doe.c:179 pci_doe_sysfs_feature_populate() warn: iterator 'i' not incremented

vim +/i +149 drivers/pci/doe.c

87f7d1a95d2f8a Alistair Francis 2025-03-06  136  
87f7d1a95d2f8a Alistair Francis 2025-03-06  137  static void pci_doe_sysfs_feature_remove(struct pci_dev *pdev,
87f7d1a95d2f8a Alistair Francis 2025-03-06  138  					 struct pci_doe_mb *doe_mb)
87f7d1a95d2f8a Alistair Francis 2025-03-06  139  {
87f7d1a95d2f8a Alistair Francis 2025-03-06  140  	struct device_attribute *attrs = doe_mb->sysfs_attrs;
87f7d1a95d2f8a Alistair Francis 2025-03-06  141  	struct device *dev = &pdev->dev;
87f7d1a95d2f8a Alistair Francis 2025-03-06  142  	unsigned long i;
87f7d1a95d2f8a Alistair Francis 2025-03-06  143  	void *entry;
87f7d1a95d2f8a Alistair Francis 2025-03-06  144  
87f7d1a95d2f8a Alistair Francis 2025-03-06  145  	if (!attrs)
87f7d1a95d2f8a Alistair Francis 2025-03-06  146  		return;
87f7d1a95d2f8a Alistair Francis 2025-03-06  147  
87f7d1a95d2f8a Alistair Francis 2025-03-06  148  	doe_mb->sysfs_attrs = NULL;
87f7d1a95d2f8a Alistair Francis 2025-03-06 @149  	xa_for_each(&doe_mb->feats, i, entry) {
87f7d1a95d2f8a Alistair Francis 2025-03-06  150  		if (attrs[i].show)
87f7d1a95d2f8a Alistair Francis 2025-03-06  151  			sysfs_remove_file_from_group(&dev->kobj, &attrs[i].attr,
87f7d1a95d2f8a Alistair Francis 2025-03-06  152  						     pci_doe_sysfs_group.name);
87f7d1a95d2f8a Alistair Francis 2025-03-06  153  		kfree(attrs[i].attr.name);
87f7d1a95d2f8a Alistair Francis 2025-03-06  154  	}
87f7d1a95d2f8a Alistair Francis 2025-03-06  155  	kfree(attrs);
87f7d1a95d2f8a Alistair Francis 2025-03-06  156  }
87f7d1a95d2f8a Alistair Francis 2025-03-06  157  
87f7d1a95d2f8a Alistair Francis 2025-03-06  158  static int pci_doe_sysfs_feature_populate(struct pci_dev *pdev,
87f7d1a95d2f8a Alistair Francis 2025-03-06  159  					  struct pci_doe_mb *doe_mb)
87f7d1a95d2f8a Alistair Francis 2025-03-06  160  {
87f7d1a95d2f8a Alistair Francis 2025-03-06  161  	struct device *dev = &pdev->dev;
87f7d1a95d2f8a Alistair Francis 2025-03-06  162  	struct device_attribute *attrs;
87f7d1a95d2f8a Alistair Francis 2025-03-06  163  	unsigned long num_features = 0;
87f7d1a95d2f8a Alistair Francis 2025-03-06  164  	unsigned long vid, type;
87f7d1a95d2f8a Alistair Francis 2025-03-06  165  	unsigned long i;
87f7d1a95d2f8a Alistair Francis 2025-03-06  166  	void *entry;
87f7d1a95d2f8a Alistair Francis 2025-03-06  167  	int ret;
87f7d1a95d2f8a Alistair Francis 2025-03-06  168  
87f7d1a95d2f8a Alistair Francis 2025-03-06  169  	xa_for_each(&doe_mb->feats, i, entry)
87f7d1a95d2f8a Alistair Francis 2025-03-06  170  		num_features++;
87f7d1a95d2f8a Alistair Francis 2025-03-06  171  
87f7d1a95d2f8a Alistair Francis 2025-03-06  172  	attrs = kcalloc(num_features, sizeof(*attrs), GFP_KERNEL);
87f7d1a95d2f8a Alistair Francis 2025-03-06  173  	if (!attrs) {
87f7d1a95d2f8a Alistair Francis 2025-03-06  174  		pci_warn(pdev, "Failed allocating the device_attribute array\n");
87f7d1a95d2f8a Alistair Francis 2025-03-06  175  		return -ENOMEM;
87f7d1a95d2f8a Alistair Francis 2025-03-06  176  	}
87f7d1a95d2f8a Alistair Francis 2025-03-06  177  
87f7d1a95d2f8a Alistair Francis 2025-03-06  178  	doe_mb->sysfs_attrs = attrs;
87f7d1a95d2f8a Alistair Francis 2025-03-06 @179  	xa_for_each(&doe_mb->feats, i, entry) {
87f7d1a95d2f8a Alistair Francis 2025-03-06  180  		sysfs_attr_init(&attrs[i].attr);
87f7d1a95d2f8a Alistair Francis 2025-03-06  181  		vid = xa_to_value(entry) >> 8;
87f7d1a95d2f8a Alistair Francis 2025-03-06  182  		type = xa_to_value(entry) & 0xFF;
87f7d1a95d2f8a Alistair Francis 2025-03-06  183  
87f7d1a95d2f8a Alistair Francis 2025-03-06  184  		if (vid == PCI_VENDOR_ID_PCI_SIG &&
87f7d1a95d2f8a Alistair Francis 2025-03-06  185  		    type == PCI_DOE_FEATURE_DISCOVERY) {
87f7d1a95d2f8a Alistair Francis 2025-03-06  186  
87f7d1a95d2f8a Alistair Francis 2025-03-06  187  			/*
87f7d1a95d2f8a Alistair Francis 2025-03-06  188  			 * DOE Discovery, manually displayed by
87f7d1a95d2f8a Alistair Francis 2025-03-06  189  			 * `dev_attr_doe_discovery`
87f7d1a95d2f8a Alistair Francis 2025-03-06  190  			 */
87f7d1a95d2f8a Alistair Francis 2025-03-06  191  			continue;
87f7d1a95d2f8a Alistair Francis 2025-03-06  192  		}
87f7d1a95d2f8a Alistair Francis 2025-03-06  193  
87f7d1a95d2f8a Alistair Francis 2025-03-06  194  		attrs[i].attr.name = kasprintf(GFP_KERNEL,
87f7d1a95d2f8a Alistair Francis 2025-03-06  195  					       "%04lx:%02lx", vid, type);
87f7d1a95d2f8a Alistair Francis 2025-03-06  196  		if (!attrs[i].attr.name) {
87f7d1a95d2f8a Alistair Francis 2025-03-06  197  			ret = -ENOMEM;
87f7d1a95d2f8a Alistair Francis 2025-03-06  198  			pci_warn(pdev, "Failed allocating the attribute name\n");
87f7d1a95d2f8a Alistair Francis 2025-03-06  199  			goto fail;
87f7d1a95d2f8a Alistair Francis 2025-03-06  200  		}
87f7d1a95d2f8a Alistair Francis 2025-03-06  201  
87f7d1a95d2f8a Alistair Francis 2025-03-06  202  		attrs[i].attr.mode = 0444;
87f7d1a95d2f8a Alistair Francis 2025-03-06  203  		attrs[i].show = pci_doe_sysfs_feature_show;
87f7d1a95d2f8a Alistair Francis 2025-03-06  204  
87f7d1a95d2f8a Alistair Francis 2025-03-06  205  		ret = sysfs_add_file_to_group(&dev->kobj, &attrs[i].attr,
87f7d1a95d2f8a Alistair Francis 2025-03-06  206  					      pci_doe_sysfs_group.name);
87f7d1a95d2f8a Alistair Francis 2025-03-06  207  		if (ret) {
87f7d1a95d2f8a Alistair Francis 2025-03-06  208  			attrs[i].show = NULL;
87f7d1a95d2f8a Alistair Francis 2025-03-06  209  			if (ret != -EEXIST) {
87f7d1a95d2f8a Alistair Francis 2025-03-06  210  				pci_warn(pdev, "Failed adding %s to sysfs group\n",
87f7d1a95d2f8a Alistair Francis 2025-03-06  211  					 attrs[i].attr.name);
87f7d1a95d2f8a Alistair Francis 2025-03-06  212  				goto fail;
87f7d1a95d2f8a Alistair Francis 2025-03-06  213  			} else
87f7d1a95d2f8a Alistair Francis 2025-03-06  214  				kfree(attrs[i].attr.name);
87f7d1a95d2f8a Alistair Francis 2025-03-06  215  		}
87f7d1a95d2f8a Alistair Francis 2025-03-06  216  	}
87f7d1a95d2f8a Alistair Francis 2025-03-06  217  
87f7d1a95d2f8a Alistair Francis 2025-03-06  218  	return 0;
87f7d1a95d2f8a Alistair Francis 2025-03-06  219  
87f7d1a95d2f8a Alistair Francis 2025-03-06  220  fail:
87f7d1a95d2f8a Alistair Francis 2025-03-06  221  	pci_doe_sysfs_feature_remove(pdev, doe_mb);
87f7d1a95d2f8a Alistair Francis 2025-03-06  222  	return ret;
87f7d1a95d2f8a Alistair Francis 2025-03-06  223  }
87f7d1a95d2f8a Alistair Francis 2025-03-06  224  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

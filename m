Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF2A181BB4
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Apr 2024 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713474680; cv=none; b=i0bVD1BpwMPkHrm5yG/p5tZhx3QzMXvTyl2JTGPyauVUK6CDXqNYGQmumU2e8fC/WNRWYWbABuQbxkiA3mttvlqPb1paptqLFeo+fJO0e2u000rv+wK27ypvJrEWjmr+h4evUbuIYDOYFTZ3b5dyQsGRnXKuCF5hD66wRhm2P2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713474680; c=relaxed/simple;
	bh=uMAP0R71pg3h5oM4Uz5UTVaxWOQWq+Q+8YKiBYKxeXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LMv7K7uGbiAmoqXs15T6jiOsasOSq5ZSoBzFPPRWJ8WfeWRlfIfRGeLQPgrnn63VO0wqXfnQch4H75oJgt9vb/FGt8dCp0+cjlnf9ds4MK+INH/V1dMvqR/+jxGjdKH2K972nXPr3fM3zClIZz1KYNvreeAU9HmNZxYV5sfWUlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvKnz++A; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvKnz++A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713474679; x=1745010679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uMAP0R71pg3h5oM4Uz5UTVaxWOQWq+Q+8YKiBYKxeXI=;
  b=IvKnz++AfxbVTtozty36LVcDsmr/DNAbxI+iWuSjUINzXLs4+gipsv9f
   4Sq8zgfEiDgd+ueiIwD/45Idr96CmvDoGCnNvY7eVuRUkB+KwEud5UdST
   VvIzqjD845WWeInX1JIx34WDZL65FLCU6/y1Yg2ZdUMv+u5q8E8anoUUm
   ojaxc/kuX9RS5TwumuBxO9oPtVqp0dWWjiooJrIei3v5OVuU64wtjqa1k
   uiQVXEl4QTasxriPuKy7zjHsd+k/Ee8j/UE0pI8D2rvv/IJyIPHyMJd9h
   b2hi37lHviIk7KUEgNxXK2iN1MtFC7iWm/crCA6fVlWPo1zs9aG2t+Eoo
   g==;
X-CSE-ConnectionGUID: dCby9wJ2RZu/K7vZdi4lhQ==
X-CSE-MsgGUID: r28PwEQkRa+dKicP6NP/5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12842008"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12842008"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 14:11:18 -0700
X-CSE-ConnectionGUID: jJiQrRheQru1Q88y/5JX4w==
X-CSE-MsgGUID: dhfSYRJ2SrS0oZYrVy/F2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="27568040"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Apr 2024 14:11:17 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxZ2I-0009FE-26;
	Thu, 18 Apr 2024 21:11:14 +0000
Date: Fri, 19 Apr 2024 05:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:upstream-linux-5.15.y 264/377]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:1316 epf_ntb_bind() warn:
 missing error code 'ret'
Message-ID: <202404190553.UtOSurIn-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   c52b9710c83d3b8ab63bb217cc7c8b61e13f12cd
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20240419 (https://download.01.org/0day-ci/archive/20240419/202404190553.UtOSurIn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404190553.UtOSurIn-lkp@intel.com/

New smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:1316 epf_ntb_bind() warn: missing error code 'ret'

Old smatch warnings:
drivers/pci/endpoint/functions/pci-epf-vntb.c:891 epf_ntb_mw1_store() warn: potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:893 epf_ntb_mw2_store() warn: potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:895 epf_ntb_mw3_store() warn: potential spectre issue 'ntb->mws_size' [w]
drivers/pci/endpoint/functions/pci-epf-vntb.c:897 epf_ntb_mw4_store() warn: potential spectre issue 'ntb->mws_size' [w]

vim +/ret +1316 drivers/pci/endpoint/functions/pci-epf-vntb.c

e2b6ef72b7aea9 Frank Li 2022-02-22  1269  
e2b6ef72b7aea9 Frank Li 2022-02-22  1270  /**
e2b6ef72b7aea9 Frank Li 2022-02-22  1271   * epf_ntb_bind() - Initialize endpoint controller to provide NTB functionality
e2b6ef72b7aea9 Frank Li 2022-02-22  1272   * @epf: NTB endpoint function device
e2b6ef72b7aea9 Frank Li 2022-02-22  1273   *
e2b6ef72b7aea9 Frank Li 2022-02-22  1274   * Initialize both the endpoint controllers associated with NTB function device.
e2b6ef72b7aea9 Frank Li 2022-02-22  1275   * Invoked when a primary interface or secondary interface is bound to EPC
e2b6ef72b7aea9 Frank Li 2022-02-22  1276   * device. This function will succeed only when EPC is bound to both the
e2b6ef72b7aea9 Frank Li 2022-02-22  1277   * interfaces.
e2b6ef72b7aea9 Frank Li 2022-02-22  1278   */
e2b6ef72b7aea9 Frank Li 2022-02-22  1279  static int epf_ntb_bind(struct pci_epf *epf)
e2b6ef72b7aea9 Frank Li 2022-02-22  1280  {
e2b6ef72b7aea9 Frank Li 2022-02-22  1281  	struct epf_ntb *ntb = epf_get_drvdata(epf);
e2b6ef72b7aea9 Frank Li 2022-02-22  1282  	struct device *dev = &epf->dev;
e2b6ef72b7aea9 Frank Li 2022-02-22  1283  	int ret;
e2b6ef72b7aea9 Frank Li 2022-02-22  1284  
e2b6ef72b7aea9 Frank Li 2022-02-22  1285  	if (!epf->epc) {
e2b6ef72b7aea9 Frank Li 2022-02-22  1286  		dev_dbg(dev, "PRIMARY EPC interface not yet bound\n");
e2b6ef72b7aea9 Frank Li 2022-02-22  1287  		return 0;
e2b6ef72b7aea9 Frank Li 2022-02-22  1288  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1289  
e2b6ef72b7aea9 Frank Li 2022-02-22  1290  	ret = epf_ntb_init_epc_bar(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1291  	if (ret) {
e2b6ef72b7aea9 Frank Li 2022-02-22  1292  		dev_err(dev, "Failed to create NTB EPC\n");
e2b6ef72b7aea9 Frank Li 2022-02-22  1293  		goto err_bar_init;
e2b6ef72b7aea9 Frank Li 2022-02-22  1294  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1295  
e2b6ef72b7aea9 Frank Li 2022-02-22  1296  	ret = epf_ntb_config_spad_bar_alloc(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1297  	if (ret) {
e2b6ef72b7aea9 Frank Li 2022-02-22  1298  		dev_err(dev, "Failed to allocate BAR memory\n");
e2b6ef72b7aea9 Frank Li 2022-02-22  1299  		goto err_bar_alloc;
e2b6ef72b7aea9 Frank Li 2022-02-22  1300  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1301  
e2b6ef72b7aea9 Frank Li 2022-02-22  1302  	ret = epf_ntb_epc_init(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1303  	if (ret) {
e2b6ef72b7aea9 Frank Li 2022-02-22  1304  		dev_err(dev, "Failed to initialize EPC\n");
e2b6ef72b7aea9 Frank Li 2022-02-22  1305  		goto err_bar_alloc;
e2b6ef72b7aea9 Frank Li 2022-02-22  1306  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1307  
e2b6ef72b7aea9 Frank Li 2022-02-22  1308  	epf_set_drvdata(epf, ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1309  
e2b6ef72b7aea9 Frank Li 2022-02-22  1310  	pci_space[0] = (ntb->vntb_pid << 16) | ntb->vntb_vid;
e2b6ef72b7aea9 Frank Li 2022-02-22  1311  	pci_vntb_table[0].vendor = ntb->vntb_vid;
e2b6ef72b7aea9 Frank Li 2022-02-22  1312  	pci_vntb_table[0].device = ntb->vntb_pid;
e2b6ef72b7aea9 Frank Li 2022-02-22  1313  
e2b6ef72b7aea9 Frank Li 2022-02-22  1314  	if (pci_register_driver(&vntb_pci_driver)) {
e2b6ef72b7aea9 Frank Li 2022-02-22  1315  		dev_err(dev, "failure register vntb pci driver\n");
e2b6ef72b7aea9 Frank Li 2022-02-22 @1316  		goto err_bar_alloc;
e2b6ef72b7aea9 Frank Li 2022-02-22  1317  	}
e2b6ef72b7aea9 Frank Li 2022-02-22  1318  
e2b6ef72b7aea9 Frank Li 2022-02-22  1319  	vpci_scan_bus(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1320  
e2b6ef72b7aea9 Frank Li 2022-02-22  1321  	return 0;
e2b6ef72b7aea9 Frank Li 2022-02-22  1322  
e2b6ef72b7aea9 Frank Li 2022-02-22  1323  err_bar_alloc:
e2b6ef72b7aea9 Frank Li 2022-02-22  1324  	epf_ntb_config_spad_bar_free(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1325  
e2b6ef72b7aea9 Frank Li 2022-02-22  1326  err_bar_init:
e2b6ef72b7aea9 Frank Li 2022-02-22  1327  	epf_ntb_epc_destroy(ntb);
e2b6ef72b7aea9 Frank Li 2022-02-22  1328  
e2b6ef72b7aea9 Frank Li 2022-02-22  1329  	return ret;
e2b6ef72b7aea9 Frank Li 2022-02-22  1330  }
e2b6ef72b7aea9 Frank Li 2022-02-22  1331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D973F18F
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Mar 2023 04:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679720030; x=1711256030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DRWwHiTJWResCJRegJX0MybzXiZR388PO46cFelhqkw=;
  b=U1SolYPXUDHH8otjCi2ZUc7Tu21TJkdzZi+1r5Va62lKhKzoILnRZ5FG
   uPDmlCT9lPnQFSnHsjQsBSzCkRaqIrF0X2Vgpj3IlEo9772DgifZlM+pA
   +nVPyyiMWK21tHrWtbkamkt1xvx2qkuowSgikr+Xnrs4ucDjV5cu7kXpP
   Qxxes4V5uQ4zCXTaetajC3xHS6WDlbaIDPw9oiLEvDyYpOI1Jj4/AdQwP
   iKYzec+EESYmD7EhMkEcHOFBg+IAC/Q7ky3LdW4EZHwpYp50BJ4/wn/Hl
   F7hPJV57zDuuDK1yx2/c/afkHV/Jmf9rSHwgI55I/gIO27X0IAABZrN0o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323819291"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="323819291"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 21:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="928889776"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="928889776"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2023 21:53:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfvuU-000Fy5-33;
	Sat, 25 Mar 2023 04:53:46 +0000
Date: Sat, 25 Mar 2023 12:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cxl:for-6.4/cxl-type-2 10/22] drivers/cxl/core/pci.c:493
 cxl_probe_link() warn: right shifting more than type allows 16 vs 16
Message-ID: <202303251253.yCqOttoG-lkp@intel.com>
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
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-cxl@vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.4/cxl-type-2
head:   0b80e8b55828313bcd08c4740646689e648de444
commit: 45bbde21f573f287d5828b5e3ff1eac0320acc3d [10/22] cxl/port: Enumerate flit mode capability
:::::: branch date: 5 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230325/202303251253.yCqOttoG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303251253.yCqOttoG-lkp@intel.com/

New smatch warnings:
drivers/cxl/core/pci.c:493 cxl_probe_link() warn: right shifting more than type allows 16 vs 16

Old smatch warnings:
drivers/cxl/core/pci.c:496 cxl_probe_link() warn: right shifting more than type allows 16 vs 16

vim +493 drivers/cxl/core/pci.c

45bbde21f573f2 Dan Williams 2023-03-05  450  
45bbde21f573f2 Dan Williams 2023-03-05  451  int cxl_probe_link(struct cxl_port *port)
45bbde21f573f2 Dan Williams 2023-03-05  452  {
45bbde21f573f2 Dan Williams 2023-03-05  453  	struct pci_dev *pdev = cxl_port_to_pci(port);
45bbde21f573f2 Dan Williams 2023-03-05  454  	u16 cap, en, hdr, parent_features;
45bbde21f573f2 Dan Williams 2023-03-05  455  	struct cxl_port *parent_port;
45bbde21f573f2 Dan Williams 2023-03-05  456  	struct device *dev;
45bbde21f573f2 Dan Williams 2023-03-05  457  	int rc, dvsec;
45bbde21f573f2 Dan Williams 2023-03-05  458  
45bbde21f573f2 Dan Williams 2023-03-05  459  	if (!pdev) {
45bbde21f573f2 Dan Williams 2023-03-05  460  		/*
45bbde21f573f2 Dan Williams 2023-03-05  461  		 * Assume host bridges support all features, the root
45bbde21f573f2 Dan Williams 2023-03-05  462  		 * port will dictate the actual enabled set to endpoints.
45bbde21f573f2 Dan Williams 2023-03-05  463  		 */
45bbde21f573f2 Dan Williams 2023-03-05  464  		return 0;
45bbde21f573f2 Dan Williams 2023-03-05  465  	}
45bbde21f573f2 Dan Williams 2023-03-05  466  
45bbde21f573f2 Dan Williams 2023-03-05  467  	dev = &pdev->dev;
45bbde21f573f2 Dan Williams 2023-03-05  468  	dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL,
45bbde21f573f2 Dan Williams 2023-03-05  469  					  CXL_DVSEC_FLEXBUS_PORT);
45bbde21f573f2 Dan Williams 2023-03-05  470  	if (!dvsec) {
45bbde21f573f2 Dan Williams 2023-03-05  471  		dev_err(dev, "Failed to enumerate port capabilities\n");
45bbde21f573f2 Dan Williams 2023-03-05  472  		return -ENXIO;
45bbde21f573f2 Dan Williams 2023-03-05  473  	}
45bbde21f573f2 Dan Williams 2023-03-05  474  
45bbde21f573f2 Dan Williams 2023-03-05  475  	/*
45bbde21f573f2 Dan Williams 2023-03-05  476  	 * Cache the link features for future determination of HDM-D or
45bbde21f573f2 Dan Williams 2023-03-05  477  	 * HDM-DB support
45bbde21f573f2 Dan Williams 2023-03-05  478  	 */
45bbde21f573f2 Dan Williams 2023-03-05  479  	rc = pci_read_config_word(pdev, dvsec + PCI_DVSEC_HEADER1, &hdr);
45bbde21f573f2 Dan Williams 2023-03-05  480  	if (rc)
45bbde21f573f2 Dan Williams 2023-03-05  481  		return rc;
45bbde21f573f2 Dan Williams 2023-03-05  482  
45bbde21f573f2 Dan Williams 2023-03-05  483  	rc = pci_read_config_word(pdev, dvsec + CXL_DVSEC_FLEXBUS_CAP_OFFSET,
45bbde21f573f2 Dan Williams 2023-03-05  484  				  &cap);
45bbde21f573f2 Dan Williams 2023-03-05  485  	if (rc)
45bbde21f573f2 Dan Williams 2023-03-05  486  		return rc;
45bbde21f573f2 Dan Williams 2023-03-05  487  
45bbde21f573f2 Dan Williams 2023-03-05  488  	rc = pci_read_config_word(pdev, dvsec + CXL_DVSEC_FLEXBUS_STATUS_OFFSET,
45bbde21f573f2 Dan Williams 2023-03-05  489  				  &en);
45bbde21f573f2 Dan Williams 2023-03-05  490  	if (rc)
45bbde21f573f2 Dan Williams 2023-03-05  491  		return rc;
45bbde21f573f2 Dan Williams 2023-03-05  492  
45bbde21f573f2 Dan Williams 2023-03-05 @493  	if (PCI_DVSEC_HEADER1_REV(hdr) < 2)
45bbde21f573f2 Dan Williams 2023-03-05  494  		cap &= ~CXL_DVSEC_FLEXBUS_REV2_MASK;
45bbde21f573f2 Dan Williams 2023-03-05  495  
45bbde21f573f2 Dan Williams 2023-03-05  496  	if (PCI_DVSEC_HEADER1_REV(hdr) < 1)
45bbde21f573f2 Dan Williams 2023-03-05  497  		cap &= ~CXL_DVSEC_FLEXBUS_REV1_MASK;
45bbde21f573f2 Dan Williams 2023-03-05  498  
45bbde21f573f2 Dan Williams 2023-03-05  499  	en &= cap;
45bbde21f573f2 Dan Williams 2023-03-05  500  	parent_port = to_cxl_port(port->dev.parent);
45bbde21f573f2 Dan Williams 2023-03-05  501  	parent_features = parent_port->features;
45bbde21f573f2 Dan Williams 2023-03-05  502  
45bbde21f573f2 Dan Williams 2023-03-05  503  	/* Enforce port features are plumbed through to the host bridge */
45bbde21f573f2 Dan Williams 2023-03-05  504  	port->features = en & CXL_DVSEC_FLEXBUS_ENABLE_MASK & parent_features;
45bbde21f573f2 Dan Williams 2023-03-05  505  
45bbde21f573f2 Dan Williams 2023-03-05  506  	dev_dbg(dev, "features:%s%s%s%s%s%s%s\n",
45bbde21f573f2 Dan Williams 2023-03-05  507  		en & CXL_DVSEC_FLEXBUS_CACHE_ENABLED ? " cache" : "",
45bbde21f573f2 Dan Williams 2023-03-05  508  		en & CXL_DVSEC_FLEXBUS_IO_ENABLED ? " io" : "",
45bbde21f573f2 Dan Williams 2023-03-05  509  		en & CXL_DVSEC_FLEXBUS_MEM_ENABLED ? " mem" : "",
45bbde21f573f2 Dan Williams 2023-03-05  510  		en & CXL_DVSEC_FLEXBUS_FLIT68_ENABLED ? " flit68" : "",
45bbde21f573f2 Dan Williams 2023-03-05  511  		en & CXL_DVSEC_FLEXBUS_MLD_ENABLED ? " mld" : "",
45bbde21f573f2 Dan Williams 2023-03-05  512  		en & CXL_DVSEC_FLEXBUS_FLIT256_ENABLED ? " flit256" : "",
45bbde21f573f2 Dan Williams 2023-03-05  513  		en & CXL_DVSEC_FLEXBUS_PBR_ENABLED ? " pbr" : "");
45bbde21f573f2 Dan Williams 2023-03-05  514  
45bbde21f573f2 Dan Williams 2023-03-05  515  	return 0;
45bbde21f573f2 Dan Williams 2023-03-05  516  }
45bbde21f573f2 Dan Williams 2023-03-05  517  EXPORT_SYMBOL_NS_GPL(cxl_probe_link, CXL);
45bbde21f573f2 Dan Williams 2023-03-05  518  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

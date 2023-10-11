Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC612E78
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 19:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYQXI0i3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697053911; x=1728589911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3hxzBpuEpkngOa141o/ViRUozIgJZLmXd1Jt6WMdGQ=;
  b=NYQXI0i3Aw/yhxbVULlUaeqeCpyzdQYOKeBwwdyTZ8Oqtak3jyrkiYtz
   yK1c0jw4wRyxJwdBnNxQ1aLL5ov3Eu2tJRffqCr9ggnc/ebJ+2mqBr5yY
   /LCPy+F0kRSplhYYBLuInQvsNlaDq5SlvGqc6GWEPa1BgSMLC1xQS7hTE
   wzH9VZ9nDxUGYn/FY59/jmPvsQRuvaCEEIyK7MDAaLj+aFpCdUHJhy2Yr
   hBW9DY2Htkz5Yq0HkwVuk+ay4xY2Etdf3Tl88jCOreRJLFYoj6koWctEx
   gT/JitE0dSCqaIH1j230Kmq9F2WvuW4+m0zCi0xHsSNvizxd42wyPlBxa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3342236"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="3342236"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747585569"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="747585569"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 12:51:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqfFC-0002ej-28;
	Wed, 11 Oct 2023 19:51:46 +0000
Date: Thu, 12 Oct 2023 03:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mnyman-xhci:feature_interrupters 2/4]
 drivers/usb/host/xhci-mem.c:1863 xhci_remove_secondary_interrupter() error:
 we previously assumed 'ir' could be null (see line 1855)
Message-ID: <202310120314.9jZb7kip-lkp@intel.com>
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
TO: Mathias Nyman <mathias.nyman@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
head:   ffb84034ec49fd58a8cf4330897a6f2ca675c128
commit: cf4d2fd7c0e8db14a4e12b104137ccef56dc988d [2/4] xhci: add support to allocate several interrupters
:::::: branch date: 6 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-161-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120314.9jZb7kip-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120314.9jZb7kip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310120314.9jZb7kip-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci-mem.c:1863 xhci_remove_secondary_interrupter() error: we previously assumed 'ir' could be null (see line 1855)

vim +/ir +1863 drivers/usb/host/xhci-mem.c

67d2ea9fde2aa9 Lu Baolu      2017-12-08  1848  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1849  void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1850  {
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1851  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1852  	unsigned int intr_num;
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1853  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1854  	/* interrupter 0 is primary interrupter, don't touch it */
cf4d2fd7c0e8db Mathias Nyman 2023-01-09 @1855  	if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters)
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1856  		xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1857  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1858  	/* fixme, should we check xhci->interrupter[intr_num] == ir */
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1859  	/* fixme locking */
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1860  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1861  	spin_lock_irq(&xhci->lock);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1862  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09 @1863  	intr_num = ir->intr_num;
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1864  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1865  	xhci_remove_interrupter(xhci, ir);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1866  	xhci->interrupters[intr_num] = NULL;
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1867  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1868  	spin_unlock_irq(&xhci->lock);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1869  
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1870  	xhci_free_interrupter(xhci, ir);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1871  }
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1872  EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
cf4d2fd7c0e8db Mathias Nyman 2023-01-09  1873  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

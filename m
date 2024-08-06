Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC05EADC
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 04:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722918103; cv=none; b=a/khWMP67vuaXLkkcNnTrL4/XKPQDHezuhpluyEUHw23wg/hI37oGK37gdW9fzVXsYfsE3Ywm456bXsfa984MrsKd2SUbpyAJRm7Kfw2ba88lLiAsYS2yihmvUoqRZr+8PbyQsfmgzpuhs1w8LAltsbdOiSgttvN6oK/hrfHmPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722918103; c=relaxed/simple;
	bh=KmbjpdhXo2tPboLk9nWgF+WLCc/iMlOiKWGlSBXiIP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/xpuZKhUHpWR4uUa9Nu+gnTHZzeM3UrJQhUmlbnjU4lZM9sBQvP3W8IdequlzLxWKRuSX+FzlZlWjyNWYKh41FYFw++syWbp5l04EOFSl29g627paN2QzonvktGfyqV+PBhPG4zz+Ybvsn9c9wsCO0tw60V8x9vXO7bUrNBGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdFBOleu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdFBOleu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722918101; x=1754454101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KmbjpdhXo2tPboLk9nWgF+WLCc/iMlOiKWGlSBXiIP8=;
  b=cdFBOleun/aFLvUsoH9pxXyn0lsEv8AULckgeb8eCToDf7Vcvdj6Bean
   COGDyT0KJciSAiL5S25Ga9t3PlRjm7csNAyXzoI/TTSTYTceJr8AjuPi6
   wMEcrMe/GyqqVL3xBW4IlrrIUw7I23nLJqAn3YFwJ+hHYCnyYpeXuEkWh
   mUgfrkyxij4DE9PqU2NCrb7f/HY/y9gK27yiB/jUi1ptbQYC0mZHzUD/Y
   PvxxDybDomFaG7lIwBEhc2KBCS58Vx17jtf9zEKkUIY4CDdF4tUraHB0K
   ofNO4ipmDU+Pi1gBa3QLz9Sn1IJ43zFjXJvIWY/rd6DXWaU97sdaulqWe
   w==;
X-CSE-ConnectionGUID: xji/vO9BRRWi2gEbLztsdA==
X-CSE-MsgGUID: n/fAM1BFQfeyozXxtflpcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20788685"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="20788685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 21:21:40 -0700
X-CSE-ConnectionGUID: FSuKAxe9SCK5nIpkfaHUQA==
X-CSE-MsgGUID: mUHHKhovSrq70V1Rr0Y4tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="57082197"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Aug 2024 21:21:39 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbBhY-00048m-2I;
	Tue, 06 Aug 2024 04:21:36 +0000
Date: Tue, 6 Aug 2024 12:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] PCI: limit pci bridge and subsystem speed to 2.5GT/s
Message-ID: <202408061210.KkFwGezF-lkp@intel.com>
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
In-Reply-To: <20240805092010.82986-1-412574090@163.com>
References: <20240805092010.82986-1-412574090@163.com>
TO: 412574090@163.com
TO: corbet@lwn.net
TO: bhelgaas@google.com
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: xiongxin@kylinos.cn
CC: weiyufeng <weiyufeng@kylinos.cn>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.11-rc2 next-20240805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/412574090-163-com/PCI-limit-pci-bridge-and-subsystem-speed-to-2-5GT-s/20240805-173637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240805092010.82986-1-412574090%40163.com
patch subject: [PATCH] PCI: limit pci bridge and subsystem speed to 2.5GT/s
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20240805 (https://download.01.org/0day-ci/archive/20240806/202408061210.KkFwGezF-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408061210.KkFwGezF-lkp@intel.com/

smatch warnings:
drivers/pci/probe.c:1874 pcie_retrain_downstream_2_5g() error: uninitialized symbol 'ret'.

vim +/ret +1874 drivers/pci/probe.c

11eb0e0e8dea8b Sinan Kaya 2018-06-04  1848  
fcaa56be5f1d45 weiyufeng  2024-08-05  1849  static void pcie_retrain_downstream_2_5g(struct pci_dev *pdev)
fcaa56be5f1d45 weiyufeng  2024-08-05  1850  {
fcaa56be5f1d45 weiyufeng  2024-08-05  1851  	u16 lnkctl2;
fcaa56be5f1d45 weiyufeng  2024-08-05  1852  	const char *p;
fcaa56be5f1d45 weiyufeng  2024-08-05  1853  	int ret;
fcaa56be5f1d45 weiyufeng  2024-08-05  1854  
fcaa56be5f1d45 weiyufeng  2024-08-05  1855  	p = pci_speed_2_5g;
fcaa56be5f1d45 weiyufeng  2024-08-05  1856  	while (*p) {
fcaa56be5f1d45 weiyufeng  2024-08-05  1857  		ret = pci_dev_str_match(pdev, p, &p);
fcaa56be5f1d45 weiyufeng  2024-08-05  1858  		if (ret < 0) {
fcaa56be5f1d45 weiyufeng  2024-08-05  1859  			pr_info_once("PCI: Can't parse pci_speed_2_5g parameter: %s\n",
fcaa56be5f1d45 weiyufeng  2024-08-05  1860  				pci_speed_2_5g);
fcaa56be5f1d45 weiyufeng  2024-08-05  1861  			break;
fcaa56be5f1d45 weiyufeng  2024-08-05  1862  		} else if (ret == 1) {
fcaa56be5f1d45 weiyufeng  2024-08-05  1863  			/* Found a match */
fcaa56be5f1d45 weiyufeng  2024-08-05  1864  			break;
fcaa56be5f1d45 weiyufeng  2024-08-05  1865  		}
fcaa56be5f1d45 weiyufeng  2024-08-05  1866  
fcaa56be5f1d45 weiyufeng  2024-08-05  1867  		if (*p != ';' && *p != ',') {
fcaa56be5f1d45 weiyufeng  2024-08-05  1868  			/* End of param or invalid format */
fcaa56be5f1d45 weiyufeng  2024-08-05  1869  			break;
fcaa56be5f1d45 weiyufeng  2024-08-05  1870  		}
fcaa56be5f1d45 weiyufeng  2024-08-05  1871  		p++;
fcaa56be5f1d45 weiyufeng  2024-08-05  1872  	}
fcaa56be5f1d45 weiyufeng  2024-08-05  1873  
fcaa56be5f1d45 weiyufeng  2024-08-05 @1874  	if (ret != 1)
fcaa56be5f1d45 weiyufeng  2024-08-05  1875  		return;
fcaa56be5f1d45 weiyufeng  2024-08-05  1876  
fcaa56be5f1d45 weiyufeng  2024-08-05  1877  	pci_info(pdev, "set downstream link at 2.5GT/s\n");
fcaa56be5f1d45 weiyufeng  2024-08-05  1878  	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL2, &lnkctl2);
fcaa56be5f1d45 weiyufeng  2024-08-05  1879  	lnkctl2 &= ~PCI_EXP_LNKCTL2_TLS;
fcaa56be5f1d45 weiyufeng  2024-08-05  1880  	lnkctl2 |= PCI_EXP_LNKCTL2_TLS_2_5GT;
fcaa56be5f1d45 weiyufeng  2024-08-05  1881  	pcie_capability_write_word(pdev, PCI_EXP_LNKCTL2, lnkctl2);
fcaa56be5f1d45 weiyufeng  2024-08-05  1882  
fcaa56be5f1d45 weiyufeng  2024-08-05  1883  	if (pcie_retrain_link(pdev, true)) {
fcaa56be5f1d45 weiyufeng  2024-08-05  1884  		pci_info(pdev, "retraining failed\n");
fcaa56be5f1d45 weiyufeng  2024-08-05  1885  	}
fcaa56be5f1d45 weiyufeng  2024-08-05  1886  }
fcaa56be5f1d45 weiyufeng  2024-08-05  1887  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

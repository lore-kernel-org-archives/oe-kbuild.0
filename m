Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D0E1D7E41
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 04:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761625164; cv=none; b=JZA7CvwnC/w9cBtpqj7DKOoC5h4RNG/37RrT2gLzetxLTZnnYvsiKEsEqTgxEhlvTLRy4CLDdlM948E5IBy/GiE6YqlBlRJGmlT8TOZ0Hac32KLmFct5eGr3nyzdu4cotB8US0Nsbl98Q/WHTNtQahukcnLuEKNXsXyJEQTgse8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761625164; c=relaxed/simple;
	bh=5OQGBlxKw9aLB2O7M+FQd49Lun2kZT0DQoAM6YFPt1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4eDtJV58F+/KOoBh1fQlFApFleQmsgwrU27rDJRL5dEz6lgGWmhyYjRrDvBi46V/WCiSxo093ouwGLdM1cTFFe8daMxw1rvtpOZrGXHFOdrmkwjwCbkChpyhuVB8VVkiISx2gsKHrJ4LdT3vnzYAxJCuqn0KKzeScK6MWXOz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6euxBIQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6euxBIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761625163; x=1793161163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5OQGBlxKw9aLB2O7M+FQd49Lun2kZT0DQoAM6YFPt1E=;
  b=l6euxBIQliFG/hCZ2MFsJSvkLJxFK8BA1KBc/MkrzZm0e7/ZQQJHWvWM
   UCD44YpId4iKUYP0LpoAbnaWKUzq+N8NsdzIQdKRIGFGielUGMFPBrAVW
   svpG9V5lfDLkc/m9y2D9iB1R2frxA56B5pHqLnzjLGHYfjbXtrwKD2QHq
   e1MAhUMbnB9UaWA2yjMFORytdPLVhFX+zCGaU+1xAHFKnRcV6ycuChJTF
   zQPxEGk9LRsclWXBTav+VybT87xYFik/ZTCdfJCimlAoPgP5hCN1bpov1
   5YeklPFzZCvHIp2fm2Los1JIJafccB7JiTw/W9qrjSAy3+2a/aMoFUkfu
   g==;
X-CSE-ConnectionGUID: u8azUVEBTvK4SPfslveGmg==
X-CSE-MsgGUID: yMVHv6ZjRHSFFHU+m92S+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63624305"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="63624305"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 21:19:22 -0700
X-CSE-ConnectionGUID: 2PjKxIhCQE+Ui1JbQtE6lA==
X-CSE-MsgGUID: hbFHYnAZTn6fEvC0LXPJwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185140656"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Oct 2025 21:19:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDbB0-000IkP-1G;
	Tue, 28 Oct 2025 04:19:18 +0000
Date: Tue, 28 Oct 2025 12:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/debugfs.c:176 devid_write() warn: potential
 spectre issue 'pci_seg->rlookup_table' [r] (local cap)
Message-ID: <202510281233.q4cBnp3z-lkp@intel.com>
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
TO: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>
CC: Will Deacon <will@kernel.org>
CC: Vasant Hegde <vasant.hegde@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd57572253bc356330dbe5b233c2e1d8426c66fd
commit: 2e98940f123d9c69d4759078aea9a536244c98d3 iommu/amd: Add support for device id user input
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20251028 (https://download.01.org/0day-ci/archive/20251028/202510281233.q4cBnp3z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510281233.q4cBnp3z-lkp@intel.com/

smatch warnings:
drivers/iommu/amd/debugfs.c:176 devid_write() warn: potential spectre issue 'pci_seg->rlookup_table' [r] (local cap)
drivers/iommu/amd/debugfs.c:177 devid_write() warn: possible spectre second half.  'iommu'

vim +176 drivers/iommu/amd/debugfs.c

fb3af1f4fefb78 Dheeraj Kumar Srivastava 2025-07-02  136  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  137  static ssize_t devid_write(struct file *filp, const char __user *ubuf,
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  138  			   size_t cnt, loff_t *ppos)
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  139  {
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  140  	struct amd_iommu_pci_seg *pci_seg;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  141  	int seg, bus, slot, func;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  142  	struct amd_iommu *iommu;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  143  	char *srcid_ptr;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  144  	u16 devid;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  145  	int i;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  146  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  147  	sbdf = -1;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  148  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  149  	if (cnt >= DEVID_IN_SZ)
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  150  		return -EINVAL;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  151  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  152  	srcid_ptr = memdup_user_nul(ubuf, cnt);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  153  	if (IS_ERR(srcid_ptr))
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  154  		return PTR_ERR(srcid_ptr);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  155  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  156  	i = sscanf(srcid_ptr, "%x:%x:%x.%x", &seg, &bus, &slot, &func);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  157  	if (i != 4) {
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  158  		i = sscanf(srcid_ptr, "%x:%x.%x", &bus, &slot, &func);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  159  		if (i != 3) {
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  160  			kfree(srcid_ptr);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  161  			return -EINVAL;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  162  		}
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  163  		seg = 0;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  164  	}
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  165  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  166  	devid = PCI_DEVID(bus, PCI_DEVFN(slot, func));
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  167  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  168  	/* Check if user device id input is a valid input */
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  169  	for_each_pci_segment(pci_seg) {
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  170  		if (pci_seg->id != seg)
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  171  			continue;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  172  		if (devid > pci_seg->last_bdf) {
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  173  			kfree(srcid_ptr);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  174  			return -EINVAL;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  175  		}
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02 @176  		iommu = pci_seg->rlookup_table[devid];
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02 @177  		if (!iommu) {
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  178  			kfree(srcid_ptr);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  179  			return -ENODEV;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  180  		}
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  181  		break;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  182  	}
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  183  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  184  	if (pci_seg->id != seg) {
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  185  		kfree(srcid_ptr);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  186  		return -EINVAL;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  187  	}
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  188  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  189  	sbdf = PCI_SEG_DEVID_TO_SBDF(seg, devid);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  190  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  191  	kfree(srcid_ptr);
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  192  
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  193  	return cnt;
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  194  }
2e98940f123d9c Dheeraj Kumar Srivastava 2025-07-02  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

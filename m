Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9CFEED8
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 06:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771049958; cv=none; b=BPxrmHtuQ9WfuK528H/5Cy+193Vu4tNty3HP+ae0xjuDlFJtQo+/7tirYdPHIL2I7A8AF3R+skYF2d7w5GYjeWeX6Uy18NfdAS4T09ILgHDNEWK1dvbwMHM+PqBvm3Hs+nv7/pXDnHBBCHTTvh4v4kWd/Q50HQavJbj49n3hll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771049958; c=relaxed/simple;
	bh=VVzoGaDcWeOit0WF5e2njoypQDccwtAtZkYo/1wACNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SyQPXL4fdArhFPOGoTkFZxLmF6xHXZ8YbJJ1s601r74du7I0hhr0DHS8RVQApDTsuQxsXRd0+gzLlCu26GHsTyTp9cj2JVxwWs7rnFCYQumcjAnQmk5KfZH+IneEVEDi4KEzzM6I9hcTltTa/ZmkeLZdlxSwnhW7JQdMiHWjsI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1aB5wGB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1aB5wGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771049955; x=1802585955;
  h=date:from:to:cc:subject:message-id;
  bh=VVzoGaDcWeOit0WF5e2njoypQDccwtAtZkYo/1wACNA=;
  b=I1aB5wGBESgSCHIgkgFJgENMzk50Godzsa37gngjf/FF5qWYXUHshonv
   WKzLEIpSt1NB3KEP0GS1vQt3/oqFl/Ww6A5YDJA0laPQy43bPUDXScebQ
   nJuqVP3/60I9Tn68zLtGt7l8L/xrD6VW3NMu263Zh7VcO8VWeYAny06UP
   /aO18BTPuxcHXK9CysE6v/BwUrLh24NvZvEP2lEaYegNS40lrMmxUMQjN
   e1HWaSEPYWiso3ZuhvZ/Xaubz65CkaQFSq1CEWpjLoiWtvBXh1Ks+U0+k
   RcQEooX76g1Qp+lJWl6mXtIg2JkE0jHZ+SoiR2oOnWN/uH0hkhoPxF2cG
   A==;
X-CSE-ConnectionGUID: /+vueYfYQSeetKvGBtg3Jw==
X-CSE-MsgGUID: j8yS7OoSTzGW6U+m/1j8FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82860402"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="82860402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 22:19:14 -0800
X-CSE-ConnectionGUID: YGV/uiMDRfS3eb4CGbWE2Q==
X-CSE-MsgGUID: Y09nqMd0SBuwQRqgUjXf9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="217660485"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2026 22:19:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr8zm-00000000wGy-31yR;
	Sat, 14 Feb 2026 06:19:10 +0000
Date: Sat, 14 Feb 2026 14:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/debugfs.c:176 devid_write() warn:
 potential spectre issue 'pci_seg->rlookup_table' [r] (local cap)
Message-ID: <202602141440.b7QaGz0k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dheeraj Kumar Srivastava <dheerajkumar.srivastava@amd.com>
CC: Will Deacon <will@kernel.org>
CC: Vasant Hegde <vasant.hegde@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   770aaedb461a055f79b971d538678942b6607894
commit: 2e98940f123d9c69d4759078aea9a536244c98d3 iommu/amd: Add support for device id user input
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-r073-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141440.b7QaGz0k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602141440.b7QaGz0k-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEB401A11
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550949; cv=none; b=L0CycRBfXL3Ur7I778DXwmvYheEQBPJ7OF9zway4Jm3m3muBe22Kz86R6HVCUl4E/keSQ9IYbUik9S9panYBqBvX1D2fZna93C1xI2mJfHe27IeVsTxqFbNtb7uiNXZvV0dYvLb1XORai/4gOjq6FGR8OhcvEU+lAJcedVh6mMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550949; c=relaxed/simple;
	bh=7KLz4rScqdpiyitaqj+PTtWFIWmdpyj0RCsyxc7MddQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ko3rHuwqN3yqOru/DUJpUCikpNs2Xdzts+jiW6CT0k+iMbhz+ENslaZCzDHYAJ1MoPyHzjA8Wv5yYMxRgxe6dfkeWZcWZq67HbSvSblOhhraKHkJynrS+xbRa8m4t/5GWm7o5CXR98H+nGi2j/xon9emjeCrgzuYnzAlmSdMlvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAsdFue/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAsdFue/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777550947; x=1809086947;
  h=date:from:to:cc:subject:message-id;
  bh=7KLz4rScqdpiyitaqj+PTtWFIWmdpyj0RCsyxc7MddQ=;
  b=LAsdFue/YqsGJ9O4igjdavCgbaEw33i4iSobFsz1GH7HkB+zrCKRwNu0
   NW8/k51TaHObCAlGZeRjfYT7m/viIkOw0YU6tzLpHWaqR8WXwd9xrLcTq
   cnRrewa0VJjCH2CUqdmw69cM8LUIkL7ugG3xeyWDiYyr32P5y7Bv06ztA
   TBX1t3muRofPh177vTmybRTes0GjWmHqyTcZ1cXtTWjKQ8yG2bFGDHFHi
   XWhZWPF3FZJqIRlLRMtJT4z6XjqA/7UV4/pKcxzXrJ6vymoSWopFt/+hA
   AvyZH2bwW6iWKevS0Nb6X3ovFC1N5lOYB3ifRO7jrSDT3x5rjGB/0Fwpy
   A==;
X-CSE-ConnectionGUID: KCVkqng5Q8uEt3S+zEyM2A==
X-CSE-MsgGUID: wHhmy8v5TJam6sVOTnljLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78553579"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78553579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:09:06 -0700
X-CSE-ConnectionGUID: R8AyjFDJT7Cp5NlbGp+uTg==
X-CSE-MsgGUID: +SrsXRfvRnSqV+UvjGQwXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="231921478"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 05:08:39 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIQC1-000000004of-2jbk;
	Thu, 30 Apr 2026 12:08:33 +0000
Date: Thu, 30 Apr 2026 14:07:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/acpi/arm64/iort.c:1636:16: error: implicit
 declaration of function 'iort_pci_rc_pasid_max_width'; did you mean
 'iort_pci_rc_pasid_max_width_known'?
Message-ID: <202604301437.k1Iw3k3Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vidya Sagar <vidyas@nvidia.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vidya-Sagar/ACPICA-IORT-Add-Root-Complex-PASID-Flags-field/20260426-054631
head:   a0da5d27526664b439120011476f6753cb272f3f
commit: d8fbda371b8b1734c61a761fa92c9511e20bdbd9 ACPI/IORT: Plumb Root Complex PASID descriptors into iommu_fwspec
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604301437.k1Iw3k3Q-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301437.k1Iw3k3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604301437.k1Iw3k3Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/arm64/iort.c: In function 'iort_pci_rc_pasid_max_width_for_dev':
>> drivers/acpi/arm64/iort.c:1636:16: error: implicit declaration of function 'iort_pci_rc_pasid_max_width'; did you mean 'iort_pci_rc_pasid_max_width_known'? [-Wimplicit-function-declaration]
    1636 |         return iort_pci_rc_pasid_max_width(node);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                iort_pci_rc_pasid_max_width_known


vim +1636 drivers/acpi/arm64/iort.c

d8fbda371b8b17 Vidya Sagar 2026-04-24  1619  
d8fbda371b8b17 Vidya Sagar 2026-04-24  1620  /**
d8fbda371b8b17 Vidya Sagar 2026-04-24  1621   * iort_pci_rc_pasid_max_width_for_dev() - Look up the Root Complex Max PASID
d8fbda371b8b17 Vidya Sagar 2026-04-24  1622   * Width for the given PCI device.
d8fbda371b8b17 Vidya Sagar 2026-04-24  1623   * @dev: PCI device to lookup
d8fbda371b8b17 Vidya Sagar 2026-04-24  1624   *
d8fbda371b8b17 Vidya Sagar 2026-04-24  1625   * Returns the Max PASID Width (bits[4:0] of PASID Capabilities) declared by
d8fbda371b8b17 Vidya Sagar 2026-04-24  1626   * the Root Complex node in IORT firmware, or a negative errno when the field
d8fbda371b8b17 Vidya Sagar 2026-04-24  1627   * is not present (RC node revision < 4) or the device is not PCI.
d8fbda371b8b17 Vidya Sagar 2026-04-24  1628   */
d8fbda371b8b17 Vidya Sagar 2026-04-24  1629  int iort_pci_rc_pasid_max_width_for_dev(struct device *dev)
d8fbda371b8b17 Vidya Sagar 2026-04-24  1630  {
d8fbda371b8b17 Vidya Sagar 2026-04-24  1631  	struct acpi_iort_node *node = iort_pci_rc_node_for_dev(dev);
d8fbda371b8b17 Vidya Sagar 2026-04-24  1632  
d8fbda371b8b17 Vidya Sagar 2026-04-24  1633  	if (!node)
d8fbda371b8b17 Vidya Sagar 2026-04-24  1634  		return -ENODEV;
d8fbda371b8b17 Vidya Sagar 2026-04-24  1635  
d8fbda371b8b17 Vidya Sagar 2026-04-24 @1636  	return iort_pci_rc_pasid_max_width(node);
d8fbda371b8b17 Vidya Sagar 2026-04-24  1637  }
d8fbda371b8b17 Vidya Sagar 2026-04-24  1638  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

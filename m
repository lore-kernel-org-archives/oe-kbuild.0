Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABB5184E
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 21:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764452956; cv=none; b=eTF2litTC0kVrB/o1X+CyTyvIRgzgrj3u+0pQ+nLYXBziXFAKs+3f0ozwvhWB8ET8129UGyIxJLC+cmo284tDKPQepcy0R4xiJiphgrikNt2iaqQqVUKPEXZhELTP1MMt2wSMJjWingm1AKwmBaABT8VhK07xV1H40vi/GAbGTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764452956; c=relaxed/simple;
	bh=DGEokZ8QnxuRrJLMRovZSF1AXnFdDoyD4+RQYoVYC3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RQxObmLj+0bc3KpX4sVUwa393sjcrwaAczh5JqeTODxbWc1J/N0HBQ04gPztEIGZmY/WriMR59JjrIF2fMvvReyxwRfjwmkJZh6xyvjOd19tRi4oOU8JG3Vu+8KJYC5YgmgrNRbDfXUoc+vWCRktia6SLWn9gy7tO496DjmmBSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GREk0t4z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GREk0t4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764452955; x=1795988955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGEokZ8QnxuRrJLMRovZSF1AXnFdDoyD4+RQYoVYC3c=;
  b=GREk0t4zjmPjQ4GHy7j+zpCOLt7c1fBr0rqGY4STJecE66/MOUzdrDhf
   WRtMvepfilo+kY4UAOK7W7H3vzBgWkj7Ji2F41il7USVIQ3FW7ejFw53A
   C3zH1lr/b/rl5V+RHQObyAbwYzYCyuWdYUy1chv0kFdW3su+WvBbF9xlH
   Sud8ZUOf11Lkd4uiRnJrAyEFuSsdEpLUfKjYBDtveKs+Y02xfgRneBY3l
   BD/TsmPmyBcyTlXeA+AeAD02toFdoqyqckPApzXNzNTb6iU2m3hJ2iOMD
   fPmEBDhCJGwEJoMm/ZfZmmWt6OKDuxHOEduAJH6xC88GF09fwlzrsSokW
   A==;
X-CSE-ConnectionGUID: EU9KnpBCSWG1mTl+wCUwjw==
X-CSE-MsgGUID: dKgNJ0iYSxmuroERV+1sYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="65617187"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="65617187"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 13:49:14 -0800
X-CSE-ConnectionGUID: Bs16sDqlRW2syyzvvSQQiQ==
X-CSE-MsgGUID: y4bRrL02SUGhYYl0CT5pdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="193621744"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 29 Nov 2025 13:49:14 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPSoY-000000002Q1-26Yi;
	Sat, 29 Nov 2025 21:49:10 +0000
Date: Sat, 29 Nov 2025 22:48:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5] drivers/acpi/arm64/iort.c:637:
 warning: Function parameter or member 'id' not described in
 'iort_get_device_domain'
Message-ID: <202511292200.BRMGwGeL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Lorenzo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: da36a3ef32b476ca6464226010ef73135fc3c3a4 [5/5] ACPI/IORT: Make iort_get_device_domain IRQ domain agnostic
:::::: branch date: 6 days ago
:::::: commit date: 2 years ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251129/202511292200.BRMGwGeL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511292200.BRMGwGeL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511292200.BRMGwGeL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/arm64/iort.c:53: warning: Function parameter or member 'iort_node' not described in 'iort_set_fwnode'
   drivers/acpi/arm64/iort.c:53: warning: Excess function parameter 'node' description in 'iort_set_fwnode'
>> drivers/acpi/arm64/iort.c:637: warning: Function parameter or member 'id' not described in 'iort_get_device_domain'
>> drivers/acpi/arm64/iort.c:637: warning: Function parameter or member 'bus_token' not described in 'iort_get_device_domain'
>> drivers/acpi/arm64/iort.c:637: warning: Excess function parameter 'req_id' description in 'iort_get_device_domain'
   drivers/acpi/arm64/iort.c:1064: warning: Function parameter or member 'dma_size' not described in 'iort_dma_setup'
   drivers/acpi/arm64/iort.c:1064: warning: Excess function parameter 'size' description in 'iort_dma_setup'
   drivers/acpi/arm64/iort.c:1475: warning: Function parameter or member 'ops' not described in 'iort_add_platform_device'


vim +637 drivers/acpi/arm64/iort.c

4bf2efd26d7624 Tomasz Nowicki    2016-09-12  627  
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  628  /**
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  629   * iort_get_device_domain() - Find MSI domain related to a device
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  630   * @dev: The device.
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  631   * @req_id: Requester ID for the device.
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  632   *
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  633   * Returns: the MSI domain for this device, NULL otherwise
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  634   */
da36a3ef32b476 Lorenzo Pieralisi 2020-06-19  635  struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
da36a3ef32b476 Lorenzo Pieralisi 2020-06-19  636  					  enum irq_domain_bus_token bus_token)
4bf2efd26d7624 Tomasz Nowicki    2016-09-12 @637  {
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  638  	struct fwnode_handle *handle;
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  639  	int its_id;
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  640  
da36a3ef32b476 Lorenzo Pieralisi 2020-06-19  641  	if (iort_dev_find_its_id(dev, id, 0, &its_id))
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  642  		return NULL;
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  643  
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  644  	handle = iort_find_domain_token(its_id);
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  645  	if (!handle)
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  646  		return NULL;
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  647  
da36a3ef32b476 Lorenzo Pieralisi 2020-06-19  648  	return irq_find_matching_fwnode(handle, bus_token);
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  649  }
4bf2efd26d7624 Tomasz Nowicki    2016-09-12  650  

:::::: The code at line 637 was first introduced by commit
:::::: 4bf2efd26d7624372fb7adff8745b4c2e8407004 ACPI: Add new IORT functions to support MSI domain handling

:::::: TO: Tomasz Nowicki <tn@semihalf.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

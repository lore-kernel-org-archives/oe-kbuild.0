Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107911ACEDA
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 06:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763793810; cv=none; b=Wi0ib9TWL/4f4urrLJAzSuVexiEzRp9oOGle4nGb5Wp8xFuHNrzWhgZo2/KJ9vRffZlpvC8I1+Xi985FcykdR51Rsj6uoYOV2jM20epzaJLFPzufDkpzdIR3hHT5NqiNk6ZqmXzGpMLJtePwsbsrJCVCtxEhKpoZ6QUSDgvjfAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763793810; c=relaxed/simple;
	bh=97gW/V6IEyaAIQCoWaKbfTgFuLjlQ+8mWRQ6/gEhYdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXKKG+Fbm8wGZt/V+zGh7M6f1Wx8Bc/6efgdAlUJd3evyXJJpyu+Nl1h0LPaBV6/rzsfnUBNRkwFHWYgzmlkzFGEznaBncG0PSC2hFvpUX3ydwNRGkMutVqR2Gsr/fHvZ2LFSvQhepd7tpiq5VfVevo8qUffimLO3FdJkJDmB94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6NybuVP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6NybuVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763793809; x=1795329809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=97gW/V6IEyaAIQCoWaKbfTgFuLjlQ+8mWRQ6/gEhYdo=;
  b=d6NybuVP+BNPatB813uVHchS0mRg7ykIKSNo8Yz5HqQgk4GTumqbXH4F
   cwXt/OWlmYuBBNozYx3VsZ5pP73yD46+SE09/lec6k2Gj3cIuuB3HcGJ7
   1Xq0l/dhkpOtH/np4FeRm2KSsxiVkACBFeVfjYlbRa4KJgdMlUvoNaTt3
   AMme1XpIVU7D2U2xLJvbqUJwj7BHcS8cTznFqSb0d2aJaXLA84vXpMgaU
   zQHNtNd1hr5RaKtfQaYl7Ilfg4To7XFTsUcX1e7cbFjn09tQtB1EjbbAx
   aqDt3ydPuBbyURxQC/L9mAhld8y9knDKQCjYvGNHTXkdKn/dPeHvmeC4/
   A==;
X-CSE-ConnectionGUID: VVsRI7gSSmizJGxujmsK0w==
X-CSE-MsgGUID: Mrb6EG3CSjazTrCRHYxKLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69746781"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="69746781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 22:43:28 -0800
X-CSE-ConnectionGUID: MupPMRnjQie5doTC6oqJVA==
X-CSE-MsgGUID: XHONwIIRT02XZLuNObzYvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="191906283"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Nov 2025 22:43:27 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMhLA-0000000022N-3zAG;
	Sat, 22 Nov 2025 06:43:24 +0000
Date: Sat, 22 Nov 2025 07:42:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5] drivers/acpi/arm64/iort.c:637:
 warning: Function parameter or member 'id' not described in
 'iort_get_device_domain'
Message-ID: <202511220710.1FEPC3f1-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   b2957a0ebc3b9949475a442f9e8ab64ccaa6e087
commit: da36a3ef32b476ca6464226010ef73135fc3c3a4 [5/5] ACPI/IORT: Make iort_get_device_domain IRQ domain agnostic
:::::: branch date: 5 days ago
:::::: commit date: 1 year, 11 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511220710.1FEPC3f1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220710.1FEPC3f1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220710.1FEPC3f1-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DA82AEEC
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Oct 2024 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550643; cv=none; b=nV4V/kY6lwGfAODdNiRWpcQh2aUxJzl6ZTL+02jtmlBUAOyAN8q4YMlU+X3WSYp9dTJxrWNAm8/joIHO6HgDa3M2Rqjhzxf6LnskGQX7xIeG10FEL0pOhwObmGeO7z5LbOSpoAI5V1HOsGEXTyCLonzJ3s6Bsm0Sr/W65uB+0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550643; c=relaxed/simple;
	bh=YteLd4j25msIZGKrMUhO4QJycABwPjt6CjVouFS5go0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sgMrGA+FsvcbKbOjS1eZrmIh7c2WjWRom4s/D9bNhfDfhb/nWjABbP6ZLMpbCS+Wc4TvUybZiwqvFaFDIKOLdMd1Ri09N568KFQg6g4zqi9YDrWidfoqWIaHzlNBiv2BOFC2J2o/d6fNjXj9LkGVpWpBmhLqTaex3hk8puYcKRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/OHGNaw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/OHGNaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728550642; x=1760086642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YteLd4j25msIZGKrMUhO4QJycABwPjt6CjVouFS5go0=;
  b=I/OHGNaw3nF4QoaOG4tXrxWltQUnUOLABUL/fEqbWtQIQOAlwprcY9Pq
   nRyMZ+enaTfhB6Rm8BXZkmvc7vt5HlYy5+ngaSfzTx4A0QLJyaemVddv2
   q+gpRTgZrqz3wxGu93qAn5SNr9HDJHgOl/q3f84uXuOgk2MV8MXHl9VOS
   AnS7j0ZT2sv6lzpsQ41f6Ad+H66PST1FyGquISbjjwnTfVGQKueaoTGDo
   SQIdbz8KiKdi3n97Jr755Adr5qy7D4V5Y20668UsnQ6wQ3RbtqUOENDm8
   ZpJ3aMmtMHRWg1ZR6CGXs5tqc0uoEIek332jfMBfnXlWjOsZXf+rLLTAk
   w==;
X-CSE-ConnectionGUID: sXs3RmNQSbaE64UelOF/6Q==
X-CSE-MsgGUID: kyoaVWPcStiAqEM64Y/JNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38465974"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="38465974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 01:57:06 -0700
X-CSE-ConnectionGUID: ww36cjQ+T2qIlPFhVtsJ+g==
X-CSE-MsgGUID: amyRwRrYT7GEqaJX0vl+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76619011"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Oct 2024 01:57:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syoyh-000AX1-2H;
	Thu, 10 Oct 2024 08:56:59 +0000
Date: Thu, 10 Oct 2024 16:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/intel/iommu.h:990 clear_context_copied() warn:
 clear_bit() takes a bit number
Message-ID: <202410101608.s2gSuaug-lkp@intel.com>
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
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3d1556696c1a993eec54ac585fe5bf677e07474
commit: 80b79e141da7251d6ea82573f058ee9418896465 iommu/vt-d: Move inline helpers to header files
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101608.s2gSuaug-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410101608.s2gSuaug-lkp@intel.com/

New smatch warnings:
drivers/iommu/intel/iommu.h:990 clear_context_copied() warn: clear_bit() takes a bit number
drivers/iommu/intel/iommu.h:984 set_context_copied() warn: set_bit() takes a bit number

Old smatch warnings:
drivers/iommu/intel/iommu.c:325 domain_update_iommu_coherency() warn: iterator 'i' not incremented
drivers/iommu/intel/iommu.c:616 device_lookup_iommu() error: we previously assumed 'pdev' could be null (see line 589)
drivers/iommu/intel/iommu.c:1984 switch_to_super_page() warn: iterator 'i' not incremented
drivers/iommu/intel/iommu.c:3106 intel_iommu_add() warn: missing unwind goto?
drivers/iommu/intel/iommu.c:4102 intel_iommu_tlb_sync() warn: iterator 'i' not incremented
drivers/iommu/intel/iommu.c:4540 intel_iommu_iotlb_sync_map() warn: iterator 'i' not incremented

vim +990 drivers/iommu/intel/iommu.h

80b79e141da725 Lu Baolu 2023-12-18  980  
80b79e141da725 Lu Baolu 2023-12-18  981  static inline void
80b79e141da725 Lu Baolu 2023-12-18  982  set_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
80b79e141da725 Lu Baolu 2023-12-18  983  {
80b79e141da725 Lu Baolu 2023-12-18 @984  	set_bit(((long)bus << 8) | devfn, iommu->copied_tables);
80b79e141da725 Lu Baolu 2023-12-18  985  }
80b79e141da725 Lu Baolu 2023-12-18  986  
80b79e141da725 Lu Baolu 2023-12-18  987  static inline void
80b79e141da725 Lu Baolu 2023-12-18  988  clear_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
80b79e141da725 Lu Baolu 2023-12-18  989  {
80b79e141da725 Lu Baolu 2023-12-18 @990  	clear_bit(((long)bus << 8) | devfn, iommu->copied_tables);
80b79e141da725 Lu Baolu 2023-12-18  991  }
80b79e141da725 Lu Baolu 2023-12-18  992  #endif /* CONFIG_INTEL_IOMMU */
80b79e141da725 Lu Baolu 2023-12-18  993  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

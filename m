Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32111A7057
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725989100; cv=none; b=vDvt0EgR2Bf9GNWIMUAbKsfL8v9hHBxsMKedYSdlcupYassk6cd2+6s0OxkdR50XvuV6avogEm6V1ywZUDREf9oMHZZMWabHmanIRsj8A78rw7iEasE5hWpwtvAoggOJAvOzhSLwFE+7vULPeeLeh1QJkfIuArDAR+QLXwQjJWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725989100; c=relaxed/simple;
	bh=uhPSykUl8uWHjMAPUCrzY6RLR/pkXInZ1xwTjq8EuJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5+X5SmZmMzN6p0Y1hJ3QE/JtMZdpp2uuSacp2rVHhEFzsmWf2UrNsAxVT9TjYXCTaEN0yrWL6OhGZ1oSkZKdzywIG7J1ygdqGdag+UAK6orzW+5olNfeu7R0R76afvzs5xYDO6RmD/HXe4P6VaD80R5zj0Sm/BRvJiiKC3+aTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxEhMHoL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxEhMHoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725989099; x=1757525099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uhPSykUl8uWHjMAPUCrzY6RLR/pkXInZ1xwTjq8EuJg=;
  b=OxEhMHoLAJU8atmuoXr84Iex8rVsp1kjm271Vc9RRAFfyVZJ5QIt54+5
   +jG/9hK0eiFvJc/+YwLXoq8w0xW8PrL6gKHpy1hcYy6tUET8ymitNeT+r
   rFjfLZwZvNrqnvuqK7hpn5IhPTTSRvMITb0mhCG6Vw5W/GIfcSFH8oICl
   YrYV18tITuO0zOfghyX4KCCPYDNwNU/pfEd2yx8FHU9XCSLt9VmJei3r7
   mMamjX/Uw5akCs4XN0K/eAHsfNFazhK3Zp446i9INI5rYi19lrxMp40am
   QGTAa1qdxTBPcazbu6nqTVYqbQivmH4Uv6fu3NAUUd7LWzi+oQL6804Np
   w==;
X-CSE-ConnectionGUID: PO1zYzQoQk+ww1GLQyFMRA==
X-CSE-MsgGUID: WkJ+J9c1Sw2RUGCZc/Qvpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42230281"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="42230281"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 10:24:59 -0700
X-CSE-ConnectionGUID: 3VxQXLaRSuabWxYNyevWIA==
X-CSE-MsgGUID: ok7xqBJ0To6zAvCx9+EVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="67858073"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2024 10:24:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so4bn-0002R8-18;
	Tue, 10 Sep 2024 17:24:55 +0000
Date: Wed, 11 Sep 2024 01:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-6.1.y-cip 20/31] kismet: WARNING: unmet direct
 dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by IPMMU_VMSA
Message-ID: <202409110129.wy3doJta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   d5cc54849a0b793a2413dcd5f31b45d9907066ab
commit: 852f7b6a0848450c6f403a87f8d0e4cce158d307 [20/31] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
:::::: branch date: 4 days ago
:::::: commit date: 8 months ago
config: riscv-kismet-CONFIG_IOMMU_IO_PGTABLE_LPAE-CONFIG_IPMMU_VMSA-0-0 (https://download.01.org/0day-ci/archive/20240911/202409110129.wy3doJta-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240911/202409110129.wy3doJta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409110129.wy3doJta-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by IPMMU_VMSA
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
     Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
     Selected by [y]:
     - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

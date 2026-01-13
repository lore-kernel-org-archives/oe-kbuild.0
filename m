Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529B241690
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768346577; cv=none; b=bHJfY3aadzEddGug8F6X4tVOQAeLVmArtpzx9UmkLLqGX0QB9whVbNzYIy0NFUWc7KlNcI0XhswVFwc1brBKB2aXpeor0i1d2aDkYTPG9KbYcGGs11StQ2we3kDVPncE/OgfcwwPs+21eXuG7exIG12lq3GgVu4aanwicdUotT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768346577; c=relaxed/simple;
	bh=Py2QjXbLffeiLR/uSKu8T+bmc5UZE+R3kILQsbbeQoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y5O/aur7tIO4iRceZPdAaorhLFKAGGHDCIP1eCHUF/9f5zu+7brv+SG1/m+2fQ3/zCB8IdbbVR8r5ZE5qVKsvqxjdLddgAiHC7LvYqhnnRKm42algOqk9c9WaYDnv6Ty58Uv/A2EGn6ljD9YyPhq8jRYt8zQMoIb1QjtsmgR0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5ZdVVxJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5ZdVVxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768346575; x=1799882575;
  h=date:from:to:cc:subject:message-id;
  bh=Py2QjXbLffeiLR/uSKu8T+bmc5UZE+R3kILQsbbeQoM=;
  b=A5ZdVVxJ7j/DuifXddSxt/cMtwckhXyTOyO1r2LYd0WqcsO2isWXO8xw
   8R90eTMAoYIH8Qonsxap6NUlWXdgV6PCpGTvmwErvJCUmZVClrg4Qz6ht
   Qyz3716j7TKSluZ4HhU2Jr++pgpRsT4vVANrf3w/l1dYxHCrTDbeJry/k
   ZL1Ngk96THSHfDDHyBCAPJMe2dtuvpHyBf/0Ur4EaxbORmswflHvMZ/lE
   okBAk/red+fmShaNPZchJZ0t7MbAe8ozoV3V6MHYzYEOAMTYTYY9YT1pF
   v+twwFozzD3xSLYBjlo2KJ+3NOOS+Mg9GY8s7UHsuHemuS7yFXpcd8U81
   w==;
X-CSE-ConnectionGUID: cySClS0/RQW9nWGeTiUe8A==
X-CSE-MsgGUID: FfthoLnySbSTxgrF2OrezQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68850252"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="68850252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 15:22:54 -0800
X-CSE-ConnectionGUID: 14d02vGgTkef0CJ77VyHtw==
X-CSE-MsgGUID: 4OnEjEloTgK+1JN2iiTQHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="227684406"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 15:22:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfnir-00000000FUO-2Vhu;
	Tue, 13 Jan 2026 23:22:49 +0000
Date: Wed, 14 Jan 2026 07:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2110/5774]
 drivers/pci/controller/pcie-aspeed.c:1109:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601140733.zflHV0M1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pci/controller/pcie-aspeed.c:1109:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jacky Chou <jacky_chou@aspeedtech.com>
CC: Manivannan Sadhasivam <mani@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f853ca2a798ead9d24d39cad99b0966815c582a
commit: 9aa0cb68fcc16280c8c8bdd22dc770af8dd7349f [2110/5774] PCI: aspeed: Add ASPEED PCIe RC driver
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: microblaze-randconfig-r134-20260111 (https://download.01.org/0day-ci/archive/20260114/202601140733.zflHV0M1-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140733.zflHV0M1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140733.zflHV0M1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-aspeed.c:1109:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/pcie-aspeed.c:1109:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pci/controller/pcie-aspeed.c:1110:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/pcie-aspeed.c:1110:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pci/controller/pcie-aspeed.c:1111:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/pcie-aspeed.c:1111:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pci/controller/pcie-aspeed.c:1111:1: sparse: sparse: bad integer constant expression
   drivers/pci/controller/pcie-aspeed.c:1111:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1109 drivers/pci/controller/pcie-aspeed.c

9aa0cb68fcc162 Jacky Chou 2025-12-16  1108  
9aa0cb68fcc162 Jacky Chou 2025-12-16 @1109  MODULE_AUTHOR("Jacky Chou <jacky_chou@aspeedtech.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

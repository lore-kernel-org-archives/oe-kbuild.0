Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4B1D5166
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747564463; cv=none; b=PXDgoMLZk31xgfZsqpAY0zeC4dZjXyoHzgFgMYAdRxYwS2TfxZXo9VynALJZk4EG/NLKjhzOhC48d4PAfwkj7tdOuLYRZv88LvAk6bTuKUb4qwKrDThzyD0jZYS89EkxvltBsUPCS3fTLnt4ZnGYEMRFvo34ce5/zTUvUWm3vFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747564463; c=relaxed/simple;
	bh=oRcR2VaNy00mRYncSP1IKKvcghYZqzKLcFiOkrCccl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SN5foXmiVr8vfTVyzwwoywYtGycLTBvjba7/6To835d+n3YQ5soL2jrsA7Upc/9CUhlQi9op28cgwGm1Ld6d3yYAmwn0PYUr/IK+w/mIugeNIjKk9LR7W10vvQXLfMpSMKfqJS6r4yFeftkBx9Vmpt/lZmzGyVSqXqXtHOQIUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDKzLP1n; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDKzLP1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747564461; x=1779100461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oRcR2VaNy00mRYncSP1IKKvcghYZqzKLcFiOkrCccl0=;
  b=QDKzLP1nip6clhE88JwzD2b+i++euNY2/OGRH8GO6uhTDO0U0zc9D2Lo
   tKa1Qn0M2w/czvmJQIVIsrptZtoZzwrFHuHr2fhT7Umas652KfWnIXnF8
   xIO5jJnwLs6kIFCLNmk0BmWSYXvK/2rMbseWH/+E6+Y32/7efYxt++gF7
   sAablWKrHYQ1o8iFPjxHE5uELvDSROcD+ohiIY5rSrwOlGuS7jQPcmdhh
   l97eDHS7yvoOWet/oXdssEGkIhzAYoS6DDhH6W3hhJfDUz7qGUNlnk3Rw
   QlfDPVxSRyr3fU1VttGuDO57frNqXCfwupVkotfKBxmGPcgOCBvBY4t2j
   Q==;
X-CSE-ConnectionGUID: HGN5HiFxTpuVIBjdbp3YqQ==
X-CSE-MsgGUID: GIxOhm/yTrua0reLDUjMiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60870591"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="60870591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 03:34:21 -0700
X-CSE-ConnectionGUID: ZunxK76+SheJVDgIgGmh6g==
X-CSE-MsgGUID: 3QRsPCPBRkGm/M9Qu02jZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="176223289"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 May 2025 03:34:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGbLV-000KkT-1M;
	Sun, 18 May 2025 10:34:17 +0000
Date: Sun, 18 May 2025 18:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes
 available for requested alignment of 8 bytes
Message-ID: <202505181822.KW4Akyi3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5723cc3450bccf7f98f227b9723b5c9f6b3af1c5
commit: 84ffc79bfbf70c779e60218563f2f3ad45288671 kbuild: Add '-fno-builtin-wcslen'
date:   6 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-001-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181822.KW4Akyi3-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181822.KW4Akyi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505181822.KW4Akyi3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

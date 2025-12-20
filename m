Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B132327AC4D
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766256884; cv=none; b=Uc4P87xdZl21WbwUeHT88wfsiyKaHaW2krfM6zk7skqdmzNjCaO4dzjIUGgPsIsZ+uM+qZicd52/m+IdOX310i+IzWUG7AO50IqhVDH+7jsol45tKbggZ87lTt2ajZTG6Ub1/DsbicMcJuChTn4dQZVeKeWub8uDE7EIUfrKXjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766256884; c=relaxed/simple;
	bh=ZeqJw3Y0zDPQusBGTKZoM7/PNVAG6cwern/TW7O2OqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nvWFahAT12+ifKhPitCGjZMQswUcUgIXJ4iQ2HxOnKql/i4GmRnPbZ1zAqgZ9HJctUToqMi0Kyg5PtsoRNa5+vJDtNR2hlpVk8OSxRTH84RLGCcFbiGQ8XiRMVjAZGg57N3Mp+FX85lDRLKxbiK6FgiYtATCQYE7jt0f2WM2NOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKuVv420; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKuVv420"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766256883; x=1797792883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZeqJw3Y0zDPQusBGTKZoM7/PNVAG6cwern/TW7O2OqY=;
  b=ZKuVv42048NpLWwJ+qSTVKlPZlU4bI5RW16gvhVRl/vW1VJK9sAsZEPH
   dG1xv2aOf5h8XPvQtg3Ziju9ayeG7Olx+GqEzOwyjWJ42c/JiWbvdwgEy
   4WoBRAf5Acu/LKsIXbNLsG7qp2ntEb9TQMZ4R+CdHQ9vgtgb2lm77OW8G
   OP092uvJFf3bcy6MpTC3YcQSgHPpuqP6RL1uayn1p1DXSzKh7YRVdA6vL
   8+DX2/cqupNkhvtcxi4AtdUShUzQstV7EJDFK5B1ewigCwso1L6gbcCWc
   73LAQyEOnrHdPL9CeA1B5Ob1wpYFNIOf+REFsvN+oOMn+s309ElmhdeKN
   A==;
X-CSE-ConnectionGUID: UUJ+IxIwS2qJ7tf3S60sXQ==
X-CSE-MsgGUID: EZo6SfBhRFytE/422tb0Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68119033"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68119033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 10:54:41 -0800
X-CSE-ConnectionGUID: ickHmOGOT/OVDetAzpbk6A==
X-CSE-MsgGUID: ZBbmmxqPRTuOB39I9Me4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199186715"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2025 10:54:39 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX268-0000000051v-30DW;
	Sat, 20 Dec 2025 18:54:36 +0000
Date: Sun, 21 Dec 2025 02:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
Message-ID: <202512210241.hAfeGBaQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/reset/reset-dr1v90.c:139:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251216-dr1v90-cru-v3-4-52cc938d1db0@pigmoral.tech>
References: <20251216-dr1v90-cru-v3-4-52cc938d1db0@pigmoral.tech>
TO: Junhui Liu <junhui.liu@pigmoral.tech>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Junhui Liu <junhui.liu@pigmoral.tech>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org

Hi Junhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/clk-correct-clk_div_mask-return-value-for-width-32/20251216-115101
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251216-dr1v90-cru-v3-4-52cc938d1db0%40pigmoral.tech
patch subject: [PATCH v3 4/6] reset: anlogic: add support for Anlogic DR1V90 resets
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r133-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210241.hAfeGBaQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210241.hAfeGBaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210241.hAfeGBaQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/reset/reset-dr1v90.c:139:1: sparse: sparse: bad integer constant expression
   drivers/reset/reset-dr1v90.c:139:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/reset/reset-dr1v90.c:140:1: sparse: sparse: bad integer constant expression
   drivers/reset/reset-dr1v90.c:140:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/reset/reset-dr1v90.c:141:1: sparse: sparse: bad integer constant expression
   drivers/reset/reset-dr1v90.c:141:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/reset/reset-dr1v90.c:141:1: sparse: sparse: bad integer constant expression
   drivers/reset/reset-dr1v90.c:141:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +139 drivers/reset/reset-dr1v90.c

123a6bfc523ec9 Junhui Liu 2025-12-16  138  
123a6bfc523ec9 Junhui Liu 2025-12-16 @139  MODULE_AUTHOR("Junhui Liu <junhui.liu@pigmoral.tech>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

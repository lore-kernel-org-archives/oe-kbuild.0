Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD531690E
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 23:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779318768; cv=none; b=FyBcQVHs/LFCx7JfLr7Z1JGt40+JbcqJva5w72Kj0hKVeOCWTskywnRj0UD6J4CVqhVLUoPwJ5PMAgvyLXnIvRrWVAGcRt7s3I1ZYrZ/ex2WPMYj0pcslGgsBvzYkcc3vwNtfmAZyhZ/9FydGbGvPvJVp17x5+BLB2uYUKltWTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779318768; c=relaxed/simple;
	bh=5cP2vVmOkpLWPUaehIQdrdXzFgqzkurrZ0T8znl3ziU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ldt5VQcJ29EvFCalg/uaPucJO6XOnTnj4CSdwuNodoG6FezmaFRTkzIQwlqGaw96qYvuwtO70plOMi+qS1Hc+9pd0liM2eXx5nzll1ASao9wnkabqxwUI48qeobloxu7C/2+szgihjMsaZf8l6yGYDrQsEebU/913b5HDJVGlhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9DGr5YR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9DGr5YR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779318766; x=1810854766;
  h=date:from:to:cc:subject:message-id;
  bh=5cP2vVmOkpLWPUaehIQdrdXzFgqzkurrZ0T8znl3ziU=;
  b=M9DGr5YRVeQ/x/sutOdP8bGA/UUhJ6URzO9PD56r7qoVLxbrcgnPSQSZ
   1DAzXQoMMeWaUXr3d3jeJf+hINgs6NuzP4RawtZ9RrAK9Z1NoY8sKm+av
   BOQZeHYUsVGiQ0FvT33YMt/5iISg2E1XkY44a6LocKdTnh6i9+BsiqHql
   WjhZYleOwOHZHbbfRTJ+dpU3CypnREDJPU4ifETQfOYX4PRSToNedrVNN
   +h0EPqfonVYvxcqlJTl/wTYOFlnskNx29geb0pgsmx+gQska1AD2mEiGd
   0zlTwc1ZjZ1RV3bdijeBZPUxL1V+rutm/Hymox/VpCJ4uGMcAiYZJ3HPM
   w==;
X-CSE-ConnectionGUID: qwft4NdSQX6e8QaYMSL2cA==
X-CSE-MsgGUID: QROw5cuaSNiH5wEVefkfOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91340951"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91340951"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:12:45 -0700
X-CSE-ConnectionGUID: YANTZHC2RQqFGblQnmH6NA==
X-CSE-MsgGUID: kg+48SDoScO2UgqOG3x1wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="239500747"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2026 16:12:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPq5i-00000000Afb-2k4Y;
	Wed, 20 May 2026 23:12:42 +0000
Date: Thu, 21 May 2026 01:12:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb:
 /soc/phy@c0a20000: failed to match any schema with compatible:
 ['spacemit,k3-usb2-phy']
Message-ID: <202605210124.N21SRtsT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yixun Lan <dlan@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/dt-bindings-riscv-spacemit-Add-K3-CoM260-IFX-board/20260520-134202
head:   370bb09099fa28f6961a38d7b3e4ae45b62734bc
commit: 370bb09099fa28f6961a38d7b3e4ae45b62734bc riscv: dts: spacemit: k3: Initial support for CoM260-IFX board
date:   17 hours ago
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-2051 (https://download.01.org/0day-ci/archive/20260521/202605210124.N21SRtsT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210124.N21SRtsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605210124.N21SRtsT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k3-com260-ifx.dtb: /soc/phy@c0a20000: failed to match any schema with compatible: ['spacemit,k3-usb2-phy']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

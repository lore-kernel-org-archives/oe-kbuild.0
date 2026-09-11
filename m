Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A3E3E1D17
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 02:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093970; cv=none; b=RjT85tP8IZ7GtM8h9m1bOvVqldpXmqEX96IEBs8OBysuvv+b89kTOjzE4+73Ege48/op3kTOibemQMKtT1CH50CRCjHEIkEkc9+6u/77O6IqXkIeD1UIPeomu8EP8gbU/4c8cSU0XuNq+wopAlHcCJ1n/jIlEXBvuLuLwrdL5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093970; c=relaxed/simple;
	bh=I+MsIsVi3MF12lbvaBMwKWN0r0CvGx/4lxOFGffnt0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DGPljQT44nQ8wMsQ0tHE/CgtbJVc8jmfuEOtCVpHonp2oyiW2LS6WNdnzQ62SZBSeOFPF6an9u8ze3IP/EKjipQqvza41SMaJZLN4eN9qkkE2qeomhif4CMFkw0tY6G9oJl4K9wP3OVWBLcJ17+BcVbHrARZjSk/FXqCylLZN2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ty7BUyG3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ty7BUyG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789093969; x=1820629969;
  h=date:from:to:cc:subject:message-id;
  bh=I+MsIsVi3MF12lbvaBMwKWN0r0CvGx/4lxOFGffnt0A=;
  b=Ty7BUyG32N2TItiEYR3ga/8SoKE3Be38BIpdao1mPigPqAE7csgbUYcb
   V1I88LwkAn6ncb2Cwa8TgduFXyjswW9sI/RJTUDNTFGIJN64KMse7nu7B
   foCuZLQ1/95uYco07RyBav4eNVadcLukss1PORRB9QJYV+ekuWfkURDag
   W8DgDto9tq7CpfPaWZpwovgFZzKMqs0D9K8FaZ7NJ6XtersOshlzkgVMk
   dFGKK7SUAaco/IcmRkATqGhblSDROv/O5aa/FU/GSeEdzx3pkWL8uE9sU
   5GYo9icWcwLz7qgfUG4G3J+nkkCrK6I/jMEmDB7J7Yip8lolW751atGl+
   A==;
X-CSE-ConnectionGUID: rLir8IjYRgyvVk1qtDpEfw==
X-CSE-MsgGUID: kXjUk8+UQT6HgjUXJA9LWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93245955"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="93245955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 19:32:48 -0700
X-CSE-ConnectionGUID: pjRXBUldRrupNjXTixODwQ==
X-CSE-MsgGUID: KLYMK7WBSuamVtsvDBfgPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="270428204"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2026 19:32:48 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4r45-000000000s6-1b3s;
	Fri, 11 Sep 2026 02:32:36 +0000
Date: Fri, 11 Sep 2026 10:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/power/supply/bq257xx_charger.c:90 struct
 member 'dev' not described in 'bq257xx_chg'
Message-ID: <202609111028.jzNat5zk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Alexey-Charkov/power-supply-core-prevent-unregistering-a-power-supply-while-a-callback-runs/20260910-183258, commit: 3bdad7c7c9d9aa65ec1a1958d3ef5502f7d15e82"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Alexey Charkov <alchark@flipper.net>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/power-supply-core-prevent-unregistering-a-power-supply-while-a-callback-runs/20260910-183258
head:   3bdad7c7c9d9aa65ec1a1958d3ef5502f7d15e82
commit: 3bdad7c7c9d9aa65ec1a1958d3ef5502f7d15e82 power: supply: bq257xx: Convert parameters setup to the new .init callback
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: powerpc64-randconfig-002-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111028.jzNat5zk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111028.jzNat5zk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111028.jzNat5zk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/power/supply/bq257xx_charger.c:90 struct member 'dev' not described in 'bq257xx_chg'
>> Warning: drivers/power/supply/bq257xx_charger.c:90 struct member 'dev' not described in 'bq257xx_chg'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DE229B8EF
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818026; cv=none; b=usKN2FtVQmFbfJ0WnJ5Ji3MFdJvKqSZI+naqekx+J+pf8DPIfaj1Wdeyita3m5I8+nQe5IlD6iOfYK6eCks8AfSfHSpq+3LkyAS3GeqQ35SLsK0TnXuyCWO62RqrGhRgA/RK5YuhtjS4lRkz+xTsvBAb6o4GYxJrk2xJ2lWQqog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818026; c=relaxed/simple;
	bh=6/ABDuii+zKhm/XFjSSieqewZ1Ls+nWFYVrFdmrXzh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eU83xEEJz8Cp52JQgdLORwftHBs+odQKGGVGfyWaSTsW4tDUIyI6nw3jZBLhvWROe6wSQ2J5ThRXv3gSy2xAnJfdbsCD3i/5s+rWlBHW9WN9Art1oOjVqmW8pIjsa1g9kpRt3VFLthA8VrTFNcIKvyMKDi52ArBfprfgjkCfoKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIfM90n8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIfM90n8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768818024; x=1800354024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6/ABDuii+zKhm/XFjSSieqewZ1Ls+nWFYVrFdmrXzh4=;
  b=ZIfM90n8g0PJd0pvN4ZGfqQNl/Trz3qUp7oIOrNaK72uE7v4cNUZG7Po
   YXJcdhCnZ1t/ua/49XusH/VMHP3cMRtokRMThkWHNyGPpPkElhbc7HiVR
   l5p3brZatDoLpjbR7RQCCH6kZDHQss/j1lrFuYhpDSbiIl/g7qxufRHZM
   IdzZNs9i+ibJMbOzevAtghrljUUz2YhK0VvBYlPjOTp0GysZiODNB99E9
   D3TtXNXElx6OAKzo2WCieZLsKgEipQNSj2sI6d67YFFqOfpJ/K0s8Cdv9
   TKj+QI79MKZGoxOgZ7Z1f6B/Q1f2J3o/nwIsGKbxKYRPWw7sl/buoHuqf
   g==;
X-CSE-ConnectionGUID: 7k1uzkb0TTSBHLh/v4T+bw==
X-CSE-MsgGUID: WGxrzY2gTymBjwIud6u4og==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81399102"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="81399102"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 02:20:24 -0800
X-CSE-ConnectionGUID: 7mVGteZ0SWWYoRi/CoF5tA==
X-CSE-MsgGUID: P22l/hGoRo+isAvRZErkAA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2026 02:20:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhmMu-00000000NgH-2EMM;
	Mon, 19 Jan 2026 10:20:20 +0000
Date: Mon, 19 Jan 2026 18:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] thermal: spacemit: k1: Add thermal sensor support
Message-ID: <202601191753.7KTCj6A8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thermal/spacemit/k1_tsensor.c:279:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
References: <20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4@163.com>
TO: Shuwei Wu <shuweiwoo@163.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Yixun Lan <dlan@gentoo.org>
TO: Shuwei Wu <shuweiwoo@163.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: linux-kernel@vger.kernel.org

Hi Shuwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuwei-Wu/dt-bindings-thermal-Add-SpacemiT-K1-thermal-sensor/20260119-104429
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260119-patchv2-k1-thermal-v3-2-3d82c9ebe8a4%40163.com
patch subject: [PATCH v3 2/3] thermal: spacemit: k1: Add thermal sensor support
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: alpha-randconfig-r133-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191753.7KTCj6A8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191753.7KTCj6A8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601191753.7KTCj6A8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/thermal/spacemit/k1_tsensor.c:279:1: sparse: sparse: bad integer constant expression
   drivers/thermal/spacemit/k1_tsensor.c:279:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/thermal/spacemit/k1_tsensor.c:280:1: sparse: sparse: bad integer constant expression
   drivers/thermal/spacemit/k1_tsensor.c:280:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/thermal/spacemit/k1_tsensor.c:281:1: sparse: sparse: bad integer constant expression
   drivers/thermal/spacemit/k1_tsensor.c:281:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/thermal/spacemit/k1_tsensor.c:281:1: sparse: sparse: bad integer constant expression
   drivers/thermal/spacemit/k1_tsensor.c:281:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +279 drivers/thermal/spacemit/k1_tsensor.c

1cfda9c6e9a3a6 Shuwei Wu 2026-01-19  278  
1cfda9c6e9a3a6 Shuwei Wu 2026-01-19 @279  MODULE_DESCRIPTION("SpacemiT K1 Thermal Sensor Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

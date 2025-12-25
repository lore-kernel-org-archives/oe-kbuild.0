Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5294C7260A
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 15:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766677427; cv=none; b=VufI6Taqdsp21BGlu47E6ri88fRrnxrkkBwjEFzWtBBlSkJofDcCIZbZ2fhynmFG4Ms7rrZqFzMaJzME5OXAJ4S56do5I2ie9UobEMrOxAYK6sdihdu6jZBlBbdsU81LfZuUCmZVaBr7RnC7KvEjU/7hfWi4K55yh+C0umUnbSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766677427; c=relaxed/simple;
	bh=mWLSBqrlKwJpnjM37ukqT2vzrPJdHWkliEJoCpFSMQU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nmwZ9znbpZ9t0uZksRIx7v7VccLD2H2dSr1+J5C2yUv8aTJv8cTI+WJZKLyIKXB30oquaXzWOINoHSiqnWcgkpvJ/D5Gqdz/Zj8AEDVRyuzBFnDI52QlDpvy189Unm9W3uQBC6uOW8pdh5YcaLEVwQYkxiWawHD+f+HSU/bitzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjrK+uJu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjrK+uJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766677425; x=1798213425;
  h=date:from:to:cc:subject:message-id;
  bh=mWLSBqrlKwJpnjM37ukqT2vzrPJdHWkliEJoCpFSMQU=;
  b=AjrK+uJuwiVSBrEpO/H3Xd4COANvt5K3ulSPXujEBSzjpJ21IGyY5zDT
   YSwBy0/hXfzts96hy547EBXBCt+jX0AsXsUsDSmy3j3whiMuT+ShtEeAq
   XmHDHKjj8kKpeg1zSx7pLtspCBfweOV5zEIFYFGjkIKHx6Q0yrQLJ/iuN
   g+b4WKStx8pOkog6Jm09+Sk7QPKhV05l5HuOc6ipb4fgmT9m7iHSZfG9Q
   FEStoLnsYMyrJJPXKWj1hbJGufHhld0lBNYx7zmFkybYxd9GR0ZpcogNE
   b7LtiQzJZdBw/ov8I550O7TE03zHQYMJ3swlGb5NdF+PBS4+dlhW2ro/U
   Q==;
X-CSE-ConnectionGUID: XeWrJKApRcqEF/v2wgsY7Q==
X-CSE-MsgGUID: 4WtFy/dpRKmBYCyka3vfag==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79925519"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="79925519"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 07:43:45 -0800
X-CSE-ConnectionGUID: TIvNBk9+Qz+beLIkW1InPg==
X-CSE-MsgGUID: HKp0P9oXRIyrxdoItwOojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="204736667"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2025 07:43:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYnV7-000000004Cp-36OG;
	Thu, 25 Dec 2025 15:43:41 +0000
Date: Thu, 25 Dec 2025 23:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [avpatel:riscv_sbi_dbtr_v2 45/55]
 drivers/hwtracing/rvtrace/rvtrace-encoder.c:105:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202512252347.g73JABQ9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwtracing/rvtrace/rvtrace-encoder.c:105:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mayuresh Chitale <mchitale@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   99cb6c466559dba2b0011d84701a156c252e7c59
commit: 56fc8d19589bf440fd6d3237afe2d548f8dc5d86 [45/55] rvtrace: Add trace encoder driver
:::::: branch date: 27 hours ago
:::::: commit date: 33 hours ago
config: riscv-randconfig-r122-20251225 (https://download.01.org/0day-ci/archive/20251225/202512252347.g73JABQ9-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252347.g73JABQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512252347.g73JABQ9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwtracing/rvtrace/rvtrace-encoder.c:105:1: sparse: sparse: bad integer constant expression
   drivers/hwtracing/rvtrace/rvtrace-encoder.c:105:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwtracing/rvtrace/rvtrace-encoder.c:106:1: sparse: sparse: bad integer constant expression
   drivers/hwtracing/rvtrace/rvtrace-encoder.c:106:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hwtracing/rvtrace/rvtrace-encoder.c:107:1: sparse: sparse: bad integer constant expression
   drivers/hwtracing/rvtrace/rvtrace-encoder.c:107:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hwtracing/rvtrace/rvtrace-encoder.c:107:1: sparse: sparse: bad integer constant expression
   drivers/hwtracing/rvtrace/rvtrace-encoder.c:107:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +105 drivers/hwtracing/rvtrace/rvtrace-encoder.c

56fc8d19589bf44 Mayuresh Chitale 2025-07-24  103  
56fc8d19589bf44 Mayuresh Chitale 2025-07-24  104  /* Module information */
56fc8d19589bf44 Mayuresh Chitale 2025-07-24 @105  MODULE_AUTHOR("Mayuresh Chitale <mchitale@ventanamicro.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

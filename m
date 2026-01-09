Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF093299959
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767985120; cv=none; b=VY5+tRVoGTQR1N/joCppRg73JJwmwF56enAq54g6fDOyWqz7pOz9yRIBKjDt0uEu7TaTrE5tNuyKyAqHZj0brAA8JdFf4KVkNTufLRt9JbYwE29lAMpJo0V20FoZViI+BhTMusKhCc1Pj7LZ2Ar9M8g6ibg2zak0DOEGyGSB6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767985120; c=relaxed/simple;
	bh=uXylytl5EHpcgmOsyPM0CtyH87rBWvzROtteGz4WDXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r8XKoaP39F2sdIpEIz4T9hqNrtgKW8A9pPj0xgGNeER+NmzrVHQjLCmCieEDz4M2ejmpBMU5nNw7/1Jm+1hDfEQOSwCmMva35gVjhqqmGgNueYYMi8mmxqHtp55fBIHZ2mxgtcharorJ9VmdIi/3T8qZ6SogRkK4fuDBThZ4ACs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPFl5LNV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPFl5LNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767985119; x=1799521119;
  h=date:from:to:cc:subject:message-id;
  bh=uXylytl5EHpcgmOsyPM0CtyH87rBWvzROtteGz4WDXI=;
  b=PPFl5LNV+GsYOc3TioMcVQFD7Ma0J3zS9reYiiWYiUkk/KprB4LlQ0fm
   HKXUxOaiGQwfc2z69Wt5JSf9pxDgf/UKP4KE22+ATTe9Gh7WyCvcZf0wc
   WIwL7nZdOLOwHagwKoTf9zhy8KSVKbAdIc8uj2tDWpmkN0nUjeYApUz6s
   2tA010ydL0zJxdVKsG/2TpdJfKLVr0jQoJ4i8O1uAa1wCompNR8K2WVFr
   56ygRchstM2CucuQyje1445Fs/6CU5xchxeBFKOXT2XiEKQkcUPirVFKC
   YM1LC0np9RJ9ZvWlvcrwj3ZQAJYSszJCyqoIa4s+xViL8Ziuczrjlp0C5
   A==;
X-CSE-ConnectionGUID: O7hRWDo1SleXCV1i4x2P7Q==
X-CSE-MsgGUID: xAQ/wZszQVuJOGQYrOwyww==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80088361"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="80088361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 10:58:38 -0800
X-CSE-ConnectionGUID: FjdcZqOCTDy1nu4AHrV79A==
X-CSE-MsgGUID: hm+2Or45TJuEChuR6S1cAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="226896073"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2026 10:58:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veHgx-000000007dq-0Ec4;
	Fri, 09 Jan 2026 18:58:35 +0000
Date: Sat, 10 Jan 2026 02:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2388/5095]
 drivers/i2c/busses/i2c-designware-slave.c:282:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601100253.UsYZSZie-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/i2c/busses/i2c-designware-slave.c:282:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: 9f65f8fa18bbfb7d8756f1bfd6d1cbaffe2661df [2388/5095] i2c: designware: Remove useless driver specific option for I2C target
:::::: branch date: 15 hours ago
:::::: commit date: 13 days ago
config: arc-randconfig-r113-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100253.UsYZSZie-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100253.UsYZSZie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601100253.UsYZSZie-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-designware-slave.c:282:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-designware-slave.c:282:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-designware-slave.c:283:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-designware-slave.c:283:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-designware-slave.c:284:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-designware-slave.c:284:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-designware-slave.c:284:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-designware-slave.c:284:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/i2c/busses/i2c-designware-slave.c:285:1: sparse: sparse: bad integer constant expression
   drivers/i2c/busses/i2c-designware-slave.c:285:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"

vim +282 drivers/i2c/busses/i2c-designware-slave.c

9f3e065c54b05b Luis Oliveira 2017-06-22  281  
9f3e065c54b05b Luis Oliveira 2017-06-22 @282  MODULE_AUTHOR("Luis Oliveira <lolivei@synopsys.com>");

:::::: The code at line 282 was first introduced by commit
:::::: 9f3e065c54b05b03bd39dbbcc5a44f2f1807994d i2c: designware: add SLAVE mode functions

:::::: TO: Luis Oliveira <Luis.Oliveira@synopsys.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

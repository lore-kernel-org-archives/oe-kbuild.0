Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FC0145FE0
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 02:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777860232; cv=none; b=Ku8cRcYoGMhq+snWwfj7U9oFngxVjiAZXFrvggqzZKzffm9RHIAyWNUVRSardQZQWdXVkXkK7OyUpElRsetQsAJ/W/UcAvi4uSlCywNdiduer9Aa87bDEIDTGPCcTIpPB8RBl6TAANKidgJPQpWWArdKrK5wD2ay9TV/wNS0jL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777860232; c=relaxed/simple;
	bh=9mB2G68fJ6A7Cl/tDiDuvV1hrSyNKQgdacDfnx8GuEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G4LgRDqhkor4Q0F36MJGPBatGDoZZQuh5IIvrUtQCKM0am2JLsbzRYqPfwZMAWPvGTucIKZfMBfJQEb8MdPv4FbKHkyfeA3kJQzfx0qQfk5O/D62ZurkvN0RSsBtoP+ldh0FlGwpFKX8HTnt5aoqXocU9k/mLxymh8FlTA3SdoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLnse126; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLnse126"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777860231; x=1809396231;
  h=date:from:to:cc:subject:message-id;
  bh=9mB2G68fJ6A7Cl/tDiDuvV1hrSyNKQgdacDfnx8GuEc=;
  b=TLnse126KBd1gEHmYnLrAuBqKdaWITb5U1OCIsNy4k+4D6obRbcZjF0t
   BCdGio8oKY3JWT0V5ke887kLY5JKkUNI9uIDV9lYtW4roLG0hPooIGKdj
   Zq8zLXmWuVxqZKrokIVJIXeEu9N4fuCGp9ofr8FWB0ap0CWltGy8ivdVp
   5KBtAAeS2l+i+szWCG+StP2HP5ZXRfL9fO4+D2B5w+xr4IN+IELQKCDv6
   PnpWvFtmV1BWJYtx7yT4l9n8KwGY3tJgj28i2kOq0wsaQazShJJ4wiyAz
   xtMG7AkPLKPH4y/ADckl51mu4rhgCB7/ljoAhJnjcxbTlkcr/IhK4JZcs
   A==;
X-CSE-ConnectionGUID: rtZWYd28SBC/dazXxRD5CQ==
X-CSE-MsgGUID: bJ1gJAfVRua9fW2mY8Aszw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78819414"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="78819414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 19:03:51 -0700
X-CSE-ConnectionGUID: zeaQf/y2QbeRGd3wHmVR4w==
X-CSE-MsgGUID: 0sKq/LttQ8qlrrTqvIuLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="258745659"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2026 19:03:49 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJieo-000000003Ml-0BYo;
	Mon, 04 May 2026 02:03:40 +0000
Date: Mon, 04 May 2026 10:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/arm-smccc.h:397 smccc_uuid_to_reg() error:
 buffer overflow 'uuid->b' 16 <= s32max
Message-ID: <202605040917.XJ9d39v6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Roman Kisel <romank@linux.microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>

Hi Roman,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: 13423063c7cb7d1c34104a78cae85eb0281bae90 arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-r072-20260504 (https://download.01.org/0day-ci/archive/20260504/202605040917.XJ9d39v6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 13423063c7cb ("arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605040917.XJ9d39v6-lkp@intel.com/

smatch warnings:
include/linux/arm-smccc.h:397 smccc_uuid_to_reg() error: buffer overflow 'uuid->b' 16 <= s32max

vim +397 include/linux/arm-smccc.h

13423063c7cb7d1 Roman Kisel 2025-04-28  392  
13423063c7cb7d1 Roman Kisel 2025-04-28  393  static inline u32 smccc_uuid_to_reg(const uuid_t *uuid, int reg)
13423063c7cb7d1 Roman Kisel 2025-04-28  394  {
13423063c7cb7d1 Roman Kisel 2025-04-28  395  	u32 val = 0;
13423063c7cb7d1 Roman Kisel 2025-04-28  396  
13423063c7cb7d1 Roman Kisel 2025-04-28 @397  	val |= (u32)(uuid->b[4 * reg + 0] << 0);
13423063c7cb7d1 Roman Kisel 2025-04-28  398  	val |= (u32)(uuid->b[4 * reg + 1] << 8);
13423063c7cb7d1 Roman Kisel 2025-04-28  399  	val |= (u32)(uuid->b[4 * reg + 2] << 16);
13423063c7cb7d1 Roman Kisel 2025-04-28  400  	val |= (u32)(uuid->b[4 * reg + 3] << 24);
13423063c7cb7d1 Roman Kisel 2025-04-28  401  
13423063c7cb7d1 Roman Kisel 2025-04-28  402  	return val;
13423063c7cb7d1 Roman Kisel 2025-04-28  403  }
13423063c7cb7d1 Roman Kisel 2025-04-28  404  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF63A8FE1
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 03:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109850; cv=none; b=WOtcCDiC7oBFP5w+1dfAj2NJXHplfoUajgwth7Pm3SK1DyQsRZ/5g5fEJ1b5xkqak9M7noIU6ehMl9wtI0arJgAr6zdwzmqM4jwK3DWUpFWjQRIk5L3XjYU8q88PPfmvWEckV9dD31L8sH8NK+sRcRtfBBxROyGFkSA5VbRUeSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109850; c=relaxed/simple;
	bh=+Xr97qLhYRrc207dU5k/Jnn02lnAfxGsdAeK2xDFIeI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LB4cEZUIuJbNz4lfp8h9aOg7MnY7sgiu0oofXDlBcbUEQ0WSQ+eytPw1G5w9h56uFMRSrqCEvnwgmAgaZOhdq5uwSprGYz6/HyoZyrmne9FUP4OSAGjH/5nWlZxA/LoM4WymMKARzokEkTtCnxB9F6M4Ti4cpdyDoRBbRy0QVvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/zRcfcQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/zRcfcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787109848; x=1818645848;
  h=date:from:to:cc:subject:message-id;
  bh=+Xr97qLhYRrc207dU5k/Jnn02lnAfxGsdAeK2xDFIeI=;
  b=Z/zRcfcQ7I7Hs1HXuO6y/s/7UHyhBkMR22Vk0OxJYLQCpYt5biFv3aLM
   S0W0gJFuNA9lF9UrEu1Xt1TLwRAecnXZS8NTbRceN07yMRePCSi24uLLD
   F5vuYdrnfjyLdvdmNRO3SY6SinwMr1p35qFDmfd4OZNexyu3d9aKz4D5c
   Zr+UM2wyePlCZiZiD3n5kWo2oNrx0OCM/xSPdT73T7aHnwgLsEofncKB6
   9f1kAEE0vVXeMk0XHj9lMpg2mGgfGTeKOgO73QQaWFWeE9tOAkdzBvWx7
   l4nWMxQ7hxpOoZz4JizEntofYwpV6MZHC2ovoFR0VvvbshJZC2e7M14LL
   A==;
X-CSE-ConnectionGUID: I6TseCyVTBGLQuGsWkZljw==
X-CSE-MsgGUID: IJgQFKtpTGmpdyMQJU86iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90130505"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="90130505"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 20:24:07 -0700
X-CSE-ConnectionGUID: rueIszA5S4WLrzMF/l8B5g==
X-CSE-MsgGUID: yWcSHlwhTNSo5dOG24zdfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269254089"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 20:24:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwWuJ-00000000erI-1hTK;
	Wed, 19 Aug 2026 03:24:03 +0000
Date: Wed, 19 Aug 2026 11:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/tests/string_kunit.c:866:9: sparse: sparse: not a
 function __func
Message-ID: <202608191140.rpGzDo2a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/string_kunit.c:866:9: sparse: sparse: not a function __func"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Feng Jiang <jiangfeng@kylinos.cn>
CC: Paul Walmsley <pjw@kernel.org>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a0dd7ba4f44cdc116d83712f61e7c1a95be3588
commit: 0020240a431187628e2636284023e63b9b7a2aa1 lib/string_kunit: add performance benchmark for strlen()
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-r132-20260818 (https://download.01.org/0day-ci/archive/20260819/202608191140.rpGzDo2a-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191140.rpGzDo2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0020240a4311 ("lib/string_kunit: add performance benchmark for strlen()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608191140.rpGzDo2a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/tests/string_kunit.c:866:9: sparse: sparse: undefined identifier 'strlen'
   lib/tests/string_kunit.c:866:9: sparse: sparse: undefined identifier 'strlen'
>> lib/tests/string_kunit.c:866:9: sparse: sparse: not a function __func
>> lib/tests/string_kunit.c:866:9: sparse: sparse: not a function __func

vim +866 lib/tests/string_kunit.c

0020240a431187 Feng Jiang 2026-04-03  863  
0020240a431187 Feng Jiang 2026-04-03  864  static void string_bench_strlen(struct kunit *test)
0020240a431187 Feng Jiang 2026-04-03  865  {
0020240a431187 Feng Jiang 2026-04-03 @866  	STRING_BENCH_BUF(test, buf, len, strlen, buf);
0020240a431187 Feng Jiang 2026-04-03  867  }
0020240a431187 Feng Jiang 2026-04-03  868  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

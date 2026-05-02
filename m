Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D5A21ADA4
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715623; cv=none; b=Dnq7w+DmupZml1JE0NTjUivd5+YCgbcGu+DTrs/8Vg9P9edBiDqEGNPBFNXCF/Xk3Bqw0pberW+Ajntox14reklusF1+BIPKZCkFV9x1V/EpoDNujfKLITgh0GE2Lopg/1b8oKoUFmM+frGIRBoUFpBUTHvyZcyr/6FJHwmD6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715623; c=relaxed/simple;
	bh=jGjqjs+jLnaY2E5C5b/uskyOhxfWkfBqbdLrK6cx1lA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L2QRGzQKKTqfOR+hNABHYHu4eLN4rCypOFABU1ATrI6RlHp8PfsfueOD01ysae3me3Y1+05qvPjMseN2Fb6QnFZKFWRMRM9zzZKX483Yw5bqzhnCX0WZdm4TQSodWsPxxLVICRX3/XcRyJ66EarvV/F03TOB2Tnjz2GHdipDwA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4bNYV1K; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4bNYV1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777715620; x=1809251620;
  h=date:from:to:cc:subject:message-id;
  bh=jGjqjs+jLnaY2E5C5b/uskyOhxfWkfBqbdLrK6cx1lA=;
  b=R4bNYV1KYNhiOF6m1iParxf4Pe4Zl/3AviEmavToKeuDtvVJQUo8YbjE
   UQajzhr1Fd8EE6250YQ+bz2gej5eNoBbGi7cKEuFbbl2tPZVJM5xmAyDS
   R6lQRNJ5O2vGGLfNqeopFOPrKW2KafeNb0zARVw+OyKOa1w7qyY1bT20s
   DgpnEAEQfemZLiwAKRtcNYVU4bqiHsljmN9Bkui3LHf4WSangYeWXH92x
   zt7yjQ8xUzUZ9UNHXmtBhUrZT8ztyiKRmSA4ZHX7rg/uR+nHssKU4+p1U
   CZUXwuh/2d/KQy1bY/JqTwnuE76uTGqTd6NkMvhzjsQmDmD54HQfTYb6Y
   A==;
X-CSE-ConnectionGUID: 8IaNIKuGS8CFp1O7z+O0GA==
X-CSE-MsgGUID: SIQf8uKfQ6anKMHTHhHSBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="104109831"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="104109831"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 02:53:40 -0700
X-CSE-ConnectionGUID: mSefZgf+SGKwP/I0g331rw==
X-CSE-MsgGUID: 95wYemxDSMOjJp2jzBNImg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="258424720"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2026 02:53:39 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ72X-000000001Ij-0t3B;
	Sat, 02 May 2026 09:53:37 +0000
Date: Sat, 02 May 2026 17:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/tests/string_kunit.c:866:9: sparse: sparse: not a
 function __func
Message-ID: <202605021749.Cs0UY9Qa-lkp@intel.com>
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
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: 0020240a431187628e2636284023e63b9b7a2aa1 lib/string_kunit: add performance benchmark for strlen()
date:   4 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-r132-20260502 (https://download.01.org/0day-ci/archive/20260502/202605021749.Cs0UY9Qa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021749.Cs0UY9Qa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0020240a4311 ("lib/string_kunit: add performance benchmark for strlen()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605021749.Cs0UY9Qa-lkp@intel.com/

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

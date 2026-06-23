Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10AD1C5F27
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258904; cv=none; b=TxFAlf7BA0XQDVCtmKdIfDSexBjZY+VVMrONw1rnNGgxjphuQSc4e2Y6jPJT5NfcnHbvHuqDQjcE3TEHvuR32uOa0PQc5GpxjerdkqzncNgHoBOjo7fbAr4uxw9VAmkGBAbFfk1/ht5V/fJlB8UqPpWFTzeg8GFMaJeskkzQu4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258904; c=relaxed/simple;
	bh=v2KEA/qggQM9uFwQqH4Sqzuzgnqn0DWxEuMotYt3Ce0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kHDBNEfyr5RCzLmivIgahV+fJ+G6maXciZEjYmwWZtAdOuMtvaZJNoJpD3t7L2xp1TcFxGpxIUaWBj0vEeooA5jWmQCf++b4FtAO7u8b3IY+uCiCdDv9pS5nh4SlZuxL3lsDECbIfUqjJsiQaEnhrW1FfROwuSEvCpvqRs4DnpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJhL+ZMI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJhL+ZMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782258903; x=1813794903;
  h=date:from:to:cc:subject:message-id;
  bh=v2KEA/qggQM9uFwQqH4Sqzuzgnqn0DWxEuMotYt3Ce0=;
  b=LJhL+ZMI1N+WeAR416d1GxOPgNbgDKIoaxlw/fRTqrk9CWZtTEBJwwez
   MK0jdtzrbewIil0FNVuM0ZJ8a/llbxUJ4620G89A2MqoifQPYezP41sCK
   pkS4bFQcSCvlwkhttAkJ7RLxXKO7zGeF1bo2rfkuIF91ec4wAIY1ZS8WL
   UdVZPtj5+2C5Pr9mSMl+Hr7GncUyi2YUleQFQPoviQOzzTXiNKuaDff+W
   Ku/+NCGaNAEEm9nv1TcLhPQFjxL2l5PofOAHSu1+MIKV6Oobi8pCJJnkm
   aVFjTk2kJ+9UCkGfvhtgsU/TkJF3mSEiTdn7rauyVV9FjVBR0nMTENWrF
   g==;
X-CSE-ConnectionGUID: vJ9RDqNvR3O8rcUbrMvZrw==
X-CSE-MsgGUID: LR6y8TVAQNi+kMHwP+nabA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82896410"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82896410"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:55:03 -0700
X-CSE-ConnectionGUID: Mh/HEqSrSVGFj61A1pOOCw==
X-CSE-MsgGUID: xmy/rj4CQWKCEJ/SZBwLKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="248491548"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2026 16:55:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcAxH-000000002yj-1Q7a;
	Tue, 23 Jun 2026 23:54:59 +0000
Date: Wed, 24 Jun 2026 07:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/tests/string_kunit.c:866:9: sparse: sparse: not a
 function __func
Message-ID: <202606240752.RIfKz4Go-lkp@intel.com>
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
head:   558ef39aeb9a089a6be9dda8413b0b9d42e843ea
commit: 0020240a431187628e2636284023e63b9b7a2aa1 lib/string_kunit: add performance benchmark for strlen()
date:   3 months ago
:::::: branch date: 57 minutes ago
:::::: commit date: 3 months ago
config: s390-randconfig-r123-20260623 (https://download.01.org/0day-ci/archive/20260624/202606240752.RIfKz4Go-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240752.RIfKz4Go-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0020240a4311 ("lib/string_kunit: add performance benchmark for strlen()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606240752.RIfKz4Go-lkp@intel.com/

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

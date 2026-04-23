Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CAB2FD7BC
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Apr 2026 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946278; cv=none; b=LxYWCXhID8DT7QzUx0wjAblu9qYPoaZ/tZNXqVM6058DpmTtB0PLtd3u5DAftgrttW0/Ru6vTSW+vSG4gSmzuefjx7fTAvonMx5tGNHuZZLP2nFLACYvX4FkqZvQx2HVcZI+aoYDtvv0StpMi/eR8z6fShWlmFZFUhafsXKlFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946278; c=relaxed/simple;
	bh=ZUYDpW3ivJdmyFK4RD9njE3bY069r2i38RP7amvnJLQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rlHwGJ2Gr07kGJGyCTd19l37IEBCINxhR0TMQDB1pdygiXWt6kvo/kDYyF7pmae/4xhF8hrAsASE9VUM6moPuSZy1oyo4WFkLiKoucSGnlm8pvT40+9+sQ56KawE2STlEl5LLe01DZmSZZ2TSADq/LyIYkAhWzCcujOQ3z7sSC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwbeex6N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwbeex6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776946276; x=1808482276;
  h=date:from:to:cc:subject:message-id;
  bh=ZUYDpW3ivJdmyFK4RD9njE3bY069r2i38RP7amvnJLQ=;
  b=lwbeex6NglevFwmh2CFUTSp+uioGBmCgc+7XQ4yU+cd2PVy8qAxtIvV5
   ll80k0J7yIwHhHwec8t729euq3coEq6yHANHYVwjM/Qko5dtHqLw13NUB
   EMYhq/OS3dIyPcFSiXjCvL42nEsWoWRkKJ299WK8Yb7Ca+y6Q57VLj4j8
   H1PI5e28Neg/PPazhmvRkeMA17TiYdhghcosRsUWPpgTgat7n40N21v5d
   fO+6XDaA6ffFR/qL79J46yrsjJ4qG4RkNGvLR7PiF9jrOK96VUQ/WuHCF
   5K2C+VtE6cVpWPiJBj8A/5YujTOawZo8MxTqlMmsT/kuRt5WGsr4V1tDr
   w==;
X-CSE-ConnectionGUID: zaI8AAORRIiE/QvhK6u2lw==
X-CSE-MsgGUID: SF34baUXQwy1cLjch8XJNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88218407"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="88218407"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 05:11:16 -0700
X-CSE-ConnectionGUID: o2Q39MU2TI6KCLgLjuvfIQ==
X-CSE-MsgGUID: oJcNZu8iSJCJUpqZ8fZqbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="229982383"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Apr 2026 05:11:15 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFstk-000000002wT-1y82;
	Thu, 23 Apr 2026 12:11:12 +0000
Date: Thu, 23 Apr 2026 20:10:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-2025-12 20/20]
 mm/kasan/kasan_test_c.c:1378 kasan_global_oob_right() error: buffer overflow
 'array' 10 <= 13
Message-ID: <202604231936.dJmosAx9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   a61750fee7131b5fb5322f83e63828f1481ebb84
commit: a2f11547052001bd448ccec81dd1e68409078fbb [20/20] kasan: rust: Add KASAN smoke test via UAF
:::::: branch date: 16 hours ago
:::::: commit date: 1 year, 7 months ago
config: x86_64-randconfig-161-20260423 (https://download.01.org/0day-ci/archive/20260423/202604231936.dJmosAx9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a2f115470520 ("kasan: rust: Add KASAN smoke test via UAF")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604231936.dJmosAx9-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:1378 kasan_global_oob_right() error: buffer overflow 'array' 10 <= 13

vim +/array +1378 mm/kasan/kasan_test_c.c

3f15801cdc2379c lib/test_kasan.c Andrey Ryabinin     2015-02-13  1362  
e5f4728767d2ec9 lib/test_kasan.c Marco Elver         2022-01-14  1363  static void kasan_global_oob_right(struct kunit *test)
3f15801cdc2379c lib/test_kasan.c Andrey Ryabinin     2015-02-13  1364  {
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1365  	/*
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1366  	 * Deliberate out-of-bounds access. To prevent CONFIG_UBSAN_LOCAL_BOUNDS
53b0fe36ab7c6eb lib/test_kasan.c Zhen Lei            2021-07-07  1367  	 * from failing here and panicking the kernel, access the array via a
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1368  	 * volatile pointer, which will prevent the compiler from being able to
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1369  	 * determine the array bounds.
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1370  	 *
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1371  	 * This access uses a volatile pointer to char (char *volatile) rather
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1372  	 * than the more conventional pointer to volatile char (volatile char *)
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1373  	 * because we want to prevent the compiler from making inferences about
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1374  	 * the pointer itself (i.e. its array bounds), not the data that it
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1375  	 * refers to.
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1376  	 */
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14  1377  	char *volatile array = global_array;
f649dc0e0d7b509 lib/test_kasan.c Peter Collingbourne 2021-05-14 @1378  	char *p = &array[ARRAY_SIZE(global_array) + 3];
3f15801cdc2379c lib/test_kasan.c Andrey Ryabinin     2015-02-13  1379  
58b999d7a22c593 lib/test_kasan.c Andrey Konovalov    2020-11-01  1380  	/* Only generic mode instruments globals. */
da17e377723f50c lib/test_kasan.c Andrey Konovalov    2021-02-24  1381  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
58b999d7a22c593 lib/test_kasan.c Andrey Konovalov    2020-11-01  1382  
73228c7ecc5e40c lib/test_kasan.c Patricia Alfonso    2020-10-13  1383  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
3f15801cdc2379c lib/test_kasan.c Andrey Ryabinin     2015-02-13  1384  }
3f15801cdc2379c lib/test_kasan.c Andrey Ryabinin     2015-02-13  1385  

:::::: The code at line 1378 was first introduced by commit
:::::: f649dc0e0d7b509c75570ee403723660f5b72ec7 kasan: fix unit tests with CONFIG_UBSAN_LOCAL_BOUNDS enabled

:::::: TO: Peter Collingbourne <pcc@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

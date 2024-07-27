Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81BF181D1F
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Jul 2024 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722095675; cv=none; b=SyEeHrzWmRkMZg/jIQXDltFNJ7+WH9PP8q0A1anbFiBXL/Exe6ZST/t3nKPRXxiGEgx5AUERiKC/k/nonnwgM3T/AdkBAvKKsGBoOs52KZlzubDSHAtr6Ng6PeiM90S/idqavYRwF3rHLuZ9Mi5+dTod7Fr+YTfrwZAWbprQ1AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722095675; c=relaxed/simple;
	bh=mKTQGWbGxAgRH6wjVSrzgfDEtKc3JYzelSmV7erbCi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWz0lRiE1pxrFylfUr3Dbbx5scphrL0WUBYJJo+UTGEBFdiJrd42etPGYdKiO3Ra9Hu9hhfAPTYqXXdn+baDuaYAOtT0jccVNqe+gxrteFiMKkux2so5Twvtj5EnfuBs0hyoDlKt0WbXECwiZQhEaAQjc/DENEnfQrkA7X4LKfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QleO3LCX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QleO3LCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722095671; x=1753631671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKTQGWbGxAgRH6wjVSrzgfDEtKc3JYzelSmV7erbCi8=;
  b=QleO3LCXch24wo/uoZDO+oVG1AEw0/lP67UvAWIbTWw/z7EyAH4Dg9IS
   Zp6WTQ40hPZX1Mgp5JL0vkEtqDEoPR5wiP2KjEEwf0MRiaUxROkY7KKkr
   OkH+BRNVQ9EIg6wH7UDvnDt49EsPXgNXjzNpg7p6YgTwa5fM/dnGxzcmX
   b43p2ZZ2AfV4M/3fmk3pTuxx8mOGmoIjyqkH6f7Kiyy4BtM5lZvTFDsht
   XqutnBRTtvz7+LKPwl9OBYdKdUSvzkeokd97LvLjoLXnKlWK0TcUakT/O
   QYnONbPdw+/l5dUbZ/C4FtS5C7gV+t6sMEJ5RahDEGJcyRmVN9xBaNtRg
   A==;
X-CSE-ConnectionGUID: N/a2iuxSThOHet3ReBBZ3Q==
X-CSE-MsgGUID: 6eO0lTGLT8aLXzItpR4Czg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="31282485"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="31282485"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 08:54:30 -0700
X-CSE-ConnectionGUID: gpKu4XYIR2CSfPX48mzTyw==
X-CSE-MsgGUID: 1IgB3/AVSPmbW6MrVK/AKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="58122792"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2024 08:54:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXjkZ-000q1n-0G;
	Sat, 27 Jul 2024 15:54:27 +0000
Date: Sat, 27 Jul 2024 23:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 36/78] test_memcontrol.c:201:6: warning:
 variable 'fd4_closed' is used uninitialized whenever 'if' condition is true
Message-ID: <202407272301.bBC2CidR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Finkel <davidf@vimeo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   b39b3892d20a337489c55806f91af581474f3943
commit: f2db5cca8182337f4ad485ebfd532b1a2d1c223a [36/78] mm, memcg: cg2 memory{.swap,}.peak write tests
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407272301.bBC2CidR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407272301.bBC2CidR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> test_memcontrol.c:201:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     201 |         if (peak_fd == -1)
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:201:2: note: remove the 'if' if its condition is always false
     201 |         if (peak_fd == -1)
         |         ^~~~~~~~~~~~~~~~~~
     202 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:191:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     191 |         if (peak < MB(50))
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:191:2: note: remove the 'if' if its condition is always false
     191 |         if (peak < MB(50))
         |         ^~~~~~~~~~~~~~~~~~
     192 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:187:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:187:2: note: remove the 'if' if its condition is always false
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:184:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (peak != 0)
         |             ^~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (peak != 0)
         |         ^~~~~~~~~~~~~~
     185 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:180:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     180 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:180:2: note: remove the 'if' if its condition is always false
     180 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     181 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:176:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     176 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:176:2: note: remove the 'if' if its condition is always false
     176 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     177 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:173:6: warning: variable 'fd4_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     173 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:283:7: note: uninitialized use occurs here
     283 |         if (!fd4_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:173:2: note: remove the 'if' if its condition is always false
     173 |         if (!memcg)
         |         ^~~~~~~~~~~
     174 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:204:2: note: variable 'fd4_closed' is declared here
     204 |         bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
         |         ^
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdbool.h:20:14: note: expanded from macro 'bool'
      20 | #define bool _Bool
         |              ^
>> test_memcontrol.c:201:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     201 |         if (peak_fd == -1)
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:201:2: note: remove the 'if' if its condition is always false
     201 |         if (peak_fd == -1)
         |         ^~~~~~~~~~~~~~~~~~
     202 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:191:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     191 |         if (peak < MB(50))
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:191:2: note: remove the 'if' if its condition is always false
     191 |         if (peak < MB(50))
         |         ^~~~~~~~~~~~~~~~~~
     192 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:187:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:187:2: note: remove the 'if' if its condition is always false
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:184:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (peak != 0)
         |             ^~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (peak != 0)
         |         ^~~~~~~~~~~~~~
     185 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:180:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     180 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:180:2: note: remove the 'if' if its condition is always false
     180 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     181 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:176:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     176 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:176:2: note: remove the 'if' if its condition is always false
     176 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     177 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:173:6: warning: variable 'fd3_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     173 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:281:7: note: uninitialized use occurs here
     281 |         if (!fd3_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:173:2: note: remove the 'if' if its condition is always false
     173 |         if (!memcg)
         |         ^~~~~~~~~~~
     174 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:204:2: note: variable 'fd3_closed' is declared here
     204 |         bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
         |         ^
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdbool.h:20:14: note: expanded from macro 'bool'
      20 | #define bool _Bool
         |              ^
>> test_memcontrol.c:191:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     191 |         if (peak < MB(50))
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:191:2: note: remove the 'if' if its condition is always false
     191 |         if (peak < MB(50))
         |         ^~~~~~~~~~~~~~~~~~
     192 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:187:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:187:2: note: remove the 'if' if its condition is always false
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:184:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (peak != 0)
         |             ^~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (peak != 0)
         |         ^~~~~~~~~~~~~~
     185 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:180:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     180 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:180:2: note: remove the 'if' if its condition is always false
     180 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     181 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:176:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     176 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:176:2: note: remove the 'if' if its condition is always false
     176 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     177 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:173:6: warning: variable 'peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     173 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:278:8: note: uninitialized use occurs here
     278 |         close(peak_fd);
         |               ^~~~~~~
   test_memcontrol.c:173:2: note: remove the 'if' if its condition is always false
     173 |         if (!memcg)
         |         ^~~~~~~~~~~
     174 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:199:2: note: variable 'peak_fd' is declared here
     199 |         int peak_fd = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
         |         ^
>> test_memcontrol.c:201:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     201 |         if (peak_fd == -1)
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:201:2: note: remove the 'if' if its condition is always false
     201 |         if (peak_fd == -1)
         |         ^~~~~~~~~~~~~~~~~~
     202 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:191:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     191 |         if (peak < MB(50))
         |             ^~~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:191:2: note: remove the 'if' if its condition is always false
     191 |         if (peak < MB(50))
         |         ^~~~~~~~~~~~~~~~~~
     192 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:187:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:187:2: note: remove the 'if' if its condition is always false
     187 |         if (cg_run(memcg, alloc_anon_50M_check, NULL))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:184:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     184 |         if (peak != 0)
         |             ^~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:184:2: note: remove the 'if' if its condition is always false
     184 |         if (peak != 0)
         |         ^~~~~~~~~~~~~~
     185 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:180:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     180 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:180:2: note: remove the 'if' if its condition is always false
     180 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     181 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:176:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     176 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:176:2: note: remove the 'if' if its condition is always false
     176 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     177 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:173:6: warning: variable 'fd2_closed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     173 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:279:7: note: uninitialized use occurs here
     279 |         if (!fd2_closed)
         |              ^~~~~~~~~~
   test_memcontrol.c:173:2: note: remove the 'if' if its condition is always false
     173 |         if (!memcg)
         |         ^~~~~~~~~~~
     174 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:204:2: note: variable 'fd2_closed' is declared here
     204 |         bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
         |         ^
   /opt/cross/clang-617a15a9ea/lib/clang/18/include/stdbool.h:20:14: note: expanded from macro 'bool'
      20 | #define bool _Bool
         |              ^
>> test_memcontrol.c:934:6: warning: variable 'swap_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     934 |         if (cg_read_long(memcg, "memory.swap.current")) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:1083:12: note: uninitialized use occurs here
    1083 |         if (close(swap_peak_fd))
         |                   ^~~~~~~~~~~~
   test_memcontrol.c:934:2: note: remove the 'if' if its condition is always false
     934 |         if (cg_read_long(memcg, "memory.swap.current")) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     935 |                 ret = KSFT_SKIP;
         |                 ~~~~~~~~~~~~~~~~
     936 |                 goto cleanup;
         |                 ~~~~~~~~~~~~~
     937 |         }
         |         ~
   test_memcontrol.c:931:6: warning: variable 'swap_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     931 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:1083:12: note: uninitialized use occurs here
    1083 |         if (close(swap_peak_fd))
         |                   ^~~~~~~~~~~~
   test_memcontrol.c:931:2: note: remove the 'if' if its condition is always false
     931 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     932 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:928:6: warning: variable 'swap_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     928 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:1083:12: note: uninitialized use occurs here
    1083 |         if (close(swap_peak_fd))
         |                   ^~~~~~~~~~~~
   test_memcontrol.c:928:2: note: remove the 'if' if its condition is always false
     928 |         if (!memcg)
         |         ^~~~~~~~~~~
     929 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:939:2: note: variable 'swap_peak_fd' is declared here
     939 |         int swap_peak_fd = cg_open(memcg, "memory.swap.peak",
         |         ^
>> test_memcontrol.c:942:6: warning: variable 'mem_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     942 |         if (swap_peak_fd == -1)
         |             ^~~~~~~~~~~~~~~~~~
   test_memcontrol.c:1081:12: note: uninitialized use occurs here
    1081 |         if (close(mem_peak_fd))
         |                   ^~~~~~~~~~~
   test_memcontrol.c:942:2: note: remove the 'if' if its condition is always false
     942 |         if (swap_peak_fd == -1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
     943 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:934:6: warning: variable 'mem_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     934 |         if (cg_read_long(memcg, "memory.swap.current")) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_memcontrol.c:1081:12: note: uninitialized use occurs here
    1081 |         if (close(mem_peak_fd))
         |                   ^~~~~~~~~~~
   test_memcontrol.c:934:2: note: remove the 'if' if its condition is always false
     934 |         if (cg_read_long(memcg, "memory.swap.current")) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     935 |                 ret = KSFT_SKIP;
         |                 ~~~~~~~~~~~~~~~~
     936 |                 goto cleanup;
         |                 ~~~~~~~~~~~~~
     937 |         }
         |         ~
   test_memcontrol.c:931:6: warning: variable 'mem_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     931 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:1081:12: note: uninitialized use occurs here
    1081 |         if (close(mem_peak_fd))
         |                   ^~~~~~~~~~~
   test_memcontrol.c:931:2: note: remove the 'if' if its condition is always false
     931 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     932 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:928:6: warning: variable 'mem_peak_fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     928 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:1081:12: note: uninitialized use occurs here
    1081 |         if (close(mem_peak_fd))
         |                   ^~~~~~~~~~~
   test_memcontrol.c:928:2: note: remove the 'if' if its condition is always false
     928 |         if (!memcg)
         |         ^~~~~~~~~~~
     929 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:945:2: note: variable 'mem_peak_fd' is declared here
     945 |         int mem_peak_fd = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
         |         ^
   34 warnings generated.


vim +201 tools/testing/selftests/cgroup/test_memcontrol.c

84092dbcf90176 Roman Gushchin 2018-05-11  160  
84092dbcf90176 Roman Gushchin 2018-05-11  161  /*
84092dbcf90176 Roman Gushchin 2018-05-11  162   * This test create a memory cgroup, allocates
84092dbcf90176 Roman Gushchin 2018-05-11  163   * some anonymous memory and some pagecache
f2db5cca818233 David Finkel   2024-07-24  164   * and checks memory.current, memory.peak, and some memory.stat values.
84092dbcf90176 Roman Gushchin 2018-05-11  165   */
f2db5cca818233 David Finkel   2024-07-24  166  static int test_memcg_current_peak(const char *root)
84092dbcf90176 Roman Gushchin 2018-05-11  167  {
84092dbcf90176 Roman Gushchin 2018-05-11  168  	int ret = KSFT_FAIL;
f2db5cca818233 David Finkel   2024-07-24  169  	long current, peak, peak_reset;
84092dbcf90176 Roman Gushchin 2018-05-11  170  	char *memcg;
84092dbcf90176 Roman Gushchin 2018-05-11  171  
84092dbcf90176 Roman Gushchin 2018-05-11  172  	memcg = cg_name(root, "memcg_test");
84092dbcf90176 Roman Gushchin 2018-05-11  173  	if (!memcg)
84092dbcf90176 Roman Gushchin 2018-05-11  174  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  175  
84092dbcf90176 Roman Gushchin 2018-05-11  176  	if (cg_create(memcg))
84092dbcf90176 Roman Gushchin 2018-05-11  177  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  178  
84092dbcf90176 Roman Gushchin 2018-05-11  179  	current = cg_read_long(memcg, "memory.current");
84092dbcf90176 Roman Gushchin 2018-05-11  180  	if (current != 0)
84092dbcf90176 Roman Gushchin 2018-05-11  181  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  182  
f2db5cca818233 David Finkel   2024-07-24  183  	peak = cg_read_long(memcg, "memory.peak");
f2db5cca818233 David Finkel   2024-07-24  184  	if (peak != 0)
f2db5cca818233 David Finkel   2024-07-24  185  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  186  
84092dbcf90176 Roman Gushchin 2018-05-11  187  	if (cg_run(memcg, alloc_anon_50M_check, NULL))
84092dbcf90176 Roman Gushchin 2018-05-11  188  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  189  
f2db5cca818233 David Finkel   2024-07-24  190  	peak = cg_read_long(memcg, "memory.peak");
f2db5cca818233 David Finkel   2024-07-24  191  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  192  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  193  
f2db5cca818233 David Finkel   2024-07-24  194  	/*
f2db5cca818233 David Finkel   2024-07-24  195  	 * We'll open a few FDs for the same memory.peak file to exercise the free-path
f2db5cca818233 David Finkel   2024-07-24  196  	 * We need at least three to be closed in a different order than writes occurred to test
f2db5cca818233 David Finkel   2024-07-24  197  	 * the linked-list handling.
f2db5cca818233 David Finkel   2024-07-24  198  	 */
f2db5cca818233 David Finkel   2024-07-24  199  	int peak_fd = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
f2db5cca818233 David Finkel   2024-07-24  200  
f2db5cca818233 David Finkel   2024-07-24 @201  	if (peak_fd == -1)
f2db5cca818233 David Finkel   2024-07-24  202  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  203  
f2db5cca818233 David Finkel   2024-07-24  204  	bool fd2_closed = false, fd3_closed = false, fd4_closed = false;
f2db5cca818233 David Finkel   2024-07-24  205  	int peak_fd2 = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
f2db5cca818233 David Finkel   2024-07-24  206  
f2db5cca818233 David Finkel   2024-07-24  207  	if (peak_fd2 == -1)
f2db5cca818233 David Finkel   2024-07-24  208  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  209  
f2db5cca818233 David Finkel   2024-07-24  210  	int peak_fd3 = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
f2db5cca818233 David Finkel   2024-07-24  211  
f2db5cca818233 David Finkel   2024-07-24  212  	if (peak_fd3 == -1)
f2db5cca818233 David Finkel   2024-07-24  213  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  214  
f2db5cca818233 David Finkel   2024-07-24  215  	static const char reset_string[] = "reset\n";
f2db5cca818233 David Finkel   2024-07-24  216  
f2db5cca818233 David Finkel   2024-07-24  217  	peak_reset = write(peak_fd, reset_string, sizeof(reset_string));
f2db5cca818233 David Finkel   2024-07-24  218  	if (peak_reset != sizeof(reset_string))
f2db5cca818233 David Finkel   2024-07-24  219  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  220  
f2db5cca818233 David Finkel   2024-07-24  221  	peak_reset = write(peak_fd2, reset_string, sizeof(reset_string));
f2db5cca818233 David Finkel   2024-07-24  222  	if (peak_reset != sizeof(reset_string))
f2db5cca818233 David Finkel   2024-07-24  223  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  224  
f2db5cca818233 David Finkel   2024-07-24  225  	peak_reset = write(peak_fd3, reset_string, sizeof(reset_string));
f2db5cca818233 David Finkel   2024-07-24  226  	if (peak_reset != sizeof(reset_string))
f2db5cca818233 David Finkel   2024-07-24  227  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  228  
f2db5cca818233 David Finkel   2024-07-24  229  	/* Make sure a completely independent read isn't affected by our  FD-local reset above*/
f2db5cca818233 David Finkel   2024-07-24  230  	peak = cg_read_long(memcg, "memory.peak");
f2db5cca818233 David Finkel   2024-07-24  231  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  232  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  233  
f2db5cca818233 David Finkel   2024-07-24  234  	fd2_closed = true;
f2db5cca818233 David Finkel   2024-07-24  235  	if (close(peak_fd2))
f2db5cca818233 David Finkel   2024-07-24  236  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  237  
f2db5cca818233 David Finkel   2024-07-24  238  	int peak_fd4 = cg_open(memcg, "memory.peak", O_RDWR | O_APPEND | O_CLOEXEC);
f2db5cca818233 David Finkel   2024-07-24  239  
f2db5cca818233 David Finkel   2024-07-24  240  	if (peak_fd4 == -1)
f2db5cca818233 David Finkel   2024-07-24  241  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  242  
f2db5cca818233 David Finkel   2024-07-24  243  	peak_reset = write(peak_fd4, reset_string, sizeof(reset_string));
f2db5cca818233 David Finkel   2024-07-24  244  	if (peak_reset != sizeof(reset_string))
f2db5cca818233 David Finkel   2024-07-24  245  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  246  
f2db5cca818233 David Finkel   2024-07-24  247  	peak = cg_read_long_fd(peak_fd);
f2db5cca818233 David Finkel   2024-07-24  248  	if (peak > MB(30) || peak < 0)
f2db5cca818233 David Finkel   2024-07-24  249  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  250  
84092dbcf90176 Roman Gushchin 2018-05-11  251  	if (cg_run(memcg, alloc_pagecache_50M_check, NULL))
84092dbcf90176 Roman Gushchin 2018-05-11  252  		goto cleanup;
84092dbcf90176 Roman Gushchin 2018-05-11  253  
f2db5cca818233 David Finkel   2024-07-24  254  	peak = cg_read_long(memcg, "memory.peak");
f2db5cca818233 David Finkel   2024-07-24  255  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  256  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  257  
f2db5cca818233 David Finkel   2024-07-24  258  	/* Make sure everything is back to normal */
f2db5cca818233 David Finkel   2024-07-24  259  	peak = cg_read_long_fd(peak_fd);
f2db5cca818233 David Finkel   2024-07-24  260  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  261  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  262  
f2db5cca818233 David Finkel   2024-07-24  263  	peak = cg_read_long_fd(peak_fd4);
f2db5cca818233 David Finkel   2024-07-24  264  	if (peak < MB(50))
f2db5cca818233 David Finkel   2024-07-24  265  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  266  
f2db5cca818233 David Finkel   2024-07-24  267  	fd3_closed = true;
f2db5cca818233 David Finkel   2024-07-24  268  	if (close(peak_fd3))
f2db5cca818233 David Finkel   2024-07-24  269  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  270  
f2db5cca818233 David Finkel   2024-07-24  271  	fd4_closed = true;
f2db5cca818233 David Finkel   2024-07-24  272  	if (close(peak_fd4))
f2db5cca818233 David Finkel   2024-07-24  273  		goto cleanup;
f2db5cca818233 David Finkel   2024-07-24  274  
84092dbcf90176 Roman Gushchin 2018-05-11  275  	ret = KSFT_PASS;
84092dbcf90176 Roman Gushchin 2018-05-11  276  
84092dbcf90176 Roman Gushchin 2018-05-11  277  cleanup:
f2db5cca818233 David Finkel   2024-07-24  278  	close(peak_fd);
f2db5cca818233 David Finkel   2024-07-24  279  	if (!fd2_closed)
f2db5cca818233 David Finkel   2024-07-24  280  		close(peak_fd2);
f2db5cca818233 David Finkel   2024-07-24  281  	if (!fd3_closed)
f2db5cca818233 David Finkel   2024-07-24  282  		close(peak_fd3);
f2db5cca818233 David Finkel   2024-07-24  283  	if (!fd4_closed)
f2db5cca818233 David Finkel   2024-07-24  284  		close(peak_fd4);
84092dbcf90176 Roman Gushchin 2018-05-11  285  	cg_destroy(memcg);
84092dbcf90176 Roman Gushchin 2018-05-11  286  	free(memcg);
84092dbcf90176 Roman Gushchin 2018-05-11  287  
84092dbcf90176 Roman Gushchin 2018-05-11  288  	return ret;
84092dbcf90176 Roman Gushchin 2018-05-11  289  }
84092dbcf90176 Roman Gushchin 2018-05-11  290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

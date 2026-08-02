Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116AF17B50F
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Aug 2026 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785692609; cv=none; b=DCicHUOV9T6zoYO7L0GAcUoxB6VC6cPbLVZ+ypUa51wnrtVSWutt0VoN1FjHc+M05yBferfUoWpqE/X1za+JnDd2K2mB6WnuPa3RW9Svw77CP7x28zigagRXv/txThi7TT/efIHyXdrG6WA3yoNHZ3Vlz7lHO0+UY4KoTK912oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785692609; c=relaxed/simple;
	bh=xBPR4e3J29q1yjg/3Rht1HDOzSuxRL1mdAQpZewk6zc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BDhHzTZxHqcsbs8TkC0RnZqP5XXJw+BsdefSy+5AO0JoK2yMBZ2WQAEqdu0+BM+8671B5yFRfCS4DIbwTIZvOiEohSoGbFFuz98XgYqy5wC1RKYLFNh/tWqIleOdmb/6E2ieJEjvyI9TpagQ6EAN4hNEcPP9madkpzCeeZkeRxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fx659Alx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fx659Alx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785692606; x=1817228606;
  h=date:from:to:cc:subject:message-id;
  bh=xBPR4e3J29q1yjg/3Rht1HDOzSuxRL1mdAQpZewk6zc=;
  b=fx659Alx83dyBIpTu176XOXJnNfZUh8c+pmM7TrnvuT5V3k+QhgeaB7V
   G/lZTrXiBXbtRLBhHhxpWceXDlHp+kmx1eHdSgDEP1BeFpZ01hCbt9t1/
   Yb3CXp5ZsTNrD6ucgvrblKh7XhmpicpHkNGfGikRfgBQin51r2RnPpXEk
   sl1KeDPiHw0XzY0XpxviiqVgjd73jfVl3ALrIYBeqBf+pyHUACFZmUBBj
   KO95T+5jBBjxco+zStuQ1Zgz5M1aiPuNKPKNKoiwnmtm52X1AqYkCaoDo
   k2XLtOI2HjPhj1iCqNWmz4BZWTCVzF8wbHncCzn9dW29hoLVgdA87GZEV
   A==;
X-CSE-ConnectionGUID: 8rOAmrbKTTyQ5VmUe5k2ag==
X-CSE-MsgGUID: PZqH7lKRSbOTx0isrSW65g==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="89918194"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="89918194"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 10:43:26 -0700
X-CSE-ConnectionGUID: d8oPt5AARp+nql0DrFDzfA==
X-CSE-MsgGUID: +3ghW8GNRzGqjdxWlO13Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="264846491"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 Aug 2026 10:43:25 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqaDa-000000003hK-3CcZ;
	Sun, 02 Aug 2026 17:43:22 +0000
Date: Sun, 02 Aug 2026 19:42:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm64:for-next/selftests 3/4]
 seccomp_ret_trace_x0_bypass.c:79:28: error: array type has incomplete element
 type 'struct sock_filter'
Message-ID: <202608021913.NaZah1Ee-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/selftests
head:   2b989c411ab98fa76b7bb3b87ba7a2a4c3b5e946
commit: 21e37da12071da1e2d2b995219c3f394dd358300 [3/4] kselftest/arm64: Add testcase for SECCOMP_RET_TRACE orig_x0 bypass
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260802/202608021913.NaZah1Ee-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608021913.NaZah1Ee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608021913.NaZah1Ee-lkp@intel.com/

Note: the arm64/for-next/selftests HEAD 2b989c411ab98fa76b7bb3b87ba7a2a4c3b5e946 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   seccomp_ret_trace_x0_bypass.c: In function 'do_child':
>> seccomp_ret_trace_x0_bypass.c:79:28: error: array type has incomplete element type 'struct sock_filter'
      79 |         struct sock_filter filter[] = {
         |                            ^~~~~~
>> seccomp_ret_trace_x0_bypass.c:81:17: error: implicit declaration of function 'BPF_STMT'; did you mean 'BPF_STX'? [-Wimplicit-function-declaration]
      81 |                 BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct seccomp_data, nr)),
         |                 ^~~~~~~~
         |                 BPF_STX
>> seccomp_ret_trace_x0_bypass.c:83:17: error: implicit declaration of function 'BPF_JUMP'; did you mean 'BPF_JMP'? [-Wimplicit-function-declaration]
      83 |                 BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 0, 5),
         |                 ^~~~~~~~
         |                 BPF_JMP
>> seccomp_ret_trace_x0_bypass.c:98:16: error: variable 'prog' has initializer but incomplete type
      98 |         struct sock_fprog prog = {
         |                ^~~~~~~~~~
>> seccomp_ret_trace_x0_bypass.c:99:18: error: 'struct sock_fprog' has no member named 'len'
      99 |                 .len = ARRAY_SIZE(filter),
         |                  ^~~
   In file included from seccomp_ret_trace_x0_bypass.c:48:
   tools/testing/selftests/kselftest.h:64:25: warning: excess elements in struct initializer
      64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                         ^
   seccomp_ret_trace_x0_bypass.c:99:24: note: in expansion of macro 'ARRAY_SIZE'
      99 |                 .len = ARRAY_SIZE(filter),
         |                        ^~~~~~~~~~
   tools/testing/selftests/kselftest.h:64:25: note: (near initialization for 'prog')
      64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                         ^
   seccomp_ret_trace_x0_bypass.c:99:24: note: in expansion of macro 'ARRAY_SIZE'
      99 |                 .len = ARRAY_SIZE(filter),
         |                        ^~~~~~~~~~
>> seccomp_ret_trace_x0_bypass.c:100:18: error: 'struct sock_fprog' has no member named 'filter'
     100 |                 .filter = filter,
         |                  ^~~~~~
>> seccomp_ret_trace_x0_bypass.c:100:27: warning: excess elements in struct initializer
     100 |                 .filter = filter,
         |                           ^~~~~~
   seccomp_ret_trace_x0_bypass.c:100:27: note: (near initialization for 'prog')
>> seccomp_ret_trace_x0_bypass.c:98:27: error: storage size of 'prog' isn't known
      98 |         struct sock_fprog prog = {
         |                           ^~~~
>> seccomp_ret_trace_x0_bypass.c:98:27: warning: unused variable 'prog' [-Wunused-variable]
>> seccomp_ret_trace_x0_bypass.c:79:28: warning: unused variable 'filter' [-Wunused-variable]
      79 |         struct sock_filter filter[] = {
         |                            ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

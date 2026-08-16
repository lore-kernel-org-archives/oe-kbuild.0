Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF23016E7
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 02:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786849098; cv=none; b=BxuIrd5j0GJkzB05IKoJVFKJnBCQnVWW0xtJ+r7N4zBFeGGtQa6OZt9659GZSr8tfAbzuMo4NYhdwNAruVkK4oBMBK9Rs/jSZP6PCQXfj0r18A6ZJr2LSd35cy8z6xzCXUry93u/d5uKOUt882pJlvV2e83vvs9EC9IDxOSUlos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786849098; c=relaxed/simple;
	bh=t0YQsVxi3hosFRw8PignpgdVuSro+RznzWAwovZ5xt4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mtn+x8/S2yNCKfUqxd6En460t9l1VDckiKrJHQ2CfJNfQjhoUYIg/5pw/44OPdln9lYLm65gyke87FdPC5ZYo4Vj/VAXP4988L0KyGmcg3t2VkjAGLpIiVgg5lbnABmhOP+sp7scLZMY+3eKcDMTag0Sc8s71PZTDbuUObdSwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EOqUlVTA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EOqUlVTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786849096; x=1818385096;
  h=date:from:to:cc:subject:message-id;
  bh=t0YQsVxi3hosFRw8PignpgdVuSro+RznzWAwovZ5xt4=;
  b=EOqUlVTA+YUPBhrasJMpMJSi+lVS6f7duVbTgrUfgek5olqPTLnZ5pcf
   cArHMBupaVofvp6dReE9TR17WePuwOhAYwNsyVumo8EDLiEVPsMf2eocO
   YrpWc1bjyLkFPOCqBqIHS9UlwtgMujk3a4ZYW7wSCu/4JtwRrI+1EtaO2
   sn7grjtxZdOrnQfi16JO9bW2XKZ7kdAiNZh71cMdhxm7umOKJDXriWjA4
   bGMAD8Her4ycxxi5z3zeRDEUk5jzEQngxqiKvU0I3B4J832JCLpS36Ilc
   qnyobWPwaOMmdBWGXsS7ij9eFJeNkvjPwzKe2DC//LWhQwcusuyb2l/pu
   A==;
X-CSE-ConnectionGUID: X4gjKpDcQUamm9n5qFPdig==
X-CSE-MsgGUID: 5MmYhdP+QX2g0ECyUUSPsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="74904805"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="74904805"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 19:58:15 -0700
X-CSE-ConnectionGUID: cQjCV2WSRN26antwAcyM3w==
X-CSE-MsgGUID: yd2Oh2obS6Ce1ZfDcDED2Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2026 19:58:14 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvR4e-000000006XN-0JLj;
	Sun, 16 Aug 2026 02:58:12 +0000
Date: Sun, 16 Aug 2026 04:58:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: seccomp_ret_trace_x0_bypass.c:58:28: error: array type has
 incomplete element type 'struct sock_filter'
Message-ID: <202608160426.grUFLFRc-lkp@intel.com>
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
TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/kselftest-arm64-Add-seccomp-ptrace-x0-bypass-test/20260813-111613
head:   d4a8c9b264683748947dd76ad85fa460ff2eb070
commit: d4a8c9b264683748947dd76ad85fa460ff2eb070 kselftest/arm64: Add SECCOMP_RET_TRACE x0 bypass test
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260816/202608160426.grUFLFRc-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160426.grUFLFRc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160426.grUFLFRc-lkp@intel.com/

All errors (new ones prefixed by >>):

   seccomp_ret_trace_x0_bypass.c: In function 'do_child':
>> seccomp_ret_trace_x0_bypass.c:58:28: error: array type has incomplete element type 'struct sock_filter'
      58 |         struct sock_filter filter[] = {
         |                            ^~~~~~
>> seccomp_ret_trace_x0_bypass.c:59:17: error: implicit declaration of function 'BPF_STMT'; did you mean 'BPF_STX'? [-Wimplicit-function-declaration]
      59 |                 BPF_STMT(BPF_LD | BPF_W | BPF_ABS, 0),                  /* syscall nr */
         |                 ^~~~~~~~
         |                 BPF_STX
>> seccomp_ret_trace_x0_bypass.c:60:17: error: implicit declaration of function 'BPF_JUMP'; did you mean 'BPF_JMP'? [-Wimplicit-function-declaration]
      60 |                 BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 0, 1),
         |                 ^~~~~~~~
         |                 BPF_JMP
>> seccomp_ret_trace_x0_bypass.c:64:16: error: variable 'prog' has initializer but incomplete type
      64 |         struct sock_fprog prog = {
         |                ^~~~~~~~~~
>> seccomp_ret_trace_x0_bypass.c:65:18: error: 'struct sock_fprog' has no member named 'len'
      65 |                 .len = ARRAY_SIZE(filter),
         |                  ^~~
   In file included from seccomp_ret_trace_x0_bypass.c:31:
   tools/testing/selftests/kselftest.h:64:25: warning: excess elements in struct initializer
      64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                         ^
   seccomp_ret_trace_x0_bypass.c:65:24: note: in expansion of macro 'ARRAY_SIZE'
      65 |                 .len = ARRAY_SIZE(filter),
         |                        ^~~~~~~~~~
   tools/testing/selftests/kselftest.h:64:25: note: (near initialization for 'prog')
      64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                         ^
   seccomp_ret_trace_x0_bypass.c:65:24: note: in expansion of macro 'ARRAY_SIZE'
      65 |                 .len = ARRAY_SIZE(filter),
         |                        ^~~~~~~~~~
>> seccomp_ret_trace_x0_bypass.c:66:18: error: 'struct sock_fprog' has no member named 'filter'
      66 |                 .filter = filter,
         |                  ^~~~~~
   seccomp_ret_trace_x0_bypass.c:66:27: warning: excess elements in struct initializer
      66 |                 .filter = filter,
         |                           ^~~~~~
   seccomp_ret_trace_x0_bypass.c:66:27: note: (near initialization for 'prog')
>> seccomp_ret_trace_x0_bypass.c:64:27: error: storage size of 'prog' isn't known
      64 |         struct sock_fprog prog = {
         |                           ^~~~
   seccomp_ret_trace_x0_bypass.c:64:27: warning: unused variable 'prog' [-Wunused-variable]
   seccomp_ret_trace_x0_bypass.c:58:28: warning: unused variable 'filter' [-Wunused-variable]
      58 |         struct sock_filter filter[] = {
         |                            ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

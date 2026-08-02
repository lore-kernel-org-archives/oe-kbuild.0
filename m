Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C952AE76
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Aug 2026 16:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785687143; cv=none; b=gvrDdwnxd0U1kiVEtkNokt4tgzn4jFRi+0QFD/dL6+Rm/KVUMc08TGqcQPnMMcKF1edBAhqJRdm6W6Q8rQpgVts/WItqdRAuH2F4+qISM+mwdMpqtUUMbqn2fVGOpTgqgXjBnQGd2R3EYrt7p4x0U7d5xv9v0VnE1sdJ0Uine8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785687143; c=relaxed/simple;
	bh=ZnXM3qCkgr/hbncz0YvX1p1/JK93CMjlaVrjvnNqFEY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rHVQtyVKgSx2seDStPQSyl3a2A0UnaPZUmf/cjclUTzsjakDUIyqucM6x/0EOIE27WdMhr2J41Z7tv5YlKsTyYimkrc/lAiCC1PJ9flnF8TcHJncSHnbxNry9bUHvHT5jir98sS4WPnre14iq5E+GzWORgfhB6kNKlQQuk+l1lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Keb+0H21; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Keb+0H21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785687141; x=1817223141;
  h=date:from:to:cc:subject:message-id;
  bh=ZnXM3qCkgr/hbncz0YvX1p1/JK93CMjlaVrjvnNqFEY=;
  b=Keb+0H21Nh6w33p1gZJ0XVUo0iC571gL7hwpohJZ4FMmFrpnUnLTAUp6
   0vg1rY9o6Oqf85nFFagwDOnUs1/DY2eENaCLzHaU/E2MB2382k4NY1vUZ
   LFGBQ6yMZF594YyXZnTqrXISqrKdVlT2QRRU8DHHQFUSP75uxBa4oT3Ni
   ToZhJqNnKawSaXIl5Oyt+9hgyr8C/3O1buAhxAGgI1QKZlp6nSwzX54V6
   vXOK3wm3TOXL3T4cVyN/CHdPNokLIi/cRDmtsEMZCZ1mz2KuLVSHbXxXO
   SEYAv3ZI6HkLn47v019aqM4SqRYKCSAbAo2Y5rbR3mz2GhS4h+H0pbSD8
   g==;
X-CSE-ConnectionGUID: Kpe0wyb6SleBf/fVbRv21g==
X-CSE-MsgGUID: SxN5ugLOR2aYnvAK1avZXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96900238"
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="96900238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 09:12:21 -0700
X-CSE-ConnectionGUID: lzrvWs8aQf6+kG/OOm6etQ==
X-CSE-MsgGUID: 0LaYK7VvTwC+MPzHPur/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="262996011"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 02 Aug 2026 09:12:20 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqYnR-000000003gk-3i6k;
	Sun, 02 Aug 2026 16:12:17 +0000
Date: Sun, 02 Aug 2026 18:11:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm64:for-next/selftests 2/4]
 seccomp_ptrace_x0_bypass.c:67:28: error: array type has incomplete element
 type 'struct sock_filter'
Message-ID: <202608021842.jp6IBrFi-lkp@intel.com>
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
commit: 2fcbc4adf99790564b83381b2f239294185603d5 [2/4] kselftest/arm64: Add seccomp ptrace x0 bypass test
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260802/202608021842.jp6IBrFi-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608021842.jp6IBrFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608021842.jp6IBrFi-lkp@intel.com/

Note: the arm64/for-next/selftests HEAD 2b989c411ab98fa76b7bb3b87ba7a2a4c3b5e946 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   seccomp_ptrace_x0_bypass.c: In function 'do_child':
>> seccomp_ptrace_x0_bypass.c:67:28: error: array type has incomplete element type 'struct sock_filter'
      67 |         struct sock_filter filter[] = {
         |                            ^~~~~~
>> seccomp_ptrace_x0_bypass.c:68:17: error: implicit declaration of function 'BPF_STMT'; did you mean 'BPF_STX'? [-Wimplicit-function-declaration]
      68 |                 BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct seccomp_data, nr)),  /* nr */
         |                 ^~~~~~~~
         |                 BPF_STX
>> seccomp_ptrace_x0_bypass.c:69:17: error: implicit declaration of function 'BPF_JUMP'; did you mean 'BPF_JMP'? [-Wimplicit-function-declaration]
      69 |                 BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 0, 3),
         |                 ^~~~~~~~
         |                 BPF_JMP
>> seccomp_ptrace_x0_bypass.c:75:16: error: variable 'prog' has initializer but incomplete type
      75 |         struct sock_fprog prog = {
         |                ^~~~~~~~~~
>> seccomp_ptrace_x0_bypass.c:76:18: error: 'struct sock_fprog' has no member named 'len'
      76 |                 .len = ARRAY_SIZE(filter),
         |                  ^~~
   In file included from seccomp_ptrace_x0_bypass.c:38:
>> tools/testing/selftests/kselftest.h:64:25: warning: excess elements in struct initializer
      64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                         ^
   seccomp_ptrace_x0_bypass.c:76:24: note: in expansion of macro 'ARRAY_SIZE'
      76 |                 .len = ARRAY_SIZE(filter),
         |                        ^~~~~~~~~~
   tools/testing/selftests/kselftest.h:64:25: note: (near initialization for 'prog')
      64 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                         ^
   seccomp_ptrace_x0_bypass.c:76:24: note: in expansion of macro 'ARRAY_SIZE'
      76 |                 .len = ARRAY_SIZE(filter),
         |                        ^~~~~~~~~~
>> seccomp_ptrace_x0_bypass.c:77:18: error: 'struct sock_fprog' has no member named 'filter'
      77 |                 .filter = filter,
         |                  ^~~~~~
>> seccomp_ptrace_x0_bypass.c:77:27: warning: excess elements in struct initializer
      77 |                 .filter = filter,
         |                           ^~~~~~
   seccomp_ptrace_x0_bypass.c:77:27: note: (near initialization for 'prog')
>> seccomp_ptrace_x0_bypass.c:75:27: error: storage size of 'prog' isn't known
      75 |         struct sock_fprog prog = {
         |                           ^~~~
>> seccomp_ptrace_x0_bypass.c:75:27: warning: unused variable 'prog' [-Wunused-variable]
>> seccomp_ptrace_x0_bypass.c:67:28: warning: unused variable 'filter' [-Wunused-variable]
      67 |         struct sock_filter filter[] = {
         |                            ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

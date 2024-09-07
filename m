Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C27E839F7
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725747034; cv=none; b=V4fMZ8cXBzo20rPXtvzmU002q8q2YgGS9LfFYwhJWQiq5QeFvXOvTGuuYXHDNtDcvzNhhaZv+NZ/OHxCwDUdDGbW8wXUY7I352pdDPfp8w4Oz1irRL0ikpM/8kUq0kykOGRXXHn6nF2fCmc5pXqMz1De9r4e8QZH0TCh9G6uSjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725747034; c=relaxed/simple;
	bh=oMPzDKpUfwyCCNg6azXPyydW4H6oQLUdwa26icgYTRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LU8mSZCaK5LueMIwoFV3wV3xbatop2uhK15QGpXs+ydZCxYWWg7rMHSiIMIjDhQSVd7DEcFe5U5kiyfGgIlmr2kq/Dl6G5SIy5xo4/5W1hRRtwWAZ3EJ1mgxl9G/UQ3hnWhJLwUniOieMKBjy9s+3zFvqtqiZuqMj5hf3ijW390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXukyZ+m; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXukyZ+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725747032; x=1757283032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oMPzDKpUfwyCCNg6azXPyydW4H6oQLUdwa26icgYTRI=;
  b=mXukyZ+mr9Ab+h6ExNze7g4CNEjNAJ42Lg/0uJPAb4y9Jwc6ArmB02jU
   SDhQQEN9XmdAeB5O1RCwQbGSsMJAabcwJU7jRu00iRaZ5OhjjbTmOKssD
   AWIgRZkUqOsT8Fzeusom4kLPNMPHYmXp+USWlC7jXl69BtuEnpPd4V689
   6Djag6sZ7Tnfda69HjkRFMsHRF0nvuVm0e7qHkvRyC2z51Zd2mfaTbXl9
   93ISmpFsWYxlAqrHFyDjcgStOJNHOV5fz45ORUkGz1kgeIaaaQ4zpC05u
   atJPGeGtrJH7RXLLN6v+r7n8aiawnaatrGhvI7QbaXK4Jgvluhb00VgQu
   g==;
X-CSE-ConnectionGUID: L2bkPuQLSDy8ApH9ID5pJw==
X-CSE-MsgGUID: GrZuD2+vSWyP+vkI0xok6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24626612"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24626612"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 15:10:30 -0700
X-CSE-ConnectionGUID: GIPKfkgCQHOf4sUi6OFe7Q==
X-CSE-MsgGUID: Z8LUEkT7SkWfng2NVpBmDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="71078792"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Sep 2024 15:10:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn3dS-000D31-1q;
	Sat, 07 Sep 2024 22:10:26 +0000
Date: Sun, 8 Sep 2024 06:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10218/10296] vdso_test_getrandom.c:281:40:
 warning: | has lower precedence than ==; == will be evaluated first
Message-ID: <202409080600.YI5mIBVR-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: 212857cd099510461127f40ae7dc21092d0c0dd1 [10218/10296] selftests: vDSO: ensure vgetrandom works in a time namespace
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080600.YI5mIBVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409080600.YI5mIBVR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vdso_test_getrandom.c:281:40: warning: | has lower precedence than ==; == will be evaluated first [-Wparentheses]
     281 |                 else if (WSTOPSIG(status) == SIGTRAP | 0x80) {
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   vdso_test_getrandom.c:281:40: note: place parentheses around the '==' expression to silence this warning
     281 |                 else if (WSTOPSIG(status) == SIGTRAP | 0x80) {
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   vdso_test_getrandom.c:281:40: note: place parentheses around the | expression to evaluate it first
     281 |                 else if (WSTOPSIG(status) == SIGTRAP | 0x80) {
         |                                              ~~~~~~~~^~~~~~
   1 warning generated.


vim +281 tools/testing/selftests/vDSO/vdso_test_getrandom.c

4920a2590e91bc Jason A. Donenfeld 2024-07-07  241  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  242  static void kselftest(void)
4920a2590e91bc Jason A. Donenfeld 2024-07-07  243  {
4920a2590e91bc Jason A. Donenfeld 2024-07-07  244  	uint8_t weird_size[1263];
212857cd099510 Jason A. Donenfeld 2024-09-05  245  	pid_t child;
4920a2590e91bc Jason A. Donenfeld 2024-07-07  246  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  247  	ksft_print_header();
212857cd099510 Jason A. Donenfeld 2024-09-05  248  	ksft_set_plan(2);
4920a2590e91bc Jason A. Donenfeld 2024-07-07  249  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  250  	for (size_t i = 0; i < 1000; ++i) {
4920a2590e91bc Jason A. Donenfeld 2024-07-07  251  		ssize_t ret = vgetrandom(weird_size, sizeof(weird_size), 0);
4920a2590e91bc Jason A. Donenfeld 2024-07-07  252  		if (ret != sizeof(weird_size))
4920a2590e91bc Jason A. Donenfeld 2024-07-07  253  			exit(KSFT_FAIL);
4920a2590e91bc Jason A. Donenfeld 2024-07-07  254  	}
4920a2590e91bc Jason A. Donenfeld 2024-07-07  255  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  256  	ksft_test_result_pass("getrandom: PASS\n");
212857cd099510 Jason A. Donenfeld 2024-09-05  257  
212857cd099510 Jason A. Donenfeld 2024-09-05  258  	assert(unshare(CLONE_NEWUSER | CLONE_NEWTIME) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  259  	child = fork();
212857cd099510 Jason A. Donenfeld 2024-09-05  260  	assert(child >= 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  261  	if (!child) {
212857cd099510 Jason A. Donenfeld 2024-09-05  262  		vgetrandom_init();
212857cd099510 Jason A. Donenfeld 2024-09-05  263  		child = getpid();
212857cd099510 Jason A. Donenfeld 2024-09-05  264  		assert(ptrace(PTRACE_TRACEME, 0, NULL, NULL) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  265  		assert(kill(child, SIGSTOP) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  266  		assert(vgetrandom(weird_size, sizeof(weird_size), 0) == sizeof(weird_size));
212857cd099510 Jason A. Donenfeld 2024-09-05  267  		_exit(0);
212857cd099510 Jason A. Donenfeld 2024-09-05  268  	}
212857cd099510 Jason A. Donenfeld 2024-09-05  269  	for (;;) {
212857cd099510 Jason A. Donenfeld 2024-09-05  270  		struct ptrace_syscall_info info = { 0 };
212857cd099510 Jason A. Donenfeld 2024-09-05  271  		int status, ret;
212857cd099510 Jason A. Donenfeld 2024-09-05  272  		assert(waitpid(child, &status, 0) >= 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  273  		if (WIFEXITED(status)) {
212857cd099510 Jason A. Donenfeld 2024-09-05  274  			if (WEXITSTATUS(status) != 0)
212857cd099510 Jason A. Donenfeld 2024-09-05  275  				exit(KSFT_FAIL);
212857cd099510 Jason A. Donenfeld 2024-09-05  276  			break;
212857cd099510 Jason A. Donenfeld 2024-09-05  277  		}
212857cd099510 Jason A. Donenfeld 2024-09-05  278  		assert(WIFSTOPPED(status));
212857cd099510 Jason A. Donenfeld 2024-09-05  279  		if (WSTOPSIG(status) == SIGSTOP)
212857cd099510 Jason A. Donenfeld 2024-09-05  280  			assert(ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_TRACESYSGOOD) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05 @281  		else if (WSTOPSIG(status) == SIGTRAP | 0x80) {
212857cd099510 Jason A. Donenfeld 2024-09-05  282  			assert(ptrace(PTRACE_GET_SYSCALL_INFO, child, sizeof(info), &info) > 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  283  			if (info.entry.nr == __NR_getrandom &&
212857cd099510 Jason A. Donenfeld 2024-09-05  284  			    (info.entry.args[0] == (uintptr_t)weird_size && info.entry.args[1] == sizeof(weird_size)))
212857cd099510 Jason A. Donenfeld 2024-09-05  285  				exit(KSFT_FAIL);
212857cd099510 Jason A. Donenfeld 2024-09-05  286  		}
212857cd099510 Jason A. Donenfeld 2024-09-05  287  		assert(ptrace(PTRACE_SYSCALL, child, 0, 0) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  288  	}
212857cd099510 Jason A. Donenfeld 2024-09-05  289  
212857cd099510 Jason A. Donenfeld 2024-09-05  290  	ksft_test_result_pass("getrandom timens: PASS\n");
212857cd099510 Jason A. Donenfeld 2024-09-05  291  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  292  	exit(KSFT_PASS);
4920a2590e91bc Jason A. Donenfeld 2024-07-07  293  }
4920a2590e91bc Jason A. Donenfeld 2024-07-07  294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

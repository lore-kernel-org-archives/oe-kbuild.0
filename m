Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC924137BF
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Oct 2026 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833080; cv=none; b=GXIuJCed5Cd2z+52aLkTC12mRfL/6ntorvjZh3wbqG2xksvi7hkpM46mF9LKFXbnBDypZ0K+SDiTxYRsy+4vMA0xrH2HRUIET31L4lP62e3kIUD0Gs0N+kh9s9xfog8BzItzwPS7AjocaSz3Q6urpgnemyHDg8Q6iscVPj9I570=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833080; c=relaxed/simple;
	bh=G+2+Ljw0/A6A4+obWS6Zqv+ijU7Cbce4qwd3lxg1Po8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jfAk9dTmGzcDEKzgYNJB8XHdJVIMnB24gq23BpeocKODAi+zLx7T2EvmplTMF36VVGVrBGxGBCaGY8344cZJImjTxPf6c1K3no/g4pzmV6Koh2C0v7oWm7tEjpGPYHQ7Ab7DmZaqq+mC9ZMIm4ac6LRQPco3BRCXYhPzR67K+1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7fAYptQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7fAYptQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791833079; x=1823369079;
  h=date:from:to:cc:subject:message-id;
  bh=G+2+Ljw0/A6A4+obWS6Zqv+ijU7Cbce4qwd3lxg1Po8=;
  b=N7fAYptQFB/dWgTdUJpASL+xDMR7sZqOYk24TrG5uHQohRBhk1oQVMXx
   ahzGQLw5jrDX72igPwvra6jF49r0RCsUd1Amc5B/fo1nQNkuC/GpVGO9I
   2RqHTWIyOcZht2Dh4PkG4aDqZkx7m01MfaTAlVDnYcOgZJK8NHkKRxMBH
   CKMbTTKrGyi6vF7LfvrbeVtUxelzet8tMY8T1YhoDh/Y7+LifcwWav1CS
   4mcv+F/F0ebThSBEX+ItFoYztKDSB56cu3y07pj4M1Q6VEW6hbqD0XAmf
   BkR+ua0rD0/q0tFYQe9Gwn/e/D2qNellWovuk3uxyggRCMlpnLEHZiwBd
   Q==;
X-CSE-ConnectionGUID: xNuApFglTYiS5xJ+e9/x2w==
X-CSE-MsgGUID: /l1xyrGHS76cE7dHz+Rs+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="433811"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="433811"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 12:24:39 -0700
X-CSE-ConnectionGUID: voK4X/ltT+yIuFDQ16Ipmw==
X-CSE-MsgGUID: KmbO3BxGQ3KkjXxUz2QGmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="2750607"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 12 Oct 2026 12:24:37 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGLdT-00000000AAj-1bnD;
	Mon, 12 Oct 2026 19:24:35 +0000
Date: Mon, 12 Oct 2026 21:24:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mark:arm64/fpsimd/cleanup 9/10]
 arch/arm64/kernel/ptrace.c:1971:18: error: 'uregs' undeclared
Message-ID: <202610122120.j9YbfsTj-lkp@intel.com>
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
TO: Mark Rutland <mark.rutland@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/fpsimd/cleanup
head:   5515c91b8b8000d4011b76d8fdfba6751874f943
commit: 3514e4de75688ac8b8d28238e6b432a06942eca4 [9/10] arm64: ptrace: Flush state early in compat_vfp_set()
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261012/202610122120.j9YbfsTj-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122120.j9YbfsTj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610122120.j9YbfsTj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/ptrace.c: In function 'compat_vfp_set':
>> arch/arm64/kernel/ptrace.c:1971:18: error: 'uregs' undeclared (first use in this function)
    1971 |         fpscr = (uregs->fpsr & VFP_FPSCR_STAT_MASK) |
         |                  ^~~~~
   arch/arm64/kernel/ptrace.c:1971:18: note: each undeclared identifier is reported only once for each function it appears in


vim +/uregs +1971 arch/arm64/kernel/ptrace.c

478fcb2cdb2351d Will Deacon      2012-03-05  1955  
478fcb2cdb2351d Will Deacon      2012-03-05  1956  static int compat_vfp_set(struct task_struct *target,
478fcb2cdb2351d Will Deacon      2012-03-05  1957  			  const struct user_regset *regset,
478fcb2cdb2351d Will Deacon      2012-03-05  1958  			  unsigned int pos, unsigned int count,
478fcb2cdb2351d Will Deacon      2012-03-05  1959  			  const void *kbuf, const void __user *ubuf)
478fcb2cdb2351d Will Deacon      2012-03-05  1960  {
3514e4de75688ac Mark Rutland     2026-09-23  1961  	struct user_fpsimd_state newstate;
478fcb2cdb2351d Will Deacon      2012-03-05  1962  	compat_ulong_t fpscr;
5fbd5fc49fc39ac Dave Martin      2017-06-29  1963  	int ret, vregs_end_pos;
478fcb2cdb2351d Will Deacon      2012-03-05  1964  
c9d66999f064947 Suzuki K Poulose 2020-01-13  1965  	if (!system_supports_fpsimd())
c9d66999f064947 Suzuki K Poulose 2020-01-13  1966  		return -EINVAL;
c9d66999f064947 Suzuki K Poulose 2020-01-13  1967  
3514e4de75688ac Mark Rutland     2026-09-23  1968  	fpsimd_flush_task_state(target);
3514e4de75688ac Mark Rutland     2026-09-23  1969  
3514e4de75688ac Mark Rutland     2026-09-23  1970  	newstate = target->thread.uw.fpsimd_state;
3514e4de75688ac Mark Rutland     2026-09-23 @1971  	fpscr = (uregs->fpsr & VFP_FPSCR_STAT_MASK) |
3514e4de75688ac Mark Rutland     2026-09-23  1972  		(uregs->fpcr & VFP_FPSCR_CTRL_MASK);
478fcb2cdb2351d Will Deacon      2012-03-05  1973  
5fbd5fc49fc39ac Dave Martin      2017-06-29  1974  	vregs_end_pos = VFP_STATE_SIZE - sizeof(compat_ulong_t);
3514e4de75688ac Mark Rutland     2026-09-23  1975  	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &newstate, 0,
5fbd5fc49fc39ac Dave Martin      2017-06-29  1976  				 vregs_end_pos);
3514e4de75688ac Mark Rutland     2026-09-23  1977  	if (ret)
3514e4de75688ac Mark Rutland     2026-09-23  1978  		return ret;
478fcb2cdb2351d Will Deacon      2012-03-05  1979  
5fbd5fc49fc39ac Dave Martin      2017-06-29  1980  	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fpscr,
5fbd5fc49fc39ac Dave Martin      2017-06-29  1981  				 vregs_end_pos, VFP_STATE_SIZE);
3514e4de75688ac Mark Rutland     2026-09-23  1982  	if (ret)
478fcb2cdb2351d Will Deacon      2012-03-05  1983  		return ret;
3514e4de75688ac Mark Rutland     2026-09-23  1984  
3514e4de75688ac Mark Rutland     2026-09-23  1985  	newstate.fpsr = fpscr & VFP_FPSCR_STAT_MASK;
3514e4de75688ac Mark Rutland     2026-09-23  1986  	newstate.fpcr = fpscr & VFP_FPSCR_CTRL_MASK;
3514e4de75688ac Mark Rutland     2026-09-23  1987  	target->thread.uw.fpsimd_state = newstate;
3514e4de75688ac Mark Rutland     2026-09-23  1988  
3514e4de75688ac Mark Rutland     2026-09-23  1989  	return 0;
478fcb2cdb2351d Will Deacon      2012-03-05  1990  }
478fcb2cdb2351d Will Deacon      2012-03-05  1991  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

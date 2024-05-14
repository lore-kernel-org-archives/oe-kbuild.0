Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47389567F
	for <oe-kbuild@lists.linux.dev>; Tue, 14 May 2024 00:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715648046; cv=none; b=gL0UarX3sC5qLXSs0t5AusRapwDLU+c8c3VLqyuxPEjww0HqGzG4fo4rEyqSFiy7hVilAzwIfCYrB/Au8V+jGncIYpcEc1LwxqP1WIhTTzhKl036jXJTZrT47960sGUFb2WW8c8eiJI+nGjNMpy2cUy30e9os7z25qJn6WbUYdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715648046; c=relaxed/simple;
	bh=zWPcGofqRIJiR8bN0pct4L7c+S5KyYxunPCjOWDsNFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQ/n9jOhV41BSgkp6otoJ7UJhxPjbVSovvRRqT4Dd+Dj/AWQ53InGa2e7lMMLRcH3ez1x1avB1j3XNaA/J+JlOmcJoFCfaUKg81AA9pmtkirekrO3xPvt3XOEcJ0dLNxHKQhGIYVRnNmWz0J8GpMj1RtXI4YK+HoC4HKxZtBHh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbDDXAUJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbDDXAUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715648044; x=1747184044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWPcGofqRIJiR8bN0pct4L7c+S5KyYxunPCjOWDsNFU=;
  b=KbDDXAUJrY4Sz5/ie0pkfE67x/4PJLT6sCbihllE4oFfqGS64UMDjOhv
   5AmtVgu6180e1W+qrw2M13enqiDQfu5suM8Ttb/3UE1tfa3wz8oabz57G
   tLLY1+iYb5NLFZda/9w6K0wNgqklFaAWQZZSgsg05SqB4HPVF5bTo4hwT
   aem9xkGtP6jssP9XZk7A2APzVT+HFMu7TH2j9kFnxDnAsslEA8v/tHL9w
   jw42bkGicA9jML71eHmwmSdV39YQ3JZd6mJC+cjFNzPNi54V2V28VAdL3
   CTVH8WB2FTeQJDwOR7DgYKWuRQrxy94sJwfQy7ZaNtEPXCtWoAOf5t78b
   A==;
X-CSE-ConnectionGUID: D1SVRXnTQN6LNEJpVX5KLg==
X-CSE-MsgGUID: /G0j6uqdQUqCNJ616BAhgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="34121441"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="34121441"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 17:54:04 -0700
X-CSE-ConnectionGUID: 62BENU4BSRW1F2VDa/WDYA==
X-CSE-MsgGUID: gSj3SRWuRNe52DxcYebghg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="34950064"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 May 2024 17:54:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6gQa-000Apr-2R;
	Tue, 14 May 2024 00:54:00 +0000
Date: Tue, 14 May 2024 08:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-asm-generic:syscall-tbl-6.9 45/46] arch/arm64/kernel/sys.c:
 asm/syscall_table_64.h is included more than once.
Message-ID: <202405140838.gXq6QcpD-lkp@intel.com>
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
CC: linux-arch@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git syscall-tbl-6.9
head:   e0d7a2fe9b74052a280531e773ebaba59e2d523f
commit: 56921b57d82d74e6e7433932f8b33a52ca7e6977 [45/46] arm64: rework compat syscall macros
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405140838.gXq6QcpD-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/sys.c: asm/syscall_table_64.h is included more than once.
--
>> arch/arm64/include/asm/seccomp.h: asm/unistd_compat_32.h is included more than once.
--
>> arch/arm64/kernel/sys32.c: asm/syscall_table_32.h is included more than once.

vim +55 arch/arm64/kernel/sys.c

    52	
    53	#undef __SYSCALL
    54	#define __SYSCALL(nr, sym)	asmlinkage long __arm64_##sym(const struct pt_regs *);
  > 55	#include <asm/syscall_table_64.h>
    56	
    57	#undef __SYSCALL
    58	#define __SYSCALL(nr, sym)	[nr] = __arm64_##sym,
    59	
    60	const syscall_fn_t sys_call_table[__NR_syscalls] = {
    61		[0 ... __NR_syscalls - 1] = __arm64_sys_ni_syscall,
  > 62	#include <asm/syscall_table_64.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

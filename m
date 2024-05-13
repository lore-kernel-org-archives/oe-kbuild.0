Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B68146A8E
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 07:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715587036; cv=none; b=ZOSyM4PNkqtqvJcUd7T58v+92+Qn5leqGpGrWZv1wH1ygBI3w7UguW91/3XJtkalADwUmTmQLWHgPJvd09XeCiWebVyu0JRdVwFfnN/L+DYyMxxJfzDcLPYs/f2CXF/XlDzdSajGXT/LUgjf4K7kbPYVgRi7DzdY5IO5/FS70oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715587036; c=relaxed/simple;
	bh=samJ4A8LA10an2/zrP+8CpPlDG5032/ihdvbLvzy+MA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DcWCbyQwuF8PX6GLiN8/stavlRg5xY7XPyQlYca5ytdAE2RJez9K3q4uV5GvUjVlMVRwtcW4h1eb+/3uDcGWqQAFeQVv9dHwsRS1MiZLwc+3VujShpvsdy+8wI5hM2vkEvrxyofZPZN5d4m6DxkN2PpUXkdr0/3n0BBaMU/ZyDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N80eVPBj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N80eVPBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715587034; x=1747123034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=samJ4A8LA10an2/zrP+8CpPlDG5032/ihdvbLvzy+MA=;
  b=N80eVPBjnxNQM0hSkINTMZiCbrD5yJV7jCmp706B5BHYKmdihz8ES3za
   ofxIaGB9b9sjX6rZgRjEeDxSCzfCY7Gri4cpd0lvHOOIMgLZewALXgTSH
   zOrygi6NK2LVL3QucJUmic7CRoGLbsbDnHwb8CWATpi+JUcX8OS6w6UD/
   BJCntsM34tUJ25/xHdgtW3Vmi5CPjDFFu9GeMn8GqUYoMAf8KVA0RtJO5
   68bHzhrsGOW4EVEyro7c2abAOSGXigmSoiWedt0F6o5CuGKnmOisN6lbd
   PmQ0gbT4WjUEqCbd6HlWY4lrgc19rXIHNdcm1+rVfA/+JwbOmjf56zz/3
   w==;
X-CSE-ConnectionGUID: IlgBVyDdSKKDhdlQB3SO4Q==
X-CSE-MsgGUID: CEcOmKRzQBW1/hE+9FpY1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22654707"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="22654707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 00:57:13 -0700
X-CSE-ConnectionGUID: vcmeK2DQRomMowYAK7g3Cg==
X-CSE-MsgGUID: +K4OqcBtRyW/rbWMizTpvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30338391"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 May 2024 00:57:12 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6QYY-0009lM-1w;
	Mon, 13 May 2024 07:57:10 +0000
Date: Mon, 13 May 2024 15:56:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-asm-generic:syscall-tbl-6.9 30/46]
 arch/riscv/kernel/syscall_table.c: asm/syscall_table.h is included more than
 once.
Message-ID: <202405131504.7yK7W1Kn-lkp@intel.com>
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
commit: db45142644e8dc6281d8091b80dc827421245d86 [30/46] riscv: change to new syscall table
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405131504.7yK7W1Kn-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/syscall_table.c: asm/syscall_table.h is included more than once.

vim +16 arch/riscv/kernel/syscall_table.c

    13	
    14	#undef __SYSCALL
    15	#define __SYSCALL(nr, call)	asmlinkage long __riscv_##call(const struct pt_regs *);
  > 16	#include <asm/syscall_table.h>
    17	
    18	#undef __SYSCALL
    19	#define __SYSCALL(nr, call)	[nr] = __riscv_##call,
    20	
    21	void * const sys_call_table[__NR_syscalls] = {
    22		[0 ... __NR_syscalls - 1] = __riscv_sys_ni_syscall,
  > 23	#include <asm/syscall_table.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

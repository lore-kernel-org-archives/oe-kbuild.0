Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E745976
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 20:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720123416; cv=none; b=OyGuZp02JCzIKtZHIbdAGDVDvvuheZm2TDVZHz8TiKYIk6WDSFxxrzzo4v543x7qNl7DHKhCBuaDZC5fBgcYGKZ56UxWhff5mFkJ0E4CYzUWIgcpc6AGM9r3g9KysVEo/oLuJyY6Vq2/udY1y8zaxdfVQA31MSu+hwaiBF66lus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720123416; c=relaxed/simple;
	bh=pOxlorZY4tPEZewXThFCETYfSCSJZSsoyZLe286aypg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKIlCs/KYR0vpCwou9YMkCkSeEdoPJ3m8nxx2olfh4uahxQ3XGvVx0RFnLypDcvFXzTN+Hr53JR7FfuNU3d1gRyBfmwGAcuFBC7pLTS5E/i9JREoPkRbVnyFMQ+PcKXEufRp/fep6Qkkv9NpyuYKwJFrf3UjeoYagmJZAC8/qVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/FwWCvI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/FwWCvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720123414; x=1751659414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOxlorZY4tPEZewXThFCETYfSCSJZSsoyZLe286aypg=;
  b=Z/FwWCvIl07TxqsETXRuGWXH4a4Mi1ArREWxEro8GW+v+CBnAecX3lgD
   y5WCYF/mdBKYZ0Jquds8KfHtV12KxHluxHfhR1y7kNKjuJb6IbUefeGxl
   wHjNqcCi2WIZaXSBX6A8u7Ad45BwO4sm1JepsnAQS7xZcIZiXX4f2vyAo
   lOOno3HEQjRTXikF7EEeS59LDE8s6x91UphkFwx7GdNoAbBIiNI5otXew
   sZB7jYaMT2QNR7XQX0s+w3cIFflMkkETKXOK+RIpEfHOMzoOTA9xz5/+n
   Ic3HIjwXAnGGkUxGxBjqCChMa4nE74bVnIOCQszbU+Cmht9UcbsAOwTeR
   g==;
X-CSE-ConnectionGUID: CJUBgvoOQDqSquCqEKl++g==
X-CSE-MsgGUID: 5L2mthxlT5Scj4wMHJZbXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17556128"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17556128"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 13:03:34 -0700
X-CSE-ConnectionGUID: dC0HPWtRTge4amtV4YiiRg==
X-CSE-MsgGUID: lmVSNqDkQAeghsiFBv1zHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46696985"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jul 2024 13:03:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPSfy-000RP6-0g;
	Thu, 04 Jul 2024 20:03:30 +0000
Date: Fri, 5 Jul 2024 04:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-playground:to-build 17/17]
 arch/riscv/kernel/compat_syscall_table.c: asm/syscall_table_32.h is included
 more than once.
Message-ID: <202407050317.VlilrwsY-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   25862feffc419d0d195fdb118ae11b9c11b437d3
commit: 25862feffc419d0d195fdb118ae11b9c11b437d3 [17/17] riscv: convert to generic syscall table
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407050317.VlilrwsY-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/compat_syscall_table.c: asm/syscall_table_32.h is included more than once.

vim +15 arch/riscv/kernel/compat_syscall_table.c

    12	
    13	#undef __SYSCALL
    14	#define __SYSCALL(nr, call)	asmlinkage long __riscv_##call(const struct pt_regs *);
  > 15	#include <asm/syscall_table_32.h>
    16	
    17	#undef __SYSCALL
    18	#define __SYSCALL(nr, call)      [nr] = __riscv_##call,
    19	
    20	asmlinkage long compat_sys_rt_sigreturn(void);
    21	
    22	void * const compat_sys_call_table[__NR_syscalls] = {
    23		[0 ... __NR_syscalls - 1] = __riscv_sys_ni_syscall,
  > 24	#include <asm/syscall_table_32.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

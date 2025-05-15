Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C81F76A5
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 05:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747286703; cv=none; b=D1aqCq2JZjK9NjkJVZBn6M5UoUF64nkFs8jSoOw3laZ8Chl06m9bAaygUMD6Rn1k5ZQm2FM2eSfI/5fcGUMW1cqqc+Vp8OT8TsR2qrZxlV2HaRgLwDMvn6HEEn49uN5tIrpem+aDw0BPGKwFAp10q6Uedec5U++T85isc+B+l5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747286703; c=relaxed/simple;
	bh=KyWr/LjAezYIkRSEADEycIcHQ/cNbofb3CeG1pwp4Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sdGPcD/2hcAAS5Ytx2vYTsEL85jgoIxRYZbIMci8D24kntAkufSEwQdg+/P0ue+ejvHd7/EHxKHPuKHwvBhNXTNlxedwx9xSiX9X+OCHOE0m3yee7fmWUFnXtnGCw8NkuTpnO8IC0I3GC0MUMf7c2eWFKdCP2daP7WZy/Nk8+q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2D/E0gF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2D/E0gF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747286701; x=1778822701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyWr/LjAezYIkRSEADEycIcHQ/cNbofb3CeG1pwp4Cs=;
  b=G2D/E0gF9YdFiatlAf9TVdi3hrg+N2IR7usSt9RS300ZE87jN5fZAT+1
   iX4OmcXb1W/liVLlrvKDQE2ekRlh3FHgDTnSA/0CJau30xfvAzR6CZIlM
   WHKG3Zox85hzOAvhwAE8q8kPrgFiOqAmpNYFWkurMwjcsQgPmlQCZ7AAd
   yUmZoY/XUgnJSzO2WtbobupA0MPkyJb98wShXcsG8OHZGpd4MmtKUSCzp
   Tk3/PSkFrj/btRe6POfp05NoQHDbqaTzb/oKyvPrxiDy2D7QMitW9KaL6
   CkgnypG+h577wXX9wY4xaTNwSEViIub62bZSaU3Rb0sLUnqAFpGPp//OH
   g==;
X-CSE-ConnectionGUID: lvWbY08sTDClR3F1c30ihg==
X-CSE-MsgGUID: rDqPwvxIQROLOOP1tkm5Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48457072"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="48457072"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 22:25:01 -0700
X-CSE-ConnectionGUID: ONKDKxlpQfCWXe5DjrMZVg==
X-CSE-MsgGUID: LB8JTJh4QRO/sVJbao/4vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138780025"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2025 22:24:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFR5V-000Hxb-0r;
	Thu, 15 May 2025 05:24:57 +0000
Date: Thu, 15 May 2025 13:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:work.coredump.socket.tmp 12/17] fs/pidfs.c:608:2:
 error: call to '__compiletime_assert_595' declared with 'error' attribute:
 Need native word sized stores/loads for atomicity.
Message-ID: <202505151319.5E3AjcyI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.coredump.socket.tmp
head:   35c4ddb37fc4f2ba3ada4ef8eb64e849f82c702b
commit: f4d791098be37448a5552aaf97191618ada89a2d [12/17] pidfs, coredump: add PIDFD_INFO_COREDUMP
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-012-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151319.5E3AjcyI-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151319.5E3AjcyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505151319.5E3AjcyI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pidfs.c:608:2: error: call to '__compiletime_assert_595' declared with 'error' attribute: Need native word sized stores/loads for atomicity.
     608 |         smp_store_release(&exit_info->coredump_cookie, coredump_cookie);
         |         ^
   include/asm-generic/barrier.h:172:55: note: expanded from macro 'smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^
   arch/x86/include/asm/barrier.h:61:2: note: expanded from macro '__smp_store_release'
      61 |         compiletime_assert_atomic_type(*p);                             \
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro 'compiletime_assert_atomic_type'
     560 |         compiletime_assert(__native_word(t),                            \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:188:1: note: expanded from here
     188 | __compiletime_assert_595
         | ^
   1 error generated.


vim +608 fs/pidfs.c

4513522984a0af Christian Brauner 2025-03-05  595  
f4d791098be374 Christian Brauner 2025-05-02  596  #if defined(CONFIG_COREDUMP) && defined(CONFIG_UNIX)
f4d791098be374 Christian Brauner 2025-05-02  597  void pidfs_coredump_cookie(struct pid *pid, u64 coredump_cookie)
f4d791098be374 Christian Brauner 2025-05-02  598  {
f4d791098be374 Christian Brauner 2025-05-02  599  	struct pidfs_exit_info *exit_info;
f4d791098be374 Christian Brauner 2025-05-02  600  	struct dentry *dentry = pid->stashed;
f4d791098be374 Christian Brauner 2025-05-02  601  	struct inode *inode;
f4d791098be374 Christian Brauner 2025-05-02  602  
f4d791098be374 Christian Brauner 2025-05-02  603  	if (WARN_ON_ONCE(!dentry))
f4d791098be374 Christian Brauner 2025-05-02  604  		return;
f4d791098be374 Christian Brauner 2025-05-02  605  
f4d791098be374 Christian Brauner 2025-05-02  606  	inode = d_inode(dentry);
f4d791098be374 Christian Brauner 2025-05-02  607  	exit_info = &pidfs_i(inode)->__pei;
f4d791098be374 Christian Brauner 2025-05-02 @608  	smp_store_release(&exit_info->coredump_cookie, coredump_cookie);
f4d791098be374 Christian Brauner 2025-05-02  609  }
f4d791098be374 Christian Brauner 2025-05-02  610  #endif
f4d791098be374 Christian Brauner 2025-05-02  611  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

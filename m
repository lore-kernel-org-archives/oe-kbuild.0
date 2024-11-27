Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17E41442E8
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732699266; cv=none; b=LNi69YJwNCnOJvAKJo2KGd0oI3uB9jD8kDydGTg8D25eN/OMed8gN59H1LB5URX9Df8M+2D6JAXoN9P2LKmWp/lFtqGt6BSroD/kN3aWlw/S1HYvGnJFHNlJZm/WlEYeqIplma4tW2J25AGE0kXEQolyGf748OhGQO76aH4CTIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732699266; c=relaxed/simple;
	bh=ptcjbsdRuHBuWrtFXXRSO9VpZgNHnxoRgZZoXLAJiWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tEJ14hD3KBpakQWms9fhH22iOgZdxn97A737eX9E2HAJzFJHSvwAm2LEsmcDyGZN08r5Z0wzp+yUeDHhaDC5zvbH/SI86BO/OPUpuQGiBd52OlFiKkKHU7xnwpYae9VN4qMnLanW1mvwBw03tQ1/6VZg63MjuUXo81nh0M+dROE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRKTe8l3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRKTe8l3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732699263; x=1764235263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ptcjbsdRuHBuWrtFXXRSO9VpZgNHnxoRgZZoXLAJiWs=;
  b=HRKTe8l3sufdmdwFVh0Im49bFwf+5Q01+AfQJ/GEk8t3QIzHYqVmURKc
   3OVSCuEmaEh35DALYk7864NBN7YARYo6mqmav8As+ktsl14CewJJW5rm7
   +V9oBcziCySykI6yQP1YZ/rnxYQrBd9nqkyWUkDetSYYOM8cWy92XgNuN
   Z9laqcG1MI1OSd67RpQqW8srfmKXTyeIivpLFKGiOyqEG+/AcX9PGNnj9
   R4fZEPBm4EJYUUGMUpj4GaRBSRi+u4shGifL5aRa0dX3TC8n79FYUQ39p
   m9Aijl7PaaEVUMmmlpcljYzx1d7uEpVKu8MvhU5AJ3PIDsJrYfbD6cs3N
   A==;
X-CSE-ConnectionGUID: MKCSl8OwQm6RRfmiguKYMA==
X-CSE-MsgGUID: An08ubcASmCD9QqupQqDUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="33048157"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="33048157"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 01:21:02 -0800
X-CSE-ConnectionGUID: QpUA87JjTdW1f27wPQh7Hw==
X-CSE-MsgGUID: FvuvYdTTRkOe676FUKRmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="95961628"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Nov 2024 01:21:01 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGEEE-0007rv-2W;
	Wed, 27 Nov 2024 09:20:58 +0000
Date: Wed, 27 Nov 2024 17:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:uaccess-hardening-2 2/5] arch/x86/coco/sev/core.c:475:25:
 sparse: sparse: duplicate [noderef]
Message-ID: <202411271726.dvFXgNky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/coco/sev/core.c:475:25: sparse: sparse: duplicate [noderef]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git uaccess-hardening-2
head:   fe61a94918d25569e09dcdbdd5c8f67b2736f540
commit: f7a5c14629a56aae2519289cd41f892f5ee7615d [2/5] x86/sev: Remove off-label __get_user() usage
:::::: branch date: 4 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-122-20241126 (https://download.01.org/0day-ci/archive/20241127/202411271726.dvFXgNky-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271726.dvFXgNky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411271726.dvFXgNky-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: duplicate [noderef]
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
>> arch/x86/coco/sev/core.c:475:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:479:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:483:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user
   arch/x86/coco/sev/core.c:487:25: sparse: sparse: multiple address spaces given: __user & __user

vim +475 arch/x86/coco/sev/core.c

f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  423  
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  424  static enum es_result vc_read_mem(struct es_em_ctxt *ctxt,
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  425  				  char *src, char *buf, size_t size)
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  426  {
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  427  	unsigned long error_code = X86_PF_PROT;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  428  
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  429  	/*
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  430  	 * NOTE: the 'src' pointer can be either user or kernel memory.
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  431  	 *
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  432  	 * This function runs in atomic context, so unsafe_get_user() is not
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  433  	 * allowed to sleep.  allowed to sleep. The page-fault handler detects
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  434  	 * that it is running in atomic context and will not try to take
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  435  	 * mmap_sem and handle the fault, so additional
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  436  	 * pagefault_enable()/disable() calls are not needed.
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  437  	 *
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  438  	 * The access can't be done via copy_from_user() here because
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  439  	 * vc_read_mem() must not use string instructions to access unsafe
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  440  	 * memory. The reason is that MOVS is emulated by the #VC handler by
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  441  	 * splitting the move up into a read and a write and taking a nested #VC
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  442  	 * exception on whatever of them is the MMIO access. Using string
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  443  	 * instructions here would cause infinite nesting.
4954f5b8ef0baf arch/x86/kernel/sev.c    Joerg Roedel     2021-05-19  444  	 */
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  445  
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  446  	if (user_access_begin(src, size)) {
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  447  		switch (size) {
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  448  		case 1: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  449  			unsafe_get_user(*(u8 *)buf,  (u8 __user *)src,  user_fault);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  450  			break;
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  451  		}
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  452  		case 2: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  453  			unsafe_get_user(*(u16 *)buf, (u16 __user *)src, user_fault);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  454  			break;
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  455  		}
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  456  		case 4: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  457  			unsafe_get_user(*(u32 *)buf, (u32 __user *)src, user_fault);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  458  			break;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  459  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  460  		case 8: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  461  			unsafe_get_user(*(u64 *)buf, (u64 __user *)src, user_fault);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  462  			break;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  463  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  464  		default:
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  465  			user_access_end();
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  466  			WARN_ONCE(1, "%s: Invalid size: %zu\n", __func__, size);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  467  			return ES_UNSUPPORTED;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  468  		}
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  469  
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  470  		user_access_end();
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  471  	} else {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  472  
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  473  		switch (size) {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  474  		case 1: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23 @475  			__get_kernel_nofault((u8 *)buf,  (u8 __user *)src,  u8 __user, fault);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  476  			break;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  477  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  478  		case 2: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  479  			__get_kernel_nofault((u16 *)buf, (u16 __user *)src, u16 __user, fault);
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  480  			break;
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  481  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  482  		case 4: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  483  			__get_kernel_nofault((u32 *)buf, (u32 __user *)src, u32 __user, fault);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  484  			break;
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  485  		}
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  486  		case 8: {
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  487  			__get_kernel_nofault((u64 *)buf, (u64 __user *)src, u64 __user, fault);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  488  			break;
1d5379d0475419 arch/x86/kernel/sev.c    Michael Sterritt 2021-11-19  489  		}
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  490  		default:
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  491  			WARN_ONCE(1, "%s: Invalid size: %zu\n", __func__, size);
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  492  			return ES_UNSUPPORTED;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  493  		}
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  494  	}
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  495  
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  496  	return ES_OK;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  497  
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  498  user_fault:
f7a5c14629a56a arch/x86/coco/sev/core.c Josh Poimboeuf   2024-11-23  499  	user_access_end();
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  500  fault:
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  501  	if (user_mode(ctxt->regs))
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  502  		error_code |= X86_PF_USER;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  503  
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  504  	ctxt->fi.vector = X86_TRAP_PF;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  505  	ctxt->fi.error_code = error_code;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  506  	ctxt->fi.cr2 = (unsigned long)src;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  507  
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  508  	return ES_EXCEPTION;
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  509  }
f980f9c31a923e arch/x86/kernel/sev-es.c Joerg Roedel     2020-09-07  510  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB93225B0BF
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779328552; cv=none; b=I3E6uecxP2F+tRi8DY+C4DzsG5g0SXq07k5DRPslPCNO/d4qiryBopYNreXaGJuGFCYRRMkgJJf44c0pif5fv1W1Nb1FSp3LnE/CVLeRUwtjIRcKXOGNPBeLsGUmoFD0AUDPU5rXogX4DL7KtAe7PF8eITw7bjcnCnMeSxYR1Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779328552; c=relaxed/simple;
	bh=UT1a1pH+shBVK5ueLZ0/H9aNr49hYxeLdJhh3rR0MEA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lDhwBT9eX62AjkNQEoBD95sgDxRTcB8ZhxuF21p9FXu8TNHOfzp0Y6Y4ftYLof4GKzO0O3OV3wH8hdEepCazArIWUJoZ7dgnsOtquuI9O3umjIgdXN2nO+Lwl0maxtAURQ7Gw1v/nLZbMxpEHc5sPij/HI648UhLXsbbJjl8aqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkJbj+CX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkJbj+CX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779328550; x=1810864550;
  h=date:from:to:cc:subject:message-id;
  bh=UT1a1pH+shBVK5ueLZ0/H9aNr49hYxeLdJhh3rR0MEA=;
  b=OkJbj+CX63tkjUMZiA1VhCLsWqdm+ns2thBmlJvAlvXgYtBcrJ6grjVR
   ZsymtpxvkeeMdaJEuPui4EEGyNWh8V++vnVEhYI+auxWQhfAdf7tcdpd8
   GuPAeuHQ/iFW5WoOfL4diJ0kMvz7k9KM+nWe0Ky2VoZHnnTkzUjNudi4Y
   /ZEAlI0O/UL1xcEaOdFtn0q5YKc2ici1sx9dYrDGHwKqAkfvqbbvJkMcq
   A/LMYH/sIeDKRIPDUxchVZT5iuP1MCQmmQXT4FJdpKdDhCFXy3tgXF2uX
   jNm+TbLQcakgGFxyTo4ogAuKariqEYeZHTSNAqQCpJquB9VbzOz740VBx
   g==;
X-CSE-ConnectionGUID: BhEEWdxTS4a9qV/rzVpEnQ==
X-CSE-MsgGUID: 1T5Hskl9T/iZ3lxIgsML2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90541064"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="90541064"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 18:55:50 -0700
X-CSE-ConnectionGUID: 72xoiGZXTiCjRQA1eISaEg==
X-CSE-MsgGUID: /Xfb7kkdQn6CT7p1O18m/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="237779739"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2026 18:55:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPsdW-00000000Ajf-1mAa;
	Thu, 21 May 2026 01:55:46 +0000
Date: Thu, 21 May 2026 03:55:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: pre_fault_memory_test.c:199:21: error: 'run' undeclared
Message-ID: <202605210354.nXae9Wxr-lkp@intel.com>
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
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Claudio-Imbrenda/KVM-s390-Implement-KVM_PRE_FAULT_MEMORY/20260520-235916
head:   576fcb8fd5389d6378a291123be23e81c932e840
commit: 7ff2a3605d5e0403936cae33ff56ed7228155b5f KVM: selftests: Fix pre_fault_memory_test to run on s390
date:   10 hours ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260521/202605210354.nXae9Wxr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210354.nXae9Wxr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605210354.nXae9Wxr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from pre_fault_memory_test.c:10:
   pre_fault_memory_test.c: In function '__test_pre_fault_memory':
>> pre_fault_memory_test.c:199:21: error: 'run' undeclared (first use in this function)
     199 |                     run->exit_reason, exit_reason_str(run->exit_reason));
         |                     ^~~
   include/test_util.h:60:57: note: in definition of macro 'TEST_ASSERT'
      60 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                         ^~~~~~~~~~~
   pre_fault_memory_test.c:199:21: note: each undeclared identifier is reported only once for each function it appears in
     199 |                     run->exit_reason, exit_reason_str(run->exit_reason));
         |                     ^~~
   include/test_util.h:60:57: note: in definition of macro 'TEST_ASSERT'
      60 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                         ^~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

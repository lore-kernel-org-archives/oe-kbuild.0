Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E053290C4
	for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779891317; cv=none; b=fQVnBRHBuDkc+Shfsbaw6aRDtSlHohnyceX29iLS59sAGONPwFBhz/qzDBKvdiEUB7VMER0w75n5mnobcB/Rwtw/Eq8LbvVELPYLZQhLtQBqKDe8xfnO1FBHf513Z7is3zNmqiDIyAX74D697JPeMVqFU5+0AieHM6fCYceCSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779891317; c=relaxed/simple;
	bh=Lb3dCMJFvQf3GUZ9xElQrVPHuH2ndMa2EULkRlzjG7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cSWydlJgiOoY3faaQBivFYOAr3d5LgSPmGP+T3LYuycfjht70UMfTneF4wasB1CumnSNsFT+o69B7ZZipsn43pMjcN4WKydL1BAw50HB4beyNXXNFxsF9DPwDteyBostUcUnlstMJ2SHSe5bbTJQuy5ENnepjwOrzIuQQ+wMvZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWZ3dS7E; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWZ3dS7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779891305; x=1811427305;
  h=date:from:to:cc:subject:message-id;
  bh=Lb3dCMJFvQf3GUZ9xElQrVPHuH2ndMa2EULkRlzjG7M=;
  b=VWZ3dS7E0dTGpwCNw4mnmHnqW871IpbWKuz8suoxlW0KFf+ns1HPwsjf
   yBxHyF0P4lYt+3+22aQD4j40z9uICMsjyEZxQNpR/lEedRq4L17Gn09oj
   We7mTJswTeN+vAwMeS9pMmXV0MMbimLSHRg7xVDvbpc7PwnOiZkDDlN6w
   YAAP3CNXzRuqzP2C4GgtoT42cQrxH/okayhTog6h3fSQbvdd5Sz1xNA/7
   C03Sk3GaRpfsuWFK5R7Mi4BoGC6JPoXl7MsP626vcHP2xEGjVaShxXFzb
   E274eWVyOGT0sMj7+PofujgkuykKkWiKSU0PJKg5ozH767KuaA1AzPkJn
   g==;
X-CSE-ConnectionGUID: 20SkdeuRRSWG/TZn+6b1WQ==
X-CSE-MsgGUID: peROBCzNTXqybQ/NEBVxMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80780123"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="80780123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:15:05 -0700
X-CSE-ConnectionGUID: Z4MvwPGmQ8GOmjuAKoc8lg==
X-CSE-MsgGUID: 2CfF0/V+RjyJKfDNvV2eEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="247204828"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 May 2026 07:15:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSF2C-00000000422-2pbs;
	Wed, 27 May 2026 14:15:00 +0000
Date: Wed, 27 May 2026 22:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6658/7547]
 include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying
 to use reserved word 'return' as identifier
Message-ID: <202605272222.ut7STxKm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7e28506af98ce4e1059e5ec59334b335c00a246
commit: cda00f9ad27061d148b030b80a9c22e092c8f0e9 [6658/7547] raid6: hide internals
:::::: branch date: 23 hours ago
:::::: commit date: 8 days ago
config: powerpc-randconfig-r113-20260527 (https://download.01.org/0day-ci/archive/20260527/202605272222.ut7STxKm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605272222.ut7STxKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605272222.ut7STxKm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got ,
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
   include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got ,
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got ,
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got ,
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: got }
>> include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: got arch_test_and_set_bit_lock
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: got (
   include/asm-generic/bitops/instrumented-lock.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: got arch_xor_unlock_is_negative_byte
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:24:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:26:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, include/linux/time64.h, ...):
   include/asm-generic/div64.h:151:14: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:151:14: sparse: sparse: got no_ovf
   include/asm-generic/div64.h:154:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/div64.h:154:13: sparse: sparse: missing type declaration for parameter 'no_ovf'
   include/asm-generic/div64.h:161:11: sparse: sparse: Trying to use reserved word 'else' as identifier
--
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_transform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_inc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_inc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_inc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_lock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:468:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:469:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:469:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:473:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:473:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:474:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:474:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:475:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:475:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:476:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:476:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:500:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:500:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:503:1: sparse: sparse: got }
   include/linux/preempt.h:515:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:515:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:518:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:518:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/cpumask_types.h:9:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask_types.h:9:57: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/asm-generic/cmpxchg-local.h, ...):
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:513:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: got msr
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/asm-generic/cmpxchg-local.h, arch/powerpc/include/asm/cmpxchg.h, arch/powerpc/include/asm/atomic.h, ...):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
>> include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> include/linux/atomic/atomic-arch-fallback.h:2142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2174:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2207:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2237:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: got }
>> include/linux/atomic/atomic-arch-fallback.h:2500:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2505:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: got true
   include/linux/atomic/atomic-arch-fallback.h:2507:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2507:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2528:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2528:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2528:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2531:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2531:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2533:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2533:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2533:16: sparse: sparse: got true
   include/linux/atomic/atomic-arch-fallback.h:2535:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2535:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2564:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2564:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/atomic/atomic-arch-fallback.h, include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, ...):
   include/asm-generic/atomic64.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic64.h:14:1: sparse: sparse: got }
   include/asm-generic/atomic64.h:18:51: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:18:51: sparse: sparse: got *
   include/asm-generic/atomic64.h:19:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:19:45: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:38:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:38:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:38:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:38:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:39:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:39:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:39:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:39:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:40:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:40:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:40:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:40:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:47:56: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:47:56: sparse: sparse: got *
   include/asm-generic/atomic64.h:48:48: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:48:48: sparse: sparse: got *
   include/asm-generic/atomic64.h:49:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:49:45: sparse: sparse: got *
   include/asm-generic/atomic64.h:50:57: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:50:57: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: got *
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2604:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in nested declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got volatile
>> include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2656:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2656:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2673:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2673:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2700:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2700:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2727:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2727:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2753:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2753:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2776:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2776:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2803:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2803:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2830:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2830:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2856:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2856:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2879:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2879:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2896:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2896:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2923:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2923:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2950:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2950:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2976:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2976:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2999:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2999:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3026:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3026:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3053:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3053:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3079:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3079:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3102:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3102:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3122:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3122:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3148:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3174:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3174:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3199:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3221:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3221:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3247:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3247:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3273:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3273:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3298:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3298:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3320:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3320:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3340:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3340:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3366:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3366:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3392:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3392:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3417:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3417:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3439:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3439:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3465:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3465:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3491:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3491:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3516:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3516:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3538:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3538:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3555:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3555:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3582:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3582:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3609:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3609:1: sparse: sparse: got }
--
   include/linux/atomic/atomic-long.h:762:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:782:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:782:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:802:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:802:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:822:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:822:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:842:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:842:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:863:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:863:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:884:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:884:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:905:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:905:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:926:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:926:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:947:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:947:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:968:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:968:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:989:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:989:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1010:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1010:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1031:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1031:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1052:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1052:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1073:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1073:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1094:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1094:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1115:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1136:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1136:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1157:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1157:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1178:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1199:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1220:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1220:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1241:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1262:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1283:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1283:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1304:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1304:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1325:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1325:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1346:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1346:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1369:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1369:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1392:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1392:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1415:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1415:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1438:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1438:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1462:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1462:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1486:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1486:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1510:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1510:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1534:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1534:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1555:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1555:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1575:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1575:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1595:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1595:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1616:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1616:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1637:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1637:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1658:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1658:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1679:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1679:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1702:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1702:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1725:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1725:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1746:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1746:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1767:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1767:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1788:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1788:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1809:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1809:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
>> include/linux/atomic/atomic-instrumented.h:33:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:33:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:33:16: sparse: sparse: got raw_atomic_read
   include/linux/atomic/atomic-instrumented.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:34:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:50:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:50:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:50:16: sparse: sparse: got raw_atomic_read_acquire
   include/linux/atomic/atomic-instrumented.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:51:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:69:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:86:42: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:86:42: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:88:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:88:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:106:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:123:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:123:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:124:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:124:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:124:16: sparse: sparse: got raw_atomic_add_return
   include/linux/atomic/atomic-instrumented.h:125:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:125:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:142:16: sparse: sparse: got raw_atomic_add_return_acquire
   include/linux/atomic/atomic-instrumented.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:143:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:160:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:160:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:161:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:161:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:161:16: sparse: sparse: got raw_atomic_add_return_release
   include/linux/atomic/atomic-instrumented.h:162:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:162:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:179:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:179:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:179:16: sparse: sparse: got raw_atomic_add_return_relaxed
   include/linux/atomic/atomic-instrumented.h:180:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:180:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:197:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:197:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:198:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:198:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:198:16: sparse: sparse: got raw_atomic_fetch_add
   include/linux/atomic/atomic-instrumented.h:199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:199:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:216:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:216:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:216:16: sparse: sparse: got raw_atomic_fetch_add_acquire
   include/linux/atomic/atomic-instrumented.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:217:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:234:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:234:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:235:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:235:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:235:16: sparse: sparse: got raw_atomic_fetch_add_release
   include/linux/atomic/atomic-instrumented.h:236:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:236:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:253:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:253:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:253:16: sparse: sparse: got raw_atomic_fetch_add_relaxed
   include/linux/atomic/atomic-instrumented.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:254:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:272:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:289:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:289:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:290:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:290:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:290:16: sparse: sparse: got raw_atomic_sub_return
   include/linux/atomic/atomic-instrumented.h:291:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:291:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:308:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:308:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:308:16: sparse: sparse: got raw_atomic_sub_return_acquire
   include/linux/atomic/atomic-instrumented.h:309:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:309:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:326:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:326:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:327:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:327:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:327:16: sparse: sparse: got raw_atomic_sub_return_release
   include/linux/atomic/atomic-instrumented.h:328:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:328:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:345:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:345:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:345:16: sparse: sparse: got raw_atomic_sub_return_relaxed
   include/linux/atomic/atomic-instrumented.h:346:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:346:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:363:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:363:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:364:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:364:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:364:16: sparse: sparse: got raw_atomic_fetch_sub
   include/linux/atomic/atomic-instrumented.h:365:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:365:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:382:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:382:16: sparse: sparse: Expected ; at end of declaration
--
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got ,
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
   include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got ,
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got ,
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got ,
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: got }
>> include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: got arch_test_and_set_bit_lock
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: got (
   include/asm-generic/bitops/instrumented-lock.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: got arch_xor_unlock_is_negative_byte
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:24:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:26:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, include/linux/time64.h, ...):
   include/asm-generic/div64.h:151:14: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:151:14: sparse: sparse: got no_ovf
   include/asm-generic/div64.h:154:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/div64.h:154:13: sparse: sparse: missing type declaration for parameter 'no_ovf'
   include/asm-generic/div64.h:161:11: sparse: sparse: Trying to use reserved word 'else' as identifier
--
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_transform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_inc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_inc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_inc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_lock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:468:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:469:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:469:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:473:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:473:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:474:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:474:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:475:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:475:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:476:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:476:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:500:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:500:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:503:1: sparse: sparse: got }
   include/linux/preempt.h:515:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:515:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:518:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:518:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/cpumask_types.h:9:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask_types.h:9:57: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/asm-generic/cmpxchg-local.h, ...):
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:513:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: got msr
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/asm-generic/cmpxchg-local.h, arch/powerpc/include/asm/cmpxchg.h, arch/powerpc/include/asm/atomic.h, ...):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
>> include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> include/linux/atomic/atomic-arch-fallback.h:2142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2174:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2207:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2237:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: got }
>> include/linux/atomic/atomic-arch-fallback.h:2500:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2505:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: got true
   include/linux/atomic/atomic-arch-fallback.h:2507:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2507:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2528:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2528:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2528:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2531:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2531:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2533:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2533:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2533:16: sparse: sparse: got true
   include/linux/atomic/atomic-arch-fallback.h:2535:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2535:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2564:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2564:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/atomic/atomic-arch-fallback.h, include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, ...):
   include/asm-generic/atomic64.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic64.h:14:1: sparse: sparse: got }
   include/asm-generic/atomic64.h:18:51: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:18:51: sparse: sparse: got *
   include/asm-generic/atomic64.h:19:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:19:45: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:38:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:38:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:38:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:38:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:39:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:39:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:39:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:39:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:40:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:40:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:40:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:40:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:47:56: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:47:56: sparse: sparse: got *
   include/asm-generic/atomic64.h:48:48: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:48:48: sparse: sparse: got *
   include/asm-generic/atomic64.h:49:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:49:45: sparse: sparse: got *
   include/asm-generic/atomic64.h:50:57: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:50:57: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: got *
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2604:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in nested declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got volatile
>> include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2656:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2656:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2673:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2673:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2700:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2700:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2727:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2727:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2753:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2753:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2776:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2776:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2803:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2803:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2830:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2830:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2856:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2856:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2879:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2879:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2896:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2896:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2923:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2923:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2950:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2950:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2976:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2976:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2999:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2999:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3026:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3026:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3053:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3053:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3079:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3079:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3102:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3102:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3122:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3122:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3148:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3174:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3174:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3199:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3221:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3221:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3247:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3247:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3273:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3273:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3298:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3298:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3320:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3320:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3340:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3340:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3366:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3366:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3392:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3392:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3417:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3417:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3439:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3439:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3465:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3465:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3491:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3491:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3516:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3516:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3538:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3538:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3555:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3555:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3582:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3582:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3609:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3609:1: sparse: sparse: got }
--
   include/linux/atomic/atomic-long.h:762:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:782:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:782:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:802:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:802:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:822:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:822:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:842:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:842:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:863:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:863:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:884:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:884:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:905:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:905:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:926:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:926:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:947:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:947:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:968:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:968:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:989:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:989:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1010:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1010:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1031:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1031:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1052:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1052:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1073:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1073:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1094:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1094:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1115:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1136:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1136:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1157:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1157:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1178:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1199:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1220:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1220:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1241:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1262:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1283:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1283:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1304:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1304:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1325:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1325:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1346:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1346:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1369:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1369:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1392:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1392:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1415:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1415:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1438:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1438:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1462:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1462:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1486:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1486:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1510:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1510:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1534:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1534:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1555:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1555:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1575:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1575:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1595:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1595:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1616:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1616:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1637:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1637:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1658:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1658:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1679:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1679:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1702:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1702:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1725:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1725:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1746:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1746:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1767:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1767:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1788:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1788:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1809:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1809:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
>> include/linux/atomic/atomic-instrumented.h:33:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:33:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:33:16: sparse: sparse: got raw_atomic_read
   include/linux/atomic/atomic-instrumented.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:34:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:50:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:50:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:50:16: sparse: sparse: got raw_atomic_read_acquire
   include/linux/atomic/atomic-instrumented.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:51:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:69:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:86:42: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:86:42: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:88:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:88:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:106:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:123:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:123:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:124:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:124:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:124:16: sparse: sparse: got raw_atomic_add_return
   include/linux/atomic/atomic-instrumented.h:125:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:125:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:142:16: sparse: sparse: got raw_atomic_add_return_acquire
   include/linux/atomic/atomic-instrumented.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:143:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:160:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:160:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:161:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:161:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:161:16: sparse: sparse: got raw_atomic_add_return_release
   include/linux/atomic/atomic-instrumented.h:162:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:162:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:179:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:179:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:179:16: sparse: sparse: got raw_atomic_add_return_relaxed
   include/linux/atomic/atomic-instrumented.h:180:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:180:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:197:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:197:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:198:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:198:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:198:16: sparse: sparse: got raw_atomic_fetch_add
   include/linux/atomic/atomic-instrumented.h:199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:199:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:216:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:216:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:216:16: sparse: sparse: got raw_atomic_fetch_add_acquire
   include/linux/atomic/atomic-instrumented.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:217:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:234:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:234:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:235:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:235:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:235:16: sparse: sparse: got raw_atomic_fetch_add_release
   include/linux/atomic/atomic-instrumented.h:236:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:236:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:253:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:253:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:253:16: sparse: sparse: got raw_atomic_fetch_add_relaxed
   include/linux/atomic/atomic-instrumented.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:254:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:272:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:289:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:289:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:290:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:290:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:290:16: sparse: sparse: got raw_atomic_sub_return
   include/linux/atomic/atomic-instrumented.h:291:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:291:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:308:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:308:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:308:16: sparse: sparse: got raw_atomic_sub_return_acquire
   include/linux/atomic/atomic-instrumented.h:309:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:309:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:326:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:326:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:327:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:327:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:327:16: sparse: sparse: got raw_atomic_sub_return_release
   include/linux/atomic/atomic-instrumented.h:328:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:328:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:345:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:345:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:345:16: sparse: sparse: got raw_atomic_sub_return_relaxed
   include/linux/atomic/atomic-instrumented.h:346:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:346:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:363:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:363:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:364:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:364:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:364:16: sparse: sparse: got raw_atomic_fetch_sub
   include/linux/atomic/atomic-instrumented.h:365:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:365:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:382:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:382:16: sparse: sparse: Expected ; at end of declaration
--
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got ,
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
   include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got ,
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got ,
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got ,
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: got }
>> include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: got arch_test_and_set_bit_lock
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: got (
   include/asm-generic/bitops/instrumented-lock.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: got arch_xor_unlock_is_negative_byte
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:24:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:26:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, include/linux/time64.h, ...):
   include/asm-generic/div64.h:151:14: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:151:14: sparse: sparse: got no_ovf
   include/asm-generic/div64.h:154:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/div64.h:154:13: sparse: sparse: missing type declaration for parameter 'no_ovf'
   include/asm-generic/div64.h:161:11: sparse: sparse: Trying to use reserved word 'else' as identifier
--
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_transform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_inc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_inc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_inc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_lock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:468:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:469:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:469:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:473:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:473:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:474:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:474:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:475:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:475:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:476:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:476:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:500:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:500:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:503:1: sparse: sparse: got }
   include/linux/preempt.h:515:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:515:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:518:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:518:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/cpumask_types.h:9:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask_types.h:9:57: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/asm-generic/cmpxchg-local.h, ...):
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:513:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: got msr
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/asm-generic/cmpxchg-local.h, arch/powerpc/include/asm/cmpxchg.h, arch/powerpc/include/asm/atomic.h, ...):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
>> include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> include/linux/atomic/atomic-arch-fallback.h:2142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2174:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2207:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2237:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: got }
>> include/linux/atomic/atomic-arch-fallback.h:2500:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2505:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: got true
   include/linux/atomic/atomic-arch-fallback.h:2507:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2507:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2528:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2528:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2528:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2531:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2531:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2533:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2533:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2533:16: sparse: sparse: got true
   include/linux/atomic/atomic-arch-fallback.h:2535:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2535:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2564:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2564:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/atomic/atomic-arch-fallback.h, include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, ...):
   include/asm-generic/atomic64.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic64.h:14:1: sparse: sparse: got }
   include/asm-generic/atomic64.h:18:51: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:18:51: sparse: sparse: got *
   include/asm-generic/atomic64.h:19:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:19:45: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:38:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:38:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:38:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:38:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:39:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:39:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:39:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:39:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:40:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:40:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:40:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:40:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:47:56: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:47:56: sparse: sparse: got *
   include/asm-generic/atomic64.h:48:48: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:48:48: sparse: sparse: got *
   include/asm-generic/atomic64.h:49:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:49:45: sparse: sparse: got *
   include/asm-generic/atomic64.h:50:57: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:50:57: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: got *
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2604:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in nested declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got volatile
>> include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2656:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2656:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2673:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2673:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2700:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2700:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2727:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2727:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2753:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2753:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2776:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2776:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2803:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2803:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2830:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2830:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2856:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2856:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2879:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2879:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2896:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2896:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2923:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2923:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2950:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2950:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2976:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2976:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2999:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2999:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3026:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3026:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3053:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3053:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3079:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3079:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3102:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3102:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3122:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3122:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3148:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3174:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3174:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3199:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3221:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3221:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3247:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3247:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3273:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3273:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3298:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3298:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3320:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3320:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3340:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3340:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3366:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3366:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3392:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3392:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3417:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3417:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3439:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3439:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3465:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3465:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3491:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3491:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3516:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3516:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3538:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3538:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3555:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3555:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3582:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3582:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3609:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3609:1: sparse: sparse: got }
--
   include/linux/atomic/atomic-long.h:762:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:782:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:782:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:802:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:802:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:822:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:822:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:842:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:842:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:863:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:863:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:884:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:884:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:905:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:905:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:926:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:926:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:947:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:947:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:968:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:968:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:989:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:989:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1010:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1010:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1031:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1031:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1052:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1052:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1073:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1073:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1094:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1094:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1115:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1136:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1136:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1157:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1157:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1178:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1199:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1220:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1220:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1241:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1262:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1283:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1283:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1304:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1304:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1325:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1325:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1346:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1346:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1369:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1369:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1392:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1392:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1415:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1415:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1438:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1438:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1462:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1462:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1486:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1486:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1510:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1510:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1534:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1534:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1555:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1555:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1575:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1575:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1595:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1595:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1616:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1616:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1637:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1637:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1658:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1658:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1679:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1679:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1702:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1702:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1725:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1725:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1746:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1746:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1767:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1767:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1788:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1788:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1809:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1809:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
>> include/linux/atomic/atomic-instrumented.h:33:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:33:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:33:16: sparse: sparse: got raw_atomic_read
   include/linux/atomic/atomic-instrumented.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:34:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:50:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:50:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:50:16: sparse: sparse: got raw_atomic_read_acquire
   include/linux/atomic/atomic-instrumented.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:51:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:69:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:86:42: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:86:42: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:88:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:88:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:106:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:123:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:123:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:124:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:124:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:124:16: sparse: sparse: got raw_atomic_add_return
   include/linux/atomic/atomic-instrumented.h:125:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:125:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:142:16: sparse: sparse: got raw_atomic_add_return_acquire
   include/linux/atomic/atomic-instrumented.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:143:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:160:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:160:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:161:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:161:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:161:16: sparse: sparse: got raw_atomic_add_return_release
   include/linux/atomic/atomic-instrumented.h:162:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:162:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:179:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:179:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:179:16: sparse: sparse: got raw_atomic_add_return_relaxed
   include/linux/atomic/atomic-instrumented.h:180:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:180:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:197:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:197:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:198:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:198:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:198:16: sparse: sparse: got raw_atomic_fetch_add
   include/linux/atomic/atomic-instrumented.h:199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:199:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:216:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:216:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:216:16: sparse: sparse: got raw_atomic_fetch_add_acquire
   include/linux/atomic/atomic-instrumented.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:217:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:234:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:234:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:235:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:235:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:235:16: sparse: sparse: got raw_atomic_fetch_add_release
   include/linux/atomic/atomic-instrumented.h:236:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:236:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:253:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:253:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:253:16: sparse: sparse: got raw_atomic_fetch_add_relaxed
   include/linux/atomic/atomic-instrumented.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:254:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:272:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:289:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:289:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:290:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:290:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:290:16: sparse: sparse: got raw_atomic_sub_return
   include/linux/atomic/atomic-instrumented.h:291:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:291:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:308:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:308:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:308:16: sparse: sparse: got raw_atomic_sub_return_acquire
   include/linux/atomic/atomic-instrumented.h:309:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:309:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:326:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:326:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:327:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:327:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:327:16: sparse: sparse: got raw_atomic_sub_return_release
   include/linux/atomic/atomic-instrumented.h:328:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:328:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:345:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:345:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:345:16: sparse: sparse: got raw_atomic_sub_return_relaxed
   include/linux/atomic/atomic-instrumented.h:346:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:346:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:363:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:363:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:364:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:364:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:364:16: sparse: sparse: got raw_atomic_fetch_sub
   include/linux/atomic/atomic-instrumented.h:365:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:365:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:382:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:382:16: sparse: sparse: Expected ; at end of declaration
--
   include/asm-generic/bitops/arch_hweight.h:15:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:20:1: sparse: sparse: got }
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/arch_hweight.h:25:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/bitops/instrumented-atomic.h, arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, ...):
   include/linux/instrumented.h:28:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:28:9: sparse: sparse: got ,
   include/linux/instrumented.h:29:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:29:1: sparse: sparse: got }
   include/linux/instrumented.h:42:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:42:9: sparse: sparse: got ,
   include/linux/instrumented.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:43:1: sparse: sparse: got }
   include/linux/instrumented.h:56:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:56:9: sparse: sparse: got ,
   include/linux/instrumented.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:57:1: sparse: sparse: got }
   include/linux/instrumented.h:65:21: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:65:21: sparse: sparse: got 0
   include/linux/instrumented.h:65:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/instrumented.h:66:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:66:57: sparse: sparse: got }
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in nested declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got {
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:67:17: sparse: sparse: got !
   include/linux/instrumented.h:67:17: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:67:17: sparse: sparse: got }
   include/linux/instrumented.h:68:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:68:9: sparse: sparse: got }
   include/linux/instrumented.h:83:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:83:9: sparse: sparse: got ,
   include/linux/instrumented.h:85:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:85:1: sparse: sparse: got }
   include/linux/instrumented.h:98:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:98:9: sparse: sparse: got ,
   include/linux/instrumented.h:100:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:100:1: sparse: sparse: got }
   include/linux/instrumented.h:113:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:113:9: sparse: sparse: got ,
   include/linux/instrumented.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:115:1: sparse: sparse: got }
   include/linux/instrumented.h:130:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:130:9: sparse: sparse: got ,
   include/linux/instrumented.h:131:39: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:131:39: sparse: sparse: got ,
   include/linux/instrumented.h:132:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:132:1: sparse: sparse: got }
   include/linux/instrumented.h:147:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:147:9: sparse: sparse: got ,
   include/linux/instrumented.h:148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:148:1: sparse: sparse: got }
   include/linux/instrumented.h:165:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:165:1: sparse: sparse: got }
   include/linux/instrumented.h:181:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:181:9: sparse: sparse: got ,
   include/linux/instrumented.h:182:9: sparse: sparse: Expected ) in function declarator
   include/linux/instrumented.h:182:9: sparse: sparse: got ,
   include/linux/instrumented.h:183:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:183:1: sparse: sparse: got }
   include/linux/instrumented.h:200:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/instrumented.h:200:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:30:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:43:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:71:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:72:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:72:16: sparse: sparse: got arch_test_and_set_bit
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:73:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:85:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:86:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:86:16: sparse: sparse: got arch_test_and_clear_bit
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:87:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-atomic.h:99:43: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-atomic.h:100:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-atomic.h:100:16: sparse: sparse: got arch_test_and_change_bit
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-atomic.h:101:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:26:38: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:28:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:42:31: sparse: sparse: got +
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:44:1: sparse: sparse: got }
>> include/asm-generic/bitops/instrumented-lock.h:58:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:58:16: sparse: sparse: got arch_test_and_set_bit_lock
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:59:1: sparse: sparse: got }
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/instrumented-lock.h:79:45: sparse: sparse: got (
   include/asm-generic/bitops/instrumented-lock.h:80:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/instrumented-lock.h:80:16: sparse: sparse: got arch_xor_unlock_is_negative_byte
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/instrumented-lock.h:81:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:22:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:27:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:32:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:37:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:42:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:47:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:52:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:57:1: sparse: sparse: got }
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/le.h:62:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:22:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:22:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: Expected ) in function declarator
   include/asm-generic/bitops/sched.h:24:14: sparse: sparse: got [
   include/asm-generic/bitops/sched.h:24:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/bitops/sched.h:26:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/bitops/sched.h:26:16: sparse: sparse: got __ffs
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/bitops/sched.h:30:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/log2.h, include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, ...):
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:78:1: sparse: sparse: undefined identifier 'generic___test_and_set_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:79:1: sparse: sparse: undefined identifier 'generic___test_and_clear_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:80:1: sparse: sparse: undefined identifier 'generic___test_and_change_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'const_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:81:1: sparse: sparse: undefined identifier 'generic_test_bit'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   include/linux/bitops.h:82:1: sparse: sparse: undefined identifier 'generic_test_bit_acquire'
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/div64.h, arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, ...):
   include/linux/log2.h:45:6: sparse: sparse: Expected ; at end of declaration
   include/linux/log2.h:45:6: sparse: sparse: got is_power_of_2
   include/linux/log2.h:48:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:48:1: sparse: sparse: got }
   include/linux/log2.h:58:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:58:1: sparse: sparse: got }
   include/linux/log2.h:68:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:68:1: sparse: sparse: got }
   include/linux/log2.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:202:1: sparse: sparse: got }
   include/linux/log2.h:230:26: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:230:26: sparse: sparse: got (
   include/linux/log2.h:230:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/log2.h:232:16: sparse: sparse: Expected ) in function declarator
   include/linux/log2.h:232:16: sparse: sparse: got (
   include/linux/log2.h:232:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/log2.h:233:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:233:1: sparse: sparse: got }
   include/linux/log2.h:270:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/log2.h:270:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/generated/asm/div64.h, include/linux/math.h, include/linux/math64.h, include/linux/time64.h, ...):
   include/asm-generic/div64.h:151:14: sparse: sparse: Expected ; at end of declaration
   include/asm-generic/div64.h:151:14: sparse: sparse: got no_ovf
   include/asm-generic/div64.h:154:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/asm-generic/div64.h:154:13: sparse: sparse: missing type declaration for parameter 'no_ovf'
   include/asm-generic/div64.h:161:11: sparse: sparse: Trying to use reserved word 'else' as identifier
--
   arch/powerpc/include/asm/jump_label.h:43:16: sparse: sparse: got false
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/jump_label.h:44:6: sparse: sparse: got :
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/jump_label.h:46:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/preempt.h, include/linux/preempt.h, include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/jump_label.h:115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:115:1: sparse: sparse: got }
   include/linux/jump_label.h:153:20: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:153:20: sparse: sparse: got jump_entry_is_branch
   include/linux/jump_label.h:156:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:156:1: sparse: sparse: got }
   include/linux/jump_label.h:161:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:161:1: sparse: sparse: got }
   include/linux/jump_label.h:167:9: sparse: sparse: Trying to use reserved word 'else' as identifier
   include/linux/jump_label.h:168:17: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:168:17: sparse: sparse: got entry
   include/linux/jump_label.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:169:1: sparse: sparse: got }
   include/linux/jump_label.h:178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:178:1: sparse: sparse: got }
   include/linux/jump_label.h:199:29: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:199:29: sparse: sparse: got static_key_false
   include/linux/jump_label.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:202:1: sparse: sparse: got }
   include/linux/jump_label.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/jump_label.h:207:1: sparse: sparse: got }
   include/linux/jump_label.h:218:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:218:13: sparse: sparse: got arch_jump_label_transform_queue
   include/linux/jump_label.h:222:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:222:13: sparse: sparse: got static_key_slow_inc
   include/linux/jump_label.h:223:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:223:13: sparse: sparse: got static_key_fast_inc_not_disabled
   include/linux/jump_label.h:225:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:225:13: sparse: sparse: got static_key_slow_inc_cpuslocked
   include/linux/jump_label.h:337:1: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:337:1: sparse: sparse: got class_jump_label_lock_is_conditional
   include/linux/jump_label.h:405:13: sparse: sparse: Expected ; at end of declaration
   include/linux/jump_label.h:405:13: sparse: sparse: got ____wrong_branch_error
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/preempt.h:468:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:468:1: sparse: sparse: got class_preempt_is_conditional
   include/linux/preempt.h:469:1: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:469:1: sparse: sparse: got class_preempt_notrace_is_conditional
   include/linux/preempt.h:473:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:473:13: sparse: sparse: got preempt_model_none
   include/linux/preempt.h:474:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:474:13: sparse: sparse: got preempt_model_voluntary
   include/linux/preempt.h:475:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:475:13: sparse: sparse: got preempt_model_full
   include/linux/preempt.h:476:13: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:476:13: sparse: sparse: got preempt_model_lazy
   include/linux/preempt.h:500:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:500:20: sparse: sparse: got preempt_model_rt
   include/linux/preempt.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:503:1: sparse: sparse: got }
   include/linux/preempt.h:515:20: sparse: sparse: Expected ; at end of declaration
   include/linux/preempt.h:515:20: sparse: sparse: got preempt_model_preemptible
   include/linux/preempt.h:518:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/preempt.h:518:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/sched.h, arch/powerpc/include/asm/switch_to.h):
   include/linux/cpumask_types.h:9:57: sparse: sparse: Expected ; at the end of type declaration
   include/linux/cpumask_types.h:9:57: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through arch/powerpc/include/asm/irqflags.h, include/linux/irqflags.h, include/asm-generic/cmpxchg-local.h, ...):
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:457:20: sparse: sparse: got arch_irqs_disabled_flags
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:460:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:465:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:472:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:477:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ) in function declarator
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got !
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:481:9: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:482:1: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:486:58: sparse: sparse: got }
   arch/powerpc/include/asm/hw_irq.h:513:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: Expected ; at end of declaration
   arch/powerpc/include/asm/hw_irq.h:513:16: sparse: sparse: got msr
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: Expected ; at the end of type declaration
   arch/powerpc/include/asm/hw_irq.h:514:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/asm-generic/cmpxchg-local.h, arch/powerpc/include/asm/cmpxchg.h, arch/powerpc/include/asm/atomic.h, ...):
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:265:1: sparse: sparse: got class_irq_is_conditional
   include/linux/irqflags.h:265:1: sparse: sparse: Expected ; at end of statement
   include/linux/irqflags.h:265:1: sparse: sparse: got was_disabled
   include/linux/irqflags.h:266:1: sparse: sparse: Expected ; at end of declaration
   include/linux/irqflags.h:266:1: sparse: sparse: got class_irqsave_is_conditional
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2127:1: sparse: sparse: got raw_atomic_try_cmpxchg
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2140:13: sparse: sparse: got (
>> include/linux/atomic/atomic-arch-fallback.h:2140:9: sparse: sparse: Trying to use reserved word 'if' as identifier
>> include/linux/atomic/atomic-arch-fallback.h:2142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2142:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2144:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2174:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2174:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2176:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2178:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2207:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2207:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2209:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2211:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2237:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2237:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2239:16: sparse: sparse: got __builtin_expect
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2241:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2262:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2282:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2302:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2329:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2356:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2382:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2405:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2435:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2458:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2479:1: sparse: sparse: got }
>> include/linux/atomic/atomic-arch-fallback.h:2500:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2500:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2503:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2505:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2505:16: sparse: sparse: got true
   include/linux/atomic/atomic-arch-fallback.h:2507:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2507:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2528:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2528:12: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2528:12: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2531:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2531:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2533:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2533:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2533:16: sparse: sparse: got true
   include/linux/atomic/atomic-arch-fallback.h:2535:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2535:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2564:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2564:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/atomic/atomic-arch-fallback.h, include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, ...):
   include/asm-generic/atomic64.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   include/asm-generic/atomic64.h:14:1: sparse: sparse: got }
   include/asm-generic/atomic64.h:18:51: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:18:51: sparse: sparse: got *
   include/asm-generic/atomic64.h:19:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:19:45: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:32:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:32:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:33:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:33:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:38:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:38:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:38:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:38:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:39:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:39:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:39:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:39:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:40:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:40:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:40:1: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:40:1: sparse: sparse: got *
   include/asm-generic/atomic64.h:47:56: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:47:56: sparse: sparse: got *
   include/asm-generic/atomic64.h:48:48: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:48:48: sparse: sparse: got *
   include/asm-generic/atomic64.h:49:45: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:49:45: sparse: sparse: got *
   include/asm-generic/atomic64.h:50:57: sparse: sparse: Expected ) in function declarator
   include/asm-generic/atomic64.h:50:57: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: got *
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: got (
   include/linux/atomic/atomic-arch-fallback.h:2604:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in nested declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got volatile
>> include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'const' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Trying to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2656:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2656:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2673:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2673:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2700:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2700:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2727:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2727:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2753:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2753:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2776:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2776:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2803:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2803:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2830:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2830:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2856:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2856:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2879:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2879:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2896:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2896:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2923:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2923:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2950:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2950:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2976:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2976:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2999:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2999:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3026:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3026:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3053:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3053:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3079:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3079:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3102:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3102:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3122:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3122:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3148:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3148:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3174:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3174:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3199:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3221:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3221:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3247:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3247:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3273:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3273:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3298:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3298:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3320:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3320:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3340:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3340:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3366:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3366:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3392:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3392:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3417:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3417:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3439:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3439:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3465:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3465:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3491:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3491:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3516:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3516:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3538:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3538:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3555:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3555:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3582:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3582:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:3609:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:3609:1: sparse: sparse: got }
--
   include/linux/atomic/atomic-long.h:762:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:782:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:782:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:802:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:802:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:822:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:822:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:842:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:842:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:863:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:863:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:884:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:884:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:905:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:905:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:926:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:926:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:947:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:947:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:968:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:968:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:989:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:989:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1010:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1010:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1031:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1031:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1052:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1052:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1073:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1073:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1094:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1094:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1115:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1115:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1136:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1136:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1157:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1157:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1178:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1178:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1199:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1220:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1220:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1241:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1241:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1262:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1262:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1283:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1283:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1304:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1304:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1325:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1325:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1346:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1346:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1369:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1369:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1392:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1392:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1415:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1415:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1438:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1438:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1462:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1462:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1486:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1486:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1510:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1510:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1534:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1534:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1555:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1555:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1575:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1575:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1595:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1595:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1616:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1616:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1637:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1637:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1658:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1658:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1679:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1679:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1702:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1702:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1725:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1725:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1746:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1746:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1767:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1767:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1788:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1788:1: sparse: sparse: got }
   include/linux/atomic/atomic-long.h:1809:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-long.h:1809:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c: note: in included file (through include/linux/atomic.h, include/linux/llist.h, include/linux/smp_types.h, include/linux/sched.h, ...):
>> include/linux/atomic/atomic-instrumented.h:33:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:33:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:33:16: sparse: sparse: got raw_atomic_read
   include/linux/atomic/atomic-instrumented.h:34:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:34:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:50:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:50:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:50:16: sparse: sparse: got raw_atomic_read_acquire
   include/linux/atomic/atomic-instrumented.h:51:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:51:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:69:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:69:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:86:42: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:86:42: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:88:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:88:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:106:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:106:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:123:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:123:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:124:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:124:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:124:16: sparse: sparse: got raw_atomic_add_return
   include/linux/atomic/atomic-instrumented.h:125:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:125:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:142:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:142:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:142:16: sparse: sparse: got raw_atomic_add_return_acquire
   include/linux/atomic/atomic-instrumented.h:143:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:143:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:160:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:160:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:161:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:161:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:161:16: sparse: sparse: got raw_atomic_add_return_release
   include/linux/atomic/atomic-instrumented.h:162:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:162:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:179:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:179:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:179:16: sparse: sparse: got raw_atomic_add_return_relaxed
   include/linux/atomic/atomic-instrumented.h:180:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:180:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:197:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:197:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:198:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:198:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:198:16: sparse: sparse: got raw_atomic_fetch_add
   include/linux/atomic/atomic-instrumented.h:199:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:199:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:216:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:216:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:216:16: sparse: sparse: got raw_atomic_fetch_add_acquire
   include/linux/atomic/atomic-instrumented.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:217:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:234:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:234:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:235:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:235:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:235:16: sparse: sparse: got raw_atomic_fetch_add_release
   include/linux/atomic/atomic-instrumented.h:236:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:236:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:253:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:253:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:253:16: sparse: sparse: got raw_atomic_fetch_add_relaxed
   include/linux/atomic/atomic-instrumented.h:254:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:254:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:272:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:289:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:289:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:290:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:290:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:290:16: sparse: sparse: got raw_atomic_sub_return
   include/linux/atomic/atomic-instrumented.h:291:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:291:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:308:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:308:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:308:16: sparse: sparse: got raw_atomic_sub_return_acquire
   include/linux/atomic/atomic-instrumented.h:309:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:309:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:326:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:326:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:327:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:327:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:327:16: sparse: sparse: got raw_atomic_sub_return_release
   include/linux/atomic/atomic-instrumented.h:328:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:328:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:345:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:345:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:345:16: sparse: sparse: got raw_atomic_sub_return_relaxed
   include/linux/atomic/atomic-instrumented.h:346:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:346:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:363:47: sparse: sparse: Expected ) in function declarator
   include/linux/atomic/atomic-instrumented.h:363:47: sparse: sparse: got (
   include/linux/atomic/atomic-instrumented.h:364:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:364:16: sparse: sparse: Expected ; at end of declaration
   include/linux/atomic/atomic-instrumented.h:364:16: sparse: sparse: got raw_atomic_fetch_sub
   include/linux/atomic/atomic-instrumented.h:365:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/atomic/atomic-instrumented.h:365:1: sparse: sparse: got }
   include/linux/atomic/atomic-instrumented.h:382:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   include/linux/atomic/atomic-instrumented.h:382:16: sparse: sparse: Expected ; at end of declaration

vim +/return +58 include/asm-generic/bitops/instrumented-lock.h

81d2c6f81996e01 Daniel Axtens 2019-08-20  45  
81d2c6f81996e01 Daniel Axtens 2019-08-20  46  /**
81d2c6f81996e01 Daniel Axtens 2019-08-20  47   * test_and_set_bit_lock - Set a bit and return its old value, for lock
81d2c6f81996e01 Daniel Axtens 2019-08-20  48   * @nr: Bit to set
81d2c6f81996e01 Daniel Axtens 2019-08-20  49   * @addr: Address to count from
81d2c6f81996e01 Daniel Axtens 2019-08-20  50   *
81d2c6f81996e01 Daniel Axtens 2019-08-20  51   * This operation is atomic and provides acquire barrier semantics if
81d2c6f81996e01 Daniel Axtens 2019-08-20  52   * the returned value is 0.
81d2c6f81996e01 Daniel Axtens 2019-08-20  53   * It can be used to implement bit locks.
81d2c6f81996e01 Daniel Axtens 2019-08-20  54   */
81d2c6f81996e01 Daniel Axtens 2019-08-20  55  static inline bool test_and_set_bit_lock(long nr, volatile unsigned long *addr)
81d2c6f81996e01 Daniel Axtens 2019-08-20  56  {
b159eeccb75a791 Marco Elver   2020-07-24  57  	instrument_atomic_read_write(addr + BIT_WORD(nr), sizeof(long));
81d2c6f81996e01 Daniel Axtens 2019-08-20 @58  	return arch_test_and_set_bit_lock(nr, addr);
81d2c6f81996e01 Daniel Axtens 2019-08-20  59  }
81d2c6f81996e01 Daniel Axtens 2019-08-20  60  

:::::: The code at line 58 was first introduced by commit
:::::: 81d2c6f81996e01fbcd2b5aeefbb519e21c806e9 kasan: support instrumented bitops combined with generic bitops

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

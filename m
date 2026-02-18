Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50727332EDA
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771405160; cv=none; b=jrhk4rG3OUXP62V+5oZgjD3ADlgKXaMZwXW4k0rjubhWeEhXCqkFdO5cc/24+Z4Tp6B9AIiZZuwrvhn8kAjWAx+5umo3vSz9Nna882K9KRpZXYq0VruwagvyLdnSgR4B0NfhqcR2cAzVPeRHIqIWMIvz3iddWLa6I+eE4KakEKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771405160; c=relaxed/simple;
	bh=Vz5zL4G4T92xGkCeSyh93aCF4LoAmfACg3v9Ob5a5QI=;
	h=Date:From:To:Subject:Message-ID; b=qh1dlVo8eXlZMn8CYpLJ9GzlqBMzfefoNiLLS2GJYfB6BQqk9EjTPHdclFu0hczKCll1lBgdTrI3JSpHJb1D0ABqba0YvyP9Rf1vCd45dYURjmHskKZv67sggivohwd3TlavhGPfL2WPlLqiQp8oti5X4h7QEf+t9pWjqtE6AOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gz1nvmJX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gz1nvmJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771405160; x=1802941160;
  h=date:from:to:subject:message-id;
  bh=Vz5zL4G4T92xGkCeSyh93aCF4LoAmfACg3v9Ob5a5QI=;
  b=Gz1nvmJXDEnOWcZU58RFK2IUUtXLv5xymo7baxmhBrnjfG7zs51JRFTM
   txagM3er0mOVHaCO9NIrVAhBp7SLVafDipIAeVTHVol36MJbNHfl3joIY
   XYVSdLHqvk2ygC+US3KHz3gcnILwiPqjvTsol9Hde6Q3C2PNvHJO834tg
   OsbQg2/dYWotLREqMoMRSBNZpCLP8zT4Q2qBhBQV90q8TNqpbqpit/A1b
   VGsMi7S2KRnhtwkWCDDUZlg4JWpBKJpJYwCvF9y4f7Fn/M9aJQWH00Z0N
   lmctelk6/I+FOPuvrv21SN0k55ZUCBKoBAuijrUQSDb1a0xOz3uhj6raE
   Q==;
X-CSE-ConnectionGUID: Tnd+VJsYRpakC1wJHzOyMw==
X-CSE-MsgGUID: d60utc+CR+in0zLHLLFa4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83585331"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83585331"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 00:59:19 -0800
X-CSE-ConnectionGUID: Ip6sYa5vQCyIkSWYy95d3w==
X-CSE-MsgGUID: ha9UolXiQZiDca/VHg3E2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213346004"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Feb 2026 00:59:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsdOt-000000003Xj-2WZR
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 08:59:15 +0000
Date: Wed, 18 Feb 2026 09:58:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/ebpf 43/47] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'iiii'
Message-ID: <202602180914.HhUK6eBD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Brian Cain <brian.cain@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/ebpf
head:   20942a320c34a14587bd2fff48e695221e8bb9aa
commit: e3346c299647a7b469835da18c4fb3cf0e7ac13c [43/47] hexagon: add eBPF JIT compiler
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602180914.HhUK6eBD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#307: FILE: arch/hexagon/net/bpf_jit.h:216:
+ *   0111 1000 iiii iiii PPii iiii iiid dddd

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#353: FILE: arch/hexagon/net/bpf_jit.h:262:
+ * Encoding: 0111 0010 ii1x xxxx PPii iiii iiii iiii

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#353: FILE: arch/hexagon/net/bpf_jit.h:262:
+ * Encoding: 0111 0010 ii1x xxxx PPii iiii iiii iiii

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#367: FILE: arch/hexagon/net/bpf_jit.h:276:
+ * Encoding: 0111 0001 ii1x xxxx PPii iiii iiii iiii

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#367: FILE: arch/hexagon/net/bpf_jit.h:276:
+ * Encoding: 0111 0001 ii1x xxxx PPii iiii iiii iiii

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#621: FILE: arch/hexagon/net/bpf_jit.h:530:
+ * Encoding: 0101 100i iiii iiii PPii iiii iiii iii-

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#621: FILE: arch/hexagon/net/bpf_jit.h:530:
+ * Encoding: 0101 100i iiii iiii PPii iiii iiii iii-

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#636: FILE: arch/hexagon/net/bpf_jit.h:545:
+ * Encoding: 0101 101i iiii iiii PPii iiii iiii iii0

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#636: FILE: arch/hexagon/net/bpf_jit.h:545:
+ * Encoding: 0101 101i iiii iiii PPii iiii iiii iii0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC0F19755B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 05:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771392559; cv=none; b=ao1F5qHJyzaieC2cxDBqFFd/iaz+B58V4ASqqRP0zc5Jy2cULNyBgMiJmHcofTHPkSeYMJsDLolyC3dG91o9N7AEZEfz0KydNJNtTdmQ6XkR4HtICd77Hm0ehYnu9YB0f/rZ0dGGxWhKYRreBriq3Cq6MgFv1iTzz4HjoTTGHk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771392559; c=relaxed/simple;
	bh=DOVbc08hxmri3j26GV3ja5y8bXYZbo0Lk5m+M7ZALFk=;
	h=Date:From:To:Subject:Message-ID; b=seuHDZxwl9Gw6fZ8ywFoJyisl02cfbauf9xAZIK+mflVU3EMm69LIwsLuE1Dd1Gn0xjhdNhI7tEyI82yILaZK3hlqKLR0ZJatCOGknbSpIKHCjrk44PaYQ86jqc3+oo8qFNzurVpRgHSdcfPjmpxYMP3ivSNsse/o9Xmj2UFuZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwwZoZbS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwwZoZbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771392558; x=1802928558;
  h=date:from:to:subject:message-id;
  bh=DOVbc08hxmri3j26GV3ja5y8bXYZbo0Lk5m+M7ZALFk=;
  b=LwwZoZbSeEL865ijdV5OUatAMTcQCnq4at4t9Ka9E6i7nEwfB/Nxxl/e
   9R6ilxmoxi5Du0pdJcmvNOGRCXAhD0XYz+/A2XOaC3QD1laCwCLOx7Rd9
   TZECOoWmQEeOmFYHiOeb+RZuMnywp8oggkTHxwF5TiKTHUt9xYtzJPlXg
   YlLdDCg+r8rQz24RscAXI5yIR8h+jzhBWBXZeUv4uKJ6HKrEZHzVGarte
   KTX3+1AUc/ALei1A2u0aNQQ9UF8USAkHwoAEYqKsn1GJeuC3S8Rr1PTTc
   l1rgPfLIjFEpP/UN2LvW1HsFdggoR/dzEV2wGdBSNlDC7dvLey40r2LQO
   A==;
X-CSE-ConnectionGUID: vcoJj8TeR1Guu2EkcWqE/w==
X-CSE-MsgGUID: 43Ks7MqiRni4gl4j1Ux9bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="95094736"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="95094736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 21:29:18 -0800
X-CSE-ConnectionGUID: QpQC9180SpChbhOOn1v3Tw==
X-CSE-MsgGUID: NbzwPAHwRyCUpbQjTcVxNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="214095759"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 17 Feb 2026 21:29:17 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsa7e-000000003WV-2Ktm
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 05:29:14 +0000
Date: Wed, 18 Feb 2026 06:28:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/ebpf 43/47] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'iiii'
Message-ID: <202602180609.xeyhTif2-lkp@intel.com>
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
head:   38d7c7bdbf3b9315d186ca99ac219a0ea1aad3b3
commit: 9c4b42f71a50fd322fc15bec39e1d71bf3887fd7 [43/47] hexagon: add eBPF JIT compiler
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602180609.xeyhTif2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#289: FILE: arch/hexagon/net/bpf_jit.h:216:
+ *   0111 1000 iiii iiii PPii iiii iiid dddd

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#335: FILE: arch/hexagon/net/bpf_jit.h:262:
+ * Encoding: 0111 0010 ii1x xxxx PPii iiii iiii iiii

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#335: FILE: arch/hexagon/net/bpf_jit.h:262:
+ * Encoding: 0111 0010 ii1x xxxx PPii iiii iiii iiii

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#349: FILE: arch/hexagon/net/bpf_jit.h:276:
+ * Encoding: 0111 0001 ii1x xxxx PPii iiii iiii iiii

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#349: FILE: arch/hexagon/net/bpf_jit.h:276:
+ * Encoding: 0111 0001 ii1x xxxx PPii iiii iiii iiii

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#603: FILE: arch/hexagon/net/bpf_jit.h:530:
+ * Encoding: 0101 100i iiii iiii PPii iiii iiii iii-

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#603: FILE: arch/hexagon/net/bpf_jit.h:530:
+ * Encoding: 0101 100i iiii iiii PPii iiii iiii iii-

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#618: FILE: arch/hexagon/net/bpf_jit.h:545:
+ * Encoding: 0101 101i iiii iiii PPii iiii iiii iii0

WARNING:REPEATED_WORD: Possible repeated word: 'iiii'
#618: FILE: arch/hexagon/net/bpf_jit.h:545:
+ * Encoding: 0101 101i iiii iiii PPii iiii iiii iii0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

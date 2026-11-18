Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000676;
	b=1k90uNLgjHcqBqA9V0JiuREbF5grt+uMCQtfSSCN5O6ABjQoLAbOr1Z7u0ofFx4xVf2c
	 lwhlcXPNvUzSHBaWtg+K3U2OiZ7iLGe3NMaasOBpvdukDx9bRxbnAEY8Ac6K0TbwCEs93
	 /D+14+iKHNkg3uH1bf0YgXXamaOTVCAx+8VUQQiu1m0lZztQ54cbBgiC1N2P5OvxFv3wR
	 kIs/1NY6lEncNoRu8FjozV41BRa9aWLAourfFQJSu9F/e90GYcD0u/5GKwaWp8LpHxINb
	 kVkx5fVG27uXhpAOBNA1ABVdGHGyYjKVW6/NSSyikQ7Pngz1zp9kR1x7gxLM0rGXvOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000676;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/BxTtFiuXbTbRcHnApumajUB8i4deRu7PvTHpp83+6Y=;
	b=gWnHK16ud5vtOfNEXAunz2kEcNzRh3qM46tXwvfQAzrynVcyNAryb1e+FKXLW2SFN4DW
	 I+1EuysW0HZZecHuJjlwj/WVzUxdbZ/q6BoUrb9WLCvsTxHNbxnRE+Heocvmhj9v3zDwx
	 kHLI8XmY0AT2Jwg71j1UW7KQVDmx+ReY4LXpXUK7Q6WRUQv9192rEbp6/AC5pgpnHcOHb
	 H8WxQV6CS+xjfNyGJIZ0MSrxFpVFPv9N1aHcQ13RKGZa4E8nReWXvfNoVPg0rOEZakKLP
	 SXIbFUa88xL9KcKlVyLKuCax8rV0YoU+5uMDnCpMDOoR8TAfSU1iMhMtxB5+zXHz9Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AeuUvcUs;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C1D606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 11:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AeuUvcUs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795000675; x=1826536675;
  h=date:from:to:cc:subject:message-id;
  bh=NGbkm2x3GwPC+LoXw8YAHoajRTt0Uqm4+eomfXXfPC0=;
  b=AeuUvcUs8Xkw+T29bh1X+dexTY50j7iywShLZScT/z+TgWarT0bSYFgl
   Ss0rU3Pz2BES3A5h1XrGHGdeRX3iUsvTmT0MnLqqdMnAn9SAUdJPOBoOW
   95Y/y1wLzCdrWX2ICDkPaJM+Db75sCr4UswAUrFKtrW1ESCFiNBiLhVQB
   dVfyi6Mj1lnv5MMc43sjzN3sPwT8cz+Epowx8Qq6JgfJmU5onzG2m80mD
   Jwmd1KIe+zXy2204zdNhS7EbbUFlk3dHQjm8F2R2SKQ0vcWLbH5/ORvOE
   VQJRJ9V0MOhN2gDaVRs/Rnt0P6WXhahkf0vnDlHe80BR8GtXAGoAitQdZ
   w==;
X-CSE-ConnectionGUID: +in/uWaYQ5CMwz/ZJ8WmlA==
X-CSE-MsgGUID: wIwmKYA/S7q4SicCfNOQkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3831507"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3831507"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:17:54 -0800
X-CSE-ConnectionGUID: dkRX5dseRySZDIJzXdKzrw==
X-CSE-MsgGUID: 11N0RdoLTaKcxb55/kEUWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10202632"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2026 03:17:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTdfj-000000003OI-0fgB;
	Wed, 18 Nov 2026 11:17:51 +0000
Date: Wed, 18 Nov 2026 12:17:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/test_context-analysis.o: warning: objtool:
 test_bit_spin_lock+0x40: unreachable instruction
Message-ID: <20261118121026.oBqPH7Ha-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
commit: eb7d96a13bf45f86909006a59e7855d8810f020a bit_spinlock: Support Clang's context analysis
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-r2302-20261115 (https://download.01.org/0day-ci/archive/20261118/20261118121026.oBqPH7Ha-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118121026.oBqPH7Ha-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: eb7d96a13bf4 ("bit_spinlock: Support Clang's context analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118121026.oBqPH7Ha-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_context-analysis.o: warning: objtool: test_bit_spin_lock+0x40: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

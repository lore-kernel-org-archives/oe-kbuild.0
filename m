Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B67309EF2
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Sep 2026 04:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788409014; cv=none; b=PnX22HNjS6EmXUUMUGWLOf+WNKBAvHI6VFa9pFGxDH/QPce6jmB5m06iS1bSId8MTSg12cNF9vJcudrhffWYtQJYPWCV429Rws7+00DZbwbj3s1CQgOQpy7XxZkuIt99G1m4XVRV5gO3ZEcb9XMD5kivzRBe7zmXIXyz3N+wF1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788409014; c=relaxed/simple;
	bh=btvvbryGHhi3tqbU5NyUSxLF5+1qpVjizvlU5TMzk0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ay07LXcCUlwU229Ew8uy3t1Cjh4KnafXex2L67ot88//RCVPGuFiEgmwuKwDc7/QYWRL9i4B9OEZIK/zrMlVP6fscGHKJZdyRK/oC1SX9L+MLYPmI5OcfWcqeLXBt1iSPYlWUoxznhStMOEBBCVImtZWvuJWL1x84vNfFGqhnLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIDB783D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIDB783D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788409012; x=1819945012;
  h=date:from:to:cc:subject:message-id;
  bh=btvvbryGHhi3tqbU5NyUSxLF5+1qpVjizvlU5TMzk0c=;
  b=LIDB783DRTDLBHMR6mVdtF4YrTtsfteNNGzPWZpA8/B0omsO+1EaXYnt
   TQP3NVwtp5/iVJ3GiD7F6eqyuOhQX6/5KdcoyGhhTpchsU7xGcQwPU74Q
   zu4HmEc6k2F/ifIfoxiD1hfh8WTjzNsYOZAR0Sey4AzPVrxt2o66UVO7j
   3Md2DC8KEZvvCbClupOhU2pBybE0eopwMoUOgVhqBamkerqS+xQUDcno1
   7hQvohxBnRjBdrkPqHM/0ntTbw1xB+aCKtl/H0pVG34YGGyEYG+ajEldk
   Rug7YiTUMx0kJuz9+OHovMy7W2w91z9idc4naWHbx95ATOqGRWaaikp8y
   A==;
X-CSE-ConnectionGUID: TAbXUev7Sqylmye/fwijTg==
X-CSE-MsgGUID: GGNqq9ZKQ+6g8HnTkIpirg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106244716"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="106244716"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:16:52 -0700
X-CSE-ConnectionGUID: a7TdtltSTgm+479Ha80G2Q==
X-CSE-MsgGUID: vWDNlcsXRimddv7zAd3e+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="293099423"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2026 21:16:51 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1ysa-0000000043C-3E5P;
	Thu, 03 Sep 2026 04:16:48 +0000
Date: Thu, 03 Sep 2026 12:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool: folio_zero_user+0x85e: unknown
 CFA base reg -1
Message-ID: <202609031256.d7zjEQWu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89a312991dc6e638a36adc43ccb91dbc25504c04
commit: 1fd1dc41724319406b0aff221a352a400b0ddfc5 objtool: Fix ERROR_INSN() error message
date:   6 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 6 months ago
config: x86_64-buildonly-randconfig-004-20260829 (https://download.01.org/0day-ci/archive/20260903/202609031256.d7zjEQWu-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031256.d7zjEQWu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1fd1dc417243 ("objtool: Fix ERROR_INSN() error message")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609031256.d7zjEQWu-lkp@intel.com/

All errors (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ___bpf_prog_run+0x20c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: folio_zero_user+0x897: undefined stack state
>> vmlinux.o: error: objtool: folio_zero_user+0x85e: unknown CFA base reg -1

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

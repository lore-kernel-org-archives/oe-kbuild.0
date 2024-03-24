Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE5B1A38DE
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Mar 2024 05:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711257270; cv=none; b=K2A0pqDDAQSJTxxTozFGLjGBPFYgmFGnQgl17DCU8n3YBNQqrtWjH4/Z+J/7SeNRvBC9Lvy5JX4Lk2/Qz2o82NEzTOaA82Os/Y/sf3Qvs3rkBG/bRaXtiQd8/blVpKY3k1xGL6OoimvOkNAS0ySklLl3o535QogmFOISVC0Bn5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711257270; c=relaxed/simple;
	bh=i9f8A59decVgAsMIXg1pPQo2I3DJn4nXUSO/wSIePf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4eWfRocGeQ7yZd+E8+bO+nAsJ0g9unlTx4ToRglgwn5AWVZdxTIphZby15WxW/7vhV3LSRvlqvEGfJTdJSugpLRe6m76g+BMvgKFXFQcFMDB78HiUattXFOhXKrPznCIagxEp6BPlnnvnnkhwO++AUF+KXnPa7tpeQBiNII3/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gre2kX02; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gre2kX02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711257269; x=1742793269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i9f8A59decVgAsMIXg1pPQo2I3DJn4nXUSO/wSIePf8=;
  b=gre2kX02NPtkYN1Pc+4rdMvMp48E2oIMegpEYk5xUBcdulBR22GScc/L
   50dU2Whb66ZNtl4AJmrYGv30iPbi6setQllsYpPhyoS/oLvhLIYwOfi8P
   i31RxClwBG1JmzlMjNDCXK+nMq5WJz1AfxcLg64RgbC2toyEsMpbTVfiU
   vHZmXh1vqQOMVi24FxtLmrBeewkA1SqAyMda9/ffPMpFJbJBUR9d38D7x
   2dndXQ7ISwL74HHhfeVBla4iaCI525Uye5QJoPBCIp2aIdobne8XKbxqN
   fu5G16rCy3J8Gdo3Lk6dOed4IQ/KlQkObgFzI1bbCyZyEIRid5h9Sa17/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="17705143"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="17705143"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 22:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15351584"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2024 22:14:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roGBc-000Lft-0x;
	Sun, 24 Mar 2024 05:14:24 +0000
Date: Sun, 24 Mar 2024 13:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /opt/cross/clang-23de3862dc/lib/clang/19/include/arm_neon.h:28:2:
 sparse: sparse: "NEON intrinsics not available with the soft-float ABI.
 Please use -mfloat-abi=softfp or -mfloat-abi=hard"
Message-ID: <202403241343.b1kQNIm6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: /opt/cross/clang-23de3862dc/lib/clang/19/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70293240c5ce675a67bfc48f419b093023b862b3
commit: cd575ddf57af004913ff5a994aa5f3203216fa68 bcachefs: Erasure coding
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r121-20240321 (https://download.01.org/0day-ci/archive/20240324/202403241343.b1kQNIm6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce: (https://download.01.org/0day-ci/archive/20240324/202403241343.b1kQNIm6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403241343.b1kQNIm6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid6/recov_neon_inner.c: note: in included file:
>> /opt/cross/clang-23de3862dc/lib/clang/19/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid6/recov_neon_inner.c: note: in included file:
   lib/raid6/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:15:50: sparse: sparse: got *
   lib/raid6/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:19:50: sparse: sparse: got *
   lib/raid6/recov_neon_inner.c:28:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/recov_neon_inner.c:28:50: sparse: sparse: got *
   lib/raid6/recov_neon_inner.c:33:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:33:20: sparse: sparse: got pm1
   lib/raid6/recov_neon_inner.c:34:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:34:20: sparse: sparse: got qm0
   lib/raid6/recov_neon_inner.c:35:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:35:20: sparse: sparse: got qm1
   lib/raid6/recov_neon_inner.c:36:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:36:20: sparse: sparse: got x0f
   lib/raid6/recov_neon_inner.c:50:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid6/recov_neon_inner.c:50:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid6/recov_neon_inner.c:51:28: sparse: sparse: Expected ; at end of statement
   lib/raid6/recov_neon_inner.c:51:28: sparse: sparse: got vx
   lib/raid6/recov_neon_inner.c:76:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/recov_neon_inner.c:76:1: sparse: sparse: got }
   lib/raid6/recov_neon_inner.c:82:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:82:20: sparse: sparse: got qm1
   lib/raid6/recov_neon_inner.c:83:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:83:20: sparse: sparse: got x0f
   lib/raid6/recov_neon_inner.c:92:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid6/recov_neon_inner.c:92:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid6/recov_neon_inner.c:93:28: sparse: sparse: Expected ; at end of statement
   lib/raid6/recov_neon_inner.c:93:28: sparse: sparse: got vx
   lib/raid6/recov_neon_inner.c:111:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/recov_neon_inner.c:111:1: sparse: sparse: got }
   lib/raid6/recov_neon_inner.c:53:17: sparse: sparse: undefined identifier 'px'
   lib/raid6/recov_neon_inner.c:53:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:54:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:54:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:56:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:56:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid6/recov_neon_inner.c:57:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:57:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:58:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:58:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:59:17: sparse: sparse: undefined identifier 'qx'
   lib/raid6/recov_neon_inner.c:59:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:61:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:61:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid6/recov_neon_inner.c:62:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:62:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:63:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:63:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:64:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:64:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:65:17: sparse: sparse: undefined identifier 'db'
   lib/raid6/recov_neon_inner.c:65:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:67:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:68:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:71:17: sparse: sparse: undefined identifier 'p'
   lib/raid6/recov_neon_inner.c:72:17: sparse: sparse: undefined identifier 'q'
   lib/raid6/recov_neon_inner.c:73:17: sparse: sparse: undefined identifier 'dp'
   lib/raid6/recov_neon_inner.c:74:17: sparse: sparse: undefined identifier 'dq'
   lib/raid6/recov_neon_inner.c:95:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:95:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:97:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:97:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid6/recov_neon_inner.c:98:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:98:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:99:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:99:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:100:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:100:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:101:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:101:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:103:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:104:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:107:17: sparse: sparse: undefined identifier 'p'
   lib/raid6/recov_neon_inner.c:108:17: sparse: sparse: undefined identifier 'q'
   lib/raid6/recov_neon_inner.c:109:17: sparse: sparse: undefined identifier 'dq'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C283B8D58
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827964; cv=none; b=a0dJrMz4w9zvSMZMreCSBT5zCrETyax2YuQsn0AbQQ3bVDdfN6Rd7n+RWagQ0jpDPGSAT4j5O91tP+UEggga6llkBby98CUbBrImix4LG9gLTgmVqpS3Z9taPzyOZqjotVfh10yrqVev0a2PI9JUq+XprlfnG1FStPovrMgA7YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827964; c=relaxed/simple;
	bh=VF4Yah9oaJJPWIQsl1/YARukT4XhM6i+F+df/gSwwIk=;
	h=Date:From:To:Subject:Message-ID; b=WtN1VfDx9IjKNMyXgr0r9nq3+SSsPgYrPMxwX+LIghYTD8/o50Kkj4L6CVoOPOuEvXWZFD+hxCCejBmr4KC2VxIOLnmbaDJ0I242pXsfadF/z7dCf/fziUU8SMgCnmbKsfFOUx2FaDJ8nTAIHvlmLjNviTlhYzQNNatgqqaJ4BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dK9Aqhdn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dK9Aqhdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773827957; x=1805363957;
  h=date:from:to:subject:message-id;
  bh=VF4Yah9oaJJPWIQsl1/YARukT4XhM6i+F+df/gSwwIk=;
  b=dK9AqhdnesjW9dIUsFAoj2iMphPFrGryDz6AafOo1iEi75T2tfLR2tun
   xke1ZBddv3emKWvNz359Lvb9BwzT0ljVvr3q3wZBeWAfME78/GTOjG5ok
   b+MoGW4DAL8a2KtO9eU9jDb9Zc3zCsPFpOvrdrgLd5ZuhM9fdTei9+YiN
   uXOcckClzlvBBB+zHfJjQS8SREyxKe8nfBPrE7bSMjzHUVqyu3zmNFq9e
   ojMzIEie+XI604wlVm4ibpmA5uS3HPNoFgD2b0PrLlFno7BKW4/eEgJ4w
   FX1SYb08nKTKwUnPgm90nwlQKIFVCve2NYKxzM2+6LbUsBhrEGeOk6il1
   Q==;
X-CSE-ConnectionGUID: ogaAlQW6S8mOw6XApD6Qjw==
X-CSE-MsgGUID: I498AJxeSAWRDLiNT9W/jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86350382"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="86350382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:59:08 -0700
X-CSE-ConnectionGUID: UeZxYVjgTvi+j3TrAYuuMw==
X-CSE-MsgGUID: zPDFGa8FS7eFseeVm4NwyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222632019"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2026 02:59:08 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ng9-000000004dB-22x6
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Mar 2026 09:59:05 +0000
Date: Wed, 18 Mar 2026 10:58:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next 10/103] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202603181040.wHoDRrmU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Likun Gao <Likun.Gao@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   daf9f9dd509113d6f49ce7c00d92bc17db58f215
commit: 90ddf27942580acd0cdd688fd1d190e6aaec2f53 [10/103] drm/amdgpu: update cp packets for gfx v12_1
:::::: branch date: 12 hours ago
:::::: commit date: 19 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260318/202603181040.wHoDRrmU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#65: FILE: drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h:84:
+		 * 5 - memory (same as tc_l2)
+         * 6 - memory_mapped_adc_persistent_state

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#90: FILE: drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h:100:
+		 * 1 - nt
+         * 2 - ht

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#138: FILE: drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h:136:
+		 * 1 - nt
+         * 2 - ht

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#151: FILE: drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h:145:
+		 * 2 - ht
+         * 3 - lu

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#172: FILE: drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h:163:
+		 * 1 - nt
+         * 2 - ht

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#174: FILE: drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h:165:
+         * 3 - lu
+		 */

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#215: FILE: drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h:209:
+		 * 1 - TC/L2
+         * 2 - register

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#251: FILE: drivers/gpu/drm/amd/amdgpu/gfx_v12_1_pkt.h:247:
+		 * 1 - nt
+         * 2 - ht

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

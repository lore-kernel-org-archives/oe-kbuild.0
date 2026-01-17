Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9C550094B
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 00:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609160; cv=none; b=KI6D5aGaSy+YhjFiz9vat+sHEzBd8HHk8xIlp3Pt1yiBZPN1jA3qGyd6O7iLKaDr57J4ZzHUAJwkNM1O3vtitjgnEDRA2Sc5prbJRTgB9hvrKkaBYyI+SBs4hjmktjm/Tp2QdYfvAQebKRpKM7OHbInygZJyqHDzljhcAjv62sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609160; c=relaxed/simple;
	bh=ZXRHNw4Y4q6/SC1/v5zdrnVGTFtY0cvNfhQ5iPXMyr4=;
	h=Date:From:To:Subject:Message-ID; b=gxkWQGehah7+e+X7llRzlFK2X3dpyEJda7FUdBZe14+NbnPwL65c0kkQtPLyyVrQtcMPR+LIZ+hVAUogRfA5DE+mv5VRGaqNUUNqweWB4MJ53FP6oLUlT/BveTSt3vbkUVRAQM1EcipAn3hPykN5ibbgvxi6cdGWJMe85qMjHTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFzHtf+0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFzHtf+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768609159; x=1800145159;
  h=date:from:to:subject:message-id;
  bh=ZXRHNw4Y4q6/SC1/v5zdrnVGTFtY0cvNfhQ5iPXMyr4=;
  b=oFzHtf+03C/LBkTBrCxUpZWfNbV/y0QTbZvJpmKY7eLnlzbn5iUdxJux
   ESCMDq4xg1DslJpCu6IvAP7Q68FfkCq3oRdVNIZPUiU34Ob7Zh7QU3H5x
   MO6aAH/AXteIBohMoAQJh2jAeXakfmwBbxwVBZPGJTnQKxksoEdKxnBqU
   ibQ9jSp3VK7gLuCHGf6yrlUNrTFSl/VuPWQQ+XSDoa8na+4zZuecNLTdA
   nCXNZRmllyYEF27eigwQmW20XM1wzLZR805tS/MF4vawtc/oL7KaioXqn
   REALsf4YryABSoYg9OEtreo4oDe5ZU+mF7d6JNbsu78CkInCDd65uyaty
   Q==;
X-CSE-ConnectionGUID: TZl4C933SL2inS0SBkA34Q==
X-CSE-MsgGUID: Rqzf9WbLSd+jlnNS3rizGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69839885"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69839885"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 16:19:18 -0800
X-CSE-ConnectionGUID: wRGnV447STKVH4u9zRTB+A==
X-CSE-MsgGUID: lvAZJgJ0RFaSiv48HTTndg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="242922643"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Jan 2026 16:19:18 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgu27-000000001sL-3q3T
	for oe-kbuild@lists.linux.dev;
	Sat, 17 Jan 2026 00:19:15 +0000
Date: Sat, 17 Jan 2026 01:18:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:ib_improvements2 13/13] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601170102.9OItmjtA-lkp@intel.com>
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
TO: Alex Deucher <alexander.deucher@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ib_improvements2
head:   3597cb2c9eaf9c0bdcfbdaa8cede6c66736f5cd8
commit: 3597cb2c9eaf9c0bdcfbdaa8cede6c66736f5cd8 [13/13] drm/amdgpu: rework ring reset backup and reemit
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260117/202601170102.9OItmjtA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#8: 
Since the VM fence is a sub-fence of the the IB fence, the IB

WARNING:REPEATED_WORD: Possible repeated word: 'when'
#14: 
fence when when we reemit, update the start and end wptrs

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

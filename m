Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91123054DF
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 10:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764240161; cv=none; b=qF4zGAr8IEyNHfSoUU+XyI8oJ0TbRDJjTShqAn9ZJIMc5gC32eBpKPrC7E+QS+QLyMKiG/FN4FaTSpao7DI/LyryVYoSz0GGpuMpIj42vDR3+hVP5msclskzokpmsBGewLOaE3zVybAE7B2cvmKm/ZdIQABN95LrGS6+Zn8s7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764240161; c=relaxed/simple;
	bh=HvLvJNxemQxz+QKBhgVhBSv7A1Pf8HWf68jXkuxH4Ek=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwvTA9HS96XVnz/p9JZBBCkYmoc9WvNCu5HJzfHqsorVxQU0052b+pf8g79D0K+ksFuVKMpqhqxYZ2RNqnm7IovKzVhxojGBVpLc8fXcDk1aj9dF05/J2sGvDr/Cqxysrx7p9S9Foee4f8kTVgn3fOK68oTijTboGQ5F2N/X1F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcySSIZK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcySSIZK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764240160; x=1795776160;
  h=date:from:to:subject:message-id:mime-version;
  bh=HvLvJNxemQxz+QKBhgVhBSv7A1Pf8HWf68jXkuxH4Ek=;
  b=XcySSIZKnu1cCB+BVDuchkS8vcZYRwf9p19LLLTYXr5bnvu321yETFd7
   NYtJD7GFpreVPcxUkLkfgsdmVp3XXddUbWwEWjveExyr3q+DsADGgC5zp
   eCYN9D40A5KBUOOozzlRUo3cI2pHA3uOOSyBy30S76VTTY0Qvv5+2YVhf
   raH4kY/AgfG2neGFGBq7RdaM3VgKfuVWOrcLhlRl/RkE7ZJ9Hp/9L4Eeh
   GWmhmtDrZDu7UzTP44jBg1q8JKGgrMbCkEMCEqBfCxLnb/C8BYRHosOg5
   tnhPckIMSbIY/MZcNYYAM8kY589K/tRsIR4CO38bybkfhGLViabvu83J9
   w==;
X-CSE-ConnectionGUID: StBEY3xlSRuodzu3PRkrGA==
X-CSE-MsgGUID: w+4DTjvTSo2hVxMOyeKL4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65996781"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="65996781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 02:42:40 -0800
X-CSE-ConnectionGUID: JDoJnfaBRBWkSYdRvnuJ/g==
X-CSE-MsgGUID: qqVqRcA8Q4eq94mqqDHhqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193298832"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2025 02:42:39 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOZSO-000000001iX-3QrP
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 10:42:36 +0000
Date: Thu, 27 Nov 2025 11:42:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-github:vfs-6.19.fd_prepare 2/4] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202511271151.2NTQLEyH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git vfs-6.19.fd_prepare
head:   8bbf3b8d2618db7e9e15c924fa0deba653016a44
commit: ea2f85c54e81501a25b09e1eaf63f94adf77f591 [2/4] ipc: preserve original file opening pattern
:::::: branch date: 72 minutes ago
:::::: commit date: 21 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511271151.2NTQLEyH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#52: FILE: ipc/mqueue.c:920:
+	struct filename *name __free(putname) = NULL;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

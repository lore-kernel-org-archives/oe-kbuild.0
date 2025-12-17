Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F8919B5B1
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 05:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765947720; cv=none; b=q0TsafkE25fZlgg64HBqVxpYf/xNal8gg8ovN//ZQRlbBVUenZEtNjKdUMCroZ8XAYRvuBa0HHXBIJl9BJGTpM0wyGLOEpdI9u3Eg2vkx+OPkUfIWhcHq2yUpncyuFOFQvMxqp8oEjIKuaY/0//3luLRsBQ2XXs35Nu9TVitFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765947720; c=relaxed/simple;
	bh=kcvgIH2IcLNveKIRsEiTjql2ex2PMoj2IfH5bJ2dl3I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJ+A2Mu5iz8t3FkX36q/LlJ4Ri8xQvSug3xvAsYdw9GVS5dMv0Sh4SG4g2ZTFkZjVS0eVzL4BSvqycS2R9+ta8kB/17/zuP43rTvDi/E2rl3fZa2PnxDytc9v/98qzU+LFaZEdChsnJKdlmTdx+omKjTBJtqM1fBS7cME2tYb2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfBQMWIf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfBQMWIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765947718; x=1797483718;
  h=date:from:to:subject:message-id:mime-version;
  bh=kcvgIH2IcLNveKIRsEiTjql2ex2PMoj2IfH5bJ2dl3I=;
  b=GfBQMWIfl3NtJ1vWCWtITktxbIcbJoPlyksXGTym6uTtpbAqLT2mMgUd
   ZJFvTpFGl+pq7Bvmswq5LZlbXNsmVp1U7CnEpk1mcl4gMZzbheFYtx5Aa
   zv9a8xvZBrTD4w4fpc24EMcwRBcvJAm2DqdKPi8YX8bSxj6tOuntwasRc
   UeR2HCM1nK+b2vEI9YeBoF0OYkHfHETYQkNtUJli4mEy2vPJK/KpY0tMe
   mHM9UtrxEUBXjcExvY8MFZRdhYtju4UeNNsQCdWSfxF8QWVuASPt6js6d
   WimW2qdTeUcbCVCJFwbbhGGrRVMacSci/pr+LrAF1mkXe/6qTPdkBrfm0
   Q==;
X-CSE-ConnectionGUID: ukCmFfewRPahX1UxB+FERw==
X-CSE-MsgGUID: XexhSKi8Rw6Ht+8XwVAKjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71507430"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="71507430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 21:01:57 -0800
X-CSE-ConnectionGUID: hyccONUISfeF8Zt+LF7Rhw==
X-CSE-MsgGUID: Piikg55lSvqEGF5k3lHcDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="197297242"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Dec 2025 21:01:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVjfW-000000003UU-34Wu
	for oe-kbuild@lists.linux.dev;
	Wed, 17 Dec 2025 05:01:46 +0000
Date: Wed, 17 Dec 2025 06:01:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3] hfs: Replace BUG_ON with error handling for CNID
 count checks
Message-ID: <202512170627.NFHfykLJ-lkp@intel.com>
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
In-Reply-To: <20251216155030.1693622-1-jkoolstra@xs4all.nl>
References: <20251216155030.1693622-1-jkoolstra@xs4all.nl>
TO: Jori Koolstra <jkoolstra@xs4all.nl>
TO: slava@dubeyko.com

Hi Jori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jori-Koolstra/hfs-Replace-BUG_ON-with-error-handling-for-CNID-count-checks/20251216-235408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20251216155030.1693622-1-jkoolstra%40xs4all.nl
patch subject: [PATCH v3] hfs: Replace BUG_ON with error handling for CNID count checks
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251217/202512170627.NFHfykLJ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#90: FILE: fs/hfs/inode.c:189:
+	s64 folder_count;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

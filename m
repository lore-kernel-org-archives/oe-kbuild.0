Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928CD25B1DA
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754522; cv=none; b=GNv2Ig+KG3Oh8IF2CNmrKobdilmESni9YedYAHBjIa4N/IykMQfWucBym7+hkCe9KJnydc2UndfIwSGguLH9TRxJk9SGACESamLwURExhsiiLq4+W++uzSLoptxXWPLH5Iv4bQHoeeftqUGhVo/9v5vs6PeU9A9C7vdBRUJ8CYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754522; c=relaxed/simple;
	bh=LeBfvHBPi5aqrOso6tHGxdLtx7ExLz/25my/U1eKW3w=;
	h=Date:From:To:Subject:Message-ID; b=WufIBM4dSBKC8v5mvXEJ3hzCM2T+gfBcW6boo/ge4hWemsI4dJfSnUVuXvKtGE/aNcsoe/OnQ6/WMrB3qKM8KAkWv4TFqFfHcqXXREZ2+I2Fc7kSDHjHcl+ZQKuTJCggMzVxi1aFa97TdPbkLatAd16huvMhhg73vDkLFVjcSOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llTXGrc4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llTXGrc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770754521; x=1802290521;
  h=date:from:to:subject:message-id;
  bh=LeBfvHBPi5aqrOso6tHGxdLtx7ExLz/25my/U1eKW3w=;
  b=llTXGrc43mHk9VFsZIxqzA9BUp6feuyn7BIS30d/qae7e1HFSAS0un2z
   naZcpCwfOXo4UicJ5cijIMNAVGajIOSVNQ6U8PXzqMTELdJByykGSiVxI
   8iEkMjbxhYmSty7CS3737M1yE3EfYjSpFg+l3zVXmew+gYGkKnQNkJq94
   EIReSdUb2wjAh2EIH9evkXh+NpSkjLOX6cEVQOxL3+AVU7WNiZCvF3REa
   M+7zW3yFqddoAmc2ha/2bb/KLVqAbwi4JAiqpYmpd5kgVTyguKG4SCKPD
   woQc886LBU2ErFbd7qGqVx6D4PwNz+gt1gZCHF40ez6RQ0befFxiu5LgG
   w==;
X-CSE-ConnectionGUID: WDT4lMBDRPqQmBD5wry9/Q==
X-CSE-MsgGUID: A9SmaI1ITXqsCMUqxVunhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89307974"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89307974"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 12:15:19 -0800
X-CSE-ConnectionGUID: mxCmkX8GQTyzsigWMEofvg==
X-CSE-MsgGUID: gcRnSxToTbqY4X9LhgovEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212057422"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 12:15:19 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpu8i-000000000uB-0NIr
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 20:15:16 +0000
Date: Tue, 10 Feb 2026 21:15:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 23/23] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602102153.gSvJS9RG-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   4977e2e73efc645e38259d70c86d3b8e80dd3ea5
commit: 4977e2e73efc645e38259d70c86d3b8e80dd3ea5 [23/23] hrtimer: Avoid re-evaluation when nothing changed
:::::: branch date: 26 minutes ago
:::::: commit date: 26 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602102153.gSvJS9RG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#12: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

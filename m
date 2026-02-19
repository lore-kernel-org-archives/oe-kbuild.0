Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527932C934
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 22:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540727; cv=none; b=ru62QhMdW7jQDY6LK1pu1W1MLBuwluE1ksChMIcbXeaaGNI7f3UYfnm6gPGr4tOS30WqPmR044X/mS/46cSuWtV8E6gh4S9gykFfJZbM/DkAhyOONwQ9CjRXbfnKAXMcvvF6IfzEgn6tWEsmUYQyDDz/JAQfGpWLsJ8mi48OnDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540727; c=relaxed/simple;
	bh=UQTdCacovv14FLh2qgS6VPXcQaJaoPKt4AarwWyrq+k=;
	h=Date:From:To:Subject:Message-ID; b=tSTOW/djWwXED4RM9Qv+qkMjKGvnLXNbaNis4Y8oK7/LIJRTbnsLOoopiNtcTUiCvEYhWHw9dsurx+DJipNKuBJKQp8uB9tY6+E/NtbJTuU+8lQU5hhs6DA+eH0ahRoITJiqigOfipF2jqAOiYk+2phdqiRuraeN5kl3+BNPvdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHBecPk1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHBecPk1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771540725; x=1803076725;
  h=date:from:to:subject:message-id;
  bh=UQTdCacovv14FLh2qgS6VPXcQaJaoPKt4AarwWyrq+k=;
  b=mHBecPk1/boAQEJvL4Ya8i4FHXNzbJ2iQU6jw+sM5jjoa8OHcJGS7I79
   aBbdhOUgNOkJaNbdR/nF8Vr0QpcTuZZM9I1LJSd00huYVnDDKhAgTSbnx
   THrqRW90CRWrPZFf6vivqveaYb8Y2DhA9TeU4PFgTuOrXs6LTQ58v86Hf
   Fanx0op9hD1+8NZ8BXy6eCbNLyUuLtgHCOkS0Ob1WvOCnFVe0ztnl+g0H
   l5IuGMEaI+vU90mreGrS75ytMEb9xB1aCll+f8yI6m1EMAyM2YJJgPxDo
   nI2HDkbGjBAw5qS9kLH4l4ksWR7setHQ40GK0dz2eHGC7+9/Dfrtd/aaq
   w==;
X-CSE-ConnectionGUID: 84RZxOFxQrK/fGfwwzwWpQ==
X-CSE-MsgGUID: GIoNepPXTDKC18nyv/M0Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72739130"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72739130"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 14:38:44 -0800
X-CSE-ConnectionGUID: xBRaARZcTlK7/anAGLJokA==
X-CSE-MsgGUID: Js0Y5DpTQlOHp8XPSBiQAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="252367266"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 19 Feb 2026 14:38:44 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtCfR-0000000044P-2rym
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 22:38:41 +0000
Date: Thu, 19 Feb 2026 23:38:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 25/42] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602192358.7HgbkkHa-lkp@intel.com>
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
head:   999dcca32838c24ad84b897eff67f18554b21aa2
commit: 8a407a52a7bbadb7e60638bdc055bdf5cc8a3311 [25/42] hrtimer: Optimize for local timers
:::::: branch date: 27 minutes ago
:::::: commit date: 27 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602192358.7HgbkkHa-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#28: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

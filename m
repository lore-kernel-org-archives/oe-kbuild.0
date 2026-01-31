Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104663EBF39
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 00:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769817916; cv=none; b=CJz7rUiG1rb/Vkevrxpkau/a8wMhYVeAMkugxCBLevEBB+Mvvm74g9mU41IB+0MssLFB7/iHxNTz1XuaWhjSNEK4qMkVFAEEpY2HIxwFva9jHkJEaAZ7Oq1jIXhfJ8056dPthT+K3BKFX+jwrPzXYFJl85q5Vnr+8FSscKKWj5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769817916; c=relaxed/simple;
	bh=tQCgC2N7GdfuNBkCQzSih23ysKsj1Kn/ADf5pcZZ5og=;
	h=Date:From:To:Subject:Message-ID; b=onX0AnjlTaDUwmhxBOYbwy1Lh+/pft+PHyCmQbqeX3traxw9v8zg0hqRYK+O12s6vokpvQYbmRClwNtAIfCSUvtHux80ivf0eB96rwstd5f7/KPEUG/SaQjBhUzgIZJ5+v7iVHSCOObpzQeOG2Ia+BrXcWa5XEpXXDX2akLc98o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLLAgMu5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLLAgMu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769817915; x=1801353915;
  h=date:from:to:subject:message-id;
  bh=tQCgC2N7GdfuNBkCQzSih23ysKsj1Kn/ADf5pcZZ5og=;
  b=KLLAgMu5TmIhq4oddg2DHX9cumF6aAjC5YQAnCpbDahAYeNWqf+yB4Rj
   nyoZSdLAC2KeVvM/iG6TQb0zJJ4xQHpAnuAUPvjqNWj/IQNiQudBAh8Kd
   POkVmtDuJcOKDOXTH0ytpTXBGHlOaXO3uixzWLE7gzHBDwx2njGH7py+h
   sPJ5rBV9yTOVVE6kCD+lPVObMHOFcFY61sqoSnxq5IFkuJWWfCvr/blcE
   NnKE/9gXuSlZdoVcTKdKpjEWEhphCdPyOProuqjuuKjEC9vBi1CTn5OM/
   ssOZFpVIEc3M1Xwt27nvHbfNnlH06Jg6tlhrHPyA1zNlueTRwjYAvh8/z
   w==;
X-CSE-ConnectionGUID: paCBKoo5TieMlfeFhFLWVA==
X-CSE-MsgGUID: 35WlBuuxR9igCke2CpLl/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70275571"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70275571"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 16:05:14 -0800
X-CSE-ConnectionGUID: JASZyzv4QmOJv5klMGHFjw==
X-CSE-MsgGUID: elqJaHZDQViPLjj6q5j60w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213480330"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jan 2026 16:05:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlyU8-000000002a3-01MC
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 00:05:08 +0000
Date: Sat, 31 Jan 2026 01:04:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream-20260130-1 8/23] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'send'
Message-ID: <202601310159.RJ55b4Lg-lkp@intel.com>
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
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20260130-1
head:   8613a3fd5b6e088624accc0967f5a063f0dd02eb
commit: c8d1323860689969cc053e61dedffee3b98fdaa0 [8/23] RDMA/hfi2: Start hfi2 driver by basing off of hfi1
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601310159.RJ55b4Lg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'send'
#1454: FILE: drivers/infiniband/hw/hfi2/hfi2.h:1422:
+	u16 first_send_context; /* first send send context to use */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

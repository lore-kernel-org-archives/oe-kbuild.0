Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67569306B37
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754521; cv=none; b=DkDyFDXOyShhB5s+W+zrS4JCSXK4EAwX0rFZEVgk37dp2TI1j1zpBaZk820I+pPsF+VMDQbPGcYcDppwHJkAtZHDBRabC5i1jKMt4nQsuEAkthU/fe+t3wm7iDDFsgY5jE2gpdoRa+9RrS/8IQ6b8ZUGQnz5eReEcMBTPSLlVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754521; c=relaxed/simple;
	bh=lV3qijC4cwE5dSX8qOSiyLif2Sx6WRSjppPlHxZtG/4=;
	h=Date:From:To:Subject:Message-ID; b=WwEuN09vYzTpb/UUXJL9oP3aqD59z0hu+yPvonDdpQZdb0fRC3XMEGc8vOU9n/+99GY3CDtuJ1Kn6YJb6urcbKGoimsKVT7+me5ZRmCWI96i+NdxKKTQVXbEFdcyqhL07qhkYNPjCg+2kQed5MFccexykPJiCN+5dxua6IRo5r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XiNeDjr2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiNeDjr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770754521; x=1802290521;
  h=date:from:to:subject:message-id;
  bh=lV3qijC4cwE5dSX8qOSiyLif2Sx6WRSjppPlHxZtG/4=;
  b=XiNeDjr2A1BcJwWR5HExfdYe/Rtn9yaL/lyOfyt4yNbcnezNf4LI5tl6
   ctXyt5YsG48bCTSGz6uRVWz+DdKo8Hsib1tTlGDJPv5F6vq4c1pYs9fth
   4vpamOcSrufnI7XjOyo+t4oYhwD+Xjq0l/0qd2BrLYMbX7oWf6DRV9UXF
   NrNafYDPmKzexuw0iCs4Ok2pVgp1EiS4pu0jhzVOOw04aKcnFrWwZcQa6
   +cgczGrVG+bh89BzzKtH/mV5lPpYYNEXrRXnCVDA+6MQKMa3a2Cul4heS
   dQIO3XzmMZMSJu/8sBXAGgp041Z+bALIbwxMGgHXx9Fjr5AD8gLsbDxXC
   Q==;
X-CSE-ConnectionGUID: sv08z1jUTVSZbXvxcrOdPg==
X-CSE-MsgGUID: ZQV694dpRFm5QfwFgEDVHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89307973"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89307973"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 12:15:19 -0800
X-CSE-ConnectionGUID: kKNmXdAcQpypLBGkv2rX6A==
X-CSE-MsgGUID: KmazFRoFT0qaOlLxMsLAAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212057424"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 12:15:19 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpu8i-000000000uD-0W46
	for oe-kbuild@lists.linux.dev;
	Tue, 10 Feb 2026 20:15:16 +0000
Date: Tue, 10 Feb 2026 21:14:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 6/23] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602102104.WDidpz7W-lkp@intel.com>
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
commit: babbc346fc454299074ac5a9c46a1df1e6d3e858 [6/23] tick/sched: Avoid hrtimer_cancel/start() sequence
:::::: branch date: 26 minutes ago
:::::: commit date: 26 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602102104.WDidpz7W-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#25: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

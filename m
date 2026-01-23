Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144223EBF01
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769204787; cv=none; b=j6qvIlLaJ3LNu8bgXOjirdsB/cv+L9IUfUsONbL3DpJ2jNeyodXwkU7b0gsIMMO92XwLiK4MGUPB5T1q0ryD4ealRgPvJ95zJFQextKg2cuS0NuoJyi1MzSqu8vG1ZxmzkNFcmCOjHHSOiFrZ1q3SGK0k5pmdktk/iuCMfI3ShY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769204787; c=relaxed/simple;
	bh=p4evSkJSOiFfC7LqMfPqS4fWUCLGKf/mnVxpjOjrpwU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lA2FwM8hWyzv1A+Sl8QYwvndzSbmnaKLvw8B1a7v/IzNx251CZnZpLs0sZKWIN/ccQOFbkOtqEfPc4OKoyOkSKwiSeP3bch0EWPlhd+7yAF2qRYK/fuAmtlK3aJ+2Au3tshBAdcjY6ZRkzR89XIlWn21ThmokQNXc7iMZwOm//k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzO3mdWL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzO3mdWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769204786; x=1800740786;
  h=date:from:to:cc:subject:message-id;
  bh=p4evSkJSOiFfC7LqMfPqS4fWUCLGKf/mnVxpjOjrpwU=;
  b=nzO3mdWLr7EMMZvdDmj9z2gALcZ9ZHBceHuyZLWTsXZ9vct8QRdC1hD4
   wGaQfNCjDb6M8GXFNK3KRn8RgV+AU2pWaZ4fdxCxba4b+Zs2yIn2Z2Dw2
   x4tZXNJCxAcFSKAngEvc+KzFmoDKzFoXkYOpbw3VsXZf4d1mhVLJdpRE7
   y99TDqmJDnsG/T8PsUUG4bV5yzdbjReEtIcX+r7EHF6RJLBVoZHtuKKZO
   w/hwtE+/OSueCqgefHPSC3rZoX3p4awWdTFR1rmaEiAh/6Jzctn7BCJga
   /AKuS8YvYADKeFvS4tc2FSM3aiN2bMF4s8mAeN6UNgrZ5vlcNfvlGDYW+
   g==;
X-CSE-ConnectionGUID: t+Eqi4GzTDqScGFmE+GKOg==
X-CSE-MsgGUID: YgfioLRgTFuWO2+w9xzGpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70512342"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70512342"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:46:25 -0800
X-CSE-ConnectionGUID: f5pNREWaQD6OEObYfsN1Wg==
X-CSE-MsgGUID: r8FClYMcQmO4qrGkd6P7mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="230084326"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2026 13:46:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjOz0-00000000UUw-1e47;
	Fri, 23 Jan 2026 21:46:22 +0000
Date: Sat, 24 Jan 2026 05:45:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:scrub-syzbot-fixes-7.0 11/44] clang: error:
 unknown argument: '-femit-struct-debug-detailed=any'
Message-ID: <202601240506.8hNhpop0-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git scrub-syzbot-fixes-7.0
head:   2d76e519f5fa0d3323cdd2ce3404fc19e6c23f3d
commit: c45a0220071a896d5492a1b839c518327df54f9f [11/44] fs: turn on more warnings for the filesystem code we modify most
:::::: branch date: 4 hours ago
:::::: commit date: 5 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260124/202601240506.8hNhpop0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240506.8hNhpop0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240506.8hNhpop0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unknown argument: '-femit-struct-debug-detailed=any'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

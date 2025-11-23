Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E219D154BF5
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763874055; cv=none; b=ULuxgFZxxSa41t20yx0REtPrOnhhWm2aaG0g7t6WnSELYS8h+YP5fy14fAh4Uw7lre0URK85wL3qLOUg3PDVn896uMd95rb0Wg3W1rsRHJ0ZiSIQtDfd6DThuCg1wd2/dT/u/zb7KGc1M80kQs9Y3+ZkCPuSr0ZdEjm5SM5Ldh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763874055; c=relaxed/simple;
	bh=r+EmIUrne2lzqwICsVi4mASFC958q5gIgFqVRXTqoPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o0svAHCtgSTmr+Y6i6BRx7gal1gGTg58uA2DPWrk/V92Ep3AzUVRwJmUeq7nVTU07n78FDuWRXYP7dlLv0jr1qaawzo5fP02YRhRaROcyq8NG+zoNpF/NixI96pdOw2fJXdam0R/gJBLwt//MP1yiv5s+Kp/EsT0S7IOcEM+p/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uw8uwRKN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uw8uwRKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763874054; x=1795410054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+EmIUrne2lzqwICsVi4mASFC958q5gIgFqVRXTqoPk=;
  b=Uw8uwRKNS+s75H1deC77/jcAT71eyMRjU9JH/e57/NdeZfSkLuUZLQ1e
   nLGhXrEgEvYualenGZVto7fKKoHAkVdzkO9NmuFpFB8oJYEwIAmcI5a5w
   8YYxSvq/8hO2hQ6qOvFxl/RDheBLs7zE1KN87rn0A6WhJRNLW6OAUxRQk
   a9/Xf0Vq1hy0GHTjhD2jA1fsIs8UhBS6R6ZMHkkSPPy0vbHa+2NyRXCPo
   6xZKSPk0O1539CfTi5sY6F4E35+nwMhV3AuA1+WAo71qPkwaOunZZTzaR
   qiCtVHAs+BUUffqzgZMxMmU85MEKtRxwtteetRMs9/UVbztLNusI2PcGs
   g==;
X-CSE-ConnectionGUID: B4a7FUFlT46FOce7iI3E4A==
X-CSE-MsgGUID: l210Z6jeQFiGD1gYRCyKNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69778169"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="69778169"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 21:00:53 -0800
X-CSE-ConnectionGUID: MtD5smWHRlCUJswlmbQ2EA==
X-CSE-MsgGUID: J1JN51OtS0WzicOPEBg/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="191706164"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2025 21:00:52 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN2DS-00083b-1F;
	Sun, 23 Nov 2025 05:00:50 +0000
Date: Sun, 23 Nov 2025 13:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 86/104] liveupdate.c:21:10: fatal error:
 errno.h: No such file or directory
Message-ID: <202511231253.aLRTg9sG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   5b8dc8b45ebd9e7f3fea3adefeccd9ce94215103
commit: 2c55496371f19ce7570897a3d7b807d0a2b04dd9 [86/104] selftests/liveupdate: add userspace API selftests
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251123/202511231253.aLRTg9sG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231253.aLRTg9sG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511231253.aLRTg9sG-lkp@intel.com/

Note: the akpm-mm/mm-nonmm-unstable HEAD 5b8dc8b45ebd9e7f3fea3adefeccd9ce94215103 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> liveupdate.c:21:10: fatal error: errno.h: No such file or directory
      21 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

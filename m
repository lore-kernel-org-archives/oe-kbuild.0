Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D9B1427A
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768281497; cv=none; b=RP/kevRbM1aoso5nYaXaEBsIKRNu2gW2dafOffegivbIVfHyCqMBY0ElYR8Jbkt5T4dBuVuD9oxP6kPQhx8IIgU8bDRnxH6aaz1Xb5Z7GE5mN5XkBXCLk2+6WiCUjw6i06CliPeIpCzgnSdp3y1wcNhMeAkB9CCEGUkhQqnDTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768281497; c=relaxed/simple;
	bh=ZtipwpcBuujdc7ZbqKtR1xeDk1klPHgu5KEmdzFveHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CjDrZHp8cWzTCKKxTsdKtroVxeQV1TInY5h+WcuGH25sNYNwPMNLyDhCiCc2odkwx6O80BoA9PLOkbh+UiSWFb+U7O0jdPGhPTcmzZd7OQW1UBVYtBvSUBqL1we7iIR6o8uSbqEr/iE3un+QZjY1/zXc/iNEt8aOpVhvtkhnJlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfbh9hTz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfbh9hTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768281496; x=1799817496;
  h=date:from:to:cc:subject:message-id;
  bh=ZtipwpcBuujdc7ZbqKtR1xeDk1klPHgu5KEmdzFveHQ=;
  b=dfbh9hTzjeelkjpwp0NX7gBFehuxWQEP9wcrkj74Fn3U1BMhiBAeqWe+
   acCFRchTKV9S6FMINvPHlAWT65sOV7CUd9dj4dVAhGM2lLTKJggDBLEsF
   GKNftOQlwkSozDX3T1A2cxbEkXwaHgrHYFTbOa3+9jeiRbNn+ok29GknM
   ckReTiyK1BO9LZbtHM8lSDb7EZ5wvfYwNXaRZ5Uoo2fveD5Rhs0BLcS6n
   iY2knxAJhyePHkEhnr8MFGoxRudMEnA8kTsRB3wSFmsBz9bahcs6qSkMT
   uxmwWboc802A4rW9Js9YAo+a/fkyi/vPV2OTtR/TWb0QMhW6MbZy8qU46
   w==;
X-CSE-ConnectionGUID: m1rXfQEGQx6leVOQP1Youw==
X-CSE-MsgGUID: 3himnL7jTpC/SGdJzmIEJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92229656"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="92229656"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:18:15 -0800
X-CSE-ConnectionGUID: yeAAa7oTQkOdTJMHr4fqzA==
X-CSE-MsgGUID: NOwFj/U1R5aM2jxqbdey2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208750207"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2026 21:18:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfWnE-00000000EFg-1XDX;
	Tue, 13 Jan 2026 05:18:12 +0000
Date: Tue, 13 Jan 2026 13:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/shmem.o: warning: objtool: shmem_writeout+0x3a8:
 unreachable instruction
Message-ID: <202601131318.4ShokUvf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Christian Brauner <brauner@kernel.org>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 7b73c12c6ebf006ad496f0e38a605d92dfe05157 shmem: Add shmem_writeout()
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260113/202601131318.4ShokUvf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131318.4ShokUvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601131318.4ShokUvf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.o: warning: objtool: shmem_writeout+0x3a8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

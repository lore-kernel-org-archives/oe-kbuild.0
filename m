Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791A39FD9
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 00:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767831685; cv=none; b=jngLDJDXbNUI9YW2Is5E5ZYCxiCkksq5asGGn5Uu3tVnSGcZo4KRG2o1ZU/a0ZeJFKRphxguS+AQDTRYERZY7O5Hx4mazFEqo7dbQ5rNnoUKcwEAlYXQAE66DE1IDCH4TGCMAj+B5baDT9JPBP0G5P4iTYjHMmYXyDZwyrdTCKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767831685; c=relaxed/simple;
	bh=Keo81gPJFRkHTGwoXKpZ3pMSltyRL8JHyL7ch+NkrfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D/9OnbtO5C53jKpf1xViHkHH7ycoyXmn3izUJNlDhXt+DisAircBCbFKvC8Q20XnTkkbMQn8Qr8MNkZYB6yoRYF2SxnDSgp7tRHkxcrlgG7+qV08ZgkV/qhK8KyImmaWvVNic42p3DzdaZ7xDfvR5OW7zaE0ve5z45VD+Q23j6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g9yHTm2x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9yHTm2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767831683; x=1799367683;
  h=date:from:to:cc:subject:message-id;
  bh=Keo81gPJFRkHTGwoXKpZ3pMSltyRL8JHyL7ch+NkrfY=;
  b=g9yHTm2xpxEAmOlXS6cWrTJVh5NTaI+1PFpq6idFfTxo0KbrMh0rkPar
   b4CagwEjf1yDbIb5oWGCdHOI6dmFg4bcoicliIfaCdh/Tulv1oQrfgb6i
   huT80ppOxBn7ztzYpFCMYYvFBn6HJ9m+xPJ2Ls/bN0guK34AjQHVeSxPI
   Mj3FhkLbl9r6Mfjm52EX4TOi64Vi/oUFDLcxaNTYScoow8XrT5Lt3dQvs
   vcCCw0W4Rn3XIXlCXGPjKh0VAugVmid0p3uBllw8TD+wl6VMRTHGVtnB9
   zSRtAedlLkdrMRx3vQb2oRbmbTitg5j4TD2g9ZWZx1kTipfhRcvHt9fIJ
   Q==;
X-CSE-ConnectionGUID: 3D/BxSbsQhyru4P7PlA9oQ==
X-CSE-MsgGUID: 0XaUAnhBQLGGQmfecWGDYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68400365"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="68400365"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 16:21:23 -0800
X-CSE-ConnectionGUID: UXI3S1gwRfCJqlR7eyImXg==
X-CSE-MsgGUID: RZO9wxTvS8KPi2sgXe37MQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2026 16:21:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vddmB-000000004Gb-49Ms;
	Thu, 08 Jan 2026 00:21:19 +0000
Date: Thu, 08 Jan 2026 08:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/i2c/ccs/ccs.o: warning: objtool:
 ccs_set_selection: unexpected end of section .text.ccs_set_selection
Message-ID: <202601080801.Lpr0nAXC-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: c5995abe15476798b2e2f0163a33404c41aafc8f objtool: Improve error handling
date:   10 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20260108 (https://download.01.org/0day-ci/archive/20260108/202601080801.Lpr0nAXC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080801.Lpr0nAXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601080801.Lpr0nAXC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ccs/ccs.o: warning: objtool: ccs_set_selection: unexpected end of section .text.ccs_set_selection

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

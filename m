Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E0B27055D
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242292; cv=none; b=g4J9Iza5lVh8mqoYHlmTYF7YOE95jXL+93fEMRgfMqQfEKVzxWhacVKKUnaMM1LI6rNDaN9wPsD8gJi/rtDGGvS65uxxmXsVZP5IsxiGTSCrB+GebpXFY7ruO4TpPzWVa+El6FhYS33MDTBcyTxRLJH1rsh/G5oe+qzdkfORvK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242292; c=relaxed/simple;
	bh=R/KZdJXWdpshPdEdAIOMHSQgkzo/dQw+aqk+b+fCy4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pxr+dTV4UqBL9W6tKMEGH0rlu1YV83CLeQj1J5eag83XELRfvi+qggQNbwKyvOV7rvRnFXmJgR/gBnYz+9dctc3tVIN7rfH9TdF7ZhV7JzbETyLr+3og18NbitImaqfOp5SJgc3391qHlFQnwwfV5EXphHF1e3++JuO5wEnTkiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMikx+IF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMikx+IF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771242290; x=1802778290;
  h=date:from:to:cc:subject:message-id;
  bh=R/KZdJXWdpshPdEdAIOMHSQgkzo/dQw+aqk+b+fCy4s=;
  b=PMikx+IF6nMwEqRwgDNi3Q/FtKRbf6nCiHv4lQ07Z+5TtybP5V1dAkwM
   g6/TT7DzMbeDt8KuoiDOwmfxtkMYyIEBXDHAGl/ldYro9LIf65DhTTV7v
   jCrY5ni01nc/T6CBNsKLcEmNtKpPFhMTrohhlhHN8YSNbbDvy1X0xINCU
   pjQn0YyHE0qBlpa6svypHJ5AQI5g/jkS7Eq32qQG+6nLiAUQ4t9wE92B2
   QLncxXjASyzJhqxmkq6Q1GUTKxrnv/JuacRBbzn5TA0qWDa5ZcojTE3RS
   mH/tcUNATfmc8//GDHGIXML1iFoQx30STk1jWwayrVDYQlmbH1SdgUS1M
   g==;
X-CSE-ConnectionGUID: np2uBWBIR8+H1r/vySikfg==
X-CSE-MsgGUID: WAcf5n1BSiyaCrcn1DlL+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72227985"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72227985"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:44:50 -0800
X-CSE-ConnectionGUID: OGMiW+OeTNKRmYTxi2wQfw==
X-CSE-MsgGUID: gYRK+i9gSHChoKTGo53FQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212838015"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Feb 2026 03:44:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrx1y-00000000zig-2fms;
	Mon, 16 Feb 2026 11:44:46 +0000
Date: Mon, 16 Feb 2026 19:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool: bmi160_setup_irq(): unexpected
 end of section .text.bmi160_setup_irq
Message-ID: <202602161958.LUnQuwXd-lkp@intel.com>
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
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-r072-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161958.LUnQuwXd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161958.LUnQuwXd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602161958.LUnQuwXd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: bmi160_setup_irq(): unexpected end of section .text.bmi160_setup_irq

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

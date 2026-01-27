Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A13491D3
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516427; cv=none; b=hmqVDM/4ht5quPAx9/TMT6On0YtCy5cDe2w+sG3UMPEaIMVt07csBvsDtFMAsA2OrXJBde6p5D0uvviY5Lho/ekrdPuN3fPNKPPtpEtyKJ8UZtgq9aodQ4ucoArG9mMCumZyPIbmi7K+IVUQckN8IsHyEJG+9KToRqLwtAuiVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516427; c=relaxed/simple;
	bh=J+u/kPholtEDDG/JhJwR3Q2e8je9ue2spRybF6pFwdc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EALvzcjMLBLpx4kdcrJ3wBeqBDfZOEa1fmL7KSoDUu8RMLVLOrWMT7KJrX3t7nCzdB8Rhg6rdofXicI07cJ5q/I0hLuwWCARnRsS+Pi53/aY5QLtfCSxPV9gR0ao+TBsboLWBrgTHu75/HqS7avC/drrysGC7Jt/0W0jcco16gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKduCtjs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKduCtjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769516426; x=1801052426;
  h=date:from:to:cc:subject:message-id;
  bh=J+u/kPholtEDDG/JhJwR3Q2e8je9ue2spRybF6pFwdc=;
  b=SKduCtjsqwxSX+HCiSYDxdItBIp7Vl0FCfLM2mFyNwK0MztpwVZSMS3p
   QZfUFRefPk2WPgy5vwcCOMxAFjyVNM7RGUydxyNbi6g2IgiCQJsGE0ebX
   c8u9lLMIB6EszLOjE6MntZ8qojgqPXRdmqoXgh8QF7BfowrEC6pqYSJ1h
   9njKv9HCDFgdLrjLkjdUFAZe4i3Op6uMgKFPerWmUX1JKLgccIcP5dLxM
   W7L2/CztpsSP9bGzkt6qoA9Nmm7rbXW7efGrKePmjNTX2JE0JGSmH2nat
   ujtb3fT8+evlN/tE/XXuEVKDFp3caaD/WEUHsK/vEgcnPB4lB8PMU2pYP
   A==;
X-CSE-ConnectionGUID: h+umWK/OSIWvAs0bljLyDg==
X-CSE-MsgGUID: 0AO9Jc+2SCi41UsfXNOdIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96173785"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="96173785"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:20:25 -0800
X-CSE-ConnectionGUID: ANYUb2nwS5yX2Y1YbiO8ng==
X-CSE-MsgGUID: 4FY+7PtISKSHnQyIyyewnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212823038"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 04:20:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vki3S-00000000YSQ-1gVG;
	Tue, 27 Jan 2026 12:20:22 +0000
Date: Tue, 27 Jan 2026 20:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8913/9596]
 drivers/reset/spacemit/reset-spacemit-k1.c:302:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202601272001.443INwBc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/reset/spacemit/reset-spacemit-k1.c:302:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Guodong Xu <guodong@riscstar.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Alex Elder <elder@riscstar.com>
CC: Yixun Lan <dlan@kernel.org>

Hi Guodong,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   615aad0f61e0c7a898184a394dc895c610100d4f
commit: 2875b4b5d2657ff2fd979103d88e9afcae51481c [8913/9596] reset: Create subdirectory for SpacemiT drivers
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r132-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272001.443INwBc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272001.443INwBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601272001.443INwBc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/reset/spacemit/reset-spacemit-k1.c:302:1: sparse: sparse: bad integer constant expression
   drivers/reset/spacemit/reset-spacemit-k1.c:302:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/reset/spacemit/reset-spacemit-k1.c:303:1: sparse: sparse: bad integer constant expression
   drivers/reset/spacemit/reset-spacemit-k1.c:303:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/reset/spacemit/reset-spacemit-k1.c:304:1: sparse: sparse: bad integer constant expression
   drivers/reset/spacemit/reset-spacemit-k1.c:304:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +302 drivers/reset/spacemit/reset-spacemit-k1.c

c479d7cf06c3d6 drivers/reset/reset-spacemit.c Alex Elder 2025-07-02  301  
c479d7cf06c3d6 drivers/reset/reset-spacemit.c Alex Elder 2025-07-02 @302  MODULE_AUTHOR("Alex Elder <elder@kernel.org>");

:::::: The code at line 302 was first introduced by commit
:::::: c479d7cf06c3d65532442fa368b058e05dbba1a2 reset: spacemit: add support for SpacemiT CCU resets

:::::: TO: Alex Elder <elder@riscstar.com>
:::::: CC: Yixun Lan <dlan@gentoo.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

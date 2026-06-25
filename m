Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A630594F
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jun 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782370340; cv=none; b=I+cNU1T1Wvja1e39BeRaQVeN3hF9xV/sdQl/aXd8ExRBMXHyVV7o0T5ZxEtt63YQVHDIr97myMp8gpafNEkCvEh6sfN/yBljonjVY+wRuxClT+OZo04FlYogXZsQIJyq1T3E7oNYYPmQzzpCegtQJEZoEHAwk3rQvQ25FIMgNes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782370340; c=relaxed/simple;
	bh=VoFbg9Fg2UIqvuWwwYcrvQLfEA5GeOXXB33MjuOUGSo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h/5RY+qrv8qCf1pf2du8Yvqx6w49X/Hea/gb3TSnxc8uoYQJifuInDffnYZ7KOm5/5XkCH8SYDwoXO2bHLXOzzmwsV2KFPWNbKsfy/k7vJ8FcsUBFxXxGHmEFYimp1m8UdTgXUkGFNoVR6jkOcvJoRm/MPlznlfBDrnITVMPs20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxTUOEHg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxTUOEHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782370339; x=1813906339;
  h=date:from:to:cc:subject:message-id;
  bh=VoFbg9Fg2UIqvuWwwYcrvQLfEA5GeOXXB33MjuOUGSo=;
  b=KxTUOEHgyurFMiOVr2IQFEK7RnAyTwjCwMKQqhBVVR8c5pg33z4FpLDM
   pfhO3kr69FDevTRch54dFNpl2yK1Sfvbh8oLvtqQ7ak1RJdKkX7xih5Zu
   qUmaaa/5zc25ID71ENU9OHIRl4mak1StMRjphjTOdVq1W9nLnFWVA3R8T
   DrHacRI9/fpR0Sn2c4Pfa/hk3dzQnJ8mZo+L2dP5YMuOx0ObfdrByyxCZ
   oQlLC+T5BFNF+y1vmYwkjS4jxxRPjv0DHwyl0KGbecCvkbmtDDVFYXnQ9
   Jpj2sy3K43EvBLzlnE3xoLj5FsZ79F/9cXTdTlslvYTshMfuCve1SWcRc
   w==;
X-CSE-ConnectionGUID: QK0b0BOmQZ+cqIzHQHt1lg==
X-CSE-MsgGUID: IrBpPRlLRqe66kzNfll56w==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93498899"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="93498899"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:52:19 -0700
X-CSE-ConnectionGUID: m4mqTsC4Q+idVwhylIU/gA==
X-CSE-MsgGUID: 4bvjJRjnRYSi0YIQfD8cLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="254611180"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Jun 2026 23:52:17 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcdwd-000000006TF-3ESX;
	Thu, 25 Jun 2026 06:52:15 +0000
Date: Thu, 25 Jun 2026 08:51:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [paulmckrcu:dev.2026.06.16a 56/59] powerpc64-linux-gnu-ld:
 warning: discarding dynamic section .glink
Message-ID: <202606250855.VAVrrdSV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev.2026.06.16a
head:   47ca6a8aca98b11c9cb2a1a25597f94af559524f
commit: 678e86682304b42825f4af62b8b954c4e14874b8 [56/59] rcu: Make rcu_gp_cleanup() account for ->dqs_blkd_tasks
:::::: branch date: 13 hours ago
:::::: commit date: 21 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260625/202606250855.VAVrrdSV-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250855.VAVrrdSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606250855.VAVrrdSV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-gnu-ld: warning: discarding dynamic section .glink
>> powerpc64-linux-gnu-ld: warning: discarding dynamic section .plt
   powerpc64-linux-gnu-ld: linkage table error against `rcu_preempt_blocked_readers_cgp_ndqs'
   powerpc64-linux-gnu-ld: stubs don't match calculated size
   powerpc64-linux-gnu-ld: can not build stubs: bad value
   powerpc64-linux-gnu-ld: kernel/rcu/tree.o: in function `rcu_gp_cleanup':
   kernel/rcu/tree.c:2223:(.text+0x10fb8): undefined reference to `rcu_preempt_blocked_readers_cgp_ndqs'
   kernel/rcu/tree.c:2223:(.text+0x10fb8): call to `rcu_preempt_blocked_readers_cgp_ndqs' lacks nop, can't restore toc; (plt call stub)
   powerpc64-linux-gnu-ld: final link failed: bad value

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

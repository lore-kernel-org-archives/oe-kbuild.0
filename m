Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFFE1FC7
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Apr 2026 01:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775264871; cv=none; b=VOIqJH7552MFnwCFommkhnFJhjrxruEJcdMA5/lKIP1PIVP0FeSbEcu59C34+wvwNZjpLBe1ebRUE7uaYV7iD4qqioUsOtJ8uE/FKt1nHaTdcW7FJVuLOcVWd1op3vvect3jtRm2e/Xc60BEz9N22QA6MncJ2ayasrvFu4uP85U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775264871; c=relaxed/simple;
	bh=8OwaPcxjZSJM4fas+cYiIaToH+/6n4pKhrH1B9vra+k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VWGxUOy69nPvrQ2URODcgix4SwSlw2zBhLwBmpZnZ2yw1ACDklt+H8EM/0noUQLML8moHCstKPZxS9mTk9vnDpukvPVLIfewWJXmN23DoTdHF2WIzfZT7FroT2IVDHoEy8Ny+PbM0ByvMft6KbMbgPbucRzHOTy8FO/A5x+sM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lvq4MgR4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lvq4MgR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775264869; x=1806800869;
  h=date:from:to:cc:subject:message-id;
  bh=8OwaPcxjZSJM4fas+cYiIaToH+/6n4pKhrH1B9vra+k=;
  b=Lvq4MgR4kA/yiBK2yJd32eXcZYmeVI0UtNhYOeVzDBV+IdpfrA03tj3W
   1U9rN/97bwLYLwCoSOb+kP7dJUaNVZ1SWvtR4ujwrceSmQgo8m+UYybVn
   R66f0MpQshFWsqTl1SfkqswFAsw9S1qalq5q1FIVY02QcWfxXs6uUyKqU
   KZJ2NebjTR9HZaUsgH4OHCYfKtmSOVKmATXdFDf1364iQmJHzH4XZReMO
   CVlQvv4KhKYI17Umg1IKP4SoohLDTGo4sSjz11bpxhKXWfpKQzsWCWOOr
   7bcdwMCdw4w8LAJMA0SzmmI7Mhlz2NjyfhPk+B4bM5720Hbx9eykzFsQw
   Q==;
X-CSE-ConnectionGUID: faRBqrIoR0+R6EC1T4Hczw==
X-CSE-MsgGUID: nnVpohevRVe2rEsaf6OrYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="101777428"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="101777428"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 18:07:48 -0700
X-CSE-ConnectionGUID: mc8mQjGES0OLEqy5DrNa7A==
X-CSE-MsgGUID: 5Om6KnLbTgORwlkdeKNWqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="227255722"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 03 Apr 2026 18:07:47 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8pUH-000000009U1-0Bbp;
	Sat, 04 Apr 2026 01:07:45 +0000
Date: Sat, 04 Apr 2026 03:07:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dwmw2:its-stale-dte-fix 2/2]
 arm64/vgic_its_stale_dte.c:119:13: warning: 'its_restore_tables' defined but
 not used
Message-ID: <202604040231.BZHH8qnj-lkp@intel.com>
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
TO: David Woodhouse <dwmw@amazon.co.uk>

tree:   git://git.infradead.org/users/dwmw2/linux its-stale-dte-fix
head:   d0b15a60478dfed25590445a47817d6c89ca136a
commit: d0b15a60478dfed25590445a47817d6c89ca136a [2/2] KVM: arm64: selftests: Add ITS stale DTE regression test
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260404/202604040231.BZHH8qnj-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040231.BZHH8qnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604040231.BZHH8qnj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm64/vgic_its_stale_dte.c:119:13: warning: 'its_restore_tables' defined but not used [-Wunused-function]
     119 | static void its_restore_tables(int its_fd)
         |             ^~~~~~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

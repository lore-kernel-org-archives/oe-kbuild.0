Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B1A2DEA89
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309958; cv=none; b=LsJOP2Tk4dRrnpPj2W8IIwiuNnYk2b0vmI4f0WJL0Vrjd9fpjwKdTJmK596cO+JOpCrdTC9dhsiyfV2ujODqJXfSrU6dSSTlowSNjBGVQtSSC0adCyoy4SRImzKQEozV2cm7DhFe1nm+/Y/eq0DMB5wnEaLS7fa8JUkjvHTq3m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309958; c=relaxed/simple;
	bh=aMIweVRM575TLs2/1ZzyBrRBX66p9qiGVsE0yKTjoaI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XaK5hE2XDO8zScp2LKBAqBQ4JKfJfrTEHzheB5qrTmnRgkV7t5zvwEV43cDjEDh57HLNYzOBptFgHfKhda7cP2tyKTIOz6WaAtR36tPWthZsy7kAGVm1IStSsZz/vc2CZ62BDQjrjsmOcpIq/d7fpT9zJyqbqftMS3OojxOCCg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuLLpfeb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuLLpfeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309958; x=1823845958;
  h=date:from:to:cc:subject:message-id;
  bh=aMIweVRM575TLs2/1ZzyBrRBX66p9qiGVsE0yKTjoaI=;
  b=BuLLpfebHM4B6WNIFf6rkpSRJSxpNmh73AbJS9bkHB6QooLWt9tlGFK1
   q2WIHgHkIbeqo2o5ZlnAxAJNa6gwtDO69LecsNeNXDyrBLQzVozhn4MQO
   LTwMFvY+MYCoPsjHbg4oU2dseQRwzZ3RRiFpULRPffpB/7O6YZ0xcvDZe
   J4MBe6ycNHz5fJQFwvhXYOe/4ppTD8av5y/PLaX7jEbqqh8m7P3enewyA
   9vZ0J2mLNu53K/ipyAtO/d+0kw0nEKTXDeggxFG6+zevWA8ATkSX+uPg6
   qIpsYWRx1/cjj1taEgY278wJJn5cRonkhfTNt5eXNS3UryQp5LYn/mC3E
   g==;
X-CSE-ConnectionGUID: SO4rogCjQxWwQ7p1YucAUw==
X-CSE-MsgGUID: 469gKS51S+CdeRwi9lNWaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908841"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908841"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: 6PBR6VPBSB6mt0Q00lHSsg==
X-CSE-MsgGUID: ua+Ao4MUR+i9+f9viw0+Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115538"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh2-000000004xE-3t0X;
	Sun, 18 Oct 2026 07:52:32 +0000
Date: Sun, 18 Oct 2026 09:50:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 15601/18293]
 timer-mediatek.c:(.text+0x359): dangerous relocation: windowed longcall
 crosses 1GB boundary; return may fail: *UND*
Message-ID: <202610180721.HIPlRuDL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Luca Leonardo Scorcia <l.scorcia@gmail.com>
CC: Daniel Lezcano <daniel.lezcano@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: 7a097aba725501c399b5e93d0199aa3a2f6e9c88 [15601/18293] clocksource/drivers/timer-mediatek: Convert to OF probing
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: xtensa-randconfig-2001-20261017 (https://download.01.org/0day-ci/archive/20261018/202610180721.HIPlRuDL-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180721.HIPlRuDL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610180721.HIPlRuDL-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of drivers/net/bonding/bond_main.o: defined in discarded section `.exit.text' of drivers/net/bonding/bond_main.o
   `.exit.text' referenced in section `__jump_table' of drivers/net/bonding/bond_main.o: defined in discarded section `.exit.text' of drivers/net/bonding/bond_main.o
   drivers/clocksource/timer-mediatek.o: in function `mtk_timer_probe':
>> timer-mediatek.c:(.text+0x359): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: *UND*

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

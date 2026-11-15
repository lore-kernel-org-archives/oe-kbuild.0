Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756485;
	b=tst9MVEXIxi1X4sC6r0LRfv/DG/S7SSY0d+GWdw6IUZxx9d9AdAitH7R9xBfuTaDVYwK
	 tTiUuIo0AW9rLlcpM2NFnQoOrhPBKvnMjXXul+07D3DufYdlheCaahnLvW0YBtPBfSrtz
	 X+ScLYD1s9lGDbPswKFlXUyxnwqKCa+X7GzVMpTQxRSGIHQJt2ZWG9Vz/EGKl2SvZJatH
	 aGxWWCqmMeTsNmtYUei3PzsznaXkNVbXu1fZcSfuVuIlGq2Jaer48Od0BNZu5DTtoUaJ1
	 TkiLvMEOkCIMh/0jIc2VuvrZqC2irPtwJAKzXoEpSPbBF1dz+K9H4hU6qL5sK4ejXLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756485;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DF45BTK0J7JFo7I93Q7gXixgkG55Ak85AkEl7GAWG6U=;
	b=Fd/NTMpYEQB6wzx8GK70oO8nW7Ij5CRrP8GdDab34ofWelXdT4xnVgs5d3jXYBGXY0IW
	 UR7EA6++OW+GH8p5xR+ti/9G9igJJj1ar+5NOCMm1RZbFiKJ+qnI1C2jO1ZaafHRPQuKr
	 ydchuTWSNgDX4jSDKkbhz8pjdp683nCD+LwSkksuLzdgr3vnIQJ/ishVJC3QXzgtnE715
	 JFC8Ivr2zkFNyWsNMvdvfsZYAEp6WKeNwd0JqkBOkRYRlUbKhp4UbaleDUIxbhxAHfbGg
	 1fY5O9OD/icxvfKyKlvk66nNMuiOHAOP3s96GgljammMb1aZ3a+dTc7CC4aNYcLUA3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W2aPV36i;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B381606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 15:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B381606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W2aPV36i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794756484; x=1826292484;
  h=date:from:to:cc:subject:message-id;
  bh=fnhtVXLwA9KWkTwxVIEFemoYrQVaAuN+H2GtSURbYxY=;
  b=W2aPV36iz5cw2qi/7uU3Q9sity5VVWqbq2Lmk9nbKidpRAPfR0Us6aC7
   bZQX02EnzTlIejCWuKeHujensy1zmb5yYTH9r6Qguz9uhNfRiZF1thSGE
   y53jZd88GXHib6Tlqx9CR2JCnC3WSpMsPZ/JqyXojwDmzrbBGiGYXrt8T
   CxjQ4mLf2YU9Dx4i30NhU9YanzD2ZR+aBefHJKiNBbV8rAxs/zzJ3In76
   emPF4qZBEzYT3B2xnu48fZu4oCxja8syzOKIYGX8l5hHF7kvUqd5otSth
   JtS0MBKJYFgXh7//wq8MidGtHD/4eovsMMyiJQ/oXb+QZgTsNnAOogx8z
   A==;
X-CSE-ConnectionGUID: FqrwaCT/SEmui1IrdKvXug==
X-CSE-MsgGUID: /VxcxdEuQVKn5AfucUohOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3579291"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3579291"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 07:28:04 -0800
X-CSE-ConnectionGUID: ZpS/9bHLTVaoQJWrK1b77g==
X-CSE-MsgGUID: tkwfjXklT0KYgyVfPT0KeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9187889"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2026 07:28:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSc99-000000002Gm-3u2S;
	Sun, 15 Nov 2026 15:27:59 +0000
Date: Sun, 15 Nov 2026 16:27:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1957/7428] aarch64-linux-ld: Unexpected
 GOT/PLT entries detected!
Message-ID: <202611151648.V6MvSLEI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/61/6173959c7d4d578bce9b075577cbdf59877b1eea-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Liang Haowen <nbg2974@gmail.com>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: 6173959c7d4d578bce9b075577cbdf59877b1eea [1957/7428] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
:::::: branch date: 2 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2002-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151648.V6MvSLEI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151648.V6MvSLEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151648.V6MvSLEI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/leds/rgb/leds-asus-aura-scsi.o: in function `asus_aura_init':
   leds-asus-aura-scsi.c:(.init.text+0x14): undefined reference to `scsi_register_device_handler'
   aarch64-linux-ld: drivers/leds/rgb/leds-asus-aura-scsi.o: in function `asus_aura_exit':
   leds-asus-aura-scsi.c:(.exit.text+0x14): undefined reference to `scsi_unregister_device_handler'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

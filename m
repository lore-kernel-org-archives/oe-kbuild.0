Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904EE3803DF
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Aug 2026 20:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604280; cv=none; b=tOzm0H8TJAHJF7lX/RkhwM8A5hzDyFR2/If3BC1eH4Df7cSVxW0R6TEuV2ga9TgN92kzEAOlzkcEplhtKGPOJhjCl31RwUXIgtVEbdSu5TpEtzAOyjCDA03W7AJM4nlXnasQdNL4DrIPukpS03f589RO3kuZ3FTTfms/ysgrhsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604280; c=relaxed/simple;
	bh=np5RtsMEU8Lx06+YF30lGah/tIXdt2CV4OOHq9+r7EY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rgh5qL6hXv8V8NA+Y7c2RWQYmXx78bmtjk5aFCobLegPt1BRZ7mPexAcR0DCMh6QR9XGMe2r8TvcibaC37QE6buUhRhZFyd36GILSuF526IAAErZczr9ES2tI9dLDoYDBAJvKhYYQpAxW2LislO07ywfnhdSeOoXOLuLlxkLybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J760LuYS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J760LuYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787604278; x=1819140278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=np5RtsMEU8Lx06+YF30lGah/tIXdt2CV4OOHq9+r7EY=;
  b=J760LuYS/C0FWDlNrtxdWZ3qOqlIFRnzEcrV3yMzAjjRH5C+1TUu07qN
   h4G9r7AuGORuH0Rj9Z9JeU6bNKDhH61WwMhaifiV8rrJMI85r01yvr1jw
   OCanbD94ouUkyrjJvgeuqdjq0s2R04TEYI6RmesjyOspUV1fjkZRbQGK9
   kZGR3GYLpr0+kyx/JRw6s4a4R7hZenKtwjypdToPwHgcvtwKJqlY/CtyO
   ZF3bQtex8/Rr9UC53lpKbsN1wZ85g2az/WIAcl7F0K6/UcPx2WdvvhCHH
   +/486F8tg9crIRlWkg0jE8HJNSSKe/Mc5YAuuoRiGrpXDznisg1gD6leC
   Q==;
X-CSE-ConnectionGUID: 66XcpuOFSmCaDmJFiCBZvw==
X-CSE-MsgGUID: sjDMJarNSZqAdjZjK/ecfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99589837"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="99589837"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:44:35 -0700
X-CSE-ConnectionGUID: qVg5+7LKQ8aal70iqqCWwQ==
X-CSE-MsgGUID: mSoFs1xMTwOgq0SMhWJ7Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="271297812"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Aug 2026 13:44:34 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wybWs-0000000046B-01nK;
	Mon, 24 Aug 2026 20:44:27 +0000
Date: Tue, 25 Aug 2026 04:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] rtc: m41t80: use watchdog core for watchdog support
Message-ID: <202608250418.VKOeBSxF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260807013915.907604-1-dbgh9129@gmail.com>
References: <20260807013915.907604-1-dbgh9129@gmail.com>
TO: Yuho Choi <dbgh9129@gmail.com>
TO: alexandre.belloni@bootlin.com
CC: linux-rtc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Yuho Choi <dbgh9129@gmail.com>

Hi Yuho,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v7.2 next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuho-Choi/rtc-m41t80-use-watchdog-core-for-watchdog-support/20260806-213915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20260807013915.907604-1-dbgh9129%40gmail.com
patch subject: [PATCH v2] rtc: m41t80: use watchdog core for watchdog support
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: powerpc-currituck_defconfig (https://download.01.org/0day-ci/archive/20260825/202608250418.VKOeBSxF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250418.VKOeBSxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608250418.VKOeBSxF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/rtc/rtc-m41t80.c:646 function parameter 'wdt' not described in 'm41t80_wdt_ping'
>> Warning: drivers/rtc/rtc-m41t80.c:686 function parameter 'wdt' not described in 'm41t80_wdt_stop'
>> Warning: drivers/rtc/rtc-m41t80.c:646 function parameter 'wdt' not described in 'm41t80_wdt_ping'
>> Warning: drivers/rtc/rtc-m41t80.c:686 function parameter 'wdt' not described in 'm41t80_wdt_stop'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

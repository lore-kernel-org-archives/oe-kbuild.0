Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46F2BEFFD
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981560; cv=none; b=hOpK1gKy8su3VyHyfp6nW62YPT1xMD2wugouAoGsep9V87VsnekuRlwrv6iPhIuaOzqK1sqY7Y6Im7tUJU8X3n7Vx9Wg1ZxCapmbzy4+7qNehDtcoDqn6deQr2Jr8AEt3In50SeQeuZ1I47YYamAXaSvnxw4h+r4bixg2e5eKhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981560; c=relaxed/simple;
	bh=BdH3hJpBJmDTI0cZEhb4wre7ODK6a458xnP7d8YQeiQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P12ski6z/IpYO8lBAHzUg+YZJYDCJv66e9gukPFvltk6Gy80NvHsCbG+AoCMSMs5F2o82ngZSWc3xPaHrinATCQ31lKB/37yvdu1fm3phTOg7vMPbIsfHkx5VK5ey0sqEgjSZZBPA1MBbDCtXbdKmBGkqcXyvmm/i3A1OF4qJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDxu6CGp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDxu6CGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779981560; x=1811517560;
  h=date:from:to:cc:subject:message-id;
  bh=BdH3hJpBJmDTI0cZEhb4wre7ODK6a458xnP7d8YQeiQ=;
  b=CDxu6CGprVFyy8ZWmfk2Y4XsUC7N/jCTZLdNfM70SuozDt3BIdLwlAAd
   YhRMPNsGLwnTzeRSeKADh0/pKKutRipeNUNFg3M+NV3uPqZaOYxI/Q9Kl
   GyPYtZ4+fbnFxMcy9sxlNiXhmp4Q86H1Na0AeWHzJldazhsjhIqcfbooI
   QTSvFFtPLrPn/TmsBXf8CkCTdZMSAYkg9t438m0E2Hry6bZxGOTGg8quR
   PeKleq1M/aN3ifKw5q7c1KKI0fdfEtA3Y+SxVgz1ugH2picowF2DGOW64
   VA6WfjKLZXrMga08gZb+Nk3BhXEYWIj2XyujOwloxfheFvbpsecJ6ZDY1
   A==;
X-CSE-ConnectionGUID: A8DMRRvsQZu+a+NvO1HK4g==
X-CSE-MsgGUID: rgSZQZUdSZC1uBVA7ho5EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="83401951"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="83401951"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 08:19:19 -0700
X-CSE-ConnectionGUID: ZFmiZIOvQ/yWURDNLiowrw==
X-CSE-MsgGUID: /Xi7lJwtS7G7KEO/tS4XBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266184255"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 28 May 2026 08:19:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wScVw-000000000XB-2vw7;
	Thu, 28 May 2026 15:19:16 +0000
Date: Thu, 28 May 2026 17:18:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dwmw2:ffclock 10/10] aarch64-linux-gnu-ld: Unexpected
 GOT/PLT entries detected!
Message-ID: <202605281743.Pqcf2Ld3-lkp@intel.com>
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

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   0b56bf62998ffb14cc4fb5ab4781f6b3e5f60f0b
commit: 0b56bf62998ffb14cc4fb5ab4781f6b3e5f60f0b [10/10] kernel/time: Add /dev/vmclock_host miscdev
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260528/202605281743.Pqcf2Ld3-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281743.Pqcf2Ld3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605281743.Pqcf2Ld3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-gnu-ld: kernel/time/timekeeping.o: in function `timekeeping_adjust':
   kernel/time/timekeeping.c:2563:(.text+0xa24): undefined reference to `ntp_get_status'
   aarch64-linux-gnu-ld: kernel/time/timekeeping.c:2564:(.text+0xa2c): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

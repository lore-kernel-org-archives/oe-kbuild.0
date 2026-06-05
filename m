Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DDF416CFC
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679901; cv=none; b=l3q3g52IlD9uyUKQ/nT2wUnPBY4lnUl2qjbfGPOiLC79WotILdqq9BWY9pkg61lV4DHNjZnk6J42LPprws0MjhzUto/gQdGOErwNbVIByQrOIXOGzcSonyzRP9X9P0pBkLaAuYCpL8xrTxtmVlcZ9XEpqXNN1sJDn32Wx2feUN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679901; c=relaxed/simple;
	bh=deDAQeBVRtfFLZgqg1h0rBppG3bRvx2f6hynyyjoI9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oX1khf/WtlFxOQjj4quf7UDD6sZCwvLlZ7xUZXBg5TGWqCF/EdG94ZzSuDdjqV4T7UnF8bgJMop863pcW7qooRE1ADBHFhcrWCFrIvkrq0V7AzJpjDgWsxzU1yNoubJmJYxDRx+T28lqtKFBE0KC8RYR72BL/RGaJ2m7AwUoCYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1/h3sK9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1/h3sK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780679899; x=1812215899;
  h=date:from:to:cc:subject:message-id;
  bh=deDAQeBVRtfFLZgqg1h0rBppG3bRvx2f6hynyyjoI9E=;
  b=Q1/h3sK9oHLf/pibiUUpP5Fatu3L2RIntw3pu8+HbzHRzmK/s7//Fhq0
   1jTSOl47k0xdKimXSsmQoafPqmelSIZMxBqti64kXaXbFKo09yB+fPceG
   J0Qvg6+1Ccz0tdNi/46Xkduh50veTvADUEsb6/VQdxMXMaVP/AXd+8O92
   uDiP4M0L1sp6o2vA+ykRqMdM/DFQVNprFTwnDonllvg3eBhiRKcYps1mh
   GmpJE8g8eInXYfkkTCcVWrwVLfv393TAtGpLqKvKfqBHolYpayDfXDhfs
   meUh7586sg8RZ7OqMJ8TphNr5AwEgFE2Qm6uVeFBjLj6aeV5kDnOJpr7e
   w==;
X-CSE-ConnectionGUID: LA2po6OWS/mHkXLMiWhsxw==
X-CSE-MsgGUID: J1F7kyosTgqQBSmNNaNMhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="99089373"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="99089373"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 10:18:19 -0700
X-CSE-ConnectionGUID: /XcqbrwuTnqf5ygxN7SeGQ==
X-CSE-MsgGUID: hCSvn8TYTdiUWjmuwDlKSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="241918590"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2026 10:18:18 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVYBU-000000002cH-0aaC;
	Fri, 05 Jun 2026 17:18:16 +0000
Date: Fri, 05 Jun 2026 19:17:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 8/8] posix_timers.c:398:13:
 warning: 'check_delete' defined but not used
Message-ID: <202606051924.YJGrBGOx-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Matthias,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d190fc3e7c8fb30426d83b6d2214116e92836a9e
commit: f3a29e7eb6dea8119f0d5132e39b52adf4d1ea76 [8/8] ANDROID: Disable check_sig_ign within kselftest_timers_posix_timers
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 8 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260605/202606051924.YJGrBGOx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051924.YJGrBGOx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606051924.YJGrBGOx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> posix_timers.c:398:13: warning: 'check_delete' defined but not used [-Wunused-function]
     398 | static void check_delete(void)
         |             ^~~~~~~~~~~~
>> posix_timers.c:342:13: warning: 'check_rearm' defined but not used [-Wunused-function]
     342 | static void check_rearm(void)
         |             ^~~~~~~~~~~
   posix_timers.c:235:14: warning: 'ignore_thread' defined but not used [-Wunused-function]
     235 | static void *ignore_thread(void *arg)
         |              ^~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

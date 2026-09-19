Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1744A175A62
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Sep 2026 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789806503; cv=none; b=p/1aKA2IcIv2i2RiHYws+9DFp2rk2Ijci933I8/kt1Omm82rOYPZuSGOsZ+tSfTHwT/h+glNl31DRt3IIJeUSQsFeVDyKf2w5YEOvY2OX3adcAMNeVS2sfdS5ZwoO+0chmQ1uowVoaPvBwLQyH+J9N/Ofi4j6c7XY61/b/xxY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789806503; c=relaxed/simple;
	bh=sWn0KblHPICRW61ZiylzBu1KCJjpRxos+RO5eI6/GLQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KqdOzwgxQHcbzFgem0MOTlEyaaPl5fW4jWqATiscBifMO0F8Wj0oRlybKwl0IfvQDfz0ijuORmliOnMmZrfN6BWg+qINsRuWxLWGJ9TA4oNYFOxKGzmPqbtIDci02hxwBOn/d8+3+sPBY45T3+E4y41N3HvJL1L7BsPxtHkrAy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwHv9fy0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwHv9fy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789806502; x=1821342502;
  h=date:from:to:cc:subject:message-id;
  bh=sWn0KblHPICRW61ZiylzBu1KCJjpRxos+RO5eI6/GLQ=;
  b=QwHv9fy0D37QDeVBVFN9GMQe9v1TVIeFhnsfB1LbTDmMKAJ4N8Vls+Fl
   Osv0CKL5ag9j1NIOPRvHsFdOjOmncchKFAzCZ68IVG98Api4cR+O5PX2F
   +QDwWDhPR7Kgsxw6TWF4d6kObPmvd25lsj4VXtEzubo3VrGk45oGlmoHT
   D3CCag8vPyr7jCu0x/iXSTlZmIb8PDjwHRanWxNvUZZkq8mcu2nzfL3SK
   Wv5f0h/tDJu5IgDkY7EDS97HQGyiYLAp2DsyTjC1r+PyqxqVOyw/JVuv1
   Xa0wLMu/CpKlcQ4e2E8ea2fAaTV7mQrAGFgjC0EHyW6NfIRaoMWeH8fXR
   w==;
X-CSE-ConnectionGUID: nZz+iT0FT4Gtjjrm6UyFQQ==
X-CSE-MsgGUID: KfBD+IXyTKe88OgG+1xkNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="107844602"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="107844602"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 01:28:21 -0700
X-CSE-ConnectionGUID: J2F95I88S7isZx+eMxkUjQ==
X-CSE-MsgGUID: bnPZekHQTfOn3kCKw9GsAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="298197932"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Sep 2026 01:28:20 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7qQg-00000000Am1-02Iy;
	Sat, 19 Sep 2026 08:28:14 +0000
Date: Sat, 19 Sep 2026 16:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.10 1/1]
 arch/x86/kernel/static_call.c:19:17: warning: 'tramp_ud' defined but not used
Message-ID: <202609191635.PJEhAHNl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "extra build warning to Peter Zijlstra"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Peter,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   428b47f4651829663d19455bcf5132040b155e86
commit: 7723edf5edfdfdabd8234e45142be86598a04cad [1/1] x86,static_call: Use alternative RET encoding
:::::: branch date: 33 hours ago
:::::: commit date: 4 years, 2 months ago
config: i386-randconfig-r1307-20260917 (https://download.01.org/0day-ci/archive/20260919/202609191635.PJEhAHNl-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609191635.PJEhAHNl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609191635.PJEhAHNl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/static_call.c:19:17: warning: 'tramp_ud' defined but not used [-Wunused-const-variable=]
      19 | static const u8 tramp_ud[] = { 0x0f, 0xb9, 0xcc };
         |                 ^~~~~~~~


vim +/tramp_ud +19 arch/x86/kernel/static_call.c

452cddbff74b6a Peter Zijlstra 2020-08-18  13  
7723edf5edfdfd Peter Zijlstra 2022-06-14  14  /*
7723edf5edfdfd Peter Zijlstra 2022-06-14  15   * ud1 %esp, %ecx - a 3 byte #UD that is unique to trampolines, chosen such
7723edf5edfdfd Peter Zijlstra 2022-06-14  16   * that there is no false-positive trampoline identification while also being a
7723edf5edfdfd Peter Zijlstra 2022-06-14  17   * speculation stop.
7723edf5edfdfd Peter Zijlstra 2022-06-14  18   */
7723edf5edfdfd Peter Zijlstra 2022-06-14 @19  static const u8 tramp_ud[] = { 0x0f, 0xb9, 0xcc };
7723edf5edfdfd Peter Zijlstra 2022-06-14  20  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

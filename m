Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFA32874E4
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770773051; cv=none; b=GjNfWcSPDv8fLxkVGBiR4qh1YL08B8FBhqvsta0dCIkAByE/y9Q3K3kBXIQGzu8HWRzh6Te4VKnYD4nzUUGaAeT3P40V5xyEyYIqczopHvhupPxYIUVoLesykLs/HwxcMZVjMMCjz1F8yg/qcLdYNxDlNv36j1tXQOD7lVnnaHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770773051; c=relaxed/simple;
	bh=I5oltmV7pGyfcQQPpd8GJRLsSIW3TWWfSXewfenVLos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bQa3m3XsSxVgqTvEdhL2V6k8WtLjyyVP96968xi6gBpPVGSiRZcoNSbDPbJP4QHS8slufNWyOlDpKaTnWMnYJHRy5oDdBaPASuM0k3Y9IfLta5mMdw/ohXo5tYBwDgat3J5hP35ixjxz2/EaqRE+ZnFvkNaYVPAdcOqOvMLc5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJ1YEj0z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJ1YEj0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770773049; x=1802309049;
  h=date:from:to:cc:subject:message-id;
  bh=I5oltmV7pGyfcQQPpd8GJRLsSIW3TWWfSXewfenVLos=;
  b=gJ1YEj0zXNvi/JDlKSKMr1FHiTuBQ+19JkOy6lMDfbc4Qvh2JW4/ALam
   zmnF5G83b1vzwF29acoSzBFe5zB/hahaOJra9/ClEGVeQdM7f5WiAmXDG
   ZS1wo3gwcfAEMi5d76jHnNJOMuagVMjQgnSdkCcMGe0V+muQcjuzC+Z9e
   pagMhXy9qTzO5uSwhkbo+2e2UePz1OYkFjw53lu4AgrACSQ4GzrZTpNwy
   BbXUFOZ+GABX47yn1vtKOHWqW6Y4ELQl1e3wNT7UAnMHf8nBF84YqDEuL
   N1l+YTBJituSh3icDS7KFIdPSRP2IIy1FIxu2tlVslsGwf2qmdBPCxLhc
   w==;
X-CSE-ConnectionGUID: hEwppJRGSpKP4NAWMxRQGQ==
X-CSE-MsgGUID: ArS4XDMpT+mh1TSleTnKKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89504356"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89504356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 17:24:08 -0800
X-CSE-ConnectionGUID: P1KnKTU7RyS3pg1bFjDmxQ==
X-CSE-MsgGUID: MJc+SS7wSmeCamFNUAD7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216620550"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 17:24:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpyxZ-00000000pYi-0Yah;
	Wed, 11 Feb 2026 01:24:05 +0000
Date: Wed, 11 Feb 2026 09:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18 15/15]
 drivers/gpu/drm/drm_privacy_screen_x86.c:87:25: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202602110951.U1ocCTuy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/drm_privacy_screen_x86.c:87:25: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Slawomir,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   409a26120e3ef4670c01dbbe25374031b46702ab
commit: 9a56278bbc18f96b39323fb72338fd18f9a8c075 [15/15] ANDROID: GKI: x86: Enable DRM privacy screen
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-061-20260210 (https://download.01.org/0day-ci/archive/20260211/202602110951.U1ocCTuy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110951.U1ocCTuy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602110951.U1ocCTuy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_privacy_screen_x86.c:87:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/gpu/drm/drm_privacy_screen_x86.c:87:54: sparse: signed value source

vim +87 drivers/gpu/drm/drm_privacy_screen_x86.c

befe5404a00b3b Hans de Goede 2021-10-05   82  
befe5404a00b3b Hans de Goede 2021-10-05   83  void __init drm_privacy_screen_lookup_init(void)
befe5404a00b3b Hans de Goede 2021-10-05   84  {
befe5404a00b3b Hans de Goede 2021-10-05   85  	int i;
befe5404a00b3b Hans de Goede 2021-10-05   86  
befe5404a00b3b Hans de Goede 2021-10-05  @87  	for (i = 0; i < ARRAY_SIZE(arch_init_data); i++) {
befe5404a00b3b Hans de Goede 2021-10-05   88  		if (!arch_init_data[i].detect())
befe5404a00b3b Hans de Goede 2021-10-05   89  			continue;
befe5404a00b3b Hans de Goede 2021-10-05   90  
befe5404a00b3b Hans de Goede 2021-10-05   91  		pr_info("Found '%s' privacy-screen provider\n",
befe5404a00b3b Hans de Goede 2021-10-05   92  			arch_init_data[i].lookup.provider);
befe5404a00b3b Hans de Goede 2021-10-05   93  
befe5404a00b3b Hans de Goede 2021-10-05   94  		/* Make a copy because arch_init_data is __initconst */
befe5404a00b3b Hans de Goede 2021-10-05   95  		arch_lookup = arch_init_data[i].lookup;
befe5404a00b3b Hans de Goede 2021-10-05   96  		drm_privacy_screen_lookup_add(&arch_lookup);
befe5404a00b3b Hans de Goede 2021-10-05   97  		break;
befe5404a00b3b Hans de Goede 2021-10-05   98  	}
befe5404a00b3b Hans de Goede 2021-10-05   99  }
befe5404a00b3b Hans de Goede 2021-10-05  100  

:::::: The code at line 87 was first introduced by commit
:::::: befe5404a00b3b1547c944738df4a9229909bdc9 drm/privacy-screen: Add X86 specific arch init code

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

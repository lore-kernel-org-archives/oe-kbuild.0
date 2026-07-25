Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091BB28E0F
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 05:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784958406; cv=none; b=LRkRaxZBGoODI+kKmxcrC/vgTqZQupctdbxW4+QTv5kN6rssiR/v8Jya2v+bSh4nSkCTo008kExb5P20FT0NLD2PfiLbkkh1CzBFrcdeSh2hoMuWLpSwMfIKqmVzdY5kK7RxuCK/lLW1oQkiVsg8euaRemGp9tJfHrlPH7dE2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784958406; c=relaxed/simple;
	bh=FZiH/+AxNB4zs00AUqqI+JMAvWLJx+CoFSnnZmV/g74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MVwI/7O8+nkMScF1g/i1MPOB46WfLngksn+jWxsrlbqYvF3BzDEmImnuI+iGhCWhhkoG+Hqfl+Eqs4kh19yZ+VjAtcP25UmMiWJDSkhql2VdJ/D6BZwcJeJC3PU5vM/mK4WyRpblGLrik71/a0rISavGcJNRmOfI1MsC+lv3dEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsL/pyg2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsL/pyg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784958404; x=1816494404;
  h=date:from:to:cc:subject:message-id;
  bh=FZiH/+AxNB4zs00AUqqI+JMAvWLJx+CoFSnnZmV/g74=;
  b=hsL/pyg229JzFFxHNFRsAEiF0/QfHZWPwBLgjw2njoU/HxfgQC3ZPaf7
   4BxGY7ywq4Ye/Vxx8iTEFZq4jsT2Ckq6Em83zkIVUSfL7LZCVzvvYyd2h
   LVGvQ+hM3g1Yf1C/kQuvw+oF17vBDPMQ1J/3UJvZmNLddfpRaRldA6Uxs
   BxigoYvLpo0/sy5F2A223t8JaPD3EEx+l6gwaBGyx2ntjpoSW4TJWABFn
   tHj3h2dfgb0z1JVHCAE035V7IUOVRMgJiV/Pn6vKDn50GDikyXd1aa+jJ
   p7t23inyGBIaPaMY+Bvy5R9cG5BOo94rvhXViZX9+gcJforpbSTLPBoFt
   w==;
X-CSE-ConnectionGUID: re7FHfevRL+Upr9gt9WU6A==
X-CSE-MsgGUID: JE84lblOQ0GFyBhyUru6QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85705843"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="85705843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 22:46:44 -0700
X-CSE-ConnectionGUID: NshN25W+SJmfBp8zddDB5w==
X-CSE-MsgGUID: xdPfb2ySQVS74FIk8sWHiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="254583541"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jul 2026 22:46:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnVDc-00000000174-26fr;
	Sat, 25 Jul 2026 05:46:40 +0000
Date: Sat, 25 Jul 2026 07:46:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-5.15 1/1] vec-syscfg.c:24:9:
 warning: "ARRAY_SIZE" redefined
Message-ID: <202607250741.GSE4119g-lkp@intel.com>
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

Hi Shuah,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   e8c801716e1e12ca613c0be1b7174fbf468e9471
commit: c9e52db90031b7a89bf667057df5ca9c25cd68ff [1/1] tools: fix ARRAY_SIZE defines in tools and selftests hdrs
:::::: branch date: 15 hours ago
:::::: commit date: 3 years, 6 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260725/202607250741.GSE4119g-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607250741.GSE4119g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607250741.GSE4119g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vec-syscfg.c:24:9: warning: "ARRAY_SIZE" redefined
      24 | #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
         |         ^~~~~~~~~~
   In file included from vec-syscfg.c:21:
   ../../kselftest.h:52:9: note: this is the location of the previous definition
      52 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |         ^~~~~~~~~~
   vec-syscfg.c: In function 'get_child_rdvl':
   vec-syscfg.c:112:33: warning: too many arguments for format [-Wformat-extra-args]
     112 |                 fprintf(stderr, "execl(%s) failed: %d\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   vec-syscfg.c: At top level:
   vec-syscfg.c:326:13: warning: 'prctl_set_same' defined but not used [-Wunused-function]
     326 | static void prctl_set_same(struct vec_data *data)
         |             ^~~~~~~~~~~~~~
   vec-syscfg.c: In function 'file_write_integer':
   vec-syscfg.c:195:12: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     195 |         if (ret < 0) {
         |            ^
   vec-syscfg.c:183:13: note: 'ret' was declared here
     183 |         int ret;
         |             ^~~
--
>> vec-syscfg.c:24:9: warning: "ARRAY_SIZE" redefined
      24 | #define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
         |         ^~~~~~~~~~
   In file included from vec-syscfg.c:21:
   ../../kselftest.h:52:9: note: this is the location of the previous definition
      52 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |         ^~~~~~~~~~
   vec-syscfg.c: In function 'get_child_rdvl':
   vec-syscfg.c:112:33: warning: too many arguments for format [-Wformat-extra-args]
     112 |                 fprintf(stderr, "execl(%s) failed: %d\n",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   vec-syscfg.c: At top level:
   vec-syscfg.c:326:13: warning: 'prctl_set_same' defined but not used [-Wunused-function]
     326 | static void prctl_set_same(struct vec_data *data)
         |             ^~~~~~~~~~~~~~
   vec-syscfg.c: In function 'file_write_integer':
   vec-syscfg.c:195:12: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     195 |         if (ret < 0) {
         |            ^
   vec-syscfg.c:183:13: note: 'ret' was declared here
     183 |         int ret;
         |             ^~~
   /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: /tmp/cc4vZnJ7.o:(.data.rel+0x20): undefined reference to `rdvl_sve'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

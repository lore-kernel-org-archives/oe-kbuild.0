Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65873101D2
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684219; cv=none; b=c/sUWV+qKrPUX5DDatrQrCa5kcH5lCZU+TriK5ehkZH0tL8UroTDInLrn3biHvWk7UhyjYtbelS1SwyOL+4rPJDr0VVF1WzEs4mCUz9YHjTaekayJPHi3+PeDOwE7cSsoVEEsXYHdcljcSvJxqOWcfemqhDztY4JMYsXJ0iR0Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684219; c=relaxed/simple;
	bh=S7NBYiMq2ujVW4sNoW3Dm2e7soh79QRf5zd+yAFlebk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r2L7FrZABUG4855UcVZp/EzBHuNN1dyqKB57u1HeBppP1jDnPx2Jf8XBfzetx8wewUy01+U23jkBbskYzD3wmodXZET2qCS+7du7IsisdjTeCvc4f54cYgKNS3sImkuTlOmh0IvgX+bYHEQ0YAtzVejHgtK4m12GWLiAAUlYAgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjcTSnLy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjcTSnLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764684218; x=1796220218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S7NBYiMq2ujVW4sNoW3Dm2e7soh79QRf5zd+yAFlebk=;
  b=KjcTSnLydOLg3nAYcfVwke1FBXs2AXi+XGlnEQMLcxinE2GpFo9XUKQB
   XNeBBY2sK32vpM3xK64XNAVQ/fBTqw7b9XK22tT/Gt6OKmXWLPZ+JOa9n
   M1GeCOGckQLnSh1kdXodCWMFpbLrpX+K9EMsBOFmMcZMAirSTZZEJOKoc
   D/m4B6CvDlFbMF7BfvSwNh1Fqtq3NDAKPitqhw4b/YL/vBjQETUBMIBF2
   SjSHRk+/n9lG4vvIb9aeKdbrQFGfVl1JOXXKggfpgHynvXj9eMx5cSIoS
   bx4hmHfJFt3b6sflcwMOdxvTI9z57dRH35+hoAbAFp5XwFHhFVep5LDcY
   g==;
X-CSE-ConnectionGUID: 1pGAPB7+RH2m3V9K8z2Ewg==
X-CSE-MsgGUID: l5O7SOi7TKS3Obk+rMd2tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77997090"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="77997090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 06:03:37 -0800
X-CSE-ConnectionGUID: qyaTjs+JQVueeddVuSJxWQ==
X-CSE-MsgGUID: RJL3eSN+SJ+bLBHJixM57Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="198843848"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 Dec 2025 06:03:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQQyb-000000002tB-1gNo;
	Tue, 02 Dec 2025 14:03:33 +0000
Date: Tue, 2 Dec 2025 15:02:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-lts 14/14] gro.c:123:7: warning:
 variable 'opt_ipproto_off' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202512021523.pVePhA8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   dade86aa098b02637d657986340a2756688d21e2
commit: 28f2d15e27afd9b2f154d7a264b18666901c31f5 [14/14] selftests/net: fix GRO coalesce test and add ext header coalesce tests
:::::: branch date: 5 hours ago
:::::: commit date: 8 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021523.pVePhA8v-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021523.pVePhA8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021523.pVePhA8v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from gro.c:60:
   ./../kselftest.h:355:6: warning: variable 'major' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     355 |         if (uname(&info) || sscanf(info.release, "%u.%u.", &major, &minor) != 2)
         |             ^~~~~~~~~~~~
   ./../kselftest.h:358:9: note: uninitialized use occurs here
     358 |         return major > min_major || (major == min_major && minor >= min_minor);
         |                ^~~~~
   ./../kselftest.h:355:6: note: remove the '||' if its condition is always false
     355 |         if (uname(&info) || sscanf(info.release, "%u.%u.", &major, &minor) != 2)
         |             ^~~~~~~~~~~~~~~
   ./../kselftest.h:352:20: note: initialize the variable 'major' to silence this warning
     352 |         unsigned int major, minor;
         |                           ^
         |                            = 0
>> gro.c:123:7: warning: variable 'opt_ipproto_off' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     123 |                 if (proto == PF_INET)
         |                     ^~~~~~~~~~~~~~~~
   gro.c:148:42: note: uninitialized use occurs here
     148 |                         BPF_STMT(BPF_LD  + BPF_B   + BPF_ABS, opt_ipproto_off),
         |                                                               ^~~~~~~~~~~~~~~
   usr/include/linux/filter.h:49:59: note: expanded from macro 'BPF_STMT'
      49 | #define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
         |                                                           ^
   gro.c:123:3: note: remove the 'if' if its condition is always false
     123 |                 if (proto == PF_INET)
         |                 ^~~~~~~~~~~~~~~~~~~~~
     124 |                         optlen = sizeof(struct ip_timestamp);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     125 |                 else {
         |                 ~~~~
>> gro.c:122:6: warning: variable 'opt_ipproto_off' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     122 |         if (strcmp(testname, "ip") == 0) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   gro.c:148:42: note: uninitialized use occurs here
     148 |                         BPF_STMT(BPF_LD  + BPF_B   + BPF_ABS, opt_ipproto_off),
         |                                                               ^~~~~~~~~~~~~~~
   usr/include/linux/filter.h:49:59: note: expanded from macro 'BPF_STMT'
      49 | #define BPF_STMT(code, k) { (unsigned short)(code), 0, 0, k }
         |                                                           ^
   gro.c:122:2: note: remove the 'if' if its condition is always true
     122 |         if (strcmp(testname, "ip") == 0) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   gro.c:113:34: note: initialize the variable 'opt_ipproto_off' to silence this warning
     113 |         int ipproto_off, opt_ipproto_off;
         |                                         ^
         |                                          = 0
   3 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

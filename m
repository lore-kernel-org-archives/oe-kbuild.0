Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975722E62A2
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 06:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768372890; cv=none; b=dWnxcwGniZp34OhGmXZtEbF5mDkG4bAPDhhCBAexUHKPhgzqQeUsbd2i+cCX9IaSptz7P8JzvG7WBWmdaQxKao0mVuTovkV2FyF/YcRX0SPHbRX0aiZpIMZvEMWiRufV84QNVJUzdN7frih/kuRA10YzlTb6B8JGCyRvdAcpjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768372890; c=relaxed/simple;
	bh=S0O0lBNPGQhzggnM0HqD61kHSPDLbHnRoSfFD1z+WvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sKjJNy0ii7kvpeMuDekUxkUeTeuK0F+2CiyPR7KA3uWwdc/jp7EBt8kiCPhdBTSHe4zvs231eHCsuth+pLkFQks1PLH1bl+/e+7BGo47nhyCv3HD/EID7Qr3eJn1z9ttf5m2e3lXJylIe9TqoUmeDqHsPkkizkMol1Cd3AvpSQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtYwD+kC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtYwD+kC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768372885; x=1799908885;
  h=date:from:to:cc:subject:message-id;
  bh=S0O0lBNPGQhzggnM0HqD61kHSPDLbHnRoSfFD1z+WvM=;
  b=DtYwD+kCQ0uBD5ID7Wc9qXXObhO/q3h84xEOLnAN6FFy1w/Yy8+iHBGG
   8tYGArkBMbCuaL2hkQ+pvVDx2AzRmM7HBurYNApdj5AIERgda/76gkX9x
   FMGA+1Fmz6anntxvGE41+fiWSFKsq4dO7RI9mYSaHjVzF9f0WUnATUSjz
   7Iw+K9dKrkYQhqy0XzPzMbRPWdZp3P8MMInm7CRiKuaAbAJt+OhRkzK/a
   eqPVHx9+pLYty3NU3cFHY1n6phI/n8Wg6jVauCDulRtVEst9Or7s2PKuB
   A4ct7k7rEvegsKN5oJfnCUd55HfSfvsXiHCuJHxbp5Y7B8LGNHQSi0pIo
   w==;
X-CSE-ConnectionGUID: MQ/mmQQsSquUtBmcDIUEFg==
X-CSE-MsgGUID: thrksb7WTf6E8xJBXgFx6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69586412"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69586412"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 22:41:19 -0800
X-CSE-ConnectionGUID: 6nhCEf9XQuGM3yGHgJpO6w==
X-CSE-MsgGUID: ImDcECLkQ6qxMhtJSzFQMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235313600"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 22:41:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfuZ9-00000000FwO-2SH5;
	Wed, 14 Jan 2026 06:41:15 +0000
Date: Wed, 14 Jan 2026 14:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/android/debug_kinfo.c:92:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601141434.l7SjS6JP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/android/debug_kinfo.c:92:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Carlos,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   ac3e99fcd6f3fb15a285e2aca63cb06648febe27
commit: 8ffc353180362ace9dd63be1819e002dbb3db50b [1/1] Merge f468cf53c524 ("Merge tag 'bitmap-for-6.19' of github.com:/norov/linux") into android-mainline
:::::: branch date: 16 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-r134-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141434.l7SjS6JP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141434.l7SjS6JP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601141434.l7SjS6JP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_kinfo.c:92:1: sparse: sparse: bad integer constant expression
   drivers/android/debug_kinfo.c:92:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/android/debug_kinfo.c:183:1: sparse: sparse: bad integer constant expression
   drivers/android/debug_kinfo.c:183:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/android/debug_kinfo.c:184:1: sparse: sparse: bad integer constant expression
   drivers/android/debug_kinfo.c:184:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/android/debug_kinfo.c:185:1: sparse: sparse: bad integer constant expression
   drivers/android/debug_kinfo.c:185:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/android/debug_kinfo.c:185:1: sparse: sparse: bad integer constant expression
   drivers/android/debug_kinfo.c:185:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/cpufreq/dummy-cpufreq.c:57:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/dummy-cpufreq.c:57:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/cpufreq/dummy-cpufreq.c:58:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/dummy-cpufreq.c:58:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/cpufreq/dummy-cpufreq.c:59:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/dummy-cpufreq.c:59:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/cpufreq/dummy-cpufreq.c:59:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/dummy-cpufreq.c:59:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +92 drivers/android/debug_kinfo.c

1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  90  
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  91  module_param_cb(build_info, &build_info_op, NULL, 0200);
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16 @92  MODULE_PARM_DESC(build_info, "Write build info to field 'build_info' of debug kinfo.");
1a9c7b3e3bdd87a drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  93  

:::::: The code at line 92 was first introduced by commit
:::::: 1a9c7b3e3bdd87a10205891806a0d880fe27230c ANDROID: staging: add debug-kinfo driver

:::::: TO: Jone Chou <jonechou@google.com>
:::::: CC: Will McVicker <willmcvicker@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

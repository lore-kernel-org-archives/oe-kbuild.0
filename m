Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77642EEE8A
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 21:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780695688; cv=none; b=Ss7m9tWuo8j+0zQGO+/m2MNW95SJVDaA7JU7uDaRhEuGxRl5H7UH4p+dNG9SPbBI0Exul8/xM71az4T6f5vL75/qWc2JNtPYH1LCEhnSr5KoM4+nPqYodKukrE4aiWOGp0AlqVJ3ft0zVRKKLjbW1mrm0b8D35MpSUhprPQrm4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780695688; c=relaxed/simple;
	bh=pmzz6ISKypCwm1YvYrxUfzCTT9Kbx9hYaKBtAfywF10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TGvhIxJMyrxiS/sTckEu3uo6SAYVzm+0UqwziKQfWwfHB7FX523uSPosvngTPhRNujzDIk9d5C0nsbV1Zxb7ZW2H151VxOaCLlcKLb4fpWZDttKZkF8l8+9el5Rlv91Cs8/agieaSjPmGFAk/KEbUAiWGm6YMoZgqYICvdXxnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkFsx0e5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkFsx0e5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780695687; x=1812231687;
  h=date:from:to:cc:subject:message-id;
  bh=pmzz6ISKypCwm1YvYrxUfzCTT9Kbx9hYaKBtAfywF10=;
  b=HkFsx0e5d2FiW4aGWPSU4E7TZUs3i8e7tfaCpYucLh58vUCjAQatTyBl
   ZDEirmlvNoCyYefR5qsltyE0h4pTF/lpHrrre7B4/GGIGqbDnqb1iKPiE
   7x6ix8xDMCmAxkugOx1ggJymcvId0KPyqBl+bl+RwuCJVOnEYUPzECLyD
   UPQc9oc0/gIGEobRUqd/cH7tCsfV9c6dUvR8KrV/VtxxY09sBRCISVw7W
   evg+Jgm68NM/bkpx7L5eZix8tRt/YKGrFtj+vOyXP4sKC1uyu+ftO945F
   078WC0KOvETE9bim/MsiQ6qMi6qbpdrVhOyK12IoLMPpW1pQ4dVJbMNUO
   w==;
X-CSE-ConnectionGUID: /Jmr4Le6QOSHdqgYdRw7bg==
X-CSE-MsgGUID: N7nsBYB3QFay3vOgUHxRIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81532981"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="81532981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 14:41:26 -0700
X-CSE-ConnectionGUID: s5WuhKiWS/OwHSOdGCHjKQ==
X-CSE-MsgGUID: A66o3mWUQu+6K7dH1iEWzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="268897278"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jun 2026 14:41:25 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVcI7-000000002f7-1HHo;
	Fri, 05 Jun 2026 21:41:23 +0000
Date: Fri, 05 Jun 2026 23:41:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 8/8] posix_timers.c:257:13:
 warning: 'check_sig_ign' defined but not used
Message-ID: <202606052352.V1kd96fZ-lkp@intel.com>
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

Hi HONG,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   468e09dd6f52610d73a09cbbb28a2e7d4b940431
commit: 32c1bffe815c9ed746ce7d84cae07da17db6bca4 [8/8] ANDROID: Compile kselftest_timers_posix_timers code
:::::: branch date: 89 minutes ago
:::::: commit date: 1 year, 8 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260605/202606052352.V1kd96fZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052352.V1kd96fZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606052352.V1kd96fZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   posix_timers.c:399:13: warning: 'check_delete' defined but not used [-Wunused-function]
     399 | static void check_delete(void)
         |             ^~~~~~~~~~~~
   posix_timers.c:343:13: warning: 'check_rearm' defined but not used [-Wunused-function]
     343 | static void check_rearm(void)
         |             ^~~~~~~~~~~
>> posix_timers.c:257:13: warning: 'check_sig_ign' defined but not used [-Wunused-function]
     257 | static void check_sig_ign(int thread)
         |             ^~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

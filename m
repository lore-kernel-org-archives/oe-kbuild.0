Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DB53B5850
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 11:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286224; cv=none; b=blZ/qLe2s+kClhz+rgx6zsCLY+KtSzoE4GV1Vd+FqaRS0bN59irL67j7XFHgNxLIKDjfCPVYvQkaEJT82j8kI2Ris38X5vsGxe8+HRu7eCuxgCk/wPU50yrAs2y7zcsWxgMPh6S/MpzSTbvDC+L8ovr5kWJAMNBGiuD7G2av+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286224; c=relaxed/simple;
	bh=n/ZpZ5Ss8Q0cmd1d2cHw6NfQt7Of9CnbUmGXQiR2hEM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qL46mQUBEGiC0PcvjckloEFSGXK8vEa+TBqCkihNMPd0OlmOdnHEHJ8jeSgRexypruTOjqMffO12YcVdoZJI6DHmPdHwhj5jDFWp/2aowFOLfI/IBcOO2UTP/fqVrmxQVxUyAF6hkoBLummuFpTz5KO/hfwQhWnhjDqkETm6jvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wkplsv0C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wkplsv0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791286223; x=1822822223;
  h=date:from:to:cc:subject:message-id;
  bh=n/ZpZ5Ss8Q0cmd1d2cHw6NfQt7Of9CnbUmGXQiR2hEM=;
  b=Wkplsv0CcGQ+TFwp3qa3CteRZteplAfhGmkHMX7W9T1xihAwo6c08uH1
   POZZIVU6YEGLB9m4Nz1WWo2VzYM/2PwKD9rQ6jc0aJnnlJX39yQEaXZfd
   fWX0z4lwRTfrKylYwnHGrcd6RhPX8jjN41Pn9V4R2mjgIZHQX4Ujb7cQB
   FZrs9e0rxcQxnZDMzNJoEiith6XOCYwRO/4Hg+95S21L6c7V/+z717r7v
   Yw84hKLMPa+BY0wMC+AxBKEAvUsu5CW1djtviG2ktdCVIGDs59yzweO96
   9P1vLAqeDHftP+AXvlN9OMsdIfG1SrpF20Gm9M5SwBpFhnh4+i+61LDpB
   w==;
X-CSE-ConnectionGUID: zOFPQU4iSlO7T7j68YvtLA==
X-CSE-MsgGUID: TvIv6HxMQxSjQIIybS1Dkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="29880"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="29880"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 04:30:23 -0700
X-CSE-ConnectionGUID: busbf4fFT76XASzR0jbPGw==
X-CSE-MsgGUID: gPNrbF4OSh2emLQARX5rrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="281910942"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Oct 2026 04:30:21 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE3NC-000000001XY-32Aq;
	Tue, 06 Oct 2026 11:30:18 +0000
Date: Tue, 06 Oct 2026 19:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/motorcomm/chip.c:3928:36: error: 'priv'
 undeclared
Message-ID: <202610061956.2FNvr49S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Kyle-Switch/net-dsa-motorcomm-initialize-dsa_switch-based-on-chipid/20260929-105407, commit: 6487dda010cebf1838d44e9ef59cdf8dbcf6a47d"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kyle Switch <kyle.switch@motor-comm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kyle-Switch/net-dsa-motorcomm-initialize-dsa_switch-based-on-chipid/20260929-105407
head:   17230188d88553553a3648a5296554ff1e98926a
commit: 6487dda010cebf1838d44e9ef59cdf8dbcf6a47d net: dsa: motorcomm: move mib stop from remove() to teardown()
date:   7 days ago
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: s390-randconfig-1001-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061956.2FNvr49S-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061956.2FNvr49S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610061956.2FNvr49S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:16,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/dsa/motorcomm/chip.c:12:
   drivers/net/dsa/motorcomm/chip.c: In function 'yt921x_dsa_teardown':
>> drivers/net/dsa/motorcomm/chip.c:3928:36: error: 'priv' undeclared (first use in this function)
    3928 |         for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
         |                                    ^~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   drivers/net/dsa/motorcomm/chip.c:3928:36: note: each undeclared identifier is reported only once for each function it appears in
    3928 |         for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
         |                                    ^~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/dsa/motorcomm/chip.c:12:
   include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:205:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/net/dsa/motorcomm/chip.c:3928:25: note: in expansion of macro 'ARRAY_SIZE'
    3928 |         for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
         |                         ^~~~~~~~~~


vim +/priv +3928 drivers/net/dsa/motorcomm/chip.c

6487dda010cebf1 Kyle Switch 2026-09-29  3927  
6487dda010cebf1 Kyle Switch 2026-09-29 @3928  	for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
6487dda010cebf1 Kyle Switch 2026-09-29  3929  		struct yt921x_port *pp = &priv->ports[i];
6487dda010cebf1 Kyle Switch 2026-09-29  3930  
6487dda010cebf1 Kyle Switch 2026-09-29  3931  		disable_delayed_work_sync(&pp->mib_read);
6487dda010cebf1 Kyle Switch 2026-09-29  3932  	}
9af9a816821365e David Yang  2026-08-31  3933  }
9af9a816821365e David Yang  2026-08-31  3934  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF043C2F
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 02:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725156510; cv=none; b=fo7xEg7xZByTma4fKkq5AXNJXHHwTWz4ghk1uMaU0CbUrxko0fqYkxM/u5G1JII/8lOkuNCeIRAv3192pJHuy2vqxLT/785i/PraNIScdYJVhU2cpmtSjHtU0dQ0ulRCjTJLlEPRsMWiZb4ALKPgkamEz4uqN36oHVWc+np+oT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725156510; c=relaxed/simple;
	bh=Dmm2t31YRyo49EGQwniwoNlnBC0jmV7WW60LetzP21M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ph//kxPCBUz+AmlIipqGjQTGcelKs2p2R56bXo3wGMHAv7qJLICPExGEnl5U4L75Vuz/pTObZLnPwwNP8SPtXrCJiDbuwfGjmL29nGGSauW0rw/rdF64k6wrSJynDIBbqt8m5S44dogrmvEhvhkOYtfCkv26HgzpL8p9jKlzbWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNxMqUsi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNxMqUsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725156507; x=1756692507;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Dmm2t31YRyo49EGQwniwoNlnBC0jmV7WW60LetzP21M=;
  b=MNxMqUsiolTdguG1ybhhnJHtiupBdVM6jJd5Dk4l658MY09g8+p+gNlY
   cC5wWepzWGvlbPYiIKQReXxEeUC/mcFRqClHGunlLbnter5mWD/yRT6wA
   Zg4bfGbN61BDg7ZRR8pMB6k2kzjmw7TC+wWaXh+Jf1KUmcK4QfKUskuDf
   eQwifEx2QOlFkwSIITS6lA3e3XyBfNsGKqRe0FG1SxP3Lv14XTby/Vm6S
   VO5EFu+kl5+BlyIWWt+QUUqpmCDMaQt0/aMM22LxqcmeCv8xxAHQE2XJ8
   5KrbDXK0sICL4YLJNcLv+7XFB67QdzjOn9/pqF0Wey3gRo5HhCdRTFnw3
   Q==;
X-CSE-ConnectionGUID: dtKD8kTvTqOCZ1SxOWhtxg==
X-CSE-MsgGUID: YuvvWf6mQ1ONXY+CRkTPEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23931653"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23931653"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 19:08:27 -0700
X-CSE-ConnectionGUID: eEfG/19lRM24ZVQlDrFZoQ==
X-CSE-MsgGUID: sTS0+83YRUC4iPSLzgydug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="63948020"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2024 19:08:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ska0u-0003HK-0S;
	Sun, 01 Sep 2024 02:08:24 +0000
Date: Sun, 1 Sep 2024 10:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/3] kselftest: Provide __cpuid_count() stub on
 non-x86 archs
Message-ID: <202409010931.Xl6TB9hc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240829131657.1917-4-ilpo.jarvinen@linux.intel.com>
References: <20240829131657.1917-4-ilpo.jarvinen@linux.intel.com>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

Hi Ilpo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilpo-J-rvinen/selftests-resctrl-Generalize-non-contiguous-CAT-check/20240829-212248
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240829131657.1917-4-ilpo.jarvinen%40linux.intel.com
patch subject: [PATCH v3 3/3] kselftest: Provide __cpuid_count() stub on non-x86 archs
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010931.Xl6TB9hc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409010931.Xl6TB9hc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   corrupt_xstate_header.c: In function 'xsave_enabled':
>> corrupt_xstate_header.c:29:20: warning: 'ecx' is used uninitialized [-Wuninitialized]
      29 |         return ecx & (1U << 27);
         |                ~~~~^~~~~~~~~~~~
   corrupt_xstate_header.c:24:32: note: 'ecx' was declared here
      24 |         unsigned int eax, ebx, ecx, edx;
         |                                ^~~
--
   amx.c: In function 'check_cpuid_xtiledata':
>> amx.c:123:19: warning: 'ebx' is used uninitialized [-Wuninitialized]
     123 |         xbuf_size = ebx;
         |         ~~~~~~~~~~^~~~~
   amx.c:111:23: note: 'ebx' was declared here
     111 |         uint32_t eax, ebx, ecx, edx;
         |                       ^~~
>> amx.c:131:13: warning: 'eax' is used uninitialized [-Wuninitialized]
     131 |         if (!eax || !ebx)
         |             ^~~~
   amx.c:111:18: note: 'eax' was declared here
     111 |         uint32_t eax, ebx, ecx, edx;
         |                  ^~~
--
   lam.c: In function 'cpu_has_lam':
>> lam.c:124:24: warning: 'cpuinfo' is used uninitialized [-Wuninitialized]
     124 |         return (cpuinfo[0] & (1 << 26));
         |                 ~~~~~~~^~~
   lam.c:120:22: note: 'cpuinfo' declared here
     120 |         unsigned int cpuinfo[4];
         |                      ^~~~~~~
   lam.c: In function 'cpu_has_la57':
   lam.c:134:24: warning: 'cpuinfo' is used uninitialized [-Wuninitialized]
     134 |         return (cpuinfo[2] & (1 << 16));
         |                 ~~~~~~~^~~
   lam.c:130:22: note: 'cpuinfo' declared here
     130 |         unsigned int cpuinfo[4];
         |                      ^~~~~~~


vim +/ecx +29 tools/testing/selftests/x86/corrupt_xstate_header.c

b7c11876d24bdd7 Andy Lutomirski 2021-06-08  21  
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  22  static inline int xsave_enabled(void)
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  23  {
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  24  	unsigned int eax, ebx, ecx, edx;
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  25  
170d1c23f2a3569 Reinette Chatre 2022-04-25  26  	__cpuid_count(0x1, 0x0, eax, ebx, ecx, edx);
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  27  
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  28  	/* Is CR4.OSXSAVE enabled ? */
b7c11876d24bdd7 Andy Lutomirski 2021-06-08 @29  	return ecx & (1U << 27);
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  30  }
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72F4B64A
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jan 2024 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqAdTD0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704785672; x=1736321672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4eT6E7SEO/HLGpxFBhPQcLuc/um1nguQP/dHKp7Zh4=;
  b=MqAdTD0vRby5l3wToWLA1gDU4OeA1gyOW596cbtBySq708+ps6PjmKiC
   LtmkfJegbjonTuJeATmJkyM1HKcik0ls72aKLiUt1P5S1mDQR2vrRSAZY
   IiLnu7EcTW8Lqgkwu/nEMre33DDzvJKo95UhwaOwry/h+zJNzb5O0fQol
   WYNhotwrA9bONKV65iFyVJ6OfrPVpGP6usCEZOfbe1j5b9+0dXsNyUWnR
   Nn9Efhi9wuoyNG1+L9rx1kFPdsiuizJvwCBtgoq6fZv/oYRewkls9XrVw
   +cVv/nGDqmE40nJdZ/i7mtYmTyxWGuDJ6fMiwT1IzC6Nb/fpEBqTNBzpG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464512414"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="464512414"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 23:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1028666429"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="1028666429"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jan 2024 23:34:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN6d2-0005a2-2R;
	Tue, 09 Jan 2024 07:34:28 +0000
Date: Tue, 9 Jan 2024 15:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm:aarch64/ktext/v6.7 17/20] arch/arm64/mm/ktext.c:127:12: error:
 call to undeclared function 'strtobool'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202401091558.zncfjWCs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Hi Russell,

First bad commit (maybe != root cause):

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git aarch64/ktext/v6.7
head:   a9c4aba29b5db8c32c2b2372516046b044f0620c
commit: 70467dc35196dcbfbed95556abd0e1ec15b8d94b [17/20] arm64: text replication: add Kconfig
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240109/202401091558.zncfjWCs-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401091558.zncfjWCs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401091558.zncfjWCs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/mm/ktext.c:127:12: error: call to undeclared function 'strtobool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     127 |         int ret = strtobool(str, &enabled);
         |                   ^
   arch/arm64/mm/ktext.c:127:12: note: did you mean 'kstrtobool'?
   include/linux/kstrtox.h:98:18: note: 'kstrtobool' declared here
      98 | int __must_check kstrtobool(const char *s, bool *res);
         |                  ^
   1 error generated.


vim +/strtobool +127 arch/arm64/mm/ktext.c

fa3cae37aefa58 Russell King (Oracle  2022-07-07  123) 
fa3cae37aefa58 Russell King (Oracle  2022-07-07  124) static int __init parse_ktext(char *str)
fa3cae37aefa58 Russell King (Oracle  2022-07-07  125) {
fa3cae37aefa58 Russell King (Oracle  2022-07-07  126) 	bool enabled;
fa3cae37aefa58 Russell King (Oracle  2022-07-07 @127) 	int ret = strtobool(str, &enabled);
fa3cae37aefa58 Russell King (Oracle  2022-07-07  128) 
fa3cae37aefa58 Russell King (Oracle  2022-07-07  129) 	if (ret)
fa3cae37aefa58 Russell King (Oracle  2022-07-07  130) 		return ret;
fa3cae37aefa58 Russell King (Oracle  2022-07-07  131) 
fa3cae37aefa58 Russell King (Oracle  2022-07-07  132) 	ktext_enabled = enabled;
fa3cae37aefa58 Russell King (Oracle  2022-07-07  133) 	return 0;
fa3cae37aefa58 Russell King (Oracle  2022-07-07  134) }
fa3cae37aefa58 Russell King (Oracle  2022-07-07  135) early_param("ktext", parse_ktext);
fa3cae37aefa58 Russell King (Oracle  2022-07-07  136) 

:::::: The code at line 127 was first introduced by commit
:::::: fa3cae37aefa584f8e1aa166c1ae969d7ef4b816 arm64: text replication: early kernel option to enable replication

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

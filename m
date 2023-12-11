Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A10A34CD5
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAefZOM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702293424; x=1733829424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3f9EM/Ii3DmWwwiRHmZNznxdkT2Ng2fANICf6j3204M=;
  b=BAefZOM+HDuW42ADECm8oQFN2sI2A0YqQ8PhAGJrRVCh7BTg05elvhx8
   S1FAhWgpRbPyUOjWKQA7ByH8smOYdl2zAvWH0r9A8WelzAACYV6lp7z3u
   PQ2f++9w2sC/XhMrG1fyxMqCq+MXRKD/tKFmHgxen1Wd8sIMeTZIR5JT8
   xke05ohb9RSJV/ZN2kTMhLAR20o2PeDYsz+nGZEyzWsXcorAqqy40HvmO
   1EpG+znPNG/osqLZAp6x4laogxH3v7xc+i+Ar57tkvT7/NWAFNmfaXxLL
   j7801mXCCWAVQtjNAmJ10Cx5CLBFL3sA2JH6iFWvuy57uU96K1z+ns+Ij
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="7981930"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="7981930"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 03:17:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="916800603"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="916800603"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2023 03:17:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCeHU-000Hyn-1G;
	Mon, 11 Dec 2023 11:17:00 +0000
Date: Mon, 11 Dec 2023 19:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5602/6992]
 drivers/clk/qcom/camcc-sc8280xp.c:53:22: sparse: sparse: decimal constant
 3600000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long,
 C90 compilers are very likely to produce unsigned long (and a warning) here
Message-ID: <202312111959.dH9oRyv4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/camcc-sc8280xp.c:53:22: sparse: sparse: decimal constant 3600000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bbd220ce4e29ed55ab079007cff0b550895258eb
commit: ff93872a9c6168992ee41f2da9d9c3b8a6f8a8e5 [5602/6992] clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r111-20231211 (https://download.01.org/0day-ci/archive/20231211/202312111959.dH9oRyv4-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312111959.dH9oRyv4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312111959.dH9oRyv4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/camcc-sc8280xp.c:53:22: sparse: sparse: decimal constant 3600000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +53 drivers/clk/qcom/camcc-sc8280xp.c

ff93872a9c6168 Bryan O'Donoghue 2023-10-26  51  
ff93872a9c6168 Bryan O'Donoghue 2023-10-26  52  static struct pll_vco zonda_vco[] = {
ff93872a9c6168 Bryan O'Donoghue 2023-10-26 @53  	{ 595200000, 3600000000, 0 },
ff93872a9c6168 Bryan O'Donoghue 2023-10-26  54  };
ff93872a9c6168 Bryan O'Donoghue 2023-10-26  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

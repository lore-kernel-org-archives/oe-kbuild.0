Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD3804
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jun 2023 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685955837; x=1717491837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xv1/mkOg3Y5DDuRMtwMWokcKy/nhXRVrwzLXhaaNvEk=;
  b=KenXSU07CabF5Ijs4bI1+xgudtrxpRnqXNaJRdM9N29HT3pHnYFU2vr9
   IFdJ6qc8h3cz4LAdTOcItwvyjFQ9XyIQEUzzTP5oxFncjyaUcYhcgdYLR
   nIjvdwoGdG07K4IWfgaUyeKAib9NgnWZfg7WOBLppOkL1KBgh5UYFl+J+
   Ktr/576R9AO7juBB5R0QOV6cVcKSUuYG+ZrPGgkGGN717/xCWymWT8FmQ
   PDf+c6HLn6YVQfgDiV0/V/Jzi0H/J7eDgQ9byllnwCmLkGAx+WW1PZtbX
   aB7xNOa/NawVJtYBwtOtyUAwIRVSE4R/3kcP8smF+OemWODK5N45qIObh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="422144774"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="422144774"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 02:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="711741653"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="711741653"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2023 02:03:56 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6683-00043L-1i;
	Mon, 05 Jun 2023 09:03:55 +0000
Date: Mon, 5 Jun 2023 17:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4072/6966]
 drivers/clk/qcom/videocc-sm8550.c:34:22: sparse: sparse: decimal constant
 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long,
 C90 compilers are very likely to produce unsigned long (and a warning) here
Message-ID: <202306051648.iqW3I1ao-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/videocc-sm8550.c:34:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ca10bfb8aa8fbf19ee22e702c8cf9b66ea73a54
commit: f53153a37969c185d51e388ad51a23807e2605a1 [4072/6966] clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550
:::::: branch date: 5 hours ago
:::::: commit date: 11 days ago
config: m68k-randconfig-s043-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051648.iqW3I1ao-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f53153a37969c185d51e388ad51a23807e2605a1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f53153a37969c185d51e388ad51a23807e2605a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306051648.iqW3I1ao-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/videocc-sm8550.c:34:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +34 drivers/clk/qcom/videocc-sm8550.c

f53153a37969c1 Jagadeesh Kona 2023-05-24  32  
f53153a37969c1 Jagadeesh Kona 2023-05-24  33  static const struct pll_vco lucid_ole_vco[] = {
f53153a37969c1 Jagadeesh Kona 2023-05-24 @34  	{ 249600000, 2300000000, 0 },
f53153a37969c1 Jagadeesh Kona 2023-05-24  35  };
f53153a37969c1 Jagadeesh Kona 2023-05-24  36  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

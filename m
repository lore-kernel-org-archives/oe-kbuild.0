Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2007156DE
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jun 2023 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685960341; x=1717496341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NCYs1dqGdEylbByZNDUvZwMnKM1BQEKtICGxyxFQsjg=;
  b=SGFH1vYr9iffwxyPYCBNzqOJlOCNn98uoemsDcH1tpJxRIza6NN+XcOw
   b+ZLB1Fw7MqYKWaSfvoknWKnnwZ+bXm1Ah2UQNftXOd8c1hpjjef0kDYs
   xzbd82m4lUz+rF0mMebdxgrRhQFtdhGfaGLtwYf6Mc579n9G7uNeYJe+U
   +8j5eeaB1u9/arzfz/aqP0SLE4xI9i9AKzgREzekbXSysQWwNBv4WPUfF
   ypkiJXVxV4me9X0zQ53Jop5NB8P7odPBGKychblnSl5USZNlm8LU4ICXu
   5tyNfW4U+K+llwRWMmfp0Etq6D+vjlkUXpNQtDYVK+/94NKhtm9nbTVHh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="340968681"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="340968681"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 03:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="702699692"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="702699692"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Jun 2023 03:18:59 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q67Ig-00046N-2X;
	Mon, 05 Jun 2023 10:18:58 +0000
Date: Mon, 5 Jun 2023 18:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4582/6966] drivers/clk/qcom/gpucc-sm8550.c:37:22:
 sparse: sparse: decimal constant 2300000000 is between LONG_MAX and
 ULONG_MAX. For C99 that means long long, C90 compilers are very likely to
 produce unsigned long (and a warning) here
Message-ID: <202306051838.2esVTCwJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/qcom/gpucc-sm8550.c:37:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ca10bfb8aa8fbf19ee22e702c8cf9b66ea73a54
commit: bfae40744b337928b1e65bf40efd91e715a5d808 [4582/6966] clk: qcom: gpucc-sm8550: Add support for graphics clock controller
:::::: branch date: 7 hours ago
:::::: commit date: 9 days ago
config: m68k-randconfig-s043-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051838.2esVTCwJ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bfae40744b337928b1e65bf40efd91e715a5d808
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bfae40744b337928b1e65bf40efd91e715a5d808
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306051838.2esVTCwJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/gpucc-sm8550.c:37:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +37 drivers/clk/qcom/gpucc-sm8550.c

bfae40744b3379 Jagadeesh Kona 2023-05-24  35  
bfae40744b3379 Jagadeesh Kona 2023-05-24  36  static const struct pll_vco lucid_ole_vco[] = {
bfae40744b3379 Jagadeesh Kona 2023-05-24 @37  	{ 249600000, 2300000000, 0 },
bfae40744b3379 Jagadeesh Kona 2023-05-24  38  };
bfae40744b3379 Jagadeesh Kona 2023-05-24  39  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

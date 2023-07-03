Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EBB1FAC
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jul 2023 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688383265; x=1719919265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DSBMxDIn2AQG2KL5klsLo5a5AeCk6gHi5UwDPo3ZEU0=;
  b=VnVgGRzW4YVDp7OkXx1lvc016+opmEDbsddmrJy2rdIbk7+owlvMXejc
   h+Gq9VCmQN/JNPDF4IjEN/7emIwLM5pPGxrsbrGpXpRagAyVhyZBLkdX0
   OCXxTqeUNYayXwLeS84hvgxG0K836GzSIix9eAiYOsf33ijlX5fbbdXpx
   aKKl77vqbGFAhgeeqL907cpKQmG5BRpe/glhAj6DE1/CY3sWnfREMkuN7
   E2PcabiqIw9/YSyoCnBsrHgIGceC291cxgQ5sno1VwI8UljDqQAIo0+if
   V/yeI8FhDP5g85fOzugul2rRvWufYhsjgbOKkR35wcl/WiN2H1k8/pSmW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="449231995"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="449231995"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 04:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="1049047593"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="1049047593"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2023 04:21:03 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGHc6-000HLb-3B;
	Mon, 03 Jul 2023 11:21:02 +0000
Date: Mon, 3 Jul 2023 19:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3817/12997]
 drivers/clk/qcom/gpucc-sm8550.c:37:22: sparse: sparse: decimal constant
 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long,
 C90 compilers are very likely to produce unsigned long (and a warning) here
Message-ID: <202307031932.T0EK0GKI-lkp@intel.com>
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
head:   296d53d8f84ce50ffaee7d575487058c8d437335
commit: bfae40744b337928b1e65bf40efd91e715a5d808 [3817/12997] clk: qcom: gpucc-sm8550: Add support for graphics clock controller
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-r073-20230703 (https://download.01.org/0day-ci/archive/20230703/202307031932.T0EK0GKI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307031932.T0EK0GKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307031932.T0EK0GKI-lkp@intel.com/

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

Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD3112B82
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683729342; x=1715265342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q++2g1Xh0YK3o8iBGi8km3vDte5/Q3FsFrtrBB4qVSE=;
  b=lBh6najzm3lL3mK1eyB6v8gbpWxVaGFHJdzgMNSnbtOQYDYBO6Fk3H8g
   DvhndRPNGgHZfFaKMrv1SLTUv4D8U1B4B30d/aOOFO77mYb3BbXgmNzBU
   NtTGb/6Gd48nOwSnCQbyKfI5R/T5kx/i8ldbqDazik6Wu9Rz/djk09c3m
   x/wsWJWsUtKLASM8yKaI/hUyr6GArqmPvZcWYdMUnM/uHpV4wWRv/bcSE
   XdWfyFVHJICbnI85/M4/Vtl6d+P+YWyMT9SSebiy8sSfBYoXEDx6xHDaa
   w5+hPBdPj25OKoIQbD3zxnp/orl4nmDWiqTmC7yEtsLYsTsDt7AmgiBel
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436551117"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="436551117"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 07:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="811164154"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="811164154"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 May 2023 07:35:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwkuk-0003Ma-0g;
	Wed, 10 May 2023 14:35:34 +0000
Date: Wed, 10 May 2023 22:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/4] clk: qcom: videocc-sm8550: Add video clock
 controller driver for SM8550
Message-ID: <202305102230.xwLSQDup-lkp@intel.com>
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
In-Reply-To: <20230509161218.11979-4-quic_jkona@quicinc.com>
References: <20230509161218.11979-4-quic_jkona@quicinc.com>
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: Taniya Das <quic_tdas@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Jagadeesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jagadeesh-Kona/clk-qcom-clk-alpha-pll-Add-support-for-lucid-ole-pll-ops/20230510-001646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230509161218.11979-4-quic_jkona%40quicinc.com
patch subject: [PATCH 3/4] clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: csky-randconfig-s041-20230510 (https://download.01.org/0day-ci/archive/20230510/202305102230.xwLSQDup-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/b8b89d98c390c71dc746d3a8ce58529fb52da3c4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jagadeesh-Kona/clk-qcom-clk-alpha-pll-Add-support-for-lucid-ole-pll-ops/20230510-001646
        git checkout b8b89d98c390c71dc746d3a8ce58529fb52da3c4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305102230.xwLSQDup-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/qcom/videocc-sm8550.c:34:22: sparse: sparse: decimal constant 2300000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +34 drivers/clk/qcom/videocc-sm8550.c

b8b89d98c390c7 Jagadeesh Kona 2023-05-09  32  
b8b89d98c390c7 Jagadeesh Kona 2023-05-09  33  static const struct pll_vco lucid_ole_vco[] = {
b8b89d98c390c7 Jagadeesh Kona 2023-05-09 @34  	{ 249600000, 2300000000, 0 },
b8b89d98c390c7 Jagadeesh Kona 2023-05-09  35  };
b8b89d98c390c7 Jagadeesh Kona 2023-05-09  36  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

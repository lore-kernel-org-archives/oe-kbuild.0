Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DFB6FBB
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jun 2023 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686747953; x=1718283953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IKN0mxzTknT+JPPo6VKOcIorcnyQpBoM+4fHhmSNcLQ=;
  b=S9UglwoW2l+YZKEsNW4a5qpIeW7tW/8gOvWMjNTimZQuHW3uv6eYUtSw
   CFJJQRYS4IUP95MQ9i3S8nPNOY8l72Ldn93GYx8cRSbc70InK6Nbu4K6G
   hoiqnI78Cej/i9ULiPpLwGX8aOTG52bGCBQmNqbUbynAxiS3vJPvZbdTT
   9pCVC/XGTJifAG0rS7KJGRT5wqvNtulmj2o2kzxADKwmx8XjmqnKdTSz4
   9DKX6uuI6rRb7zRImmMCJqdEJkFuq9Hlp6wmJxjD/wNw6D5VGJ1Sk802Q
   WsJ2tvKgZnrfRi7pgqIxAQBVJ0kbHo6rw2LC7q4UHi/GTPXnCpPiV999D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343301563"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="343301563"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 06:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712062607"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="712062607"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Jun 2023 06:05:51 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9QC6-0000f9-2r;
	Wed, 14 Jun 2023 13:05:50 +0000
Date: Wed, 14 Jun 2023 21:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 06/18] clk: qcom: krait-cc: export L2 clock as an
 interconnect
Message-ID: <202306142030.hMUOwUb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230612053922.3284394-7-dmitry.baryshkov@linaro.org>
References: <20230612053922.3284394-7-dmitry.baryshkov@linaro.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Ilia Lin <ilia.lin@kernel.org>
TO: Viresh Kumar <vireshk@kernel.org>
TO: Nishanth Menon <nm@ti.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: Christian Marangi <ansuelsmth@gmail.com>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on rafael-pm/linux-next clk/clk-next linus/master v6.4-rc6]
[cannot apply to next-20230614]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/dt-bindings-opp-opp-v2-kryo-cpu-support-Qualcomm-Krait-SoCs/20230612-134159
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230612053922.3284394-7-dmitry.baryshkov%40linaro.org
patch subject: [PATCH 06/18] clk: qcom: krait-cc: export L2 clock as an interconnect
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230614/202306142030.hMUOwUb9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch robh for-next
        git checkout robh/for-next
        b4 shazam https://lore.kernel.org/r/20230612053922.3284394-7-dmitry.baryshkov@linaro.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306142030.hMUOwUb9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/interconnect/icc-clk.o
>> ERROR: modpost: "icc_clk_unregister" [drivers/clk/qcom/krait-cc.ko] undefined!
>> ERROR: modpost: "icc_clk_register" [drivers/clk/qcom/krait-cc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

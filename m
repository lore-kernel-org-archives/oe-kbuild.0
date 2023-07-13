Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ACA1F938
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jul 2023 22:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689286692; x=1720822692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0xoCbU2K8UguigXLfyoiSDjUKPELfevbbZiUHXxJwIE=;
  b=CJ3d0Qx8PsyUsi2XGSNONb/mV2/6uVGHcSAHKUZ/PloH/YbHZRuHsWsp
   nq1y0Q0zpJvp5SrXLOx6AAOHVapHqSFmHrijEnPLiyU4KN8QD/IkFVrxu
   kQmdEQWsExuNm2V5vAtZd0bibhJtLnJ/xgrBxNyXTUI8lbEyNLW6zmmHm
   NOlIl+2kY3F2964UpnOEMoGM9ELSPge4SnHm9smvkdPVEm7+/u10/sHsJ
   0kb+v4pDlZ3j8VrAf30mVVbgIB8H45Dx8gTVjV8oR2yyHxUmP7MfnnXOS
   lmtRkKFgTwZ28OPSpzxkvcW5B+5TMdO+AwmEEa/lnPMigqwaNb/eCgDDi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367970270"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="367970270"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 15:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="672455074"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="672455074"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jul 2023 15:18:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK4dV-0006vp-2Y;
	Thu, 13 Jul 2023 22:18:09 +0000
Date: Fri, 14 Jul 2023 06:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 3/3] clocksource: sun5i: convert to platform device driver
Message-ID: <202307140501.F9lanq3W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230630201800.16501-4-mans@mansr.com>
References: <20230630201800.16501-4-mans@mansr.com>
TO: Mans Rullgard <mans@mansr.com>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Maxime Ripard <mripard@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev

Hi Mans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on linus/master v6.5-rc1 next-20230713]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mans-Rullgard/clocksource-sun5i-remove-duplication-of-code-and-data/20230701-042002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20230630201800.16501-4-mans%40mansr.com
patch subject: [PATCH 3/3] clocksource: sun5i: convert to platform device driver
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm-randconfig-r054-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140501.F9lanq3W-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140501.F9lanq3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307140501.F9lanq3W-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-sun5i.c:260:2-9: line 260 is redundant because platform_get_irq() already prints an error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

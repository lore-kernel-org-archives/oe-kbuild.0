Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEBE24A0F
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dj6riSgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699907376; x=1731443376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PEX+S2QH2e7KwEgOJGni+nzPFMaGvlTksa/t3Mt1/L4=;
  b=Dj6riSgAiVME5v2TaMX/U8embeASObYkSkwp//W261fyVW5v3TkoYWAQ
   f3aKz7WHINQzwabQ3xg37Yv9512xgzsAalh82KXvjPWDIU8V3JHdsKaP4
   c9lJrHIu9mWIKHrv9fwMPhiph44q/wGheH15iN9HgKBE56HDVTS+UTJOC
   vo3EeVJmjdNjoZc/pi3JV4fAHwwGt6uRWwcQYI6GsjvdXrJC7leyLCAze
   ozTxiXoNmXg3Ab7NJ/UiZUgcgRpHHpPOpxB4OqqTE0EMEx8nNHcWDtAId
   f1x37a+gU8MEQ7fk1I/HbAlrCZ7kULKXltKH9kEpVRtFJ801v7A5zkVEV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3593402"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3593402"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 12:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="881791082"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="881791082"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2023 12:29:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2dYq-000CQs-1O;
	Mon, 13 Nov 2023 20:29:32 +0000
Date: Tue, 14 Nov 2023 04:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] pinctrl: intel: Add a generic Intel pin control
 platform driver
Message-ID: <202311140345.etMnKZeR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has kconfig file changed"
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231113123147.4075203-3-andriy.shevchenko@linux.intel.com>
References: <20231113123147.4075203-3-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Raag Jadav <raag.jadav@intel.com>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
TO: linux-kernel@vger.kernel.org
TO: linux-gpio@vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.7-rc1 next-20231113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/pinctrl-intel-Revert-Unexport-intel_pinctrl_probe/20231113-204318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20231113123147.4075203-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 2/2] pinctrl: intel: Add a generic Intel pin control platform driver
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231114/202311140345.etMnKZeR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311140345.etMnKZeR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311140345.etMnKZeR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:27,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/pinctrl/intel/pinctrl-intel-platform.c:10:
>> drivers/pinctrl/intel/pinctrl-intel-platform.c:217:37: error: 'intel_pinctrl_pm_ops' undeclared here (not in a function); did you mean 'intel_pinctrl_probe'?
     217 |                 .pm = pm_sleep_ptr(&intel_pinctrl_pm_ops),
         |                                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:54:44: note: in definition of macro 'PTR_IF'
      54 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/pinctrl/intel/pinctrl-intel-platform.c:217:23: note: in expansion of macro 'pm_sleep_ptr'
     217 |                 .pm = pm_sleep_ptr(&intel_pinctrl_pm_ops),
         |                       ^~~~~~~~~~~~


vim +217 drivers/pinctrl/intel/pinctrl-intel-platform.c

5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  211  
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  212  static struct platform_driver intel_platform_pinctrl_driver = {
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  213  	.probe = intel_platform_pinctrl_probe,
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  214  	.driver = {
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  215  		.name = "intel-pinctrl",
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  216  		.acpi_match_table = intel_platform_pinctrl_acpi_match,
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13 @217  		.pm = pm_sleep_ptr(&intel_pinctrl_pm_ops),
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  218  	},
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  219  };
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  220  module_platform_driver(intel_platform_pinctrl_driver);
5dacd710dc5f8ca8 Andy Shevchenko 2023-11-13  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

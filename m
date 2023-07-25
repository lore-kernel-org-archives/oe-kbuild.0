Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E00515AD0
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Jul 2023 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690286147; x=1721822147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xccp4biE2aLw6XU71p8BP5VdTEVc48UAM3Bx7naney8=;
  b=aRjynkQCrdaWQzJVqsshD1EVURrTwICUmRf4DqG4NzFyIf5srU8Ya7Ug
   Vt3RUO9g+9m+PJb3at5vvR9XPJ4SNUNxwXH+QfzsRY/7+VlikbeRRllbQ
   vl87JZwg7kcDrhGCbjgDYvOZpT1Rbew7CawFe4sJrgpd5Au+0j8jm1lcb
   r42L0+7pjsWxDyRfjVSyYaGTYPa3DHQy/OaTFFTLjr1b/3nKYQopJSh3j
   x59Z9vKJSEVSAo6SizVRHzFlDpa8guE28zY3k+RnfS19beFLvztHu25o6
   51lzXT3keZ2hzxHBQB1twfiR/IWOGCIu+y5nRiNl3ICG4X7JSUCHzpQfc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431500407"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="431500407"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 04:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="729324935"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="729324935"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 04:55:45 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOGdk-000AaW-24;
	Tue, 25 Jul 2023 11:55:44 +0000
Date: Tue, 25 Jul 2023 19:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v1 1/1] Revert "um: Use swap() to make code cleaner"
Message-ID: <202307251926.7em762sV-lkp@intel.com>
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
In-Reply-To: <20230724142307.28411-1-andriy.shevchenko@linux.intel.com>
References: <20230724142307.28411-1-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main uml/next uml/fixes linus/master v6.5-rc3]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/Revert-um-Use-swap-to-make-code-cleaner/20230724-222647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230724142307.28411-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] Revert "um: Use swap() to make code cleaner"
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: um-randconfig-r061-20230725 (https://download.01.org/0day-ci/archive/20230725/202307251926.7em762sV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251926.7em762sV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307251926.7em762sV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/um/os-Linux/sigio.c:81:28-29: WARNING opportunity for swap()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

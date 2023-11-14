Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCBB3E494
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMqGDYzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699964385; x=1731500385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YBkoZ42qemuVGrn17+cxWou1ELLcxVEbdzWooewEigI=;
  b=WMqGDYzHKCF6U1CXRovY4I5jrJiUohxlzFmWUazkKpXsxJ19aDjujIhZ
   S54fWS5PYMy7GVIMfq/0jKlOX9FCO8A7kp6yACXRdo5cym8r8OGqpjzrF
   udXs1/dwSOn6bhrnMZZNfEKCrp304bxlg53TPwi7mdAudfPlJ537Mt14p
   pzfX04oHQ33aPvmasEk1Q7li1EvK52kXXGZZaM8FcbmhUKWRUGLbmgUm9
   2Z8/VO/ti0rJa3OwocywZlFCg7YEaXkhj3uRJTVGlnFKGmQRTL23UcQCv
   eWU2Iwh5lqsZ1cGqCeE9CKF3kdv+BZpXUjjURfe/mW9nThCY2nq8XTZmZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3703591"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="3703591"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 04:18:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="855264127"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="855264127"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 04:18:37 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2sMk-0000El-0q;
	Tue, 14 Nov 2023 12:18:14 +0000
Date: Tue, 14 Nov 2023 20:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] perf: starfive: Add StarLink PMU support
Message-ID: <202311142041.nSLDeqju-lkp@intel.com>
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
In-Reply-To: <20231114021254.3009799-2-jisheng.teoh@starfivetech.com>
References: <20231114021254.3009799-2-jisheng.teoh@starfivetech.com>
TO: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
TO: Will Deacon <will@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
CC: Ley Foon Tan <leyfoon.tan@starfivetech.com>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Ji,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm-perf/for-next/perf tip/smp/core linus/master v6.7-rc1 next-20231114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ji-Sheng-Teoh/perf-starfive-Add-StarLink-PMU-support/20231114-101811
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231114021254.3009799-2-jisheng.teoh%40starfivetech.com
patch subject: [PATCH v2 1/2] perf: starfive: Add StarLink PMU support
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20231114/202311142041.nSLDeqju-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311142041.nSLDeqju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311142041.nSLDeqju-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/starfive_starlink_pmu.c:158:6: warning: no previous prototype for 'starlink_pmu_set_event_period' [-Wmissing-prototypes]
     158 | void starlink_pmu_set_event_period(struct perf_event *event)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/starlink_pmu_set_event_period +158 drivers/perf/starfive_starlink_pmu.c

cff226048d4861 Ji Sheng Teoh 2023-11-14  157  
cff226048d4861 Ji Sheng Teoh 2023-11-14 @158  void starlink_pmu_set_event_period(struct perf_event *event)
cff226048d4861 Ji Sheng Teoh 2023-11-14  159  {
cff226048d4861 Ji Sheng Teoh 2023-11-14  160  	struct starlink_pmu *starlink_pmu = to_starlink_pmu(event->pmu);
cff226048d4861 Ji Sheng Teoh 2023-11-14  161  	struct hw_perf_event *hwc = &event->hw;
cff226048d4861 Ji Sheng Teoh 2023-11-14  162  	int idx = event->hw.idx;
cff226048d4861 Ji Sheng Teoh 2023-11-14  163  
cff226048d4861 Ji Sheng Teoh 2023-11-14  164  	/*
cff226048d4861 Ji Sheng Teoh 2023-11-14  165  	 * Program counter to half of it's max count to handle
cff226048d4861 Ji Sheng Teoh 2023-11-14  166  	 * cases of extreme interrupt latency.
cff226048d4861 Ji Sheng Teoh 2023-11-14  167  	 */
cff226048d4861 Ji Sheng Teoh 2023-11-14  168  	u64 val = STARLINK_PMU_COUNTER_MASK >> 1;
cff226048d4861 Ji Sheng Teoh 2023-11-14  169  
cff226048d4861 Ji Sheng Teoh 2023-11-14  170  	local64_set(&hwc->prev_count, val);
cff226048d4861 Ji Sheng Teoh 2023-11-14  171  	if (hwc->config == CYCLES)
cff226048d4861 Ji Sheng Teoh 2023-11-14  172  		writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_CYCLE_COUNTER);
cff226048d4861 Ji Sheng Teoh 2023-11-14  173  	else
cff226048d4861 Ji Sheng Teoh 2023-11-14  174  		writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_EVENT_COUNTER +
cff226048d4861 Ji Sheng Teoh 2023-11-14  175  		       idx * sizeof(u64));
cff226048d4861 Ji Sheng Teoh 2023-11-14  176  }
cff226048d4861 Ji Sheng Teoh 2023-11-14  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

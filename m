Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96971E2853
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jan 2025 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738249636; cv=none; b=C1IH7IrawxnM7SQvKpaz2cElCQdugPGcHOSrHzhNaz62TPBu8nfCz8EVPy5/DNldXe6d4aY5Xq2Z/f+FKNdDsTz0J2HAl5Do8sqI2No86N7gmtXglUFW1xLjj5xFT1iy+YY8gkS6gUjVeHZaRf273Mmh+7KS91Xv+iE3bcR88ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738249636; c=relaxed/simple;
	bh=BrE8n3KbYTCzN5+ppfYTEhAnhp45vdi0HPZh2lNDb0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLEf6CnnEeMrNKgF4WWwlORPxsM31sYSfj3PIpN+SH4PQJhF/c2WvsGTxSyYI9y936U6ehl8/NIeWmIY64He9yvzf1ESku+Sa4PIfngvphnxXxPiXra6X0He2bgdmqIaKs638n1PD9YPqrXdYGFwKUpXwRLFUUyxCh9gIBGiFgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCihyVJI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCihyVJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738249635; x=1769785635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BrE8n3KbYTCzN5+ppfYTEhAnhp45vdi0HPZh2lNDb0g=;
  b=jCihyVJIpQllLbdUs2jeyjlbnbxTSOigSmkl8GDFUUuEeG+OvQlS8QPk
   q45kcxjDVZDNwU9o2i/aUVDHJngUU3mJ9PgHouiX/3nO/LQIMxkXBZfNp
   JTATNRzW0TR2j3BZfUvoE2Tfad3fcpwQSyc5RFWd63p6QFMYxAtdzygTo
   bIrWODm+g1vyLMkZ2UoS4nmMUwXYbtwe+7ePuFTFh59KCRguuj5Stdwnp
   swbUJc1+g//a9M/ac3ri++ujJGEABI0ZXqLri3E+f2DY+vO1W/splP39L
   QY0a83TVFoYpr1gjQr2nI9dFNVI9qXANkiUB40s6YRXs47G7DqTYCsKen
   w==;
X-CSE-ConnectionGUID: 4tm98e0NQCCyvSVFQ2oiBg==
X-CSE-MsgGUID: VHDE6OHyT6CHmhd4gDIHaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42720745"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="42720745"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 07:07:01 -0800
X-CSE-ConnectionGUID: czx7kVPRSr+8ln/yn+ssVw==
X-CSE-MsgGUID: 315mwjsrQ9uA51wXtTHhHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109202267"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jan 2025 07:06:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdW87-000kad-2x;
	Thu, 30 Jan 2025 15:06:55 +0000
Date: Thu, 30 Jan 2025 23:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.6 9/9]
 drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_pm_driver.c:
 mali_kbase_pm_mcu_states.h is included more than once.
Message-ID: <202501302243.u0JeSSn6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   20c6549501f674937409aba5411ee8c5c0ab133a
commit: 3347e43f1763e946c8db116bb3241731d1417cab [9/9] CHROMIUM: gpu/mediatek: Rename midgard to mali
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501302243.u0JeSSn6-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/mediatek/arm/mali/mali_kbase_mem_linux.c: linux/version.h is included more than once.
--
>> drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_dvfs.c: linux/sched.h is included more than once.
--
>> drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_eb.c: linux/module.h is included more than once.
--
>> drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_pm_driver.c: mali_kbase_pm_mcu_states.h is included more than once.
>> drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_pm_driver.c: mali_kbase_pm_l2_states.h is included more than once.
--
>> drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/gpueb/gpueb.c: gpueb_common.h is included more than once.
--
>> drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_notify_sw_vsync.c: ged_dvfs.h is included more than once.
>> drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/ged/src/ged_notify_sw_vsync.c: ged_log.h is included more than once.
--
>> drivers/gpu/mediatek/arm/mali/platform/mediatek/mtk_proprietary/gpueb/ghpm_swwa.c: linux/of_address.h is included more than once.
--
>> drivers/gpu/mediatek/arm/mali/tl/mali_kbase_tracepoints.c: mali_kbase_mipe_gen_header.h is included more than once.

vim +687 drivers/gpu/mediatek/arm/mali/backend/gpu/mali_kbase_pm_driver.c

   681	
   682	#if MALI_USE_CSF
   683	static const char *kbase_mcu_state_to_string(enum kbase_mcu_state state)
   684	{
   685		const char *const strings[] = {
   686	#define KBASEP_MCU_STATE(n) #n,
 > 687	#include "mali_kbase_pm_mcu_states.h"
   688	#undef KBASEP_MCU_STATE
   689		};
   690		if (WARN_ON((size_t)state >= ARRAY_SIZE(strings)))
   691			return "Bad MCU state";
   692		else
   693			return strings[state];
   694	}
   695	
   696	static void kbase_ktrace_log_mcu_state(struct kbase_device *kbdev, enum kbase_mcu_state state)
   697	{
   698	#if KBASE_KTRACE_ENABLE
   699		switch (state) {
   700	#define KBASEP_MCU_STATE(n)                                       \
   701		case KBASE_MCU_##n:                                       \
   702			KBASE_KTRACE_ADD(kbdev, PM_MCU_##n, NULL, state); \
   703			break;
 > 704	#include "mali_kbase_pm_mcu_states.h"
   705	#undef KBASEP_MCU_STATE
   706		}
   707	#else
   708		CSTD_UNUSED(kbdev);
   709		CSTD_UNUSED(state);
   710	#endif
   711	}
   712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

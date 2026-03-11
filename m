Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DF62D9EED
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 00:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773190430; cv=none; b=nuUq7gz2eU//9UQjgUNgspt9sYFA7B7xSwvqlRFwhwem5azw+c5AMhvQ7uuChhos124pFu1z5CS0ynAEErl/MDd8MMnda3ptmBkGRhQFfL9iPzVLDOm40CJyLXj+ow/krearLcmtktGf3i67paoucSKnzwwsoAjFq3EgskCRFU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773190430; c=relaxed/simple;
	bh=9lZrYE6kRPGqhk5x9jCl0CfgtmdH2z5VjoE7HTDUppM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZm+ycMIIxWyF6g88vM5x9eAcCySKndEGCsWQqHknUPVR9/pRIf/vHv+ru2Gn54FDs/wypQjxtgCU2yHhXNFU1sVmNS2Cn3nhUL4kTDUQJi1Jvr/9kdEBKKBaR/PviI+YOJhF93a/mABg/RO762Clp5aBP0kSxAUMa1SQjmyP9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPTGOb0T; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPTGOb0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773190428; x=1804726428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9lZrYE6kRPGqhk5x9jCl0CfgtmdH2z5VjoE7HTDUppM=;
  b=NPTGOb0TdHiniDddq5LLxn3Gu+ZZpadAr1MMi8HjKC0mDa3C3FOQ9gDn
   HMJ03PpyHp4+/dOG/dD2Y1Pf+lRiEIsNc4yHzoDNRd3ZIt0H7Xpbwsf2o
   tJ+NE9JLMWz9Llof8gH8lNuAKeJmQh82UQX+dVE0YUMNhjXR6p43tiN1b
   6PlCDD72H3WRRiKjclN4/dSCemcKjIMmICucaIfLP/qBh8jcJmtqsqJsY
   jFi+2y/GRfw97l0lzTszZgTg42yYOorYxOrB65gEuZIYMfy2GMa3mtcR2
   xyx5zJySA75wBbFwAHImjDrqllh8QTMPnLK5BuTYY1xT6fwFkLVB5vl/i
   Q==;
X-CSE-ConnectionGUID: hSKrUASfQF2N7vpgb5x/Sw==
X-CSE-MsgGUID: J4bQJh0jRoyYTDWWIaj6/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78137217"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="78137217"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 17:53:47 -0700
X-CSE-ConnectionGUID: qLAQRw0eQh2hkB8FOqEHsA==
X-CSE-MsgGUID: KeabAo/QSsS+GD0nDu/1sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217011620"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2026 17:53:46 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w07pY-000000003BB-0d56;
	Wed, 11 Mar 2026 00:53:44 +0000
Date: Wed, 11 Mar 2026 01:52:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 24/26] PREEMPT_RT injection
Message-ID: <202603110102.VTpPsvel-lkp@intel.com>
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
In-Reply-To: <20260310115709.2276203-25-dev@lankhorst.se>
References: <20260310115709.2276203-25-dev@lankhorst.se>
TO: Maarten Lankhorst <dev@lankhorst.se>
TO: intel-xe@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: Maarten Lankhorst <dev@lankhorst.se>

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-i915/for-linux-next]
[also build test ERROR on next-20260310]
[cannot apply to drm-i915/for-linux-next-fixes drm-misc/drm-misc-next drm-xe/drm-xe-next linus/master v7.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-vblank_work-Add-methods-to-schedule-vblank_work-in-2-stages/20260310-205630
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260310115709.2276203-25-dev%40lankhorst.se
patch subject: [PATCH v7 24/26] PREEMPT_RT injection
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260311/202603110102.VTpPsvel-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110102.VTpPsvel-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603110102.VTpPsvel-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: Module.symvers is missing.
Modules may not have dependencies or modversions.
You may get many unresolved symbol errors.
You can set KBUILD_MODPOST_WARN=1 to turn errors into warning
if you want to proceed at your own risk.
ERROR: modpost: "libnvdimm_test" [test/nfit_test.ko] undefined!
ERROR: modpost: "nd_region_provider_data" [test/nfit_test.ko] undefined!
ERROR: modpost: "devm_kmalloc" [test/nfit_test.ko] undefined!
ERROR: modpost: "platform_driver_unregister" [test/nfit_test.ko] undefined!
ERROR: modpost: "to_nvdimm" [test/nfit_test.ko] undefined!
ERROR: modpost: "gen_pool_create" [test/nfit_test.ko] undefined!
ERROR: modpost: "seq_buf_printf" [test/nfit_test.ko] undefined!
ERROR: modpost: "device_unregister" [test/nfit_test.ko] undefined!
>> ERROR: modpost: "rt_mutex_base_init" [test/nfit_test.ko] undefined!
ERROR: modpost: "__nvdimm_create" [test/nfit_test.ko] undefined!
WARNING: modpost: suppressed 82 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

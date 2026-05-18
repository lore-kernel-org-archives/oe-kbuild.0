Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1379039A050
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141067; cv=none; b=VT02b3d9bfXn4DfpSW5I8t+usDBlVjlZkdqOCEHo/oUjJmp30EDkTiSUjbMrd/eX1YSL2a22xvYLsIn3UQu16PbiH9QX6pEh/mSHf/uNOUqnIvbj7dMwwMAuauRzwFlwkhoXGqts1GmBV8Kv1/RTN73jZVDpyNEeBgLs/KdIoE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141067; c=relaxed/simple;
	bh=wtURl9l8Yy1ZkFTvOfHHKOie6RnaEELi036opxganUw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E6PT2K1/o33ZCnAwfrKYsoRkaK51pvTwuFDEz8T3D3V9n0jEXRMwSaj2rt+uVtF/AVH1u7FJLfuFHOjQ/eKXkPrU4/36SbdUAy+1n4SjpjCwk6Cc5wkxHB5j+Y/xIwuTsi1bVWEPBz8KmjesJRDHNOhIhXeS8B4XRNjU4Z+Dkq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acQ//Kdk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acQ//Kdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779141065; x=1810677065;
  h=date:from:to:cc:subject:message-id;
  bh=wtURl9l8Yy1ZkFTvOfHHKOie6RnaEELi036opxganUw=;
  b=acQ//KdkzTHDnruS7eo46Fnu+J/N0vZYXx70Vohj1WdV+V0p6OsHPVwh
   INKr2XpJRxajCSRJCLEcCMxxAtR1CO7I8lBrn2bB9sMZIt4Bgvt+kJbk0
   1hq+205ijmfuWWO3KGghL2BMd7/vcJ35C5N1DEDrN5FoN0+Of+r7H+jXi
   foUeWvrRxfIqC/JUzI2jlhPaix+MGoJt3/0OjXI5+Bvg8HT1FzK2IrCJS
   FE3fdAw6KJYjI/vW12e3Fl/OG5QkDpvAF4pPk4YJd6nr7le8pdUESNN7b
   S6yuHfNHzgMTigx5oyZthEjYW5Ko+fbU14OZbRmGFjRqwvXsLUZcC5yp/
   w==;
X-CSE-ConnectionGUID: aIwttQ5RRjejT3W1gYCW1Q==
X-CSE-MsgGUID: WX11L6JBQX6YwWrKam/7pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80041092"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="80041092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:51:05 -0700
X-CSE-ConnectionGUID: AAp1l3fBRPG3lDs53Gwc3g==
X-CSE-MsgGUID: FqU/S2GcSpOvXv8F6dN/Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="233178102"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 18 May 2026 14:51:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP5ra-000000009wz-09Fp;
	Mon, 18 May 2026 21:51:02 +0000
Date: Mon, 18 May 2026 23:50:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../kselftest_harness.h:1264:12: warning: 'test_harness_run'
 defined but not used
Message-ID: <202605182348.mAlZmFQ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tarun Sahu <tarunsahu@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tarun-Sahu/liveupdate-Add-LIVEUPDATE_GUEST_MEMFD-config-option/20260518-184146
head:   f3f1cf3afea13caef26e96b7838b73a301fda2e7
commit: f3f1cf3afea13caef26e96b7838b73a301fda2e7 selftests: kvm: Add guest_memfd_preservation_test
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260518/202605182348.mAlZmFQ1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605182348.mAlZmFQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605182348.mAlZmFQ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from guest_memfd_preservation_test.c:37:
>> ../kselftest_harness.h:1264:12: warning: 'test_harness_run' defined but not used [-Wunused-function]
    1264 | static int test_harness_run(int argc, char **argv)
         |            ^~~~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

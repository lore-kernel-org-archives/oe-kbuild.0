Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCB53672BB
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624674; cv=none; b=UFMb5PGZK5QSVvcr7PWTkrSVIluvsZSWd7Y3eomlRWBK1v4I7PEUbGO0eaciYdva/oZWBSrbp8TCkyht+EVnqdyj0CgiF+7oXE7AVZqFHgVz76hx8+tHEN7zPyJnp+hWvbogH5lTl0Y+B6VeddqwcvB7fdlVkg0jNplFgKlH8oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624674; c=relaxed/simple;
	bh=krEbiT5HzSLc+347L1gNr1WBEt8UowYTrsDZUauay+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c+k8PeGhz8S/EhkXE70RLy5zGIPCVmK8O7/zHgpF60I+mQy/dMyTZAxNlKM6ILX7/CIZT0Bd8OePlZuY5vAzdWgierwORQA94jWvpJFXbQkfTIG8yB76ShuJlqFR9S7Q0v0LwGJPkjYjlV/d1whFH6RmJl2kbJ4OER9ldieOg48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EureOQph; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EureOQph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778624673; x=1810160673;
  h=date:from:to:cc:subject:message-id;
  bh=krEbiT5HzSLc+347L1gNr1WBEt8UowYTrsDZUauay+o=;
  b=EureOQphjpWlbSomsIrSE96L3Qh81APu3b1kuH327zIUi3Z7UcKXZhxs
   m1Icwiwq4yKK87vlGKA2xt6urGU1Eto+77/0lpTqBGeMki2WhDGo35zj6
   EFqoG+daBSZUpaQLpiWj+zNQp65on1M6PAdQdNINvRm1xI+iHg3AIYqwv
   P+8jp+zEJhbPH7As3mTndjshF6WXZT3st3X7pq7XW94vE1bKo1+l4B+D0
   vcFPb3fcDwqL48Wh0UL56fn/nM5PK/rgtWf74w2bxsxoctWkBT2kvlONh
   wq5XgZsulIQpXEgdSRkcHBMhzEHgzm58CdzKsB3p/PXfQDMFqUNpYhIqk
   w==;
X-CSE-ConnectionGUID: 8ATiRneuTeuv7qgxR2aPJg==
X-CSE-MsgGUID: qVEC/1dESlGlFIeK2ioqIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="96972751"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="96972751"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 15:24:33 -0700
X-CSE-ConnectionGUID: IPeSHR7URVOM2jwhSJmSbQ==
X-CSE-MsgGUID: GADcxS2kSUKheqJzJHDxOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="268241214"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 May 2026 15:24:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMvWf-000000008Mj-2UFf;
	Tue, 12 May 2026 22:24:29 +0000
Date: Wed, 13 May 2026 00:23:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: x86/sev_smoke_test.c:231:13: warning: 'test_sev_smoke'
 defined but not used
Message-ID: <202605130053.LhXDf3Xj-lkp@intel.com>
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
TO: Ackerley Tng <ackerleytng@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ackerley-Tng/KVM-selftests-Initialize-guest_memfd-with-INIT_SHARED/20260512-184801
head:   bdb144cb86b6b1bf65cdbd4097bf557b940e24e4
commit: bdb144cb86b6b1bf65cdbd4097bf557b940e24e4 KVM: selftests: Test conversions for SNP
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260513/202605130053.LhXDf3Xj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130053.LhXDf3Xj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130053.LhXDf3Xj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> x86/sev_smoke_test.c:231:13: warning: 'test_sev_smoke' defined but not used [-Wunused-function]
     231 | static void test_sev_smoke(void *guest, u32 type, u64 policy)
         |             ^~~~~~~~~~~~~~
>> x86/sev_smoke_test.c:73:13: warning: 'guest_sev_code' defined but not used [-Wunused-function]
      73 | static void guest_sev_code(void)
         |             ^~~~~~~~~~~~~~
>> x86/sev_smoke_test.c:43:13: warning: 'guest_snp_code' defined but not used [-Wunused-function]
      43 | static void guest_snp_code(void)
         |             ^~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

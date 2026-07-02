Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BCC282F15
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 03:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964635; cv=none; b=siGFRMFcaC8RPwwpX61ZWap3wU0ONLr9ulv2fuNTupYlTdr4oKW+NnZNSOMfhXT5TLHGW1qntVATf9GqVr9bSxy7xJ7qNRtVRrDwKM5oivPionGkx8eBkSlR1rYDdOupLOT0KfyeBWQyT3mwBhgVzmWDYY9gWSaf2RotIuURH9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964635; c=relaxed/simple;
	bh=Bo5qjS6IqcD3ofDzQacy55O7pxWKbYfIGra3JE8z/1o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B05VnCfCljdJexbSPcoY1K0vCLZr5MtYFlU1u4RD7GNctald88KSZQeaqMIiWZ78MLV4VPckE6OCGWS8gYXQCtd9Yz/g39bN/nXkczadu7IR8GGKuwcLaAP4xiWUgB0sJSPtukQyWBla9v+hcZFPDwQbZABsBUIO63fQghCcfa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C9m/70nW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9m/70nW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782964634; x=1814500634;
  h=date:from:to:cc:subject:message-id;
  bh=Bo5qjS6IqcD3ofDzQacy55O7pxWKbYfIGra3JE8z/1o=;
  b=C9m/70nWFvH7mvOZr5XnWlKvs1GMXi8QOHNbx1+N7h3giGy6L3gxDO7+
   yjkaOvd469ooXFkBXFTzZcKfUKv2qCHRz+4NadFv3AN6EjwvPINhvFMll
   9FhcqEUiE4k6BMQPXALtGq4HcD44+vOYJq3BPX9MybT4bVpi0oRv3kIYn
   jExJTyE9qPgoM7QXaQFOOwJGBYh1F0Q4RagqpiQheRWLWP7PnuFC6hIl0
   iBcnHX9J1e3NatouzCsm2N90QyNp1VpAE04/oSAec9M2dJNXrOBsY7XJh
   8btO9GbpGaZUzKulHr45mQGWPQyMDwTA1R4l4x7JFA1xiIQrtneDMhtmB
   Q==;
X-CSE-ConnectionGUID: XvMkx70xRred3KNO9qunOA==
X-CSE-MsgGUID: VTZUtPu6QayNRB0OjgisIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83578063"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83578063"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:57:13 -0700
X-CSE-ConnectionGUID: 9LKE0XMVRwiRjv7Xa+XPig==
X-CSE-MsgGUID: Q6nflFznQeC1dwXSCWG71A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251697954"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2026 20:57:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf8Y2-000000009xj-07Rz;
	Thu, 02 Jul 2026 03:57:10 +0000
Date: Thu, 02 Jul 2026 11:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: vmlinux.a(kernel/futex/core.o):(function
 futex_init: .init.text+0x408): relocation R_RISCV_HI20 out of range: 563901
 is not in [-524288, 524287]; references ''
Message-ID: <202607021114.oGQ0cxo4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20260702-004403/K-Prateek-Nayak/x86-runtime-const-Introduce-runtime_const_mask_32/20260630-130124, commit: b6e8471b174f2264b132157c6a5b58fd8935e1c9"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: Peter Zijlstra <peterz@infradead.org>
CC: 0day robot <lkp@intel.com>
CC: K Prateek Nayak <kprateek.nayak@amd.com>

Hi Peter,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260702-004403/K-Prateek-Nayak/x86-runtime-const-Introduce-runtime_const_mask_32/20260630-130124
head:   c5019a5edc81040af1fdd5cb6685672b7d09cf6e
commit: b6e8471b174f2264b132157c6a5b58fd8935e1c9 futex: Use runtime constants for __futex_hash() hot path
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260702/202607021114.oGQ0cxo4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021114.oGQ0cxo4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607021114.oGQ0cxo4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/futex/core.o):(function futex_init: .init.text+0x408): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by core.c
   >>> defined in vmlinux.a(kernel/futex/core.o)
--
>> ld.lld: error: vmlinux.a(kernel/futex/core.o):(function __futex_hash: .text+0x53e): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by core.c
   >>> defined in vmlinux.a(kernel/futex/core.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

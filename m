Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D326F383326
	for <oe-kbuild@lists.linux.dev>; Mon, 11 May 2026 23:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543183; cv=none; b=kE+TNlnvd164Q1QcUkYSVo2F41dKFFtVvrFtmDhDYQv7tMZXo5P8d154I8DyDZpaLMteD1nO/uqQEn7HQpVtWmel1kjet00fmkrE4WSWIwrkhIrzEA5TnZxFJgrmcoKWHOz+vSn4URhlumtWwimXViZLHRJ7Ih365LsAwBMQVh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543183; c=relaxed/simple;
	bh=6xUhfI2VMcUo4YhpZ1Bm8f4+l0hNyAse5rVT8l9dA/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1patP/LJjxLAZ57ahs8b2GxfPT4hoOjBh9avlsOBoT0K7MT9XyrKzdhU1nsRGXY2ercRpKtEKOsvxWtrHGiscaL/nQ95ieTW9N+duD5sCfGF5fVoZ3qG3dsj+PQ/OQab21gB2NFUG3s+bsfGn5+3dJ6Dk8r/JRcoD0KTBkENtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEIR4V+t; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEIR4V+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778543182; x=1810079182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6xUhfI2VMcUo4YhpZ1Bm8f4+l0hNyAse5rVT8l9dA/w=;
  b=QEIR4V+t1iB0jWam258ynXKQnSgFRpvL07lbopmBKZ5z4uZzN5Zmem85
   iZ1vp3w3VRYqe+j3UdcQZuniQVK8EFwCSLG73/MioRInrZBAY+3MUmN1a
   aaTjpVUf7Mbzb21X2jJcp/XjOFlCA/Ks3huowZ2fknhKMqZDrOsRMXyls
   lvgYuf+y0g75fNPTK63Dx6BKH7OSylMuvPC3Pj6BVR/Mn9QRQcAdr1arv
   Q5Dj201yAadGsZKpPs+OXOjlZY4a4e+Qyn7iqOszY+1GYvA30kEJ/0qZU
   LveRhhcSnk0LVUm+s2HRDnpDxruWFjUGgkUuc0glWWIc5yWvG+xiKSMsn
   w==;
X-CSE-ConnectionGUID: c4O/OhWgS7GQZcVSb3EcqQ==
X-CSE-MsgGUID: 5YcgZvNNQ1aWhsVSb0qh7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83060042"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83060042"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 16:46:22 -0700
X-CSE-ConnectionGUID: 2vQVZS3/QUKnRNg7gWd58g==
X-CSE-MsgGUID: dNIEyBEtSe+Q1w9y6x50yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="242571686"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2026 16:46:21 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMaKI-000000001IH-0vTX;
	Mon, 11 May 2026 23:46:18 +0000
Date: Tue, 12 May 2026 07:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
Message-ID: <202605120733.lbNtw1cK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260507023232.4108680-1-shuicheng.lin@intel.com>
References: <20260507023232.4108680-1-shuicheng.lin@intel.com>
TO: Shuicheng Lin <shuicheng.lin@intel.com>
TO: linux-doc@vger.kernel.org
CC: Shuicheng Lin <shuicheng.lin@intel.com>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: linux-kernel@vger.kernel.org
CC: intel-xe@lists.freedesktop.org

Hi Shuicheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuicheng-Lin/scripts-kernel-doc-Detect-mismatched-inline-member-documentation-tags/20260511-164914
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260507023232.4108680-1-shuicheng.lin%40intel.com
patch subject: [PATCH v4] scripts/kernel-doc: Detect mismatched inline member documentation tags
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260512/202605120733.lbNtw1cK-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120733.lbNtw1cK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605120733.lbNtw1cK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:234 Excess struct member 'pvr_dev' description in 'pvr_mmu_backing_page'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'sgt' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'sgt_offset' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'l1_prealloc_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'l0_prealloc_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'l1_free_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'l0_free_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:234 Excess struct member 'pvr_dev' description in 'pvr_mmu_backing_page'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'sgt' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'sgt_offset' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'l1_prealloc_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'l0_prealloc_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'l1_free_tables' description in 'pvr_mmu_op_context'
>> Warning: drivers/gpu/drm/imagination/pvr_mmu.c:1462 Excess struct member 'l0_free_tables' description in 'pvr_mmu_op_context'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

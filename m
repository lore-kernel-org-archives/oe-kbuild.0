Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA9D4D8CE
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 04:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764909239; cv=none; b=BA6AsA/Pm3+fkzzWiip17UnvnViFfeVtppJMNMOTVyImL1UuGvVL5g+mgHSBVjr4dUesQ8AGrd7Hdlu8dD9V8Nn0h/Rh7QZgLlldT3LYATxZ9P7ykuBr40ZBUfkSyCWNoS+Q6XLSjYc5ERv6j6ZnV2yEvQLNU3vexV4aZRPsUzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764909239; c=relaxed/simple;
	bh=IZFLerQXOb4oD7TIfo75/XLRg3j38Bm4RdolToMgPOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdys3bE5UMcKIWOqDwqbb6g8I8km7HgtiIbMRrhjiwVhQmDDay3XZ/VPBttzRgQ2/i6EeaGA0G3tLXbpoMtQUgtDHtNEZ2uU40PDKrfd7wHwbLrAMMGG4BSlNddZz0uIqWkw17ZIMQvQ5FkoLwtfkuFCjj/agJq0PgTOQcBij/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ug5RmvS5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ug5RmvS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764909238; x=1796445238;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IZFLerQXOb4oD7TIfo75/XLRg3j38Bm4RdolToMgPOk=;
  b=Ug5RmvS5/NcgAdrQLeejPw1KLRo781PeO002KYinnNBiem7lRDg3AhF0
   7+jIxQTGU+GSWVFtNIqe4XElnGO//wVWs01c03+Cjy43KWw/dWCu4Aml3
   chrQeTueMTq/De9UTHT12RiFWescoSGJb6LHkJJAlcB351Wep90ZBvXat
   j0TsPMK/lgD2SVsE48NpBLyT0F6vIlk0r5P4ROOpMUigaiOjrbI1Xh2lO
   y/YAz3dxmWZHZvYaqeeTy5/p1vwR+AYsA/jHcLOoNETdCxJayivSh8WVS
   yXwqitWzIjDVml05/NMkELZ62r1cfPjqzzlNUYbjQZNsyiRtfmTHh3TdQ
   Q==;
X-CSE-ConnectionGUID: xovoaSSBT6KTfNLn6I7NUA==
X-CSE-MsgGUID: bQGjPcwYSnGoBv8+mi9J8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70790458"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="70790458"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 20:33:57 -0800
X-CSE-ConnectionGUID: KuFdB7eIRMOkiyqFSEPuiA==
X-CSE-MsgGUID: k9FK/ZNwQiKy+LC300OGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="200318242"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2025 20:33:56 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRNVx-00000000Eau-3lki;
	Fri, 05 Dec 2025 04:33:53 +0000
Date: Fri, 5 Dec 2025 12:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/xe/xe_vm.o: warning: objtool:
 xe_vma_destroy_unlocked+0x80: unreachable instruction
Message-ID: <202512051221.cuPRUvye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43dfc13ca972988e620a6edb72956981b75ab6b0
commit: 8f25e5abcbfb9cbcd923021774f2e785db3f7f55 drm/xe: Convert existing drm_exec transactions for exhaustive eviction
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051221.cuPRUvye-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d8b43edf552840e59a22a7f3cc332697bd434782)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051221.cuPRUvye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512051221.cuPRUvye-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm.o: warning: objtool: xe_vma_destroy_unlocked+0x80: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

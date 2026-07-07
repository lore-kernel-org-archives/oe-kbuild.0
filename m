Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1F425C80E
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jul 2026 18:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450134; cv=none; b=AVAjcqFL4uwz7j/8OiAq5vNcmbNx3ereNkss0NNT3F1/qik0j85W2FXzFcnXGt9kY6+Wiw/bWa7Kp3PtcASHa2KKxFcDkVpWCywK08f0b9yBonNqcouJPGSaSySIGn+Z7h5BbdEB85Kw1WvTgfGVVuj7MWF0DhRqrjGGOAmFKh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450134; c=relaxed/simple;
	bh=YZa8L4TKLSy/AUba6Nd6NMd9avXH4dL+h9X+YGRFmtM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YbRCGR8+BgY5GxmhfpmmvI8wbakEp8XGRVcmxMsh2VPkJEH+y6lhnuT1CElMg0FxJAw3vOnluE9N4oAL6Yp6O/uyu6T1meCZSbFdU6QTninVeJhQuwCwUvNw4RP5JOhRhfXTzQtSiY5bFMlobqPT9DQoDacbeeEMXi/JkbFXBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPY0hm8T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPY0hm8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783450133; x=1814986133;
  h=date:from:to:cc:subject:message-id;
  bh=YZa8L4TKLSy/AUba6Nd6NMd9avXH4dL+h9X+YGRFmtM=;
  b=DPY0hm8T3BVYqYsXTvLTCC2Y3qul/DzNeJSKOMM/n2eCTtx5E6jjbSKe
   H2gyvCtb3MkWIoStrrzkTQhNEjyvprR0leZIWULyaI4PBpPb+Z9mxMVns
   VbuAUA7nBmdQki649lLlICrmXcd4UCEpcJOgVd2fTjlurn6k0LkGe8TGw
   MhBAZOoxAFWRDNiPIETR1Gyjbhk/5U325XyF79bEXHcRZLH3aS+wbsT7/
   XXCucf23G0WAkr4w5XSAMZLPZPjB0d7KHl7kLF1SGY6cpfDpNjihxFgAR
   xynochC2TpOBccnXgNSTRTJKwM0oKjS5vc9BsVxp2H8FjMLe6LZIRAfYL
   w==;
X-CSE-ConnectionGUID: gu+euoDUQlWZv7Hw9em4wA==
X-CSE-MsgGUID: TJoLEOkjSWCeu5dagtVCOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="71628674"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71628674"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 11:48:53 -0700
X-CSE-ConnectionGUID: BzkmfC8HTqeLUxVV1Wd62w==
X-CSE-MsgGUID: Zst3yoFDSY2asF1evaRmYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254149609"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Jul 2026 11:48:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whAqE-00000000FaB-3Vq3;
	Tue, 07 Jul 2026 18:48:30 +0000
Date: Wed, 08 Jul 2026 02:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 trace_define_generic_fields+0x8c0 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202607080240.7Avbq5g9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 56cb9b7d96b28a1173a510ab25354b6599ad3a33 gcov: use atomic counter updates to fix concurrent access crashes
date:   6 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 weeks ago
config: xtensa-randconfig-r131-20260707 (https://download.01.org/0day-ci/archive/20260708/202607080240.7Avbq5g9-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080240.7Avbq5g9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 56cb9b7d96b2 ("gcov: use atomic counter updates to fix concurrent access crashes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607080240.7Avbq5g9-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: trace_define_generic_fields+0x8c0 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

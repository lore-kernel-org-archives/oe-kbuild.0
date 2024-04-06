Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06774C9F
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Apr 2024 04:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712377222; cv=none; b=EcF1p1njNZydgWVKDLv4aziGWYpGOKQZQdgsz4WVOw5mXrlPLkWnLeuqjgi/2jGz782UfPJSa3csGU8E3fiLj5DRYjlQF3wqkC1O9KQYStYjyWqDLFhDKHlrSB4NIFZxAYXyCwlgTSnwuebIz80c9ZFsdj7KBRZKpRXSK/9hFz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712377222; c=relaxed/simple;
	bh=43gDJluJa8J6AgKgxO3C+PaLQJ4Ezg6oMgfzPaTDemA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPN/+4JoXRGuBOuGKFrq6nWJp9q/yzOQcdCQOfPnqP7vLRBB7n8ZLavimM8BuO5jVMht12XEC59oag4/Ef+DOdSppxnLoZIRcNPAAVWA+u5dykqHyJll3Vm5IkQkfkTektId4JA7ebPVtJ/f3V0mfZl9jLtBIEGvLB7YftAVYzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNLhVd5j; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNLhVd5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712377220; x=1743913220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=43gDJluJa8J6AgKgxO3C+PaLQJ4Ezg6oMgfzPaTDemA=;
  b=jNLhVd5jzjLu7KIAYWRPRiDAzwRMiamC9VcbSJ7Cak+wkIJfcpd5Wk1S
   4O3yCUaYAkkwkHIRoVl51nkz510n2xl1SZHe4GP9hxk7rOxsuKS96VgUy
   RxUKd2jflVM9xy9Jfs3e9HM9z3Wjdr7yRT9pP3oKibsuQPSzZwnL/jeHV
   rgJ6xIhSo9jPF/nN4sVLKUl3v23ctUOMtzXssEff2h/i+4knDZ4UUsWqy
   gb+jaKlcPgnI6lFDRFvwRNr2v9NE/UDm+ZlK9IPp0Z1yIkrgapgy5ujgc
   oLIgWaOiDRPyYe4/fwQKBIR6RgP/l3Yt2+JYNkqXJfUcsFAkv+hQsblkG
   A==;
X-CSE-ConnectionGUID: P8B0ZeljR82j/mRobn8m9Q==
X-CSE-MsgGUID: 24w8BO/tTPWn2F7l3581nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="30203029"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="30203029"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 21:20:20 -0700
X-CSE-ConnectionGUID: fXEL7NuaRcq1Ek2VjvHt0A==
X-CSE-MsgGUID: G3jHLZwjTjOfg4v07cSKzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="24048636"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Apr 2024 21:20:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsxXL-00036O-2B;
	Sat, 06 Apr 2024 04:20:15 +0000
Date: Sat, 6 Apr 2024 12:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/vmcore_info.c:14 arch_crash_save_vmcoreinfo()
 warn: argument 3 to %lx specifier is cast from pointer
Message-ID: <202404061259.0tZv45AL-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Baoquan He <bhe@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   104db052b62d3320fd30b23416dd0b2a4ff3b85f
commit: 199da8714c8f4c45f46509c5eb188f5551404574 arch, crash: move arch_crash_save_vmcoreinfo() out to file vmcore_info.c
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: powerpc-randconfig-r071-20240406 (https://download.01.org/0day-ci/archive/20240406/202404061259.0tZv45AL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404061259.0tZv45AL-lkp@intel.com/

New smatch warnings:
arch/powerpc/kexec/vmcore_info.c:14 arch_crash_save_vmcoreinfo() warn: argument 3 to %lx specifier is cast from pointer

Old smatch warnings:
arch/powerpc/kexec/vmcore_info.c:27 arch_crash_save_vmcoreinfo() warn: argument 3 to %lx specifier is cast from pointer
arch/powerpc/include/asm/mmu.h:229 early_mmu_has_feature() warn: bitwise AND condition is false here

vim +14 arch/powerpc/kexec/vmcore_info.c

199da8714c8f4c Baoquan He 2024-01-29   8  
199da8714c8f4c Baoquan He 2024-01-29   9  #ifdef CONFIG_NUMA
199da8714c8f4c Baoquan He 2024-01-29  10  	VMCOREINFO_SYMBOL(node_data);
199da8714c8f4c Baoquan He 2024-01-29  11  	VMCOREINFO_LENGTH(node_data, MAX_NUMNODES);
199da8714c8f4c Baoquan He 2024-01-29  12  #endif
199da8714c8f4c Baoquan He 2024-01-29  13  #ifndef CONFIG_NUMA
199da8714c8f4c Baoquan He 2024-01-29 @14  	VMCOREINFO_SYMBOL(contig_page_data);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

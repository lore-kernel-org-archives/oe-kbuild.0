Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF037E2E3
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773140562; cv=none; b=IiWA45WpN5w3BewQceWOI4mMbyGx/gtPg38BzO2wsiKEL8FvG7g2lR/HXbHdtVGUYkBdGzPtjNlCdZ0A4tcH4gZo5vhq8V7IDClR8RnkHEq8AsEQzIFz5riDdgsCqmmOrpi82uQgNBKi7FI0ReU/Tc4iC+5mVyNzSjw84idZFYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773140562; c=relaxed/simple;
	bh=Nt51HDepHAnZXB6R2VEzBehklw6pMbsmugxaigqCR5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pEdo1vjX25yDADEeXtWtd3713LOkf2FX5e/dIBHO2rbo+pvf2p91lDLc8wVdAusS5p2HX1EDp/RVEAXLJoiph3plK0l6bnhgMFDKXu8qFbaQY1juYyFUqROu/8Zn2SEXknXzlMdPd9j1B90weRdGzjdr6nvqCR12WuhPvMX1XmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4aLTgwD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4aLTgwD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773140560; x=1804676560;
  h=date:from:to:cc:subject:message-id;
  bh=Nt51HDepHAnZXB6R2VEzBehklw6pMbsmugxaigqCR5c=;
  b=L4aLTgwDnKIRuLMXUtPhGOEKaBo/yODbrve5P7S2G2Q2dR/ZUUUzxnGg
   fr7EPCnbK+/BmRGbtDhlpOGYhbKw0woH6mntb9OyUVz1aNDvRfTbzAKur
   Pa+svvqcQKn8K9k9Wo0KQYF2FziXqcVY4iCxpR0KzROQhdh5YEHoiwomE
   xRItfF1zGf4zs5+e5VJIviNYOmTeyfJequYmrUA9L4b9UnBn42RfBccP4
   r6K3PTGkhA8yEJqjJ26KPfYgM+/M57adidbeRzlhqIdq+gD7KGbYHAZQJ
   uSeD47fZf5+GM/pu0ldlUQloc6FcJg5laPHrqV/0m4K8V0EqCq7gCKpGj
   w==;
X-CSE-ConnectionGUID: ytoin9xmSyKH7UZSe7W2KA==
X-CSE-MsgGUID: KoIZgne3T86652cJdLyqLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73883428"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="73883428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:02:40 -0700
X-CSE-ConnectionGUID: 8nKK6vq/Thy0CgBTycPTDw==
X-CSE-MsgGUID: vFDd9RcPTee+BYzMVPhxaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="218056060"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2026 04:02:39 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzurF-0000000033J-0TN9;
	Tue, 10 Mar 2026 11:02:37 +0000
Date: Tue, 10 Mar 2026 12:02:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18 8/8]
 ../../../mm/vma_exec.c:11:10: fatal error: linux/page_size_compat.h: No such
 file or directory
Message-ID: <202603101119.g2oVjkFs-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   101091fb45e6443d391ad3dccc311d1bd183d2d7
commit: a1696054f15012f51a240bf06cb76fbdddac14dc [8/8] ANDROID: 16K: __PAGE_ALIGN stack_[top|base]
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260310/202603101119.g2oVjkFs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101119.g2oVjkFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603101119.g2oVjkFs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from vma.c:32:
>> ../../../mm/vma_exec.c:11:10: fatal error: linux/page_size_compat.h: No such file or directory
      11 | #include <linux/page_size_compat.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

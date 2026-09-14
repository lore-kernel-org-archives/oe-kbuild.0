Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE26339387
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409356; cv=none; b=fsI0MwZS8u++wmiXz2Xd9M43jlaA34akWmWC3d2cSQlqU0TGADzZcCHsanMEA6gi4SrXqSvP8mc7JLL4b9e+nZL7tcxNlovxil+iQUfmgErMywsdJzLT2IPy4Bb9sYzkh45GmLh467AOTNIIpj4I0GW5nq90JP3ThNpRBDpKYhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409356; c=relaxed/simple;
	bh=QC42qLcEhmGQ1oliLBZQhRk7ue4ZsfnMyZTD9h4EGbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IOkLBJTqJ+qbke91rH3XMi3UcBRNuz1UUMLE9Ppd+TiS+lt2XfLK/8ur2/C8hBU+2tNY0MR9Khr2BJbny9J0JM3MrO+YPV2YU0VjPHTgY6zjVsSk7ACgx9AJEabR2qXc51hrJhREv6gYj8GEbyXZDCAfjdVhQdRl+fge9SpJ00M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiYeI95x; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiYeI95x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789409354; x=1820945354;
  h=date:from:to:cc:subject:message-id;
  bh=QC42qLcEhmGQ1oliLBZQhRk7ue4ZsfnMyZTD9h4EGbk=;
  b=SiYeI95xSKMPD8Y8TNCkoTF13lktcIE5RUDZw+zuDpOqacpZs/6LQc/y
   pHbe2gEOQdXMlUbLkjj1jKt/p00y1UBi0uxkEAtwQ3dwB/W0luDcFuoLv
   8ulvk4ZMPEMwt0V9HcEst3PXDbbXIKBcCWwfKkO0RrJ0zpNP3zrhN0Bc7
   Dlr8XjKK/EwS7BqoH81r9WcpLnq3Kq2UuJFShQfX00hIWfPDAsvE4lf+p
   ndudvDtVm2IcNJcU6omL4D6yfn+Ahw13CGWIS0FBpCK0Bkr6bcIlHQp7u
   ExAH7NI/BGmple5eyfbJDixuegXGW+bOdm7c9xyVKISrDHsNfxyTVl360
   g==;
X-CSE-ConnectionGUID: a1DT9XG+TbijjbZZv3m4bg==
X-CSE-MsgGUID: zWE5zN3ISUG4MUArGKmYKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107138552"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107138552"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 11:09:13 -0700
X-CSE-ConnectionGUID: hRtUbqlBQ8eYRx9mw7tBLQ==
X-CSE-MsgGUID: 83jg9quKTzm3zLOwfzjhfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269028991"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 11:09:12 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6B78-000000000FX-0e2v;
	Mon, 14 Sep 2026 18:09:10 +0000
Date: Mon, 14 Sep 2026 20:08:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/f2fs/gc.o: warning: objtool: do_garbage_collect+0x2d4:
 unreachable instruction
Message-ID: <202609141930.6Cofe7NV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: d625a2b08c089397d3a03bff13fa8645e4ec7a01 f2fs: fix to avoid migrating empty section
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r063-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141930.6Cofe7NV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141930.6Cofe7NV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d625a2b08c08 ("f2fs: fix to avoid migrating empty section")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609141930.6Cofe7NV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/gc.o: warning: objtool: atgc_lookup_victim+0x19c: unreachable instruction
   fs/f2fs/gc.o: warning: objtool: f2fs_get_victim+0x5fc: unreachable instruction
>> fs/f2fs/gc.o: warning: objtool: do_garbage_collect+0x2d4: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

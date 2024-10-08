Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15280604
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 04:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728361536; cv=none; b=g0AkMF/ICB5V0oN4CSGttoYMj5RzbcB9QpXDQGaxxvzxShjtLvaTTfW9RFaLe0p7mOQKhpNSevg3aEi4WqCZkQ1Z+2+jfjEGRTTzxeEREsG1RizE6jeDFIAJOCVfUAIIaDf5WCitA3taSFHDkYzQbICI5DSfN3sPuiTOhIApxrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728361536; c=relaxed/simple;
	bh=WQxWgCRwnzB/NHW3Pv0eFEkzccDkeKbHX42bMWVGYSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=geTxmFYEDZJgPMmECLH9Q4MUY5stgyQMJCRiOUMGsa+oiPYPkREEzKl7JXSnGSCNX8lxasYUVE4zcw+LpOK0vUJ12ajENFSlScQoX4TqyGr3uZcPPWh93GI+e4T0F4i69PiU1k/HFBTRJEGgBFENGCrmzlRSKngGGCmfrxzct9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4jDb0yX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4jDb0yX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728361534; x=1759897534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQxWgCRwnzB/NHW3Pv0eFEkzccDkeKbHX42bMWVGYSQ=;
  b=h4jDb0yXPwe463ItnE4LCHkkF5xdgqf5qrdpZhZx3i2xYGKOE6ZEvw6V
   vU9s3JR73UmyKaJiWm7qzxEiK8npRm6jxGZq+uZgOZ7204lg6ksZZBtfj
   ywUdy/6l86Rh6QnyxyQnkJO486D8ucHO8O2XgnVEgjvhBWyAkWD3Ps+QZ
   Fk4FKsoXYUpUxuqTB+QcdqdcOisPmZUSrqfQt0JDhpHjno493m4dXjE8w
   Tf5aLWchq856AcB8Uvv1lDR6yqg7AZYBYXhD7qNJ+uImKS9DCBiHl1Zgs
   xSQUxb0NYAtyGpF0REH33vzYLSxMK5jc83dAa77ATYL2cH2taiKGziy0c
   w==;
X-CSE-ConnectionGUID: 9btDRK6uQEKW+OgnJA+kfQ==
X-CSE-MsgGUID: xpx8TKA8RtWx6GL0lXEF2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27412077"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27412077"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 21:25:34 -0700
X-CSE-ConnectionGUID: 3I0py8CzRa+dR1prF4Zy1A==
X-CSE-MsgGUID: CGmk6x6ISoivc2QSktsEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="75943461"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Oct 2024 21:25:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy1ms-0005tc-2w;
	Tue, 08 Oct 2024 04:25:30 +0000
Date: Tue, 8 Oct 2024 12:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vma.o: warning: objtool: mm_drop_all_locks+0xa0: unreachable
 instruction
Message-ID: <202410081228.tOdId06u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
commit: 49b1b8d6f6831026cb105b0eafa18f13db612d86 mm: move internal core VMA manipulation functions to own file
date:   5 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241008/202410081228.tOdId06u-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081228.tOdId06u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410081228.tOdId06u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vma.o: warning: objtool: do_vmi_align_munmap+0x280: unreachable instruction
>> mm/vma.o: warning: objtool: mm_drop_all_locks+0xa0: unreachable instruction
>> mm/vma.o: warning: objtool: mm_take_all_locks+0x17c: unreachable instruction


objdump-func vmlinux.o mm_drop_all_locks:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

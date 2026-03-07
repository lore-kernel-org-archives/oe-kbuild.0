Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C21A23A0
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 03:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772855109; cv=none; b=jBYb7QuYTpOqkuKk/TQWRo1WreXFXrZ1wikuHFHyoUbl2O4mjcw3HmqzXK+M7lAyUvIgeDh1ksYHiB+4B2IzAVfpaQT0z6zvJ9ooIjpwuDqznjlr5Fw+PUIC7kWSaJ4OvBzIosvevfYvMlJOH+GWVklSPr4oCUikY/zLGVEBfnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772855109; c=relaxed/simple;
	bh=pxB5Ed7+sXvsmgGoOIf4ZRtfGeGphBrexwYXMOQ+xog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kWuia8DlZJ9iJwirxwMQMBWGrvtHP3pAmxJt8G93/Z7ZhXJ9IhgmvABXj1ycBNA9tcuvEcyfGjPku1N/Gd0x6DqBxzXgC+xLu3TqgZckOk7dqMsmUhCsJh+g4mx/kpF3RItrZX9l6+v2YjJE0oy0+PY2LCpfTfFUk0PweRlTL6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAzhFZnq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAzhFZnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772855107; x=1804391107;
  h=date:from:to:cc:subject:message-id;
  bh=pxB5Ed7+sXvsmgGoOIf4ZRtfGeGphBrexwYXMOQ+xog=;
  b=XAzhFZnqpbff7XPblK54PF0XTtffwQYVhJOYM/P3QiJZEO8I0MzHUjul
   Wo9HwCpTRuNpLQ39NrRKOOBm87MLJNLlejvlgs0vzkp+M3my7yM7zctaq
   VCG0/SaXwUlVHlb1Sg0r+Ep9h5HDSCN6zwuG3yBCgkvPI2PeOAhQtv/HC
   FahpYCXYFdWRlRsz7+JBhiPD5pjbxQFIcbOsmXRSX05fOZSSIlPeF952z
   tLkDluMvnqkob7b1TC7coXa+4gp2fgDTgvs5d/1Hq1vuierYi1oMRv4wA
   Wz36qxT9fnlpczPuH6xTVK/htYA4AgmfQP3XgYwwsTrOryaYUlHkc867E
   g==;
X-CSE-ConnectionGUID: mmb02lEWSCOCLyMwSG3Dsw==
X-CSE-MsgGUID: lbhbVHS6QY+nLPdr1g1ibQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="61537427"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="61537427"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 19:45:06 -0800
X-CSE-ConnectionGUID: w81og3j7T3eWhKK6Hrvtjw==
X-CSE-MsgGUID: PwKNr8seQRGqx7/1d9svQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223674100"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 19:45:05 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyib8-000000002PN-3IVn;
	Sat, 07 Mar 2026 03:45:02 +0000
Date: Sat, 07 Mar 2026 04:44:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 285/313] ../../../mm/vma.c:2592:33: error:
 'VM_NO_MLOCK_MASK' undeclared; did you mean 'VM_LOCKED_MASK'?
Message-ID: <202603070433.MUXyiGWN-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
TO: Anthony Yznaga <anthony.yznaga@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Anthony,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   fee41c6c27b01fdd910a9d9cd4f3b978efb92ea2
commit: 6c41b23d5f57f306c940c65a2a5240bc20a95659 [285/313] mm: prevent droppable mappings from being locked
:::::: branch date: 89 minutes ago
:::::: commit date: 89 minutes ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260307/202603070433.MUXyiGWN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070433.MUXyiGWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603070433.MUXyiGWN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from main.c:10:
   ../../../mm/vma.c: In function '__mmap_complete':
>> ../../../mm/vma.c:2592:33: error: 'VM_NO_MLOCK_MASK' undeclared (first use in this function); did you mean 'VM_LOCKED_MASK'?
    2592 |                 if ((vm_flags & VM_NO_MLOCK_MASK) || vma_is_dax(vma) ||
         |                                 ^~~~~~~~~~~~~~~~
         |                                 VM_LOCKED_MASK
   ../../../mm/vma.c:2592:33: note: each undeclared identifier is reported only once for each function it appears in

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

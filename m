Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD412E4A
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 22:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722811307; cv=none; b=TpyUYdpcZGjAWLmZ47h5gi+O6vXsj4Q+QnN/Vb55tovTNu48G7155APJn5EwKbisYKbYjFHcJPgH7P/J/8TM9PQlA7eXhRfq284NM9lM3RdHiEcEct9M2nz25MUQUhyzifIO68PGEVxyi9VhfGskPb09KiuCBSkozuJ5SH/6l88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722811307; c=relaxed/simple;
	bh=wEurwrKJn1VAKLhjL7EbECREfLxU18mT3if6pfQSFjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CDSTYtPl5KgV2XxvFJa+CTzODK2RsNOTvAX1WDLxbAzofCVhwA3+PrzqGD6Jdsf6QfwzGngr46D/OyHe+Kq5GHuTb/4Awm7rhfy/QsyKFVXyeyjtePCj6bKpWAmqYLyTJyvgkKR1mdC6Q3mEsEDnp0UChSJit85A7YXIPkPHEyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHN1gDUr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHN1gDUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722811305; x=1754347305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wEurwrKJn1VAKLhjL7EbECREfLxU18mT3if6pfQSFjc=;
  b=WHN1gDUr1CoDKvzgo8lOZmKAI8nGJO2RSzolfilsfzeLunsUGCsiqZlP
   DjF3vTkKjSd4o0nyIhZi4O1RtOJENwpfpfBuDVVPDF0npII+WF4OQu5LM
   m6vcDjeHZ/0ijVCs/aFoyZEZfELLXcupAbkDeNi0CG3+T0RrpdVjGGnWT
   viZnZLE4wxTQgZ3pCrz8yfAEMFAbuMdG2tDBixqXX0vT6zztyYDIp9yt6
   8KYp8bPBol9G9rL6zXCFfSOsxvMVHSyB3DHPRmATtmCrIGgooWwiFpOLQ
   W228ys2iwsaF9R9NA4jGgk0XpyR8RK7VLeScfl4lAD5IyMgnM11adTZjm
   w==;
X-CSE-ConnectionGUID: /4J56RpfSGWFmKzAxbMj6Q==
X-CSE-MsgGUID: WEfvwECNRvKrKKDbcuu9Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31386635"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="31386635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 15:41:44 -0700
X-CSE-ConnectionGUID: z1hksNEARbuKastSv5l5Dg==
X-CSE-MsgGUID: Tz2ibaiPSFmjJAsnGKo2Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="60811076"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2024 15:41:43 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sajv2-0001dQ-30;
	Sun, 04 Aug 2024 22:41:40 +0000
Date: Mon, 5 Aug 2024 06:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2700/2947] mm/userfaultfd.o: warning: objtool:
 userfaultfd_register_range+0x148: unreachable instruction
Message-ID: <202408050641.2r2fDoTL-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f524a5e4dfb75b277c9a5ad819ca5f035f490f14
commit: d9e65bcf28d4f9c071a086398ab1c48c590bbe12 [2700/2947] userfaultfd: move core VMA manipulation logic to mm/userfaultfd.c
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240805/202408050641.2r2fDoTL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050641.2r2fDoTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408050641.2r2fDoTL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/userfaultfd.o: warning: objtool: mfill_atomic_copy+0x6c: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mfill_atomic_zeropage+0x64: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mfill_atomic_continue+0x6c: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mfill_atomic_poison+0x68: unreachable instruction
   mm/userfaultfd.o: warning: objtool: mwriteprotect_range+0x94: unreachable instruction
>> mm/userfaultfd.o: warning: objtool: userfaultfd_register_range+0x148: unreachable instruction


objdump-func vmlinux.o userfaultfd_register_range:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

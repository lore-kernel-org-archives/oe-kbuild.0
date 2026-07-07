Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AE141A77F
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jul 2026 13:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430024; cv=none; b=VKeIqYSJm/5MuwA303MwoSKbHlgbzRNWpu+HZ6B839tPUaRqRYOqiEylcbQNeYSax05WnrtW++H2jJFiphdVvuKY4jhgydV46ij6LNiOnn4PeUJLSCPRVB4qD99nxDFXmMzwGDeDjYvf8RlDOla7zbuyWRptTZmt5SclXbH1SaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430024; c=relaxed/simple;
	bh=VYgmfRb4Omc5ucdIDk6eT8rysLJHr5gfjt6qLcH2Mtg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qq3lbVOz1EeOIdOXPeLgiVE4U8Me3lLxcY1jMUwXKVUgzgxRt9AuIfo5Z5T84eyitWFvMyB7dD0+mnQBHTKfEvrFiX0uRsbaM4Vud0KYihkKzhsPrgTNwT3srOyyt02OX1nmITn8puU/0twlq+bZLQpBG5Bvsh3dP3wQDWQoOcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYejAxG/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYejAxG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783430023; x=1814966023;
  h=date:from:to:cc:subject:message-id;
  bh=VYgmfRb4Omc5ucdIDk6eT8rysLJHr5gfjt6qLcH2Mtg=;
  b=XYejAxG/pGzIK8uzIqxHzFU8Na7RQrm2B03yn4KRVZ32nXWG0NrCIjkQ
   WTl/NLWy8amT53BmM8tT4pfv6Au4kcQPz9HQ813me55Z+b16o5Kl22/TY
   9o1FcYTfS3kP7aJsvadbNiGqalHQyTY3NQO/BwgRr+5mrc0VcKVcgeCE6
   bhvXBpCYYopWX7AXviMa10CukTwyidiFhs8+3F2V0fmKrElQWmvK6g/CD
   QascMmeuljM+eOgJN1m/VD7uJg2+ErlQhJ+R/ZtfLpiZDAHHU2TEwqCeP
   kdY2lwJPyl++KOPMyi//KiLSGw+KT+dpsSAOstOXmnWePSQ+2tVc128Qc
   w==;
X-CSE-ConnectionGUID: qsspBBvLQmy/Ahu8WNY5XQ==
X-CSE-MsgGUID: 0rtPKmhmT2eUKWQ+Lsu7hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84265526"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84265526"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:13:42 -0700
X-CSE-ConnectionGUID: bKTeXc/XT4+CEj/C5HRmUA==
X-CSE-MsgGUID: 5fYuywSASReLLrPKTfBx6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="284100180"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2026 06:13:41 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wh5cI-000000002YP-0Tyg;
	Tue, 07 Jul 2026 13:13:38 +0000
Date: Tue, 07 Jul 2026 15:13:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../../../mm/vma.c:756:22: error: implicit declaration of
 function 'rmap_base'
Message-ID: <202607071512.YmJEtNT6-lkp@intel.com>
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
TO: tao <tao.wangtao@honor.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/tao/mm-add-CONFIG_ANON_VMA_FRACTAL/20260707-144132
head:   e64b011bc52253c6d4c18b85147ef435b008c2c8
commit: 10651d7bbce08855f9e24ec17b911b2dcdfee598 mm: handle rmap_base changes for ANON_VMA_FRACTAL
date:   6 hours ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260707/202607071512.YmJEtNT6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607071512.YmJEtNT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607071512.YmJEtNT6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from main.c:10:
   ../../../mm/vma.c: In function 'commit_merge':
>> ../../../mm/vma.c:756:22: error: implicit declaration of function 'rmap_base' [-Wimplicit-function-declaration]
     756 |         rbase_diff = rmap_base(vmg->start, vmg->pgoff) - vma_rmap_base(vma);
         |                      ^~~~~~~~~
>> ../../../mm/vma.c:756:58: error: implicit declaration of function 'vma_rmap_base' [-Wimplicit-function-declaration]
     756 |         rbase_diff = rmap_base(vmg->start, vmg->pgoff) - vma_rmap_base(vma);
         |                                                          ^~~~~~~~~~~~~
>> ../../../mm/vma.c:757:27: error: implicit declaration of function 'vma_pre_update_rmap_base' [-Wimplicit-function-declaration]
     757 |         if (rbase_diff && vma_pre_update_rmap_base(vma, rbase_diff)) {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
>> ../../../mm/vma.c:775:17: error: implicit declaration of function 'vma_post_update_rmap_base' [-Wimplicit-function-declaration]
     775 |                 vma_post_update_rmap_base(vma, rbase_diff);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

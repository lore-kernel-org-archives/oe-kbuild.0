Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2B030C60D
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 21:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302066; cv=none; b=Dt6VtX/GjVTxpJ6QN0beMJDWMp+uZmYhZ7aQme9EeZqF3aKdECFLqcGAIOggte2QNZ5H7zgOEzE8fjY2m9BNJ8ohe1RukZsqrbxK/15R4CsAm3uNjtovnaODa4jeXXXPglZubNzLf9x6bokhbzMnTl2GXfzPlcxm4a4U0OC8UKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302066; c=relaxed/simple;
	bh=DSZbKYlhXAiSoxE7kGADwm40XD48pfKwpIG2ZesOOAs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lBVfb2Xwgs2ZbmfADnWpn1uze1sHlFjOyS6J8BOPDe1YRtGAVyPSrAxSgvo9XU33QSs831tp2lY0Ig/u2vXSVGb0cv1xbpbzCdu47aRd1bgZ7AphoZFn+J6LvHTDb0jcrsp0PP6rNLJJDz2OhQVvenrny7WbJpfIExAdNTJ5o7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKqyeMXe; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKqyeMXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774302064; x=1805838064;
  h=date:from:to:cc:subject:message-id;
  bh=DSZbKYlhXAiSoxE7kGADwm40XD48pfKwpIG2ZesOOAs=;
  b=YKqyeMXezL22Q36sznwncD8cc6SUV6Bl/ucxUqaQPR9q2mfQRbxeW8OL
   W9wBeM5vDkQQYYgbtGniUa7tHQvVLb1lEHG5XijdK6KpjpcELBbXEW4bu
   k2JU0c8PGXwhyzoth0FWqXLeI8VKZs9ZA8WZyjbna2a8ciElHGn7OYFYC
   apaz2gMZ1u8++LNNMIJfqmkOPbZCjDUjuzyd3lUXtV4/0HH9y2AXNAvmT
   dNK8m056UUJ+X1JvW3LAXC3Mkh+8Cw/sE7eN99Oofj5FB6a47GB8jyTi7
   fMmbzZUUuZuhiQgrrSS6S3YSCjbnFSFk3IWMgoNa1YfY0sJ09r7DfYzSL
   g==;
X-CSE-ConnectionGUID: 4tm4s8RIQ2+H105a9Yk+bQ==
X-CSE-MsgGUID: x1KqE8FhQLeC356wJAJg9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85930221"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="85930221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 14:41:04 -0700
X-CSE-ConnectionGUID: 4L/TwHuzTnqf3lmjx+iuNg==
X-CSE-MsgGUID: ijaPWGiyQE+NeHlYFuOIUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="221294134"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Mar 2026 14:41:03 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4n1A-000000003G1-2F6p;
	Mon, 23 Mar 2026 21:41:00 +0000
Date: Tue, 24 Mar 2026 05:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/cma.c:770:24-29: ERROR: iterator variable bound on line
 768 cannot be NULL
Message-ID: <202603240529.BOykxDXR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 77c50f9147eabcf726f62c73167bb9d9e8621a43 mm: cma: simplify cma_debug_show_areas()
date:   8 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 8 months ago
config: s390-randconfig-r051-20260323 (https://download.01.org/0day-ci/archive/20260324/202603240529.BOykxDXR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603240529.BOykxDXR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/cma.c:770:24-29: ERROR: iterator variable bound on line 768 cannot be NULL

vim +770 mm/cma.c

c009da4258f988 Frank van der Linden 2025-02-28  751  
dbe43d4d2837da Jaewon Kim           2017-02-24  752  static void cma_debug_show_areas(struct cma *cma)
dbe43d4d2837da Jaewon Kim           2017-02-24  753  {
77c50f9147eabc Yury Norov (NVIDIA   2025-07-19  754) 	unsigned long start, end;
7365ff2c8eef4e Frank van der Linden 2025-02-28  755  	unsigned long nr_part;
c009da4258f988 Frank van der Linden 2025-02-28  756  	unsigned long nbits;
c009da4258f988 Frank van der Linden 2025-02-28  757  	int r;
c009da4258f988 Frank van der Linden 2025-02-28  758  	struct cma_memrange *cmr;
dbe43d4d2837da Jaewon Kim           2017-02-24  759  
0ef7dcac998fef Mike Kravetz         2021-05-04  760  	spin_lock_irq(&cma->lock);
dbe43d4d2837da Jaewon Kim           2017-02-24  761  	pr_info("number of available pages: ");
c009da4258f988 Frank van der Linden 2025-02-28  762  	for (r = 0; r < cma->nranges; r++) {
c009da4258f988 Frank van der Linden 2025-02-28  763  		cmr = &cma->ranges[r];
c009da4258f988 Frank van der Linden 2025-02-28  764  
c009da4258f988 Frank van der Linden 2025-02-28  765  		nbits = cma_bitmap_maxno(cma, cmr);
c009da4258f988 Frank van der Linden 2025-02-28  766  
c009da4258f988 Frank van der Linden 2025-02-28  767  		pr_info("range %d: ", r);
77c50f9147eabc Yury Norov (NVIDIA   2025-07-19 @768) 		for_each_clear_bitrange(start, end, cmr->bitmap, nbits) {
77c50f9147eabc Yury Norov (NVIDIA   2025-07-19  769) 			nr_part = (end - start) << cma->order_per_bit;
77c50f9147eabc Yury Norov (NVIDIA   2025-07-19 @770) 			pr_cont("%s%lu@%lu", start ? "+" : "", nr_part, start);
dbe43d4d2837da Jaewon Kim           2017-02-24  771  		}
c009da4258f988 Frank van der Linden 2025-02-28  772  		pr_info("\n");
c009da4258f988 Frank van der Linden 2025-02-28  773  	}
7365ff2c8eef4e Frank van der Linden 2025-02-28  774  	pr_cont("=> %lu free of %lu total pages\n", cma->available_count,
7365ff2c8eef4e Frank van der Linden 2025-02-28  775  			cma->count);
0ef7dcac998fef Mike Kravetz         2021-05-04  776  	spin_unlock_irq(&cma->lock);
dbe43d4d2837da Jaewon Kim           2017-02-24  777  }
dbe43d4d2837da Jaewon Kim           2017-02-24  778  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

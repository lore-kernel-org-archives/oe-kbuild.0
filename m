Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D6A23B0
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Aug 2024 05:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723526232; cv=none; b=ugzE32S/qUFSQJS412v89CVeNzsPt3V2FP2Z8o6nYNWbNbjISKLs8ocniklkN4JvIG/rJf7xZlA1Yv6hzcIiluuVQLJBZbFCmhVkDNP3+u9dNoAay4ecvZ3qlxw6YvgI86NbApaDqrvK/ZFEyFTDH/37pB32UD7tbcye6e5kw7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723526232; c=relaxed/simple;
	bh=10E7IzGVyh6tATfwhvRTVXneHcaWCx3x8MMa2pU753c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KILVIwgVM9aJVU6i1obvorQJfmF0gf1CLGqgMJzVD6nVk5gjP+PMBjOq8QyCVXsLjeO/1qWBeLBr8tL8oespWzL33TWpuBSvGIdmehw79U/LZuj5GEQeH59pUddDIkfQCDtStUCkz3xQI8zF8x5mrlpZVL0yA+rrd3X1nNRf0Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMSYvpyW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMSYvpyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723526230; x=1755062230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10E7IzGVyh6tATfwhvRTVXneHcaWCx3x8MMa2pU753c=;
  b=QMSYvpyWPR0rIjlBp10YfzWsqUjgnzdvF8GuG8s2kgEueOXzXHo/9hYk
   +THto35oAfTu6YaYBioEWEu++WyQ5zr/H1hXtiF8yjktQNj4JOA5yOYTO
   diXqJuQ4BkHknG5Odw/Qqn5e9/MbKIcJCAqulIYQtcXh94kseKcIus//E
   xczUqBR8TWOAVU2ckgZpEB7pe/xQY/rOmgF3wKY2ZiN4LCrWC8xP7reyG
   avaF7Z19UCpTXOuQn47jxzqvX1aSjCAWTJpquyhkuTs/d2Lhaqno0YVrE
   IW1/IctTvIcZvKcggblgIC05ZZ7H9vGM7T8x5wnzWn7S9w1x7z7jdZDns
   g==;
X-CSE-ConnectionGUID: bD4yBkhGSt6SXFWsQIlMHA==
X-CSE-MsgGUID: xZBVvUilS3mZu+hy3eeWfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25530909"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="25530909"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 22:17:09 -0700
X-CSE-ConnectionGUID: TIi7s/DKTZmy9tffsp/7vQ==
X-CSE-MsgGUID: 6DdM+xhPSEWvU8it42D0PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58500313"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Aug 2024 22:17:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdju6-0000Bq-1k;
	Tue, 13 Aug 2024 05:17:06 +0000
Date: Tue, 13 Aug 2024 13:16:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/zsmalloc.o: warning: objtool: reset_page+0xb0: unreachable
 instruction
Message-ID: <202408131323.fNFHwlLZ-lkp@intel.com>
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
TO: David Hildenbrand <david@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Sergey Senozhatsky <senozhatsky@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d74da846046aeec9333e802f5918bd3261fb5509
commit: 43d746dc49bb4c82034fce01a92fe67344d664cf mm/zsmalloc: use a proper page type
date:   6 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-002-20240813 (https://download.01.org/0day-ci/archive/20240813/202408131323.fNFHwlLZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408131323.fNFHwlLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408131323.fNFHwlLZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zsmalloc.o: warning: objtool: reset_page+0xb0: unreachable instruction
   mm/zsmalloc.o: warning: objtool: zs_page_putback+0x58: unreachable instruction
   mm/zsmalloc.o: warning: objtool: zs_page_isolate+0x58: unreachable instruction
   mm/zsmalloc.o: warning: objtool: zs_map_object+0x260: unreachable instruction
   mm/zsmalloc.o: warning: objtool: zs_page_migrate+0x94: unreachable instruction
   mm/zsmalloc.o: warning: objtool: alloc_zspage+0x22c: unreachable instruction
   mm/zsmalloc.o: warning: objtool: __free_zspage+0x6c: unreachable instruction
   mm/zsmalloc.o: warning: objtool: free_zspage+0x54: unreachable instruction


objdump-func vmlinux.o reset_page:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

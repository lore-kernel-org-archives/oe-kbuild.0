Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400584405
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Aug 2024 20:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722802749; cv=none; b=ZsigQO5tlO/45KoaUZHiLfb9uET/Bcu7PpudZfYQ2ix1fM3EMZTgXVmxKfJMjAbUDVJ0DT62W+m5DXPa5obtXCtBtk26aR7z/Nx7GEttjQ0jZk0aHdCbY+9iNuto3mcih8MY6rGtOvJHTg3d80IFMrYYqB0KG65VaAnB3hQbnQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722802749; c=relaxed/simple;
	bh=dwzUfd3iOo5RZv7gprIccHEn7ieR0h7eM5u5xc6FB/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfChL4kUZl2uoJ1FfpZ3a8hO10F3Bb1J/JDzoJD5+YbqbnTUNrDNwIbnTXy93elpO/wRCKi9oLt5UZuI1D73PDKoB4CjFgvT4zidWfdbWycSjHUUy7X9ThZyj8WTNL/j12DzH8c2gnfXJLOwU9Q6LbWc3FdD40hcSG1B8As9krU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=no0lnpZr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="no0lnpZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722802748; x=1754338748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwzUfd3iOo5RZv7gprIccHEn7ieR0h7eM5u5xc6FB/Y=;
  b=no0lnpZrf68zoKQn6SVAvqyhRAF5rLmm3mstvd/b5JaSYOZtsQZeIHXp
   39gPnzS11K1sI1ikLkJJBA/k7/CHk+mXD+Mx56Ja2b29MbSA0XZo5cOX2
   ghvDlMcMKx2YvpHBeaN9WFmTr8vgQKhTZkVTaTrU9MolgY7jJDxVs4XCP
   iuZl1zx0dhJFBRBnS0sicJ04Lh7reY20UoTV0rmGq+iO4hBQVfwqjw54v
   EiNl5OgDEPE/RuBEK6r2aR45OmmPFq+gQJmJ5/pOLup9i4Kc67M0gTfpZ
   Wj4g3uonZRUYV3yJlw0sssa0I5NLAbNGojXJOQYJFmJda4BSJv9203S08
   A==;
X-CSE-ConnectionGUID: BsNwZfxNSbG0Artv1aRmXQ==
X-CSE-MsgGUID: BxxghNHRTpmyHQtLHwu4YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20568747"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="20568747"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 13:19:07 -0700
X-CSE-ConnectionGUID: 64kdlPZVQoifKi00hnM4sw==
X-CSE-MsgGUID: kY+pRf5vTT+fw/vaM9FM5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="86525963"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2024 13:19:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sahh1-0001aw-1k;
	Sun, 04 Aug 2024 20:19:03 +0000
Date: Mon, 5 Aug 2024 04:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/zsmalloc.o: warning: objtool: alloc_zspage+0xd4: unreachable
 instruction
Message-ID: <202408050426.oGE9Dw3e-lkp@intel.com>
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
head:   17712b7ea0756799635ba159cc773082230ed028
commit: 43d746dc49bb4c82034fce01a92fe67344d664cf mm/zsmalloc: use a proper page type
date:   5 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240805/202408050426.oGE9Dw3e-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050426.oGE9Dw3e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408050426.oGE9Dw3e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/zsmalloc.o: warning: objtool: zs_map_object+0x68: unreachable instruction
>> mm/zsmalloc.o: warning: objtool: alloc_zspage+0xd4: unreachable instruction
   mm/zsmalloc.o: warning: objtool: __free_zspage+0x60: unreachable instruction
   mm/zsmalloc.o: warning: objtool: free_zspage+0x50: unreachable instruction


objdump-func vmlinux.o alloc_zspage:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

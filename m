Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027295;
	b=XGueniibo3AjxDR35fUgTAxdK8KmoTvDBODWKaCStBlskXeu6/8ShCW9TfPENjGlzarD
	 ynlnmPphR38pVpcY/IXmsXJf7l1bUK3Mm5ZZCZFwiCwHG23QF/m5P92N+ujp4w/RBXjPw
	 yEuArNEyjCBdTzpXPrXRKEO4daE2ZiXrh2tBW/vlsx9kfG36D4sjbEmd0c62WGFp8cyvG
	 WFy24/hyWikB8tF2eK1X04qY2LbCCDO843LzMp35vW6YOqjVqNW0FRqRRgJM6nktqh8ZM
	 WIxMNHEAZqh0PmNgObiOW0RClC3dDV4l5TPHX+1iNVAPvVtB0lu3h/tYzC6fIe76/+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027295;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/QpIq26A1SoIVSjalEALObqVvMd5o8NB+Wm2wK5PxHY=;
	b=NYqeEVHKpEF4EfyTGuP70a6Lv6qjV61lLLoxz28VNLV+aw2/T6XwMcfWVIx28yUVLDQ4
	 bxDxfdEbUvhnRww9Vz5WkZykwQjLGZ87uX724CoSWLqY7+I2FC5RLnYJLQijjpZXIZSvt
	 NYkCrAF8PsOSPef8xYRoc8OZDZXBNUHIYXR6UF7quQkk2B1J7dz0oBp6rTE7z0Z+o+C+S
	 BWdsc2FGyxtQMWkldg/7hXqUJ8F65DT6RIqV3+OsBkOMg6N2HLCaFAnPeQG+relp/K14p
	 2NuiK7BOHn58l8aBQfPf3TZ7J7xDV9/G1MgeftK/7ONFZqQjeLBMX/iH3BkrxcfbGtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="R/bmxjQR";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A5A606A32A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 18:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A5A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R/bmxjQR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795027295; x=1826563295;
  h=date:from:to:cc:subject:message-id;
  bh=q76MPxWC+08F/3bZPWbgBhYwpXviaYtDIleV38Y/qXM=;
  b=R/bmxjQRGras3rSr/9oohH5yodwbTo7Nx0rlHvwshOV9AvmoifLoTdnw
   WKk2YSFZHefl6msEb2s+pVGfELm1dBzZvCOsnkE5UzeUuNtK+W76hCaLy
   lPa85B9uRT5izkaTvl/+Uxi/Yu1IRetCXI5nB6EjiyVBQAcml7aeG2Dch
   6IOe7wktxZFX06oa56ibp2zxzpdmh6A/wKo21piZ3kd+jOi+qN8BrLQsR
   LiiTqpFrDgfLqQ3FPxVWmtOGJ4GrnRhcWRh/JCWZGl7apLwtwxw65R2PT
   S58iyq1WHlmT4BfAXig5ysJDvC3jIsZZq7cEePy/2RItMhNWq92rMR3Uj
   Q==;
X-CSE-ConnectionGUID: xUfg0cqvQoi565j54gnMTQ==
X-CSE-MsgGUID: wW68EfyvR+W9kV9LWj+FYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3746946"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3746946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 10:41:33 -0800
X-CSE-ConnectionGUID: no4Ru2DtT/6x4A+LQ/fQaQ==
X-CSE-MsgGUID: LsHIZ88OQ/CNDAA3WK4ZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10488119"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2026 10:41:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTkaz-000000003Rj-0lnM;
	Wed, 18 Nov 2026 18:41:25 +0000
Date: Wed, 18 Nov 2026 19:40:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-2026-07 2/2]
 include/linux/mm.h:1298:undefined reference to `folio_total_mapcount'
Message-ID: <20261118193753.4VX3DIBB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   f5ef82ff5548236b904840f35358d8a81ecd3bbd
commit: 093bce68a3d77381073cf569c91da0c78a0fa8c6 [2/2] BACKPORT: mm: vmscan: put rotation-missed folios at the LRU tail
:::::: branch date: 9 hours ago
:::::: commit date: 9 days ago
config: arm-randconfig-2000-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118193753.4VX3DIBB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118193753.4VX3DIBB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118193753.4VX3DIBB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: mm/vmscan.o: in function `folio_mapcount':
>> include/linux/mm.h:1298:(.text+0x21dc): undefined reference to `folio_total_mapcount'
   arm-linux-gnueabi-ld: (folio_total_mapcount): Unknown destination type (ARM/Thumb) in mm/vmscan.o
>> include/linux/mm.h:1298:(.text+0x21dc): dangerous relocation: unsupported relocation


vim +1298 include/linux/mm.h

4ba1119cd53166d Matthew Wilcox (Oracle  2022-01-17  1282) 
cb67f4282bf9693 Hugh Dickins            2022-11-02  1283  /**
cb67f4282bf9693 Hugh Dickins            2022-11-02  1284   * folio_mapcount() - Calculate the number of mappings of this folio.
cb67f4282bf9693 Hugh Dickins            2022-11-02  1285   * @folio: The folio.
cb67f4282bf9693 Hugh Dickins            2022-11-02  1286   *
cb67f4282bf9693 Hugh Dickins            2022-11-02  1287   * A large folio tracks both how many times the entire folio is mapped,
cb67f4282bf9693 Hugh Dickins            2022-11-02  1288   * and how many times each individual page in the folio is mapped.
cb67f4282bf9693 Hugh Dickins            2022-11-02  1289   * This function calculates the total number of times the folio is
cb67f4282bf9693 Hugh Dickins            2022-11-02  1290   * mapped.
cb67f4282bf9693 Hugh Dickins            2022-11-02  1291   *
cb67f4282bf9693 Hugh Dickins            2022-11-02  1292   * Return: The number of times this folio is mapped.
cb67f4282bf9693 Hugh Dickins            2022-11-02  1293   */
cb67f4282bf9693 Hugh Dickins            2022-11-02  1294  static inline int folio_mapcount(struct folio *folio)
4ba1119cd53166d Matthew Wilcox (Oracle  2022-01-17  1295) {
cb67f4282bf9693 Hugh Dickins            2022-11-02  1296  	if (likely(!folio_test_large(folio)))
cb67f4282bf9693 Hugh Dickins            2022-11-02  1297  		return atomic_read(&folio->_mapcount) + 1;
b14224fbea62e5b Matthew Wilcox (Oracle  2023-01-11 @1298) 	return folio_total_mapcount(folio);
4ba1119cd53166d Matthew Wilcox (Oracle  2022-01-17  1299) }
4ba1119cd53166d Matthew Wilcox (Oracle  2022-01-17  1300) 

:::::: The code at line 1298 was first introduced by commit
:::::: b14224fbea62e5bffd680613376fe1268f4103ba mm: convert total_compound_mapcount() to folio_total_mapcount()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027294;
	b=4wiioF9L63dX0CFp5JSJW12Hsr2U989j4QUtPI98nHiI0emzPK1sRUZKnSB8gVsFTWI8
	 07oynVIrRLe7SOYcFtPn34CTXmNSfyHRGxeA9RdbETfDDp8L2mnhs+I9irAD/+5rzPSkW
	 c0YKORwGEgFa6hBTT+Kil/9VFfXFlkHu4TLTY6/CPU5w1PNyMptZs3vSdJjXhKlF8iad4
	 cLilMCW9tEpciOox7WQa+5nIDvx91uKynd8Co1179TZKOrG26AdCGIQTiVrcCqQgJ//0W
	 yUj41+kG7MavL236Qb7HP3+B6SMiwqmJo46biLOKGqh2bXQK1Mkpk0b2whfnFhxZpMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hoKZ7Si7c53lLHknj2/7htVsE1/U++9Hb4gpqekU2Tw=;
	b=Y/W8NRAZDHNsnH5DPz8JnkIwQyMLesPCF3+A8eZS8ejhFefJmFpp9onPgg0dTc4Btj7s
	 K5nBAowdDE+TSHL1v/CaTwteGjUnmjXwdUFWGLTq3soe530la/13A/aV+Z3DnySyFrOU9
	 WsYteXvCRhxk+p1laIoCo7z+XgZPgY4sOufjEPNT6JoJNBtRVhWzhyJfbvnl8HB08ZjdE
	 4EjA5DT90AxW7bKwDcP1VoCGwr08PklU0NezPN6LMMzQioWDinGLqP/iZwfExnb/E9Sjo
	 Rhmy2713TXHyTux51PZZl/DOuGXmnvIl/JCz4SFwob9X2xIB/UKkqPqHmF9hvYJZMzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fZ1HaUDW;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341BC606A320
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 18:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 341BC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fZ1HaUDW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795027294; x=1826563294;
  h=date:from:to:cc:subject:message-id;
  bh=V1KpYftxLpQc2Db2Y3GFqTD5EzpQXaygAgh6WDP+lMg=;
  b=fZ1HaUDWFcpJtAWBWoETZygp1XG7k9o+cEY3AWMPTkbModUMPkgBYQFS
   ljH5Ibi210EqReevaQn+BDgmpiL2l93rKfk7ireEzA20YkSUawkCpyd3R
   upkVwrkYu3sAAnV+nFCVBMn68qx1JL+KqskZIU3qc9C5mmIL4JjtTEfXI
   4uXD50iKHXi5WzNi7j6KwU/STFelHD+ye32eR0W7GQ0PBBH1ikefTf2hv
   0lWahriTgjnC6ms3N7u8Sy8wKfzeINgNpLvpa6b18qJvD1lYil45M6N8L
   clTU/4dqcXKHMBvKk8ZvG732mE8qUFI56wdXF/wneu2az/zBd3AM8Fzci
   A==;
X-CSE-ConnectionGUID: dzQtfv08QF+XVYK2SssbIA==
X-CSE-MsgGUID: 5HK1kcSWRimSayJmvaZFhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3746945"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3746945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 10:41:33 -0800
X-CSE-ConnectionGUID: YPpq/CO/TquB+FKUy/NVEw==
X-CSE-MsgGUID: OXe1BS1FSYeoyOK8RdN3wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10488112"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Nov 2026 10:41:32 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTkay-000000003Rh-3ZdQ;
	Wed, 18 Nov 2026 18:41:24 +0000
Date: Wed, 18 Nov 2026 19:40:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-2026-07 2/2]
 include/linux/mm.h:1298: undefined reference to `folio_total_mapcount'
Message-ID: <20261118193456.yZ5cUufV-lkp@intel.com>
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
config: arm-randconfig-2002-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118193456.yZ5cUufV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118193456.yZ5cUufV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118193456.yZ5cUufV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: mm/vmscan.o: in function `move_folios_to_lru':
>> include/linux/mm.h:1298: undefined reference to `folio_total_mapcount'
>> arm-linux-gnueabi-ld: mm/vmscan.o:(.debug_addr+0x204): undefined reference to `folio_total_mapcount'


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

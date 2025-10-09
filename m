Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D221F2B88
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 17:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760030474; cv=none; b=g+AlV+EVJdOvC61hTaskaOIHWhHgyIg9BaMJPzNsXitNEyepPHenT0FQkZwhNZPDH+63G+BnBSLTVwBind6UY4Lf2sQJLJW/9VsWUXndovtb5FDrbplRGs7G8O5crDtnrTNzhTaLuJYJDC4SwUP4uDflwLW2IQlQbJuuWrIbDj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760030474; c=relaxed/simple;
	bh=CHX00py1xwgCEkbvBRjos6BM32Ofc3qiQ4cQlCKDSn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9aJlvxctcIm4Z3yifOpeypvTT4aj/RfhyVHaxDbn4GgjfwuzE8nIDkhkFBp8w1rT8apxg70NQEn4fliih8fQyDR6B3rSvvnDlt8cBfWOq+9SrnSPnUDq1dX+tJrbTHHzpAyRwAatpC0BV3yokudBMd9WCf517WjOFCI8AUzpz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n13H2obA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n13H2obA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760030473; x=1791566473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CHX00py1xwgCEkbvBRjos6BM32Ofc3qiQ4cQlCKDSn8=;
  b=n13H2obAGL3FhALE3GnMC7KMmNMVetTIguRUPeXYqOUEj2RDD0KH7lWX
   ztFMC2VW/ibgcTF5NLcgvQRA4ecl/0AG6yTCnRhn8p83DNpiaafATS132
   hP6wfUM9eqXLoPcJOEnSfTEbX6+/+cegjS7sKONTTFOcj/2eK8XTTVdVh
   O6VV4wzTa5PGTHK9eTdxbzRVBTDEsc41PWWp96b2CnKAYJT+dU9z7X8K/
   M3UFnsIGTgH0QpgxTFYFrqT0xxXLSgxCp8C66fRiNa8fUpfwrHSMy15pu
   V2SHd4x9SVWw/WgoqmHLTOS6rY6WeItAFNgU7IOfq0Judgu+Cb1RloP9R
   Q==;
X-CSE-ConnectionGUID: k72mumOiQF+6A2lS/4B5sg==
X-CSE-MsgGUID: X0CYkrQ6QXaPvhE8f+WiXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72930567"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="72930567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 10:21:10 -0700
X-CSE-ConnectionGUID: OFlhnfcqRr2NvOcMErY2Iw==
X-CSE-MsgGUID: /C3TsynZSVe6VzArwM3FUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="180365349"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Oct 2025 10:21:09 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6uKA-00015q-2N;
	Thu, 09 Oct 2025 17:21:06 +0000
Date: Fri, 10 Oct 2025 01:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651
 mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?
Message-ID: <202510100155.MS0IXhzm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rex Lu <rex.lu@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec714e371f22f716a04e6ecb2a24988c92b26911
commit: b1e58e137b61693f12da037d2d50aca9c2140a43 wifi: mt76: mt7996: Introduce RRO MSDU callbacks
date:   3 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100155.MS0IXhzm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510100155.MS0IXhzm-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651 mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:483 mt7996_mac_fill_rx() warn: potential spectre issue 'dev->mt76.phys' [r]
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:484 mt7996_mac_fill_rx() warn: possible spectre second half.  'mphy'
drivers/net/wireless/mediatek/mt76/mt7996/mac.c:3061 mt7996_mac_twt_sched_list_add() error: uninitialized symbol 'start_tsf'.

vim +/p +1651 drivers/net/wireless/mediatek/mt76/mt7996/mac.c

98686cd21624c7 Shayne Chen 2022-11-22  1640  
b1e58e137b6169 Rex Lu      2025-09-09  1641  static struct mt7996_msdu_page *
b1e58e137b6169 Rex Lu      2025-09-09  1642  mt7996_msdu_page_get_from_cache(struct mt7996_dev *dev)
b1e58e137b6169 Rex Lu      2025-09-09  1643  {
b1e58e137b6169 Rex Lu      2025-09-09  1644  	struct mt7996_msdu_page *p = NULL;
b1e58e137b6169 Rex Lu      2025-09-09  1645  
b1e58e137b6169 Rex Lu      2025-09-09  1646  	spin_lock(&dev->wed_rro.lock);
b1e58e137b6169 Rex Lu      2025-09-09  1647  
b1e58e137b6169 Rex Lu      2025-09-09  1648  	if (!list_empty(&dev->wed_rro.page_cache)) {
b1e58e137b6169 Rex Lu      2025-09-09  1649  		p = list_first_entry(&dev->wed_rro.page_cache,
b1e58e137b6169 Rex Lu      2025-09-09  1650  				     struct mt7996_msdu_page, list);
b1e58e137b6169 Rex Lu      2025-09-09 @1651  		if (p)
b1e58e137b6169 Rex Lu      2025-09-09  1652  			list_del(&p->list);
b1e58e137b6169 Rex Lu      2025-09-09  1653  	}
b1e58e137b6169 Rex Lu      2025-09-09  1654  
b1e58e137b6169 Rex Lu      2025-09-09  1655  	spin_unlock(&dev->wed_rro.lock);
b1e58e137b6169 Rex Lu      2025-09-09  1656  
b1e58e137b6169 Rex Lu      2025-09-09  1657  	return p;
b1e58e137b6169 Rex Lu      2025-09-09  1658  }
b1e58e137b6169 Rex Lu      2025-09-09  1659  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

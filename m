Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2877A18FDDE
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 03:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764301672; cv=none; b=jpRpdC7wcjssVo5qr1YCzmgk/Gj/KJj06j+AnULKgwZlpkD5k2nVCgxIEYrWslNqoa85mOYK90JGaq115V1tvIFXw92p1swI2dzsBRv3o48kfVuT6Tptk83FvHmnljinuvtASFQdgfwyz3JpN5h+1KQd1urW4gDIc/KqPm0YuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764301672; c=relaxed/simple;
	bh=QGAsLnRM3MlmvGCQEruDpzb1qYVXu3NPNRsm9t8bh/8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYsuvFEv5TihR/PlSSZciV/VFyq+GigIcU8lwIl4QPUK7AVEch94NjThrSuVoMCMnEZusfbL8kaCEW/kKyV7gMsXaBkgos48yaVz6um+56MKzWWUJdEjtOJ7pwl2Z2YDfdx4kGtLe9n67OwlsyARmPzHBZcUqq15SZIAYyZPFCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CEVupvWR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEVupvWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764301671; x=1795837671;
  h=date:from:to:subject:message-id:mime-version;
  bh=QGAsLnRM3MlmvGCQEruDpzb1qYVXu3NPNRsm9t8bh/8=;
  b=CEVupvWRZSwGDh4LxO4JWLuXTIrXvc8dNyJQykjHBnamqC6glHMgD23R
   ZZ/HnNc30dCfbGM7zu7I9esgCOMWg0j+V9UPxFuFGf4Edf49HjgTNKoAL
   APsjoZa/UFLWFY1wxr7lrUxs47iO8r4W1Ci635kS2jAgEFTdg0aRcY8ok
   R5GLQ0DjicyR4LQGnKgwcr4eRzAobLwjZqL8Jts/fnbnUcjVGT3W9J5gx
   tTLJC0If3vLcBFn9mfFeC5a3GYejikvQ3F0Scxi7NJnJt3oKT3xFqhXNT
   caafVZ8P2t6lmtT9qtE2tsuB3GD1271q81DKqD2PtuKQ9a1RN8w64GGG5
   A==;
X-CSE-ConnectionGUID: a4AfZs78TkaPUaYs8B0VtQ==
X-CSE-MsgGUID: 3G2imgQOThu1qRG135fAyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="65524921"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="65524921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 19:47:51 -0800
X-CSE-ConnectionGUID: r5ZdEn6FRrSUzQTpef3gJg==
X-CSE-MsgGUID: gTmNciiFQ1GZRoV3f8b8Zw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 27 Nov 2025 19:47:50 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOpSW-000000001wX-0Uk3
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 03:47:48 +0000
Date: Fri, 28 Nov 2025 04:47:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [litex-hub:litex-rebase 15/15] checkpatch: ERROR:SPACING: space
 required before the open parenthesis '('
Message-ID: <202511280402.b8vdWZdZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gabriel Somlo <gsomlo@gmail.com>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   8149f28aa60a619b57e2d4d50e4211a307ce7e3d
commit: 8149f28aa60a619b57e2d4d50e4211a307ce7e3d [15/15] LiteX: LiteSATA block driver
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511280402.b8vdWZdZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PRINTF_L: %Ld is non-standard C, use %lld
#164: FILE: drivers/block/litesata.c:114:
+	dev_err(lbd->dev, "failed transfering sector %Ld\n", sector);

WARNING:PRINTF_L: %Ld is non-standard C, use %lld
#219: FILE: drivers/block/litesata.c:169:
+			dev_err(lbd->dev, "error %s sectors %Ld..%Ld\n",

ERROR:SPACING: space required before the open parenthesis '('
#330: FILE: drivers/block/litesata.c:280:
+	for(i = 0;

WARNING:PRINTF_L: %Ld is non-standard C, use %lld
#353: FILE: drivers/block/litesata.c:303:
+	dev_info(lbd->dev, "%Ld bytes; %s\n", *size << SECTOR_SHIFT, model);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

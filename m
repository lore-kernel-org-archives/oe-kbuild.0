Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24AD2236E5
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765917325; cv=none; b=e1qLpEGp8rVOACThxYtS1ynHfWzk0bk1YQQjLdi2JAiH/PQjZ5oiEgK8GD2x0LhUACOYHfrfUEJV+xg6uyFUtxtMRi2CyJ/iNBR8wg27eZbtge4zI2GJdWujFZbKXGIsaoNJvy7PIpsz37jn6W8helKI2btPaVoWVwJNvv526z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765917325; c=relaxed/simple;
	bh=wLJxV9aJc1624DBxtBx8jDy6UXwdk0XjF0UmSAz5y0Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dI8D8UvcRfdsn3Sq0rw4pkz9SL/k7B9TxgG+dzXaA05XrDlVMGoAaxzWRsQi7qtPFiHoElks48ylisKxsB0P80CwMLbRB98yxDW4gYPOt6Pcr8nZ7ZRPBggV4DAEXMpPkdpvtAmLpIFWHkrTwkW8aFYaNz2ULwblcB46vrgwPuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBrgzGnQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBrgzGnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765917324; x=1797453324;
  h=date:from:to:subject:message-id:mime-version;
  bh=wLJxV9aJc1624DBxtBx8jDy6UXwdk0XjF0UmSAz5y0Y=;
  b=NBrgzGnQ5z1T9r/pTLEZusBCdsTYOQ+0WbAUOF7the5bXsbtJwPjwnmQ
   CRg2Px+cngvhLDz8xdMhHEXznGOZa6jL7qPl12/jRmTOwrqioUPvYdtdo
   1YgblmdiRYSNFhda5ZKwHkfXVaimWKXXMaKpfornGRH8W/gH9npor4ucX
   2VrKzp92I5XZnC7wJYUjo5DnMWr09kFyZNSVKnjVPXt2TObYMgtudUXHc
   7HYJAVzTzjeSfc+34YVAj46yLRtmC9zmaJg3OYooYDy+O24myagMKAUHz
   2aZqRz93B390x9eTiav6RS922t55Y82VKVkcqlK2WqC9HPGavO7pJDYMx
   w==;
X-CSE-ConnectionGUID: 2BSZwU4nRQajxi9xqhQ3qg==
X-CSE-MsgGUID: 3EdWbIJ2Qc+CXH7rBXwPpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67888308"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="67888308"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 12:35:23 -0800
X-CSE-ConnectionGUID: XKJaleJvT1iHtelmAmDkmg==
X-CSE-MsgGUID: 2Y1EB8f8Rt6y8cz2QVhZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="198011073"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Dec 2025 12:35:23 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVblQ-000000003Fk-2THn
	for oe-kbuild@lists.linux.dev;
	Tue, 16 Dec 2025 20:35:20 +0000
Date: Tue, 16 Dec 2025 21:35:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-attrs 35/75] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'code'
Message-ID: <202512162132.5XEfuqlj-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-attrs
head:   437923fc42e8dae8e2afe0576bd7d30abb043dd7
commit: 6212851313f7d33fbf77caf75f9dbfed1cfacddc [35/75] fuse: make debugging configurable at runtime
:::::: branch date: 70 minutes ago
:::::: commit date: 70 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512162132.5XEfuqlj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'code'
#28: FILE: fs/fuse/Kconfig:104:
+	  Say N here if you don't want any debugging code code compiled in at

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC41D618A
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 00:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764809921; cv=none; b=cq5U+BDFfbBJBFsrTsLcLMBHV7BnhvKCiSBOf7wc/CKq0hUc6lUH9Ij9fZVfP75BeLsTkhEH2zueVUdYfTCBhbyA7JxF2qjPkE4a1AEcwNBI59hiXnfj0IVdD7biwKeV7wcHSccyf70Y1H4Z3/UhHGP/YKLAdsCND88dAvkZXvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764809921; c=relaxed/simple;
	bh=go1YPcMqX+wHqeMdBkdbAqFUUusBiVS22r1DYIRUaB4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxjYHCT9HUChhaw0OI6sQLsEBTbxuGpmpgFfDixDSHc2jerRE2pVGPYUJfpZ6GPkHC0wxpWrafBS+MpntUnlNDrKyujCnJ34XbrmF0bu0JgyqfgEwRkksC2s6mqBhVIYsKL3AnAdNG67eyyHOHt5Qu/1Fck9z7zru6+lWm6i808=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAqIwznN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAqIwznN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764809920; x=1796345920;
  h=date:from:to:subject:message-id:mime-version;
  bh=go1YPcMqX+wHqeMdBkdbAqFUUusBiVS22r1DYIRUaB4=;
  b=MAqIwznN60CMRve6bnJpwoVzgGwNnKEJ7MUzEEQS03Gtvr2sib7ky+ZX
   zt6DWufwrJuWA3qkohlAwXDA9AqPx8QuG4UAInFwlImt8hOHxkNGP+9xs
   MZii2gwgPHO45jKDAQR2LvCle8mHAXUI0daHgdeJl5dY3iRTuwVSAICuG
   xcVpGNMbqzdB5eNyk35PavsugxGh225eeRcXH/FmPiF8nnZGoXuqfFUt/
   K62bzH11+BZw2b0egaFFFQ+lzwRqKA4QZiaoSPJoF3ZEtbWNKHc/bzUH9
   /W+zD9vjT5NV2eRMkeOE+9bIhKFVOzv+YMCQRVgSaU4oJmY9inf08blSE
   g==;
X-CSE-ConnectionGUID: ma+epyogThSNFrDBdUX5WQ==
X-CSE-MsgGUID: XlgFQ1twS8qeHYSDwAlC4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77145285"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="77145285"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 16:58:39 -0800
X-CSE-ConnectionGUID: KXwBkwadRA6dBkh8xSAUTw==
X-CSE-MsgGUID: GldER3ilRuO+6xen1ELwJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="199789634"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 03 Dec 2025 16:58:38 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQxg3-000000000bl-2hUA
	for oe-kbuild@lists.linux.dev;
	Thu, 04 Dec 2025 00:58:35 +0000
Date: Thu, 4 Dec 2025 01:58:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-6.19/block 39/121] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512040139.eqSbVJst-lkp@intel.com>
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
TO: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-6.19/block
head:   b1e5c96ab4a011763afac033f6660cf1eb499458
commit: 262a3dd04e729386bececffeb095d31f7a9c43d5 [39/121] null_blk: single kmap per bio segment
:::::: branch date: 10 hours ago
:::::: commit date: 4 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251204/202512040139.eqSbVJst-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#6: 
Rather than kmap the the request bio segment for each sector, do

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

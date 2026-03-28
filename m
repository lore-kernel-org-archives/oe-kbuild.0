Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773B12B94
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 04:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673223; cv=none; b=dMeUzIQ88LiFCjB2CX0TSOIMP73eRCfhMGMuR/wBhMGAuKigYNZSXy2y/lRfQW8DMlrCun6faW9A5KopxDviclYzgNwubjjq3MbvKCo/jJ4M3zdajZozTAndBnVL4+sXCPYGhCXGPCAkBp9jbvrRJ/sbFC0YChF2IHASZHK6kIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673223; c=relaxed/simple;
	bh=TCIwQbeptKu165LJ9lcnSoRqmsRNfMNYaEY3FNo/w/c=;
	h=Date:From:To:Subject:Message-ID; b=EbuSvkYzQ7PlayLFyp8X128P+VvLb0gkzpHeuzs+Eya4hi3508psbWAE4Qt+d38jLkKfODoChyabGIceqzl2y74PcKZee1+BsJ7pxoebAZFPh+/DsXsv5DIhqov2iv7u/BceKuDRsbQ3K5W/QaRmUfitA3yPoXKt2Qj9X69bVpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHH7i1A0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHH7i1A0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774673222; x=1806209222;
  h=date:from:to:subject:message-id;
  bh=TCIwQbeptKu165LJ9lcnSoRqmsRNfMNYaEY3FNo/w/c=;
  b=UHH7i1A0/wdlj2cQuYTp8Psm7Ae16N+86QuoSW9RDp0VAVhSbbDxSzDf
   +JW0iXsAZySQBZZ5wBT1UoKvq4Ai5AAJPfk9c0bteC+uC78VGJS3GuW9z
   n9Z0JmANbmLWgq8P9oMI+Sn17ouKzLl+GXplmfr9smwlWSQdwvJBDFEyB
   0nc/v6d+eSZ+vO8km8zCLk8Ng4nwwF9RRyJVfVc8vwoKA9QpR6oS1im6/
   Tc+1z2+RIcFG3UtqS4MT72daqWv8TegP+3atzciUtq5aWNIl5Y5NSWmUJ
   2mBM7b/wAc38HROHlX1ZDLBx/nFdwi04Mh9bTKraFc79LSWEgRSz8ka38
   A==;
X-CSE-ConnectionGUID: EpqYN6gFQ2Glg7YeGpzscQ==
X-CSE-MsgGUID: XG8Y4PwLS1St/ecfBev/IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63296696"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63296696"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 21:47:02 -0700
X-CSE-ConnectionGUID: 0+4IegIfS8G909hHs/4n8A==
X-CSE-MsgGUID: SDBMaof+Qg6H/g0jWvDhZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="229983379"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Mar 2026 21:47:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6LZa-000000007dZ-43Gz
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 04:46:58 +0000
Date: Sat, 28 Mar 2026 05:46:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ardb:arm-xor-intrinsics 17/33] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'it'
Message-ID: <202603280511.RmXZCrQ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm-xor-intrinsics
head:   08cc4ab31d9ebd8f4b04679a283bdfa823f8e315
commit: 3a62906d2870385fd1bc10871dd3e5c83d22bb35 [17/33] sparc: move the XOR code to lib/raid/
:::::: branch date: 12 hours ago
:::::: commit date: 20 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603280511.RmXZCrQ1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#6: 
Move the optimized XOR into lib/raid and include it it in xor.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

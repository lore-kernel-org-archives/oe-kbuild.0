Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51C21255A
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Dec 2025 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765112110; cv=none; b=hJcEO93wEXf3T4uoUk2P4xm3EgkJ6rtdSi52kttG9qW5zVuwMWq2tm6XH/zVFO56AElKV4gUnOdDcMTKqzxWFVnIrhcEbkg0kbC8Kpq7K9Qj4fDvLOaYlpflJERqDh0V1bKQKhDiLEHY69FkNnkp/+7uCQVSGII0lzM/FfCbpr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765112110; c=relaxed/simple;
	bh=2CRJfE5kRioOtZsm8Elrvt4/3ol5d1QVzpX4CL96UWo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QflW3AKYvpI/GmGVGtY9dmijCJjf4NfCiNFaMIVFfc31cwNUgESPOCTgyawTDCzwh2X6vA9vFMVXdlWCI7yOrDOjE/BO0mdQPJLnaiLT5huQzZOgauw+STUBRhhN7PRI06TiQGp+DP/HyRUyhwBVefSWbimVxjvqLH1sNL5Jvnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMNGNzdo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMNGNzdo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765112106; x=1796648106;
  h=date:from:to:subject:message-id:mime-version;
  bh=2CRJfE5kRioOtZsm8Elrvt4/3ol5d1QVzpX4CL96UWo=;
  b=LMNGNzdoiwALm3H8apr6YHuiLqFnO3MQsG2frsroVehoXjFXGGTMhjWd
   dH3xbcq5XWR20QWyHnJa7b9Q1gx2ZM6TANdt7aTce95twkOoIxUra0+bG
   OmvBk1RkiAsn2ccSGdvIzx+eCDfJ9fuI7uRRUpWl1nKbSnGqvGlYzJ5Fj
   td+dIbuAbk3p6ILDSBN4izx0YWt1URY0Was0bj7Vr2TAskG9iuUhe+o8e
   flk2WIRIvjNCDiospycc9EfSivMB6rm42HjTc8rnondXAKWN+jypONM06
   wRNPrECDounHITIfu1DhqoMuItL2JvovlwMg9lyBFxCLmKCWF7egBheCO
   g==;
X-CSE-ConnectionGUID: qGynfJ0rTtmf8hrLB+s0IA==
X-CSE-MsgGUID: Xevl1B2VQo2O43fxLMCOVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="92553043"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="92553043"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 04:55:06 -0800
X-CSE-ConnectionGUID: 8GRbupTARiqTSd8gCOiZ9A==
X-CSE-MsgGUID: kHQOKw9uSOy8TxbBBM78ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195524339"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 07 Dec 2025 04:55:05 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSEI2-000000001Cr-2sVe
	for oe-kbuild@lists.linux.dev;
	Sun, 07 Dec 2025 12:55:02 +0000
Date: Sun, 7 Dec 2025 13:54:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sj:damon/next 23/117] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'can'
Message-ID: <202512071334.sAiULIIs-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   2ec62923613ba0d0e98edb191cdc02b7cc626067
commit: d989d83e79b01cd6903e56a610181a0a213a005b [23/117] ==== fault/report-based monitoring for per-cpu and write ====
:::::: branch date: 8 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251207/202512071334.sAiULIIs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'can'
#53: 
information handling.  And DAMON API callers can can implement and use

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BEB264FB5
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764245083; cv=none; b=DunwOYXzwK+xrk/quGsAqYUC89z5dtB2izESJJdD1EYYg3rzK2SmJDA1/jJF07uBE7QcV656OL4rEnOv/HjuWB7a7p/VYSugTUdTw9G6Q92utqI4VyH9TcQrLnBCnLgbmDCEstPjydduTaY4WDd8AokXx1Mveu/ZlX1rkENVBJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764245083; c=relaxed/simple;
	bh=H03ILprRH1oDUZfNZqmMVFI++TMIIXRpPDXAaITMJFI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G1fWb46C95O6b5e0HeImlJjoNaloZNIuw7j02IH44oNKv0Od4jAdXBMPDq4eCL+cM1+d369Ddrk8SXILzuUcd5rriWRXZvy+V3nP6l925SCz2YVkVPBlEzEyg+VRhfVg0hYLcRlkDT1ZyMjC2kFAg8aA0exbCPhOzn7FkM7RhU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEpWPTBZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEpWPTBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764245081; x=1795781081;
  h=date:from:to:subject:message-id:mime-version;
  bh=H03ILprRH1oDUZfNZqmMVFI++TMIIXRpPDXAaITMJFI=;
  b=QEpWPTBZguOXmABCEbc0oXF4IBpBJgDP1oFNhrvh/R2PnOZTEX9V6DYq
   MWD+yQ2urqUgDfCpCq7PwLVShc5GKgaOCJ46q/q08g+/3uHVQ7Q0DsmzY
   x26I4FVMAwfqTmDKtm4i/iB4x043LeciCqmnyXlXXN9NE6ej/Jln+xfus
   Op2YvvG8QV3zci4dB7HlnR77J1XH3UWpUyKNoXtxrrNS6cKXiLMturLEF
   Xzq3twM7iuzLddpNFdQotQQ2YaYqSMSfxY9qZljV7eOs3H6vndsoau2gu
   vleTw+OGi1IsAOIBnwdoJZRNJPo/3TLPp6pImyZ2fSOknyjwcTvvp0Lb8
   g==;
X-CSE-ConnectionGUID: 0yr4m8AdRB2X6VLQlAcL3w==
X-CSE-MsgGUID: x4t0erXmSdiBExxwI+wUOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83684255"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="83684255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 04:04:41 -0800
X-CSE-ConnectionGUID: YJeeG0h0Qhihlpj4TV1L6Q==
X-CSE-MsgGUID: BUZDrs+iQymFho22iUp37A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="223915881"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2025 04:04:40 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOajm-000000001jf-0MOu
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 12:04:38 +0000
Date: Thu, 27 Nov 2025 13:04:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-github:vfs-6.19.misc 13/30] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'to'
Message-ID: <202511271342.ZQ2U6SfY-lkp@intel.com>
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
TO: Davidlohr Bueso <dave@stgolabs.net>

tree:   https://github.com/brauner/linux.git vfs-6.19.misc
head:   ebf8538979101ef879742dcfaf04b684f5461e12
commit: c29383a874ee86af1c68488f15f88544140414fe [13/30] watch_queue: Use local kmap in post_one_notification()
:::::: branch date: 3 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511271342.ZQ2U6SfY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#12: 
is planned to to be removed[1].

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

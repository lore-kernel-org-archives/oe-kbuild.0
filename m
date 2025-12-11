Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1A2C0F65
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 07:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765436863; cv=none; b=n+Re/r5lKBP8LlVLJQ/3US1DDXQkcSWE0y/4m4HVpNDXtb9etToNhVDXUgb/rJWY2musXQcLIgs9XneEt3G86bT/1v02To8JWL9ZQ3dtAe/q/LqZwqNXw7V+WLRPcH46ZEOR8Eqb/H6gh6IqiYILdcbbd3YwOK17235sgNmKd8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765436863; c=relaxed/simple;
	bh=WDp2iWJ1biib1tO7xnVe8UjEO6CHpVZJUlfHy4YAtEE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TegksXa/3GiBh9uYTGt43elaI1EqBTm7tawiW8X8n6vAu0Sq9ZeOKWAS6UMmv6NxhxXignwMufz5j9akDDXxvMHwPQhI7SenPtx302NUER8y9AbaZIIg1NsF6ODL7szz7m2Nn1fNkZjtl+pehbonRXke5o8frLtKFlkDXxXlmd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mI/njkvo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mI/njkvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765436862; x=1796972862;
  h=date:from:to:subject:message-id:mime-version;
  bh=WDp2iWJ1biib1tO7xnVe8UjEO6CHpVZJUlfHy4YAtEE=;
  b=mI/njkvozrhJKbWWyyYmBjuEebbyME1WvDhWEPCp46wKvb7nvT0X3Q7Q
   qj5h2XLouNp8IwHNQJ6UoIjQeVBCQSupWBTx7a7dx44Yzq7/Vz7HzEIJb
   mXtItNeQ0mgLCIFzix7yzessqWIn6Xzs2urdPtc5mxsmR+IkfjeMQSxmQ
   2VHVOHBz78nv6CZWNLzvpPfB0jVDPB6kFzcZvZxrwbb90MqGvME44FmOc
   Ey/sjWDBYC08yHr/1kNchw1cX+J7rtOz1jvjmLPqf04fRZyhUyWrOnTJB
   btoNtCQtp3MI1+dCZa7YGlX84lPXiC9PaZYYT872N/HroyyaxyA6zVY/H
   A==;
X-CSE-ConnectionGUID: Q090LsYIS8i3KdG9S1NDdg==
X-CSE-MsgGUID: SLtcHYWGQteHwvemJenkVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="85023448"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="85023448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 23:07:41 -0800
X-CSE-ConnectionGUID: HWcw4zHtTQ+5HiMvijjUjw==
X-CSE-MsgGUID: 0TNPiVtGRnqci/7QcRRLqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="234139341"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 23:07:41 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTam2-000000000wk-1BE9
	for oe-kbuild@lists.linux.dev;
	Thu, 11 Dec 2025 07:07:38 +0000
Date: Thu, 11 Dec 2025 08:07:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:rev/nsvm 5/15] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'Nested'
Message-ID: <202512110846.5ZcBS0bj-lkp@intel.com>
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
TO: Yosry Ahmed <yosry.ahmed@linux.dev>

tree:   https://github.com/sean-jc/linux rev/nsvm
head:   cbad86cb31746adbadd39bfc26d37fdddcddf895
commit: 2438875f095dbfb2b1ef6e62ace3ae9d62dd4f56 [5/15] KVM: nSVM: Fix consistency checks for NP_ENABLE
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110846.5ZcBS0bj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Nested'
#58: 
Fixes: 4b16184c1cca ("KVM: SVM: Initialize Nested Nested MMU context on VMRUN")

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

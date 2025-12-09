Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90BC28B4FE
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293190; cv=none; b=mtXQzR8HVzZH+y9+IIh9LW4o9atEElXdAysz4fEkiqeJJexFXVSreS2V0fyWEed3VEhxQIoIWf2l1RSeSeVklwrQ/vxtwetsuRf8XH0Jh7RjwMxIN2pKQ7iSxRfg+WBrrsaCmYIwSIbC0fCA1c6gS9whJaFWktvacIZ3+mRVGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293190; c=relaxed/simple;
	bh=vVYZJNBz5LWDF34kGjKgyCw0tJBE2WFanym0K2LI8Rc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sWisOrZq+opqJxaSDFTGu8HManegThJJmKFQw354jJdCZpN6hJUXymVz4WhvQAXyIma7uO+DAga/RPBUXTa/cHgticcVxFZEdhrEiEUMjHWlQOxbKuUZmoe7bdHlzhJWWPDSWng7Ksmamm+pr6tM/NRi6Y398WiGVce/3+rR1CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2ryLYu2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2ryLYu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765293189; x=1796829189;
  h=date:from:to:subject:message-id:mime-version;
  bh=vVYZJNBz5LWDF34kGjKgyCw0tJBE2WFanym0K2LI8Rc=;
  b=I2ryLYu2utPl2XiYln1OviQb32pYe7875j9sMaiX+bxFr0Y7X3IL5V4g
   93p2fLJx7HVcLFVO9e77pP502TtDpljr0p9GPgv3JI37oS+k0979ZIyLU
   LU7j+q/LR3QRHkzjLwQTwpTMfgh9upJY/nazZKX/TXXSpqnBOkJHjiMSN
   cFtwXPm3FYJgpKH8HLB7t0mXfCwtQ/9u6oHZUM3ZTyVx0KD/PaegXh+Xv
   Co5SFaNpNUgxe5zwK8Z0ai0fu/NeHwPtlcoJcR8/BjFSNq+yxXKNnSlN7
   gIiiUjK2a6sF/b9H9fXJcCJ7dZvMBrUBwYAnlnqJ8M/AeHa9NPzxyYUc6
   g==;
X-CSE-ConnectionGUID: 6gn09wduSx26q9+fR1BAZQ==
X-CSE-MsgGUID: ypSiuXrwQ3WGiFXOrpQmPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67146158"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67146158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 07:13:08 -0800
X-CSE-ConnectionGUID: WOAQpt9BQDu7H9872A+T2g==
X-CSE-MsgGUID: i9+n3WQITxmbLbiDuD0UeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="200677622"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Dec 2025 07:13:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSzOj-000000000I5-2nan
	for oe-kbuild@lists.linux.dev;
	Tue, 09 Dec 2025 15:13:05 +0000
Date: Tue, 9 Dec 2025 16:12:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 59/77] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'user'
Message-ID: <202512091610.xsu0Ogd3-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   7b8fcb0b24458c431836a34eaf8477f4f4a0193f
commit: 437bc1ccfb9f7d017e2266423ae31ad3ace3a73b [59/77] liveupdate: luo_flb: introduce File-Lifecycle-Bound global state
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091610.xsu0Ogd3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'user'
#25: 
This patch does not have current user user, but multiple streams depend on

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

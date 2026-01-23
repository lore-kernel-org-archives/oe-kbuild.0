Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF00937AA6D
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 05:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769146914; cv=none; b=iiA96SAuT1p10xPZvTqsQhmgH8mwdAwsePDuO2Y1s1IwAJQ1uSWhzgwr7Yc9JYgKoypsC+T7THtKskUguUK0FOVSJS/esqOOx6qobNWKTS9Sf8WDChDjALs+k0EfR0RoRlPmsTU0VW9cChTWRQyrnqktWTs1YdlBgHM1lssHcVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769146914; c=relaxed/simple;
	bh=eCNsPkSxhQ2LFCYas4U1I/aCYKIAVsI9H7oz19DNkN8=;
	h=Date:From:To:Subject:Message-ID; b=PEKHXpRbworBt54rTCy9oe5jBlzpXkxGc0Lw/WZVcI3PMl0XZDx6uVRfBmU9DY7AGoMTMEGdM5BJV1q6Uj6+NAjIIeCQstuImV8MLUwJql/nn45jr7kOOD+d8Ov9/UgUIZCJL8NESbnHhMAs+vgwLgna0QsVqxSjG+8XjdgRQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3jC2p7b; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3jC2p7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769146906; x=1800682906;
  h=date:from:to:subject:message-id;
  bh=eCNsPkSxhQ2LFCYas4U1I/aCYKIAVsI9H7oz19DNkN8=;
  b=N3jC2p7byWh3oX/QUKqBAp1JfpWjNZ5BPV7OaLtmUG6x5LLs1KBpf+vz
   GZnrMwtx/El6iBYWlmSZqt+PUjauqVvhrJ87ofRTfyF/ahu0Awl4fuhgL
   sMXS0gzMANlhV24Fh74L/bwAqiyVgyqkEPdGzVLxNo/IxVAPa+il8vPLr
   ZON9rPYezoIOxBrAhhqqZhXNwON6ewOiTAXmuMBnm9pkI313fJePeOC3P
   F+WthdSkQSTz2jRYnlvOfW5w3rTo0KKxV5ev4H1WDyErtTG+XCmc1iEEh
   yKiHepaKXS9BjEsly6NSYVzG952y4KgwgnfGJd0hUrQGNVxQDe8E47shU
   g==;
X-CSE-ConnectionGUID: 276DmPM3SiGU9CVnkoFNxw==
X-CSE-MsgGUID: VJuZJ8mzSX6F12fiIHH5og==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70563591"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70563591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 21:41:43 -0800
X-CSE-ConnectionGUID: 6NidJk7xQB6ED6DRtepPzg==
X-CSE-MsgGUID: Al44I/UESG2xI3nYEhkQhg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2026 21:41:41 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj9vP-000000000f9-3Cxd
	for oe-kbuild@lists.linux.dev;
	Fri, 23 Jan 2026 05:41:39 +0000
Date: Fri, 23 Jan 2026 06:41:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 285/326] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Damien Le Moal <dlemoal@kernel.org>
	[zonefs]', should be: 'Damien Le Moal <dlemoal@kernel.org> (zonefs)'
Message-ID: <202601230600.zhiGAurc-lkp@intel.com>
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
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   a68cbc54bd72560c3f583166170f226d6a3f29ea
commit: 009b88aee736e0965b24899cae1ad2e4d701a172 [285/326] mm: update all remaining mmap_prepare users to use vma_flags_t
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260123/202601230600.zhiGAurc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Damien Le Moal <dlemoal@kernel.org>	[zonefs]', should be: 'Damien Le Moal <dlemoal@kernel.org> (zonefs)'
#25: 
Acked-by: Damien Le Moal <dlemoal@kernel.org>	[zonefs]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

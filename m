Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB851219301
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768641205; cv=none; b=fzMbkfp2bwO3bzn5gyXzFRGDbEXPBMUAm9T4cAd8AesM8pFqPjg3PSRlhJU7XQ1+tQpej7IqVAjjThchh8eMLMDNGXyOkXhaQBDqFv5DAQY7scFqvcXi0EJxMM5Q7ETgcnyBQ0E0KB6w/WVU3YJ6Yor7A246QMies31G0rAitsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768641205; c=relaxed/simple;
	bh=pqcou6WSWyHYegeT3X7vyXnJBAHNZ8V70SW/JRBS51I=;
	h=Date:From:To:Subject:Message-ID; b=CDPJ+D5wycrHqaayxR4bWy33/P9h8hkjYBo4i3FddU1JlM3SORor24dGTQec55sntv4DIwMDSvZAfBbQRDVwAkhyfTe6g43CgBAlGQas83l0dciRTV/rwCshHPkExhJojfNCiHp0XOazuTMBUUs3Xle2WttCYSf+xAStJpismqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiH01F32; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiH01F32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768641203; x=1800177203;
  h=date:from:to:subject:message-id;
  bh=pqcou6WSWyHYegeT3X7vyXnJBAHNZ8V70SW/JRBS51I=;
  b=YiH01F32j6rkcOMrASOHK75NJNo1Z+pKSEJvKCgcqUBn9FhYAnUkTVf1
   6gZHwOKuN+Ms6BaJZ42xJ3W+c0Jf+GfJHYqCWVNgK7BojL0uOSuUqzObT
   0N2DPeY+SKxO40Z5oYe8XG7d8g1oG4Ox4pKXqgdi2rJ1TajR6c/kGXdfa
   t5MhYVoSC2RxTL+Gse+vKfzPPzG4JZRiZ5k1SAXw5CTDO5cu7hGnIoqOy
   B2Oz6tNUn2/layCQCkfxk4hohpMANyl41lYlWxzZfqPngLwU9qg8Uyvhx
   g8ndkpLEFVvLC3IdTdtG2zU8XWVl/yqWir4tAU6q7wyDM43VOAzvBOJod
   Q==;
X-CSE-ConnectionGUID: 1FqwV2uNQAqY2ldIqMUdTQ==
X-CSE-MsgGUID: YGz1cPDvSPChjK14LfD49w==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="57493854"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="57493854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 01:13:22 -0800
X-CSE-ConnectionGUID: BK3oPnRXR9m11LrCqV1ehQ==
X-CSE-MsgGUID: jKaC8wpyQpO2jHsYQRb00Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="209937735"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2026 01:13:22 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh2Mx-000000001xV-2Lvd
	for oe-kbuild@lists.linux.dev;
	Sat, 17 Jan 2026 09:13:19 +0000
Date: Sat, 17 Jan 2026 10:12:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 215/215] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'adding'
Message-ID: <202601171016.DpoCbbme-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9e783badbd805a794a4237d27f70360ffc7cca54
commit: 9e783badbd805a794a4237d27f70360ffc7cca54 [215/215] bcachefs: Fix bch2_bkey_propagate_incompressible() call
:::::: branch date: 46 minutes ago
:::::: commit date: 46 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260117/202601171016.DpoCbbme-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'adding'
#6: 
This has to be done after adding adding new pointers to the extent to

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

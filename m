Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADA721FF55
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 21:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764451695; cv=none; b=LpGmimsIN4y8/ezlr7kPYrSC86Fmbf7Khxhh4m3Qqt2NjtpyPfgjRoXyvCmOUrDo8ezoVli76NXzci6ZJDdY/rXhZWWVkTYx2/3yftVlaqUGqxMDrXDeg1hCicgW7Md4QEc5YfdWxVB5lj6yyNB2rjo566tbcxR2bqmtCnn8+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764451695; c=relaxed/simple;
	bh=sWRTg3FcqGDAgjiBJdkb0EZ1qMWezHGPMW2VKKJFiNQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sg7mwz0KttlpytJhbPz47piPqcZl3/C4gkpJ/15MPak2uxKBATfJcl0wKnw0bKdqwChasjH0E4h3VyVxUwSLE3L2119VTIeaDxifpdw/ctgbmVCRwU8Yf9aQVWtXsHl5fTOdr3ozSlCDJ2oUpEqFsIKo4ef4ynCT67DQG6z+F0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2wDWyI5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2wDWyI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764451692; x=1795987692;
  h=date:from:to:subject:message-id:mime-version;
  bh=sWRTg3FcqGDAgjiBJdkb0EZ1qMWezHGPMW2VKKJFiNQ=;
  b=R2wDWyI5pAFDyY35Ok7myM/sF3qqxBOvkcHAXUmuA5gHVTyZQbhYqZJc
   sTeVcAYX56VJGHx1FUJOEcmHiqbkjOMFXoxNxxHp7SE2bsU6J8oI+t5Kk
   onaGA0ti06+1DoHx4vQQhgr4n0eMpCnKKro2G47XnmaseNpssiu7P2Nqn
   ePrwC2V8KEL/3+AsnMc1DWfWwH7lEvgbp/+Ik+XiSQ04xfyB7zX5TxK/f
   PXoslobOIPksqRWiIHdMqhH3eRe8fqz4ydqBa/OYjJCIfHa9DAkBjtQvF
   XT/bD4WRvMYdjQ6ssJVC6fCR76G0EVLwjXYuhQMg9/+TsP/LaPHnMfZVJ
   A==;
X-CSE-ConnectionGUID: 9A07uBSpSvCuTtc0Tz0Dpg==
X-CSE-MsgGUID: ApcclN1GS56rt9quhXKB6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="89082574"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="89082574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 13:28:12 -0800
X-CSE-ConnectionGUID: AZ1LgZVbSd6dSyZi0tEn9w==
X-CSE-MsgGUID: CTyL9jnIQMyBYhDGr/+cHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="197917756"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Nov 2025 13:28:12 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPSUD-000000002OT-2Imx
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 21:28:09 +0000
Date: Sat, 29 Nov 2025 22:27:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-stable 135/323] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Alexander Gordeev <agordeev@linux.ibm.com>
	[s390]', should be: 'Alexander Gordeev <agordeev@linux.ibm.com> (s390)'
Message-ID: <202511292202.y2vG7UQt-lkp@intel.com>
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
TO: Anshuman Khandual <anshuman.khandual@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   faf3c923523e5c8fc3baaa413d62e913774ae52f
commit: 272239dc8fcb109b9f1ec1a73bb85405dac92eda [135/323] mm: make INVALID_PHYS_ADDR a generic macro
:::::: branch date: 3 hours ago
:::::: commit date: 13 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511292202.y2vG7UQt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Alexander Gordeev <agordeev@linux.ibm.com>	[s390]', should be: 'Alexander Gordeev <agordeev@linux.ibm.com> (s390)'
#12: 
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>	[s390]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

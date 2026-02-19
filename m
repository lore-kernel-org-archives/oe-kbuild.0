Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9EC1AE877
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 00:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771460493; cv=none; b=Vmb/XV6KOrWZyqpTDPQcTAdNUppc6GzVuFI5Re3hyzGwqFSermz9bOFuk5YHULeggv8S4Qlp0PmBjhFdPtC/3BHa8zxETYvb1ChQpVUBegu/qCuhARqjB0Va3lxrCmWzC+A/zV+aDSAG8syuMPTtlXgv+EVYfXk+VpCXjsxbswo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771460493; c=relaxed/simple;
	bh=V0NYFwHMhKr5PpSi7bIHG+k/TCt7Agre87UaGisHGoM=;
	h=Date:From:To:Subject:Message-ID; b=HRrDL8Y8ZlUM9qsX9/Jz92guiyf/KZbV5N1wdHLjkMrijQAbL3wKlzgEoX6OglF3RxBiX/Ocio5U/aYdmqHPuETMvi+aGPdi+N+sXwahFcOFRXeLJZE++y++yk+L52jVp79W3dxKGGCVgmWSZMSzLM5eD+3gzl+8/AxWewkbw1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hm16PMoy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hm16PMoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771460492; x=1802996492;
  h=date:from:to:subject:message-id;
  bh=V0NYFwHMhKr5PpSi7bIHG+k/TCt7Agre87UaGisHGoM=;
  b=Hm16PMoyDTUbjajHPrIQbsuz2afHrBv8VVQPuvdcmDdZoo9DsHtJ0ukK
   d35SABfNY7qJdL6dup9fXaGNFNlv0lKTFxbd2GjfBOXAMTiKXsEoO0eAW
   leHOk9Bun5wNu/ix+cVkpIVLJoCJ6jhY9b+6VMTZt0ucdB2EWm9DLeAoe
   QMBsinwkhiEX/OOYLQgyO19EWeKfa7QU70XRMQ4J4S7h0l+xYMjRpBKmv
   Pdfyp5zSaiY98Dtm+ewrbEwEegcAFdYegG14nHg2dMB0mAZ5cLsq2ueoV
   VlBIQaT78VEpCYd3EZdtlrKu1IqSLemCyUGeYYE0K6166hjfcZaDIH/43
   A==;
X-CSE-ConnectionGUID: BTXkxpuKQw6fvFLEqtNnAw==
X-CSE-MsgGUID: DO8uHq66SleWxpM8KJEdOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="76381777"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="76381777"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 16:21:31 -0800
X-CSE-ConnectionGUID: yOOhTwyZTaOg4Wh17KfgIA==
X-CSE-MsgGUID: j4YKhuC1SdCD/jS6itNtiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="243082272"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 18 Feb 2026 16:21:30 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsrnM-000000003ob-0hMU
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 00:21:28 +0000
Date: Thu, 19 Feb 2026 01:20:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 10/18] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'namespace'
Message-ID: <202602190129.Jg8yp8QD-lkp@intel.com>
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
TO: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   b567ecc2e9f0ca2734c856c9c0c09765bf0de6f1
commit: e39331d2791976be1c6c5d37bb0f9f0c043094b0 [10/18] rootns: Implement rootns_enter()
:::::: branch date: 66 minutes ago
:::::: commit date: 68 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602190129.Jg8yp8QD-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'namespace'
#14: 
Root namespace namespace selection is fixed at rootns_create() time.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0692BEC5A
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766332569; cv=none; b=URbAltkbzxFjpnszl0LJ+xSqTGaWif3c2kI2lUFYoIAyHoV1w98yzMuOFulv8PAsuagBZfrtAU8tkNPN/atsETY8Ig7Mawi/Mc4Pj3lhxj2SJIZuE7e7p0KdppY7C+VSaeGrbgUexb+4+G3cGQU6r1Al4O/O8gokXQ2rpM8valw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766332569; c=relaxed/simple;
	bh=l9DjKqZou5H7EqcVpp0Eg+Q3f7xEG7Zqcn5GE03bnC4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j0B8+FhNk7wuED3lTBSDU4wmbHnUoZalkzfZf0vlMHThybBKKXPPK9a1iPTos2VGtvSTb5sco98K6ZzUY6a5Wg5UZdHyE6IpWVpoZlay3z+khSIfM5NaKJ7UbH32ues5nDJw7SXM8GbbFDgb6hlc3eYrwu1t8ETlqmme2YqdyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+RV4mnP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+RV4mnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766332567; x=1797868567;
  h=date:from:to:subject:message-id:mime-version;
  bh=l9DjKqZou5H7EqcVpp0Eg+Q3f7xEG7Zqcn5GE03bnC4=;
  b=L+RV4mnPceUHCYuLd+mvWHoCZPUlciFVTEPv2X9wI7eR1bGKpIHx3+N5
   yHPPsodyJyA9pGc9SCxlhLMr1YT1J7ffqMDjSbG4LGy0E4MecMiwLVDxo
   rsTvi8m7mKsBMzHCxfS/fjd1tdeo2oqHnbRNIk2vFMRiXAjNrlPqS9F1q
   HF7+QwFJI2gB38co1c8cBTJ0/cX9tjP6yJlgqUO4Aq5GDm7XR3Pg6IrSz
   criFt838lrxWRIHUBVyUGS8YwqTHnR0hNX9hzioZU+C0uIXitIT8SQAUh
   55xEknpJP4g3qNQqd8lytyomWGD1i4RBshacLXkrkHgqu6dozicddacS7
   g==;
X-CSE-ConnectionGUID: PCiWkU9yTB+42WRlrfy6iw==
X-CSE-MsgGUID: r+rL05isRs2BGogO0Lcwxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68288670"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68288670"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:56:04 -0800
X-CSE-ConnectionGUID: jXlts7TmToipdxzVuMEjTQ==
X-CSE-MsgGUID: Hw3M55HLSR+OnVH14mvdYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="198968581"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 07:56:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLmr-0000000059k-45l1
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:56:01 +0000
Date: Sun, 21 Dec 2025 16:55:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/030-misc 4/19] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202512211632.XunMWpdo-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   ea4670c7e602bbd5d08cb2beef168aeb479bf195
commit: 53f87119dfa19c3f31dcc67f09ad48708e7a4c74 [4/19] PCI: apple: Add depends on PAGE_SIZE_16KB
:::::: branch date: 20 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211632.XunMWpdo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#9: 
due to non-working DMA. While the the iommu prints a warning in this

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

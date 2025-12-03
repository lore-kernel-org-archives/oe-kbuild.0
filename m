Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145E320CD1
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764787056; cv=none; b=le7pvFftHr5d8m2YqXcHKrtkeXTHWz6lSzZkWzRsqm6/VFQt6IRfmJoxfn6BKVGeM1XBpuzp0JN3+DBHX90xENq54/a3Yllia/PiXTow33XhZrmP741vtWL8Hw9YVx8rTeOKLfsmZ7tF7bGhu+26/CNcEx77xtXFkvx5+8jG3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764787056; c=relaxed/simple;
	bh=TZBqIbc36bUN2JyXrxPCnirP6z3ys042cvDmQzzNVUE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D9cbUe4NCC9QFw469NJmPNLVRMF5Mhw8dCDpsLpC2F8xFAMmp/M9PzBy6K6leZ60AOEt1Foct8Wn4BSR0ZqdYCM1f9MjrBzLr4cWBX/SYyYDo5HYQ/Qtv+qUbbP+xz+rMZXnfQAQQcymdSiBKIFWPXdoiugIMx0dhjX4aOwLTxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKCTCSYm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKCTCSYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764787056; x=1796323056;
  h=date:from:to:subject:message-id:mime-version;
  bh=TZBqIbc36bUN2JyXrxPCnirP6z3ys042cvDmQzzNVUE=;
  b=PKCTCSYmRsNcRq9vW1Idm8ahj8NQsM0BWNsEaTDIGjYX30zSwz4ntLAZ
   165+Ksr4ZrUYPUowkeD+HlcT7aEys8VeCi8rl/ZDBo0mlT4ZdYyEyHqT7
   w54RKWstCyruQwHnGBhmeVFobdwicY9yf8JnyzHnFKEIxgahC/GwDdvtf
   xDsrk63BRBRzEQAAirCIS+J7IWRFp7fVM8/QHNa8SYx9zmRT9nOTtWWSw
   sskJNjZ3AfmRMH9yPf2imsyxlnBgcWj5DQgrcqLp8aFhT6I2lVfYV4bH2
   EohoqmuhTyMth3H959UPq4NSvhHRV8RSh8iMpe1KaUife2AWg46h4dHIA
   Q==;
X-CSE-ConnectionGUID: mxyOmVHxTxKQB4Hf+j03tg==
X-CSE-MsgGUID: ifwTn2aORSu1otMGDqN3wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66957242"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="66957242"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 10:37:35 -0800
X-CSE-ConnectionGUID: CVake1r4T3KMJe1P4Y5hZw==
X-CSE-MsgGUID: B3jxye91TYKwhQ2vMeeNZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="225706496"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 Dec 2025 10:37:34 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQrjH-000000000WZ-3k1j
	for oe-kbuild@lists.linux.dev;
	Wed, 03 Dec 2025 18:37:31 +0000
Date: Wed, 3 Dec 2025 19:36:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 38/71] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
Message-ID: <202512031923.FHr9P23s-lkp@intel.com>
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
TO: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Hi Shyam,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   ccb61a328321ba3f8567e350664c9ca7a42b6c70
commit: bc3c0a3231b78589896f283d971a003761b100e5 [38/71] platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
:::::: branch date: 9 hours ago
:::::: commit date: 12 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251203/202512031923.FHr9P23s-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#18: 
Reviewed-by:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F0C1D5CE0
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331125; cv=none; b=h0KmXQqSV/jDqxSiMoqoDhZkvK3vIDcLAkDCStlG//TB+D5JjMJ69xGJXDrMI3SNkDwUG1BL9rwdK5T+Ek0C5D/L0sH20afauZWE4LZN3RXroy6ZZd5T9q4AlNbqoyN+Bg44rhvv0mPpeqrMi6muJbpMsxO763QV5qahJNmtZRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331125; c=relaxed/simple;
	bh=m3co3exdCIGGjHM/JzMDNyX//wj0vSBavSegZh7Pv5A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvferDpAnZo3ub6JOw+PWMnHEYM2im+ALWIV7j1Qd+dMbLcKWHa/fzkssaGAZmEntU2frVeUdBtaEhW88wSCnKvpazYj3X+8sP7ixbvrd4BFiYprhFzdFpPNl/RPwH6dqT8jSFRXU0WBVA5B9GMCKya0yVSQ9sQxcwiMcA+usmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzTfxQ7M; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzTfxQ7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331124; x=1797867124;
  h=date:from:to:subject:message-id:mime-version;
  bh=m3co3exdCIGGjHM/JzMDNyX//wj0vSBavSegZh7Pv5A=;
  b=MzTfxQ7Mw9qH5Q16L1IU336SnL8yU2EBjoHu83PfSCZyIzOkDa6S9coC
   no0JIn/tX+IIoWT+O58ezxU97cFBg5OB7wxQGACmmXNYFFUTbdDULj8YN
   KeNjTDF2477Ofk2X3Xga8KCxvaAWHIRNVLXMRe0/W2u5Onx4q/Sy3Jr2T
   hx8Rf2cCGrvPE8B8D+aohIkO8N6T6iRjmarjlZJCarqcky5bLIsixG7tI
   IntNI6ZUnH+dP+NDWwoRyPIBdQosK9bdPh3piSkcjekl3PPcXixPj+7jU
   7uLQ/NxvdPmmLEA/kIm3PAq2hIzA8gm7UzM/CXbJpbU/qer/o5ZqrJjOK
   Q==;
X-CSE-ConnectionGUID: PN7ph/hgQ8KewqFvuIfh5w==
X-CSE-MsgGUID: vF6HegafQ7Kz40EvFwmy4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="70786169"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="70786169"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:32:03 -0800
X-CSE-ConnectionGUID: ROjjBfCcTLCEvXFv5PsjXA==
X-CSE-MsgGUID: Xwc7Xyv5QCmJx755lBqnKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="198965289"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 07:32:02 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLPc-0000000057M-26fp
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:32:00 +0000
Date: Sun, 21 Dec 2025 16:31:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 33/246] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202512211648.aEftjMeQ-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: 73fadfd3b68cbb8f72dd44c98ad8a6e99339a3a1 [33/246] drm: apple: Replace atomic refcount with kref
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211648.aEftjMeQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#103: FILE: drivers/gpu/drm/apple/iomfb.c:882:
+	kref_put(&cookie->refcount, release_wait_cookie);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

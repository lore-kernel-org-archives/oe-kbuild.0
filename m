Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A15736D4E5
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763793390; cv=none; b=Y7L5DcU43fyf9ELIrCBYY/zHFvTLK3g219th5p4YpB3zehV63EOsOgV1ajE40kXPew7ROJyqw622QHHsTvpJnEK7WjPLx7q3pOJjWL/cn6v6gczbNlSEcHv8qAqv22ZR/9K355sMWUYsfbBJqhKGKDGpsZOIWNp6c/PPTaw1u2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763793390; c=relaxed/simple;
	bh=XKy64+efos1C3bJ2WV/mav1Z1zBV4du2lZPH9RGswQI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uu8hLMdJSib1VEY97jjDlHvUa6Ntqr9uLUlQZyvQjqfa7vzfYQCg4Cywb5pj12OOto4iqLluMHLhQAkpx/Clt5x94dkPSVOl/zML8wQHH+2PiJW6d9D6NfLr04NNBCYGSoVnKYFJFmBQvWtCD6yvhLDxaAfDVRZ457YDGimmtc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQAowjuq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQAowjuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763793388; x=1795329388;
  h=date:from:to:subject:message-id:mime-version;
  bh=XKy64+efos1C3bJ2WV/mav1Z1zBV4du2lZPH9RGswQI=;
  b=mQAowjuqVOYkSJR4/4s/GO9ZUnOi34IwUKdNtYbrWLl8qO7f7qmPNAma
   Ytn8SFAHwZrj7g0HcGLAgDd7vaNW/A2rvx2P+0wJ2JrZPQMj6Wp5pbUaG
   fVQ2bXZ+q4UKpLrVzcd72MGHaj6JnD4rpaoStuGyhR86GUnVGcVGtVx+7
   oK09j1+wwYj7f3ZNCogW1q1/uOLU2Sxsc3DC2T9FvJaUOIR74ZSvvGGPP
   Tt7Bnf6QnC9f7OZy5yrU3XDbAq21AuyfpTRJ4CDRASVGmxW7MzBvaJXfF
   d5I5mkR8mlR+woKfnajiFpWEz9RbVFYfzX65QxP29qrOo/KrXSIJsGwJz
   A==;
X-CSE-ConnectionGUID: zi7cq1nnQOm0FUOO71d98A==
X-CSE-MsgGUID: SwymPed2SdGEfdtTsHb/KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="53450306"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="53450306"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 22:36:27 -0800
X-CSE-ConnectionGUID: QvewkjqqSBGtdy8me1pxTQ==
X-CSE-MsgGUID: edJTLwasRWGOdJilwlFwAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="222822829"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2025 22:36:27 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMhEO-0000000022D-3an8
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 06:36:24 +0000
Date: Sat, 22 Nov 2025 07:35:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Eslam-Khafagy/HID-memory-leak-in-dualshock4_get_calibration_data/20251116-102918
 1/1] checkpatch: ERROR:SPACING: space required before the open parenthesis
 '('
Message-ID: <202511220736.l19FvK9l-lkp@intel.com>
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
TO: Eslam Khafagy <eslam.medhat1993@gmail.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eslam-Khafagy/HID-memory-leak-in-dualshock4_get_calibration_data/20251116-102918
head:   fec234008044758a0779e0976300a472435e850a
commit: fec234008044758a0779e0976300a472435e850a [1/1] HID: memory leak in dualshock4_get_calibration_data
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511220736.l19FvK9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220736.l19FvK9l-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#41: FILE: drivers/hid/hid-playstation.c:2042:
+	if(buf)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

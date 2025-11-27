Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CFF238D5A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 04:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764218857; cv=none; b=kh1d/iqFgsjb42jTkWm3o87kyylETprkHK5ti1ltfQEERb9dX0j+VWZrfH1zk/f+fXGSb9ZVQbwenxfWikHDu2Ij69gcP++etV7PM5YqsqyZ21IsQaUVBwCwnEi9VrOThLRvERsEq/5I0b39pngJdDwpFiD2CUQaaQjYGK0fjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764218857; c=relaxed/simple;
	bh=szO0uQv0Lr4I7Idhb7BCjThRRV5v8HE+ZftrhU9GCFI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BEl7sPSdDD51QbgBOW/0OO+5uHYulhJwzrC2QBamF5QPUfjSV4bWK6/cVRYskomxTKIur08EkvSDaVH377V7HE8kO88bTaZvTLa1fwtKjKKGlPAcQ6DsUD8yxassQGB3yf17mrGZrSv9nvdT2AiJvPbxuMU/oMbQtOJq+xJcrAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYL+TSCT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYL+TSCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764218856; x=1795754856;
  h=date:from:to:subject:message-id:mime-version;
  bh=szO0uQv0Lr4I7Idhb7BCjThRRV5v8HE+ZftrhU9GCFI=;
  b=XYL+TSCTo6gMsrdjaf+TPFVzycSTo7DHeCCD4NZE2sBCX+pUcVgp5NJn
   DLMyJytiplu6PzInkaos9Xprp08LYyMVpn7+eJDR38Fh4lBLYanfB4lMM
   y4kE75b85QbqAMKtyuufKrknoo/up1aO0q3K77ALqAl1lQ9vCiD3GQFUI
   1nCZTnfDw9UzGu9+Elj0uA9Dk6Oze/5Tp1fD89Njgyh75GSr7xSo5RoTW
   5vKlVfg6ILKv1GmiDeDV6wOpDrE2vAMh5/rJ/m7EVr+YABPc5fAQ9ysMJ
   5maQ+BQgyi5sMJW8CIoIvBDwZqaw5hVt768jtVPMC5AUTx+t/SAPPP154
   A==;
X-CSE-ConnectionGUID: BV87VAmKSsGCwQUpRLmIYg==
X-CSE-MsgGUID: UrKn6FfJRZ+9NlUp9GfFxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65973125"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="65973125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 20:47:35 -0800
X-CSE-ConnectionGUID: 7g0Q5FbCSL6mdQ0UoACCrg==
X-CSE-MsgGUID: xlCix0aARmafwFET1jS8qA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Nov 2025 20:47:34 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOTum-000000001cF-13xO
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 04:47:32 +0000
Date: Thu, 27 Nov 2025 05:47:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next 8/46] checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block
 comments should align the * on each line
Message-ID: <202511270513.0f4RiRbB-lkp@intel.com>
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
TO: Ivan Lipski <ivan.lipski@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   5427e32fa3a0ba9a016db83877851ed277b065fb
commit: c918e75e1ed95be76f8e3156a411188f650fe03f [8/46] drm/amd/display: Add an HPD filter for HDMI
:::::: branch date: 12 hours ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270513.0f4RiRbB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#123: FILE: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:3996:
+			/*
+			* Sinks match - this was a spontaneous HDMI HPD toggle.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

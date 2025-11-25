Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBA0CA5A
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 13:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078405; cv=none; b=YI267lGGGFoXZ4pTlAGXklHDC7TFT6SLgSqQUDV0ueI/G0ubkLsV9IpmW1lYl/0lq947YddH0bcSbpXzQTXgQHe16Y4bQHa07soLg3DnPLDw36oaUrJkPWbCsHKAUUxYUVO3HhwCBSn28D3oobeAMqt0WT4++kfpJTOFmg0Ul1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078405; c=relaxed/simple;
	bh=4OsMVq57nIjMuew+4DHy66FNAlONDnhhHbybo0/85bw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbnaF4RRrj9+Wq/5iqH4Qz/JCLpZmH0zqR9tMrAGwlaE1pj8rzYNxzlcfm+0IuuYvI2fMsjG1g5gAp+nfMtC8Tz7iSTaKzShrUJZwHJCoh6pl1Rosfm87s7NJKiB70neI0nGwU+9amSFI5j1NBoiP3OabB+H3YD3yUbjKtCv/l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCw0eJSM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCw0eJSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764078403; x=1795614403;
  h=date:from:to:subject:message-id:mime-version;
  bh=4OsMVq57nIjMuew+4DHy66FNAlONDnhhHbybo0/85bw=;
  b=dCw0eJSM/XUYZdQZbyAkQD4zFW1Nhw1aIbKW+HmO6V60OuqL3B1w+mIT
   h1RozUKuKADrHslCrDPHeseZK3dW5WZt+9kRjZzLTKZHcIoBlkrhFgv/8
   0nNQ0TB7bxS/z/ARIOZar14ddg57d0u/FP8fAEPYCVIJGibsMcrzUlOkn
   FzTZz227/BcknCHuyhozA4CFrBmSiHXnVWUS8YH1xUFG9sYYSYT8/VCNS
   2SBOhaaLKuJd71BkyjHmMhuK2ZfmCyp21uVTFMvAvxhMEBCJ1mgL00vIH
   CbRJ+xiJVAK9km2ZRA5e8RnAKhPHd1ORbDJHAhiZC9bPuCuETakJGk3iJ
   Q==;
X-CSE-ConnectionGUID: XKMmY/KGQe2gH0M8Cp9ECw==
X-CSE-MsgGUID: 5uYKdKnpTqOLp4AP6MDalQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66042257"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="66042257"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:46:43 -0800
X-CSE-ConnectionGUID: /pdwzUovS7GTenjIzhEbrQ==
X-CSE-MsgGUID: bOirqAbSSi+fptbv8ybGYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="197576161"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 25 Nov 2025 05:46:42 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNtNQ-000000000Vx-1r2A
	for oe-kbuild@lists.linux.dev;
	Tue, 25 Nov 2025 13:46:40 +0000
Date: Tue, 25 Nov 2025 14:46:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Davidlohr-Bueso/gpu-drm-Use-local-kmap-in-drm_clflush_page/20251117-233222
 1/1] checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'to'
Message-ID: <202511251438.PQB52pVG-lkp@intel.com>
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
TO: Davidlohr Bueso <dave@stgolabs.net>

tree:   https://github.com/intel-lab-lkp/linux/commits/Davidlohr-Bueso/gpu-drm-Use-local-kmap-in-drm_clflush_page/20251117-233222
head:   c85538a462072e37f07fcf7b07016cce01a615f0
commit: c85538a462072e37f07fcf7b07016cce01a615f0 [1/1] gpu/drm: Use local kmap in drm_clflush_page()
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511251438.PQB52pVG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#11: 
is planned to to be removed[1].

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

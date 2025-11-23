Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F968824BD
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 05:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763877231; cv=none; b=e5UY7wbKzrrwI/h9KdQ6SE01FdKI1wOh/UwisW9COD0e8NMRfZjKI/NE2oROW5wyRVpMTazO1ZOmu06MrrAfq00zKlNvQMIXz5uA/kEcdxkbmqTiZFfa6cU9hdcLhsaY5tBSHSBXLiv+qTOTCXzP9PUDvhJgsrcARUGTKP5aFRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763877231; c=relaxed/simple;
	bh=rsvTA1Er9EGjy2Uf9azazbkH8+FRewVxoldqCUlklsY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6kj5knZGGhswI4UtJaGatZ1cSay360BoCH8hiYWOD5gTeUIF4qaH3BEd+3CNsYy3USTuJY3zSp7lp6MIODKLdinKF0bwaGaUvRkBwpPGf85gDl6BFbearvScuedk4rIVsYv2e0tpZC/p7+6UemAVRUaU6gDzM44PJ95GnQQBgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPfdvTuK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPfdvTuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763877229; x=1795413229;
  h=date:from:to:subject:message-id:mime-version;
  bh=rsvTA1Er9EGjy2Uf9azazbkH8+FRewVxoldqCUlklsY=;
  b=hPfdvTuKCUS6n1BdB7MBxGnS3ggIp4PVgFXmhx2zYQLrP9TRc9vQyKuf
   A035X5V1+W2Ls7Kig0Rp+vf+6T7ClJJb9CMMdu/MEfPXf51zU+I1Xbbwi
   pz5zLTFdUOf4fTbSzisrSVlKi9RKipeRVNWhB0oC8jkNYiYfyLp+OHDYm
   XdQ4Lp5MPCa4yE/CwAKuHwjcyUzirU5RoemxvqlfA9w93PIMWJ7KEwAFV
   pkeZljtgAq3e25H2wa+ztP/IL0isUZ47iO98mxpwideVOcoRe4q+fXLbQ
   cKBL7RReNRMnUjcFfdcLH6K2reITaLNrXi/B2gCTf9G4tfG4HfLSFIkny
   Q==;
X-CSE-ConnectionGUID: /xc65kKjRDe2LPr2wJdCyg==
X-CSE-MsgGUID: aYdMzPgdQ5WmdVx+POAwjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65805998"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="65805998"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 21:53:47 -0800
X-CSE-ConnectionGUID: ua8DHZQdS3KZtcLti7q8tw==
X-CSE-MsgGUID: 39tpss/JShCcBFbivulXWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="192820169"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 21:53:47 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vN32f-000000002Kh-0lXL
	for oe-kbuild@lists.linux.dev;
	Sun, 23 Nov 2025 05:53:45 +0000
Date: Sun, 23 Nov 2025 06:53:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-17-x5h-ironhide 18/39]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'we'
Message-ID: <202511230633.KlydpJaR-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-17-x5h-ironhide
head:   dc3fa69f59ac8939059ff00c75f9eaa967708c3b
commit: 021560de8730acb32a37cbedf307dde71e4d1d4d [18/39] LTS: move commits mentioned in previous 'ignored' to the recent one
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251123/202511230633.KlydpJaR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'we'
#95: FILE: renesas-lts/ignored:78:
+# on its own. It is now easier to do so as we we have landed the V4L2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

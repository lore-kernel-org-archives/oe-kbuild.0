Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10EC8F0
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 04:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767931520; cv=none; b=J3TFXPRXOalvAsNRG6ExGYUffM5x5SpHl1EtPNT4tJbNUm5d1wozloOa+sWJhAzaXhJmPBqsEo52avdXDo1YH8B5d8hx+uLxutPnv+kmHfpdDCSEOP7UcN5MWC5EaWulJB29Foi0SKALO59F2z0QTmbSRKWWHK0YNtwIM8msa4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767931520; c=relaxed/simple;
	bh=0vH0oJxmqdFvNXpNgju2P1Qq3RfKmJSV6o9hHMHJGuo=;
	h=Date:From:To:Subject:Message-ID; b=D8069+vN222fuESNSfxtt7BO7fRdbnijGB1XB0Gz8ME/uYchsP0+PgAi9WKAKyqsOSqr7wNIjT+myETDYkZE3Wq1KDUaZtEHVyMx3RbQfLDrAYmC2GR7tnCBa7DPpZy9JabwnjPa3+OhGdtBVqPMilqxkxU+YYdhNWD/cNwFOC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/Dw8WkP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/Dw8WkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767931519; x=1799467519;
  h=date:from:to:subject:message-id;
  bh=0vH0oJxmqdFvNXpNgju2P1Qq3RfKmJSV6o9hHMHJGuo=;
  b=c/Dw8WkPqzFuqgmPIvfaKISb+yBmjI0xat0Hmmoon0x25nLbvDJRgH8J
   842h/ZMWcGF+DnSmE2jMC2FXeTRmZLmeClDEBdp7GM0tcLcr9s8cNL0Ei
   Y+AXbrBtWsfJWguf53xPPq19ASbrtk0GwmZjWGqUwK1Bj+SKK3EeJSdPi
   dK6FvopVqOe2XcRZwFgD5cj56M/F4gM0Xfm5/33Bt4HMn5WZc+NN3wT4N
   ZFXil402lcL/3Vf3U32jhYdPfW6LN+MaRsxaUR7fmkPDpC4RWeQ1Zl2nx
   m7IZhMaMtSPGJgfJ9dhP8bzQOu2+yMQPWUPBO/+7KfrCGxGpkVlYqm7Pi
   g==;
X-CSE-ConnectionGUID: aXDkPIqiSvSnGakHwqOaLQ==
X-CSE-MsgGUID: vJYrAHmsR3eSnUQVVROeAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="91976345"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="91976345"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 20:05:19 -0800
X-CSE-ConnectionGUID: eKHI2o1PSVaDj8p3qRZ4Yg==
X-CSE-MsgGUID: pxqHjEroTV+EQiHRXVUVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="204205913"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2026 20:05:18 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve3kR-000000001xo-2vZj
	for oe-kbuild@lists.linux.dev;
	Fri, 09 Jan 2026 04:05:15 +0000
Date: Fri, 09 Jan 2026 05:04:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [broonie-ci:media-synopsys-hdmirx-fix-gpio-cansleep 1/2]
 checkpatch: WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,', should be: 'Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>'
Message-ID: <202601090509.R112pY1T-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git media-synopsys-hdmirx-fix-gpio-cansleep
head:   492c1031d0bb85e347222cf5e167c84eb91b4fc0
commit: 356557528dda4e9f994dc3fbbeafe92e5cecf578 [1/2] EDITME: cover title for media-synopsys-hdmirx-fix-gpio-cansleep
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260109/202601090509.R112pY1T-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,', should be: 'Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>'
#27: 
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Heiko Stuebner <heiko@sntech.de>,', should be: 'Heiko Stuebner <heiko@sntech.de>'
#28: 
Cc: Heiko Stuebner <heiko@sntech.de>,

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Marek Szyprowski <m.szyprowski@samsung.com>,', should be: 'Marek Szyprowski <m.szyprowski@samsung.com>'
#29: 
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

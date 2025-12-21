Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E971FF7B3
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 16:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766333050; cv=none; b=j1TeUQwVZ0qgYSOg7hGs/CZjVuAQHHrRCOxgR4hfmbV4UKK0fErFk8s/mEm69VcU0aKjmshQsrXgksBN9z6xELSQKpXJSJEcXbV8rkfJDB65VpdraqTW+lKiLkjeLxbd/KenuFa0pMj87E2nfxupNHM9F2mV708W8CqKR/W+ZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766333050; c=relaxed/simple;
	bh=V0P3P4kq9q92OUdBiExobhxQvT69giX3vy+uieP1Z0U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILsYuRgidRxWTLrvoh75hT3gXmQf2SuGuGibWIKqVbI39IugZqBvHwjpnkQAK12wZn3wm0Ki1Ab+LML2tzHQpb9piMbYlhV1zbUbOH4NQqcecE+qyA0914h8FY4Gtcld+jUtN+39lpOzXopHEr8hn0Y5xR7zD1wVpbmgoJC7TCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iwhpudfk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwhpudfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766333049; x=1797869049;
  h=date:from:to:subject:message-id:mime-version;
  bh=V0P3P4kq9q92OUdBiExobhxQvT69giX3vy+uieP1Z0U=;
  b=iwhpudfkON7b6bZ9i1AHxPuGzbulALsg5hKRFvTVxg71z61cOCUQlzDB
   mdDjwHk8Q2Liyr9GvZwZJTrubTiVjWOV9jfjC9D+rdXLzTYEgrcytZC7b
   Gq+WFx1BFfCClzIBRai12FV7H6KoigkJE1ndxd/MRpg9bDbTCaIF0qWgW
   AsdfKOIIbaMCek78a2DHH5jxV+ZXxTusCyJc2cSAnSSzdXT6R3ZCwl9NF
   gSuS55zmYs47vMJRvU5hyG54Q3XbWo9L/rHVDlalqk9enEZaAz6QmMv2Q
   v/ErCtsPjc5WFxO11HSLK56H4YZ6AqTCLvTtrf7mn0h8IXJgMyWXDgQ9/
   Q==;
X-CSE-ConnectionGUID: Nq5htWUBTo+2rksJ3YZT1A==
X-CSE-MsgGUID: qGhnFgVZTnK/nHIhJa+trA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68363946"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68363946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:04:05 -0800
X-CSE-ConnectionGUID: p2vUsWPhQRiPxRn5byoJDw==
X-CSE-MsgGUID: xZKSDNEaQHit9P2Ipoh1Ug==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 08:04:04 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLuc-000000005A0-0eM8
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 16:04:02 +0000
Date: Sun, 21 Dec 2025 17:03:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 5/125] checkpatch:
 WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute
 nominal patch author 'Hector Martin <marcan@marcan.st>'
Message-ID: <202512211758.JRVQ5UNQ-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   4efff51e5abb86055ae7cd906a51f24d000b87fd
commit: 44766346d2b5622ec8b2f512508edbc1e9c5901c [5/125] arm64: dts: apple: t8103: Add Apple Type-C PHY and dwc3
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211758.JRVQ5UNQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Hector Martin <marcan@marcan.st>'
#9: 
Co-developed-by: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

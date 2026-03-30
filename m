Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B530171C
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864890; cv=none; b=ZWPi2rhxqyQc2aoCyCxaRgmXI1yVCktopiwM+ryQalrVJUO8s904nOcm9W7moWUJu2snRg5vURJf6b7HXsaEQrlTijm95UgxlHDYVblYfrCmuc6Sqtd4y211upj4/niH33WCmSo457H+6Lx4XlCPEr92XDH5V9NhlRVXvDzW8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864890; c=relaxed/simple;
	bh=LktNk9bCs7HdD1YBUbJSGxMSlIK5WTzxj2Bg/DM3sHs=;
	h=Date:From:To:Subject:Message-ID; b=etWBPvgB464d89RWU3qLbd+obg5vdbra686K1w3FD+un8AVD3rviB79dJDwxU8o2JrIKqJt6GhIBFhfuRmRxa6SwQQ3tNjQadO9/RUiQjYNhX6igIcF6D0c1XdMgKIt9EqsP4TNc3okPwNrnV7Du7AFNpHh6FBAFeE23zzJer5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmSU0Nil; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmSU0Nil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774864888; x=1806400888;
  h=date:from:to:subject:message-id;
  bh=LktNk9bCs7HdD1YBUbJSGxMSlIK5WTzxj2Bg/DM3sHs=;
  b=KmSU0NilJvfpAKY2PVftbqdgWQygbIkCgATeP2sC1Pfnu2gsIyzEv+5Q
   Mfht2Y/goH4ISUOXTf1y26w1z5ZEP1tD0fuHYMb0Jw/JyQX34+KN3PRTL
   QKd8Xw/Y5/9Hc8BgGGIFl53HelqXyl/qMnyoxIK0IHSCvkqOlM9UYD8d5
   Y2qquNLNzq3PJG9CXiwpPeRTE4lxcTsMabantuxR7YuSF730kb7bDm07j
   iNdGVRWhAtw3ALwNq6N2+toZBhA3GPTeHhZbJSDj5pnn+mDBlwyyO6kRG
   bHKZTibbECtusYAFzaWaQcY353lYyQSiBgSHG9FqkeDujXTiVrL8V76S3
   A==;
X-CSE-ConnectionGUID: tQCM9TXMT5SeMgMb+S8WOw==
X-CSE-MsgGUID: 68BMJmG7TFub2bD100cYdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="93435009"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="93435009"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:01:27 -0700
X-CSE-ConnectionGUID: FtnoxTykRx6eNovg/jGzKA==
X-CSE-MsgGUID: cxn2L3KgSoW4wPTFx4jGEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="263948435"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Mar 2026 03:01:26 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w79Qy-0000000085L-0uXo
	for oe-kbuild@lists.linux.dev;
	Mon, 30 Mar 2026 10:01:24 +0000
Date: Mon, 30 Mar 2026 12:00:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tip:x86/platform 1/1] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'very'
Message-ID: <202603301108.M23EZgmg-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/platform
head:   8b793a92d862c89055daa97ffa61a6929cf732f9
commit: 8b793a92d862c89055daa97ffa61a6929cf732f9 [1/1] x86/cpu: Remove M486/M486SX/ELAN support
:::::: branch date: 16 minutes ago
:::::: commit date: 16 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260330/202603301108.M23EZgmg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'very'
#7: 
facilities on x86-32 to support ancient 32-bit CPUs that very very few

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

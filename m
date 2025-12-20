Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC1B2DE70B
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195915; cv=none; b=gUupy4eWO5uH7VJFeRGAwR4Lbg7ltTMjTXuoe2N1LegWeHJtv7G2h9C0QxDJbXgbX6P2oQo/nbF+reO+c5oXp4/Uk6SO6sjjuNDKvWUBNWmJCCyjHB3al+uKfbyLccRO3KyfIjLSq3wJcc9xGGncFpsL/GNJ3GwTfVMoRvg4lXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195915; c=relaxed/simple;
	bh=4pMzKYVhz6nV2IXg0aO0fafUzN1RTo/ccOfH2hODRfc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B4YVg66H9BBw1tyJ3z2gQp1LaogGaqhhmGZ6JkYr0NH9nFZ1cfWDep4v0CrjZ1GQNsyA5VRsXRd5mFUf6vYrucnTcaO4nnx5w3MTfhFVREF+5HoBTntYb1EZtZD7vUfinNz8Syr8eKK3DIAddlm6F852cTWdP/EZwmvSRaTQb/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMnEOuQV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMnEOuQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195915; x=1797731915;
  h=date:from:to:subject:message-id:mime-version;
  bh=4pMzKYVhz6nV2IXg0aO0fafUzN1RTo/ccOfH2hODRfc=;
  b=HMnEOuQVTen+Vb4HRBkcbgP0U9twUWaXNlcrXB0NsfFhwwv85BAixl2T
   bckyK8+e3KkMwCT17VG4v6bz2ud5BdGjgkWBaA62uYKmje59Wo+Ug/sKL
   QDVlwRCMYA3Gw5ZIx/Gjhooyod2k9kF7VCIcwo789QJQidJOUb8U1ddY1
   Qrq3vMFbZFJGAR7A2XOWcmZ6ifHb1RvKhzLUTdPi8iFOQoU1OHA6JziDy
   l1Qo3N5JZdw7lHA3ldIWRfjV/DbiUAsiOZtdtB8F21JR9TBQpglfogKOL
   KpRCmCSjRnqjPgVR2kampevZ1gJvev6Di2eSXNuEICLYPu36yCUPmvGAh
   g==;
X-CSE-ConnectionGUID: MQ6Ik4s0SRir8fJLPYmf0g==
X-CSE-MsgGUID: 4HBMVAw+RquVDvVcYB/Smw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79274112"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="79274112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:58:33 -0800
X-CSE-ConnectionGUID: /X9IfRdSQiuGykf+WH2UNQ==
X-CSE-MsgGUID: YbKyLeU6RtOqJCcTOldzew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="230031903"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 19 Dec 2025 17:58:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWmEo-000000004Ss-0c5u
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:58:30 +0000
Date: Sat, 20 Dec 2025 02:57:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 81/82] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202512200223.brtNYNTe-lkp@intel.com>
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
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: ee68a99e21cc80f34cb403ee5c18d64e0731046f [81/82] irqchip/gic-v5: Enable direct injection in ITS
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200223.brtNYNTe-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#160: FILE: drivers/irqchip/irq-gic-v5-its.c:853:
+		/*
+		* Once we are done direct injecting, it is vital that we restore

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

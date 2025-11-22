Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136601B81CA
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817697; cv=none; b=oTL7sAqnBUFQDyXGIFDIn4kQR1JjUpeo6aou5LPbO9acXySxF14z1NOHgt7kV8C+XN5VOftwmES6eZ/uUZeXqW4Suo0kruqJukJTJxDqN4QON6rusPkrsYr7OKvDyLP43nTCwPXlHNFu1WAnVwy8s+e1LvfQ71GXv0M+MldjB9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817697; c=relaxed/simple;
	bh=1KkqGIJj1mPYgBS6ID8FLdd51BdYQx9dPoPplFLXI/0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iygbgX32UAZX68wK1ijwgG3kV0Ug39hFvliHhnz8kwp5tn78mdk+10GGjFSQNMqts5elcScb0fnd6MyAVQ7uFTp3fgKhhm8PcZ4DSJMXB+e8dkFldW/2TVCDZc6LdeIF8AxTTCqZO5d6Gniei5xOKhNh05xRazYJMyiXDy3EVvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyGy5lTT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyGy5lTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763817696; x=1795353696;
  h=date:from:to:subject:message-id:mime-version;
  bh=1KkqGIJj1mPYgBS6ID8FLdd51BdYQx9dPoPplFLXI/0=;
  b=HyGy5lTTgZqG1zGmpOgy6wnsT6FTlu8lLB0sT9RQv7JUOEnjpDskJjnZ
   gjxqeQmDgnzCbCPGljMt/xHkCxtUWoPdiC6Qf+znFBWt2/+4BIWfi9j63
   5g5A3UIQG/j/W33AV2ZL0XAOhN05aaILjDEEtCIf4o+H3HMZEQDcv0vgp
   x1dy0G8yCw3HWcwZfHqQrJoQ+D6HlPyUrFUYIVPsqGd4DCHzRPdKmAGUt
   IJu0uALKTQAHffr/YMDuQeawvbVc6ikSnofYQaLgwcXdNVMxHBKMboml6
   +WVOWpaUcxVJxS4DNvc4TlciGY5BGHOfgIbqx4BGXxQjqIgvklKd7e2cf
   g==;
X-CSE-ConnectionGUID: /5RCrzsYTsiyDfMD6cErgw==
X-CSE-MsgGUID: YLUPnXqIQL2HWx9MDzq9zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65931893"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65931893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:21:36 -0800
X-CSE-ConnectionGUID: 1robHrY3Q/6i4dqrnldLNw==
X-CSE-MsgGUID: raSkHYd7RXSZakyYoFah4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222871892"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2025 05:21:35 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMnYS-000000002AN-4A5o
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 13:21:32 +0000
Date: Sat, 22 Nov 2025 14:21:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-jumbo 111/124] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202511221410.lVBbVCRa-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-jumbo
head:   75dad9228908d3efbf1d989ac0a93cc0a7ef84de
commit: 6cb262c96bdceb0e6762d52adc2d7eac383010ea [111/124] arm64: dts: mediatek: mt7987: Add Bananapi-R4 Lite
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511221410.lVBbVCRa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221410.lVBbVCRa-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1686: FILE: arch/arm64/boot/dts/mediatek/mt7987a.dtsi:363:
+			/*
+			* - pwm0 1  : PWM0@PIN13

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

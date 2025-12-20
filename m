Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AA29E11B
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 01:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766195735; cv=none; b=ebADNiVPwPxDGd8gkARdRRO/k1EnRRIWdBNcFFApyj/4u7kfMQPxX7oX6NKWYuPgFyv0e/0woJmOrSyM7w0SFxUFTrlvrM4hoV8L5q/dQ/DB2PtzZSP91O12Q+o+wDv7zMMRXHYKQRaxeym+w3f6HfdCMn9Jei0XTTrLXHlEXOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766195735; c=relaxed/simple;
	bh=PtJp+lfP0u+BHFVZifjQoCa0N7dv/agPahgqqOCwjfw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DW90IPJmYpgT7sabKeht6pveTHN51gOYjcawUznL79eIrirSJUYp2TCQA8shWvhldZO2IFwhMB44fyUJ16nWKTeBxvyQRtdICIiHBnI2Xz0ieiMYtaUFG1cO9AmHez3/w0PqQlhKdUJkkx1rCvmrsWpH0v1Csdd69EitQXFAWLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHnb4L8P; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHnb4L8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766195733; x=1797731733;
  h=date:from:to:subject:message-id:mime-version;
  bh=PtJp+lfP0u+BHFVZifjQoCa0N7dv/agPahgqqOCwjfw=;
  b=EHnb4L8PzPxAdkCL5oxZTMX4l3JqQ4ey10a8u9UYfa0X9JTzk0uzpIlQ
   ODnoj63a6zlL+rA6GnJp209W3MGGSsN1unPsxg56Jg+b/i81d/+VtCagS
   dTdfvACu0MX9ujpLIr8bJ10rM0OglCWgYZw5W01dmaCDGBLtzFXOrKaBp
   XdZPUkmL2y6InAuLLqBYxumey0q6vura8wt/tUZQJcblLokuykeAxfKJA
   0HHpt58TXRW5YziQa/WeA8OTQXegdZfaHLaQ3hiHkXTUk1UXjstLxJP7+
   /I2u9K+difKAe+Kmf7ITLTHjD6vLqF1Cl57TvpfjlI5FZMvKRp8zflDlZ
   g==;
X-CSE-ConnectionGUID: Y8iPW3GPTpeiiymTY7aodg==
X-CSE-MsgGUID: FsmlN5PmRruiO8wAM2eeKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="71788947"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="71788947"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 17:55:32 -0800
X-CSE-ConnectionGUID: QI81MPRrSBSFqpaAopc95A==
X-CSE-MsgGUID: oKdc5+TySvq5g9Kp1Ev3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198593636"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 19 Dec 2025 17:55:31 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWmBt-000000004S0-2VLV
	for oe-kbuild@lists.linux.dev;
	Sat, 20 Dec 2025 01:55:29 +0000
Date: Sat, 20 Dec 2025 02:54:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/gicv5-full 59/82] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202512200219.a53NsnrX-lkp@intel.com>
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
commit: e19948af6683f38c4f8634a3ee7e30347e481aa9 [59/82] KVM: arm64: gic-v5: Add GICv5 IRS IODEV
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512200219.a53NsnrX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#411: FILE: arch/arm64/kvm/vgic/vgic-irs-v5.c:376:
+		 * default.)
+		*/

ERROR:SPACING: space required before the open parenthesis '('
#431: FILE: arch/arm64/kvm/vgic/vgic-irs-v5.c:396:
+		if(FIELD_GET(GICV5_IRS_SPI_RESAMPLER_RESAMPLE, val))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

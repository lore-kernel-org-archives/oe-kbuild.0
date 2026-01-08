Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02E043C06E
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864380; cv=none; b=h4Gorf7+d3gZdeuBNF/kSPK62MKSPemIIw4+Q14p36MOPCZw09NjUs/2bS0kvFi2/zt99jY+xGoJ9JBtjmmSszcWJctEapkYGzia0/tsCHmHQv37gPWSOIt82+7teGK44LI8V0KWG2y1hItb0HVB1EVwoSADx2/X9m8oRckBuJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864380; c=relaxed/simple;
	bh=NjWLSullGEORlTFrGv5mtt/wpdsPFQHA1xPaE8tQNyE=;
	h=Date:From:To:Subject:Message-ID; b=VWpaJEOMtcLVpQAmrCXnSsO8+Vw/Xocy0lBiRXEPd8glRwS872FN4xe/+5D7FVrCV4reqwI4huZ0tfvQ/7enflN9lJn2DduA0sHNxwE8QU9ekCbA3VCJZrqZojyeBTBWAGja/rl7cjjtgsWtS4GLykoyzi1zivuhMxTRgm4zowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FH4VgYaG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FH4VgYaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767864373; x=1799400373;
  h=date:from:to:subject:message-id;
  bh=NjWLSullGEORlTFrGv5mtt/wpdsPFQHA1xPaE8tQNyE=;
  b=FH4VgYaGXzuX/a8eOYOJyxvsiHT65+Pblhm7U1vhPZ1Br1GEqKisz2ZL
   VgsRdNVqS6zr2B/v2toVcZRYw09TtP4Po+r6ZpZOO3XNVX+7rKpu6QSlc
   tS/vfOYftMxlDdZNYxb+G7DrXozkk+Dt+nQ4kjtTv6vDT81S/zUFrB+yE
   ReRiBpdogiCXyQekAopc+TJYk85lMm/TGpbu5opUKSmlk+9oAaSY3vpMI
   Xi+2oheKaoUCZ+MxvDr1E4sr/bEAx7w//OVJe4vkN4TiqcW2g+CeqsS23
   zXqZaAOlGA96UPQUtlBa1tR2MhwZXQitVb4P8dmijY5Vt7+bFf3+f4KHe
   Q==;
X-CSE-ConnectionGUID: 0BVKTsC0SqCIn2MeRq9ZBg==
X-CSE-MsgGUID: 1AxxQun2TvO9SsqokG8nOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68244429"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="68244429"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 01:26:08 -0800
X-CSE-ConnectionGUID: y/HCnYkCQ6WGK973N9VofA==
X-CSE-MsgGUID: GFWtCmuYT6u0FH8CEG8CcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="234316547"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jan 2026 01:26:07 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdmHN-000000001kG-0IoF
	for oe-kbuild@lists.linux.dev;
	Thu, 08 Jan 2026 09:26:05 +0000
Date: Thu, 08 Jan 2026 10:25:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [iwlwifi-next:nan 19/46] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202601081043.jF398kfP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Benjamin Berg <benjamin.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan
head:   ef17da8fe0ae228176b066e096126a5ea77fe979
commit: 9c57963e7dce8c90ab4345f06387c795a4eb1b83 [19/46] wifi: mac80211_hwsim: implement NAN synchronization
:::::: branch date: 80 minutes ago
:::::: commit date: 80 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260108/202601081043.jF398kfP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#211: FILE: drivers/net/wireless/virtual/mac80211_hwsim_nan.c:131:
+		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

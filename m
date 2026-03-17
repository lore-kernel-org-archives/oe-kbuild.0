Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B202392818
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786003; cv=none; b=fgvlZFh54+ZUtqvunX/eVlbfv/1oZj+iiL7sof0IgkF14QJ3R6P/KG0QFJE2wibzYsfEdE3aJCPFFTi/ccg6ZMuU5jXrpfzkUU5W6TS9L1s61GEOmCxeHhxqsBrQVvI3nquYPYc+amDqDmilTBcUfdfbKGp1Z2SOyt28/R1qMXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786003; c=relaxed/simple;
	bh=cqPLRGCbgkaH88TTB+GGb8zPBPKQpJFrbZKk3VrSbpQ=;
	h=Date:From:To:Subject:Message-ID; b=bcP1F7mIIwGPTtc4O1/nPzotKn9fR7BsEVBDt7j+TaTR8cp4DEUp2YtAEgOkQT37fvAU6pFMUxAVQTDuXYXwK3PO6GZr4sVEAEx1UKGLgJd6+9YAJGd2YEYyDE7L1olwEncYEv56Ev2qH8cekCLCMhsMN0BJzm8aKlKblSVTJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLcgu3ES; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLcgu3ES"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773786003; x=1805322003;
  h=date:from:to:subject:message-id;
  bh=cqPLRGCbgkaH88TTB+GGb8zPBPKQpJFrbZKk3VrSbpQ=;
  b=kLcgu3ESzmUsSctvQ776NqPi7rViWhrO2h0eJkyqr4lYObK07Rl4F99t
   hwkr5g8VOIwlaoqhJV510HmsSpPItRMXSpFWg4GE3p+D+fFTGXfoqhIPt
   TuExjT5HcAhOz2RdFkhEAHyG+GDB2l77ct/vtwLyk/pfdzqaT4XLGiB9E
   FRFSZIscratcnjigOOC4DMrMM9f1WIFBSuXqwmCUjLTcx0eYm/sBUTti9
   tVtc6SwvV/SAag0KK/C9z1euiYA5BPCi65zXD9kCJoJYAwRaWh9mj9RjL
   hRA94Ha+DXfBd8jd25o40F4YSAXES3Cl1SMm0q8Qlpxn/x1E7pF98XkTR
   A==;
X-CSE-ConnectionGUID: 6vc04mqMTHCz4Vn7MmPnnQ==
X-CSE-MsgGUID: L+moBfVgTU+FPwFWhHqjRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100294464"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="100294464"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:20:02 -0700
X-CSE-ConnectionGUID: H28lN+4JQxeQzLQTbQKJ3A==
X-CSE-MsgGUID: hd6+B2ghTaCyGNvG5FGQ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="218493517"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2026 15:20:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2clb-000000004Wn-2Ltb
	for oe-kbuild@lists.linux.dev;
	Tue, 17 Mar 2026 22:19:59 +0000
Date: Tue, 17 Mar 2026 23:18:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [iwlwifi-next:nan_mac80211_phase2 29/57] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202603172321.8vSKL3yd-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan_mac80211_phase2
head:   2d6c6fa9647943d4c8ff3d8a6f82c00ea1edd2f4
commit: a0dd4bfa4800e14f647059782ce449be58ec4883 [29/57] wifi: mac80211_hwsim: implement NAN synchronization
:::::: branch date: 38 minutes ago
:::::: commit date: 38 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260317/202603172321.8vSKL3yd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#211: FILE: drivers/net/wireless/virtual/mac80211_hwsim_nan.c:131:
+		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

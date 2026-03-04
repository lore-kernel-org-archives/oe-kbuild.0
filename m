Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4B36BCE5
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630976; cv=none; b=JlNgCwctLR+8nCj8p5qLTWtHkMPtPfg/2oX2zkN92cte8mj+m0/CN50Jn535UVPNFaS4/Y+Tpea+Qp+mFTggPTO3j72TQRfgaQaGft3SDLnsBhf4mfafXdO+I3tM4WEnSLLTUyFFGHKrzI1UIuAsMKyu0GJM4o0UJYtVCTXLnDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630976; c=relaxed/simple;
	bh=aOtMPRpDOQYk5Fs9c2tXnpk+EAKRLSA9Ys0tuW7wZcI=;
	h=Date:From:To:Subject:Message-ID; b=OMPlu3VZmZqNIkpFW9gG0e+DIhIeFuJx9PKfk/xBzXXlf++GvXd/5k4fZNMTTehnsDQgnorc5oHdSVgWetUUh7uAcYnxNkXe7WVrFW/TLJYT9zuKd2HtR/clLx+PTQZBlfnp9jHKHqHXbcADWXl3VSEIGShOMNZfEf3wZ668u1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LONSkdmD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LONSkdmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630975; x=1804166975;
  h=date:from:to:subject:message-id;
  bh=aOtMPRpDOQYk5Fs9c2tXnpk+EAKRLSA9Ys0tuW7wZcI=;
  b=LONSkdmDRmvDw326K5oElR08fIAxe1x0jqkH0VcSIn2jquytZVYG+04J
   ySUGk9ZD4L+G3vJoqAZS/WlfZBRPfSxphVZq8lGxZEdtSPBdsny7kPvn8
   viByA/f623ezAbK+lgRI1TxN0jvndVc126lml6/i/H5cceUuLgks62+zl
   5aQ8ECor0nuj/q4i+2MQk2+xAzJSEsimHMRg4d43Wbt7aSi5zZzvAulHW
   MlC7YcdxvnGby2OKGXdVTtBCQ9PBTTPxx1fWK2HVZLzbyySw31bfJoRZI
   L0y6LEpTFBDjFo60FXBouMRSG/oYjlh4sHuHBiXrHW9mJP/KLCAqqum1S
   Q==;
X-CSE-ConnectionGUID: 7mOGI5fvQG6wukwyD2qrCQ==
X-CSE-MsgGUID: +Er/oyixQ6KKE5Va8IYbMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73816014"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73816014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:30 -0800
X-CSE-ConnectionGUID: HOEmcP4CTsuC4++pPMON2w==
X-CSE-MsgGUID: jxnber/tTHG72Wr0s38Wlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216653450"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hv-1vVN
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 8/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041413.pcNvN0rs-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

Hi Sasha,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: f94666283ea162de0fa35261319bac1da5ef74f3 [8/11] arm64: patch-scs: use shared leb128.h for DWARF CFI parsing
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041413.pcNvN0rs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#16: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

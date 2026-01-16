Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A943B3358CB
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 02:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531993; cv=none; b=a7poRpAxABDM5l1lY0cK8eFksmBNNS6m7Yc5TxRmuKFouVPSJRRDOIEMWhoW6a6Z5Eqnn2dBzJwL7lQ4sPFh1Aif9WURub0ovXskDaDPQEZ2TaMwT+/ejSmT6nQ0jI/ec23dEvz/zftRboNK5Yd9qQZqVLy7srYQJYNRDHqIVos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531993; c=relaxed/simple;
	bh=rOD+9kWujQT2h2tydh70h44c6deJyH0EQt6nxvUK/pc=;
	h=Date:From:To:Subject:Message-ID; b=Qpk8gzyyU7BV/QhTj9cdoxxGheuL/rkPfgLt1najmLnL7ma7avpNEjSNjSG2y9zW5fMEBfp+D9Nir9NgE6nAfKIMCJDCtvJRuDj/JbnOKo5JceYoXd/iujZuIeDqqiQa7oxbS+FMi8lfARomtXALgW+Cvd1elmdZe73mQqbMlRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crtu5Cwb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crtu5Cwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768531992; x=1800067992;
  h=date:from:to:subject:message-id;
  bh=rOD+9kWujQT2h2tydh70h44c6deJyH0EQt6nxvUK/pc=;
  b=crtu5CwbuVkB9ILMVCLDDVefm/53/4HfoU0Qh1hvY2TkFDmNebVuexYY
   k72UJzL/kwO9ejzym5WciSD23NRcKv5ub3Uc5yp/S+vvI+jaA/m6SJPVy
   RoRK+M7bgbC812YzNgUa4Gi1fvQAUDt2A4l9Et0SbF24aL3PQrpgoAqPa
   Vo1gjRd1mnK1ciySrFGI+xhBGJnX+ws4Q4ZzyZpCvdX4ezoyIbCZg0bzm
   g//K6MuvetABBWTGk+gtVxk//b3sjhiYoUl1B13v3849r0VH8WLBWFFUl
   2Zw1FFQm+9E4mru47tAlBPD6D54yjFtw7/vuCw5LST64wZgNY2bYNLhE5
   w==;
X-CSE-ConnectionGUID: m7LhO2oCTvCwJkc4HXjeBg==
X-CSE-MsgGUID: QLd7YMfMSdqCF+lqNCEXFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87264075"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="87264075"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 18:53:11 -0800
X-CSE-ConnectionGUID: Tld47oS0ReWJvM1VqNzZBA==
X-CSE-MsgGUID: vqy2qZIKTFq5Mp2xCePdjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205163293"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Jan 2026 18:53:10 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgZxU-000000001gz-0Bju
	for oe-kbuild@lists.linux.dev;
	Fri, 16 Jan 2026 02:53:08 +0000
Date: Fri, 16 Jan 2026 03:52:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlayton:exportfs-nfsd 1/30] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'that'
Message-ID: <202601160359.k0bljTtB-lkp@intel.com>
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
TO: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportfs-nfsd
head:   14b8f48f4053370ead8401ff650f5abe38696ce8
commit: 0d7ea3e82d1035c9bddef658d30e6b1d12950d86 [1/30] fs: require filesystems to explicitly opt-in to nfsd export support
:::::: branch date: 8 hours ago
:::::: commit date: 31 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260116/202601160359.k0bljTtB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#16: 
check in nfsd to ensure that that flag is set for any filesystem to

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

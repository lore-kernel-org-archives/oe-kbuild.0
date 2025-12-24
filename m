Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5751F0994
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 02:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766542499; cv=none; b=dPHGlIQllx9DaD44wLI6CvxEFpVcLFH0cUUiZK+RFr7GnICeV2yNHbfeafLEblIq0fE+AbJA8aKiVIrlqU+9Vy/GdfnkPcW36vhJInWY/vw5d74SRLj4zzv5HhSj0eM8JY0wYT+OrPEl16pFHaMHsTdQ+JZRksmlV5B8B6zCI1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766542499; c=relaxed/simple;
	bh=ajVGzftjdrMgo5Xq+EfXxCePI/Y//X3fVKAagOiwuYE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YFHrNdFOw1/t6/7pzzXlktqwF0mYfODveLtCdHPseIc6D7kW09xBhBCx22Ym5dYRc3nSI3VbRNK42cCRv1pSE3Gfn4Y+bJsC/uewSZbhvMbFw7+uIt9IEx9AmGl4OmC0fHwn7RuUhgPwRSQnLuPkKbQcwSEtFY7YMK8LeWc664Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0pSP9Za; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0pSP9Za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766542498; x=1798078498;
  h=date:from:to:subject:message-id:mime-version;
  bh=ajVGzftjdrMgo5Xq+EfXxCePI/Y//X3fVKAagOiwuYE=;
  b=B0pSP9Zap+E9h6GwjjgYHorKpoyu/F5uBBDAy1pM+2LY4geYQZri/2Nh
   Lm0hULNbOjlOTOpiE91FtdOWYMTQqllT9++/L4nULBkcRBfMJzns3vuSa
   PCzUEaAZHL8NOM/bNFEvQKghgvmrPSQ4lf59Upbp6rlMB/lL+iEd2Yr8H
   b9gMg48qHHjehPSQ+EeaF8/Oe4OCOJcpjsDF4ZD6xuHWeIPxXDtVDEB/F
   zT0mADayC7Q/3/FdemVRj98AkGy32dmLTSLkqHLTeb88yrT7V5eiB1Mhi
   2r1ST5PsN7rvqQOmJARcs3tFrdR8qpeuhqvIUuSU9zNwdcGUSNbOgm1Co
   A==;
X-CSE-ConnectionGUID: E5B1zVH5S9CaTlZ1ZAf9rw==
X-CSE-MsgGUID: PM1L2cJhTF6YyEYWxR1+1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68270058"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68270058"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 18:14:57 -0800
X-CSE-ConnectionGUID: 3E4KR2o3SbCe/Tvc74v80w==
X-CSE-MsgGUID: vFMAhnriR0Cqr275OZIw1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199571834"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Dec 2025 18:14:57 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYEOj-0000000065M-20EX
	for oe-kbuild@lists.linux.dev;
	Wed, 24 Dec 2025 02:14:45 +0000
Date: Wed, 24 Dec 2025 03:13:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:slf/nested_npt 13/21] checkpatch: WARNING:BAD_SIGN_OFF:
 Co-developed-by: should not be used to attribute nominal patch author 'Sean
 Christopherson <seanjc@google.com>'
Message-ID: <202512240331.U63zC8Au-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux slf/nested_npt
head:   d92a49a6c826159a40524177ff9eee7d34c4acaf
commit: a464b39918feac1e03a38bb5f540d898739364ed [13/21] KVM: selftests: Reuse virt mapping functions for nested EPTs
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251224/202512240331.U63zC8Au-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Sean Christopherson <seanjc@google.com>'
#30: 
Co-developed-by: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

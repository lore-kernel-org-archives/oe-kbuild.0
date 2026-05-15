Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71035428857
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838731; cv=none; b=c+TLneKlXXmQuxyAhQa3ZrsqXTGPYcu77za4/OCKJorSMVX8AJVn/SoNCZ4PHVOuVoc8i/gdiSRT4gpZFGY2s7JXs49kDBL7CsrCDJZm5kbjCe+N2Gh4k6MR/Xruw2v/zu0PScwIRbaU/7Yw/lGtzbVQcJDnfP7STSCkESq2lgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838731; c=relaxed/simple;
	bh=ALfQDsPKsL5ilcsVkMK0EQPTK3wgWkC4pwDRRVXL5sE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KhpL6HPhbsTxZdpncoy1MGBOd3O94HjhK0kACIw9KbFsxTZcPJMptI/djrLBb3vMbKxz7j2M7MOdqlhFIojS1jogNLu5D8/064/Izj6VONFOW1jt9OPOJ7W2G9XofAoYrCDWtwbzBq3rByA4OatWaVKUU3sPQuIBrduMSpCPOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOBZ1P6M; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOBZ1P6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778838730; x=1810374730;
  h=date:from:to:cc:subject:message-id;
  bh=ALfQDsPKsL5ilcsVkMK0EQPTK3wgWkC4pwDRRVXL5sE=;
  b=bOBZ1P6M4AhexVLF+lryYIHjYP6OF/wpRkyd+hkYd5ombUEB45ZzIEh3
   8uMYc5iXv+uupcIi3BLfIXlrIQYl+u1G0vd5ziawG1x1ZM0nDsWoWd45u
   xVOV6zDJXmuCXdg0+PTH8m8VlCQYLuFVQJU2nfW9En+R21Zb/Aro1wU5V
   PIV9Lg2dCHDaldiaEnnOzBxTo0roiTL9q9zkdeOPMVip5ZNtykpuESDxy
   v56N4XvcrZo92kicm/eM0Wlx8oHx3sE8B5qXkIx28+Nbl4+PKRdWp1Ha6
   X8IsDtLWvZ2PGmeVV9DBfzRlRpvxdQNdXTtT9BeCCYC+jh+H1xEN50097
   g==;
X-CSE-ConnectionGUID: SKCKJ/H3RB2ypvMga16TfA==
X-CSE-MsgGUID: YUoy2KxASLi94bVNaooD4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78930106"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="78930106"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:52:10 -0700
X-CSE-ConnectionGUID: VVZdqJIMRji4x/9uUX+Wew==
X-CSE-MsgGUID: rNSNhrhQTC6UsC4O6YtwxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="236015176"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2026 02:52:09 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNpDC-000000008yX-3Thc;
	Fri, 15 May 2026 09:52:06 +0000
Date: Fri, 15 May 2026 11:51:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxsecuritymodule:dev 10/13] /bin/bash: line 1:
 tools/bpf/bpftool/bpftool: No such file or directory
Message-ID: <202605151112.n0rgysdU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
CC: Paul Moore <paul@paul-moore.com>

tree:   https://github.com/LinuxSecurityModule/kernel dev
head:   5af5c2a188d5cb7770b0c17a351a96fafd2ba682
commit: b1321c6ec0d35677823dece4885649ddcc32dce1 [10/13] selftests/hornet: Add a selftest for the Hornet LSM
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260515/202605151112.n0rgysdU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151112.n0rgysdU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605151112.n0rgysdU-lkp@intel.com/

Note: the linuxsecuritymodule/dev HEAD 5af5c2a188d5cb7770b0c17a351a96fafd2ba682 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: tools/bpf/bpftool/bpftool: No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

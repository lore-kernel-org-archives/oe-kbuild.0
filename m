Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FE225A2B4
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Aug 2025 18:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754418484; cv=none; b=pc/qePl6+MA/fZ0c1redxRaPyBx3C6XBinUr3eXTeMK2m8IZKZWgmN5bAJN38VYgCHBVumHsnI3qTMmwyna6qlPW59I/k8PTe2oy+T355NYBuavYCtigNZkxClOEdZ1U05ic4510uhzzUa13akSOzvpw1vOo/Nv1cdIKayy1jzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754418484; c=relaxed/simple;
	bh=dWuqD1IFtDK0I8TeribW0d1ST07kaSuQf/kMGDfhWwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fxf9YE6L12/qD9D/nvWA/KbEpGPGSxOZXtt/Tp1nJvNpSg+2Zqnl/Uklu7iArjkVPzYqUFCZWAUbrPPwr9pGmtkeTaclkogKOFBKpJ/S+UNt2O8gYutCWYxe/+0KPDI/qtH/sjsp/QplYKTnI3cDCrFkTvFWRLe1WqTq+3C2mHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MEOaSW9D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEOaSW9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754418483; x=1785954483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWuqD1IFtDK0I8TeribW0d1ST07kaSuQf/kMGDfhWwM=;
  b=MEOaSW9DETlyRcWlCb8cdLaPXQ3lT3z3YaghZy4rrgGQIZKxkmPPDSjp
   e5oScQ7GkmcfdLDbKAnv96oIz0Zt2hdwXJh1eBTqQ6pnRCjd8UzdwXtNF
   MgHUcgRfdgHI2xMGBTLSoOm7oGi7T0uuY5gmHQnznrdq0ojuWDRjF5kGZ
   NIHzqMrHFaC70FBkAmqtzf09aw17L1l1e6bt9j1OSg+UU8DtYkYBFbPPb
   ih/W6ItROJD1lj5nxZDB6mGOW3SydAyzSBcCZczR8Ev8RAyPZXwo2Pej9
   3LWHimtP1ePPm5Qb5fDMOToD3KDNYwQY8mPi6rlGzxXJ+UxV7wfaCkgLo
   Q==;
X-CSE-ConnectionGUID: dTzSOjT5Q9O4CvtwfCmE7A==
X-CSE-MsgGUID: J0DTccUrQUG5nrqW/QP2eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="66992600"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="66992600"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 11:28:02 -0700
X-CSE-ConnectionGUID: 3WN+jUR4Q/WFXuw9OmaCAA==
X-CSE-MsgGUID: g709ZGWXSFq9juK4++lDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164929329"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Aug 2025 11:28:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujMOF-0000kK-2l;
	Tue, 05 Aug 2025 18:27:59 +0000
Date: Wed, 6 Aug 2025 02:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [masahiroy:kbuild 88/101] llvm-objcopy: error: Link field value 71
 in section .rela.plt is not a symbol table
Message-ID: <202508060243.DS48DBXg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   546c1b8315e62da1ec31e845e28fba99d0309b51
commit: 6cba15e9daa2a0714c9159a46fd021947745eea0 [88/101] kbuild: always create intermediate vmlinux.unstripped
:::::: branch date: 5 hours ago
:::::: commit date: 10 days ago
config: um-randconfig-r052-20250805 (https://download.01.org/0day-ci/archive/20250806/202508060243.DS48DBXg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060243.DS48DBXg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508060243.DS48DBXg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> llvm-objcopy: error: Link field value 71 in section .rela.plt is not a symbol table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

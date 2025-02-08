Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D219F487
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Feb 2025 06:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738995856; cv=none; b=VN7MUhMOnHo+Nwr/kbjUWqlQw7a6suZwwBWYXHrgGSJ38NpLkVMXRsm52V4DxTgXKFQYnkYLrUeWKfGqwSqkEvyOxVWkkZ2taW0jW8OHMon7wPE6b5R7BUTY3EkZQTmy910QFxZMzw2y2n+5YFvafiQ6Kb8Q/G3c+eA0s2P24Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738995856; c=relaxed/simple;
	bh=suldKt0IpcaMRj/iLIfzHGbMHAyLA/+5jgX5sdznsow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jf5VaCWm8c3KFdWrMvcnNXXyaelcgHLdbqb8lvjWa8O0Zy8Qx8zLbapphplJQPr2VWOlr7Iu8MZXAFDEfuufPF0nGBl82mCh/K6ftpjFJQMAyD1R7iEWjV5//OMuWTo/YWxnV8Ar7qBCL4OZ6B9+K0zm2YiF1am5xZ133TnjmeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1tCQvLd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1tCQvLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738995854; x=1770531854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=suldKt0IpcaMRj/iLIfzHGbMHAyLA/+5jgX5sdznsow=;
  b=Z1tCQvLdZivAjHO08/bDVJJlS90OB13mIH6qNWSK9bd7x4ALXiO55k9j
   /CucUiknGd+4E5D3SLQ4bk8lbetFysiPlnJkyLr8FAZ3p4W/+CILYVaTP
   lcNGXwOAygEJjnOPkOPCFCkJzO+2QewXanfyUdUNWdFr+Me5Q/H1Il2HX
   weuC+Jd7jcNHqrju0qBtxyqygMoU9us+Jjlo0q5sjFzTUSeCgkrefAa/m
   JcGS+bY6yioFjMpwKCdVL4H3zpZtp1uaDbt9qzFv343cNNskrseZClXNo
   HzrcVKmJ2GwzYB2OF969PUAPPa9ryomDWDJP5Hkp9MmHSKbnw84NH6Udl
   g==;
X-CSE-ConnectionGUID: 9uA45WyMRKCTOC/QW4MXFg==
X-CSE-MsgGUID: c10ahS3pRXaEcyrmf8F1pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50267899"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="50267899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 22:24:13 -0800
X-CSE-ConnectionGUID: 4ANvER2JSGiZAeKY+YDe+g==
X-CSE-MsgGUID: 4aTUivtDQBa1r3JCFZF7Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="142583765"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Feb 2025 22:24:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgeG9-000zeD-1r;
	Sat, 08 Feb 2025 06:24:09 +0000
Date: Sat, 8 Feb 2025 14:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool/core 5/9] make[3]: *** No rule to make target
 'vmlinux.o.map', needed by 'modules.builtin.ranges'.
Message-ID: <202502081422.zYFg0SOY-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/core
head:   49656589e697a593b312509ededb52d339aa0967
commit: 435f15904e62d96d0c9029e147fb9c8dfbdc11a3 [5/9] kbuild: Separate vmlinux.o linker and objtool steps
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-buildonly-randconfig-001-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081422.zYFg0SOY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081422.zYFg0SOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502081422.zYFg0SOY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'vmlinux.o.map', needed by 'modules.builtin.ranges'.
   make[3]: Target '__default' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

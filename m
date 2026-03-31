Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B73B3E95BA
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 08:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946803; cv=none; b=MV6ux9QIVNN7Ym8Eq7sDYZhlUqBCF2FSEpWKrHYPxlevnyYXMUWLkhWbCn8X8EPlfqRul9ihMWtrE5w9zjrZBPZY/ckVfTh69xe+UkD/V4DysEHY2JLaYDEYuud2W05MKXDdUkMQTOwS8r4L+T4PeUyQokxT1nG9EvMN7a9RQ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946803; c=relaxed/simple;
	bh=RtGtHr52DKRVZDY1Smbpttj+9yShUGqaJtGWkMzA768=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uJcLzkG5wUAG6ic9c9/vj2RTGk9xfkEmid1jZpkDp3A5IA36sahpRZgdJfZii7xW6P6KVVGlkV7TWxsoTPBMyQehkuePM6/+wnqUgDD3o4b11AJi/ePuJJaY/taXThEBwm93rk1s2Qbfxzr1T43dhj1WWw4jQMGVYiwW1jo4Asc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ns+untP6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ns+untP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774946803; x=1806482803;
  h=date:from:to:cc:subject:message-id;
  bh=RtGtHr52DKRVZDY1Smbpttj+9yShUGqaJtGWkMzA768=;
  b=Ns+untP67PFvA1aBEfnIZhiuWqM/BMw5jT4L9M366pXG3moZQpGwyBSy
   iSJWpzpPfyWlVstiXyDBR0ZdnbPLejCotX1hO9Snd9nI07i9Jz1jfP1Rj
   fUJyvgp0Z4upbDaVkTD9GBJVIH1/erUPvTK8KjOVxOTGDWy5qn16y0vM1
   TfqSS9+MUr19nWRUhrSeZgEeVe8/vbnq7rLZe/QaGklXuTBAWgtYjZxoY
   hI9p5Aa8i3TEJxWdRn9jiNON369ptnSS/ynHH45cBO0tYzE6MDGnK83Dd
   lO4WJjZQY2BmFOD1YgDB0z4cPrMuniQROh51FbLpWRDHz8F6RB9mrO92Z
   Q==;
X-CSE-ConnectionGUID: fwnscDnuQSmTSqMY7SbNug==
X-CSE-MsgGUID: 7AAyOSYRT2y7h5pGWKVj2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76143049"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="76143049"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:46:42 -0700
X-CSE-ConnectionGUID: YyAFNYn/R7G1fqoWQiSy0A==
X-CSE-MsgGUID: y/rBEUOfSqO+EJA6G3g6lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="221902578"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 31 Mar 2026 01:46:41 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7UkB-000000008LF-0PDe;
	Tue, 31 Mar 2026 08:46:39 +0000
Date: Tue, 31 Mar 2026 10:46:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [perf-tools-next:tmp.perf-tools-next 9/10] grep:
 tools/include/uapi/linux/fadvise.h: No such file or directory
Message-ID: <202603311011.IoMYrQLJ-lkp@intel.com>
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
TO: Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Namhyung Kim <namhyung@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   02288074fcf09dec98dcb3fefdada4ebb4a91d33
commit: 7eb9876f1d9fdb6f6a8ed5737452178ca2169205 [9/10] perf beauty: Move copy of fadvise.h from tools/include/ to tools/perf/trace/beauty/include/
:::::: branch date: 75 minutes ago
:::::: commit date: 2 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260331/202603311011.IoMYrQLJ-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311011.IoMYrQLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603311011.IoMYrQLJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
>> grep: tools/include/uapi/linux/fadvise.h: No such file or directory
     PERF_VERSION = 7.0.rc4.g7eb9876f1d9f

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

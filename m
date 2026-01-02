Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D183F9D9
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767367149; cv=none; b=DGoSuVNkY6cgngr5lqN/aQntkbdC64wcepC+8EfjngjvpuA7r4eZgXn4IGAPaCdnEalJFl6IyFcXtNLHWTcXFz9pqdvRlTEtaXgom5zbwnfcmVRe1O0qUl0xMWw6Er2Ss63FHpuLRt/IW2vWFZEPKvKwxlx/nihzexXkp3LAYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767367149; c=relaxed/simple;
	bh=+vlH+RzMOAf/GskI0/lUxPwiwQ8Cu3ivFiEe4+mf1O8=;
	h=Date:From:To:Subject:Message-ID; b=AfhZtdt+sBXK4JUtu1qGRc3ELUGIvFOHFufACWGYRrtZ1cgmxQB7SsseKGy+5qMNiIk+Z6fg2XqvlYVTHg+eqQDf6qBx+tR6GNXAg4Ta2yPAgbpUIRnPeOGpXalD9YTO71QtfgrNmpwKxyqTRR1JLYwbKh/nKE2PZ0W0AMRBpAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxCfFUj3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxCfFUj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767367148; x=1798903148;
  h=date:from:to:subject:message-id;
  bh=+vlH+RzMOAf/GskI0/lUxPwiwQ8Cu3ivFiEe4+mf1O8=;
  b=fxCfFUj370egALb50uxzJ34BaqSS6k+S3peLvHe8Xg+bis57c1+wzlmv
   awldkoeR0YlERo1evLe/2iOJQXP3L3Wtb9sipFx4a7EoNHLROqGIGsmK0
   Qj6DTdRc+6zw9DRJAFVhHqyJQUM2TwdEBX1aJDu+ZOO0N+cgN8lZnt6lJ
   N2kkvb3FSFdV7WMecYFn2RYQEsLFUAE1ME9Zhx8MhbjW4ZTrjBfuRrOg/
   pm9WIOGrtyulvGa7Vqfq8WQ1OuWPtB74PpVBHQ9L+wIX0Eq0Qsgczzew4
   G+IQ91dx0/rurSTmUorO2ytMd0aZPE8vWCogAyuf2Vx2XgFGBzyKxR6z2
   g==;
X-CSE-ConnectionGUID: /g/jx2U1REG4AiTdHb/MVQ==
X-CSE-MsgGUID: 8xSXl9DzQEqcpjMpX2vW0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68896707"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68896707"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 07:19:07 -0800
X-CSE-ConnectionGUID: oR8lrIYWSimv10wMVnA3GQ==
X-CSE-MsgGUID: orXZsNF/TFa4oAL0T+j8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="232526925"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 Jan 2026 07:19:07 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbgvg-000000000Rr-43RL
	for oe-kbuild@lists.linux.dev;
	Fri, 02 Jan 2026 15:19:04 +0000
Date: Fri, 02 Jan 2026 16:18:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-vfs:work.immutable.rootfs 3/4] checkpatch:
 ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
Message-ID: <202601021608.ADEhGfrz-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.immutable.rootfs
head:   224c5922276d1e8b19b421794288cf9e2736a42a
commit: c61616e51fb80cf58ad890e1671126a50866e59c [3/4] fs: add immutable rootfs
:::::: branch date: 42 minutes ago
:::::: commit date: 42 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260102/202601021608.ADEhGfrz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
#87: FILE: fs/namespace.c:78:
+bool immutable_rootfs = false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

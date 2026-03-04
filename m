Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48D7367F5B
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630973; cv=none; b=HG/BYlAUFanQuJ8U1f39IrUNHtZJ4hYat6XX+RuifJ1PkkOWwzWRhWL/CHBQ5+Gnon1dyMhw/gzSL5i++0Fr5tm/XsvQsOMGwvT1LITgQ1KWFBQGLNUYwSwa80LUcbPwFRAzt+l0zYnDXof8isYJcY4EQ8KlwVKhA/rLMHvUPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630973; c=relaxed/simple;
	bh=3YWZdCGcfxazJC7BFEyyDKRfd3PjyLnIxVMlxgFiOWg=;
	h=Date:From:To:Subject:Message-ID; b=J5/JxMlmnNMjBDucZPRHCwiDYvlZxGW3Mf/AfNGtsjCbZ6KR/oUsEhsG8xmHNI313lluTJRLS32mP7GAplxdYAr69ojNFs582jSkF1UYlVJychC5d6ygRUuHzFRIPCazote8OEhGzW0L0LCdfz3EN5l2Gt0I79HAgRNSvUR796w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8jsTRGz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8jsTRGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630972; x=1804166972;
  h=date:from:to:subject:message-id;
  bh=3YWZdCGcfxazJC7BFEyyDKRfd3PjyLnIxVMlxgFiOWg=;
  b=N8jsTRGz87MXjRtvECajyG599dx8EKdFQYsxfCR7sXo0vpLyxosA351P
   QtnVfLCcbPnf83zuotZTEpvYOUNCzY7LjDOuq3FR1gRow+rDMoE3zT7hk
   u91UK5RThKP1zHSEfdNK3xCXr/RsIYeiQYfMCh1HKCzchWBTyfvZJlaUo
   c5fAFqh55/XRWeyGwkhHofnpylN81AJrqSnLYlGWr2XmZdgGc8Yiz7Dfa
   lPljqDreNQWylvXbQhuaA8MxC+XxxMPpNdIdCkAUKv0FWduj3i7Q7N1lC
   egVDqBWIduoTRpT0I8EvuZaDJzExf6SJ+I1m1mKDoPtRM0s/4OLKC/3sS
   A==;
X-CSE-ConnectionGUID: fcSAmdMlTU+hHU6cMzj5Cw==
X-CSE-MsgGUID: DvKOI6AfTaWkgL7RkIdcew==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72714814"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72714814"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:29 -0800
X-CSE-ConnectionGUID: sXU7R1CzSEafa6jPaqjrSA==
X-CSE-MsgGUID: HoDmi23oR1iHf05dXPHuFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="241354905"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hg-16VW
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 3/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041409.viHTUJYX-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: b9220d9814b9791e0e3136dc32cc18657de6a872 [3/11] kallsyms: delta-compress lineinfo tables for ~2.7x size reduction
:::::: branch date: 12 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041409.viHTUJYX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#48: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

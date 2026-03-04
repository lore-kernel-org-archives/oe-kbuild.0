Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074843644A6
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630971; cv=none; b=WGb2//6VDj/IPAgQxIWP7//O5+PfLArA2gHgij2STy+1bQuKIe3Sj94+1/20xoZ4qQJIT7qIeZyGM40ZVshwD643zUmtzu8ztrmVJ96/H2/ag1RD1ZQZhDUrihThfHlXO7CuOvZEOrs5dqEc2QCNoeZ6xs9ZzN1xoNjYYJntKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630971; c=relaxed/simple;
	bh=SlTfjagPpe4DAFfgCcSpUDVCKD3bxTdfAIlkQXV4PxI=;
	h=Date:From:To:Subject:Message-ID; b=PUEIgcj+i8JPQvz4AKAWCwzVJ2DlyxEECM5Olg+pQZsTuwW8uoP3WD9ZfKnbI1oyHoLWeyg5FWCYOGKVWVVFj0i2PAcM+0QkvVlIQatWw8cZyfMn0eF3ZUXic7bn03BBQqfwtdvTk/zyNsLAc0CAUTiqP+kWsyT5qclQU743OCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvX3cSoC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvX3cSoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630970; x=1804166970;
  h=date:from:to:subject:message-id;
  bh=SlTfjagPpe4DAFfgCcSpUDVCKD3bxTdfAIlkQXV4PxI=;
  b=dvX3cSoCiVwLcIunaGaX/hRF7LuQGyAsfqe4lihpdRBssvn+ziBiKb/m
   Zpu6XChPba1T1GahbtlWFs99kamiuBNtlCFyEd50SR3dGnGXXFgGAxdgo
   yA8mnruwrr8IGz7oBIzCn+mIZbGXJtYzooITU/tRqh1TKXwiqf42Spu6/
   FNu0uWqG9P4UOd5Hllvrgz0Eg4GEiT1OJMh4VZwdMjv/A2UyMNhVVhBuV
   95nEyvHw11RaLjN9RR+uLQoF0Y/DeffNeen0NiLPBh4c5FFFxJfraLGrl
   N6+FFeOxpsCT0Cdk9KozW0XEG8xcy+RDF6+dP9i0QrVnZOFgu7PDfqNil
   A==;
X-CSE-ConnectionGUID: PfQ1ygpCT5+ObyHLj7582g==
X-CSE-MsgGUID: zEGlJEk5SQiUFet9eEOxnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72714811"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72714811"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:29 -0800
X-CSE-ConnectionGUID: jyoWscXuSE2cFH9loxHlgw==
X-CSE-MsgGUID: v1AUGyEUS9Si2vZsezBXyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="241354901"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hV-0Rrx
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 10/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041437.hdnrOZd3-lkp@intel.com>
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
commit: 364cbe51758ea61e9a98a458f6fb6be22800399d [10/11] perf: genelf_debug: use shared leb128.h for DWARF LEB128 encoding
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041437.hdnrOZd3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#18: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

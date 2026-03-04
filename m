Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F155D36AB68
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630974; cv=none; b=fqt7KeH5NjCXXPOlloaF/p5qclpkQObGO7cLwGnysNSMgYBxDtxpXjbt/le9zHtdM7WWjXdwzphFFmEQCz/MlBV6O17WbNw6x57ZeTK4TI8EmuHDTLkiAjI+WbPxxsHB844BcHl/2tWUnQHAmclYHwfYq926aNIY7X+bz/vFsZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630974; c=relaxed/simple;
	bh=wOEsSaZqphlCJzhyH+VkM8C98TTzposxwQLrzeFK8vM=;
	h=Date:From:To:Subject:Message-ID; b=U2XwHvLvxfJbVHrd2Mcb/sVqPq69Rw5l5/ujE1X5fZDafKvyK0N/FqEIUYSK8SWHu5ESOd5BVa65aznY8vF2S5Koog269fKt9H+eEIsUy3Qc7BPHUX0Q938fn4ZV3vIZVIDU/ffNt7rcwcDT/w2rKCmGG3fRzBh/11S1edXelzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+ba3wqr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+ba3wqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630973; x=1804166973;
  h=date:from:to:subject:message-id;
  bh=wOEsSaZqphlCJzhyH+VkM8C98TTzposxwQLrzeFK8vM=;
  b=n+ba3wqrfsPs4ga8JSU8IPBlp2vvu1waP0RqHfeqjVZj6EaLbVTv3b6a
   qaDaJSC4G+Wn9V3LGGa65Gvuh09r21gLCCvOjgFFHwf9Z/XZZ7Q6ljdXr
   xqae4ynE9JFHmjkFgP7bKuMna1TfYSpZ/8YhT2bP7SWbslBE2W4nVmUZ8
   arfVx+BBldHKIibTxIIdM3S2Ik2pPViPK+UW+IUl1zd7bB5SN9ANZGVGQ
   arg/LAj1gl4CW7WPsggGjq19Uigwtc+6lv/X/udRHh3obJf+PTX47TVva
   QxZKEz70SrILRoh9UgizNTTgL/khL7j1ZQw6S7UyseAYfaDwh5HXNXqX2
   w==;
X-CSE-ConnectionGUID: Qn/aof/hQMmyfP7cOSvA9w==
X-CSE-MsgGUID: IzJejXUKQGCQS9Hc1zfavg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72714815"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72714815"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:29 -0800
X-CSE-ConnectionGUID: sZS7FI4jRse5IGdsZcrC2Q==
X-CSE-MsgGUID: Mbx3j04QQziI+qHrLaJcCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="241354906"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hs-1kyP
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 7/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041401.FkkMowzA-lkp@intel.com>
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
commit: a4d5eff413f9f341de6bf31aea826a38e419796e [7/11] riscv: module: use shared leb128.h for ULEB128 relocation encoding
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041401.FkkMowzA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#13: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

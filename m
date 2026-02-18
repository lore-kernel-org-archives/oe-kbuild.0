Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F1341060
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 19:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441529; cv=none; b=m3DxEVRFv7/ExjNE3k9ztf7H4Dc1M0NsEKxpwVhITX3OwNiwBmQDze0lietBBmn04N79Bg/iVmWQ71C5/mq6uTW/ROphev9ShaxvCn/Tp3GPSqoQV+HmZc6a7cbyLUNqj7zUTS1dcZQP+6d3M+sUraqMa3VIwmA8U5mNqJIcZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441529; c=relaxed/simple;
	bh=n+R3NOilVhu6etAyg4+6W6YuCEJqRxNBZb16Dwqhk/E=;
	h=Date:From:To:Subject:Message-ID; b=HgJ2gYaBNxJI/LAhRUQXu2q2asAb7P5vqLG+KRIVEExQrY8SzEhcSR5hIOx9LVVf0raogpnWWVW20aaj1EDvkLI7WIQQp0bgE3J1826BpJ/OnPUrEshUROWwyU2YAwqS7bQtEEgttPkyu9Vc8k4NO7rZ05xRbStcqMI2u6FDeQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwzKsHBo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwzKsHBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771441527; x=1802977527;
  h=date:from:to:subject:message-id;
  bh=n+R3NOilVhu6etAyg4+6W6YuCEJqRxNBZb16Dwqhk/E=;
  b=MwzKsHBookt50Za7tV5KuadM9qtorklBt5scNPiMtd1FX96ZdSxXL9mX
   MCeCWFD78G5KeLE8xCoa9uz0TbqW9nTlgZU+r8azqhaZ1p9nNa5Bl7I01
   kS2roNwsCslZh2tj/hzazTjNIi/Nf4em66/y3BJaxyATiCEeFbqNgtU3U
   6vPdR/Mz+QVGYTJWhbi0Co3XOs0UhV6n7xocW6iyDpmbJvKh61M9Ukz61
   z/5tyV4KMbvp9enbVGq+sH95FwNaEifWifBmxDaLRoWd/85giosmBeOWL
   LK+eVL4EeN3aI63vbL6S0/lMBu/nM4+0Mk6n/txnoY2CzAcIk/SxPUwBr
   w==;
X-CSE-ConnectionGUID: x+qNoV8xRBa+POFmjSeiRA==
X-CSE-MsgGUID: NEpk6UAjQX6zj52MXdppgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="71548698"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="71548698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 11:05:27 -0800
X-CSE-ConnectionGUID: lvgCUAXrRFCz0bpH98ua+g==
X-CSE-MsgGUID: +HUMBPm6TxO4RdSbMJAEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="214125926"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Feb 2026 11:05:26 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsmrT-000000003j7-489i
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 19:05:23 +0000
Date: Wed, 18 Feb 2026 20:05:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jfern:nova/mm 6/31] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'is'
Message-ID: <202602182041.eTwWlrTj-lkp@intel.com>
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
TO: Joel Fernandes <joelagnelf@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   e80dbe46678758de27eb394cb97228fb36f8851a
commit: 9596b224ddbcb3725ecf28f699c192bf3eb19323 [6/31] rust: gpu: Add GPU buddy allocator bindings
:::::: branch date: 16 minutes ago
:::::: commit date: 33 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602182041.eTwWlrTj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#597: FILE: rust/kernel/gpu/buddy.rs:497:
+// SAFETY: `Block` is is not modified after allocation for the lifetime

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#601: FILE: rust/kernel/gpu/buddy.rs:501:
+// SAFETY: `Block` is is not modified after allocation for the lifetime

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

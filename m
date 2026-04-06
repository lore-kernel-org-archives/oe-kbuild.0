Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8A331211
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Apr 2026 22:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513191; cv=none; b=YHtnQaUOBvXtj1gnqZOct7gUceNdeWAdfUW67coEWUXyF2Z7qvch4ZcxD5dvfAnlSuy4niQ1MC6PmsGVzeSFAjNTQSB//Xrz7a132OoJu43x9r+8KkKUn6pTdGD5+9lkC5ctLexUUwPE5kMLg1o1LWlolFURcc7TF7dBh6L8Y4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513191; c=relaxed/simple;
	bh=Jmu+/PRDep7+VWAe2khSVVJo5/9z+Htg4MFPgp+SioI=;
	h=Date:From:To:Subject:Message-ID; b=Snc6nAB5KYfPF0sQDgxq7/EBv1TyVT9rTp82TCMAxuKco+3elfsZtNCcH8PBq6du26ModBC9TCY2wvLU+d3WlRhXpvnocZr1TTxEZ1evJgdoahv0tFuq+vk+oUsbz8M7MvGsW9RvEp8AEYQYuyNM8lMZsMignegvQ7QmQheg4u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyqThPZR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyqThPZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775513190; x=1807049190;
  h=date:from:to:subject:message-id;
  bh=Jmu+/PRDep7+VWAe2khSVVJo5/9z+Htg4MFPgp+SioI=;
  b=UyqThPZRb3xnyaID74EedS3O9duf798Nek4Z4V7FNyjFWvo3cZtIJIED
   f6UwaKXnzWNDXJ6D7fkpb05iMuzVPjv+0eBHY9HkYkHdni4CA3b6mA6NK
   eVSwv+qV+oV+hPfk5WEDo6q7cvu2mPsHWmQmeOs93S7LuJaAs4a4k6Oas
   BJrOZY0EKwm0Ko2H3/X8ZWvb99nYvnCMLuap+3AIcNSAxqn+V0JX1pN5H
   e4fNR/DqfkG12U1CAAknJaoTeuGWgfJyHiMDYBfWpbrOQi+SJ/kWCHCdA
   3hg+yJyigudJjpMyNjk50yMaWXCU4MWC1pzfsGvriDDjWHaqAoXq4L8Op
   A==;
X-CSE-ConnectionGUID: zYHyt9UKSgiI0VapPespdw==
X-CSE-MsgGUID: l+XbaetiQ0Sn551YCANg9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80060150"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80060150"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 15:06:30 -0700
X-CSE-ConnectionGUID: L7AXeW9RRZGOhbRC8mzxuA==
X-CSE-MsgGUID: CpfDIF8bT1uEqPvad23BrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="226978579"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 06 Apr 2026 15:06:28 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9s5S-00000000AAA-3Tdu
	for oe-kbuild@lists.linux.dev;
	Mon, 06 Apr 2026 22:06:26 +0000
Date: Tue, 07 Apr 2026 00:05:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 1/51] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202604070003.JU8KiozS-lkp@intel.com>
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
TO: Zach Brown <zab@zabbo.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   9a0627207ad856d2a5eb09f3458afb1e34ac10a3
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/51] rpdfs: initial commit
:::::: branch date: 55 minutes ago
:::::: commit date: 5 months ago
reproduce: (https://download.01.org/0day-ci/archive/20260407/202604070003.JU8KiozS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#5989: FILE: fs/rpdfs/net.c:470:
+	switch (nerrno) {
+		case -EIO: return RPDFS_MSG_ERR_EIO;
+		case -ENOMEM: default: return RPDFS_MSG_ERR_EIO;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F444A3C
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 00:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818093; cv=none; b=HUrCqFghCeMGQf8SL9dlwWy6sqIhEVxgwqFaf17LJJEnzOSWdCSwGJphIywZGKbjWE/vJUA0XvHpxaYf1wPEmiqBRdbO4Ox5xiOVN7YJ0LVZejDfw30i2WMyWeW5M7G/0kScJ/OEEoMvlRmdxNQXKRIDTPO17fEem/54xMUiQZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818093; c=relaxed/simple;
	bh=lRBBo0dOMbTjc0AVkANF3HNxvZap91mOeSd1s2OovAI=;
	h=Date:From:To:Subject:Message-ID; b=IwAnx7NpCKFiGh66j0CYAlTgQNmqQXVa7HiL65Jny6oO5/jREq4XMCRvHAlO+NS/ltqaFldV6AuVY6cHPGZ1qUu1FG0Yowqy2XIly3PDCuUcRPsXOF8zLPn422sE73+MsPIdth+XdyMw/qwZmozDTN49K2yIdcN/Vp9mKtash3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/Zo4cFv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/Zo4cFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769818092; x=1801354092;
  h=date:from:to:subject:message-id;
  bh=lRBBo0dOMbTjc0AVkANF3HNxvZap91mOeSd1s2OovAI=;
  b=S/Zo4cFvVE1iMmtZUFY4GAT1NSRszjLwkVTEoRUyKPDF363l54VuByX9
   sKidRPpdilZm++Bi8zgd9h7QzHy7Ukgm1yUlI8glDaJAnlfmxewMX81zE
   vrGfv6bP3dLn1Tso7dheGS5qVeyJ6qfAfIsa/mKgd/KrEtgdoS98MBsm/
   K0BuFI4Yej0UWq0aUQcuag4QW/7CeoJqujDdrgRZZ9wC/h5qLcXyWa3YJ
   VDLNQ1I6mz8ynEJwQJlT/UBjqsEkfo0i26mnqLNWnugcNK6fu5eqVGtwU
   5g1+wb5Om/M8n/LFW278ftm8ZCoZD34Ot+7a2DMy5jpCtZwytQAnPVYzq
   A==;
X-CSE-ConnectionGUID: 9618cqgXRtG9X4BjXa4qHQ==
X-CSE-MsgGUID: D7MNOUSoTQq3f/Zp9cSnzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73674806"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="73674806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 16:08:11 -0800
X-CSE-ConnectionGUID: U2PH1oHiQH6AXEdNVp/4wg==
X-CSE-MsgGUID: cj/2f/BFQDiohYAq5XQgkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="246598253"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2026 16:08:11 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlyX2-000000002aJ-0dt4
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 00:08:08 +0000
Date: Sat, 31 Jan 2026 01:07:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream-20260130-1 10/23] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'revision'
Message-ID: <202601310114.Ukc1UuQF-lkp@intel.com>
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
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20260130-1
head:   8613a3fd5b6e088624accc0967f5a063f0dd02eb
commit: 23faa0d021c70c35300b9cfececfec71efe1a585 [10/23] RDMA/hfi2: Add in HW register access support
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601310114.Ukc1UuQF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'revision'
#5243: FILE: drivers/infiniband/hw/hfi2/chip.c:5207:
+/* return true if this is WFR chip revision revision a */

WARNING:REPEATED_WORD: Possible repeated word: 'revision'
#5256: FILE: drivers/infiniband/hw/hfi2/chip.c:5220:
+/* return true if this is WFR chip revision revision b or not WFR */

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#6129: FILE: drivers/infiniband/hw/hfi2/chip.c:6093:
+	/*
+	* Update the counters for the corresponding status bits.

WARNING:REPEATED_WORD: Possible repeated word: 'be'
#11037: FILE: drivers/infiniband/hw/hfi2/chip.c:11001:
+		 * Physical and Logical states should already be
+		 * be transitioned to LinkUp and LinkInit respectively.

WARNING:REPEATED_WORD: Possible repeated word: 'off'
#14789: FILE: drivers/infiniband/hw/hfi2/chip.c:14753:
+	 * the device since we are now in charge.  Turn off
+	 * off all outbound and inbound traffic and make sure

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

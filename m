Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C2182AE
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717229701; cv=none; b=sQbcaWSfAcJ3wUzhub3F93S/Hwho52rlA0i3SC3NP5ee1FSek1AHLY0TdxDkErzENMzJ3SwNzW4E36Q91/z9O7shzz42Z4YYnF3+moFN/DD1xEj0tsqXkfWvWqSSeRJFwdFtKGBESWQTe3nDNQsppZdDLRvfPt/vM8aCqPPYfOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717229701; c=relaxed/simple;
	bh=p/s7DJhbQVwPdlH3D2yFp8Y+DNj2SRi3LJbeoI3EdRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pt+n4cX+qHgb2AM9svS7M98ZdaFzq8botQrSQAn4CQ1MS4LJSiGOISFHdCLs0NznCe6Qv0gp6RJgmHiQ5/R1EJMAzrvR8cDxdGoM4thnnP2nC//k5f+03ihLhwGnEGZlV2AXABbw/Wo5OXkKLnWeKreo9tmmIbljSvtLKjI1zfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFaQRdV4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFaQRdV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717229699; x=1748765699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p/s7DJhbQVwPdlH3D2yFp8Y+DNj2SRi3LJbeoI3EdRY=;
  b=GFaQRdV4VnQar531rdtRosYHGxM37yohW6jgwGrkb+/DrjG890km9vf4
   a8Io0b6Je9t6+eGWdZE8BcohNROHDggGNVRoCRUMpv8o6U1Z1spon6hYX
   vIV5gmF9JqZetbKe9PZ6pxW5+xG5mJSXy6e/uN/8Ef9YkdFv6jJvOtheI
   JZkY5T1Wqqou28eskqaWSoXK4HEPwDdC/3PLrbZEg7YFhEpxyMIT8Lnfw
   NrRYaAu1mqjqbsHrgHdkGTzYeVXYbFPJo4Nv22WtvnVbx2nMxITQyVz8O
   F1Zj3V4+D1P8U+Fcu5E/+cw0ZkjlqXT1QJw0fnG7QVNt3Cxzo4GoCIb1/
   g==;
X-CSE-ConnectionGUID: ZzN1RoX5To+3Ue5nJoghzA==
X-CSE-MsgGUID: S7WOxnL+SNaaHuUbT4gh3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="31277816"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="31277816"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 01:14:58 -0700
X-CSE-ConnectionGUID: QmpdMiqFSIaL37lJonaj1A==
X-CSE-MsgGUID: LOEFQa7wROGSm5+NmsivlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="59563224"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jun 2024 01:14:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDJt8-000IYz-1w;
	Sat, 01 Jun 2024 08:14:54 +0000
Date: Sat, 1 Jun 2024 16:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [robh:dt/linus 4/5] drivers/of/irq.c:107 of_irq_parse_imap_parent()
 warn: bitwise AND condition is false here
Message-ID: <202406011641.gZZcGAYi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/linus
head:   e7985f43609c782132f8f5794ee6cc4cdb66ca75
commit: 935df1bd40d43c4ee91838c42a20e9af751885cc [4/5] of/irq: Factor out parsing of interrupt-map parent phandle+args from of_irq_parse_raw()
:::::: branch date: 31 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20240601 (https://download.01.org/0day-ci/archive/20240601/202406011641.gZZcGAYi-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406011641.gZZcGAYi-lkp@intel.com/

New smatch warnings:
drivers/of/irq.c:107 of_irq_parse_imap_parent() warn: bitwise AND condition is false here

Old smatch warnings:
drivers/of/irq.c:68 of_irq_find_parent() warn: bitwise AND condition is false here
drivers/of/irq.c:362 of_irq_parse_one() warn: bitwise AND condition is false here

vim +107 drivers/of/irq.c

de4adddcbcc25d Marc Zyngier      2021-12-01  100  
935df1bd40d43c Rob Herring (Arm  2024-05-29  101) const __be32 *of_irq_parse_imap_parent(const __be32 *imap, int len, struct of_phandle_args *out_irq)
935df1bd40d43c Rob Herring (Arm  2024-05-29  102) {
935df1bd40d43c Rob Herring (Arm  2024-05-29  103) 	u32 intsize, addrsize;
935df1bd40d43c Rob Herring (Arm  2024-05-29  104) 	struct device_node *np;
935df1bd40d43c Rob Herring (Arm  2024-05-29  105) 
935df1bd40d43c Rob Herring (Arm  2024-05-29  106) 	/* Get the interrupt parent */
935df1bd40d43c Rob Herring (Arm  2024-05-29 @107) 	if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
935df1bd40d43c Rob Herring (Arm  2024-05-29  108) 		np = of_node_get(of_irq_dflt_pic);
935df1bd40d43c Rob Herring (Arm  2024-05-29  109) 	else
935df1bd40d43c Rob Herring (Arm  2024-05-29  110) 		np = of_find_node_by_phandle(be32_to_cpup(imap));
935df1bd40d43c Rob Herring (Arm  2024-05-29  111) 	imap++;
935df1bd40d43c Rob Herring (Arm  2024-05-29  112) 
935df1bd40d43c Rob Herring (Arm  2024-05-29  113) 	/* Check if not found */
935df1bd40d43c Rob Herring (Arm  2024-05-29  114) 	if (!np) {
935df1bd40d43c Rob Herring (Arm  2024-05-29  115) 		pr_debug(" -> imap parent not found !\n");
935df1bd40d43c Rob Herring (Arm  2024-05-29  116) 		return NULL;
935df1bd40d43c Rob Herring (Arm  2024-05-29  117) 	}
935df1bd40d43c Rob Herring (Arm  2024-05-29  118) 
935df1bd40d43c Rob Herring (Arm  2024-05-29  119) 	/* Get #interrupt-cells and #address-cells of new parent */
935df1bd40d43c Rob Herring (Arm  2024-05-29  120) 	if (of_property_read_u32(np, "#interrupt-cells",
935df1bd40d43c Rob Herring (Arm  2024-05-29  121) 					&intsize)) {
935df1bd40d43c Rob Herring (Arm  2024-05-29  122) 		pr_debug(" -> parent lacks #interrupt-cells!\n");
935df1bd40d43c Rob Herring (Arm  2024-05-29  123) 		of_node_put(np);
935df1bd40d43c Rob Herring (Arm  2024-05-29  124) 		return NULL;
935df1bd40d43c Rob Herring (Arm  2024-05-29  125) 	}
935df1bd40d43c Rob Herring (Arm  2024-05-29  126) 	if (of_property_read_u32(np, "#address-cells",
935df1bd40d43c Rob Herring (Arm  2024-05-29  127) 					&addrsize))
935df1bd40d43c Rob Herring (Arm  2024-05-29  128) 		addrsize = 0;
935df1bd40d43c Rob Herring (Arm  2024-05-29  129) 
935df1bd40d43c Rob Herring (Arm  2024-05-29  130) 	pr_debug(" -> intsize=%d, addrsize=%d\n",
935df1bd40d43c Rob Herring (Arm  2024-05-29  131) 		intsize, addrsize);
935df1bd40d43c Rob Herring (Arm  2024-05-29  132) 
935df1bd40d43c Rob Herring (Arm  2024-05-29  133) 	/* Check for malformed properties */
935df1bd40d43c Rob Herring (Arm  2024-05-29  134) 	if (WARN_ON(addrsize + intsize > MAX_PHANDLE_ARGS)
935df1bd40d43c Rob Herring (Arm  2024-05-29  135) 		|| (len < (addrsize + intsize))) {
935df1bd40d43c Rob Herring (Arm  2024-05-29  136) 		of_node_put(np);
935df1bd40d43c Rob Herring (Arm  2024-05-29  137) 		return NULL;
935df1bd40d43c Rob Herring (Arm  2024-05-29  138) 	}
935df1bd40d43c Rob Herring (Arm  2024-05-29  139) 
935df1bd40d43c Rob Herring (Arm  2024-05-29  140) 	pr_debug(" -> imaplen=%d\n", len);
935df1bd40d43c Rob Herring (Arm  2024-05-29  141) 
935df1bd40d43c Rob Herring (Arm  2024-05-29  142) 	imap += addrsize + intsize;
935df1bd40d43c Rob Herring (Arm  2024-05-29  143) 
935df1bd40d43c Rob Herring (Arm  2024-05-29  144) 	out_irq->np = np;
935df1bd40d43c Rob Herring (Arm  2024-05-29  145) 	for (int i = 0; i < intsize; i++)
935df1bd40d43c Rob Herring (Arm  2024-05-29  146) 		out_irq->args[i] = be32_to_cpup(imap - intsize + i);
935df1bd40d43c Rob Herring (Arm  2024-05-29  147) 	out_irq->args_count = intsize;
935df1bd40d43c Rob Herring (Arm  2024-05-29  148) 
935df1bd40d43c Rob Herring (Arm  2024-05-29  149) 	return imap;
935df1bd40d43c Rob Herring (Arm  2024-05-29  150) }
935df1bd40d43c Rob Herring (Arm  2024-05-29  151) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

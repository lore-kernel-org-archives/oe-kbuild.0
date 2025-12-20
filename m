Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3C2264C0
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766240593; cv=none; b=gNFvCWHrys3YSJMORDMd6/OvPLW9+wInIjTgQhI10L3Wgd4vR8PnfLV21dzQVsFPp/dmSASpWTLo0biEtsBPD3XU7Bbvth4Bo9B8WDfT0x/oOLHR9HxhRRlrAnG0u/QXeDu3KvrhOzisbKaiD4WyzsYg65DUc4jBeEEtuP2sMlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766240593; c=relaxed/simple;
	bh=E4ZQhaxdlpUMERPw4QL2Th1cxs9gWWTX1KnwsW82OBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LV611EsH1K52e3Ble4FGiCkfW3MKsCj9gVJjUnpcpIpS5hV/eAhWZtf/vlG1ug9HlffuhMNESnmiTB4BXqx1bK+jHHYfjG63YPxYbjKwf1+FAUQTWQAPuRqprKH3CHt04LFIUVcVYBeoyEYui2Ba3X5ikpY+JtN1GZi9QUO/Cec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDl4ou3x; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDl4ou3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766240591; x=1797776591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4ZQhaxdlpUMERPw4QL2Th1cxs9gWWTX1KnwsW82OBg=;
  b=FDl4ou3xCoEqePJYg63zoC0NUQSBsMrNzTivYYQaFuQsqrbRd4csC7+5
   cACXaIJ+QmrzrrmzS1s5yi6wIOyiB4f+qkGGLE/4ipdD4tv30qZzMsWJa
   kelqqhF15EEi0YP8wDHu0vyqc5kz4l2p9/m5EjmVljUyH8Ffb53Ijik+q
   3t2pLkp0L/CA/1uX+0o3oVOiUrmprXS4QwKvy2XRirF2hYfAAMW2Vh/GY
   JWjh6x3j4+DK+hSsl3RH0O9g3nifZt0alrQYZowswfPBpOsMBLc0oWaeC
   KaS7Z3pVEQjC6yU5N0qMKYxzsphikfZw2XA5CCbIAJM0hwDRrPtR0LrC2
   Q==;
X-CSE-ConnectionGUID: vTQtnlDnSGy1OQ3uXnNp+A==
X-CSE-MsgGUID: LvzvNuRoTJmfgdsfhynR8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68327862"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68327862"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:23:08 -0800
X-CSE-ConnectionGUID: I7FES9tKRO6i6sgGCg/SBg==
X-CSE-MsgGUID: 9jYI6x0FT5O4aAd1LFuiKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199984402"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 06:23:06 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxrM-000000004dL-15f7;
	Sat, 20 Dec 2025 14:23:04 +0000
Date: Sat, 20 Dec 2025 22:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/x86/coco/sev/core.c:2838:12-13: WARNING opportunity for
 kfree_sensitive/kvfree_sensitive (memset at line 2837)
Message-ID: <202512202235.WHPQkLZu-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Nikunj A Dadhania <nikunj@amd.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Tom Lendacky <thomas.lendacky@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: c5529418d05079384af4dbbb6f6156344c2ffce2 x86/sev: Carve out and export SNP guest messaging init routines
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-104-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202235.WHPQkLZu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512202235.WHPQkLZu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/coco/sev/core.c:2838:12-13: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 2837)

vim +2838 arch/x86/coco/sev/core.c

c5529418d05079 Nikunj A Dadhania 2025-01-06  2825  
c5529418d05079 Nikunj A Dadhania 2025-01-06  2826  void snp_msg_free(struct snp_msg_desc *mdesc)
c5529418d05079 Nikunj A Dadhania 2025-01-06  2827  {
c5529418d05079 Nikunj A Dadhania 2025-01-06  2828  	if (!mdesc)
c5529418d05079 Nikunj A Dadhania 2025-01-06  2829  		return;
c5529418d05079 Nikunj A Dadhania 2025-01-06  2830  
c5529418d05079 Nikunj A Dadhania 2025-01-06  2831  	kfree(mdesc->ctx);
c5529418d05079 Nikunj A Dadhania 2025-01-06  2832  	free_shared_pages(mdesc->response, sizeof(struct snp_guest_msg));
c5529418d05079 Nikunj A Dadhania 2025-01-06  2833  	free_shared_pages(mdesc->request, sizeof(struct snp_guest_msg));
c5529418d05079 Nikunj A Dadhania 2025-01-06  2834  	free_shared_pages(mdesc->certs_data, SEV_FW_BLOB_MAX_SIZE);
c5529418d05079 Nikunj A Dadhania 2025-01-06  2835  	iounmap((__force void __iomem *)mdesc->secrets);
c5529418d05079 Nikunj A Dadhania 2025-01-06  2836  
c5529418d05079 Nikunj A Dadhania 2025-01-06 @2837  	memset(mdesc, 0, sizeof(*mdesc));
c5529418d05079 Nikunj A Dadhania 2025-01-06 @2838  	kfree(mdesc);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

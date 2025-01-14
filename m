Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59043231A5C
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jan 2025 05:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831388; cv=none; b=RcxXaLQ9nY82WIEHcQOQhTyENo+KfAp3vpusrreNBUGdbAEeFvfalyMgOg/09r4V6z6nobqEjfJ0G6+ubTC/lOrlxCA8s2POktYX1cSNLP9le0eSu53A35unFiJt+qzS1luUmLlA2usQPg+a5k7HbtNZ+XJ04M0bFNW2aL1zYrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831388; c=relaxed/simple;
	bh=UK2CpBv4sg1ZaglTbX6rbDdZlbDBu9JJvqRTykRbegw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dn8bkmdkDD2lFcBxnW6XA0jAY9nMYsXlBS+xdbc4gb56SmvigiBDTey0didq2wVNWivVULhuI94U29HiS0l79SYdXkoByiAfWHpY8qe2IMC/e1ALII90O0s2LsNRVc0Mivg14JmyTTHMQDX+x+xJkSLT9pV7J3GFMACcmvXuhWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvRBVtuY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvRBVtuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736831386; x=1768367386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UK2CpBv4sg1ZaglTbX6rbDdZlbDBu9JJvqRTykRbegw=;
  b=lvRBVtuYvMlZ4eLaqzVS5r2Lr8CZ2Hrk7Q9HWeNf/1MmhzSlzI6XFO6u
   0y0dP4fWrLyaDf0VayzsMBcPeIQBCu2Gcq2P2SdQH4GbutQ8bI8UmdloS
   Uszyfl3eT9ZxMr8SsWKXf1K0yfQ2foR4FdusJy6+qQSDTM8pANQ11aXVl
   t3Fb2AhMX76jj6tqxG7R1XX+3+iPjWNoboSJmxxh0odcfliKr6nW1fMGl
   YxqgT9UmfYNw2A2qX3wC17ufrF/a/oo30QvdJx01h4E6+zToA9Yk0HoP7
   yNVyQXOQ1jUuulSFwnJUqLks3M/t/Kn1zU2mdiN6srS4szGgZnWmiD3T8
   w==;
X-CSE-ConnectionGUID: HU+e1DY/RCSOYjraLx/TBg==
X-CSE-MsgGUID: 3B7wlOELQxC8vckaV3XVEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47605655"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="47605655"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 21:09:46 -0800
X-CSE-ConnectionGUID: hAGmXgpsQTa3YteW5ZRjYw==
X-CSE-MsgGUID: DQQPtxGUTeaPnxsHMMUxbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105581509"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jan 2025 21:09:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXZBN-000O81-0p;
	Tue, 14 Jan 2025 05:09:41 +0000
Date: Tue, 14 Jan 2025 13:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [tip:x86/sev 11/19] arch/x86/coco/sev/core.c:2838:12-13: WARNING
 opportunity for kfree_sensitive/kvfree_sensitive (memset at line 2837)
Message-ID: <202501141317.IrSGK4Et-lkp@intel.com>
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
CC: x86@kernel.org
TO: Nikunj A Dadhania <nikunj@amd.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Tom Lendacky <thomas.lendacky@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/sev
head:   0563ee35ae2c9cfb0c6a7b2c0ddf7d9372bb8a98
commit: c5529418d05079384af4dbbb6f6156344c2ffce2 [11/19] x86/sev: Carve out and export SNP guest messaging init routines
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-103-20250114 (https://download.01.org/0day-ci/archive/20250114/202501141317.IrSGK4Et-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501141317.IrSGK4Et-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/coco/sev/core.c:2838:12-13: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 2837)

vim +2838 arch/x86/coco/sev/core.c

c5529418d050793 Nikunj A Dadhania 2025-01-06  2825  
c5529418d050793 Nikunj A Dadhania 2025-01-06  2826  void snp_msg_free(struct snp_msg_desc *mdesc)
c5529418d050793 Nikunj A Dadhania 2025-01-06  2827  {
c5529418d050793 Nikunj A Dadhania 2025-01-06  2828  	if (!mdesc)
c5529418d050793 Nikunj A Dadhania 2025-01-06  2829  		return;
c5529418d050793 Nikunj A Dadhania 2025-01-06  2830  
c5529418d050793 Nikunj A Dadhania 2025-01-06  2831  	kfree(mdesc->ctx);
c5529418d050793 Nikunj A Dadhania 2025-01-06  2832  	free_shared_pages(mdesc->response, sizeof(struct snp_guest_msg));
c5529418d050793 Nikunj A Dadhania 2025-01-06  2833  	free_shared_pages(mdesc->request, sizeof(struct snp_guest_msg));
c5529418d050793 Nikunj A Dadhania 2025-01-06  2834  	free_shared_pages(mdesc->certs_data, SEV_FW_BLOB_MAX_SIZE);
c5529418d050793 Nikunj A Dadhania 2025-01-06  2835  	iounmap((__force void __iomem *)mdesc->secrets);
c5529418d050793 Nikunj A Dadhania 2025-01-06  2836  
c5529418d050793 Nikunj A Dadhania 2025-01-06 @2837  	memset(mdesc, 0, sizeof(*mdesc));
c5529418d050793 Nikunj A Dadhania 2025-01-06 @2838  	kfree(mdesc);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3EA1DE892
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 19:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733168702; cv=none; b=L2lecK3DZkOmQxkopph+Hi2SzrKJ/Kca18KjHiZ3njebY7Ti7IiluW9ADKeR/3p+EuMu+Ds2DTbMB2zKXx2jeKsPLaij/ifOwkM5423JbbvSbWYHer47NX8Ahx0jH6x0EdfCHgqa+GLkO24z3JH2KRvZbewp3CsmR8pB/lRjJj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733168702; c=relaxed/simple;
	bh=egfEN1MgwX77QeDHrc11FsDYQxIprzSaSqh1kBB49FI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ErVdROEIyj/p0Kqk3FQQxL8/5iZiUeO6GZw7gvgVw5RX98HoaqVnM34cpswMpZ3B34fBMY/8JVD/68c5yLArambE7XlQrjLdYePboY55cnRQRZCMmgY5KGYIxf9h8SeT0q5AHeHP1qaR7DxrdPtaE51dIKkmPcWn0PwEhgSR2pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gK/R6QfV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gK/R6QfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733168700; x=1764704700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=egfEN1MgwX77QeDHrc11FsDYQxIprzSaSqh1kBB49FI=;
  b=gK/R6QfVUKA8JbMyFk2enLvff3j5CKhl4B/bd0DsO8rY6saVEtc7w/oA
   tv8s+Q5w4Q1WIMDemnL3Ydt4kgVMiAf6CxlDQ2TRJjWE1irdrnIAV0M1N
   TGNUAtqFP1YrL7qnx0ThcixQ8AEXP08hHOCGHzXxxI8dON+oBMNgQx3b+
   +37y/Yyv3v79VtZcc+P7r88ucvJUZ3/B5QIL2twob6hHv+le/pnrdpih2
   qZhV8K8cxPyDFdM3ebVW5n11RlDonj6lnjwvfp6hhVD7rrI7I6nVOXYpS
   tlKrTKZ+R1VeQABZkrwKUMr0RArwMC6o/2RxrGzTaDeTQvf/cSiZtNjJr
   g==;
X-CSE-ConnectionGUID: //6drt39ReOwwlDHK/tOpQ==
X-CSE-MsgGUID: 006fsEKzQ82ZcvLKok38Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33098917"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33098917"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 11:45:00 -0800
X-CSE-ConnectionGUID: NUWWilL9TKa2p29FKs5ozg==
X-CSE-MsgGUID: 228sHhZ4TTKw357CBYGmkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="97636650"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2024 11:44:58 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tICLU-0002pk-0U;
	Mon, 02 Dec 2024 19:44:45 +0000
Date: Tue, 3 Dec 2024 03:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/qedi/qedi_main.c:924 qedi_get_boot_tgt_info() error:
 snprintf() chops off the last chars of
 'block->target[index]->target_name.byte': 256 vs 255
Message-ID: <202412030334.S8d3ITeg-lkp@intel.com>
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
TO: Manish Rangankar <mrangankar@marvell.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Lee Duncan <lduncan@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: 2f1ea39870c95aa9fff6a0b48757625a0b22f551 scsi: qedi: Remove additional char from boot target iqnname
date:   4 years, 8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 years, 8 months ago
config: i386-randconfig-141-20241120 (https://download.01.org/0day-ci/archive/20241203/202412030334.S8d3ITeg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412030334.S8d3ITeg-lkp@intel.com/

New smatch warnings:
drivers/scsi/qedi/qedi_main.c:924 qedi_get_boot_tgt_info() error: snprintf() chops off the last chars of 'block->target[index]->target_name.byte': 256 vs 255

Old smatch warnings:
drivers/scsi/qedi/qedi_main.c:956 qedi_find_boot_info() warn: returning -1 instead of -ENOMEM is sloppy
drivers/scsi/qedi/qedi_main.c:1607 qedi_alloc_global_queues() warn: missing error code 'status'

vim +924 drivers/scsi/qedi/qedi_main.c

ace7f46ba5fde7 Manish Rangankar 2016-12-01  915  
534bbdf8832ae4 Manish Rangankar 2018-05-22  916  static void qedi_get_boot_tgt_info(struct nvm_iscsi_block *block,
534bbdf8832ae4 Manish Rangankar 2018-05-22  917  				   struct qedi_boot_target *tgt, u8 index)
534bbdf8832ae4 Manish Rangankar 2018-05-22  918  {
534bbdf8832ae4 Manish Rangankar 2018-05-22  919  	u32 ipv6_en;
534bbdf8832ae4 Manish Rangankar 2018-05-22  920  
534bbdf8832ae4 Manish Rangankar 2018-05-22  921  	ipv6_en = !!(block->generic.ctrl_flags &
534bbdf8832ae4 Manish Rangankar 2018-05-22  922  		     NVM_ISCSI_CFG_GEN_IPV6_ENABLED);
534bbdf8832ae4 Manish Rangankar 2018-05-22  923  
2f1ea39870c95a Manish Rangankar 2020-04-07 @924  	snprintf(tgt->iscsi_name, sizeof(tgt->iscsi_name), "%s",
534bbdf8832ae4 Manish Rangankar 2018-05-22  925  		 block->target[index].target_name.byte);
534bbdf8832ae4 Manish Rangankar 2018-05-22  926  
534bbdf8832ae4 Manish Rangankar 2018-05-22  927  	tgt->ipv6_en = ipv6_en;
534bbdf8832ae4 Manish Rangankar 2018-05-22  928  
534bbdf8832ae4 Manish Rangankar 2018-05-22  929  	if (ipv6_en)
534bbdf8832ae4 Manish Rangankar 2018-05-22  930  		snprintf(tgt->ip_addr, IPV6_LEN, "%pI6\n",
534bbdf8832ae4 Manish Rangankar 2018-05-22  931  			 block->target[index].ipv6_addr.byte);
534bbdf8832ae4 Manish Rangankar 2018-05-22  932  	else
534bbdf8832ae4 Manish Rangankar 2018-05-22  933  		snprintf(tgt->ip_addr, IPV4_LEN, "%pI4\n",
534bbdf8832ae4 Manish Rangankar 2018-05-22  934  			 block->target[index].ipv4_addr.byte);
534bbdf8832ae4 Manish Rangankar 2018-05-22  935  }
534bbdf8832ae4 Manish Rangankar 2018-05-22  936  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

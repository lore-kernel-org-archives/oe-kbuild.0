Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540322580EE
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 18:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052247; cv=none; b=O8EGpwdxWpZxAYNwBtfEqEJ+KxsW0CsMw4n0h55EL9S70ug2hR+HlgcZyrDK53CjAaUe/+B3ICtLcD9dk4dAecsqNEQUQIW45kOLyiIgvC1Gwns+udzoki61IYFLTtN6IGQlOSA6XC7+YvlkWeMOnkHfbCLqHzrhlsz+b003/kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052247; c=relaxed/simple;
	bh=6RLQ9Nw79Rvp4CtY/W5TSVvvgLYuXMd363rSLaNMijo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iSgzwrTmlu6E6LsB5wmrXxdajqLQ0r1ASNL3WXMyQjmBJhoIBurQoTlz5LwpRlVGOy7Gna/srTYnij5SvO5FVvXOBN0mHEtNfdO6RDz+nB1JCZfOBgmZso4TsVvFHHjryp32R2ywYyqpuzb4tKM5EIlOAyyKtEBRUy4ZJ06CB04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1CGzzdj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1CGzzdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744052246; x=1775588246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6RLQ9Nw79Rvp4CtY/W5TSVvvgLYuXMd363rSLaNMijo=;
  b=i1CGzzdjvYrSsge7OEYWF6gSkddP+V1vEJBzUX8drEdQYvuPoE4kUmbQ
   oXLsJvRymghc0Tdp8/seTeNAPs+waGRV+hRtpIatyJv3lmmlMkAj23A+E
   eZr87ibbnHn+9v5oRhH1j6Sr5cgeCnCJJEbSlBe3TYpH29MQwhWGkwiRO
   rwU+i94O7mZkQOlNXJ//CjLXSvkTHyGiuCu6Uzn7To3FYi1VzHHmqW8cY
   MEQahDB4ZmhcdVvbxDVRf1vsIpioAxg8J2eoNbZ8VJFt+cvan9YBzneO9
   DuddS6JwXL2XhNNhfD9S7/luIiF43yjFzdVXXJxVQRScBVXxa4jeJN4gd
   Q==;
X-CSE-ConnectionGUID: SSfKSWunQCy/PtLDHZPcOg==
X-CSE-MsgGUID: 1mjDI/i8RSWvCu9nG6Adlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49112757"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49112757"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:57:25 -0700
X-CSE-ConnectionGUID: nm6OolpET6awQVSO2+lrhw==
X-CSE-MsgGUID: x3p1QWxKSX2pEkjnmB7EnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151228699"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 11:57:23 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1req-0003iV-2Y;
	Mon, 07 Apr 2025 18:57:20 +0000
Date: Tue, 8 Apr 2025 02:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android13-5.15-2024-05 0/1]
 drivers/scsi/elx/efct/efct_scsi.c:47:2-8: preceding lock on line 41
Message-ID: <202504080232.mFbjlZmr-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15-2024-05
head:   96ddb774d408960590543f104a10aba091d123d6
commit: a013c71c6315d6e9d6364d12251b98c75c9a2861 [0/1] scsi: elx: efct: Delete stray unlock statement
:::::: branch date: 5 days ago
:::::: commit date: 3 years, 6 months ago
config: i386-randconfig-052-20250403 (https://download.01.org/0day-ci/archive/20250408/202504080232.mFbjlZmr-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504080232.mFbjlZmr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/elx/efct/efct_scsi.c:47:2-8: preceding lock on line 41

vim +47 drivers/scsi/elx/efct/efct_scsi.c

3e6414003bf9ac James Smart   2021-06-01  14  
3e6414003bf9ac James Smart   2021-06-01  15  #define scsi_io_printf(io, fmt, ...) \
3e6414003bf9ac James Smart   2021-06-01  16  	efc_log_debug(io->efct, "[%s]" SCSI_IOFMT fmt, \
3e6414003bf9ac James Smart   2021-06-01  17  		io->node->display_name, io->instance_index,\
3e6414003bf9ac James Smart   2021-06-01  18  		io->init_task_tag, io->tgt_task_tag, io->hw_tag, ##__VA_ARGS__)
3e6414003bf9ac James Smart   2021-06-01  19  
3e6414003bf9ac James Smart   2021-06-01  20  #define EFCT_LOG_ENABLE_SCSI_TRACE(efct)                \
3e6414003bf9ac James Smart   2021-06-01  21  		(((efct) != NULL) ? (((efct)->logmask & (1U << 2)) != 0) : 0)
3e6414003bf9ac James Smart   2021-06-01  22  
3e6414003bf9ac James Smart   2021-06-01  23  #define scsi_io_trace(io, fmt, ...) \
3e6414003bf9ac James Smart   2021-06-01  24  	do { \
3e6414003bf9ac James Smart   2021-06-01  25  		if (EFCT_LOG_ENABLE_SCSI_TRACE(io->efct)) \
3e6414003bf9ac James Smart   2021-06-01  26  			scsi_io_printf(io, fmt, ##__VA_ARGS__); \
3e6414003bf9ac James Smart   2021-06-01  27  	} while (0)
3e6414003bf9ac James Smart   2021-06-01  28  
3e6414003bf9ac James Smart   2021-06-01  29  struct efct_io *
3e6414003bf9ac James Smart   2021-06-01  30  efct_scsi_io_alloc(struct efct_node *node)
3e6414003bf9ac James Smart   2021-06-01  31  {
3e6414003bf9ac James Smart   2021-06-01  32  	struct efct *efct;
3e6414003bf9ac James Smart   2021-06-01  33  	struct efct_xport *xport;
3e6414003bf9ac James Smart   2021-06-01  34  	struct efct_io *io;
a013c71c6315d6 Dan Carpenter 2021-10-04  35  	unsigned long flags;
3e6414003bf9ac James Smart   2021-06-01  36  
3e6414003bf9ac James Smart   2021-06-01  37  	efct = node->efct;
3e6414003bf9ac James Smart   2021-06-01  38  
3e6414003bf9ac James Smart   2021-06-01  39  	xport = efct->xport;
3e6414003bf9ac James Smart   2021-06-01  40  
3e6414003bf9ac James Smart   2021-06-01 @41  	spin_lock_irqsave(&node->active_ios_lock, flags);
3e6414003bf9ac James Smart   2021-06-01  42  
3e6414003bf9ac James Smart   2021-06-01  43  	io = efct_io_pool_io_alloc(efct->xport->io_pool);
3e6414003bf9ac James Smart   2021-06-01  44  	if (!io) {
3e6414003bf9ac James Smart   2021-06-01  45  		efc_log_err(efct, "IO alloc Failed\n");
3e6414003bf9ac James Smart   2021-06-01  46  		atomic_add_return(1, &xport->io_alloc_failed_count);
3e6414003bf9ac James Smart   2021-06-01 @47  		return NULL;
3e6414003bf9ac James Smart   2021-06-01  48  	}
3e6414003bf9ac James Smart   2021-06-01  49  
3e6414003bf9ac James Smart   2021-06-01  50  	/* initialize refcount */
3e6414003bf9ac James Smart   2021-06-01  51  	kref_init(&io->ref);
3e6414003bf9ac James Smart   2021-06-01  52  	io->release = _efct_scsi_io_free;
3e6414003bf9ac James Smart   2021-06-01  53  
3e6414003bf9ac James Smart   2021-06-01  54  	/* set generic fields */
3e6414003bf9ac James Smart   2021-06-01  55  	io->efct = efct;
3e6414003bf9ac James Smart   2021-06-01  56  	io->node = node;
3e6414003bf9ac James Smart   2021-06-01  57  	kref_get(&node->ref);
3e6414003bf9ac James Smart   2021-06-01  58  
3e6414003bf9ac James Smart   2021-06-01  59  	/* set type and name */
3e6414003bf9ac James Smart   2021-06-01  60  	io->io_type = EFCT_IO_TYPE_IO;
3e6414003bf9ac James Smart   2021-06-01  61  	io->display_name = "scsi_io";
3e6414003bf9ac James Smart   2021-06-01  62  
3e6414003bf9ac James Smart   2021-06-01  63  	io->cmd_ini = false;
3e6414003bf9ac James Smart   2021-06-01  64  	io->cmd_tgt = true;
3e6414003bf9ac James Smart   2021-06-01  65  
3e6414003bf9ac James Smart   2021-06-01  66  	/* Add to node's active_ios list */
3e6414003bf9ac James Smart   2021-06-01  67  	INIT_LIST_HEAD(&io->list_entry);
3e6414003bf9ac James Smart   2021-06-01  68  	list_add(&io->list_entry, &node->active_ios);
3e6414003bf9ac James Smart   2021-06-01  69  
3e6414003bf9ac James Smart   2021-06-01  70  	spin_unlock_irqrestore(&node->active_ios_lock, flags);
3e6414003bf9ac James Smart   2021-06-01  71  
3e6414003bf9ac James Smart   2021-06-01  72  	return io;
3e6414003bf9ac James Smart   2021-06-01  73  }
3e6414003bf9ac James Smart   2021-06-01  74  

:::::: The code at line 47 was first introduced by commit
:::::: 3e6414003bf9acd3b7e20474f950779fafb658d5 scsi: elx: efct: SCSI I/O handling routines

:::::: TO: James Smart <jsmart2021@gmail.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

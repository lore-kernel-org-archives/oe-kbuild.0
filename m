Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9634C29AB05
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 18:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764699041; cv=none; b=aT6CmdiaIzg0MEkY2Z+CRNjv8h1EsGWRmTtAGatNCoDCJRuSJSyLrrV6MlB86fW/IrTNv56xCBTM9lHChsLR0zMYK8rwia2762GkvYbMY6Mmv6+KsHbNBs/GCNDRVNo1fGJmO+KTuVDEhWdcXxy2Tg6w/AZJ9nGLbSO8UKPFoPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764699041; c=relaxed/simple;
	bh=dAWnYyTlyGrbrr3Tjcc8FrfKYLRNY8rjVTzAUrujfMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfFsXGM75y73Y4qo3jH0LhQbqAFaIVBn/RZLznZt4F2URKkXpTQPqFTuJw8s0wYhHRHkD0vCQikFHdr9yGfkI0zBe0AoF9e6HlOX9JAZSI940tsO9kz0XQ3xCdwv+5HNZ3wcdRiBrZvrPJwJYDJ4bRQXCesrz8c6ajExSCFKO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5OffoJJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5OffoJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764699040; x=1796235040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dAWnYyTlyGrbrr3Tjcc8FrfKYLRNY8rjVTzAUrujfMA=;
  b=g5OffoJJzG8IM8WOVJMafgpvlUaCuBOXH6rF/fCXdrXkjy8Urq3faNvv
   MPAJZjU7LUnzCknusUIYOt3BWvAIoAfFlY5r2RKeV9WmciD0NqezGU5rd
   E8I8eDl4gSrR+neanTifz2VnXzvsn27WcYdz02wQoyhoW/oNjLNTV7/Zm
   YGCzyQpG0N+BZ+HhmnLmDliuuBk9HDvjpCXmUkwbssW+KnW6yMYM3FgFH
   /0JDqat03oED1vBN6/L1ilqx0K6JMEbGhR9yhFBHsQ6+i2X6OAcJZlvHh
   XEh4oZ6DhG4vW5tNpjSx1l1hC3eYFZrv1KJdRWcQY4geQrCSxKsTzK2IU
   w==;
X-CSE-ConnectionGUID: /SVoJAhITkOUunjonqWYVQ==
X-CSE-MsgGUID: ObItGgowTmCZSVNfYYbFHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66717591"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66717591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 10:10:40 -0800
X-CSE-ConnectionGUID: BArpRfgCTyejO87JxHQ1pw==
X-CSE-MsgGUID: Y2zdnJvqSD+oPMOcNGn/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="225134628"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2025 10:10:38 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQUpf-000000002wp-3IdG;
	Tue, 02 Dec 2025 18:10:35 +0000
Date: Tue, 2 Dec 2025 19:10:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/qla2xxx/qla_init.c:8490:28: warning: variable
 'fragment' set but not used
Message-ID: <202512021947.U82G4ELP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Nilesh-Javali/qla2xxx-Add-Speed-in-SFP-print-information/20251202-140943, commit: 1bfb31c14b23902a2fe29ecfd75b669ced4b2dc0"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Manish Rangankar <mrangankar@marvell.com>
CC: 0day robot <lkp@intel.com>
CC: Nilesh Javali <njavali@marvell.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/qla2xxx-Add-Speed-in-SFP-print-information/20251202-140943
head:   72ffa216e20607b795b5962d24ebee31661864b2
commit: 1bfb31c14b23902a2fe29ecfd75b669ced4b2dc0 qla2xxx: Add load flash firmware mailbox support for 28xxx
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251202/202512021947.U82G4ELP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021947.U82G4ELP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021947.U82G4ELP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_init.c:8490:28: warning: variable 'fragment' set but not used [-Wunused-but-set-variable]
    8490 |         uint templates, segments, fragment;
         |                                   ^
   In file included from drivers/scsi/qla2xxx/qla_init.c:6:
   In file included from drivers/scsi/qla2xxx/qla_def.h:12:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
   In file included from arch/x86/include/asm/msr.h:11:
   In file included from arch/x86/include/asm/cpumask.h:5:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:13:
   In file included from include/linux/string.h:382:
   include/linux/fortify-string.h:580:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     580 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   2 warnings generated.


vim +/fragment +8490 drivers/scsi/qla2xxx/qla_init.c

1bfb31c14b2390 Manish Rangankar 2025-12-02  8482  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8483  static int
1bfb31c14b2390 Manish Rangankar 2025-12-02  8484  qla28xx_load_fw_template(scsi_qla_host_t *vha, uint32_t faddr)
1bfb31c14b2390 Manish Rangankar 2025-12-02  8485  {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8486  	struct qla_hw_data *ha = vha->hw;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8487  	struct fwdt *fwdt = ha->fwdt;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8488  	struct req_que *req = ha->req_q_map[0];
1bfb31c14b2390 Manish Rangankar 2025-12-02  8489  	uint32_t risc_size, risc_attr = 0;
1bfb31c14b2390 Manish Rangankar 2025-12-02 @8490  	uint templates, segments, fragment;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8491  	uint32_t *dcode;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8492  	ulong dlen;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8493  	int rval;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8494  	uint j;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8495  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8496  	dcode = (uint32_t *)req->ring;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8497  	segments = FA_RISC_CODE_SEGMENTS;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8498  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8499  	for (j = 0; j < segments; j++) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8500  		rval = qla24xx_read_flash_data(vha, dcode, faddr, 10);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8501  		if (rval) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8502  			ql_log(ql_log_fatal, vha, 0x01a1,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8503  			       "-> Failed to read flash addr + size .\n");
1bfb31c14b2390 Manish Rangankar 2025-12-02  8504  			return QLA_FUNCTION_FAILED;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8505  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8506  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8507  		risc_size = be32_to_cpu((__force __be32)dcode[3]);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8508  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8509  		if (risc_attr == 0)
1bfb31c14b2390 Manish Rangankar 2025-12-02  8510  			risc_attr = be32_to_cpu((__force __be32)dcode[9]);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8511  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8512  		dlen = ha->fw_transfer_size >> 2;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8513  		for (fragment = 0; risc_size; fragment++) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8514  			if (dlen > risc_size)
1bfb31c14b2390 Manish Rangankar 2025-12-02  8515  				dlen = risc_size;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8516  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8517  			faddr += dlen;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8518  			risc_size -= dlen;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8519  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8520  	}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8521  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8522  	templates = (risc_attr & BIT_9) ? 2 : 1;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8523  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8524  	ql_dbg(ql_dbg_init, vha, 0x01a1, "-> templates = %u\n", templates);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8525  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8526  	for (j = 0; j < templates; j++, fwdt++) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8527  		vfree(fwdt->template);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8528  		fwdt->template = NULL;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8529  		fwdt->length = 0;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8530  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8531  		dcode = (uint32_t *)req->ring;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8532  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8533  		rval = qla24xx_read_flash_data(vha, dcode, faddr, 7);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8534  		if (rval) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8535  			ql_log(ql_log_fatal, vha, 0x01a2,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8536  			    "-> Unable to read template size.\n");
1bfb31c14b2390 Manish Rangankar 2025-12-02  8537  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8538  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8539  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8540  		risc_size = be32_to_cpu((__force __be32)dcode[2]);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8541  		ql_dbg(ql_dbg_init, vha, 0x01a3,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8542  		    "-> fwdt%u template array at %#x (%#x dwords)\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8543  		    j, faddr, risc_size);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8544  		if (!risc_size || !~risc_size) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8545  			ql_dbg(ql_dbg_init, vha, 0x01a4,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8546  			    "-> fwdt%u failed to read array\n", j);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8547  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8548  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8549  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8550  		/* skip header and ignore checksum */
1bfb31c14b2390 Manish Rangankar 2025-12-02  8551  		faddr += 7;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8552  		risc_size -= 8;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8553  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8554  		ql_dbg(ql_dbg_init, vha, 0x01a5,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8555  		    "-> fwdt%u template allocate template %#x words...\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8556  		    j, risc_size);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8557  		fwdt->template = vmalloc(risc_size * sizeof(*dcode));
1bfb31c14b2390 Manish Rangankar 2025-12-02  8558  		if (!fwdt->template) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8559  			ql_log(ql_log_warn, vha, 0x01a6,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8560  			    "-> fwdt%u failed allocate template.\n", j);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8561  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8562  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8563  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8564  		dcode = fwdt->template;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8565  		rval = qla24xx_read_flash_data(vha, dcode, faddr, risc_size);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8566  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8567  		if (rval || !qla27xx_fwdt_template_valid(dcode)) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8568  			ql_log(ql_log_warn, vha, 0x01a7,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8569  			    "-> fwdt%u failed template validate (rval %x)\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8570  			    j, rval);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8571  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8572  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8573  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8574  		dlen = qla27xx_fwdt_template_size(dcode);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8575  		ql_dbg(ql_dbg_init, vha, 0x01a7,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8576  		    "-> fwdt%u template size %#lx bytes (%#lx words)\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8577  		    j, dlen, dlen / sizeof(*dcode));
1bfb31c14b2390 Manish Rangankar 2025-12-02  8578  		if (dlen > risc_size * sizeof(*dcode)) {
1bfb31c14b2390 Manish Rangankar 2025-12-02  8579  			ql_log(ql_log_warn, vha, 0x01a8,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8580  			    "-> fwdt%u template exceeds array (%-lu bytes)\n",
1bfb31c14b2390 Manish Rangankar 2025-12-02  8581  			    j, dlen - risc_size * sizeof(*dcode));
1bfb31c14b2390 Manish Rangankar 2025-12-02  8582  			goto failed;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8583  		}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8584  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8585  		fwdt->length = dlen;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8586  		ql_dbg(ql_dbg_init, vha, 0x01a9,
1bfb31c14b2390 Manish Rangankar 2025-12-02  8587  		    "-> fwdt%u loaded template ok\n", j);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8588  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8589  		faddr += risc_size + 1;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8590  	}
1bfb31c14b2390 Manish Rangankar 2025-12-02  8591  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8592  	return QLA_SUCCESS;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8593  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8594  failed:
1bfb31c14b2390 Manish Rangankar 2025-12-02  8595  	vfree(fwdt->template);
1bfb31c14b2390 Manish Rangankar 2025-12-02  8596  	fwdt->template = NULL;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8597  	fwdt->length = 0;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8598  
1bfb31c14b2390 Manish Rangankar 2025-12-02  8599  	return QLA_SUCCESS;
1bfb31c14b2390 Manish Rangankar 2025-12-02  8600  }
1bfb31c14b2390 Manish Rangankar 2025-12-02  8601  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

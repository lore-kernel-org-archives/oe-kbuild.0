Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149D2C237F
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756577047; cv=none; b=eKkQWUy0L0cJYPlyrtu8Iu9g6TmKOtQzvhEzLhMRjwFqLsvLw82mcy2/+TFjFRc8RrNnRhfvaxXyCJgx0f2f447yoySWOdnyzbVDLyb6N/3lrkoB35E/qdqxJWxPXtnWa3KazCI0uzfoxIqt6HZo4tpsAH9/LTkNxgKe06DYiiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756577047; c=relaxed/simple;
	bh=yvPhYjZmWYIlyaSqyLu7pChUkoJidlb24OT+BFw+9II=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PVST0WyIS0UcdMMYy1DZG/zcThdv/k9AK/zsGiyCOgS5hDroZ4hlSjlORvIzR2TkYab8t4ieaGIzXDYmJucSsti6ip8R44noy0qE7dwjMjrTEjgduq/sQhjmIbFbQ3TV3WxXK4J2VO442XnLb49WbWWnoQIOryzpfnHP2J2WO8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lwekbq0t; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lwekbq0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756577046; x=1788113046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvPhYjZmWYIlyaSqyLu7pChUkoJidlb24OT+BFw+9II=;
  b=Lwekbq0tm6ec80Dwo6iRPxaZJzwVjkZz1qLt20sPf2SXRif8lkyzabJ1
   ROu8lNPbWLVdjQnPhO+i/8Z+gLEe2GWTbO2OsRhtxxPdWsRoe+6PempWf
   iCiFMLq44Ca5SJ749Dbkmv70kWU8TqQ761auha1qT1Sbkm4pmWlQAT01Q
   R2HEQ9LiFXrHpEqLfNfmuQKwNu2yL6hT2l7WFwye3W4hWQivmsAAr7shv
   kx1aFzpZ3IbzSJCfCumcFF6d7oA/jULCo16uDKw6TCVgRStyzVRSV4r4E
   GdJ75+LjiETcregrGaPgofeWGtMGeVzCwpr0BIZVoZS4ZjBTtILxll1P2
   A==;
X-CSE-ConnectionGUID: HTxwuNkPSHOog78XrtCDQg==
X-CSE-MsgGUID: pBlGOrUvTFuOnBm3RaL6tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58759733"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58759733"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 11:04:05 -0700
X-CSE-ConnectionGUID: 7+Z/TE1ERsaz/u/zio1orw==
X-CSE-MsgGUID: N5KQRRc3RwmC4cad8uXeLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="207777238"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Aug 2025 11:04:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usPvT-000Vb5-3D;
	Sat, 30 Aug 2025 18:03:50 +0000
Date: Sun, 31 Aug 2025 02:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_trace_support_v1 21/100] arch/riscv/kernel/csr.c:81
 csr_read_num() warn: Function too hairy.  No more merges.
Message-ID: <202508310107.V7DDIdwT-lkp@intel.com>
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
TO: Anup Patel <apatel@ventanamicro.com>
CC: Sunil V L <sunilvl@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   c117d7c95ad2d3303f1e050b293802218a1caf18
commit: 8c87201a700f2a9c6af9b0294e3e60fd2c7fb4de [21/100] RISC-V: Add common csr_read_num() and csr_write_num() functions
:::::: branch date: 26 hours ago
:::::: commit date: 6 days ago
config: riscv-randconfig-r072-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310107.V7DDIdwT-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508310107.V7DDIdwT-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/csr.c:81 csr_read_num() warn: Function too hairy.  No more merges.
arch/riscv/kernel/csr.c:146 csr_write_num() warn: Function too hairy.  No more merges.

vim +81 arch/riscv/kernel/csr.c

8c87201a700f2a Anup Patel 2025-08-15   43  
8c87201a700f2a Anup Patel 2025-08-15   44  unsigned long csr_read_num(unsigned long csr_num, int *out_err)
8c87201a700f2a Anup Patel 2025-08-15   45  {
8c87201a700f2a Anup Patel 2025-08-15   46  #define switchcase_csr_read(__csr_num)				\
8c87201a700f2a Anup Patel 2025-08-15   47  	case (__csr_num):					\
8c87201a700f2a Anup Patel 2025-08-15   48  		return csr_read(__csr_num)
8c87201a700f2a Anup Patel 2025-08-15   49  #define switchcase_csr_read_2(__csr_num)			\
8c87201a700f2a Anup Patel 2025-08-15   50  	switchcase_csr_read(__csr_num + 0);			\
8c87201a700f2a Anup Patel 2025-08-15   51  	switchcase_csr_read(__csr_num + 1)
8c87201a700f2a Anup Patel 2025-08-15   52  #define switchcase_csr_read_4(__csr_num)			\
8c87201a700f2a Anup Patel 2025-08-15   53  	switchcase_csr_read_2(__csr_num + 0);			\
8c87201a700f2a Anup Patel 2025-08-15   54  	switchcase_csr_read_2(__csr_num + 2)
8c87201a700f2a Anup Patel 2025-08-15   55  #define switchcase_csr_read_8(__csr_num)			\
8c87201a700f2a Anup Patel 2025-08-15   56  	switchcase_csr_read_4(__csr_num + 0);			\
8c87201a700f2a Anup Patel 2025-08-15   57  	switchcase_csr_read_4(__csr_num + 4)
8c87201a700f2a Anup Patel 2025-08-15   58  #define switchcase_csr_read_16(__csr_num)			\
8c87201a700f2a Anup Patel 2025-08-15   59  	switchcase_csr_read_8(__csr_num + 0);			\
8c87201a700f2a Anup Patel 2025-08-15   60  	switchcase_csr_read_8(__csr_num + 8)
8c87201a700f2a Anup Patel 2025-08-15   61  #define switchcase_csr_read_32(__csr_num)			\
8c87201a700f2a Anup Patel 2025-08-15   62  	switchcase_csr_read_16(__csr_num + 0);			\
8c87201a700f2a Anup Patel 2025-08-15   63  	switchcase_csr_read_16(__csr_num + 16)
8c87201a700f2a Anup Patel 2025-08-15   64  #define switchcase_csr_read_64(__csr_num)			\
8c87201a700f2a Anup Patel 2025-08-15   65  	switchcase_csr_read_32(__csr_num + 0);			\
8c87201a700f2a Anup Patel 2025-08-15   66  	switchcase_csr_read_32(__csr_num + 32)
8c87201a700f2a Anup Patel 2025-08-15   67  #define switchcase_csr_read_128(__csr_num)			\
8c87201a700f2a Anup Patel 2025-08-15   68  	switchcase_csr_read_64(__csr_num + 0);			\
8c87201a700f2a Anup Patel 2025-08-15   69  	switchcase_csr_read_64(__csr_num + 64)
8c87201a700f2a Anup Patel 2025-08-15   70  #define switchcase_csr_read_256(__csr_num)			\
8c87201a700f2a Anup Patel 2025-08-15   71  	switchcase_csr_read_128(__csr_num + 0);			\
8c87201a700f2a Anup Patel 2025-08-15   72  	switchcase_csr_read_128(__csr_num + 128)
8c87201a700f2a Anup Patel 2025-08-15   73  
8c87201a700f2a Anup Patel 2025-08-15   74  	*out_err = 0;
8c87201a700f2a Anup Patel 2025-08-15   75  	switch (csr_num) {
8c87201a700f2a Anup Patel 2025-08-15   76  	switchcase_csr_read_32(CSR_CYCLE);
8c87201a700f2a Anup Patel 2025-08-15   77  	switchcase_csr_read_32(CSR_CYCLEH);
8c87201a700f2a Anup Patel 2025-08-15   78  	switchcase_csr_read_256(CSR_CUSTOM0_U_RW_BASE);
8c87201a700f2a Anup Patel 2025-08-15   79  	switchcase_csr_read_64(CSR_CUSTOM1_U_RO_BASE);
8c87201a700f2a Anup Patel 2025-08-15   80  	switchcase_csr_read_64(CSR_CUSTOM2_S_RW_BASE);
8c87201a700f2a Anup Patel 2025-08-15  @81  	switchcase_csr_read_64(CSR_CUSTOM3_S_RW_BASE);
8c87201a700f2a Anup Patel 2025-08-15   82  	switchcase_csr_read_64(CSR_CUSTOM4_S_RO_BASE);
8c87201a700f2a Anup Patel 2025-08-15   83  	switchcase_csr_read_64(CSR_CUSTOM5_HS_RW_BASE);
8c87201a700f2a Anup Patel 2025-08-15   84  	switchcase_csr_read_64(CSR_CUSTOM6_HS_RW_BASE);
8c87201a700f2a Anup Patel 2025-08-15   85  	switchcase_csr_read_64(CSR_CUSTOM7_HS_RO_BASE);
8c87201a700f2a Anup Patel 2025-08-15   86  #ifdef CONFIG_RISCV_M_MODE
8c87201a700f2a Anup Patel 2025-08-15   87  	switchcase_csr_read_64(CSR_CUSTOM8_M_RW_BASE);
8c87201a700f2a Anup Patel 2025-08-15   88  	switchcase_csr_read_64(CSR_CUSTOM9_M_RW_BASE);
8c87201a700f2a Anup Patel 2025-08-15   89  	switchcase_csr_read_64(CSR_CUSTOM10_M_RO_BASE);
8c87201a700f2a Anup Patel 2025-08-15   90  #endif
8c87201a700f2a Anup Patel 2025-08-15   91  	default:
8c87201a700f2a Anup Patel 2025-08-15   92  		*out_err = -EINVAL;
8c87201a700f2a Anup Patel 2025-08-15   93  		break;
8c87201a700f2a Anup Patel 2025-08-15   94  	}
8c87201a700f2a Anup Patel 2025-08-15   95  
8c87201a700f2a Anup Patel 2025-08-15   96  	return 0;
8c87201a700f2a Anup Patel 2025-08-15   97  #undef switchcase_csr_read_256
8c87201a700f2a Anup Patel 2025-08-15   98  #undef switchcase_csr_read_128
8c87201a700f2a Anup Patel 2025-08-15   99  #undef switchcase_csr_read_64
8c87201a700f2a Anup Patel 2025-08-15  100  #undef switchcase_csr_read_32
8c87201a700f2a Anup Patel 2025-08-15  101  #undef switchcase_csr_read_16
8c87201a700f2a Anup Patel 2025-08-15  102  #undef switchcase_csr_read_8
8c87201a700f2a Anup Patel 2025-08-15  103  #undef switchcase_csr_read_4
8c87201a700f2a Anup Patel 2025-08-15  104  #undef switchcase_csr_read_2
8c87201a700f2a Anup Patel 2025-08-15  105  #undef switchcase_csr_read
8c87201a700f2a Anup Patel 2025-08-15  106  }
8c87201a700f2a Anup Patel 2025-08-15  107  EXPORT_SYMBOL_GPL(csr_read_num);
8c87201a700f2a Anup Patel 2025-08-15  108  
8c87201a700f2a Anup Patel 2025-08-15  109  void csr_write_num(unsigned long csr_num, unsigned long val, int *out_err)
8c87201a700f2a Anup Patel 2025-08-15  110  {
8c87201a700f2a Anup Patel 2025-08-15  111  #define switchcase_csr_write(__csr_num, __val)			\
8c87201a700f2a Anup Patel 2025-08-15  112  	case (__csr_num):					\
8c87201a700f2a Anup Patel 2025-08-15  113  		csr_write(__csr_num, __val);			\
8c87201a700f2a Anup Patel 2025-08-15  114  		break
8c87201a700f2a Anup Patel 2025-08-15  115  #define switchcase_csr_write_2(__csr_num, __val)		\
8c87201a700f2a Anup Patel 2025-08-15  116  	switchcase_csr_write(__csr_num + 0, __val);		\
8c87201a700f2a Anup Patel 2025-08-15  117  	switchcase_csr_write(__csr_num + 1, __val)
8c87201a700f2a Anup Patel 2025-08-15  118  #define switchcase_csr_write_4(__csr_num, __val)		\
8c87201a700f2a Anup Patel 2025-08-15  119  	switchcase_csr_write_2(__csr_num + 0, __val);		\
8c87201a700f2a Anup Patel 2025-08-15  120  	switchcase_csr_write_2(__csr_num + 2, __val)
8c87201a700f2a Anup Patel 2025-08-15  121  #define switchcase_csr_write_8(__csr_num, __val)		\
8c87201a700f2a Anup Patel 2025-08-15  122  	switchcase_csr_write_4(__csr_num + 0, __val);		\
8c87201a700f2a Anup Patel 2025-08-15  123  	switchcase_csr_write_4(__csr_num + 4, __val)
8c87201a700f2a Anup Patel 2025-08-15  124  #define switchcase_csr_write_16(__csr_num, __val)		\
8c87201a700f2a Anup Patel 2025-08-15  125  	switchcase_csr_write_8(__csr_num + 0, __val);		\
8c87201a700f2a Anup Patel 2025-08-15  126  	switchcase_csr_write_8(__csr_num + 8, __val)
8c87201a700f2a Anup Patel 2025-08-15  127  #define switchcase_csr_write_32(__csr_num, __val)		\
8c87201a700f2a Anup Patel 2025-08-15  128  	switchcase_csr_write_16(__csr_num + 0, __val);		\
8c87201a700f2a Anup Patel 2025-08-15  129  	switchcase_csr_write_16(__csr_num + 16, __val)
8c87201a700f2a Anup Patel 2025-08-15  130  #define switchcase_csr_write_64(__csr_num, __val)		\
8c87201a700f2a Anup Patel 2025-08-15  131  	switchcase_csr_write_32(__csr_num + 0, __val);		\
8c87201a700f2a Anup Patel 2025-08-15  132  	switchcase_csr_write_32(__csr_num + 32, __val)
8c87201a700f2a Anup Patel 2025-08-15  133  #define switchcase_csr_write_128(__csr_num, __val)		\
8c87201a700f2a Anup Patel 2025-08-15  134  	switchcase_csr_write_64(__csr_num + 0, __val);		\
8c87201a700f2a Anup Patel 2025-08-15  135  	switchcase_csr_write_64(__csr_num + 64, __val)
8c87201a700f2a Anup Patel 2025-08-15  136  #define switchcase_csr_write_256(__csr_num, __val)		\
8c87201a700f2a Anup Patel 2025-08-15  137  	switchcase_csr_write_128(__csr_num + 0, __val);		\
8c87201a700f2a Anup Patel 2025-08-15  138  	switchcase_csr_write_128(__csr_num + 128, __val)
8c87201a700f2a Anup Patel 2025-08-15  139  
8c87201a700f2a Anup Patel 2025-08-15  140  	*out_err = 0;
8c87201a700f2a Anup Patel 2025-08-15  141  	switch (csr_num) {
8c87201a700f2a Anup Patel 2025-08-15  142  	switchcase_csr_write_256(CSR_CUSTOM0_U_RW_BASE, val);
8c87201a700f2a Anup Patel 2025-08-15  143  	switchcase_csr_write_64(CSR_CUSTOM2_S_RW_BASE, val);
8c87201a700f2a Anup Patel 2025-08-15  144  	switchcase_csr_write_64(CSR_CUSTOM3_S_RW_BASE, val);
8c87201a700f2a Anup Patel 2025-08-15  145  	switchcase_csr_write_64(CSR_CUSTOM5_HS_RW_BASE, val);
8c87201a700f2a Anup Patel 2025-08-15 @146  	switchcase_csr_write_64(CSR_CUSTOM6_HS_RW_BASE, val);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

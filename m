Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3792DA31
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Feb 2023 21:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675459159; x=1706995159;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IfqFbtd4818oL40XRbaaMGRaoad5J0zk/pIF+sVXgv8=;
  b=bIFqfjM78uhXt4eiR2j1OjpUXeWPFNdo9aJkirtBlAJm39lslvV2AxXp
   Nlq8RjMD+2n09v91PD7eNXe9mOvaNuiGcb5dGpWA7hg5aeXKerc503FoQ
   Bgp9q/gIQp/oa7sjvHHsnyZf7olgThZnEZYlin901RDnOPd9zKJyOPi1R
   ve+q+Bek+tiHc5/u8TJJJ++sUIA4PK+wnXT1PakSLfWnxHr6tPWXHiRdO
   DL6DpRyUmyFxx3NNFc97LRflWSoVMWzzLU/FiGi8rB5upMJDxCFUB/gxt
   KI5OyMF9gQDxv33Upg0r0Wp4RiiM/7/bifOUUSuzBHdO0YkS1PRZkJOv1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="391252708"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="391252708"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 13:19:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="734496117"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="734496117"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Feb 2023 13:19:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO3Sm-0000lZ-1u;
	Fri, 03 Feb 2023 21:19:16 +0000
Date: Sat, 4 Feb 2023 05:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7589/10357]
 drivers/fpga/intel-m10-bmc-sec-update.c:370:31: warning: Uninitialized
 variable: doorbell_reg [uninitvar]
Message-ID: <202302040509.Zr7eUVXN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/fpga/intel-m10-bmc-sec-update.c:370:31: warning: Uninitialized variable: doorbell_reg [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Lee Jones <lee@kernel.org>
CC: Tianfei zhang <tianfei.zhang@intel.com>
CC: Russ Weight <russell.h.weight@intel.com>
CC: Matthew Gerlach <matthew.gerlach@linux.intel.com>
CC: Xu Yilun <yilun.xu@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4fafd96910add124586b549ad005dcd179de8a18
commit: 869b9eddf0b38a22c27a400e2fa849d2ff2aa7e1 [7589/10357] mfd: intel-m10-bmc: Add PMCI driver
:::::: branch date: 18 hours ago
:::::: commit date: 7 days ago
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 869b9eddf0b38a22c27a400e2fa849d2ff2aa7e1
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/fpga/intel-m10-bmc-sec-update.c:370:31: warning: Uninitialized variable: doorbell_reg [uninitvar]
       err < 0 || rsu_start_done(doorbell_reg, progress, status),
                                 ^
   drivers/fpga/intel-m10-bmc-sec-update.c:366:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/fpga/intel-m10-bmc-sec-update.c:370:31: note: Uninitialized variable: doorbell_reg
       err < 0 || rsu_start_done(doorbell_reg, progress, status),
                                 ^
>> drivers/fpga/intel-m10-bmc-sec-update.c:370:45: warning: Uninitialized variable: progress [uninitvar]
       err < 0 || rsu_start_done(doorbell_reg, progress, status),
                                               ^
   drivers/fpga/intel-m10-bmc-sec-update.c:366:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/fpga/intel-m10-bmc-sec-update.c:370:45: note: Uninitialized variable: progress
       err < 0 || rsu_start_done(doorbell_reg, progress, status),
                                               ^
>> drivers/fpga/intel-m10-bmc-sec-update.c:370:55: warning: Uninitialized variable: status [uninitvar]
       err < 0 || rsu_start_done(doorbell_reg, progress, status),
                                                         ^
   drivers/fpga/intel-m10-bmc-sec-update.c:366:6: note: Assuming condition is false
    if (ret)
        ^
   drivers/fpga/intel-m10-bmc-sec-update.c:370:55: note: Uninitialized variable: status
       err < 0 || rsu_start_done(doorbell_reg, progress, status),
                                                         ^

vim +370 drivers/fpga/intel-m10-bmc-sec-update.c

5cd339b370e29b Russ Weight   2022-06-06  353  
5cd339b370e29b Russ Weight   2022-06-06  354  static enum fw_upload_err rsu_update_init(struct m10bmc_sec *sec)
5cd339b370e29b Russ Weight   2022-06-06  355  {
6052a005caf9cd Ilpo Järvinen 2023-01-16  356  	const struct m10bmc_csr_map *csr_map = sec->m10bmc->info->csr_map;
001a734a55d09a Ilpo Järvinen 2023-01-16  357  	u32 doorbell_reg, progress, status;
001a734a55d09a Ilpo Järvinen 2023-01-16  358  	int ret, err;
5cd339b370e29b Russ Weight   2022-06-06  359  
5cd339b370e29b Russ Weight   2022-06-06  360  	ret = regmap_update_bits(sec->m10bmc->regmap,
6052a005caf9cd Ilpo Järvinen 2023-01-16  361  				 csr_map->base + csr_map->doorbell,
5cd339b370e29b Russ Weight   2022-06-06  362  				 DRBL_RSU_REQUEST | DRBL_HOST_STATUS,
5cd339b370e29b Russ Weight   2022-06-06  363  				 DRBL_RSU_REQUEST |
5cd339b370e29b Russ Weight   2022-06-06  364  				 FIELD_PREP(DRBL_HOST_STATUS,
5cd339b370e29b Russ Weight   2022-06-06  365  					    HOST_STATUS_IDLE));
5cd339b370e29b Russ Weight   2022-06-06  366  	if (ret)
5cd339b370e29b Russ Weight   2022-06-06  367  		return FW_UPLOAD_ERR_RW_ERROR;
5cd339b370e29b Russ Weight   2022-06-06  368  
001a734a55d09a Ilpo Järvinen 2023-01-16  369  	ret = read_poll_timeout(m10bmc_sec_progress_status, err,
001a734a55d09a Ilpo Järvinen 2023-01-16 @370  				err < 0 || rsu_start_done(doorbell_reg, progress, status),
5cd339b370e29b Russ Weight   2022-06-06  371  				NIOS_HANDSHAKE_INTERVAL_US,
001a734a55d09a Ilpo Järvinen 2023-01-16  372  				NIOS_HANDSHAKE_TIMEOUT_US,
001a734a55d09a Ilpo Järvinen 2023-01-16  373  				false,
001a734a55d09a Ilpo Järvinen 2023-01-16  374  				sec, &doorbell_reg, &progress, &status);
5cd339b370e29b Russ Weight   2022-06-06  375  
5cd339b370e29b Russ Weight   2022-06-06  376  	if (ret == -ETIMEDOUT) {
001a734a55d09a Ilpo Järvinen 2023-01-16  377  		log_error_regs(sec, doorbell_reg);
5cd339b370e29b Russ Weight   2022-06-06  378  		return FW_UPLOAD_ERR_TIMEOUT;
001a734a55d09a Ilpo Järvinen 2023-01-16  379  	} else if (err) {
5cd339b370e29b Russ Weight   2022-06-06  380  		return FW_UPLOAD_ERR_RW_ERROR;
5cd339b370e29b Russ Weight   2022-06-06  381  	}
5cd339b370e29b Russ Weight   2022-06-06  382  
5cd339b370e29b Russ Weight   2022-06-06  383  	if (status == RSU_STAT_WEAROUT) {
5cd339b370e29b Russ Weight   2022-06-06  384  		dev_warn(sec->dev, "Excessive flash update count detected\n");
5cd339b370e29b Russ Weight   2022-06-06  385  		return FW_UPLOAD_ERR_WEAROUT;
5cd339b370e29b Russ Weight   2022-06-06  386  	} else if (status == RSU_STAT_ERASE_FAIL) {
001a734a55d09a Ilpo Järvinen 2023-01-16  387  		log_error_regs(sec, doorbell_reg);
5cd339b370e29b Russ Weight   2022-06-06  388  		return FW_UPLOAD_ERR_HW_ERROR;
5cd339b370e29b Russ Weight   2022-06-06  389  	}
5cd339b370e29b Russ Weight   2022-06-06  390  
5cd339b370e29b Russ Weight   2022-06-06  391  	return FW_UPLOAD_ERR_NONE;
5cd339b370e29b Russ Weight   2022-06-06  392  }
5cd339b370e29b Russ Weight   2022-06-06  393  

:::::: The code at line 370 was first introduced by commit
:::::: 001a734a55d09aa1716eb2cd5ccab8b4d7a068a2 fpga: m10bmc-sec: Make rsu status type specific

:::::: TO: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

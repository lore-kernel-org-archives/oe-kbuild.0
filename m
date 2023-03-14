Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4F428EF
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Mar 2023 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678786470; x=1710322470;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kIwfBMgmXJdcFZ6qAJ5xJb78W30q/gYlAKJBCptN5G8=;
  b=WJSvcHTxU4j4YiP1yMKfTgcAgaPYuvcGA/JJS56DjC0KQ85QeM/w5V3S
   /Gih7H6buUiIDfC5+3ps/Uq3+FkbheK564HK2wjJ41CHionYx1Qw2yupY
   ++j8hn+jKcx98fMEi+5MCdpCtGQdh9VUOrPacEgL+ObNEbHh6yJ5IFFLg
   CRRMMuhjK740V+4nX7b4+Pqj34WESs3riCe0DeKqqHjoJutyzhUpjn1gQ
   f9bQQrRqbQ+OGimmKOEDPAkfa8koeMxF1VWxFpaOehluTIftefl86CTub
   jhBSTQfn5cl1jCRNr+gDCJrE6ZPJQgmCz8jERvZJxOZQsgc4E/hfUQ84C
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="339741406"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="339741406"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 02:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="802778373"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="802778373"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Mar 2023 02:34:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc135-0006lw-3A;
	Tue, 14 Mar 2023 09:34:27 +0000
Date: Tue, 14 Mar 2023 17:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/fpga/intel-m10-bmc-sec-update.c:370:31: warning:
 Uninitialized variable: doorbell_reg [uninitvar]
Message-ID: <202303141737.1IlNOtee-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/fpga/intel-m10-bmc-sec-update.c:370:31: warning: Uninitialized variable: doorbell_reg [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Lee Jones <lee@kernel.org>
CC: Tianfei zhang <tianfei.zhang@intel.com>
CC: Russ Weight <russell.h.weight@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc89d7fb499b0162e081f434d45e8d1b47e82ece
commit: 001a734a55d09aa1716eb2cd5ccab8b4d7a068a2 fpga: m10bmc-sec: Make rsu status type specific
date:   7 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 weeks ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 001a734a55d09aa1716eb2cd5ccab8b4d7a068a2
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303141737.1IlNOtee-lkp@intel.com/


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

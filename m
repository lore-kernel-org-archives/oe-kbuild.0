Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA101EA72
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Aug 2023 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691064987; x=1722600987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NZSPxpJfeRQjknYrP2ncpQtId0XXuEEquPQqrDPEkrg=;
  b=E3lVBBn5Wi5jC6Tg5xbf7ITV6/t3OWyVNz0ewwVcVbVOwE44ycF5tvYx
   8ec0dLC9n22O+66jSKAADz6RUv+WiFj4A+eTfq7AGwyR34+YdtjKd6mQ2
   oBEW3cGKh/Rb4IlAg8kPdkkjrqaKKXshIF5D1pdztxcoV6mlvtqbTiQ3x
   L7BBEvGQuS0bIPIW3yZD303zzBeQhPO727iV9SDrXtOdZeksWP1ev52AM
   CpjZf3Ttoydi6drTb+fC2TjLnvyL63g4CFEUc1o3a42FXCO5fmkaRROZx
   LRaSbvk2Vd+jAGA+thlCMATIu4kHG+GjK33CKqxo3WnzrBKNU0JyEZD8g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="400795174"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="400795174"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 05:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="732732316"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="732732316"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2023 05:16:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRXFg-00026R-1K;
	Thu, 03 Aug 2023 12:16:24 +0000
Date: Thu, 3 Aug 2023 20:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1937/6910] drivers/mtd/nand/raw/qcom_nandc.c:2941
 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
Message-ID: <202308032022.SnXkKyFs-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Md Sadre Alam <quic_mdalam@quicinc.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Sricharan Ramabadhran <quic_srichara@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fb4327106e5250ee360d0d8b056c1eef7eeb9a98
commit: 89550beb098e04b951df079483fb064eafc0e5fa [1937/6910] mtd: rawnand: qcom: Implement exec_op()
:::::: branch date: 8 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-m031-20230730 (https://download.01.org/0day-ci/archive/20230803/202308032022.SnXkKyFs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032022.SnXkKyFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/

New smatch warnings:
drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
drivers/mtd/nand/raw/qcom_nandc.c:3369 qcom_check_op() warn: was && intended here instead of ||?

Old smatch warnings:
drivers/mtd/nand/raw/qcom_nandc.c:3076 qcom_read_status_exec() warn: inconsistent indenting

vim +/ret +2941 drivers/mtd/nand/raw/qcom_nandc.c

c76b78d8ec05a2 drivers/mtd/nand/qcom_nandc.c     Archit Taneja 2016-02-03  2908  
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2909  static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 cmd,
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2910  			       struct qcom_op *q_op)
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2911  {
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2912  	int ret;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2913  
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2914  	switch (cmd) {
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2915  	case NAND_CMD_RESET:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2916  		ret = OP_RESET_DEVICE;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2917  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2918  	case NAND_CMD_READID:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2919  		ret = OP_FETCH_ID;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2920  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2921  	case NAND_CMD_PARAM:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2922  		if (nandc->props->qpic_v2)
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2923  			ret = OP_PAGE_READ_ONFI_READ;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2924  		else
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2925  			ret = OP_PAGE_READ;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2926  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2927  	case NAND_CMD_ERASE1:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2928  	case NAND_CMD_ERASE2:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2929  		ret = OP_BLOCK_ERASE;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2930  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2931  	case NAND_CMD_STATUS:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2932  		ret = OP_CHECK_STATUS;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2933  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2934  	case NAND_CMD_PAGEPROG:
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2935  		ret = OP_PROGRAM_PAGE;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2936  		q_op->flag = OP_PROGRAM_PAGE;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2937  		nandc->exec_opwrite = true;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2938  		break;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2939  	}
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2940  
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10 @2941  	return ret;
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2942  }
89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2943  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

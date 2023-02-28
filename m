Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C6A3D79
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 22:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677624116; x=1709160116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ql47Mp43WSKJuGr1EESoL52Ap3rIqPpZkzZf6+EcHqc=;
  b=KHI9M+lWzPD+lCNEzFqEwU3Fb82QjyvxfUCfkG4t2Zrgg+a86xjXDBnZ
   rRBJVDnbLQx0Qd05LCoHRTFrkikZvyacpBGKryD9fQMdSDqPT9aD8SKXK
   JcwAH4/r93IkioypCrkt4gkv9Kuif88/4Ceqj3nnvkzvoOAzn3P6GCB0K
   Rn8V6dyF6j7vNLpFcVQteRXCiYSI+wH7LIwX6K5VKF+EayYQuORO59wlb
   1NP5OI4l04BpT65qAUe+zNChMuKYGAusQ3Dnx1QHe3HealWSSlcTgD6Yj
   +HumLTbN3MespuZuLPGJFO9XsPfQ2Zn4aMPkqBbxMPpC+V0ninqC41mdt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="318066536"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="318066536"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 14:41:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="706742716"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="706742716"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Feb 2023 14:41:54 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX8fR-0005gZ-1A;
	Tue, 28 Feb 2023 22:41:53 +0000
Date: Wed, 1 Mar 2023 06:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/ufs/core/ufs-mcq.c:268:25: warning: Shifting signed 32-bit
 value by 31 bits is implementation-defined behaviour
 [shiftTooManyBitsSigned]
Message-ID: <202303010608.6jq8F2EG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/ufs/core/ufs-mcq.c:268:25: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Asutosh Das <quic_asutoshd@quicinc.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Can Guo <quic_cang@quicinc.com>
CC: Manivannan Sadhasivam <mani@kernel.org>
CC: Bart Van Assche <bvanassche@acm.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e492250d5252635b6c97d52eddf2792ec26f1ec1
commit: 2468da61ea095162067ed408824298ba9c3661c8 scsi: ufs: core: mcq: Configure operation and runtime interface
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 2468da61ea095162067ed408824298ba9c3661c8
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303010608.6jq8F2EG-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/ufs/core/ufs-mcq.c:268:25: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     ufsmcq_writel(hba, (1 << QUEUE_EN_OFFSET) | qsize,
                           ^
   drivers/ufs/core/ufs-mcq.c:275:25: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     ufsmcq_writel(hba, (1 << QUEUE_EN_OFFSET) | qsize |
                           ^
>> drivers/ufs/core/ufs-mcq.c:268:25: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     ufsmcq_writel(hba, (1 << QUEUE_EN_OFFSET) | qsize,
                           ^
   drivers/ufs/core/ufs-mcq.c:275:25: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     ufsmcq_writel(hba, (1 << QUEUE_EN_OFFSET) | qsize |
                           ^

vim +268 drivers/ufs/core/ufs-mcq.c

2468da61ea0951 Asutosh Das 2023-01-13  219  
2468da61ea0951 Asutosh Das 2023-01-13  220  void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
2468da61ea0951 Asutosh Das 2023-01-13  221  {
2468da61ea0951 Asutosh Das 2023-01-13  222  	struct ufs_hw_queue *hwq;
2468da61ea0951 Asutosh Das 2023-01-13  223  	u16 qsize;
2468da61ea0951 Asutosh Das 2023-01-13  224  	int i;
2468da61ea0951 Asutosh Das 2023-01-13  225  
2468da61ea0951 Asutosh Das 2023-01-13  226  	for (i = 0; i < hba->nr_hw_queues; i++) {
2468da61ea0951 Asutosh Das 2023-01-13  227  		hwq = &hba->uhq[i];
2468da61ea0951 Asutosh Das 2023-01-13  228  		hwq->id = i;
2468da61ea0951 Asutosh Das 2023-01-13  229  		qsize = hwq->max_entries * MCQ_ENTRY_SIZE_IN_DWORD - 1;
2468da61ea0951 Asutosh Das 2023-01-13  230  
2468da61ea0951 Asutosh Das 2023-01-13  231  		/* Submission Queue Lower Base Address */
2468da61ea0951 Asutosh Das 2023-01-13  232  		ufsmcq_writelx(hba, lower_32_bits(hwq->sqe_dma_addr),
2468da61ea0951 Asutosh Das 2023-01-13  233  			      MCQ_CFG_n(REG_SQLBA, i));
2468da61ea0951 Asutosh Das 2023-01-13  234  		/* Submission Queue Upper Base Address */
2468da61ea0951 Asutosh Das 2023-01-13  235  		ufsmcq_writelx(hba, upper_32_bits(hwq->sqe_dma_addr),
2468da61ea0951 Asutosh Das 2023-01-13  236  			      MCQ_CFG_n(REG_SQUBA, i));
2468da61ea0951 Asutosh Das 2023-01-13  237  		/* Submission Queue Doorbell Address Offset */
2468da61ea0951 Asutosh Das 2023-01-13  238  		ufsmcq_writelx(hba, MCQ_OPR_OFFSET_n(OPR_SQD, i),
2468da61ea0951 Asutosh Das 2023-01-13  239  			      MCQ_CFG_n(REG_SQDAO, i));
2468da61ea0951 Asutosh Das 2023-01-13  240  		/* Submission Queue Interrupt Status Address Offset */
2468da61ea0951 Asutosh Das 2023-01-13  241  		ufsmcq_writelx(hba, MCQ_OPR_OFFSET_n(OPR_SQIS, i),
2468da61ea0951 Asutosh Das 2023-01-13  242  			      MCQ_CFG_n(REG_SQISAO, i));
2468da61ea0951 Asutosh Das 2023-01-13  243  
2468da61ea0951 Asutosh Das 2023-01-13  244  		/* Completion Queue Lower Base Address */
2468da61ea0951 Asutosh Das 2023-01-13  245  		ufsmcq_writelx(hba, lower_32_bits(hwq->cqe_dma_addr),
2468da61ea0951 Asutosh Das 2023-01-13  246  			      MCQ_CFG_n(REG_CQLBA, i));
2468da61ea0951 Asutosh Das 2023-01-13  247  		/* Completion Queue Upper Base Address */
2468da61ea0951 Asutosh Das 2023-01-13  248  		ufsmcq_writelx(hba, upper_32_bits(hwq->cqe_dma_addr),
2468da61ea0951 Asutosh Das 2023-01-13  249  			      MCQ_CFG_n(REG_CQUBA, i));
2468da61ea0951 Asutosh Das 2023-01-13  250  		/* Completion Queue Doorbell Address Offset */
2468da61ea0951 Asutosh Das 2023-01-13  251  		ufsmcq_writelx(hba, MCQ_OPR_OFFSET_n(OPR_CQD, i),
2468da61ea0951 Asutosh Das 2023-01-13  252  			      MCQ_CFG_n(REG_CQDAO, i));
2468da61ea0951 Asutosh Das 2023-01-13  253  		/* Completion Queue Interrupt Status Address Offset */
2468da61ea0951 Asutosh Das 2023-01-13  254  		ufsmcq_writelx(hba, MCQ_OPR_OFFSET_n(OPR_CQIS, i),
2468da61ea0951 Asutosh Das 2023-01-13  255  			      MCQ_CFG_n(REG_CQISAO, i));
2468da61ea0951 Asutosh Das 2023-01-13  256  
2468da61ea0951 Asutosh Das 2023-01-13  257  		/* Save the base addresses for quicker access */
2468da61ea0951 Asutosh Das 2023-01-13  258  		hwq->mcq_sq_head = mcq_opr_base(hba, OPR_SQD, i) + REG_SQHP;
2468da61ea0951 Asutosh Das 2023-01-13  259  		hwq->mcq_sq_tail = mcq_opr_base(hba, OPR_SQD, i) + REG_SQTP;
2468da61ea0951 Asutosh Das 2023-01-13  260  		hwq->mcq_cq_head = mcq_opr_base(hba, OPR_CQD, i) + REG_CQHP;
2468da61ea0951 Asutosh Das 2023-01-13  261  		hwq->mcq_cq_tail = mcq_opr_base(hba, OPR_CQD, i) + REG_CQTP;
2468da61ea0951 Asutosh Das 2023-01-13  262  
2468da61ea0951 Asutosh Das 2023-01-13  263  		/* Enable Tail Entry Push Status interrupt only for non-poll queues */
2468da61ea0951 Asutosh Das 2023-01-13  264  		if (i < hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL])
2468da61ea0951 Asutosh Das 2023-01-13  265  			writel(1, mcq_opr_base(hba, OPR_CQIS, i) + REG_CQIE);
2468da61ea0951 Asutosh Das 2023-01-13  266  
2468da61ea0951 Asutosh Das 2023-01-13  267  		/* Completion Queue Enable|Size to Completion Queue Attribute */
2468da61ea0951 Asutosh Das 2023-01-13 @268  		ufsmcq_writel(hba, (1 << QUEUE_EN_OFFSET) | qsize,
2468da61ea0951 Asutosh Das 2023-01-13  269  			      MCQ_CFG_n(REG_CQATTR, i));
2468da61ea0951 Asutosh Das 2023-01-13  270  
2468da61ea0951 Asutosh Das 2023-01-13  271  		/*
2468da61ea0951 Asutosh Das 2023-01-13  272  		 * Submission Qeueue Enable|Size|Completion Queue ID to
2468da61ea0951 Asutosh Das 2023-01-13  273  		 * Submission Queue Attribute
2468da61ea0951 Asutosh Das 2023-01-13  274  		 */
2468da61ea0951 Asutosh Das 2023-01-13  275  		ufsmcq_writel(hba, (1 << QUEUE_EN_OFFSET) | qsize |
2468da61ea0951 Asutosh Das 2023-01-13  276  			      (i << QUEUE_ID_OFFSET),
2468da61ea0951 Asutosh Das 2023-01-13  277  			      MCQ_CFG_n(REG_SQATTR, i));
2468da61ea0951 Asutosh Das 2023-01-13  278  	}
2468da61ea0951 Asutosh Das 2023-01-13  279  }
2468da61ea0951 Asutosh Das 2023-01-13  280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

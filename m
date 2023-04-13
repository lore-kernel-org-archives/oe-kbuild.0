Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934212C9C
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Apr 2023 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681388513; x=1712924513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mhXvABAhOpF9+9RhCLoKWJ7xNdirNXPBMJ0qVZrXToM=;
  b=fYdZgHm/+OwOkcxPTu0KiZH4/tDSjeJq3AcrcbV+8EdVE8ilVTLuzsVU
   aisq4d3JS+UkC8z8kWtpShhiHMuVk8nqNjNcC8OX80iZrM1Bu1iQsAOIp
   ote4wl6/UT/ndHdVcN82DNVn+2nmnWlc3zQufi8JXMGBB1IflLjClnX9r
   MzZB17Xc4FZxZZclHf1Uq2X3cWadet4Hux3oDygQNgsp5ZT2yIe9aRFoH
   F+Npi9EXTHT5kFOMsbuRdKfcZcPbuYg92AVgiF86uE1Yz7QAfn2aD2DLn
   2E/qaTTaz3hClzzZM/ZJyL3Eg1z0HSAKQGc/XI2NFbDXplNDPRPcHCsKY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="328284117"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; 
   d="scan'208";a="328284117"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 05:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639654989"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; 
   d="scan'208";a="639654989"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 05:21:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmvxU-000Yfv-15;
	Thu, 13 Apr 2023 12:21:48 +0000
Date: Thu, 13 Apr 2023 20:21:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse:
 dubious: x & !y
Message-ID: <202304132021.HuNFnDuw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Wenpeng Liang <liangwenpeng@huawei.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de4664485abbc0529b1eec44d0061bbfe58a28fb
commit: 82600b2d3cd57428bdb03c66ae67708d3c8f7281 RDMA/hns: Use hr_reg_xxx() instead of remaining roce_set_xxx()
date:   11 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-s052-20230413 (https://download.01.org/0day-ci/archive/20230413/202304132021.HuNFnDuw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=82600b2d3cd57428bdb03c66ae67708d3c8f7281
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 82600b2d3cd57428bdb03c66ae67708d3c8f7281
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/infiniband/hw/hns/ drivers/remoteproc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304132021.HuNFnDuw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:460:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:462:9: sparse: sparse: dubious: x & !y

vim +309 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

30b707886aeb89e Weihang Li    2020-09-10  294  
30b707886aeb89e Weihang Li    2020-09-10  295  static int set_rwqe_data_seg(struct ib_qp *ibqp, const struct ib_send_wr *wr,
30b707886aeb89e Weihang Li    2020-09-10  296  			     struct hns_roce_v2_rc_send_wqe *rc_sq_wqe,
30b707886aeb89e Weihang Li    2020-09-10  297  			     unsigned int *sge_ind,
30b707886aeb89e Weihang Li    2020-09-10  298  			     unsigned int valid_num_sge)
30b707886aeb89e Weihang Li    2020-09-10  299  {
30b707886aeb89e Weihang Li    2020-09-10  300  	struct hns_roce_v2_wqe_data_seg *dseg =
30b707886aeb89e Weihang Li    2020-09-10  301  		(void *)rc_sq_wqe + sizeof(struct hns_roce_v2_rc_send_wqe);
30b707886aeb89e Weihang Li    2020-09-10  302  	struct hns_roce_qp *qp = to_hr_qp(ibqp);
30b707886aeb89e Weihang Li    2020-09-10  303  	int j = 0;
30b707886aeb89e Weihang Li    2020-09-10  304  	int i;
30b707886aeb89e Weihang Li    2020-09-10  305  
82600b2d3cd5742 Wenpeng Liang 2022-05-12  306  	hr_reg_write(rc_sq_wqe, RC_SEND_WQE_MSG_START_SGE_IDX,
30b707886aeb89e Weihang Li    2020-09-10  307  		     (*sge_ind) & (qp->sge.sge_cnt - 1));
30b707886aeb89e Weihang Li    2020-09-10  308  
82600b2d3cd5742 Wenpeng Liang 2022-05-12 @309  	hr_reg_write(rc_sq_wqe, RC_SEND_WQE_INLINE,
e13026578b727be Lang Cheng    2021-06-18  310  		     !!(wr->send_flags & IB_SEND_INLINE));
30b707886aeb89e Weihang Li    2020-09-10  311  	if (wr->send_flags & IB_SEND_INLINE)
30b707886aeb89e Weihang Li    2020-09-10  312  		return set_rc_inl(qp, wr, rc_sq_wqe, sge_ind);
30b707886aeb89e Weihang Li    2020-09-10  313  
54d6638765b0ede Xi Wang       2020-04-28  314  	if (valid_num_sge <= HNS_ROCE_SGE_IN_WQE) {
7bdee4158b37784 oulijun       2018-01-10  315  		for (i = 0; i < wr->num_sge; i++) {
7bdee4158b37784 oulijun       2018-01-10  316  			if (likely(wr->sg_list[i].length)) {
7bdee4158b37784 oulijun       2018-01-10  317  				set_data_seg_v2(dseg, wr->sg_list + i);
7bdee4158b37784 oulijun       2018-01-10  318  				dseg++;
7bdee4158b37784 oulijun       2018-01-10  319  			}
7bdee4158b37784 oulijun       2018-01-10  320  		}
7bdee4158b37784 oulijun       2018-01-10  321  	} else {
30b707886aeb89e Weihang Li    2020-09-10  322  		for (i = 0; i < wr->num_sge && j < HNS_ROCE_SGE_IN_WQE; i++) {
7bdee4158b37784 oulijun       2018-01-10  323  			if (likely(wr->sg_list[i].length)) {
7bdee4158b37784 oulijun       2018-01-10  324  				set_data_seg_v2(dseg, wr->sg_list + i);
7bdee4158b37784 oulijun       2018-01-10  325  				dseg++;
468d020e2f02867 Lijun Ou      2020-01-09  326  				j++;
7bdee4158b37784 oulijun       2018-01-10  327  			}
7bdee4158b37784 oulijun       2018-01-10  328  		}
7bdee4158b37784 oulijun       2018-01-10  329  
0fd0175e30e487f Lang Cheng    2020-11-28  330  		set_extend_sge(qp, wr->sg_list + i, sge_ind,
0fd0175e30e487f Lang Cheng    2020-11-28  331  			       valid_num_sge - HNS_ROCE_SGE_IN_WQE);
7bdee4158b37784 oulijun       2018-01-10  332  	}
7bdee4158b37784 oulijun       2018-01-10  333  
82600b2d3cd5742 Wenpeng Liang 2022-05-12  334  	hr_reg_write(rc_sq_wqe, RC_SEND_WQE_SGE_NUM, valid_num_sge);
7bdee4158b37784 oulijun       2018-01-10  335  
7bdee4158b37784 oulijun       2018-01-10  336  	return 0;
7bdee4158b37784 oulijun       2018-01-10  337  }
7bdee4158b37784 oulijun       2018-01-10  338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

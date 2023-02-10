Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFDE7F8
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Feb 2023 04:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676004503; x=1707540503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=trT/0Nw3yJxcGmxQulLyxazGy08k4KTNjgGdIslvu14=;
  b=VGRpXa317ymxWGWvMlqocRQq1ApMnIM8VgnXdqBmRYpC/uitisBo1XUz
   GJLvYlQO3bk/36uhfeLStMfBKZtcl6ZHgMbDW0sLGJvLAndjOjsxoYLM+
   rZIu5xC1vVXj8T9VoEf+V5r2rgwN4WxYl4Co7Aj9Ak4gzNj+XD9Hx3oqD
   +V5NeN6e+oiaiOxf8tc05xak6yjZh+JNu8qcBIMlJFOFsAWWuBMITy722
   rc8qjMX8BRaxDzLf1iAtSSQ8wD/wcbeLOha2XUj1iZ3EBSpkg+ofwtGAA
   7kI8IDo9vdjeoD3JHvZ0wbqTn6A/XgJ/wN/zkeY2ZqC+0Wr08b2NxoVAO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="392736654"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="392736654"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 20:48:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="669870389"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="669870389"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Feb 2023 20:48:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQLKe-0005Yk-1z;
	Fri, 10 Feb 2023 04:48:20 +0000
Date: Fri, 10 Feb 2023 12:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse:
 dubious: x & !y
Message-ID: <202302101245.EXTYkZSJ-lkp@intel.com>
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
head:   38c1e0c65865426676123cc9a127526fa02bcac6
commit: 82600b2d3cd57428bdb03c66ae67708d3c8f7281 RDMA/hns: Use hr_reg_xxx() instead of remaining roce_set_xxx()
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-s043-20230208 (https://download.01.org/0day-ci/archive/20230210/202302101245.EXTYkZSJ-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/infiniband/hw/hns/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302101245.EXTYkZSJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:460:9: sparse: sparse: dubious: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:462:9: sparse: sparse: dubious: x & !y

vim +309 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

30b707886aeb89 Weihang Li    2020-09-10  294  
30b707886aeb89 Weihang Li    2020-09-10  295  static int set_rwqe_data_seg(struct ib_qp *ibqp, const struct ib_send_wr *wr,
30b707886aeb89 Weihang Li    2020-09-10  296  			     struct hns_roce_v2_rc_send_wqe *rc_sq_wqe,
30b707886aeb89 Weihang Li    2020-09-10  297  			     unsigned int *sge_ind,
30b707886aeb89 Weihang Li    2020-09-10  298  			     unsigned int valid_num_sge)
30b707886aeb89 Weihang Li    2020-09-10  299  {
30b707886aeb89 Weihang Li    2020-09-10  300  	struct hns_roce_v2_wqe_data_seg *dseg =
30b707886aeb89 Weihang Li    2020-09-10  301  		(void *)rc_sq_wqe + sizeof(struct hns_roce_v2_rc_send_wqe);
30b707886aeb89 Weihang Li    2020-09-10  302  	struct hns_roce_qp *qp = to_hr_qp(ibqp);
30b707886aeb89 Weihang Li    2020-09-10  303  	int j = 0;
30b707886aeb89 Weihang Li    2020-09-10  304  	int i;
30b707886aeb89 Weihang Li    2020-09-10  305  
82600b2d3cd574 Wenpeng Liang 2022-05-12  306  	hr_reg_write(rc_sq_wqe, RC_SEND_WQE_MSG_START_SGE_IDX,
30b707886aeb89 Weihang Li    2020-09-10  307  		     (*sge_ind) & (qp->sge.sge_cnt - 1));
30b707886aeb89 Weihang Li    2020-09-10  308  
82600b2d3cd574 Wenpeng Liang 2022-05-12 @309  	hr_reg_write(rc_sq_wqe, RC_SEND_WQE_INLINE,
e13026578b727b Lang Cheng    2021-06-18  310  		     !!(wr->send_flags & IB_SEND_INLINE));
30b707886aeb89 Weihang Li    2020-09-10  311  	if (wr->send_flags & IB_SEND_INLINE)
30b707886aeb89 Weihang Li    2020-09-10  312  		return set_rc_inl(qp, wr, rc_sq_wqe, sge_ind);
30b707886aeb89 Weihang Li    2020-09-10  313  
54d6638765b0ed Xi Wang       2020-04-28  314  	if (valid_num_sge <= HNS_ROCE_SGE_IN_WQE) {
7bdee4158b3778 oulijun       2018-01-10  315  		for (i = 0; i < wr->num_sge; i++) {
7bdee4158b3778 oulijun       2018-01-10  316  			if (likely(wr->sg_list[i].length)) {
7bdee4158b3778 oulijun       2018-01-10  317  				set_data_seg_v2(dseg, wr->sg_list + i);
7bdee4158b3778 oulijun       2018-01-10  318  				dseg++;
7bdee4158b3778 oulijun       2018-01-10  319  			}
7bdee4158b3778 oulijun       2018-01-10  320  		}
7bdee4158b3778 oulijun       2018-01-10  321  	} else {
30b707886aeb89 Weihang Li    2020-09-10  322  		for (i = 0; i < wr->num_sge && j < HNS_ROCE_SGE_IN_WQE; i++) {
7bdee4158b3778 oulijun       2018-01-10  323  			if (likely(wr->sg_list[i].length)) {
7bdee4158b3778 oulijun       2018-01-10  324  				set_data_seg_v2(dseg, wr->sg_list + i);
7bdee4158b3778 oulijun       2018-01-10  325  				dseg++;
468d020e2f0286 Lijun Ou      2020-01-09  326  				j++;
7bdee4158b3778 oulijun       2018-01-10  327  			}
7bdee4158b3778 oulijun       2018-01-10  328  		}
7bdee4158b3778 oulijun       2018-01-10  329  
0fd0175e30e487 Lang Cheng    2020-11-28  330  		set_extend_sge(qp, wr->sg_list + i, sge_ind,
0fd0175e30e487 Lang Cheng    2020-11-28  331  			       valid_num_sge - HNS_ROCE_SGE_IN_WQE);
7bdee4158b3778 oulijun       2018-01-10  332  	}
7bdee4158b3778 oulijun       2018-01-10  333  
82600b2d3cd574 Wenpeng Liang 2022-05-12  334  	hr_reg_write(rc_sq_wqe, RC_SEND_WQE_SGE_NUM, valid_num_sge);
7bdee4158b3778 oulijun       2018-01-10  335  
7bdee4158b3778 oulijun       2018-01-10  336  	return 0;
7bdee4158b3778 oulijun       2018-01-10  337  }
7bdee4158b3778 oulijun       2018-01-10  338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DDB3C20
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674059400; x=1705595400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MsSowp0fZG7SvWLVGot1JuBF0UDUlUNiZPJGHa4jfVI=;
  b=Am5S8+10ldLntYLH/4jY4wyHsTF8wFRFvdxNqW6fTXp1EKcT5AdKTGKR
   KeCtqOY0RL6hHf3T8AkhyGGKuI7C+CdOvxtyxtxBGrGyAB7sz3Ba0pvqT
   UyxPhzgl38tNNWqAAdHx2E7zrv9tnitnc+shRiHJO7jFzZKoba34hlpjE
   3b3DBvjEZe83O3miUOdqg8lmEdIrbukq2w907CpnUIbGzbM2IKhEbFYhC
   ke483AkNAjYL/XzYjkM/uScSxnYIWThQwjRFaUpom4tLOGi7oo55jN5SL
   05R6v8vk0ljZzWpOUEL8BZFQTFZyfGO5hrQzbYr7/XihGMTtRoPQeAzJ6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323709467"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323709467"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="802252396"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="802252396"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2023 08:29:56 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIBJz-0000Vh-28;
	Wed, 18 Jan 2023 16:29:55 +0000
Date: Thu, 19 Jan 2023 00:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202301190034.3d7glfRb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Justin Stitt <jstitt007@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7 include/uapi/linux/swab.h: move explicit cast outside ternary
date:   7 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 months ago
config: arc-randconfig-s042-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190034.3d7glfRb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash drivers/scsi/bnx2fc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] context_id @@     got unsigned int [usertype] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:410:29: sparse:     got unsigned int [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:411:26: sparse:     got unsigned int [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] context_id @@     got unsigned int [usertype] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:469:32: sparse:     got unsigned int [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:470:29: sparse:     got unsigned int [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] context_id @@     got unsigned int [usertype] context_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:504:32: sparse:     got unsigned int [usertype] context_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_id @@     got unsigned int [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:505:29: sparse:     got unsigned int [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] fr_crc @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     expected unsigned int [usertype] fr_crc
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:613:28: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:695:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] xid @@     got restricted __le16 [usertype] ox_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:695:21: sparse:     expected unsigned short [usertype] xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:695:21: sparse:     got restricted __le16 [usertype] ox_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:727:27: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:728:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:23: sparse: sparse: cast from restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] xid @@     got restricted __be16 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:21: sparse:     expected unsigned short [usertype] xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:807:21: sparse:     got restricted __be16 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:821:27: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:822:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:886:45: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:963:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] doorbell_cq_cons @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:963:33: sparse:     expected restricted __le16 [usertype] doorbell_cq_cons
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:963:33: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:9: sparse:     expected unsigned int [usertype] val
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:9: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1019:43: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1089:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] wqe @@     got restricted __le16 [usertype] wqe @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1089:22: sparse:     expected unsigned short [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1089:22: sparse:     got restricted __le16 [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1253:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] conn_id @@     got restricted __le32 [usertype] fcoe_conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1253:17: sparse:     expected unsigned int [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1253:17: sparse:     got restricted __le32 [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1369:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] err_code @@     got restricted __le32 [usertype] completion_status @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1369:53: sparse:     expected unsigned int [usertype] err_code
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1369:53: sparse:     got restricted __le32 [usertype] completion_status
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1420:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] wqe @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1420:18: sparse:     expected restricted __le16 [usertype] wqe
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1420:18: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1421:18: sparse: sparse: invalid assignment: |=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1421:18: sparse:    left side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1421:18: sparse:    right side has type int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:9: sparse:     expected unsigned int [usertype] val
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:9: sparse:     got restricted __le32 [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:9: sparse: sparse: cast from restricted __le32
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1522:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1522:46: sparse:     expected restricted __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1522:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1524:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1524:46: sparse:     expected restricted __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1524:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1527:63: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cleaned_task_id @@     got unsigned short [usertype] orig_xid @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1527:63: sparse:     expected restricted __le16 [usertype] cleaned_task_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1527:63: sparse:     got unsigned short [usertype] orig_xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1530:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] rolled_tx_data_offset @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1530:69: sparse:     expected restricted __le32 [usertype] rolled_tx_data_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1530:69: sparse:     got unsigned int [usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1536:35: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1538:24: sparse: sparse: invalid assignment: -=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1538:24: sparse:    left side has type unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1538:24: sparse:    right side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1543:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1543:69: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1543:69: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1545:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1545:69: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1545:69: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1549:65: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cur_sge_off @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1549:65: sparse:     expected restricted __le16 [usertype] cur_sge_off
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1549:65: sparse:     got unsigned int [usertype] offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1556:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1556:46: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1556:46: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1557:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1557:46: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1557:46: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1559:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cur_sge_off @@     got unsigned int [usertype] offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1559:42: sparse:     expected restricted __le16 [usertype] cur_sge_off
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1559:42: sparse:     got unsigned int [usertype] offset
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] low_exp_ro @@     got unsigned int [usertype] orig_offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse:     expected restricted __le32 [usertype] low_exp_ro
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse:     got unsigned int [usertype] orig_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1565:56: sparse: sparse: too many warnings

vim +1564 drivers/scsi/bnx2fc/bnx2fc_hwi.c

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1487  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1488  void bnx2fc_init_seq_cleanup_task(struct bnx2fc_cmd *seq_clnp_req,
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1489  				  struct fcoe_task_ctx_entry *task,
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1490  				  struct bnx2fc_cmd *orig_io_req,
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1491  				  u32 offset)
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1492  {
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1493  	struct scsi_cmnd *sc_cmd = orig_io_req->sc_cmd;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1494  	struct bnx2fc_rport *tgt = seq_clnp_req->tgt;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1495  	struct fcoe_bd_ctx *bd = orig_io_req->bd_tbl->bd_tbl;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1496  	struct fcoe_ext_mul_sges_ctx *sgl;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1497  	u8 task_type = FCOE_TASK_TYPE_SEQUENCE_CLEANUP;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1498  	u8 orig_task_type;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1499  	u16 orig_xid = orig_io_req->xid;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1500  	u32 context_id = tgt->context_id;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1501  	u64 phys_addr = (u64)orig_io_req->bd_tbl->bd_tbl_dma;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1502  	u32 orig_offset = offset;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1503  	int bd_count;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1504  	int i;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1505  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1506  	memset(task, 0, sizeof(struct fcoe_task_ctx_entry));
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1507  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1508  	if (sc_cmd->sc_data_direction == DMA_TO_DEVICE)
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1509  		orig_task_type = FCOE_TASK_TYPE_WRITE;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1510  	else
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1511  		orig_task_type = FCOE_TASK_TYPE_READ;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1512  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1513  	/* Tx flags */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1514  	task->txwr_rxrd.const_ctx.tx_flags =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1515  				FCOE_TASK_TX_STATE_SEQUENCE_CLEANUP <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1516  				FCOE_TCE_TX_WR_RX_RD_CONST_TX_STATE_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1517  	/* init flags */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1518  	task->txwr_rxrd.const_ctx.init_flags = task_type <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1519  				FCOE_TCE_TX_WR_RX_RD_CONST_TASK_TYPE_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1520  	task->txwr_rxrd.const_ctx.init_flags |= FCOE_TASK_CLASS_TYPE_3 <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1521  				FCOE_TCE_TX_WR_RX_RD_CONST_CLASS_TYPE_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1522  	task->rxwr_txrd.const_ctx.init_flags = context_id <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1523  				FCOE_TCE_RX_WR_TX_RD_CONST_CID_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1524  	task->rxwr_txrd.const_ctx.init_flags = context_id <<
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1525  				FCOE_TCE_RX_WR_TX_RD_CONST_CID_SHIFT;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1526  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1527  	task->txwr_rxrd.union_ctx.cleanup.ctx.cleaned_task_id = orig_xid;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1528  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1529  	task->txwr_rxrd.union_ctx.cleanup.ctx.rolled_tx_seq_cnt = 0;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1530  	task->txwr_rxrd.union_ctx.cleanup.ctx.rolled_tx_data_offset = offset;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1531  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1532  	bd_count = orig_io_req->bd_tbl->bd_valid;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1533  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1534  	/* obtain the appropriate bd entry from relative offset */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1535  	for (i = 0; i < bd_count; i++) {
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1536  		if (offset < bd[i].buf_len)
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1537  			break;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1538  		offset -= bd[i].buf_len;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1539  	}
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1540  	phys_addr += (i * sizeof(struct fcoe_bd_ctx));
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1541  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1542  	if (orig_task_type == FCOE_TASK_TYPE_WRITE) {
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1543  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_addr.lo =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1544  				(u32)phys_addr;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1545  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_addr.hi =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1546  				(u32)((u64)phys_addr >> 32);
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1547  		task->txwr_only.sgl_ctx.sgl.mul_sgl.sgl_size =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1548  				bd_count;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1549  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_off =
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1550  				offset; /* adjusted offset */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1551  		task->txwr_only.sgl_ctx.sgl.mul_sgl.cur_sge_idx = i;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1552  	} else {
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1553  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1554  		/* Multiple SGEs were used for this IO */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1555  		sgl = &task->rxwr_only.union_ctx.read_info.sgl_ctx.sgl;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1556  		sgl->mul_sgl.cur_sge_addr.lo = (u32)phys_addr;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1557  		sgl->mul_sgl.cur_sge_addr.hi = (u32)((u64)phys_addr >> 32);
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1558  		sgl->mul_sgl.sgl_size = bd_count;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1559  		sgl->mul_sgl.cur_sge_off = offset; /*adjusted offset */
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1560  		sgl->mul_sgl.cur_sge_idx = i;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1561  
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1562  		memset(&task->rxwr_only.rx_seq_ctx, 0,
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1563  		       sizeof(struct fcoe_rx_seq_ctx));
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27 @1564  		task->rxwr_only.rx_seq_ctx.low_exp_ro = orig_offset;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1565  		task->rxwr_only.rx_seq_ctx.high_exp_ro = orig_offset;
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1566  	}
6c5a7ce4f176b6 Bhanu Prakash Gollapudi 2011-07-27  1567  }
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1568  void bnx2fc_init_cleanup_task(struct bnx2fc_cmd *io_req,
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1569  			      struct fcoe_task_ctx_entry *task,
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1570  			      u16 orig_xid)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1571  {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1572  	u8 task_type = FCOE_TASK_TYPE_EXCHANGE_CLEANUP;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1573  	struct bnx2fc_rport *tgt = io_req->tgt;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1574  	u32 context_id = tgt->context_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1575  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1576  	memset(task, 0, sizeof(struct fcoe_task_ctx_entry));
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1577  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1578  	/* Tx Write Rx Read */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1579  	/* init flags */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1580  	task->txwr_rxrd.const_ctx.init_flags = task_type <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1581  				FCOE_TCE_TX_WR_RX_RD_CONST_TASK_TYPE_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1582  	task->txwr_rxrd.const_ctx.init_flags |= FCOE_TASK_CLASS_TYPE_3 <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1583  				FCOE_TCE_TX_WR_RX_RD_CONST_CLASS_TYPE_SHIFT;
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1584  	if (tgt->dev_type == TYPE_TAPE)
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1585  		task->txwr_rxrd.const_ctx.init_flags |=
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1586  				FCOE_TASK_DEV_TYPE_TAPE <<
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1587  				FCOE_TCE_TX_WR_RX_RD_CONST_DEV_TYPE_SHIFT;
f3820b719d91a0 Bhanu Prakash Gollapudi 2011-07-27  1588  	else
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1589  		task->txwr_rxrd.const_ctx.init_flags |=
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1590  				FCOE_TASK_DEV_TYPE_DISK <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1591  				FCOE_TCE_TX_WR_RX_RD_CONST_DEV_TYPE_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1592  	task->txwr_rxrd.union_ctx.cleanup.ctx.cleaned_task_id = orig_xid;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1593  
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1594  	/* Tx flags */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1595  	task->txwr_rxrd.const_ctx.tx_flags =
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1596  				FCOE_TASK_TX_STATE_EXCHANGE_CLEANUP <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1597  				FCOE_TCE_TX_WR_RX_RD_CONST_TX_STATE_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1598  
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1599  	/* Rx Read Tx Write */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1600  	task->rxwr_txrd.const_ctx.init_flags = context_id <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1601  				FCOE_TCE_RX_WR_TX_RD_CONST_CID_SHIFT;
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1602  	task->rxwr_txrd.var_ctx.rx_flags |= 1 <<
619c5cb6885b93 Vlad Zolotarov          2011-06-14  1603  				FCOE_TCE_RX_WR_TX_RD_VAR_EXP_FIRST_FRAME_SHIFT;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1604  }
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  1605  

:::::: The code at line 1564 was first introduced by commit
:::::: 6c5a7ce4f176b641fd11e59be4df31ee3e6202dd [SCSI] bnx2fc: Support 'sequence cleanup' task

:::::: TO: Bhanu Prakash Gollapudi <bprakash@broadcom.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

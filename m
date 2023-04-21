Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2326FD7
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Apr 2023 20:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682110585; x=1713646585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EMkoED/2tGCg9mJ7BDa0UrOQMwiSORXaD5nGyut9BvA=;
  b=JGxwA693MoHo0LA+vwy+KY9P37uiITQ13GVNeJQzlIib9+jVgsS6Ms+g
   eF3ISqCK60HKrDiLBxENkx4t64dN9fepPsx8HxjHg1cesAnIqDb7dE9Nd
   L6nmIqLDSBI2ombAn2C8obnz+MiGBUuMGc0R+j4pNwbWS5KGHJ6lRbaRj
   Mz7p48BIA2I8m2YG+9/eWRjzXGcUlZrca48r+X5h/tvCR3rEzahV5Ii0S
   L1ODdQmTI9vjw4l6j4JtNQK0iMU9vyxKVWymNKda/dAyaIEZuA0WQX3ol
   CJQL4DdVhGX7RV95JhcMEcxp/ocZFwLXJriNPxTSsq/ybjcj983+XVO8G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="374015690"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="374015690"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 13:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="692399617"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="692399617"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Apr 2023 13:56:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppxnq-000gnk-1w;
	Fri, 21 Apr 2023 20:56:22 +0000
Date: Sat, 22 Apr 2023 04:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/qedi/qedi_fw.c:1460:31: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202304220437.ItinKtrg-lkp@intel.com>
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
head:   c337b23f32c87320dffd389e4f0f793db35f0a9b
commit: d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7 include/uapi/linux/swab.h: move explicit cast outside ternary
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: alpha-randconfig-s032-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220437.ItinKtrg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/md/ drivers/scsi/qedi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304220437.ItinKtrg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/qedi/qedi_fw.c:1459:30: sparse: sparse: cast to restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:1459:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1459:28: sparse:     expected restricted __le32 [addressable] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1459:28: sparse:     got unsigned int [usertype]
>> drivers/scsi/qedi/qedi_fw.c:1460:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1460:31: sparse:     expected restricted __le32 [addressable] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1460:31: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1463:33: sparse: sparse: cast to restricted __be32
>> drivers/scsi/qedi/qedi_fw.c:1463:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1463:31: sparse:     expected restricted __le32 [addressable] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1463:31: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted __be32
   drivers/scsi/qedi/qedi_fw.c:1464:33: sparse: sparse: cast to restricted __be32
>> drivers/scsi/qedi/qedi_fw.c:1464:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1464:31: sparse:     expected restricted __le32 [addressable] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1464:31: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1469:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] rtt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1469:36: sparse:     expected restricted __le32 [addressable] [usertype] rtt
   drivers/scsi/qedi/qedi_fw.c:1469:36: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1473:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] rtt @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1473:36: sparse:     expected restricted __le32 [addressable] [usertype] rtt
   drivers/scsi/qedi/qedi_fw.c:1473:36: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:1478:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1478:41: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1478:41: sparse:     got int
>> drivers/scsi/qedi/qedi_fw.c:1479:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] ref_cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1479:35: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] ref_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1479:35: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:50:25: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] stat_sn @@
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse:     got restricted __le32 [usertype] stat_sn
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] exp_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse:     got restricted __le32 [usertype] exp_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] max_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse:     got restricted __le32 [usertype] max_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le16 [usertype] time_2_wait @@
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse:     got restricted __le16 [usertype] time_2_wait
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] t2wait @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     expected restricted __be16 [usertype] t2wait
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     got restricted __be32 [usertype]
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le16 [usertype] time_2_retain @@
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse:     got restricted __le16 [usertype] time_2_retain
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:56:30: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:56:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] t2retain @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:56:28: sparse:     expected restricted __be16 [usertype] t2retain
   drivers/scsi/qedi/qedi_fw.c:56:28: sparse:     got restricted __be32 [usertype]
   drivers/scsi/qedi/qedi_fw.c:105:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:105:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:105:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:109:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:111:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ttt @@     got restricted __le32 [usertype] ttt @@
   drivers/scsi/qedi/qedi_fw.c:111:27: sparse:     expected restricted __be32 [usertype] ttt
   drivers/scsi/qedi/qedi_fw.c:111:27: sparse:     got restricted __le32 [usertype] ttt
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] stat_sn @@
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse:     got restricted __le32 [usertype] stat_sn
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] exp_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse:     got restricted __le32 [usertype] exp_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] max_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse:     got restricted __le32 [usertype] max_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:116:36: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:211:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:211:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:211:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:214:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] stat_sn @@
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse:     got restricted __le32 [usertype] stat_sn
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] exp_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse:     got restricted __le32 [usertype] exp_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] max_cmd_sn @@
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse:     got restricted __le32 [usertype] max_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:285:29: sparse: sparse: restricted __le16 degrades to integer
>> drivers/scsi/qedi/qedi_fw.c:287:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] tsih @@     got restricted __le16 [usertype] tsih @@
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     expected restricted __be16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     got restricted __le16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] stat_sn @@
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse:     expected unsigned int [usertype] val
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse:     got restricted __le32 [usertype] stat_sn
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:289:35: sparse: sparse: too many warnings

vim +1460 drivers/scsi/qedi/qedi_fw.c

ace7f46ba5fde7 Manish Rangankar            2016-12-01  1421  
60a0d379f11bc7 Mike Christie               2021-05-25  1422  static int send_iscsi_tmf(struct qedi_conn *qedi_conn, struct iscsi_task *mtask,
60a0d379f11bc7 Mike Christie               2021-05-25  1423  			  struct iscsi_task *ctask)
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1424  {
be086e7c53f1fa Mintz, Yuval                2017-03-11  1425  	struct iscsi_tmf_request_hdr tmf_pdu_header;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1426  	struct iscsi_task_params task_params;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1427  	struct qedi_ctx *qedi = qedi_conn->qedi;
fb09a1ed5c6e50 Shai Malin                  2021-10-04  1428  	struct iscsi_task_context *fw_task_ctx;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1429  	struct iscsi_tm *tmf_hdr;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1430  	struct qedi_cmd *qedi_cmd;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1431  	struct qedi_cmd *cmd;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1432  	struct qedi_endpoint *ep;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1433  	u32 scsi_lun[2];
be086e7c53f1fa Mintz, Yuval                2017-03-11  1434  	s16 tid = 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1435  	u16 sq_idx = 0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1436  
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1437  	tmf_hdr = (struct iscsi_tm *)mtask->hdr;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1438  	qedi_cmd = (struct qedi_cmd *)mtask->dd_data;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1439  	ep = qedi_conn->ep;
b19775e4785996 manish.rangankar@cavium.com 2017-05-19  1440  	if (!ep)
b19775e4785996 manish.rangankar@cavium.com 2017-05-19  1441  		return -ENODEV;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1442  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1443  	tid = qedi_get_task_idx(qedi);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1444  	if (tid == -1)
be086e7c53f1fa Mintz, Yuval                2017-03-11  1445  		return -ENOMEM;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1446  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1447  	fw_task_ctx =
fb09a1ed5c6e50 Shai Malin                  2021-10-04  1448  	     (struct iscsi_task_context *)qedi_get_task_mem(&qedi->tasks,
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1449  							       tid);
fb09a1ed5c6e50 Shai Malin                  2021-10-04  1450  	memset(fw_task_ctx, 0, sizeof(struct iscsi_task_context));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1451  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1452  	qedi_cmd->task_id = tid;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1453  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1454  	memset(&task_params, 0, sizeof(task_params));
be086e7c53f1fa Mintz, Yuval                2017-03-11  1455  	memset(&tmf_pdu_header, 0, sizeof(tmf_pdu_header));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1456  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1457  	/* Update header info */
be086e7c53f1fa Mintz, Yuval                2017-03-11  1458  	qedi_update_itt_map(qedi, tid, mtask->itt, qedi_cmd);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1459  	tmf_pdu_header.itt = qedi_set_itt(tid, get_itt(mtask->itt));
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1460  	tmf_pdu_header.cmd_sn = be32_to_cpu(tmf_hdr->cmdsn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1461  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1462  	memcpy(scsi_lun, &tmf_hdr->lun, sizeof(struct scsi_lun));
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1463  	tmf_pdu_header.lun.lo = be32_to_cpu(scsi_lun[0]);
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1464  	tmf_pdu_header.lun.hi = be32_to_cpu(scsi_lun[1]);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1465  
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1466  	if ((tmf_hdr->flags & ISCSI_FLAG_TM_FUNC_MASK) ==
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1467  	     ISCSI_TM_FUNC_ABORT_TASK) {
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1468  		cmd = (struct qedi_cmd *)ctask->dd_data;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1469  		tmf_pdu_header.rtt =
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1470  				qedi_set_itt(cmd->task_id,
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1471  					     get_itt(tmf_hdr->rtt));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1472  	} else {
be086e7c53f1fa Mintz, Yuval                2017-03-11  1473  		tmf_pdu_header.rtt = ISCSI_RESERVED_TAG;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1474  	}
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1475  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1476  	tmf_pdu_header.opcode = tmf_hdr->opcode;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1477  	tmf_pdu_header.function = tmf_hdr->flags;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1478  	tmf_pdu_header.hdr_second_dword = ntoh24(tmf_hdr->dlength);
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1479  	tmf_pdu_header.ref_cmd_sn = be32_to_cpu(tmf_hdr->refcmdsn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1480  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1481  	/* Fill fw input params */
be086e7c53f1fa Mintz, Yuval                2017-03-11  1482  	task_params.context = fw_task_ctx;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1483  	task_params.conn_icid = (u16)qedi_conn->iscsi_conn_id;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1484  	task_params.itid = tid;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1485  	task_params.cq_rss_number = 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1486  	task_params.tx_io_size = 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1487  	task_params.rx_io_size = 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1488  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1489  	sq_idx = qedi_get_wqe_idx(qedi_conn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1490  	task_params.sqe = &ep->sq[sq_idx];
be086e7c53f1fa Mintz, Yuval                2017-03-11  1491  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1492  	memset(task_params.sqe, 0, sizeof(struct iscsi_wqe));
f7eea75262fc8e Mike Christie               2021-05-25  1493  	init_initiator_tmf_request_task(&task_params, &tmf_pdu_header);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1494  
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1495  	spin_lock(&qedi_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1496  	list_add_tail(&qedi_cmd->io_cmd, &qedi_conn->active_cmd_list);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1497  	qedi_cmd->io_cmd_in_list = true;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1498  	qedi_conn->active_cmd_count++;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1499  	spin_unlock(&qedi_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1500  
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1501  	qedi_ring_doorbell(qedi_conn);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1502  	return 0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1503  }
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1504  

:::::: The code at line 1460 was first introduced by commit
:::::: be086e7c53f1fac51eed14523b28f2214b548dd2 qed*: Utilize Firmware 8.15.3.0

:::::: TO: Mintz, Yuval <Yuval.Mintz@cavium.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB741FA1
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jul 2023 07:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688801605; x=1720337605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0QvwSdePxm2eXN13EFEM8HMAjV1D+5+SQcT85C1oTW4=;
  b=C4cuZzawbyEMrWgCv2kpt4TwO1YqJnyjAabY7X1oyZHivrfpBYqErOi8
   jdBSzKa/wK/7ZNtBD828biWqDQ946vboMPLS626HGL/C6rGqvC9lAGCKZ
   YQVZL6nxZW7PBimKgQWi1kvMSNREF1J2ZFrq5raRLx0rRipVxf70oYuh6
   WV68S+wrD37Ew2XKfU0/PDxwtgIjV2dXSK0P6Jal8oFknqGq0mil3TZv5
   KxzMISmEHySMn42ddnS2Zi7lnv+16XXPdVCRF+o+3Ok3jKYBvMwmHI0uZ
   P3OyOI0OpeqW5mlKOv4cJsaxFV9eZYGxVeGd5g6HpPt6hUIWJH+KyTVRe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="394815871"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="394815871"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 00:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="720161437"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="720161437"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Jul 2023 00:33:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qI2RV-0002c6-2P;
	Sat, 08 Jul 2023 07:33:21 +0000
Date: Sat, 8 Jul 2023 15:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/qedi/qedi_fw.c:932:40: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202307081532.HV1FEmGO-lkp@intel.com>
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
TO: Shai Malin <smalin@marvell.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Manish Rangankar <mrangankar@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8689f4f2ea561dd080118eeb05c0255ac9542905
commit: 9757f8af04423f60b6ecbd6802ff4e3f618fbb44 scsi: qedi: Add support for fastpath doorbell recovery
date:   1 year, 11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 11 months ago
config: i386-randconfig-i061-20230708 (https://download.01.org/0day-ci/archive/20230708/202307081532.HV1FEmGO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081532.HV1FEmGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307081532.HV1FEmGO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/qedi/qedi_fw.c:52:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:53:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:55:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] t2wait @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     expected restricted __be16 [usertype] t2wait
   drivers/scsi/qedi/qedi_fw.c:55:26: sparse:     got restricted __be32 [usertype]
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
   drivers/scsi/qedi/qedi_fw.c:112:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:113:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:116:36: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:211:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:211:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:211:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:214:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:216:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:217:36: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:218:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:285:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] tsih @@     got restricted __le16 [usertype] tsih @@
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     expected restricted __be16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     got restricted __le16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:289:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:290:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:293:37: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:331:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] idx @@     got restricted __le16 [usertype] rqe_opaque @@
   drivers/scsi/qedi/qedi_fw.c:331:13: sparse:     expected unsigned short [usertype] idx
   drivers/scsi/qedi/qedi_fw.c:331:13: sparse:     got restricted __le16 [usertype] rqe_opaque
   drivers/scsi/qedi/qedi_fw.c:366:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] idx @@     got restricted __le16 [usertype] rqe_opaque @@
   drivers/scsi/qedi/qedi_fw.c:366:13: sparse:     expected unsigned short [usertype] idx
   drivers/scsi/qedi/qedi_fw.c:366:13: sparse:     got restricted __le16 [usertype] rqe_opaque
   drivers/scsi/qedi/qedi_fw.c:384:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] opaque @@     got restricted __le32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:384:41: sparse:     expected restricted __le16 [usertype] opaque
   drivers/scsi/qedi/qedi_fw.c:384:41: sparse:     got restricted __le32 [usertype]
   drivers/scsi/qedi/qedi_fw.c:427:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:434:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:435:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:436:23: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:437:20: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:453:28: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:497:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:513:18: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:513:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:513:16: sparse:     expected unsigned int
   drivers/scsi/qedi/qedi_fw.c:513:16: sparse:     got restricted __be32 [usertype]
   drivers/scsi/qedi/qedi_fw.c:514:18: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:514:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:514:16: sparse:     expected unsigned int
   drivers/scsi/qedi/qedi_fw.c:514:16: sparse:     got restricted __be32 [usertype]
   drivers/scsi/qedi/qedi_fw.c:516:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:517:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:518:28: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:523:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:524:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:525:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:548:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:563:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:563:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:563:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:565:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:566:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:567:23: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:590:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] iscsi_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:590:20: sparse:     expected unsigned int [usertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:590:20: sparse:     got restricted __le16 [usertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:623:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:624:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:625:20: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:629:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:632:38: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:734:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] proto_itt @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:734:28: sparse:     expected unsigned int [usertype] proto_itt
   drivers/scsi/qedi/qedi_fw.c:734:28: sparse:     got restricted __le16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:744:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] iscsi_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:744:19: sparse:     expected unsigned int [usertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:744:19: sparse:     got restricted __le16 [usertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:795:9: sparse: sparse: cast to restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:857:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] iscsi_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:857:20: sparse:     expected unsigned int [usertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:857:20: sparse:     got restricted __le16 [usertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:888:50: sparse: sparse: cast from restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:888:40: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:893:48: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:892:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] itid @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:892:49: sparse:     expected restricted __le16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:892:49: sparse:     got unsigned int
>> drivers/scsi/qedi/qedi_fw.c:932:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] sq_prod @@     got unsigned short [usertype] fw_sq_prod_idx @@
   drivers/scsi/qedi/qedi_fw.c:932:40: sparse:     expected restricted __le16 [usertype] sq_prod
   drivers/scsi/qedi/qedi_fw.c:932:40: sparse:     got unsigned short [usertype] fw_sq_prod_idx
   drivers/scsi/qedi/qedi_fw.c:1008:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] isid_tabc @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1008:40: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] isid_tabc
   drivers/scsi/qedi/qedi_fw.c:1008:40: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:1009:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] isid_d @@     got unsigned short @@
   drivers/scsi/qedi/qedi_fw.c:1009:37: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] isid_d
   drivers/scsi/qedi/qedi_fw.c:1009:37: sparse:     got unsigned short
   drivers/scsi/qedi/qedi_fw.c:1011:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] tsih @@     got restricted __be16 [usertype] tsih @@
   drivers/scsi/qedi/qedi_fw.c:1011:35: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1011:35: sparse:     got restricted __be16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1012:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1012:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1012:47: sparse:     got int
   drivers/scsi/qedi/qedi_fw.c:1015:36: sparse: sparse: cast to restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:1015:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1015:34: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1015:34: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1016:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] cid @@     got unsigned int [usertype] iscsi_conn_id @@
   drivers/scsi/qedi/qedi_fw.c:1016:34: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] cid
   drivers/scsi/qedi/qedi_fw.c:1016:34: sparse:     got unsigned int [usertype] iscsi_conn_id
   drivers/scsi/qedi/qedi_fw.c:1017:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1017:37: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1017:37: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1018:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] exp_stat_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1018:42: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] exp_stat_sn
   drivers/scsi/qedi/qedi_fw.c:1018:42: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1024:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1024:45: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1024:45: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1026:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1026:45: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1026:45: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1033:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1033:45: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1033:45: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1035:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1035:45: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1035:45: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1037:46: sparse: sparse: too many warnings

vim +932 drivers/scsi/qedi/qedi_fw.c

ace7f46ba5fde7 Manish Rangankar 2016-12-01  929  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  930  static void qedi_ring_doorbell(struct qedi_conn *qedi_conn)
ace7f46ba5fde7 Manish Rangankar 2016-12-01  931  {
9757f8af04423f Shai Malin       2021-08-05 @932  	qedi_conn->ep->db_data.sq_prod = qedi_conn->ep->fw_sq_prod_idx;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  933  
9757f8af04423f Shai Malin       2021-08-05  934  	/* wmb - Make sure fw idx is coherent */
9757f8af04423f Shai Malin       2021-08-05  935  	wmb();
9757f8af04423f Shai Malin       2021-08-05  936  	writel(*(u32 *)&qedi_conn->ep->db_data, qedi_conn->ep->p_doorbell);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  937  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  938  	/* Make sure fw write idx is coherent, and include both memory barriers
ace7f46ba5fde7 Manish Rangankar 2016-12-01  939  	 * as a failsafe as for some architectures the call is the same but on
ace7f46ba5fde7 Manish Rangankar 2016-12-01  940  	 * others they are two different assembly operations.
ace7f46ba5fde7 Manish Rangankar 2016-12-01  941  	 */
ace7f46ba5fde7 Manish Rangankar 2016-12-01  942  	wmb();
ace7f46ba5fde7 Manish Rangankar 2016-12-01  943  	QEDI_INFO(&qedi_conn->qedi->dbg_ctx, QEDI_LOG_MP_REQ,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  944  		  "prod_idx=0x%x, fw_prod_idx=0x%x, cid=0x%x\n",
ace7f46ba5fde7 Manish Rangankar 2016-12-01  945  		  qedi_conn->ep->sq_prod_idx, qedi_conn->ep->fw_sq_prod_idx,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  946  		  qedi_conn->iscsi_conn_id);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  947  }
ace7f46ba5fde7 Manish Rangankar 2016-12-01  948  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

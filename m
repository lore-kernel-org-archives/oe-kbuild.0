Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8C617C8
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 02:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhaBj2gZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700100707; x=1731636707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YhfRuZdkg7sNGMhaBewSRIyZ+Nmc543dYmwgfxNZeYU=;
  b=AhaBj2gZQVKZ8eD7wPzsdmdz0vtQsE4pmh7HSC15vUTxuLGoKW9JYavd
   HORb5dYoKLSwv8nBXB0wflkSEteQqKygF6q4ZtySRk1I+OywF+VSH8CId
   XBIX6mtwasfVybeY2bpoU6TjAnxtrJJgHoCCd6dWtjy76p1Kqg6XmOIV6
   hY54/ApUmGD/18p12rpMRQVn/897/QnyCkTxZy9OEU6FAGiWVSWU+QOG9
   ALuP0kkLyt1pZsbY3I0Tscw71vxLTLOIHcARpboTcPJwzTxp4jKv3FXuy
   4F9pg/wWrdj67xHIjSSR0gVMDQhW0uzvD3MdGqRQHNh29R+lsngKeSrfV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="376041373"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="376041373"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 18:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="800032645"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="800032645"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Nov 2023 18:11:43 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Rqb-00017a-2L;
	Thu, 16 Nov 2023 02:11:22 +0000
Date: Thu, 16 Nov 2023 10:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/qedi/qedi_fw.c:1039:45: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202311161020.pFFkxBi3-lkp@intel.com>
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
TO: Mike Christie <michael.christie@oracle.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Manish Rangankar <mrangankar@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: ed1b86ba0fba3d586cd53057551a95197b0a37ad scsi: qedi: Wake up if cmd_cleanup_req is set
date:   2 years, 5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 2 years, 5 months ago
config: x86_64-randconfig-123-20231025 (https://download.01.org/0day-ci/archive/20231116/202311161020.pFFkxBi3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161020.pFFkxBi3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311161020.pFFkxBi3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   drivers/scsi/qedi/qedi_fw.c:630:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:631:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:632:20: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:636:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:639:38: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:741:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] proto_itt @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:741:28: sparse:     expected unsigned int [usertype] proto_itt
   drivers/scsi/qedi/qedi_fw.c:741:28: sparse:     got restricted __le16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:751:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] iscsi_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:751:19: sparse:     expected unsigned int [usertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:751:19: sparse:     got restricted __le16 [usertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:802:9: sparse: sparse: cast to restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:864:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] iscsi_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:864:20: sparse:     expected unsigned int [usertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:864:20: sparse:     got restricted __le16 [usertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:895:50: sparse: sparse: cast from restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:895:40: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:900:48: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:899:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] itid @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:899:49: sparse:     expected restricted __le16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:899:49: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:948:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] sq_prod @@     got unsigned short [usertype] fw_sq_prod_idx @@
   drivers/scsi/qedi/qedi_fw.c:948:23: sparse:     expected restricted __le16 [assigned] [usertype] sq_prod
   drivers/scsi/qedi/qedi_fw.c:948:23: sparse:     got unsigned short [usertype] fw_sq_prod_idx
   drivers/scsi/qedi/qedi_fw.c:1021:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] isid_tabc @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1021:40: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] isid_tabc
   drivers/scsi/qedi/qedi_fw.c:1021:40: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:1022:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] isid_d @@     got unsigned short @@
   drivers/scsi/qedi/qedi_fw.c:1022:37: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] isid_d
   drivers/scsi/qedi/qedi_fw.c:1022:37: sparse:     got unsigned short
   drivers/scsi/qedi/qedi_fw.c:1024:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] tsih @@     got restricted __be16 [usertype] tsih @@
   drivers/scsi/qedi/qedi_fw.c:1024:35: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1024:35: sparse:     got restricted __be16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1025:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1025:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1025:47: sparse:     got int
   drivers/scsi/qedi/qedi_fw.c:1028:36: sparse: sparse: cast to restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:1028:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1028:34: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1028:34: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1029:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] cid @@     got unsigned int [usertype] iscsi_conn_id @@
   drivers/scsi/qedi/qedi_fw.c:1029:34: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] cid
   drivers/scsi/qedi/qedi_fw.c:1029:34: sparse:     got unsigned int [usertype] iscsi_conn_id
   drivers/scsi/qedi/qedi_fw.c:1030:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1030:37: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1030:37: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1031:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] exp_stat_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1031:42: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] exp_stat_sn
   drivers/scsi/qedi/qedi_fw.c:1031:42: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1037:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1037:45: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1037:45: sparse:     got unsigned int [usertype]
>> drivers/scsi/qedi/qedi_fw.c:1039:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1039:45: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1039:45: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1046:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1046:45: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1046:45: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1048:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1048:45: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1048:45: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1050:46: sparse: sparse: too many warnings

vim +1039 drivers/scsi/qedi/qedi_fw.c

be086e7c53f1fa Mintz, Yuval     2017-03-11   978  
ace7f46ba5fde7 Manish Rangankar 2016-12-01   979  int qedi_send_iscsi_login(struct qedi_conn *qedi_conn,
ace7f46ba5fde7 Manish Rangankar 2016-12-01   980  			  struct iscsi_task *task)
ace7f46ba5fde7 Manish Rangankar 2016-12-01   981  {
be086e7c53f1fa Mintz, Yuval     2017-03-11   982  	struct iscsi_login_req_hdr login_req_pdu_header;
be086e7c53f1fa Mintz, Yuval     2017-03-11   983  	struct scsi_sgl_task_params tx_sgl_task_params;
be086e7c53f1fa Mintz, Yuval     2017-03-11   984  	struct scsi_sgl_task_params rx_sgl_task_params;
be086e7c53f1fa Mintz, Yuval     2017-03-11   985  	struct iscsi_task_params task_params;
21dd79e82f00b2 Tomer Tayar      2017-12-27   986  	struct e4_iscsi_task_context *fw_task_ctx;
be086e7c53f1fa Mintz, Yuval     2017-03-11   987  	struct qedi_ctx *qedi = qedi_conn->qedi;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   988  	struct iscsi_login_req *login_hdr;
be086e7c53f1fa Mintz, Yuval     2017-03-11   989  	struct scsi_sge *resp_sge = NULL;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   990  	struct qedi_cmd *qedi_cmd;
be086e7c53f1fa Mintz, Yuval     2017-03-11   991  	struct qedi_endpoint *ep;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   992  	s16 tid = 0;
be086e7c53f1fa Mintz, Yuval     2017-03-11   993  	u16 sq_idx = 0;
be086e7c53f1fa Mintz, Yuval     2017-03-11   994  	int rval = 0;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   995  
be086e7c53f1fa Mintz, Yuval     2017-03-11   996  	resp_sge = (struct scsi_sge *)qedi_conn->gen_pdu.resp_bd_tbl;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   997  	qedi_cmd = (struct qedi_cmd *)task->dd_data;
be086e7c53f1fa Mintz, Yuval     2017-03-11   998  	ep = qedi_conn->ep;
ace7f46ba5fde7 Manish Rangankar 2016-12-01   999  	login_hdr = (struct iscsi_login_req *)task->hdr;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1000  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1001  	tid = qedi_get_task_idx(qedi);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1002  	if (tid == -1)
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1003  		return -ENOMEM;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1004  
be086e7c53f1fa Mintz, Yuval     2017-03-11  1005  	fw_task_ctx =
21dd79e82f00b2 Tomer Tayar      2017-12-27  1006  	     (struct e4_iscsi_task_context *)qedi_get_task_mem(&qedi->tasks,
21dd79e82f00b2 Tomer Tayar      2017-12-27  1007  							       tid);
21dd79e82f00b2 Tomer Tayar      2017-12-27  1008  	memset(fw_task_ctx, 0, sizeof(struct e4_iscsi_task_context));
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1009  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1010  	qedi_cmd->task_id = tid;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1011  
be086e7c53f1fa Mintz, Yuval     2017-03-11  1012  	memset(&task_params, 0, sizeof(task_params));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1013  	memset(&login_req_pdu_header, 0, sizeof(login_req_pdu_header));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1014  	memset(&tx_sgl_task_params, 0, sizeof(tx_sgl_task_params));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1015  	memset(&rx_sgl_task_params, 0, sizeof(rx_sgl_task_params));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1016  	/* Update header info */
be086e7c53f1fa Mintz, Yuval     2017-03-11  1017  	login_req_pdu_header.opcode = login_hdr->opcode;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1018  	login_req_pdu_header.version_min = login_hdr->min_version;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1019  	login_req_pdu_header.version_max = login_hdr->max_version;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1020  	login_req_pdu_header.flags_attr = login_hdr->flags;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1021  	login_req_pdu_header.isid_tabc = swab32p((u32 *)login_hdr->isid);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1022  	login_req_pdu_header.isid_d = swab16p((u16 *)&login_hdr->isid[4]);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1023  
be086e7c53f1fa Mintz, Yuval     2017-03-11  1024  	login_req_pdu_header.tsih = login_hdr->tsih;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1025  	login_req_pdu_header.hdr_second_dword = ntoh24(login_hdr->dlength);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1026  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1027  	qedi_update_itt_map(qedi, tid, task->itt, qedi_cmd);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1028  	login_req_pdu_header.itt = qedi_set_itt(tid, get_itt(task->itt));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1029  	login_req_pdu_header.cid = qedi_conn->iscsi_conn_id;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1030  	login_req_pdu_header.cmd_sn = be32_to_cpu(login_hdr->cmdsn);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1031  	login_req_pdu_header.exp_stat_sn = be32_to_cpu(login_hdr->exp_statsn);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1032  	login_req_pdu_header.exp_stat_sn = 0;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1033  
be086e7c53f1fa Mintz, Yuval     2017-03-11  1034  	/* Fill tx AHS and rx buffer */
be086e7c53f1fa Mintz, Yuval     2017-03-11  1035  	tx_sgl_task_params.sgl =
be086e7c53f1fa Mintz, Yuval     2017-03-11  1036  			       (struct scsi_sge *)qedi_conn->gen_pdu.req_bd_tbl;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1037  	tx_sgl_task_params.sgl_phys_addr.lo =
be086e7c53f1fa Mintz, Yuval     2017-03-11  1038  					 (u32)(qedi_conn->gen_pdu.req_dma_addr);
be086e7c53f1fa Mintz, Yuval     2017-03-11 @1039  	tx_sgl_task_params.sgl_phys_addr.hi =
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1040  			      (u32)((u64)qedi_conn->gen_pdu.req_dma_addr >> 32);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1041  	tx_sgl_task_params.total_buffer_size = ntoh24(login_hdr->dlength);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1042  	tx_sgl_task_params.num_sges = 1;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1043  
be086e7c53f1fa Mintz, Yuval     2017-03-11  1044  	rx_sgl_task_params.sgl =
be086e7c53f1fa Mintz, Yuval     2017-03-11  1045  			      (struct scsi_sge *)qedi_conn->gen_pdu.resp_bd_tbl;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1046  	rx_sgl_task_params.sgl_phys_addr.lo =
be086e7c53f1fa Mintz, Yuval     2017-03-11  1047  					(u32)(qedi_conn->gen_pdu.resp_dma_addr);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1048  	rx_sgl_task_params.sgl_phys_addr.hi =
be086e7c53f1fa Mintz, Yuval     2017-03-11  1049  			     (u32)((u64)qedi_conn->gen_pdu.resp_dma_addr >> 32);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1050  	rx_sgl_task_params.total_buffer_size = resp_sge->sge_len;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1051  	rx_sgl_task_params.num_sges = 1;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1052  
be086e7c53f1fa Mintz, Yuval     2017-03-11  1053  	/* Fill fw input params */
be086e7c53f1fa Mintz, Yuval     2017-03-11  1054  	task_params.context = fw_task_ctx;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1055  	task_params.conn_icid = (u16)qedi_conn->iscsi_conn_id;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1056  	task_params.itid = tid;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1057  	task_params.cq_rss_number = 0;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1058  	task_params.tx_io_size = ntoh24(login_hdr->dlength);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1059  	task_params.rx_io_size = resp_sge->sge_len;
be086e7c53f1fa Mintz, Yuval     2017-03-11  1060  
be086e7c53f1fa Mintz, Yuval     2017-03-11  1061  	sq_idx = qedi_get_wqe_idx(qedi_conn);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1062  	task_params.sqe = &ep->sq[sq_idx];
be086e7c53f1fa Mintz, Yuval     2017-03-11  1063  
be086e7c53f1fa Mintz, Yuval     2017-03-11  1064  	memset(task_params.sqe, 0, sizeof(struct iscsi_wqe));
be086e7c53f1fa Mintz, Yuval     2017-03-11  1065  	rval = init_initiator_login_request_task(&task_params,
be086e7c53f1fa Mintz, Yuval     2017-03-11  1066  						 &login_req_pdu_header,
be086e7c53f1fa Mintz, Yuval     2017-03-11  1067  						 &tx_sgl_task_params,
be086e7c53f1fa Mintz, Yuval     2017-03-11  1068  						 &rx_sgl_task_params);
be086e7c53f1fa Mintz, Yuval     2017-03-11  1069  	if (rval)
be086e7c53f1fa Mintz, Yuval     2017-03-11  1070  		return -1;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1071  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1072  	spin_lock(&qedi_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1073  	list_add_tail(&qedi_cmd->io_cmd, &qedi_conn->active_cmd_list);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1074  	qedi_cmd->io_cmd_in_list = true;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1075  	qedi_conn->active_cmd_count++;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1076  	spin_unlock(&qedi_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1077  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1078  	qedi_ring_doorbell(qedi_conn);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1079  	return 0;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1080  }
ace7f46ba5fde7 Manish Rangankar 2016-12-01  1081  

:::::: The code at line 1039 was first introduced by commit
:::::: be086e7c53f1fac51eed14523b28f2214b548dd2 qed*: Utilize Firmware 8.15.3.0

:::::: TO: Mintz, Yuval <Yuval.Mintz@cavium.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

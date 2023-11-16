Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC77C8EE
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 05:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Etb8EgVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700113822; x=1731649822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+88vB18YvIfUWdxWiGldYTJUd4ys6zoPVTzc7ERfla0=;
  b=Etb8EgVAXSJZ5FYspHfUHdGudFaGZjMsmePU3gRMrBcTCVu6X7gcHK6z
   9pszdq5Bz2+V8xADgGh22LSfe21PJHvpYdfK49n7zK9kmC36J4sPokZVO
   FvBaTxJlYF5Sh+DYK7AwX7LrgbRciAuJw+iokMuIUSimKYl3ZHnqXcN8P
   wFYm+9O2lB2KMqpXVSC2+k5oFZykQU5rYwQdONcbEp3Z4lyJs8bvfOBpf
   +qHOohBLJz0haGGJlr7Y0tPBCUQBXH6gExFF4+N+zsAhy/I3aa1td5Y3V
   vo0P7kaANXjHHntmodxmp57nudUCxeRHWhtamCCYOJ7ASprx8xwtgoELM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="389878222"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="389878222"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 21:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="909009545"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="909009545"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 21:50:20 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3VGZ-0001Lt-0H;
	Thu, 16 Nov 2023 05:50:16 +0000
Date: Thu, 16 Nov 2023 13:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/qedi/qedi_fw.c:932:40: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202311161351.7sPcpket-lkp@intel.com>
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
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 9757f8af04423f60b6ecbd6802ff4e3f618fbb44 scsi: qedi: Add support for fastpath doorbell recovery
date:   2 years, 3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 2 years, 3 months ago
config: x86_64-randconfig-123-20231025 (https://download.01.org/0day-ci/archive/20231116/202311161351.7sPcpket-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161351.7sPcpket-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311161351.7sPcpket-lkp@intel.com/

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

ace7f46ba5fde7 Manish Rangankar 2016-12-01  827  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  828  void qedi_fp_process_cqes(struct qedi_work *work)
ace7f46ba5fde7 Manish Rangankar 2016-12-01  829  {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  830  	struct qedi_ctx *qedi = work->qedi;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  831  	union iscsi_cqe *cqe = &work->cqe;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  832  	struct iscsi_task *task = NULL;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  833  	struct iscsi_nopout *nopout_hdr;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  834  	struct qedi_conn *q_conn;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  835  	struct iscsi_conn *conn;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  836  	struct qedi_cmd *qedi_cmd;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  837  	u32 comp_type;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  838  	u32 iscsi_cid;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  839  	u32 hdr_opcode;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  840  	u16 que_idx = work->que_idx;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  841  	u8 cqe_err_bits = 0;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  842  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  843  	comp_type = cqe->cqe_common.cqe_type;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  844  	hdr_opcode = cqe->cqe_common.iscsi_hdr.common.hdr_first_byte;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  845  	cqe_err_bits =
ace7f46ba5fde7 Manish Rangankar 2016-12-01  846  		cqe->cqe_common.error_bitmap.error_bits.cqe_error_status_bits;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  847  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  848  	QEDI_INFO(&qedi->dbg_ctx, QEDI_LOG_CONN,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  849  		  "fw_cid=0x%x, cqe type=0x%x, opcode=0x%x\n",
ace7f46ba5fde7 Manish Rangankar 2016-12-01  850  		  cqe->cqe_common.conn_id, comp_type, hdr_opcode);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  851  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  852  	if (comp_type >= MAX_ISCSI_CQES_TYPE) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  853  		QEDI_WARN(&qedi->dbg_ctx, "Invalid CqE type\n");
ace7f46ba5fde7 Manish Rangankar 2016-12-01  854  		return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  855  	}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  856  
ace7f46ba5fde7 Manish Rangankar 2016-12-01 @857  	iscsi_cid  = cqe->cqe_common.conn_id;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  858  	q_conn = qedi->cid_que.conn_cid_tbl[iscsi_cid];
ace7f46ba5fde7 Manish Rangankar 2016-12-01  859  	if (!q_conn) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  860  		QEDI_WARN(&qedi->dbg_ctx,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  861  			  "Session no longer exists for cid=0x%x!!\n",
ace7f46ba5fde7 Manish Rangankar 2016-12-01  862  			  iscsi_cid);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  863  		return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  864  	}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  865  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  866  	conn = q_conn->cls_conn->dd_data;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  867  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  868  	if (unlikely(cqe_err_bits &&
ace7f46ba5fde7 Manish Rangankar 2016-12-01  869  		     GET_FIELD(cqe_err_bits,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  870  			       CQE_ERROR_BITMAP_DATA_DIGEST_ERR))) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  871  		iscsi_conn_failure(conn, ISCSI_ERR_DATA_DGST);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  872  		return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  873  	}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  874  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  875  	switch (comp_type) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  876  	case ISCSI_CQE_TYPE_SOLICITED:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  877  	case ISCSI_CQE_TYPE_SOLICITED_WITH_SENSE:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  878  		qedi_cmd = container_of(work, struct qedi_cmd, cqe_work);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  879  		task = qedi_cmd->task;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  880  		if (!task) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  881  			QEDI_WARN(&qedi->dbg_ctx, "task is NULL\n");
ace7f46ba5fde7 Manish Rangankar 2016-12-01  882  			return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  883  		}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  884  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  885  		/* Process NOPIN local completion */
ace7f46ba5fde7 Manish Rangankar 2016-12-01  886  		nopout_hdr = (struct iscsi_nopout *)task->hdr;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  887  		if ((nopout_hdr->itt == RESERVED_ITT) &&
ace7f46ba5fde7 Manish Rangankar 2016-12-01  888  		    (cqe->cqe_solicited.itid != (u16)RESERVED_ITT)) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  889  			qedi_process_nopin_local_cmpl(qedi, &cqe->cqe_solicited,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  890  						      task, q_conn);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  891  		} else {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  892  			cqe->cqe_solicited.itid =
ace7f46ba5fde7 Manish Rangankar 2016-12-01  893  					       qedi_get_itt(cqe->cqe_solicited);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  894  			/* Process other solicited responses */
ace7f46ba5fde7 Manish Rangankar 2016-12-01  895  			qedi_mtask_completion(qedi, cqe, task, q_conn, que_idx);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  896  		}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  897  		break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  898  	case ISCSI_CQE_TYPE_UNSOLICITED:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  899  		switch (hdr_opcode) {
ace7f46ba5fde7 Manish Rangankar 2016-12-01  900  		case ISCSI_OPCODE_NOP_IN:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  901  			qedi_process_nopin_mesg(qedi, cqe, task, q_conn,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  902  						que_idx);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  903  			break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  904  		case ISCSI_OPCODE_ASYNC_MSG:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  905  			qedi_process_async_mesg(qedi, cqe, task, q_conn,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  906  						que_idx);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  907  			break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  908  		case ISCSI_OPCODE_REJECT:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  909  			qedi_process_reject_mesg(qedi, cqe, task, q_conn,
ace7f46ba5fde7 Manish Rangankar 2016-12-01  910  						 que_idx);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  911  			break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  912  		}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  913  		goto exit_fp_process;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  914  	case ISCSI_CQE_TYPE_DUMMY:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  915  		QEDI_INFO(&qedi->dbg_ctx, QEDI_LOG_SCSI_TM, "Dummy CqE\n");
ace7f46ba5fde7 Manish Rangankar 2016-12-01  916  		goto exit_fp_process;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  917  	case ISCSI_CQE_TYPE_TASK_CLEANUP:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  918  		QEDI_INFO(&qedi->dbg_ctx, QEDI_LOG_SCSI_TM, "CleanUp CqE\n");
5b04d050cde44c Mike Christie    2021-05-25  919  		qedi_process_cmd_cleanup_resp(qedi, &cqe->cqe_solicited, conn);
ace7f46ba5fde7 Manish Rangankar 2016-12-01  920  		goto exit_fp_process;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  921  	default:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  922  		QEDI_ERR(&qedi->dbg_ctx, "Error cqe.\n");
ace7f46ba5fde7 Manish Rangankar 2016-12-01  923  		break;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  924  	}
ace7f46ba5fde7 Manish Rangankar 2016-12-01  925  
ace7f46ba5fde7 Manish Rangankar 2016-12-01  926  exit_fp_process:
ace7f46ba5fde7 Manish Rangankar 2016-12-01  927  	return;
ace7f46ba5fde7 Manish Rangankar 2016-12-01  928  }
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

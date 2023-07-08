Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4054710E7
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Jul 2023 04:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688791163; x=1720327163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eQfJhSrzht+5+zkE9vDoR5yTfWJ9TL2KTo/C7z1yb8w=;
  b=f5rAFFoJMfKL/DW49MrbtKqbuiRNZ1HIxUqhcsPDWAPzPDengtsgB9jn
   5H7FCESelBkFO6Pjg3tM2uuV9ZQkn0dcxyIbFYwXTAdp0XZbkTWdztZzB
   d7VFNqJQdVqO86ZPHafD8pjEinBN25XH5L+v2pXFQtMcAQj9uWuqdJtpG
   TGbrFIR9DIXvQ3ZCf+gpzmpzn19hf+yGvJ6nHVFeYaF2iBnt1YPgvK0XK
   6V8/O0cQcToOBWblcIoNT8vbVukuPYPOjyGsmOcGfCgfzdzB6WS0iUU00
   Xpf2TYO4kzF5Hv9iV4p5eq9gKutYMWQNng3lTSNG5xTnsK1E7/UsnGqWV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="430099509"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="430099509"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 21:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="810249767"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="810249767"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2023 21:39:20 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHzj5-0002YU-3D;
	Sat, 08 Jul 2023 04:39:20 +0000
Date: Sat, 8 Jul 2023 12:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/qedi/qedi_fw.c:1515:31: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202307081258.6gpi2YWU-lkp@intel.com>
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
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8689f4f2ea561dd080118eeb05c0255ac9542905
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc.h: sparse can do constant folding of __builtin_bswap*()
date:   2 years, 2 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 years, 2 months ago
config: i386-randconfig-i061-20230708 (https://download.01.org/0day-ci/archive/20230708/202307081258.6gpi2YWU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307081258.6gpi2YWU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307081258.6gpi2YWU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/qedi/qedi_fw.c:1514:30: sparse: sparse: cast to restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:1514:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1514:28: sparse:     expected restricted __le32 [addressable] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1514:28: sparse:     got unsigned int [usertype]
>> drivers/scsi/qedi/qedi_fw.c:1515:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1515:31: sparse:     expected restricted __le32 [addressable] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1515:31: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1518:33: sparse: sparse: cast to restricted __be32
>> drivers/scsi/qedi/qedi_fw.c:1518:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1518:31: sparse:     expected restricted __le32 [addressable] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1518:31: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1519:33: sparse: sparse: cast to restricted __be32
>> drivers/scsi/qedi/qedi_fw.c:1519:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1519:31: sparse:     expected restricted __le32 [addressable] [usertype] hi
   drivers/scsi/qedi/qedi_fw.c:1519:31: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1530:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] rtt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1530:36: sparse:     expected restricted __le32 [addressable] [usertype] rtt
   drivers/scsi/qedi/qedi_fw.c:1530:36: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1534:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] rtt @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1534:36: sparse:     expected restricted __le32 [addressable] [usertype] rtt
   drivers/scsi/qedi/qedi_fw.c:1534:36: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:1539:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1539:41: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1539:41: sparse:     got int
>> drivers/scsi/qedi/qedi_fw.c:1540:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] ref_cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1540:35: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] ref_cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1540:35: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:50:25: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:51:28: sparse: sparse: cast from restricted __le32
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
   drivers/scsi/qedi/qedi_fw.c:106:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:106:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:106:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:110:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:112:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ttt @@     got restricted __le32 [usertype] ttt @@
   drivers/scsi/qedi/qedi_fw.c:112:27: sparse:     expected restricted __be32 [usertype] ttt
   drivers/scsi/qedi/qedi_fw.c:112:27: sparse:     got restricted __le32 [usertype] ttt
   drivers/scsi/qedi/qedi_fw.c:113:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:114:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:115:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:117:36: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:218:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:218:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:218:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:221:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:223:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:224:36: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:225:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:282:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:285:29: sparse: sparse: restricted __le16 degrades to integer
>> drivers/scsi/qedi/qedi_fw.c:287:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] tsih @@     got restricted __le16 [usertype] tsih @@
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     expected restricted __be16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:287:28: sparse:     got restricted __le16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:288:32: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:289:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:290:35: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:293:37: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/qedi/qedi_fw.c:332:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] idx @@     got restricted __le16 [usertype] rqe_opaque @@
   drivers/scsi/qedi/qedi_fw.c:332:13: sparse:     expected unsigned short [usertype] idx
   drivers/scsi/qedi/qedi_fw.c:332:13: sparse:     got restricted __le16 [usertype] rqe_opaque
   drivers/scsi/qedi/qedi_fw.c:367:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] idx @@     got restricted __le16 [usertype] rqe_opaque @@
   drivers/scsi/qedi/qedi_fw.c:367:13: sparse:     expected unsigned short [usertype] idx
   drivers/scsi/qedi/qedi_fw.c:367:13: sparse:     got restricted __le16 [usertype] rqe_opaque
>> drivers/scsi/qedi/qedi_fw.c:385:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] opaque @@     got restricted __le32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:385:41: sparse:     expected restricted __le16 [usertype] opaque
   drivers/scsi/qedi/qedi_fw.c:385:41: sparse:     got restricted __le32 [usertype]
   drivers/scsi/qedi/qedi_fw.c:428:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:435:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:436:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:437:23: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:438:20: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:454:28: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:499:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:515:18: sparse: sparse: cast from restricted __le32
>> drivers/scsi/qedi/qedi_fw.c:515:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:515:16: sparse:     expected unsigned int
   drivers/scsi/qedi/qedi_fw.c:515:16: sparse:     got restricted __be32 [usertype]
   drivers/scsi/qedi/qedi_fw.c:516:18: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:516:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:516:16: sparse:     expected unsigned int
   drivers/scsi/qedi/qedi_fw.c:516:16: sparse:     got restricted __be32 [usertype]
   drivers/scsi/qedi/qedi_fw.c:518:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:519:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:520:28: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:525:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:526:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:527:28: sparse: sparse: cast from restricted __le16
   drivers/scsi/qedi/qedi_fw.c:550:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:565:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:565:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:565:9: sparse: sparse: restricted __le32 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:567:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:568:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:569:23: sparse: sparse: cast from restricted __le32
>> drivers/scsi/qedi/qedi_fw.c:592:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] iscsi_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:592:20: sparse:     expected unsigned int [usertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:592:20: sparse:     got restricted __le16 [usertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:632:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:633:26: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:634:20: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:638:31: sparse: sparse: cast from restricted __le32
   drivers/scsi/qedi/qedi_fw.c:641:38: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/qedi/qedi_fw.c:746:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] proto_itt @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:746:28: sparse:     expected unsigned int [usertype] proto_itt
   drivers/scsi/qedi/qedi_fw.c:746:28: sparse:     got restricted __le16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:758:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] iscsi_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:758:19: sparse:     expected unsigned int [usertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:758:19: sparse:     got restricted __le16 [usertype] conn_id
   drivers/scsi/qedi/qedi_fw.c:816:25: sparse: sparse: cast to restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:838:45: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] tid @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:838:45: sparse:     expected unsigned int [usertype] tid
   drivers/scsi/qedi/qedi_fw.c:838:45: sparse:     got restricted __le16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:859:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int idx @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:859:57: sparse:     expected int idx
   drivers/scsi/qedi/qedi_fw.c:859:57: sparse:     got restricted __le16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:862:45: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] tid @@     got restricted __le16 [usertype] itid @@
   drivers/scsi/qedi/qedi_fw.c:862:45: sparse:     expected unsigned int [usertype] tid
   drivers/scsi/qedi/qedi_fw.c:862:45: sparse:     got restricted __le16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:900:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] iscsi_cid @@     got restricted __le16 [usertype] conn_id @@
   drivers/scsi/qedi/qedi_fw.c:900:20: sparse:     expected unsigned int [usertype] iscsi_cid
   drivers/scsi/qedi/qedi_fw.c:900:20: sparse:     got restricted __le16 [usertype] conn_id
>> drivers/scsi/qedi/qedi_fw.c:931:50: sparse: sparse: cast from restricted itt_t
   drivers/scsi/qedi/qedi_fw.c:931:40: sparse: sparse: restricted __le16 degrades to integer
   drivers/scsi/qedi/qedi_fw.c:936:48: sparse: sparse: restricted __le32 degrades to integer
>> drivers/scsi/qedi/qedi_fw.c:935:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] itid @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:935:49: sparse:     expected restricted __le16 [usertype] itid
   drivers/scsi/qedi/qedi_fw.c:935:49: sparse:     got unsigned int
   drivers/scsi/qedi/qedi_fw.c:985:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] sq_prod @@     got unsigned short [usertype] fw_sq_prod_idx @@
   drivers/scsi/qedi/qedi_fw.c:985:23: sparse:     expected restricted __le16 [assigned] [usertype] sq_prod
   drivers/scsi/qedi/qedi_fw.c:985:23: sparse:     got unsigned short [usertype] fw_sq_prod_idx
>> drivers/scsi/qedi/qedi_fw.c:1058:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] isid_tabc @@     got unsigned int @@
   drivers/scsi/qedi/qedi_fw.c:1058:40: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] isid_tabc
   drivers/scsi/qedi/qedi_fw.c:1058:40: sparse:     got unsigned int
>> drivers/scsi/qedi/qedi_fw.c:1059:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] isid_d @@     got unsigned short @@
   drivers/scsi/qedi/qedi_fw.c:1059:37: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] isid_d
   drivers/scsi/qedi/qedi_fw.c:1059:37: sparse:     got unsigned short
>> drivers/scsi/qedi/qedi_fw.c:1061:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] tsih @@     got restricted __be16 [usertype] tsih @@
   drivers/scsi/qedi/qedi_fw.c:1061:35: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1061:35: sparse:     got restricted __be16 [usertype] tsih
   drivers/scsi/qedi/qedi_fw.c:1062:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword @@     got int @@
   drivers/scsi/qedi/qedi_fw.c:1062:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hdr_second_dword
   drivers/scsi/qedi/qedi_fw.c:1062:47: sparse:     got int
   drivers/scsi/qedi/qedi_fw.c:1065:36: sparse: sparse: cast to restricted itt_t
>> drivers/scsi/qedi/qedi_fw.c:1065:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] itt @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1065:34: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] itt
   drivers/scsi/qedi/qedi_fw.c:1065:34: sparse:     got unsigned int [usertype]
>> drivers/scsi/qedi/qedi_fw.c:1066:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] cid @@     got unsigned int [usertype] iscsi_conn_id @@
   drivers/scsi/qedi/qedi_fw.c:1066:34: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] cid
   drivers/scsi/qedi/qedi_fw.c:1066:34: sparse:     got unsigned int [usertype] iscsi_conn_id
>> drivers/scsi/qedi/qedi_fw.c:1067:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] cmd_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1067:37: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] cmd_sn
   drivers/scsi/qedi/qedi_fw.c:1067:37: sparse:     got unsigned int [usertype]
>> drivers/scsi/qedi/qedi_fw.c:1068:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] exp_stat_sn @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1068:42: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] exp_stat_sn
   drivers/scsi/qedi/qedi_fw.c:1068:42: sparse:     got unsigned int [usertype]
>> drivers/scsi/qedi/qedi_fw.c:1074:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/qedi/qedi_fw.c:1074:45: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] lo
   drivers/scsi/qedi/qedi_fw.c:1074:45: sparse:     got unsigned int [usertype]
   drivers/scsi/qedi/qedi_fw.c:1076:45: sparse: sparse: too many warnings

vim +1515 drivers/scsi/qedi/qedi_fw.c

ace7f46ba5fde7 Manish Rangankar            2016-12-01  1473  
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1474  static int qedi_send_iscsi_tmf(struct qedi_conn *qedi_conn,
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1475  			       struct iscsi_task *mtask)
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1476  {
be086e7c53f1fa Mintz, Yuval                2017-03-11  1477  	struct iscsi_tmf_request_hdr tmf_pdu_header;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1478  	struct iscsi_task_params task_params;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1479  	struct qedi_ctx *qedi = qedi_conn->qedi;
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1480  	struct e4_iscsi_task_context *fw_task_ctx;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1481  	struct iscsi_conn *conn = qedi_conn->cls_conn->dd_data;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1482  	struct iscsi_task *ctask;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1483  	struct iscsi_tm *tmf_hdr;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1484  	struct qedi_cmd *qedi_cmd;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1485  	struct qedi_cmd *cmd;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1486  	struct qedi_endpoint *ep;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1487  	u32 scsi_lun[2];
be086e7c53f1fa Mintz, Yuval                2017-03-11  1488  	s16 tid = 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1489  	u16 sq_idx = 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1490  	int rval = 0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1491  
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1492  	tmf_hdr = (struct iscsi_tm *)mtask->hdr;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1493  	qedi_cmd = (struct qedi_cmd *)mtask->dd_data;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1494  	ep = qedi_conn->ep;
b19775e4785996 manish.rangankar@cavium.com 2017-05-19  1495  	if (!ep)
b19775e4785996 manish.rangankar@cavium.com 2017-05-19  1496  		return -ENODEV;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1497  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1498  	tid = qedi_get_task_idx(qedi);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1499  	if (tid == -1)
be086e7c53f1fa Mintz, Yuval                2017-03-11  1500  		return -ENOMEM;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1501  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1502  	fw_task_ctx =
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1503  	     (struct e4_iscsi_task_context *)qedi_get_task_mem(&qedi->tasks,
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1504  							       tid);
21dd79e82f00b2 Tomer Tayar                 2017-12-27  1505  	memset(fw_task_ctx, 0, sizeof(struct e4_iscsi_task_context));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1506  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1507  	qedi_cmd->task_id = tid;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1508  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1509  	memset(&task_params, 0, sizeof(task_params));
be086e7c53f1fa Mintz, Yuval                2017-03-11  1510  	memset(&tmf_pdu_header, 0, sizeof(tmf_pdu_header));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1511  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1512  	/* Update header info */
be086e7c53f1fa Mintz, Yuval                2017-03-11  1513  	qedi_update_itt_map(qedi, tid, mtask->itt, qedi_cmd);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1514  	tmf_pdu_header.itt = qedi_set_itt(tid, get_itt(mtask->itt));
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1515  	tmf_pdu_header.cmd_sn = be32_to_cpu(tmf_hdr->cmdsn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1516  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1517  	memcpy(scsi_lun, &tmf_hdr->lun, sizeof(struct scsi_lun));
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1518  	tmf_pdu_header.lun.lo = be32_to_cpu(scsi_lun[0]);
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1519  	tmf_pdu_header.lun.hi = be32_to_cpu(scsi_lun[1]);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1520  
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1521  	if ((tmf_hdr->flags & ISCSI_FLAG_TM_FUNC_MASK) ==
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1522  	     ISCSI_TM_FUNC_ABORT_TASK) {
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1523  		ctask = iscsi_itt_to_task(conn, tmf_hdr->rtt);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1524  		if (!ctask || !ctask->sc) {
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1525  			QEDI_ERR(&qedi->dbg_ctx,
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1526  				 "Could not get reference task\n");
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1527  			return 0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1528  		}
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1529  		cmd = (struct qedi_cmd *)ctask->dd_data;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1530  		tmf_pdu_header.rtt =
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1531  				qedi_set_itt(cmd->task_id,
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1532  					     get_itt(tmf_hdr->rtt));
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1533  	} else {
be086e7c53f1fa Mintz, Yuval                2017-03-11  1534  		tmf_pdu_header.rtt = ISCSI_RESERVED_TAG;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1535  	}
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1536  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1537  	tmf_pdu_header.opcode = tmf_hdr->opcode;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1538  	tmf_pdu_header.function = tmf_hdr->flags;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1539  	tmf_pdu_header.hdr_second_dword = ntoh24(tmf_hdr->dlength);
be086e7c53f1fa Mintz, Yuval                2017-03-11 @1540  	tmf_pdu_header.ref_cmd_sn = be32_to_cpu(tmf_hdr->refcmdsn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1541  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1542  	/* Fill fw input params */
be086e7c53f1fa Mintz, Yuval                2017-03-11  1543  	task_params.context = fw_task_ctx;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1544  	task_params.conn_icid = (u16)qedi_conn->iscsi_conn_id;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1545  	task_params.itid = tid;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1546  	task_params.cq_rss_number = 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1547  	task_params.tx_io_size = 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1548  	task_params.rx_io_size = 0;
be086e7c53f1fa Mintz, Yuval                2017-03-11  1549  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1550  	sq_idx = qedi_get_wqe_idx(qedi_conn);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1551  	task_params.sqe = &ep->sq[sq_idx];
be086e7c53f1fa Mintz, Yuval                2017-03-11  1552  
be086e7c53f1fa Mintz, Yuval                2017-03-11  1553  	memset(task_params.sqe, 0, sizeof(struct iscsi_wqe));
be086e7c53f1fa Mintz, Yuval                2017-03-11  1554  	rval = init_initiator_tmf_request_task(&task_params,
be086e7c53f1fa Mintz, Yuval                2017-03-11  1555  					       &tmf_pdu_header);
be086e7c53f1fa Mintz, Yuval                2017-03-11  1556  	if (rval)
be086e7c53f1fa Mintz, Yuval                2017-03-11  1557  		return -1;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1558  
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1559  	spin_lock(&qedi_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1560  	list_add_tail(&qedi_cmd->io_cmd, &qedi_conn->active_cmd_list);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1561  	qedi_cmd->io_cmd_in_list = true;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1562  	qedi_conn->active_cmd_count++;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1563  	spin_unlock(&qedi_conn->list_lock);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1564  
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1565  	qedi_ring_doorbell(qedi_conn);
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1566  	return 0;
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1567  }
ace7f46ba5fde7 Manish Rangankar            2016-12-01  1568  

:::::: The code at line 1515 was first introduced by commit
:::::: be086e7c53f1fac51eed14523b28f2214b548dd2 qed*: Utilize Firmware 8.15.3.0

:::::: TO: Mintz, Yuval <Yuval.Mintz@cavium.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

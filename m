Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B007B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 21:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678571585; x=1710107585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ir4IkrRY38NmzXi/2Ik7SIZbMZi8vJ10pJB2g2IDBTA=;
  b=HPRI0rHNhNFUN1Qv0OP2xylaDQXLePag8yN6GDch+WzB/EjJALeBW30S
   qhYNLQL988cQAMSCcBxFfrb61RMGwcw5NJtYqzF18B+VJLK5MXKIU7C4o
   YtUvO/FW7bNHW+cL5C3qA3vmoTmFFEhnzS+oBB3y3yrHwI58iDrejlScM
   hM+OAQKOQIKDGsmdqgn85YC8DbwLs4zX3bXwVOkiHyGw9rj0Cyx59YBqP
   htSGKxZVSJX7lPSC8MD+2KLK9KrH2HFiQACrtr/wr3Mnve5ZapEtMeoDt
   wiDo6x8w6FjJWiWPK61jd6HWbNaz1s235fXq9tYRkuWHERHljvxIwNLd6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="364600851"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="364600851"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 13:53:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="1007525760"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="1007525760"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Mar 2023 13:53:03 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb79C-0004oh-1d;
	Sat, 11 Mar 2023 21:53:02 +0000
Date: Sun, 12 Mar 2023 05:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202303120504.v9lwBSwS-lkp@intel.com>
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
TO: Stafford Horne <shorne@gmail.com>

Hi Stafford,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   81ff855485a366a391dc3aed3942715e676ed132
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: openrisc-randconfig-s042-20230311 (https://download.01.org/0day-ci/archive/20230312/202303120504.v9lwBSwS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ded2ee36313c941f1a12b6f85cde295b575264ae
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ded2ee36313c941f1a12b6f85cde295b575264ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/scsi/bnx2fc/ drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303120504.v9lwBSwS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:87:41: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:88:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] dummy_buffer_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:88:41: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] dummy_buffer_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:88:41: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:89:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] task_list_pbl_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:89:42: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] task_list_pbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:89:42: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:90:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] task_list_pbl_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:90:42: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] task_list_pbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:90:42: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:92:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] mtu @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:92:24: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] mtu
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:92:24: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:109:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hash_tbl_pbl_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:109:41: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hash_tbl_pbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:109:41: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:110:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] hash_tbl_pbl_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:110:41: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] hash_tbl_pbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:110:41: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:113:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] t2_hash_tbl_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:113:40: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] t2_hash_tbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:113:40: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:114:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] t2_hash_tbl_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:114:40: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] t2_hash_tbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:114:40: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:117:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] t2_ptr_hash_tbl_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:117:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] t2_ptr_hash_tbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:117:44: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:118:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] t2_ptr_hash_tbl_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:118:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] t2_ptr_hash_tbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:118:44: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:121:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] free_list_count @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:121:36: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] free_list_count
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:121:36: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:128:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] error_bit_map_lo @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:128:37: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] error_bit_map_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:128:37: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:129:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] error_bit_map_hi @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:129:37: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] error_bit_map_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:129:37: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:199:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] fcoe_conn_id @@     got unsigned short [assigned] [usertype] conn_id @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:199:32: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] fcoe_conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:199:32: sparse:     got unsigned short [assigned] [usertype] conn_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:202:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] sq_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:202:30: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] sq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:202:30: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:203:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] sq_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:203:30: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] sq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:203:30: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:205:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] rq_pbl_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:205:34: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] rq_pbl_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:205:34: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:206:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] rq_pbl_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:206:34: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] rq_pbl_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:206:34: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:208:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:208:40: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:208:40: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] rq_first_pbe_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:209:40: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] rq_prod @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] rq_prod
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:212:27: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] tx_max_fc_pay_len @@     got unsigned short [usertype] maxframe_size @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] tx_max_fc_pay_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:221:37: sparse:     got unsigned short [usertype] maxframe_size
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] cq_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] cq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:223:30: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] cq_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] cq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:224:30: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] xferq_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] xferq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:226:33: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] xferq_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] xferq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:227:33: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_db_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_db_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:229:35: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] conn_db_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] conn_db_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:230:35: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] vlan_tag @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] vlan_tag
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:239:28: sparse:     got int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse: sparse: invalid assignment: |=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse:    left side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:241:28: sparse:    right side has type int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] tx_total_conc_seqs @@     got unsigned short [usertype] max_seq @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] tx_total_conc_seqs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:264:38: sparse:     got unsigned short [usertype] max_seq
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] rx_max_fc_pay_len @@     got unsigned int [usertype] mfs @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] rx_max_fc_pay_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:267:38: sparse:     got unsigned int [usertype] mfs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] rx_total_conc_seqs @@     got int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] rx_total_conc_seqs
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:269:38: sparse:     got int
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_lo @@     got unsigned int [usertype] confq_dma @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:273:43: sparse:     got unsigned int [usertype] confq_dma
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] confq_first_pbe_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:274:43: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] lcq_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] lcq_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:332:31: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] lcq_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] lcq_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:333:31: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:335:42: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] confq_pbl_base_addr_hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:336:42: sparse:     got unsigned int [usertype]
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
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:966:16: sparse:     got restricted __le32 [usertype]
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
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __le32 [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:16: sparse:     expected unsigned int [usertype] value
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1439:16: sparse:     got restricted __le32 [usertype]
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
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] low_exp_ro @@     got unsigned int [usertype] orig_offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse:     expected restricted __le32 [usertype] low_exp_ro
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1564:55: sparse:     got unsigned int [usertype] orig_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1565:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] high_exp_ro @@     got unsigned int [usertype] orig_offset @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1565:56: sparse:     expected restricted __le32 [usertype] high_exp_ro
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1565:56: sparse:     got unsigned int [usertype] orig_offset
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1592:63: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] cleaned_task_id @@     got unsigned short [usertype] orig_xid @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1592:63: sparse:     expected restricted __le16 [usertype] cleaned_task_id
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1592:63: sparse:     got unsigned short [usertype] orig_xid
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1600:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] init_flags @@     got unsigned int @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1600:46: sparse:     expected restricted __le32 [usertype] init_flags
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1600:46: sparse:     got unsigned int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1602:42: sparse: sparse: invalid assignment: |=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1602:42: sparse:    left side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1602:42: sparse:    right side has type int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1638:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] lo @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1638:69: sparse:     expected restricted __le32 [usertype] lo
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1638:69: sparse:     got unsigned int [usertype]
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1640:69: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] hi @@     got unsigned int [usertype] @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1640:69: sparse:     expected restricted __le32 [usertype] hi
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1640:69: sparse:     got unsigned int [usertype]
>> drivers/scsi/bnx2fc/bnx2fc_hwi.c:1665:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] data_2_trns @@     got unsigned int [usertype] data_xfer_len @@
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1665:47: sparse:     expected restricted __le32 [usertype] data_2_trns
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1665:47: sparse:     got unsigned int [usertype] data_xfer_len
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1668:42: sparse: sparse: invalid assignment: |=
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1668:42: sparse:    left side has type restricted __le16
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1668:42: sparse:    right side has type int
   drivers/scsi/bnx2fc/bnx2fc_hwi.c:1672:46: sparse: sparse: too many warnings

vim +273 drivers/scsi/bnx2fc/bnx2fc_hwi.c

853e2bd2103aaa Bhanu Gollapudi         2011-02-04  164  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  165  /**
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  166   * bnx2fc_send_session_ofld_req - initiates FCoE Session offload process
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  167   *
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  168   * @port:		port structure pointer
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  169   * @tgt:		bnx2fc_rport structure pointer
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  170   */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  171  int bnx2fc_send_session_ofld_req(struct fcoe_port *port,
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  172  					struct bnx2fc_rport *tgt)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  173  {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  174  	struct fc_lport *lport = port->lport;
aea71a024914e8 Bhanu Prakash Gollapudi 2011-07-26  175  	struct bnx2fc_interface *interface = port->priv;
fd8f89027d816c Robert Love             2012-05-22  176  	struct fcoe_ctlr *ctlr = bnx2fc_to_ctlr(interface);
aea71a024914e8 Bhanu Prakash Gollapudi 2011-07-26  177  	struct bnx2fc_hba *hba = interface->hba;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  178  	struct kwqe *kwqe_arr[4];
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  179  	struct fcoe_kwqe_conn_offload1 ofld_req1;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  180  	struct fcoe_kwqe_conn_offload2 ofld_req2;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  181  	struct fcoe_kwqe_conn_offload3 ofld_req3;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  182  	struct fcoe_kwqe_conn_offload4 ofld_req4;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  183  	struct fc_rport_priv *rdata = tgt->rdata;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  184  	struct fc_rport *rport = tgt->rport;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  185  	int num_kwqes = 4;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  186  	u32 port_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  187  	int rc = 0;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  188  	u16 conn_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  189  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  190  	/* Initialize offload request 1 structure */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  191  	memset(&ofld_req1, 0x00, sizeof(struct fcoe_kwqe_conn_offload1));
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  192  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  193  	ofld_req1.hdr.op_code = FCOE_KWQE_OPCODE_OFFLOAD_CONN1;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  194  	ofld_req1.hdr.flags =
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  195  		(FCOE_KWQE_LAYER_CODE << FCOE_KWQE_HEADER_LAYER_CODE_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  196  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  197  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  198  	conn_id = (u16)tgt->fcoe_conn_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  199  	ofld_req1.fcoe_conn_id = conn_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  200  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  201  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  202  	ofld_req1.sq_addr_lo = (u32) tgt->sq_dma;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  203  	ofld_req1.sq_addr_hi = (u32)((u64) tgt->sq_dma >> 32);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  204  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  205  	ofld_req1.rq_pbl_addr_lo = (u32) tgt->rq_pbl_dma;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  206  	ofld_req1.rq_pbl_addr_hi = (u32)((u64) tgt->rq_pbl_dma >> 32);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  207  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  208  	ofld_req1.rq_first_pbe_addr_lo = (u32) tgt->rq_dma;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  209  	ofld_req1.rq_first_pbe_addr_hi =
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  210  				(u32)((u64) tgt->rq_dma >> 32);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  211  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  212  	ofld_req1.rq_prod = 0x8000;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  213  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  214  	/* Initialize offload request 2 structure */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  215  	memset(&ofld_req2, 0x00, sizeof(struct fcoe_kwqe_conn_offload2));
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  216  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  217  	ofld_req2.hdr.op_code = FCOE_KWQE_OPCODE_OFFLOAD_CONN2;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  218  	ofld_req2.hdr.flags =
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  219  		(FCOE_KWQE_LAYER_CODE << FCOE_KWQE_HEADER_LAYER_CODE_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  220  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  221  	ofld_req2.tx_max_fc_pay_len = rdata->maxframe_size;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  222  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  223  	ofld_req2.cq_addr_lo = (u32) tgt->cq_dma;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  224  	ofld_req2.cq_addr_hi = (u32)((u64)tgt->cq_dma >> 32);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  225  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  226  	ofld_req2.xferq_addr_lo = (u32) tgt->xferq_dma;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  227  	ofld_req2.xferq_addr_hi = (u32)((u64)tgt->xferq_dma >> 32);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  228  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  229  	ofld_req2.conn_db_addr_lo = (u32)tgt->conn_db_dma;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  230  	ofld_req2.conn_db_addr_hi = (u32)((u64)tgt->conn_db_dma >> 32);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  231  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  232  	/* Initialize offload request 3 structure */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  233  	memset(&ofld_req3, 0x00, sizeof(struct fcoe_kwqe_conn_offload3));
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  234  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  235  	ofld_req3.hdr.op_code = FCOE_KWQE_OPCODE_OFFLOAD_CONN3;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  236  	ofld_req3.hdr.flags =
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  237  		(FCOE_KWQE_LAYER_CODE << FCOE_KWQE_HEADER_LAYER_CODE_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  238  
aea71a024914e8 Bhanu Prakash Gollapudi 2011-07-26  239  	ofld_req3.vlan_tag = interface->vlan_id <<
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  240  				FCOE_KWQE_CONN_OFFLOAD3_VLAN_ID_SHIFT;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  241  	ofld_req3.vlan_tag |= 3 << FCOE_KWQE_CONN_OFFLOAD3_PRIORITY_SHIFT;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  242  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  243  	port_id = fc_host_port_id(lport->host);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  244  	if (port_id == 0) {
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  245  		BNX2FC_HBA_DBG(lport, "ofld_req: port_id = 0, link down?\n");
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  246  		return -EINVAL;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  247  	}
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  248  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  249  	/*
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  250  	 * Store s_id of the initiator for further reference. This will
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  251  	 * be used during disable/destroy during linkdown processing as
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  252  	 * when the lport is reset, the port_id also is reset to 0
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  253  	 */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  254  	tgt->sid = port_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  255  	ofld_req3.s_id[0] = (port_id & 0x000000FF);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  256  	ofld_req3.s_id[1] = (port_id & 0x0000FF00) >> 8;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  257  	ofld_req3.s_id[2] = (port_id & 0x00FF0000) >> 16;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  258  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  259  	port_id = rport->port_id;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  260  	ofld_req3.d_id[0] = (port_id & 0x000000FF);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  261  	ofld_req3.d_id[1] = (port_id & 0x0000FF00) >> 8;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  262  	ofld_req3.d_id[2] = (port_id & 0x00FF0000) >> 16;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  263  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  264  	ofld_req3.tx_total_conc_seqs = rdata->max_seq;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  265  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  266  	ofld_req3.tx_max_conc_seqs_c3 = rdata->max_seq;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  267  	ofld_req3.rx_max_fc_pay_len  = lport->mfs;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  268  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  269  	ofld_req3.rx_total_conc_seqs = BNX2FC_MAX_SEQS;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  270  	ofld_req3.rx_max_conc_seqs_c3 = BNX2FC_MAX_SEQS;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  271  	ofld_req3.rx_open_seqs_exch_c3 = 1;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  272  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04 @273  	ofld_req3.confq_first_pbe_addr_lo = tgt->confq_dma;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  274  	ofld_req3.confq_first_pbe_addr_hi = (u32)((u64) tgt->confq_dma >> 32);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  275  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  276  	/* set mul_n_port_ids supported flag to 0, until it is supported */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  277  	ofld_req3.flags = 0;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  278  	/*
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  279  	ofld_req3.flags |= (((lport->send_sp_features & FC_SP_FT_MNA) ? 1:0) <<
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  280  			    FCOE_KWQE_CONN_OFFLOAD3_B_MUL_N_PORT_IDS_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  281  	*/
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  282  	/* Info from PLOGI response */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  283  	ofld_req3.flags |= (((rdata->sp_features & FC_SP_FT_EDTR) ? 1 : 0) <<
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  284  			     FCOE_KWQE_CONN_OFFLOAD3_B_E_D_TOV_RES_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  285  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  286  	ofld_req3.flags |= (((rdata->sp_features & FC_SP_FT_SEQC) ? 1 : 0) <<
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  287  			     FCOE_KWQE_CONN_OFFLOAD3_B_CONT_INCR_SEQ_CNT_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  288  
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  289  	/*
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  290  	 * Info from PRLI response, this info is used for sequence level error
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  291  	 * recovery support
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  292  	 */
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  293  	if (tgt->dev_type == TYPE_TAPE) {
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  294  		ofld_req3.flags |= 1 <<
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  295  				    FCOE_KWQE_CONN_OFFLOAD3_B_CONF_REQ_SHIFT;
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  296  		ofld_req3.flags |= (((rdata->flags & FC_RP_FLAGS_REC_SUPPORTED)
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  297  				    ? 1 : 0) <<
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  298  				    FCOE_KWQE_CONN_OFFLOAD3_B_REC_VALID_SHIFT);
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  299  	}
b252f4c7c39cc4 Bhanu Prakash Gollapudi 2011-07-26  300  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  301  	/* vlan flag */
aea71a024914e8 Bhanu Prakash Gollapudi 2011-07-26  302  	ofld_req3.flags |= (interface->vlan_enabled <<
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  303  			    FCOE_KWQE_CONN_OFFLOAD3_B_VLAN_FLAG_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  304  
d7558148084de0 Masanari Iida           2012-08-22  305  	/* C2_VALID and ACK flags are not set as they are not supported */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  306  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  307  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  308  	/* Initialize offload request 4 structure */
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  309  	memset(&ofld_req4, 0x00, sizeof(struct fcoe_kwqe_conn_offload4));
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  310  	ofld_req4.hdr.op_code = FCOE_KWQE_OPCODE_OFFLOAD_CONN4;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  311  	ofld_req4.hdr.flags =
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  312  		(FCOE_KWQE_LAYER_CODE << FCOE_KWQE_HEADER_LAYER_CODE_SHIFT);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  313  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  314  	ofld_req4.e_d_tov_timer_val = lport->e_d_tov / 20;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  315  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  316  
619c5cb6885b93 Vlad Zolotarov          2011-06-14  317  	ofld_req4.src_mac_addr_lo[0] =  port->data_src_addr[5];
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  318  							/* local mac */
619c5cb6885b93 Vlad Zolotarov          2011-06-14  319  	ofld_req4.src_mac_addr_lo[1] =  port->data_src_addr[4];
619c5cb6885b93 Vlad Zolotarov          2011-06-14  320  	ofld_req4.src_mac_addr_mid[0] =  port->data_src_addr[3];
619c5cb6885b93 Vlad Zolotarov          2011-06-14  321  	ofld_req4.src_mac_addr_mid[1] =  port->data_src_addr[2];
619c5cb6885b93 Vlad Zolotarov          2011-06-14  322  	ofld_req4.src_mac_addr_hi[0] =  port->data_src_addr[1];
619c5cb6885b93 Vlad Zolotarov          2011-06-14  323  	ofld_req4.src_mac_addr_hi[1] =  port->data_src_addr[0];
fd8f89027d816c Robert Love             2012-05-22  324  	ofld_req4.dst_mac_addr_lo[0] =  ctlr->dest_addr[5];
aea71a024914e8 Bhanu Prakash Gollapudi 2011-07-26  325  							/* fcf mac */
fd8f89027d816c Robert Love             2012-05-22  326  	ofld_req4.dst_mac_addr_lo[1] = ctlr->dest_addr[4];
fd8f89027d816c Robert Love             2012-05-22  327  	ofld_req4.dst_mac_addr_mid[0] = ctlr->dest_addr[3];
fd8f89027d816c Robert Love             2012-05-22  328  	ofld_req4.dst_mac_addr_mid[1] = ctlr->dest_addr[2];
fd8f89027d816c Robert Love             2012-05-22  329  	ofld_req4.dst_mac_addr_hi[0] = ctlr->dest_addr[1];
fd8f89027d816c Robert Love             2012-05-22  330  	ofld_req4.dst_mac_addr_hi[1] = ctlr->dest_addr[0];
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  331  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  332  	ofld_req4.lcq_addr_lo = (u32) tgt->lcq_dma;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  333  	ofld_req4.lcq_addr_hi = (u32)((u64) tgt->lcq_dma >> 32);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  334  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  335  	ofld_req4.confq_pbl_base_addr_lo = (u32) tgt->confq_pbl_dma;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  336  	ofld_req4.confq_pbl_base_addr_hi =
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  337  					(u32)((u64) tgt->confq_pbl_dma >> 32);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  338  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  339  	kwqe_arr[0] = (struct kwqe *) &ofld_req1;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  340  	kwqe_arr[1] = (struct kwqe *) &ofld_req2;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  341  	kwqe_arr[2] = (struct kwqe *) &ofld_req3;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  342  	kwqe_arr[3] = (struct kwqe *) &ofld_req4;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  343  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  344  	if (hba->cnic && hba->cnic->submit_kwqes)
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  345  		rc = hba->cnic->submit_kwqes(hba->cnic, kwqe_arr, num_kwqes);
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  346  
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  347  	return rc;
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  348  }
853e2bd2103aaa Bhanu Gollapudi         2011-02-04  349  

:::::: The code at line 273 was first introduced by commit
:::::: 853e2bd2103aaa91d1ba1c0b57ba17628d836f03 [SCSI] bnx2fc: Broadcom FCoE offload driver

:::::: TO: Bhanu Gollapudi <bprakash@broadcom.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

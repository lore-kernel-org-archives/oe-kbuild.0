Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F2315D4
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Apr 2023 02:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682650158; x=1714186158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o8HATLU2xjWlpjsRqS6GYoK5G2RrNSoyaMEoXf+0MJk=;
  b=jSYKGDBwMRi6hpU5IspOxovWASy1uc2pkAPSZOfKxMlUA78ySuGQIzCg
   J6BCCnvwvZ7nFRgYcneWW12RFIObwfKnyb1HOhJkVu9tV0pwIBvGMP5YD
   BluvtMDaFvBIEt2biG3Dl76YYLuTEMN4c0UyeiIDTBTjZfULgX8PIWkJj
   y7fMMQf3kI2PUhCVWdVhiif4pf8Mg2Uc+9U+D4V4dDVOwXL3pjBoQu5V6
   40hZJ7K29Ey3sPAvC5DlxX/r+wdk+pXBwuI5YNBtTF4mHHgyvouCIEnce
   iPormukY6BNqQD0EqSJAk5pzNu43ECDab0KlpCXemrUbZmahf9LNzLWNu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="349652599"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="349652599"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 19:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="725183389"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="725183389"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Apr 2023 19:49:14 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psEAc-00002P-0m;
	Fri, 28 Apr 2023 02:49:14 +0000
Date: Fri, 28 Apr 2023 10:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ksmbd/smb_common.c:350 smb1_allocate_rsp_buf() warn: Please
 consider using kzalloc instead of kmalloc
Message-ID: <202304281001.oskkuJo0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d06f5a3f7140921ada47d49574ae6fa4de5e2a89
commit: dc8289f912387c3bcfbc5d2db29c8947fa207c11 ksmbd: fix slab-out-of-bounds in init_smb2_rsp_hdr
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: openrisc-randconfig-m041-20230423 (https://download.01.org/0day-ci/archive/20230428/202304281001.oskkuJo0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304281001.oskkuJo0-lkp@intel.com/

smatch warnings:
fs/ksmbd/smb_common.c:350 smb1_allocate_rsp_buf() warn: Please consider using kzalloc instead of kmalloc

vim +350 fs/ksmbd/smb_common.c

dc8289f912387c Namjae Jeon 2023-04-01  341  
dc8289f912387c Namjae Jeon 2023-04-01  342  /**
dc8289f912387c Namjae Jeon 2023-04-01  343   * smb1_allocate_rsp_buf() - allocate response buffer for a command
dc8289f912387c Namjae Jeon 2023-04-01  344   * @work:	smb work containing smb request
dc8289f912387c Namjae Jeon 2023-04-01  345   *
dc8289f912387c Namjae Jeon 2023-04-01  346   * Return:      0 on success, otherwise -ENOMEM
dc8289f912387c Namjae Jeon 2023-04-01  347   */
dc8289f912387c Namjae Jeon 2023-04-01  348  static int smb1_allocate_rsp_buf(struct ksmbd_work *work)
dc8289f912387c Namjae Jeon 2023-04-01  349  {
dc8289f912387c Namjae Jeon 2023-04-01 @350  	work->response_buf = kmalloc(MAX_CIFS_SMALL_BUFFER_SIZE,
dc8289f912387c Namjae Jeon 2023-04-01  351  			GFP_KERNEL | __GFP_ZERO);
dc8289f912387c Namjae Jeon 2023-04-01  352  	work->response_sz = MAX_CIFS_SMALL_BUFFER_SIZE;
dc8289f912387c Namjae Jeon 2023-04-01  353  
dc8289f912387c Namjae Jeon 2023-04-01  354  	if (!work->response_buf) {
dc8289f912387c Namjae Jeon 2023-04-01  355  		pr_err("Failed to allocate %u bytes buffer\n",
dc8289f912387c Namjae Jeon 2023-04-01  356  				MAX_CIFS_SMALL_BUFFER_SIZE);
dc8289f912387c Namjae Jeon 2023-04-01  357  		return -ENOMEM;
dc8289f912387c Namjae Jeon 2023-04-01  358  	}
dc8289f912387c Namjae Jeon 2023-04-01  359  
dc8289f912387c Namjae Jeon 2023-04-01  360  	return 0;
dc8289f912387c Namjae Jeon 2023-04-01  361  }
dc8289f912387c Namjae Jeon 2023-04-01  362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

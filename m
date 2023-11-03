Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5150312B80
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 10:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxIixtWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699006551; x=1730542551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xiopo0PIeDMAqX1fNvel7/fRQQ/V+USVEvmbilnrmvk=;
  b=GxIixtWhTsahO11j6QQMNRecu8llQP+quaC2sr6ioT/UxxegxJgj4Ymn
   rL2w6pjMwQozYWzfL8mTkYqTj1nuiBxeT86EdMUiy1+AHUvQX+2+eiFTw
   bH1X1Q8JUVCQflEii0rLADuKca7s9QoytEFQxkkzGKdFYK1S582IKNUGe
   ZCX8pdHMefawgp3o2lpy+MHFFsQVKbQPbAMEqSMuYpUej4MJhYmU7VKJu
   ojHsqRiJ4QqeG7ozzLnAZ2XcnVmcOHVt3Nx5NTf7r5cV9QLR45Ym8emuS
   FvSr6NAr5NREN//6eiq/pwShs+Yfm8U/qMWSu2C3psn8GWJySTnH6heUt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="10454053"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="10454053"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 03:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1093027154"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1093027154"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2023 03:15:49 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyrDP-0002Ra-13;
	Fri, 03 Nov 2023 10:15:47 +0000
Date: Fri, 3 Nov 2023 18:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/server/ksmbd_work.c:127 __ksmbd_iov_pin_rsp() warn: possible
 memory leak of 'ar'
Message-ID: <202311031837.H3yo7JVl-lkp@intel.com>
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
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 1819a904299942b309f687cc0f08b123500aa178 ksmbd: reorganize ksmbd_iov_pin_rsp()
date:   11 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-141-20231102 (https://download.01.org/0day-ci/archive/20231103/202311031837.H3yo7JVl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311031837.H3yo7JVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311031837.H3yo7JVl-lkp@intel.com/

smatch warnings:
fs/smb/server/ksmbd_work.c:127 __ksmbd_iov_pin_rsp() warn: possible memory leak of 'ar'

vim +/ar +127 fs/smb/server/ksmbd_work.c

1819a904299942 Namjae Jeon 2023-10-09  105  
1819a904299942 Namjae Jeon 2023-10-09  106  static int __ksmbd_iov_pin_rsp(struct ksmbd_work *work, void *ib, int len,
1819a904299942 Namjae Jeon 2023-10-09  107  			       void *aux_buf, unsigned int aux_size)
1819a904299942 Namjae Jeon 2023-10-09  108  {
1819a904299942 Namjae Jeon 2023-10-09  109  	struct aux_read *ar;
1819a904299942 Namjae Jeon 2023-10-09  110  	int need_iov_cnt = 1;
1819a904299942 Namjae Jeon 2023-10-09  111  
1819a904299942 Namjae Jeon 2023-10-09  112  	if (aux_size) {
1819a904299942 Namjae Jeon 2023-10-09  113  		need_iov_cnt++;
1819a904299942 Namjae Jeon 2023-10-09  114  		ar = kmalloc(sizeof(struct aux_read), GFP_KERNEL);
1819a904299942 Namjae Jeon 2023-10-09  115  		if (!ar)
1819a904299942 Namjae Jeon 2023-10-09  116  			return -ENOMEM;
1819a904299942 Namjae Jeon 2023-10-09  117  	}
e2b76ab8b5c932 Namjae Jeon 2023-08-29  118  
1819a904299942 Namjae Jeon 2023-10-09  119  	if (work->iov_alloc_cnt < work->iov_cnt + need_iov_cnt) {
e2b76ab8b5c932 Namjae Jeon 2023-08-29  120  		struct kvec *new;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  121  
e2b76ab8b5c932 Namjae Jeon 2023-08-29  122  		work->iov_alloc_cnt += 4;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  123  		new = krealloc(work->iov,
e2b76ab8b5c932 Namjae Jeon 2023-08-29  124  			       sizeof(struct kvec) * work->iov_alloc_cnt,
e2b76ab8b5c932 Namjae Jeon 2023-08-29  125  			       GFP_KERNEL | __GFP_ZERO);
e2b76ab8b5c932 Namjae Jeon 2023-08-29  126  		if (!new)
e2b76ab8b5c932 Namjae Jeon 2023-08-29 @127  			return -ENOMEM;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  128  		work->iov = new;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  129  	}
e2b76ab8b5c932 Namjae Jeon 2023-08-29  130  
e2b76ab8b5c932 Namjae Jeon 2023-08-29  131  	/* Plus rfc_length size on first iov */
e2b76ab8b5c932 Namjae Jeon 2023-08-29  132  	if (!work->iov_idx) {
e2b76ab8b5c932 Namjae Jeon 2023-08-29  133  		work->iov[work->iov_idx].iov_base = work->response_buf;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  134  		*(__be32 *)work->iov[0].iov_base = 0;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  135  		work->iov[work->iov_idx].iov_len = 4;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  136  		work->iov_cnt++;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  137  	}
e2b76ab8b5c932 Namjae Jeon 2023-08-29  138  
1819a904299942 Namjae Jeon 2023-10-09  139  	__ksmbd_iov_pin(work, ib, len);
e2b76ab8b5c932 Namjae Jeon 2023-08-29  140  	inc_rfc1001_len(work->iov[0].iov_base, len);
e2b76ab8b5c932 Namjae Jeon 2023-08-29  141  
e2b76ab8b5c932 Namjae Jeon 2023-08-29  142  	if (aux_size) {
1819a904299942 Namjae Jeon 2023-10-09  143  		__ksmbd_iov_pin(work, aux_buf, aux_size);
e2b76ab8b5c932 Namjae Jeon 2023-08-29  144  		inc_rfc1001_len(work->iov[0].iov_base, aux_size);
e2b76ab8b5c932 Namjae Jeon 2023-08-29  145  
e2b76ab8b5c932 Namjae Jeon 2023-08-29  146  		ar->buf = aux_buf;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  147  		list_add(&ar->entry, &work->aux_read_list);
e2b76ab8b5c932 Namjae Jeon 2023-08-29  148  	}
e2b76ab8b5c932 Namjae Jeon 2023-08-29  149  
e2b76ab8b5c932 Namjae Jeon 2023-08-29  150  	return 0;
e2b76ab8b5c932 Namjae Jeon 2023-08-29  151  }
e2b76ab8b5c932 Namjae Jeon 2023-08-29  152  

:::::: The code at line 127 was first introduced by commit
:::::: e2b76ab8b5c9327ab2dae6da05d0752eb2f4771d ksmbd: add support for read compound

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

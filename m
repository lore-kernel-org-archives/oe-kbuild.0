Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C3AED2
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Dec 2022 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671436805; x=1702972805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AL1HS41CKIh0RGF1n/eacY0yUiv7DTzou1NAv0t8xQA=;
  b=Cc9Zbx1nlSLeIkBDL0mKQZGVAppJkjzYTN0/RnB52TRYl3FYk3NEkGVR
   1JSVtpRD7j/avo1FbLpz5VYT+tNZZOYFr52hViRa9YU4scWeZHnq7Gnm7
   ssdaDIpvRDKxBwKTCXYgYRBGGvG0KQB3gumKFfwFoDb/WzfxixnULb7ib
   3DqsbjpxKDS0HIh/b/op/J90GjGuH1HDdb0jenpjB1x8nOprZilqjXoDQ
   qxNHdhGAA+a3pdZ2UwBHqsKc8wSyaNhdF/f8Y5in2xO55uXwwnQoIdeTL
   L07AQt9YLRu4I3+IwQP0RNzNF3zrhnpIp3u6ej0f1GslmYcAyxbFot81P
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="298968913"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="298968913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 00:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="652605795"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="652605795"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Dec 2022 00:00:03 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p7B46-0008d4-2M;
	Mon, 19 Dec 2022 08:00:02 +0000
Date: Mon, 19 Dec 2022 15:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: io_uring/timeout.c:232:3: warning: Found a exit path from function
 with non-void return type that has missing return statement [missingReturn]
Message-ID: <202212191557.h0IPOZvH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: io_uring/timeout.c:232:3: warning: Found a exit path from function with non-void return type that has missing return statement [missingReturn]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f9ff5644bcc04221bae56f922122f2b7f5d24d62
commit: 59915143e89fb8dc7b5bd9dcaf628d8181fd54ac io_uring: move timeout opcodes and handling into its own file
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 59915143e89fb8dc7b5bd9dcaf628d8181fd54ac
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> io_uring/timeout.c:232:3: warning: Found a exit path from function with non-void return type that has missing return statement [missingReturn]
     }
     ^
   io_uring/timeout.c:347:3: warning: Found a exit path from function with non-void return type that has missing return statement [missingReturn]
     }
     ^
   io_uring/timeout.c:621:26: warning: Uninitialized variables: timeout.file, timeout.off, timeout.target_seq, timeout.list, timeout.head, timeout.prev [uninitvar]
     struct io_kiocb *req = cmd_to_io_kiocb(timeout);
                            ^

vim +232 io_uring/timeout.c

59915143e89fb8 Jens Axboe 2022-05-25  213  
59915143e89fb8 Jens Axboe 2022-05-25  214  static struct io_kiocb *io_timeout_extract(struct io_ring_ctx *ctx,
59915143e89fb8 Jens Axboe 2022-05-25  215  					   struct io_cancel_data *cd)
59915143e89fb8 Jens Axboe 2022-05-25  216  	__must_hold(&ctx->timeout_lock)
59915143e89fb8 Jens Axboe 2022-05-25  217  {
59915143e89fb8 Jens Axboe 2022-05-25  218  	struct io_timeout *timeout;
59915143e89fb8 Jens Axboe 2022-05-25  219  	struct io_timeout_data *io;
59915143e89fb8 Jens Axboe 2022-05-25  220  	struct io_kiocb *req = NULL;
59915143e89fb8 Jens Axboe 2022-05-25  221  
59915143e89fb8 Jens Axboe 2022-05-25  222  	list_for_each_entry(timeout, &ctx->timeout_list, list) {
59915143e89fb8 Jens Axboe 2022-05-25  223  		struct io_kiocb *tmp = cmd_to_io_kiocb(timeout);
59915143e89fb8 Jens Axboe 2022-05-25  224  
59915143e89fb8 Jens Axboe 2022-05-25  225  		if (!(cd->flags & IORING_ASYNC_CANCEL_ANY) &&
59915143e89fb8 Jens Axboe 2022-05-25  226  		    cd->data != tmp->cqe.user_data)
59915143e89fb8 Jens Axboe 2022-05-25  227  			continue;
59915143e89fb8 Jens Axboe 2022-05-25  228  		if (cd->flags & (IORING_ASYNC_CANCEL_ALL|IORING_ASYNC_CANCEL_ANY)) {
59915143e89fb8 Jens Axboe 2022-05-25  229  			if (cd->seq == tmp->work.cancel_seq)
59915143e89fb8 Jens Axboe 2022-05-25  230  				continue;
59915143e89fb8 Jens Axboe 2022-05-25  231  			tmp->work.cancel_seq = cd->seq;
59915143e89fb8 Jens Axboe 2022-05-25 @232  		}
59915143e89fb8 Jens Axboe 2022-05-25  233  		req = tmp;
59915143e89fb8 Jens Axboe 2022-05-25  234  		break;
59915143e89fb8 Jens Axboe 2022-05-25  235  	}
59915143e89fb8 Jens Axboe 2022-05-25  236  	if (!req)
59915143e89fb8 Jens Axboe 2022-05-25  237  		return ERR_PTR(-ENOENT);
59915143e89fb8 Jens Axboe 2022-05-25  238  
59915143e89fb8 Jens Axboe 2022-05-25  239  	io = req->async_data;
59915143e89fb8 Jens Axboe 2022-05-25  240  	if (hrtimer_try_to_cancel(&io->timer) == -1)
59915143e89fb8 Jens Axboe 2022-05-25  241  		return ERR_PTR(-EALREADY);
59915143e89fb8 Jens Axboe 2022-05-25  242  	timeout = io_kiocb_to_cmd(req);
59915143e89fb8 Jens Axboe 2022-05-25  243  	list_del_init(&timeout->list);
59915143e89fb8 Jens Axboe 2022-05-25  244  	return req;
59915143e89fb8 Jens Axboe 2022-05-25  245  }
59915143e89fb8 Jens Axboe 2022-05-25  246  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

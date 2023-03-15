Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3166123
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Mar 2023 19:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678909445; x=1710445445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xvTSYcOSYk6AdlPk4XIJLwTTVL6KkJog7XaacRPvd+I=;
  b=G6Uu3favbLb6Wg5oMIEw6xPcaua94BZzNkAmYYlEGMN/QP4xghzcVBrl
   s/M9jN8sYuVyp6Jb6ycMNWV/McZGpbX6+iFrQYkMDuimQ4XlW05xvhWCq
   76FjqaxnBvpRjwL1WUxPT4cq4ikWq2T6EJSjrvaa1699C4Te/q13QnAW1
   xZGd0oRdWBZZrEVht8uNluOaHcKFOixALXiHbgVIU1IZFwLRPP2xWs3A9
   gtWv//lLRjHbZY6oS9pqHymaEWLqysGZh7xYr5ZuQmFEHgpeTxRvimNtk
   nymq+0ZSsL4NE9sW+kuEmOHxxxy2LiKJeYJfQuq+FC7jMxJh6WpjRgFnE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="318201761"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="318201761"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 12:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="1008949854"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="1008949854"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2023 12:44:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcX2Z-0007zV-17;
	Wed, 15 Mar 2023 19:44:03 +0000
Date: Thu, 16 Mar 2023 03:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3565/3780] io_uring/io_uring.c:431
 io_prep_async_work() error: we previously assumed 'req->file' could be null
 (see line 424)
Message-ID: <202303160340.jZi4O4HT-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   225b6b81afe63b3850b7cee0a3590f51144f2a75
commit: 2b22f867be6725a9b5917d791510edf6cd5c7232 [3565/3780] io_uring: avoid hashing O_DIRECT writes if the filesystem doesn't need it
:::::: branch date: 18 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230316/202303160340.jZi4O4HT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303160340.jZi4O4HT-lkp@intel.com/

smatch warnings:
io_uring/io_uring.c:431 io_prep_async_work() error: we previously assumed 'req->file' could be null (see line 424)

vim +431 io_uring/io_uring.c

cb2d344c7551c2 fs/io_uring.c       Pavel Begunkov 2022-04-15  407  
1e6fa5216a0e59 fs/io_uring.c       Jens Axboe     2020-10-15  408  static void io_prep_async_work(struct io_kiocb *req)
1e6fa5216a0e59 fs/io_uring.c       Jens Axboe     2020-10-15  409  {
a7dd27828b00be io_uring/io_uring.c Breno Leitao   2023-01-12  410  	const struct io_issue_def *def = &io_issue_defs[req->opcode];
1e6fa5216a0e59 fs/io_uring.c       Jens Axboe     2020-10-15  411  	struct io_ring_ctx *ctx = req->ctx;
1e6fa5216a0e59 fs/io_uring.c       Jens Axboe     2020-10-15  412  
b8e64b53001116 fs/io_uring.c       Pavel Begunkov 2021-06-17  413  	if (!(req->flags & REQ_F_CREDS)) {
b8e64b53001116 fs/io_uring.c       Pavel Begunkov 2021-06-17  414  		req->flags |= REQ_F_CREDS;
c10d1f986b4e2a fs/io_uring.c       Pavel Begunkov 2021-06-17  415  		req->creds = get_current_cred();
b8e64b53001116 fs/io_uring.c       Pavel Begunkov 2021-06-17  416  	}
003e8dccdb2271 fs/io_uring.c       Jens Axboe     2021-03-06  417  
e1d675df1a36e3 fs/io_uring.c       Pavel Begunkov 2021-03-22  418  	req->work.list.next = NULL;
e1d675df1a36e3 fs/io_uring.c       Pavel Begunkov 2021-03-22  419  	req->work.flags = 0;
8e29da69feade6 fs/io_uring.c       Jens Axboe     2022-04-18  420  	req->work.cancel_seq = atomic_read(&ctx->cancel_seq);
feaadc4fc2ebdb fs/io_uring.c       Pavel Begunkov 2020-10-22  421  	if (req->flags & REQ_F_FORCE_ASYNC)
feaadc4fc2ebdb fs/io_uring.c       Pavel Begunkov 2020-10-22  422  		req->work.flags |= IO_WQ_WORK_CONCURRENT;
feaadc4fc2ebdb fs/io_uring.c       Pavel Begunkov 2020-10-22  423  
f6b543fd03d347 io_uring/io_uring.c Jens Axboe     2022-07-21 @424  	if (req->file && !io_req_ffs_set(req))
f6b543fd03d347 io_uring/io_uring.c Jens Axboe     2022-07-21  425  		req->flags |= io_file_get_flags(req->file) << REQ_F_SUPPORT_NOWAIT_BIT;
f6b543fd03d347 io_uring/io_uring.c Jens Axboe     2022-07-21  426  
1e6fa5216a0e59 fs/io_uring.c       Jens Axboe     2020-10-15  427  	if (req->flags & REQ_F_ISREG) {
2b22f867be6725 io_uring/io_uring.c Jens Axboe     2023-03-07  428  		bool should_hash = def->hash_reg_file;
2b22f867be6725 io_uring/io_uring.c Jens Axboe     2023-03-07  429  
2b22f867be6725 io_uring/io_uring.c Jens Axboe     2023-03-07  430  		/* don't serialize this request if the fs doesn't need it */
2b22f867be6725 io_uring/io_uring.c Jens Axboe     2023-03-07 @431  		if (should_hash && (req->file->f_flags & O_DIRECT) &&
2b22f867be6725 io_uring/io_uring.c Jens Axboe     2023-03-07  432  		    (req->file->f_mode & FMODE_DIO_PARALLEL_WRITE))
2b22f867be6725 io_uring/io_uring.c Jens Axboe     2023-03-07  433  			should_hash = false;
2b22f867be6725 io_uring/io_uring.c Jens Axboe     2023-03-07  434  		if (should_hash || (ctx->flags & IORING_SETUP_IOPOLL))
1e6fa5216a0e59 fs/io_uring.c       Jens Axboe     2020-10-15  435  			io_wq_hash_work(&req->work, file_inode(req->file));
4b982bd0f383db fs/io_uring.c       Jens Axboe     2021-04-01  436  	} else if (!req->file || !S_ISBLK(file_inode(req->file)->i_mode)) {
1e6fa5216a0e59 fs/io_uring.c       Jens Axboe     2020-10-15  437  		if (def->unbound_nonreg_file)
1e6fa5216a0e59 fs/io_uring.c       Jens Axboe     2020-10-15  438  			req->work.flags |= IO_WQ_WORK_UNBOUND;
1e6fa5216a0e59 fs/io_uring.c       Jens Axboe     2020-10-15  439  	}
54a91f3bb9b96e fs/io_uring.c       Jens Axboe     2019-09-10  440  }
cccf0ee834559a fs/io_uring.c       Jens Axboe     2020-01-27  441  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

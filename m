Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C35364CA
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 22:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewyVhL+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700087445; x=1731623445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VB3pok3DJkEAPZwf8fJgL+Q4tRFfN/EN633L1jHbAj4=;
  b=ewyVhL+juK8mW8oMVCDCLKqMswWysCgcdB1zRVwzF69sPvcR/3ZeRps3
   qDD/mR+2RU6qD3w9rjTaNHN22bUTjIT8yfocHoJFbLjFkJE8B9mMUWN69
   cCxFzyCpi5k+SMRfRCM3BK7Eo0YWwJSKR4x5BnsPzKcjt3uFWrmkImAn6
   Janrxb86jL2GteJDZ0vB6PDXm37OliO/BSzFv9bvV/782gKq0e6PVmY0K
   /qJXeKUfXyxc+r1ge4yxJpE6dZyBLArxR9bkvgZtbdIpt6oNPvHnGAtPN
   RMsCJHjtSAZZwklh2x5QGLV5i1X9/Zn+mpptq26hjhkb/GsFtSd1tqlEB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370326229"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="370326229"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 14:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="888717836"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="888717836"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Nov 2023 14:30:41 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3OP9-0000uy-29;
	Wed, 15 Nov 2023 22:30:39 +0000
Date: Thu, 16 Nov 2023 06:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] io_uring: Statistics of the true utilization of sq
 threads.
Message-ID: <202311160629.h4GrebJh-lkp@intel.com>
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
In-Reply-To: <20231115121839.12556-1-xiaobing.li@samsung.com>
References: <20231115121839.12556-1-xiaobing.li@samsung.com>
TO: Xiaobing Li <xiaobing.li@samsung.com>
TO: axboe@kernel.dk
TO: asml.silence@gmail.com
CC: linux-kernel@vger.kernel.org
CC: io-uring@vger.kernel.org
CC: kun.dou@samsung.com
CC: peiwei.li@samsung.com
CC: joshi.k@samsung.com
CC: kundan.kumar@samsung.com
CC: wenwen.chen@samsung.com
CC: ruyi.zhang@samsung.com
CC: cliang01.li@samsung.com
CC: xue01.he@samsung.com
CC: Xiaobing Li <xiaobing.li@samsung.com>

Hi Xiaobing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc1 next-20231115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaobing-Li/io_uring-Statistics-of-the-true-utilization-of-sq-threads/20231115-211954
base:   linus/master
patch link:    https://lore.kernel.org/r/20231115121839.12556-1-xiaobing.li%40samsung.com
patch subject: [PATCH v3] io_uring: Statistics of the true utilization of sq threads.
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-161-20231115 (https://download.01.org/0day-ci/archive/20231116/202311160629.h4GrebJh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160629.h4GrebJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311160629.h4GrebJh-lkp@intel.com/

smatch warnings:
io_uring/fdinfo.c:138 io_uring_show_fdinfo() warn: variable dereferenced before check 'ctx' (see line 57)
io_uring/fdinfo.c:144 io_uring_show_fdinfo() error: we previously assumed 'sq' could be null (see line 141)

vim +/ctx +138 io_uring/fdinfo.c

a4ad4f748ea962 Jens Axboe     2022-05-25   48  
3aaf22b62a9270 Jens Axboe     2023-07-10   49  /*
3aaf22b62a9270 Jens Axboe     2023-07-10   50   * Caller holds a reference to the file already, we don't need to do
3aaf22b62a9270 Jens Axboe     2023-07-10   51   * anything else to get an extra reference.
3aaf22b62a9270 Jens Axboe     2023-07-10   52   */
3aaf22b62a9270 Jens Axboe     2023-07-10   53  __cold void io_uring_show_fdinfo(struct seq_file *m, struct file *f)
a4ad4f748ea962 Jens Axboe     2022-05-25   54  {
3aaf22b62a9270 Jens Axboe     2023-07-10   55  	struct io_ring_ctx *ctx = f->private_data;
a4ad4f748ea962 Jens Axboe     2022-05-25   56  	struct io_overflow_cqe *ocqe;
a4ad4f748ea962 Jens Axboe     2022-05-25  @57  	struct io_rings *r = ctx->rings;
a4ad4f748ea962 Jens Axboe     2022-05-25   58  	unsigned int sq_mask = ctx->sq_entries - 1, cq_mask = ctx->cq_entries - 1;
a4ad4f748ea962 Jens Axboe     2022-05-25   59  	unsigned int sq_head = READ_ONCE(r->sq.head);
a4ad4f748ea962 Jens Axboe     2022-05-25   60  	unsigned int sq_tail = READ_ONCE(r->sq.tail);
a4ad4f748ea962 Jens Axboe     2022-05-25   61  	unsigned int cq_head = READ_ONCE(r->cq.head);
a4ad4f748ea962 Jens Axboe     2022-05-25   62  	unsigned int cq_tail = READ_ONCE(r->cq.tail);
a4ad4f748ea962 Jens Axboe     2022-05-25   63  	unsigned int cq_shift = 0;
3b8fdd1dc35e39 Jens Axboe     2022-09-11   64  	unsigned int sq_shift = 0;
a4ad4f748ea962 Jens Axboe     2022-05-25   65  	unsigned int sq_entries, cq_entries;
7644b1a1c9a7ae Jens Axboe     2023-10-21   66  	int sq_pid = -1, sq_cpu = -1;
5b1b61674371b7 Xiaobing Li    2023-11-15   67  	int sq_busy = 0;
a4ad4f748ea962 Jens Axboe     2022-05-25   68  	bool has_lock;
a4ad4f748ea962 Jens Axboe     2022-05-25   69  	unsigned int i;
a4ad4f748ea962 Jens Axboe     2022-05-25   70  
4f731705cc1f15 Jens Axboe     2022-09-11   71  	if (ctx->flags & IORING_SETUP_CQE32)
a4ad4f748ea962 Jens Axboe     2022-05-25   72  		cq_shift = 1;
3b8fdd1dc35e39 Jens Axboe     2022-09-11   73  	if (ctx->flags & IORING_SETUP_SQE128)
3b8fdd1dc35e39 Jens Axboe     2022-09-11   74  		sq_shift = 1;
a4ad4f748ea962 Jens Axboe     2022-05-25   75  
a4ad4f748ea962 Jens Axboe     2022-05-25   76  	/*
a4ad4f748ea962 Jens Axboe     2022-05-25   77  	 * we may get imprecise sqe and cqe info if uring is actively running
a4ad4f748ea962 Jens Axboe     2022-05-25   78  	 * since we get cached_sq_head and cached_cq_tail without uring_lock
a4ad4f748ea962 Jens Axboe     2022-05-25   79  	 * and sq_tail and cq_head are changed by userspace. But it's ok since
a4ad4f748ea962 Jens Axboe     2022-05-25   80  	 * we usually use these info when it is stuck.
a4ad4f748ea962 Jens Axboe     2022-05-25   81  	 */
a4ad4f748ea962 Jens Axboe     2022-05-25   82  	seq_printf(m, "SqMask:\t0x%x\n", sq_mask);
a4ad4f748ea962 Jens Axboe     2022-05-25   83  	seq_printf(m, "SqHead:\t%u\n", sq_head);
a4ad4f748ea962 Jens Axboe     2022-05-25   84  	seq_printf(m, "SqTail:\t%u\n", sq_tail);
a4ad4f748ea962 Jens Axboe     2022-05-25   85  	seq_printf(m, "CachedSqHead:\t%u\n", ctx->cached_sq_head);
a4ad4f748ea962 Jens Axboe     2022-05-25   86  	seq_printf(m, "CqMask:\t0x%x\n", cq_mask);
a4ad4f748ea962 Jens Axboe     2022-05-25   87  	seq_printf(m, "CqHead:\t%u\n", cq_head);
a4ad4f748ea962 Jens Axboe     2022-05-25   88  	seq_printf(m, "CqTail:\t%u\n", cq_tail);
a4ad4f748ea962 Jens Axboe     2022-05-25   89  	seq_printf(m, "CachedCqTail:\t%u\n", ctx->cached_cq_tail);
3b8fdd1dc35e39 Jens Axboe     2022-09-11   90  	seq_printf(m, "SQEs:\t%u\n", sq_tail - sq_head);
a4ad4f748ea962 Jens Axboe     2022-05-25   91  	sq_entries = min(sq_tail - sq_head, ctx->sq_entries);
a4ad4f748ea962 Jens Axboe     2022-05-25   92  	for (i = 0; i < sq_entries; i++) {
a4ad4f748ea962 Jens Axboe     2022-05-25   93  		unsigned int entry = i + sq_head;
a4ad4f748ea962 Jens Axboe     2022-05-25   94  		struct io_uring_sqe *sqe;
3b8fdd1dc35e39 Jens Axboe     2022-09-11   95  		unsigned int sq_idx;
a4ad4f748ea962 Jens Axboe     2022-05-25   96  
32f5dea040ee6e Jens Axboe     2023-09-01   97  		if (ctx->flags & IORING_SETUP_NO_SQARRAY)
32f5dea040ee6e Jens Axboe     2023-09-01   98  			break;
3b8fdd1dc35e39 Jens Axboe     2022-09-11   99  		sq_idx = READ_ONCE(ctx->sq_array[entry & sq_mask]);
a4ad4f748ea962 Jens Axboe     2022-05-25  100  		if (sq_idx > sq_mask)
a4ad4f748ea962 Jens Axboe     2022-05-25  101  			continue;
00927931cb630b Pavel Begunkov 2022-10-11  102  		sqe = &ctx->sq_sqes[sq_idx << sq_shift];
3b8fdd1dc35e39 Jens Axboe     2022-09-11  103  		seq_printf(m, "%5u: opcode:%s, fd:%d, flags:%x, off:%llu, "
3b8fdd1dc35e39 Jens Axboe     2022-09-11  104  			      "addr:0x%llx, rw_flags:0x%x, buf_index:%d "
3b8fdd1dc35e39 Jens Axboe     2022-09-11  105  			      "user_data:%llu",
3b8fdd1dc35e39 Jens Axboe     2022-09-11  106  			   sq_idx, io_uring_get_opcode(sqe->opcode), sqe->fd,
3b8fdd1dc35e39 Jens Axboe     2022-09-11  107  			   sqe->flags, (unsigned long long) sqe->off,
3b8fdd1dc35e39 Jens Axboe     2022-09-11  108  			   (unsigned long long) sqe->addr, sqe->rw_flags,
3b8fdd1dc35e39 Jens Axboe     2022-09-11  109  			   sqe->buf_index, sqe->user_data);
3b8fdd1dc35e39 Jens Axboe     2022-09-11  110  		if (sq_shift) {
3b8fdd1dc35e39 Jens Axboe     2022-09-11  111  			u64 *sqeb = (void *) (sqe + 1);
3b8fdd1dc35e39 Jens Axboe     2022-09-11  112  			int size = sizeof(struct io_uring_sqe) / sizeof(u64);
3b8fdd1dc35e39 Jens Axboe     2022-09-11  113  			int j;
3b8fdd1dc35e39 Jens Axboe     2022-09-11  114  
3b8fdd1dc35e39 Jens Axboe     2022-09-11  115  			for (j = 0; j < size; j++) {
3b8fdd1dc35e39 Jens Axboe     2022-09-11  116  				seq_printf(m, ", e%d:0x%llx", j,
3b8fdd1dc35e39 Jens Axboe     2022-09-11  117  						(unsigned long long) *sqeb);
3b8fdd1dc35e39 Jens Axboe     2022-09-11  118  				sqeb++;
3b8fdd1dc35e39 Jens Axboe     2022-09-11  119  			}
3b8fdd1dc35e39 Jens Axboe     2022-09-11  120  		}
3b8fdd1dc35e39 Jens Axboe     2022-09-11  121  		seq_printf(m, "\n");
a4ad4f748ea962 Jens Axboe     2022-05-25  122  	}
a4ad4f748ea962 Jens Axboe     2022-05-25  123  	seq_printf(m, "CQEs:\t%u\n", cq_tail - cq_head);
a4ad4f748ea962 Jens Axboe     2022-05-25  124  	cq_entries = min(cq_tail - cq_head, ctx->cq_entries);
a4ad4f748ea962 Jens Axboe     2022-05-25  125  	for (i = 0; i < cq_entries; i++) {
a4ad4f748ea962 Jens Axboe     2022-05-25  126  		unsigned int entry = i + cq_head;
a4ad4f748ea962 Jens Axboe     2022-05-25  127  		struct io_uring_cqe *cqe = &r->cqes[(entry & cq_mask) << cq_shift];
a4ad4f748ea962 Jens Axboe     2022-05-25  128  
4f731705cc1f15 Jens Axboe     2022-09-11  129  		seq_printf(m, "%5u: user_data:%llu, res:%d, flag:%x",
a4ad4f748ea962 Jens Axboe     2022-05-25  130  			   entry & cq_mask, cqe->user_data, cqe->res,
a4ad4f748ea962 Jens Axboe     2022-05-25  131  			   cqe->flags);
4f731705cc1f15 Jens Axboe     2022-09-11  132  		if (cq_shift)
4f731705cc1f15 Jens Axboe     2022-09-11  133  			seq_printf(m, ", extra1:%llu, extra2:%llu\n",
4f731705cc1f15 Jens Axboe     2022-09-11  134  					cqe->big_cqe[0], cqe->big_cqe[1]);
4f731705cc1f15 Jens Axboe     2022-09-11  135  		seq_printf(m, "\n");
a4ad4f748ea962 Jens Axboe     2022-05-25  136  	}
a4ad4f748ea962 Jens Axboe     2022-05-25  137  
5b1b61674371b7 Xiaobing Li    2023-11-15 @138  	if (ctx && (ctx->flags & IORING_SETUP_SQPOLL)) {
5b1b61674371b7 Xiaobing Li    2023-11-15  139  		struct io_sq_data *sq = ctx->sq_data;
5b1b61674371b7 Xiaobing Li    2023-11-15  140  
5b1b61674371b7 Xiaobing Li    2023-11-15 @141  		if (sq && sq->total_time != 0)
5b1b61674371b7 Xiaobing Li    2023-11-15  142  			sq_busy = (int)(sq->work_time * 100 / sq->total_time);
5b1b61674371b7 Xiaobing Li    2023-11-15  143  
5b1b61674371b7 Xiaobing Li    2023-11-15 @144  		sq_pid = sq->task_pid;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

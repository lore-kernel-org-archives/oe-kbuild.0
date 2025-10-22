Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABDC336EC0
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761132174; cv=none; b=tENft70l9TjSG8Pbfo2UraussF6ABICjrxrWvb0yyQcQ+CsHF+FFU8pnHbv09QrMwxarLo8k7EVchiEliHrcf/G43+Ge6t3YKA0flfeMiU6Mb3wye+5ownvBBXIJnMxZq8PjeyR05LFDjHk2+6XCnNbej8j2zoA6S2hHNlz9eK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761132174; c=relaxed/simple;
	bh=LSzJYyUruASDCVfQL4mnvuYu76trUMJ8vqTXpONc1W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZUzDryTna41Vyhel9RblRh6v6kTx4Sp+2Uy6nFHsc4OfyZXzqtSWiWpfOf/Yb2fXcbzrRH2lqyiszvcozkpPOuT/mnLCSa9sxuwLetlQZCoU4R1vsGHiOSJAS8tcAxSFGtBVSGWT1NMrQY72x7k8a11HNz/5qpIRVU0JwbS+nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+e+QvGj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+e+QvGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761132172; x=1792668172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LSzJYyUruASDCVfQL4mnvuYu76trUMJ8vqTXpONc1W4=;
  b=P+e+QvGjuBiayiUJdtv6xaCDJT+4SoiD2mjSyC5/CYkc/uyiDgMA/w8B
   d53oxmkRMENtTpYm6W8UC4ib380nJDpsntI+X3DsfOWSS8/dqo87dFOpD
   cU8uk44h6xiINrONNTqP/++qH+gRoCQL9TNJG+x75m2bmxbYNEn6vsYzy
   TEAV8URTu7pA2vAFi3COJ63sOyo2BakLuXqxn9iFXlmc31L/8tO2lSqgD
   D5Va4Gy5pbGpig6AiZtpNH9Z/LtGQ5SDGNDwx8JL+Z6WRF5Q3U6XNOuca
   i4yUSTKkgGnYcHr/pGBEnS4b9vXjxj/OlkTJLyUFFHU0H21bdSOyOmbrm
   Q==;
X-CSE-ConnectionGUID: B28ILR1uTVW+DXiFgR5y4g==
X-CSE-MsgGUID: TkwbC8WAQ+C0bjqjlKBg0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73945596"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="73945596"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:22:51 -0700
X-CSE-ConnectionGUID: YGl9od5oQG6OIHdy6uNKCA==
X-CSE-MsgGUID: jattjX9hS+qaryDJDYG/Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="188973340"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Oct 2025 04:22:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBWvX-000CIL-2t;
	Wed, 22 Oct 2025 11:22:47 +0000
Date: Wed, 22 Oct 2025 19:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3361/3483] io_uring/fdinfo.c:104
 __io_uring_show_fdinfo() error: uninitialized symbol 'sqe'.
Message-ID: <202510221956.4eetanjY-lkp@intel.com>
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
TO: Keith Busch <kbusch@kernel.org>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
commit: 31dc41afdef21f264364288a30013b538c46152e [3361/3483] io_uring: add support for IORING_SETUP_SQE_MIXED
:::::: branch date: 8 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20251022 (https://download.01.org/0day-ci/archive/20251022/202510221956.4eetanjY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510221956.4eetanjY-lkp@intel.com/

smatch warnings:
io_uring/fdinfo.c:104 __io_uring_show_fdinfo() error: uninitialized symbol 'sqe'.

vim +/sqe +104 io_uring/fdinfo.c

6bf90bd8c58a30 Olivier Langlois        2024-10-13   58  
d871198ee431d9 Jens Axboe              2025-05-13   59  static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
a4ad4f748ea962 Jens Axboe              2022-05-25   60  {
a4ad4f748ea962 Jens Axboe              2022-05-25   61  	struct io_overflow_cqe *ocqe;
a4ad4f748ea962 Jens Axboe              2022-05-25   62  	struct io_rings *r = ctx->rings;
3fcb9d17206e31 Xiaobing Li             2024-02-28   63  	struct rusage sq_usage;
a4ad4f748ea962 Jens Axboe              2022-05-25   64  	unsigned int sq_mask = ctx->sq_entries - 1, cq_mask = ctx->cq_entries - 1;
a4ad4f748ea962 Jens Axboe              2022-05-25   65  	unsigned int sq_head = READ_ONCE(r->sq.head);
a4ad4f748ea962 Jens Axboe              2022-05-25   66  	unsigned int sq_tail = READ_ONCE(r->sq.tail);
a4ad4f748ea962 Jens Axboe              2022-05-25   67  	unsigned int cq_head = READ_ONCE(r->cq.head);
a4ad4f748ea962 Jens Axboe              2022-05-25   68  	unsigned int cq_tail = READ_ONCE(r->cq.tail);
3b8fdd1dc35e39 Jens Axboe              2022-09-11   69  	unsigned int sq_shift = 0;
7644b1a1c9a7ae Jens Axboe              2023-10-21   70  	int sq_pid = -1, sq_cpu = -1;
3fcb9d17206e31 Xiaobing Li             2024-02-28   71  	u64 sq_total_time = 0, sq_work_time = 0;
a4ad4f748ea962 Jens Axboe              2022-05-25   72  	unsigned int i;
a4ad4f748ea962 Jens Axboe              2022-05-25   73  
3b8fdd1dc35e39 Jens Axboe              2022-09-11   74  	if (ctx->flags & IORING_SETUP_SQE128)
3b8fdd1dc35e39 Jens Axboe              2022-09-11   75  		sq_shift = 1;
a4ad4f748ea962 Jens Axboe              2022-05-25   76  
a4ad4f748ea962 Jens Axboe              2022-05-25   77  	/*
a4ad4f748ea962 Jens Axboe              2022-05-25   78  	 * we may get imprecise sqe and cqe info if uring is actively running
a4ad4f748ea962 Jens Axboe              2022-05-25   79  	 * since we get cached_sq_head and cached_cq_tail without uring_lock
a4ad4f748ea962 Jens Axboe              2022-05-25   80  	 * and sq_tail and cq_head are changed by userspace. But it's ok since
a4ad4f748ea962 Jens Axboe              2022-05-25   81  	 * we usually use these info when it is stuck.
a4ad4f748ea962 Jens Axboe              2022-05-25   82  	 */
a4ad4f748ea962 Jens Axboe              2022-05-25   83  	seq_printf(m, "SqMask:\t0x%x\n", sq_mask);
a4ad4f748ea962 Jens Axboe              2022-05-25   84  	seq_printf(m, "SqHead:\t%u\n", sq_head);
a4ad4f748ea962 Jens Axboe              2022-05-25   85  	seq_printf(m, "SqTail:\t%u\n", sq_tail);
f024d3a8ded0d8 Jens Axboe              2025-04-30   86  	seq_printf(m, "CachedSqHead:\t%u\n", data_race(ctx->cached_sq_head));
a4ad4f748ea962 Jens Axboe              2022-05-25   87  	seq_printf(m, "CqMask:\t0x%x\n", cq_mask);
a4ad4f748ea962 Jens Axboe              2022-05-25   88  	seq_printf(m, "CqHead:\t%u\n", cq_head);
a4ad4f748ea962 Jens Axboe              2022-05-25   89  	seq_printf(m, "CqTail:\t%u\n", cq_tail);
f024d3a8ded0d8 Jens Axboe              2025-04-30   90  	seq_printf(m, "CachedCqTail:\t%u\n", data_race(ctx->cached_cq_tail));
3b8fdd1dc35e39 Jens Axboe              2022-09-11   91  	seq_printf(m, "SQEs:\t%u\n", sq_tail - sq_head);
31dc41afdef21f Keith Busch             2025-10-16   92  	while (sq_head < sq_tail) {
a4ad4f748ea962 Jens Axboe              2022-05-25   93  		struct io_uring_sqe *sqe;
3b8fdd1dc35e39 Jens Axboe              2022-09-11   94  		unsigned int sq_idx;
31dc41afdef21f Keith Busch             2025-10-16   95  		bool sqe128 = false;
31dc41afdef21f Keith Busch             2025-10-16   96  		u8 opcode;
a4ad4f748ea962 Jens Axboe              2022-05-25   97  
32f5dea040ee6e Jens Axboe              2023-09-01   98  		if (ctx->flags & IORING_SETUP_NO_SQARRAY)
32f5dea040ee6e Jens Axboe              2023-09-01   99  			break;
31dc41afdef21f Keith Busch             2025-10-16  100  		sq_idx = READ_ONCE(ctx->sq_array[sq_head & sq_mask]);
a4ad4f748ea962 Jens Axboe              2022-05-25  101  		if (sq_idx > sq_mask)
a4ad4f748ea962 Jens Axboe              2022-05-25  102  			continue;
31dc41afdef21f Keith Busch             2025-10-16  103  
31dc41afdef21f Keith Busch             2025-10-16 @104  		opcode = READ_ONCE(sqe->opcode);
00927931cb630b Pavel Begunkov          2022-10-11  105  		sqe = &ctx->sq_sqes[sq_idx << sq_shift];
31dc41afdef21f Keith Busch             2025-10-16  106  		if (sq_shift) {
31dc41afdef21f Keith Busch             2025-10-16  107  			sqe128 = true;
31dc41afdef21f Keith Busch             2025-10-16  108  		} else if (io_issue_defs[opcode].is_128) {
31dc41afdef21f Keith Busch             2025-10-16  109  			if (!(ctx->flags & IORING_SETUP_SQE_MIXED)) {
31dc41afdef21f Keith Busch             2025-10-16  110  				seq_printf(m,
31dc41afdef21f Keith Busch             2025-10-16  111  					"%5u: invalid sqe, 128B entry on non-mixed sq\n",
31dc41afdef21f Keith Busch             2025-10-16  112  					sq_idx);
31dc41afdef21f Keith Busch             2025-10-16  113  				break;
31dc41afdef21f Keith Busch             2025-10-16  114  			}
31dc41afdef21f Keith Busch             2025-10-16  115  			if ((++sq_head & sq_mask) == 0) {
31dc41afdef21f Keith Busch             2025-10-16  116  				seq_printf(m,
31dc41afdef21f Keith Busch             2025-10-16  117  					"%5u: corrupted sqe, wrapping 128B entry\n",
31dc41afdef21f Keith Busch             2025-10-16  118  					sq_idx);
31dc41afdef21f Keith Busch             2025-10-16  119  				break;
31dc41afdef21f Keith Busch             2025-10-16  120  			}
31dc41afdef21f Keith Busch             2025-10-16  121  			sqe128 = true;
31dc41afdef21f Keith Busch             2025-10-16  122  		}
3b8fdd1dc35e39 Jens Axboe              2022-09-11  123  		seq_printf(m, "%5u: opcode:%s, fd:%d, flags:%x, off:%llu, "
3b8fdd1dc35e39 Jens Axboe              2022-09-11  124  			      "addr:0x%llx, rw_flags:0x%x, buf_index:%d "
3b8fdd1dc35e39 Jens Axboe              2022-09-11  125  			      "user_data:%llu",
31dc41afdef21f Keith Busch             2025-10-16  126  			   sq_idx, io_uring_get_opcode(opcode), sqe->fd,
3b8fdd1dc35e39 Jens Axboe              2022-09-11  127  			   sqe->flags, (unsigned long long) sqe->off,
3b8fdd1dc35e39 Jens Axboe              2022-09-11  128  			   (unsigned long long) sqe->addr, sqe->rw_flags,
3b8fdd1dc35e39 Jens Axboe              2022-09-11  129  			   sqe->buf_index, sqe->user_data);
31dc41afdef21f Keith Busch             2025-10-16  130  		if (sqe128) {
3b8fdd1dc35e39 Jens Axboe              2022-09-11  131  			u64 *sqeb = (void *) (sqe + 1);
3b8fdd1dc35e39 Jens Axboe              2022-09-11  132  			int size = sizeof(struct io_uring_sqe) / sizeof(u64);
3b8fdd1dc35e39 Jens Axboe              2022-09-11  133  			int j;
3b8fdd1dc35e39 Jens Axboe              2022-09-11  134  
3b8fdd1dc35e39 Jens Axboe              2022-09-11  135  			for (j = 0; j < size; j++) {
3b8fdd1dc35e39 Jens Axboe              2022-09-11  136  				seq_printf(m, ", e%d:0x%llx", j,
3b8fdd1dc35e39 Jens Axboe              2022-09-11  137  						(unsigned long long) *sqeb);
3b8fdd1dc35e39 Jens Axboe              2022-09-11  138  				sqeb++;
3b8fdd1dc35e39 Jens Axboe              2022-09-11  139  			}
3b8fdd1dc35e39 Jens Axboe              2022-09-11  140  		}
3b8fdd1dc35e39 Jens Axboe              2022-09-11  141  		seq_printf(m, "\n");
31dc41afdef21f Keith Busch             2025-10-16  142  		sq_head++;
a4ad4f748ea962 Jens Axboe              2022-05-25  143  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  144  	seq_printf(m, "CQEs:\t%u\n", cq_tail - cq_head);
82ceb7fcc5fff5 Jens Axboe              2025-08-07  145  	while (cq_head < cq_tail) {
82ceb7fcc5fff5 Jens Axboe              2025-08-07  146  		struct io_uring_cqe *cqe;
82ceb7fcc5fff5 Jens Axboe              2025-08-07  147  		bool cqe32 = false;
a4ad4f748ea962 Jens Axboe              2022-05-25  148  
82ceb7fcc5fff5 Jens Axboe              2025-08-07  149  		cqe = &r->cqes[(cq_head & cq_mask)];
82ceb7fcc5fff5 Jens Axboe              2025-08-07  150  		if (cqe->flags & IORING_CQE_F_32 || ctx->flags & IORING_SETUP_CQE32)
82ceb7fcc5fff5 Jens Axboe              2025-08-07  151  			cqe32 = true;
4f731705cc1f15 Jens Axboe              2022-09-11  152  		seq_printf(m, "%5u: user_data:%llu, res:%d, flag:%x",
82ceb7fcc5fff5 Jens Axboe              2025-08-07  153  			   cq_head & cq_mask, cqe->user_data, cqe->res,
a4ad4f748ea962 Jens Axboe              2022-05-25  154  			   cqe->flags);
82ceb7fcc5fff5 Jens Axboe              2025-08-07  155  		if (cqe32)
4f731705cc1f15 Jens Axboe              2022-09-11  156  			seq_printf(m, ", extra1:%llu, extra2:%llu\n",
4f731705cc1f15 Jens Axboe              2022-09-11  157  					cqe->big_cqe[0], cqe->big_cqe[1]);
4f731705cc1f15 Jens Axboe              2022-09-11  158  		seq_printf(m, "\n");
82ceb7fcc5fff5 Jens Axboe              2025-08-07  159  		cq_head++;
82ceb7fcc5fff5 Jens Axboe              2025-08-07  160  		if (cqe32)
82ceb7fcc5fff5 Jens Axboe              2025-08-07  161  			cq_head++;
a4ad4f748ea962 Jens Axboe              2022-05-25  162  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  163  
d871198ee431d9 Jens Axboe              2025-05-13  164  	if (ctx->flags & IORING_SETUP_SQPOLL) {
7644b1a1c9a7ae Jens Axboe              2023-10-21  165  		struct io_sq_data *sq = ctx->sq_data;
ac0b8b327a5677 Penglei Jiang           2025-06-10  166  		struct task_struct *tsk;
7644b1a1c9a7ae Jens Axboe              2023-10-21  167  
ac0b8b327a5677 Penglei Jiang           2025-06-10  168  		rcu_read_lock();
ac0b8b327a5677 Penglei Jiang           2025-06-10  169  		tsk = rcu_dereference(sq->thread);
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  170  		/*
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  171  		 * sq->thread might be NULL if we raced with the sqpoll
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  172  		 * thread termination.
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  173  		 */
ac0b8b327a5677 Penglei Jiang           2025-06-10  174  		if (tsk) {
ac0b8b327a5677 Penglei Jiang           2025-06-10  175  			get_task_struct(tsk);
ac0b8b327a5677 Penglei Jiang           2025-06-10  176  			rcu_read_unlock();
ac0b8b327a5677 Penglei Jiang           2025-06-10  177  			getrusage(tsk, RUSAGE_SELF, &sq_usage);
ac0b8b327a5677 Penglei Jiang           2025-06-10  178  			put_task_struct(tsk);
a0d45c3f596be5 Jens Axboe              2023-11-14  179  			sq_pid = sq->task_pid;
a0d45c3f596be5 Jens Axboe              2023-11-14  180  			sq_cpu = sq->sq_cpu;
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  181  			sq_total_time = (sq_usage.ru_stime.tv_sec * 1000000
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  182  					 + sq_usage.ru_stime.tv_usec);
3fcb9d17206e31 Xiaobing Li             2024-02-28  183  			sq_work_time = sq->work_time;
ac0b8b327a5677 Penglei Jiang           2025-06-10  184  		} else {
ac0b8b327a5677 Penglei Jiang           2025-06-10  185  			rcu_read_unlock();
a4ad4f748ea962 Jens Axboe              2022-05-25  186  		}
606559dc4fa36a Gabriel Krisman Bertazi 2024-03-08  187  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  188  
7644b1a1c9a7ae Jens Axboe              2023-10-21  189  	seq_printf(m, "SqThread:\t%d\n", sq_pid);
7644b1a1c9a7ae Jens Axboe              2023-10-21  190  	seq_printf(m, "SqThreadCpu:\t%d\n", sq_cpu);
3fcb9d17206e31 Xiaobing Li             2024-02-28  191  	seq_printf(m, "SqTotalTime:\t%llu\n", sq_total_time);
3fcb9d17206e31 Xiaobing Li             2024-02-28  192  	seq_printf(m, "SqWorkTime:\t%llu\n", sq_work_time);
3597f2786b687a Jens Axboe              2024-10-26  193  	seq_printf(m, "UserFiles:\t%u\n", ctx->file_table.data.nr);
d871198ee431d9 Jens Axboe              2025-05-13  194  	for (i = 0; i < ctx->file_table.data.nr; i++) {
cb1717a7cd0fc8 Jens Axboe              2024-10-28  195  		struct file *f = NULL;
a4ad4f748ea962 Jens Axboe              2022-05-25  196  
cb1717a7cd0fc8 Jens Axboe              2024-10-28  197  		if (ctx->file_table.data.nodes[i])
cb1717a7cd0fc8 Jens Axboe              2024-10-28  198  			f = io_slot_file(ctx->file_table.data.nodes[i]);
561e3a0c40dc7e Al Viro                 2025-01-19  199  		if (f) {
561e3a0c40dc7e Al Viro                 2025-01-19  200  			seq_printf(m, "%5u: ", i);
561e3a0c40dc7e Al Viro                 2025-01-19  201  			seq_file_path(m, f, " \t\n\\");
561e3a0c40dc7e Al Viro                 2025-01-19  202  			seq_puts(m, "\n");
561e3a0c40dc7e Al Viro                 2025-01-19  203  		}
a4ad4f748ea962 Jens Axboe              2022-05-25  204  	}
3597f2786b687a Jens Axboe              2024-10-26  205  	seq_printf(m, "UserBufs:\t%u\n", ctx->buf_table.nr);
d871198ee431d9 Jens Axboe              2025-05-13  206  	for (i = 0; i < ctx->buf_table.nr; i++) {
d50f94d761a5d9 Jens Axboe              2024-10-30  207  		struct io_mapped_ubuf *buf = NULL;
a4ad4f748ea962 Jens Axboe              2022-05-25  208  
d50f94d761a5d9 Jens Axboe              2024-10-30  209  		if (ctx->buf_table.nodes[i])
d50f94d761a5d9 Jens Axboe              2024-10-30  210  			buf = ctx->buf_table.nodes[i]->buf;
d50f94d761a5d9 Jens Axboe              2024-10-30  211  		if (buf)
9753c642a53bc4 Jens Axboe              2024-09-15  212  			seq_printf(m, "%5u: 0x%llx/%u\n", i, buf->ubuf, buf->len);
d50f94d761a5d9 Jens Axboe              2024-10-30  213  		else
d50f94d761a5d9 Jens Axboe              2024-10-30  214  			seq_printf(m, "%5u: <none>\n", i);
a4ad4f748ea962 Jens Axboe              2022-05-25  215  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  216  
a4ad4f748ea962 Jens Axboe              2022-05-25  217  	seq_puts(m, "PollList:\n");
d871198ee431d9 Jens Axboe              2025-05-13  218  	for (i = 0; i < (1U << ctx->cancel_table.hash_bits); i++) {
e6f89be61410ff Pavel Begunkov          2022-06-16  219  		struct io_hash_bucket *hb = &ctx->cancel_table.hbs[i];
a4ad4f748ea962 Jens Axboe              2022-05-25  220  		struct io_kiocb *req;
a4ad4f748ea962 Jens Axboe              2022-05-25  221  
38513c464d3d45 Hao Xu                  2022-06-16  222  		hlist_for_each_entry(req, &hb->list, hash_node)
a4ad4f748ea962 Jens Axboe              2022-05-25  223  			seq_printf(m, "  op=%d, task_works=%d\n", req->opcode,
b6f58a3f4aa8db Jens Axboe              2024-11-03  224  					task_work_pending(req->tctx->task));
a4ad4f748ea962 Jens Axboe              2022-05-25  225  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  226  
a4ad4f748ea962 Jens Axboe              2022-05-25  227  	seq_puts(m, "CqOverflowList:\n");
38513c464d3d45 Hao Xu                  2022-06-16  228  	spin_lock(&ctx->completion_lock);
a4ad4f748ea962 Jens Axboe              2022-05-25  229  	list_for_each_entry(ocqe, &ctx->cq_overflow_list, list) {
a4ad4f748ea962 Jens Axboe              2022-05-25  230  		struct io_uring_cqe *cqe = &ocqe->cqe;
a4ad4f748ea962 Jens Axboe              2022-05-25  231  
a4ad4f748ea962 Jens Axboe              2022-05-25  232  		seq_printf(m, "  user_data=%llu, res=%d, flags=%x\n",
a4ad4f748ea962 Jens Axboe              2022-05-25  233  			   cqe->user_data, cqe->res, cqe->flags);
a4ad4f748ea962 Jens Axboe              2022-05-25  234  
a4ad4f748ea962 Jens Axboe              2022-05-25  235  	}
a4ad4f748ea962 Jens Axboe              2022-05-25  236  	spin_unlock(&ctx->completion_lock);
6bf90bd8c58a30 Olivier Langlois        2024-10-13  237  	napi_show_fdinfo(ctx, m);
a4ad4f748ea962 Jens Axboe              2022-05-25  238  }
d871198ee431d9 Jens Axboe              2025-05-13  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

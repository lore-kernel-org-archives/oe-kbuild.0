Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326CB23A0
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Mar 2023 05:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678770497; x=1710306497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Th0xYo0xRPRntTO4L/ic+GL+8xBseEDnD3l8T2Q5MFg=;
  b=KIunxqjlwgawDUtaMADGz/Rbw10yni8A/DrnoGZhrFUMzl/EDAcuPbF5
   k+6AI6t2eyAeFzw/yv5XyRPHFZnA2JEx+I3NjYiov4pXdSWQNJTvhavuY
   ytCF73kuIQiVN3rZQ/fOt5FUi79vxO0YZcKAcxDx9m5BQj/tG3rt9urba
   oQuhXdRTWOscxNqZ9wL1ebgbzWyX3ReqjU8AGotgR+zVSRvCBlEbwX05h
   AIU6J55470GSGItCN6NHdEzgW3Cj6pbgG8RjEMGw05024jpwbhgF62hrI
   J8YuONTAHZUe4qYo8Tf05iIw2SSJouw9A+xKfM6H5XOw45VAj2Aa3hrBS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316978841"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="316978841"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 22:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="747864938"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="747864938"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 22:08:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbwtS-0006Y4-1m;
	Tue, 14 Mar 2023 05:08:14 +0000
Date: Tue, 14 Mar 2023 13:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V2 03/17] io_uring: add IORING_OP_FUSED_CMD
Message-ID: <202303141202.PITF2ZKp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230307141520.793891-4-ming.lei@redhat.com>
References: <20230307141520.793891-4-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: io-uring@vger.kernel.org
CC: linux-block@vger.kernel.org
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: ZiyangZhang <ZiyangZhang@linux.alibaba.com>
CC: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
CC: Bernd Schubert <bschubert@ddn.com>
CC: Ming Lei <ming.lei@redhat.com>

Hi Ming,

I love your patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.3-rc2 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/io_uring-add-IO_URING_F_FUSED-and-prepare-for-supporting-OP_FUSED_CMD/20230307-222928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230307141520.793891-4-ming.lei%40redhat.com
patch subject: [PATCH V2 03/17] io_uring: add IORING_OP_FUSED_CMD
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: microblaze-randconfig-s033-20230308 (https://download.01.org/0day-ci/archive/20230314/202303141202.PITF2ZKp-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/5e0eebd84413d4545e5fc0cc0ede6052cc8df81b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ming-Lei/io_uring-add-IO_URING_F_FUSED-and-prepare-for-supporting-OP_FUSED_CMD/20230307-222928
        git checkout 5e0eebd84413d4545e5fc0cc0ede6052cc8df81b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303141202.PITF2ZKp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c: note: in included file (through kernel/sched/../../io_uring/io-wq.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
   kernel/sched/core.c:7040:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7040:17: sparse:    struct task_struct *
   kernel/sched/core.c:7040:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7256:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7256:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7256:22: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2231:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
--
   io_uring/rw.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/rw.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/opdef.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/opdef.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/notif.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/notif.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/fused_cmd.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/fused_cmd.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/sync.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/sync.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/io-wq.c: note: in included file:
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/io-wq.c: note: in included file (through io_uring/io-wq.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/advise.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/advise.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/openclose.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/openclose.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/uring_cmd.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/uring_cmd.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/epoll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/epoll.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/statx.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/statx.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/net.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/net.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/timeout.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/timeout.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/msg_ring.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/msg_ring.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/sqpoll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/sqpoll.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/tctx.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/tctx.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/fdinfo.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/fdinfo.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/cancel.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/cancel.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/xattr.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/xattr.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/nop.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/nop.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/fs.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/fs.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/poll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/poll.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/splice.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/splice.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/io_uring.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/io_uring.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression
--
   io_uring/kbuf.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:116:29: sparse: sparse: no newline at end of file
   io_uring/kbuf.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:475:35: sparse: sparse: bad constant expression

vim +475 include/linux/io_uring_types.h

e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  409  
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  410  enum {
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  411  	/* ctx owns file */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  412  	REQ_F_FIXED_FILE	= BIT(REQ_F_FIXED_FILE_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  413  	/* drain existing IO first */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  414  	REQ_F_IO_DRAIN		= BIT(REQ_F_IO_DRAIN_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  415  	/* linked sqes */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  416  	REQ_F_LINK		= BIT(REQ_F_LINK_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  417  	/* doesn't sever on completion < 0 */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  418  	REQ_F_HARDLINK		= BIT(REQ_F_HARDLINK_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  419  	/* IOSQE_ASYNC */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  420  	REQ_F_FORCE_ASYNC	= BIT(REQ_F_FORCE_ASYNC_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  421  	/* IOSQE_BUFFER_SELECT */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  422  	REQ_F_BUFFER_SELECT	= BIT(REQ_F_BUFFER_SELECT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  423  	/* IOSQE_CQE_SKIP_SUCCESS */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  424  	REQ_F_CQE_SKIP		= BIT(REQ_F_CQE_SKIP_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  425  
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  426  	/* fail rest of links */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  427  	REQ_F_FAIL		= BIT(REQ_F_FAIL_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  428  	/* on inflight list, should be cancelled and waited on exit reliably */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  429  	REQ_F_INFLIGHT		= BIT(REQ_F_INFLIGHT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  430  	/* read/write uses file position */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  431  	REQ_F_CUR_POS		= BIT(REQ_F_CUR_POS_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  432  	/* must not punt to workers */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  433  	REQ_F_NOWAIT		= BIT(REQ_F_NOWAIT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  434  	/* has or had linked timeout */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  435  	REQ_F_LINK_TIMEOUT	= BIT(REQ_F_LINK_TIMEOUT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  436  	/* needs cleanup */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  437  	REQ_F_NEED_CLEANUP	= BIT(REQ_F_NEED_CLEANUP_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  438  	/* already went through poll handler */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  439  	REQ_F_POLLED		= BIT(REQ_F_POLLED_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  440  	/* buffer already selected */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  441  	REQ_F_BUFFER_SELECTED	= BIT(REQ_F_BUFFER_SELECTED_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  442  	/* buffer selected from ring, needs commit */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  443  	REQ_F_BUFFER_RING	= BIT(REQ_F_BUFFER_RING_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  444  	/* caller should reissue async */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  445  	REQ_F_REISSUE		= BIT(REQ_F_REISSUE_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  446  	/* supports async reads/writes */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  447  	REQ_F_SUPPORT_NOWAIT	= BIT(REQ_F_SUPPORT_NOWAIT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  448  	/* regular file */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  449  	REQ_F_ISREG		= BIT(REQ_F_ISREG_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  450  	/* has creds assigned */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  451  	REQ_F_CREDS		= BIT(REQ_F_CREDS_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  452  	/* skip refcounting if not set */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  453  	REQ_F_REFCOUNT		= BIT(REQ_F_REFCOUNT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  454  	/* there is a linked timeout that has to be armed */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  455  	REQ_F_ARM_LTIMEOUT	= BIT(REQ_F_ARM_LTIMEOUT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  456  	/* ->async_data allocated */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  457  	REQ_F_ASYNC_DATA	= BIT(REQ_F_ASYNC_DATA_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  458  	/* don't post CQEs while failing linked requests */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  459  	REQ_F_SKIP_LINK_CQES	= BIT(REQ_F_SKIP_LINK_CQES_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  460  	/* single poll may be active */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  461  	REQ_F_SINGLE_POLL	= BIT(REQ_F_SINGLE_POLL_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  462  	/* double poll may active */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  463  	REQ_F_DOUBLE_POLL	= BIT(REQ_F_DOUBLE_POLL_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  464  	/* request has already done partial IO */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  465  	REQ_F_PARTIAL_IO	= BIT(REQ_F_PARTIAL_IO_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  466  	/* fast poll multishot mode */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  467  	REQ_F_APOLL_MULTISHOT	= BIT(REQ_F_APOLL_MULTISHOT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  468  	/* ->extra1 and ->extra2 are initialised */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  469  	REQ_F_CQE32_INIT	= BIT(REQ_F_CQE32_INIT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  470  	/* recvmsg special flag, clear EPOLLIN */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  471  	REQ_F_CLEAR_POLLIN	= BIT(REQ_F_CLEAR_POLLIN_BIT),
9ca9fb24d5febcc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  472  	/* hashed into ->cancel_hash_locked, protected by ->uring_lock */
9ca9fb24d5febcc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  473  	REQ_F_HASH_LOCKED	= BIT(REQ_F_HASH_LOCKED_BIT),
5e0eebd84413d45 include/linux/io_uring_types.h Ming Lei       2023-03-07  474  	/* slave request in fused cmd, won't be one uring cmd */
5e0eebd84413d45 include/linux/io_uring_types.h Ming Lei       2023-03-07 @475  	REQ_F_FUSED_SLAVE	= BIT(REQ_F_FUSED_SLAVE_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  476  };
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  477  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

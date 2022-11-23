Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A173FE1
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Nov 2022 16:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669222651; x=1700758651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KPIKhy4vb4ANya2wxxkhSVVwV/o6eBzDKepC94dCkzc=;
  b=PLMd5jX0sGKUdzke4lQGvy31p5gLynQF73Ukwp2+mpEhY08YSqnqmjuz
   HTgH0M5E4Uinw3QDV6gGQjsS2DW9qMtyRPbB9PBmU2H5wzm5nb3SOgH9n
   HPC0jnri3uV4ipnVgOJT5SovsrbPpbXBWF0X+9GXkI0lR8RyfOxGuE7ZJ
   I3HbQC/rqYqfIDjh0WwLTWdVNaRt/VsZRh7etBSy3gdEl3K00ZdUnXzqU
   GhejJPJVshH/J9FzOAeZrLmskWESy/wrTu0GBtPXoEabdfbHjINtjDYb8
   PBvMVJ131CYNCJa7jtRjVxd8Nd4md/F+RCgUpq5DxRP69U6fuPKKkzB0U
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="293818116"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="293818116"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 08:57:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="641872044"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="641872044"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 08:57:28 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oxt3w-0002vR-0p;
	Wed, 23 Nov 2022 16:57:28 +0000
Date: Thu, 24 Nov 2022 00:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ammarfaizi2-block:axboe/linux-block/io_uring-bundle 26/29]
 include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant
 expression
Message-ID: <202211240048.59A3BFVS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="sMuQpekBrWtMKT37"
Content-Disposition: inline


--sMuQpekBrWtMKT37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/io_uring-bundle
head:   49cf1fa907044e745c1db3a9ce113a792b4a6987
commit: b4023781d7a6f8fc3abd89a289bec594762e4ea8 [26/29] io_uring: add support for bundles
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: parisc-randconfig-s053-20221123
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/b4023781d7a6f8fc3abd89a289bec594762e4ea8
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/io_uring-bundle
        git checkout b4023781d7a6f8fc3abd89a289bec594762e4ea8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   io_uring/uring_cmd.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/uring_cmd.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/statx.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/statx.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/net.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/net.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/msg_ring.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/msg_ring.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/timeout.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/timeout.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/fdinfo.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/fdinfo.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/tctx.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/tctx.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/sqpoll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/sqpoll.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/poll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/poll.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/kbuf.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/kbuf.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/cancel.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/cancel.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/rw.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/rw.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/notif.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/notif.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/opdef.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/opdef.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/bundle.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/bundle.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/io-wq.c: note: in included file:
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/io-wq.c: note: in included file (through io_uring/io-wq.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/nop.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/nop.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/sync.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/sync.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/splice.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/splice.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/fs.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/fs.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/io_uring.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/io_uring.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/advise.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/advise.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/openclose.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/openclose.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/xattr.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/xattr.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   io_uring/epoll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/epoll.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
--
   kernel/sched/core.c: note: in included file (through kernel/sched/../../io_uring/io-wq.h):
>> include/linux/io_uring_types.h:468:35: sparse: sparse: bad constant expression
   kernel/sched/core.c:6939:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6939:17: sparse:    struct task_struct *
   kernel/sched/core.c:6939:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7155:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7155:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7155:22: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2211:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2211:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2057:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2057:25: sparse:    struct task_struct *

vim +468 include/linux/io_uring_types.h

e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  402  
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  403  enum {
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  404  	/* ctx owns file */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  405  	REQ_F_FIXED_FILE	= BIT(REQ_F_FIXED_FILE_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  406  	/* drain existing IO first */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  407  	REQ_F_IO_DRAIN		= BIT(REQ_F_IO_DRAIN_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  408  	/* linked sqes */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  409  	REQ_F_LINK		= BIT(REQ_F_LINK_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  410  	/* doesn't sever on completion < 0 */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  411  	REQ_F_HARDLINK		= BIT(REQ_F_HARDLINK_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  412  	/* IOSQE_ASYNC */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  413  	REQ_F_FORCE_ASYNC	= BIT(REQ_F_FORCE_ASYNC_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  414  	/* IOSQE_BUFFER_SELECT */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  415  	REQ_F_BUFFER_SELECT	= BIT(REQ_F_BUFFER_SELECT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  416  	/* IOSQE_CQE_SKIP_SUCCESS */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  417  	REQ_F_CQE_SKIP		= BIT(REQ_F_CQE_SKIP_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  418  
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  419  	/* fail rest of links */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  420  	REQ_F_FAIL		= BIT(REQ_F_FAIL_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  421  	/* on inflight list, should be cancelled and waited on exit reliably */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  422  	REQ_F_INFLIGHT		= BIT(REQ_F_INFLIGHT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  423  	/* read/write uses file position */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  424  	REQ_F_CUR_POS		= BIT(REQ_F_CUR_POS_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  425  	/* must not punt to workers */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  426  	REQ_F_NOWAIT		= BIT(REQ_F_NOWAIT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  427  	/* has or had linked timeout */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  428  	REQ_F_LINK_TIMEOUT	= BIT(REQ_F_LINK_TIMEOUT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  429  	/* needs cleanup */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  430  	REQ_F_NEED_CLEANUP	= BIT(REQ_F_NEED_CLEANUP_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  431  	/* already went through poll handler */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  432  	REQ_F_POLLED		= BIT(REQ_F_POLLED_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  433  	/* buffer already selected */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  434  	REQ_F_BUFFER_SELECTED	= BIT(REQ_F_BUFFER_SELECTED_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  435  	/* buffer selected from ring, needs commit */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  436  	REQ_F_BUFFER_RING	= BIT(REQ_F_BUFFER_RING_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  437  	/* caller should reissue async */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  438  	REQ_F_REISSUE		= BIT(REQ_F_REISSUE_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  439  	/* supports async reads/writes */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  440  	REQ_F_SUPPORT_NOWAIT	= BIT(REQ_F_SUPPORT_NOWAIT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  441  	/* regular file */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  442  	REQ_F_ISREG		= BIT(REQ_F_ISREG_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  443  	/* has creds assigned */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  444  	REQ_F_CREDS		= BIT(REQ_F_CREDS_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  445  	/* skip refcounting if not set */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  446  	REQ_F_REFCOUNT		= BIT(REQ_F_REFCOUNT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  447  	/* there is a linked timeout that has to be armed */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  448  	REQ_F_ARM_LTIMEOUT	= BIT(REQ_F_ARM_LTIMEOUT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  449  	/* ->async_data allocated */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  450  	REQ_F_ASYNC_DATA	= BIT(REQ_F_ASYNC_DATA_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  451  	/* don't post CQEs while failing linked requests */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  452  	REQ_F_SKIP_LINK_CQES	= BIT(REQ_F_SKIP_LINK_CQES_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  453  	/* single poll may be active */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  454  	REQ_F_SINGLE_POLL	= BIT(REQ_F_SINGLE_POLL_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  455  	/* double poll may active */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  456  	REQ_F_DOUBLE_POLL	= BIT(REQ_F_DOUBLE_POLL_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  457  	/* request has already done partial IO */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  458  	REQ_F_PARTIAL_IO	= BIT(REQ_F_PARTIAL_IO_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  459  	/* fast poll multishot mode */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  460  	REQ_F_APOLL_MULTISHOT	= BIT(REQ_F_APOLL_MULTISHOT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  461  	/* ->extra1 and ->extra2 are initialised */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  462  	REQ_F_CQE32_INIT	= BIT(REQ_F_CQE32_INIT_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  463  	/* recvmsg special flag, clear EPOLLIN */
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  464  	REQ_F_CLEAR_POLLIN	= BIT(REQ_F_CLEAR_POLLIN_BIT),
9ca9fb24d5febcc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  465  	/* hashed into ->cancel_hash_locked, protected by ->uring_lock */
9ca9fb24d5febcc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  466  	REQ_F_HASH_LOCKED	= BIT(REQ_F_HASH_LOCKED_BIT),
b4023781d7a6f8f include/linux/io_uring_types.h Jens Axboe     2022-11-22  467  	/* request is part of a bundle */
b4023781d7a6f8f include/linux/io_uring_types.h Jens Axboe     2022-11-22 @468  	REQ_F_BUNDLE		= BIT(REQ_F_BUNDLE_BIT),
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  469  };
e27f928ee1cb068 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  470  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--sMuQpekBrWtMKT37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/parisc 6.1.0-rc6 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="hppa-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_WATCH_QUEUE is not set
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_LEGACY_TIMER_TICK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# BPF subsystem
#
# CONFIG_BPF_SYSCALL is not set
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
# CONFIG_FORCE_TASKS_RCU is not set
# CONFIG_FORCE_TASKS_RUDE_RCU is not set
# CONFIG_FORCE_TASKS_TRACE_RCU is not set
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_BOOST=y
CONFIG_RCU_BOOST_DELAY=500
CONFIG_RCU_EXP_KTHREAD=y
# CONFIG_RCU_NOCB_CPU is not set
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
# CONFIG_CGROUPS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_SYSFS_DEPRECATED=y
# CONFIG_SYSFS_DEPRECATED_V2 is not set
# CONFIG_RELAY is not set
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_BOOT_CONFIG is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW=y
CONFIG_EXPERT=y
# CONFIG_MULTIUSER is not set
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
# CONFIG_FHANDLE is not set
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
# CONFIG_FUTEX is not set
# CONFIG_EPOLL is not set
# CONFIG_SIGNALFD is not set
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
# CONFIG_SHMEM is not set
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

# CONFIG_PROFILING is not set
# end of General setup

CONFIG_PARISC=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_MMU=y
CONFIG_STACK_GROWSUP=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_PGTABLE_LEVELS=2

#
# Processor type and features
#
# CONFIG_PA7000 is not set
# CONFIG_PA7100LC is not set
# CONFIG_PA7200 is not set
# CONFIG_PA7300LC is not set
CONFIG_PA8X00=y
CONFIG_PA20=y
CONFIG_PREFETCH=y
CONFIG_PARISC_HUGE_KERNEL=y
CONFIG_MLONGCALLS=y
# CONFIG_64BIT is not set
CONFIG_PARISC_PAGE_SIZE_4KB=y
# CONFIG_SMP is not set
# CONFIG_IRQSTACKS is not set
CONFIG_ARCH_FLATMEM_ENABLE=y
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_AUDIT_ARCH=y
# CONFIG_KEXEC is not set
# CONFIG_KEXEC_FILE is not set
# end of Processor type and features

#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
#
CONFIG_GSC=y
# CONFIG_HPPB is not set
CONFIG_IOMMU_CCIO=y
# CONFIG_GSC_LASI is not set
CONFIG_GSC_WAX=y
CONFIG_ISA=y
# CONFIG_GSC_DINO is not set
# CONFIG_PCI_LBA is not set
# end of Bus options (PCI, PCMCIA, EISA, GSC, ISA)

#
# PA-RISC specific drivers
#
CONFIG_CHASSIS_LCD_LED=y
CONFIG_PDC_CHASSIS=y
CONFIG_PDC_CHASSIS_WARN=y
CONFIG_PDC_STABLE=m
# end of PA-RISC specific drivers

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
# CONFIG_KPROBES is not set
# CONFIG_JUMP_LABEL is not set
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_ALTERNATE_USER_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_HAVE_ARCH_HASH=y
CONFIG_ISA_BUS_API=y
CONFIG_CLONE_BACKWARDS=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_CPU_NO_EFFICIENT_FFS=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
# CONFIG_LOCK_EVENT_COUNTS is not set

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
# end of GCOV-based kernel profiling
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
# CONFIG_MODULE_UNLOAD is not set
CONFIG_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_COMPRESS_NONE is not set
# CONFIG_MODULE_COMPRESS_GZIP is not set
CONFIG_MODULE_COMPRESS_XZ=y
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_DECOMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_INIT_ALL_POSSIBLE=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
# CONFIG_BLK_DEV_INTEGRITY is not set
# CONFIG_BLK_DEV_ZONED is not set
# CONFIG_BLK_WBT is not set
CONFIG_BLK_DEBUG_FS=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
CONFIG_ACORN_PARTITION=y
CONFIG_ACORN_PARTITION_CUMANA=y
CONFIG_ACORN_PARTITION_EESOX=y
# CONFIG_ACORN_PARTITION_ICS is not set
CONFIG_ACORN_PARTITION_ADFS=y
# CONFIG_ACORN_PARTITION_POWERTEC is not set
CONFIG_ACORN_PARTITION_RISCIX=y
# CONFIG_AIX_PARTITION is not set
# CONFIG_OSF_PARTITION is not set
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
# CONFIG_MINIX_SUBPARTITION is not set
CONFIG_SOLARIS_X86_PARTITION=y
# CONFIG_UNIXWARE_DISKLABEL is not set
CONFIG_LDM_PARTITION=y
# CONFIG_LDM_DEBUG is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
# CONFIG_SWAP is not set

#
# SLAB allocator options
#
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_FLATMEM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_MEMORY_FAILURE is not set
CONFIG_NEED_PER_CPU_KM=y
# CONFIG_CMA is not set
CONFIG_STACK_MAX_DEFAULT_SIZE_MB=100
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_ANON_VMA_NAME is not set
# CONFIG_USERFAULTFD is not set
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
# CONFIG_EISA_NAMES is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCI_MSI is not set
# CONFIG_PCI_QUIRKS is not set
CONFIG_PCI_DEBUG=y
CONFIG_PCI_STUB=y
CONFIG_PCI_ATS=y
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
CONFIG_PCI_PASID=y
# CONFIG_PCIE_BUS_TUNE_OFF is not set
CONFIG_PCIE_BUS_DEFAULT=y
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
# CONFIG_VGA_ARB is not set
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_CPCI is not set
# CONFIG_HOTPLUG_PCI_SHPC is not set

#
# PCI controller drivers
#
# CONFIG_PCIE_XILINX_CPM is not set
# CONFIG_PCI_VERSATILE is not set
# CONFIG_PCIE_ALTERA is not set
# CONFIG_PCIE_MT7621 is not set

#
# DesignWare PCI Core Support
#
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
# CONFIG_INTEL_IXP4XX_EB is not set
CONFIG_QCOM_EBI2=y
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
# end of ARM System Control and Management Interface Protocol

# CONFIG_FIRMWARE_MEMMAP is not set
# CONFIG_FW_CFG_SYSFS is not set
# CONFIG_BCM47XX_NVRAM is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

# CONFIG_GNSS is not set
CONFIG_MTD=y
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
# CONFIG_MTD_AR7_PARTS is not set
CONFIG_MTD_BCM63XX_PARTS=y
# CONFIG_MTD_BRCM_U_BOOT is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_PARSER_IMAGETAG=y
# CONFIG_MTD_PARSER_TRX is not set
# CONFIG_MTD_SHARPSL_PARTS is not set
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=y
# CONFIG_MTD_BLOCK is not set
CONFIG_MTD_BLOCK_RO=y

#
# Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
#
CONFIG_FTL=m
CONFIG_NFTL=y
CONFIG_NFTL_RW=y
CONFIG_INFTL=y
CONFIG_RFD_FTL=y
# CONFIG_SSFDC is not set
CONFIG_SM_FTL=m
CONFIG_MTD_OOPS=m
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=m
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_RAM=y
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
CONFIG_MTD_COMPLEX_MAPPINGS=y
# CONFIG_MTD_PHYSMAP is not set
CONFIG_MTD_TS5500=y
CONFIG_MTD_PCI=y
CONFIG_MTD_INTEL_VR_NOR=y
CONFIG_MTD_PLATRAM=y
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
CONFIG_MTD_SPEAR_SMI=y
CONFIG_MTD_SLRAM=m
# CONFIG_MTD_PHRAM is not set
CONFIG_MTD_MTDRAM=y
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128
CONFIG_MTD_BLOCK2MTD=m

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=y
CONFIG_MTD_ONENAND_VERIFY_WRITE=y
# CONFIG_MTD_ONENAND_GENERIC is not set
# CONFIG_MTD_ONENAND_SAMSUNG is not set
# CONFIG_MTD_ONENAND_OTP is not set
# CONFIG_MTD_ONENAND_2X_PROGRAM is not set
# CONFIG_MTD_RAW_NAND is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# CONFIG_MTD_NAND_ECC_MXIC is not set
# CONFIG_MTD_NAND_ECC_MEDIATEK is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_UBI is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
# CONFIG_PARPORT is not set
CONFIG_PNP=y
CONFIG_PNP_DEBUG_MESSAGES=y

#
# Protocols
#
# CONFIG_ISAPNP is not set
# CONFIG_BLK_DEV is not set

#
# NVME Support
#
CONFIG_NVME_CORE=y
CONFIG_BLK_DEV_NVME=y
# CONFIG_NVME_MULTIPATH is not set
# CONFIG_NVME_VERBOSE_ERRORS is not set
# CONFIG_NVME_HWMON is not set
# CONFIG_NVME_FC is not set
# CONFIG_NVME_AUTH is not set
# CONFIG_NVME_TARGET is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=m
# CONFIG_AD525X_DPOT_I2C is not set
CONFIG_DUMMY_IRQ=y
CONFIG_PHANTOM=m
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
CONFIG_ICS932S401=m
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_HP_ILO is not set
CONFIG_QCOM_COINCELL=m
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
CONFIG_DS1682=m
CONFIG_PCH_PHUB=y
# CONFIG_SRAM is not set
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
# CONFIG_HISI_HIKEY_USB is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=y
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m

#
# Altera FPGA firmware download module (requires I2C)
#
CONFIG_ALTERA_STAPL=m
CONFIG_ECHO=y
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# CONFIG_UACCE is not set
# CONFIG_PVPANIC is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
# CONFIG_SCSI is not set
# end of SCSI device support

# CONFIG_ATA is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
# CONFIG_FIREWIRE_OHCI is not set
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
# CONFIG_INPUT_MOUSEDEV is not set
CONFIG_INPUT_JOYDEV=y
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=m
# CONFIG_KEYBOARD_ADP5588 is not set
CONFIG_KEYBOARD_ADP5589=m
# CONFIG_KEYBOARD_ATKBD is not set
# CONFIG_KEYBOARD_QT1050 is not set
CONFIG_KEYBOARD_QT1070=m
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_CLPS711X is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_EP93XX is not set
CONFIG_KEYBOARD_GPIO=y
CONFIG_KEYBOARD_GPIO_POLLED=y
CONFIG_KEYBOARD_TCA6416=m
CONFIG_KEYBOARD_TCA8418=m
CONFIG_KEYBOARD_MATRIX=y
# CONFIG_KEYBOARD_HIL_OLD is not set
# CONFIG_KEYBOARD_HIL is not set
CONFIG_KEYBOARD_LM8323=m
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
CONFIG_KEYBOARD_MCS=m
CONFIG_KEYBOARD_MPR121=m
# CONFIG_KEYBOARD_IMX is not set
CONFIG_KEYBOARD_NEWTON=m
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_PINEPHONE is not set
CONFIG_KEYBOARD_GOLDFISH_EVENTS=m
CONFIG_KEYBOARD_STOWAWAY=m
# CONFIG_KEYBOARD_ST_KEYSCAN is not set
CONFIG_KEYBOARD_SUNKBD=y
CONFIG_KEYBOARD_SH_KEYSC=m
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
CONFIG_KEYBOARD_XTKBD=y
# CONFIG_KEYBOARD_MT6779 is not set
# CONFIG_KEYBOARD_MTK_PMIC is not set
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
# CONFIG_MOUSE_PS2_BYD is not set
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
# CONFIG_MOUSE_PS2_CYPRESS is not set
CONFIG_MOUSE_PS2_TRACKPOINT=y
# CONFIG_MOUSE_PS2_ELANTECH is not set
# CONFIG_MOUSE_PS2_SENTELIC is not set
CONFIG_MOUSE_PS2_TOUCHKIT=y
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_SERIAL is not set
CONFIG_MOUSE_APPLETOUCH=y
CONFIG_MOUSE_BCM5974=m
# CONFIG_MOUSE_CYAPA is not set
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_INPORT=y
CONFIG_MOUSE_ATIXL=y
CONFIG_MOUSE_LOGIBM=m
# CONFIG_MOUSE_PC110PAD is not set
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
# CONFIG_JOYSTICK_ADC is not set
CONFIG_JOYSTICK_ADI=m
# CONFIG_JOYSTICK_COBRA is not set
CONFIG_JOYSTICK_GF2K=m
CONFIG_JOYSTICK_GRIP=m
CONFIG_JOYSTICK_GRIP_MP=y
# CONFIG_JOYSTICK_GUILLEMOT is not set
# CONFIG_JOYSTICK_INTERACT is not set
# CONFIG_JOYSTICK_SIDEWINDER is not set
# CONFIG_JOYSTICK_TMDC is not set
CONFIG_JOYSTICK_IFORCE=m
CONFIG_JOYSTICK_IFORCE_USB=m
# CONFIG_JOYSTICK_IFORCE_232 is not set
# CONFIG_JOYSTICK_WARRIOR is not set
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
CONFIG_JOYSTICK_SPACEBALL=m
CONFIG_JOYSTICK_STINGER=y
CONFIG_JOYSTICK_TWIDJOY=y
CONFIG_JOYSTICK_ZHENHUA=m
# CONFIG_JOYSTICK_AS5011 is not set
CONFIG_JOYSTICK_JOYDUMP=y
# CONFIG_JOYSTICK_XPAD is not set
# CONFIG_JOYSTICK_PXRC is not set
# CONFIG_JOYSTICK_QWIIC is not set
# CONFIG_JOYSTICK_FSIA6B is not set
# CONFIG_JOYSTICK_SENSEHAT is not set
# CONFIG_INPUT_TABLET is not set
CONFIG_INPUT_TOUCHSCREEN=y
# CONFIG_TOUCHSCREEN_AD7879 is not set
# CONFIG_TOUCHSCREEN_ADC is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
CONFIG_TOUCHSCREEN_AUO_PIXCIR=m
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CY8CTMA140 is not set
CONFIG_TOUCHSCREEN_CY8CTMG110=m
CONFIG_TOUCHSCREEN_CYTTSP_CORE=m
# CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
CONFIG_TOUCHSCREEN_DYNAPRO=y
CONFIG_TOUCHSCREEN_HAMPSHIRE=y
CONFIG_TOUCHSCREEN_EETI=m
CONFIG_TOUCHSCREEN_EGALAX_SERIAL=m
# CONFIG_TOUCHSCREEN_EXC3000 is not set
CONFIG_TOUCHSCREEN_FUJITSU=m
CONFIG_TOUCHSCREEN_GOODIX=m
# CONFIG_TOUCHSCREEN_HIDEEP is not set
# CONFIG_TOUCHSCREEN_HYCON_HY46XX is not set
CONFIG_TOUCHSCREEN_ILI210X=m
# CONFIG_TOUCHSCREEN_ILITEK is not set
# CONFIG_TOUCHSCREEN_IPROC is not set
# CONFIG_TOUCHSCREEN_S6SY761 is not set
CONFIG_TOUCHSCREEN_GUNZE=y
CONFIG_TOUCHSCREEN_EKTF2127=m
# CONFIG_TOUCHSCREEN_ELAN is not set
# CONFIG_TOUCHSCREEN_ELO is not set
CONFIG_TOUCHSCREEN_WACOM_W8001=y
CONFIG_TOUCHSCREEN_WACOM_I2C=m
# CONFIG_TOUCHSCREEN_MAX11801 is not set
# CONFIG_TOUCHSCREEN_MCS5000 is not set
# CONFIG_TOUCHSCREEN_MMS114 is not set
CONFIG_TOUCHSCREEN_MELFAS_MIP4=m
# CONFIG_TOUCHSCREEN_MSG2638 is not set
CONFIG_TOUCHSCREEN_MTOUCH=m
# CONFIG_TOUCHSCREEN_IMAGIS is not set
CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
CONFIG_TOUCHSCREEN_INEXIO=m
CONFIG_TOUCHSCREEN_MK712=y
# CONFIG_TOUCHSCREEN_HTCPEN is not set
CONFIG_TOUCHSCREEN_PENMOUNT=m
CONFIG_TOUCHSCREEN_EDT_FT5X06=m
# CONFIG_TOUCHSCREEN_RASPBERRYPI_FW is not set
# CONFIG_TOUCHSCREEN_MIGOR is not set
CONFIG_TOUCHSCREEN_TOUCHRIGHT=m
CONFIG_TOUCHSCREEN_TOUCHWIN=y
CONFIG_TOUCHSCREEN_TI_AM335X_TSC=y
# CONFIG_TOUCHSCREEN_PIXCIR is not set
CONFIG_TOUCHSCREEN_WDT87XX_I2C=m
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
CONFIG_TOUCHSCREEN_MC13783=m
CONFIG_TOUCHSCREEN_TOUCHIT213=y
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
CONFIG_TOUCHSCREEN_TSC200X_CORE=m
CONFIG_TOUCHSCREEN_TSC2004=m
CONFIG_TOUCHSCREEN_TSC2007=m
# CONFIG_TOUCHSCREEN_TSC2007_IIO is not set
CONFIG_TOUCHSCREEN_RM_TS=m
# CONFIG_TOUCHSCREEN_SILEAD is not set
CONFIG_TOUCHSCREEN_SIS_I2C=m
CONFIG_TOUCHSCREEN_ST1232=m
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SUN4I is not set
CONFIG_TOUCHSCREEN_SUR40=m
# CONFIG_TOUCHSCREEN_SX8654 is not set
# CONFIG_TOUCHSCREEN_TPS6507X is not set
# CONFIG_TOUCHSCREEN_ZET6223 is not set
CONFIG_TOUCHSCREEN_ZFORCE=m
# CONFIG_TOUCHSCREEN_COLIBRI_VF50 is not set
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
# CONFIG_TOUCHSCREEN_IQS5XX is not set
# CONFIG_TOUCHSCREEN_ZINITIX is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=m
# CONFIG_RMI4_SMB is not set
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_GSCPS2=y
CONFIG_HP_SDC=y
CONFIG_HIL_MLC=m
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=y
CONFIG_SERIO_OLPC_APSP=m
CONFIG_SERIO_SUN4I_PS2=m
# CONFIG_SERIO_GPIO_PS2 is not set
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y
CONFIG_GAMEPORT_EMU10K1=m
# CONFIG_GAMEPORT_FM801 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
# CONFIG_VT_CONSOLE is not set
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
# CONFIG_SERIAL_MESON is not set
CONFIG_SERIAL_CLPS711X=m
# CONFIG_SERIAL_SAMSUNG is not set
# CONFIG_SERIAL_TEGRA is not set
CONFIG_SERIAL_IMX=m
# CONFIG_SERIAL_IMX_CONSOLE is not set
CONFIG_SERIAL_UARTLITE=m
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_MUX=m
CONFIG_SERIAL_SH_SCI=m
CONFIG_SERIAL_SH_SCI_NR_UARTS=2
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_ICOM is not set
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_MSM is not set
# CONFIG_SERIAL_VT8500 is not set
# CONFIG_SERIAL_OMAP is not set
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
CONFIG_SERIAL_SC16IS7XX=m
# CONFIG_SERIAL_SC16IS7XX_I2C is not set
CONFIG_SERIAL_TIMBERDALE=m
CONFIG_SERIAL_BCM63XX=y
CONFIG_SERIAL_BCM63XX_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART=m
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_PCH_UART=m
# CONFIG_SERIAL_MXS_AUART is not set
CONFIG_SERIAL_MPS2_UART_CONSOLE=y
CONFIG_SERIAL_MPS2_UART=y
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=m
CONFIG_SERIAL_RP2_NR_UARTS=32
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_STM32=y
# CONFIG_SERIAL_STM32_CONSOLE is not set
# CONFIG_SERIAL_OWL is not set
# CONFIG_SERIAL_RDA is not set
# CONFIG_SERIAL_LITEUART is not set
# CONFIG_SERIAL_SUNPLUS is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NOZOMI is not set
# CONFIG_NULL_TTY is not set
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_TTY_PRINTK=y
CONFIG_TTY_PRINTK_LEVEL=6
# CONFIG_VIRTIO_CONSOLE is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_BCM2835=y
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=y
CONFIG_HW_RANDOM_OMAP3_ROM=y
# CONFIG_HW_RANDOM_VIRTIO is not set
CONFIG_HW_RANDOM_NOMADIK=y
CONFIG_HW_RANDOM_STM32=m
CONFIG_HW_RANDOM_MESON=m
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=m
CONFIG_HW_RANDOM_NPCM=y
# CONFIG_HW_RANDOM_XIPHERA is not set
CONFIG_DTLK=m
CONFIG_APPLICOM=y
CONFIG_DEVMEM=y
CONFIG_DEVPORT=y
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_SYNQUACER is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
# CONFIG_TCG_ATMEL is not set
CONFIG_TCG_INFINEON=m
CONFIG_TCG_VTPM_PROXY=m
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=m
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=m
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=m

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=m
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=m
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=m
CONFIG_I2C_ALI1563=m
# CONFIG_I2C_ALI15X3 is not set
CONFIG_I2C_AMD756=m
# CONFIG_I2C_AMD8111 is not set
CONFIG_I2C_HIX5HD2=m
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
# CONFIG_I2C_NVIDIA_GPU is not set
CONFIG_I2C_SIS5595=m
CONFIG_I2C_SIS630=m
CONFIG_I2C_SIS96X=m
# CONFIG_I2C_VIA is not set
CONFIG_I2C_VIAPRO=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AT91 is not set
# CONFIG_I2C_AXXIA is not set
CONFIG_I2C_BCM_IPROC=m
# CONFIG_I2C_BCM_KONA is not set
CONFIG_I2C_BRCMSTB=m
# CONFIG_I2C_CADENCE is not set
# CONFIG_I2C_CBUS_GPIO is not set
# CONFIG_I2C_DAVINCI is not set
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_DIGICOLOR is not set
CONFIG_I2C_EG20T=m
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_HIGHLANDER is not set
# CONFIG_I2C_HISI is not set
# CONFIG_I2C_IMG is not set
# CONFIG_I2C_IMX is not set
# CONFIG_I2C_IMX_LPI2C is not set
# CONFIG_I2C_IOP3XX is not set
CONFIG_I2C_JZ4780=m
CONFIG_I2C_KEMPLD=m
CONFIG_I2C_MT65XX=m
# CONFIG_I2C_MT7621 is not set
# CONFIG_I2C_MV64XXX is not set
# CONFIG_I2C_MXS is not set
# CONFIG_I2C_NPCM is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=m
# CONFIG_I2C_PNX is not set
# CONFIG_I2C_PXA is not set
# CONFIG_I2C_QCOM_CCI is not set
CONFIG_I2C_QUP=m
CONFIG_I2C_RIIC=m
# CONFIG_I2C_RZV2M is not set
# CONFIG_I2C_S3C2410 is not set
CONFIG_I2C_SH_MOBILE=m
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_ST is not set
# CONFIG_I2C_STM32F4 is not set
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_TEGRA_BPMP is not set
CONFIG_I2C_UNIPHIER=m
CONFIG_I2C_UNIPHIER_F=m
CONFIG_I2C_VERSATILE=m
# CONFIG_I2C_WMT is not set
# CONFIG_I2C_XILINX is not set
CONFIG_I2C_XLP9XX=m
CONFIG_I2C_RCAR=m

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
CONFIG_I2C_TAOS_EVM=m
CONFIG_I2C_TINY_USB=m

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_ELEKTOR is not set
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_PCA_ISA=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
CONFIG_SPMI=m
# CONFIG_SPMI_HISI3670 is not set
CONFIG_SPMI_MSM_PMIC_ARB=m
# CONFIG_SPMI_MTK_PMIF is not set
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

# CONFIG_PINCTRL is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_ATH79 is not set
CONFIG_GPIO_CLPS711X=m
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_HISI is not set
CONFIG_GPIO_IOP=y
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_MXC is not set
# CONFIG_GPIO_MXS is not set
# CONFIG_GPIO_PXA is not set
CONFIG_GPIO_RCAR=y
# CONFIG_GPIO_ROCKCHIP is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_XGENE_SB is not set
# CONFIG_GPIO_XLP is not set
# CONFIG_GPIO_AMD_FCH is not set
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_MAX7300=m
# CONFIG_GPIO_MAX732X is not set
CONFIG_GPIO_PCA953X=m
# CONFIG_GPIO_PCA953X_IRQ is not set
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=m
CONFIG_GPIO_TPIC2810=m
CONFIG_GPIO_TS4900=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# CONFIG_GPIO_JANZ_TTL is not set
CONFIG_GPIO_KEMPLD=m
CONFIG_GPIO_LP873X=m
# CONFIG_GPIO_SL28CPLD is not set
CONFIG_GPIO_TPS65086=m
CONFIG_GPIO_TPS65912=m
# CONFIG_GPIO_TQMX86 is not set
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
CONFIG_GPIO_AMD8111=m
# CONFIG_GPIO_ML_IOH is not set
CONFIG_GPIO_PCH=y
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
CONFIG_GPIO_RDC321X=m
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=m

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2490 is not set
# CONFIG_W1_MASTER_DS2482 is not set
CONFIG_W1_MASTER_MXC=m
CONFIG_W1_MASTER_DS1WM=m
# CONFIG_W1_MASTER_GPIO is not set
# CONFIG_W1_MASTER_SGI is not set
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
# CONFIG_W1_SLAVE_DS2405 is not set
# CONFIG_W1_SLAVE_DS2408 is not set
CONFIG_W1_SLAVE_DS2413=m
CONFIG_W1_SLAVE_DS2406=m
CONFIG_W1_SLAVE_DS2423=m
# CONFIG_W1_SLAVE_DS2805 is not set
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=m
# CONFIG_W1_SLAVE_DS2433 is not set
# CONFIG_W1_SLAVE_DS2438 is not set
# CONFIG_W1_SLAVE_DS250X is not set
CONFIG_W1_SLAVE_DS2780=m
CONFIG_W1_SLAVE_DS2781=m
CONFIG_W1_SLAVE_DS28E04=m
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
# CONFIG_IP5XXX_POWER is not set
CONFIG_TEST_POWER=m
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_ACT8945A=y
# CONFIG_BATTERY_CW2015 is not set
# CONFIG_BATTERY_DS2760 is not set
CONFIG_BATTERY_DS2780=m
# CONFIG_BATTERY_DS2781 is not set
CONFIG_BATTERY_DS2782=m
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=m
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=m
CONFIG_BATTERY_BQ27XXX_I2C=m
CONFIG_BATTERY_BQ27XXX_HDQ=m
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
CONFIG_AXP20X_POWER=m
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=m
# CONFIG_BATTERY_MAX1721X is not set
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_CHARGER_ISP1704=y
CONFIG_CHARGER_MAX8903=y
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=m
CONFIG_CHARGER_MANAGER=y
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_MAX14577 is not set
# CONFIG_CHARGER_MAX77693 is not set
# CONFIG_CHARGER_MAX77976 is not set
# CONFIG_CHARGER_BQ2415X is not set
CONFIG_CHARGER_BQ24190=m
CONFIG_CHARGER_BQ24257=m
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_CHARGER_SMB347 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=m
CONFIG_CHARGER_RT9455=m
# CONFIG_CHARGER_SC2731 is not set
# CONFIG_FUEL_GAUGE_SC27XX is not set
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_UG3105 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
# CONFIG_SENSORS_ADM1025 is not set
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
# CONFIG_SENSORS_ADT7410 is not set
CONFIG_SENSORS_ADT7411=m
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
# CONFIG_SENSORS_ASB100 is not set
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_BT1_PVT is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
CONFIG_SENSORS_DS620=m
# CONFIG_SENSORS_DS1621 is not set
# CONFIG_SENSORS_I5K_AMB is not set
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_MC13783_ADC=m
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IIO_HWMON=m
# CONFIG_SENSORS_IT87 is not set
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWR1220=m
# CONFIG_SENSORS_LAN966X is not set
# CONFIG_SENSORS_LINEAGE is not set
CONFIG_SENSORS_LTC2945=m
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=m
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
# CONFIG_SENSORS_MAX197 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX31760 is not set
# CONFIG_SENSORS_MAX6620 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
# CONFIG_SENSORS_MCP3021 is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
# CONFIG_SENSORS_LM63 is not set
CONFIG_SENSORS_LM73=m
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=m
# CONFIG_SENSORS_LM87 is not set
# CONFIG_SENSORS_LM90 is not set
# CONFIG_SENSORS_LM92 is not set
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
# CONFIG_SENSORS_LM95245 is not set
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=y
CONFIG_SENSORS_NTC_THERMISTOR=m
CONFIG_SENSORS_NCT6683=y
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
CONFIG_SENSORS_NCT7802=m
# CONFIG_SENSORS_NPCM7XX is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
# CONFIG_SENSORS_PMBUS is not set
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
# CONFIG_SENSORS_FSP_3Y is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LM25066_REGULATOR is not set
# CONFIG_SENSORS_LT7182S is not set
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
CONFIG_SENSORS_LTC3815=m
# CONFIG_SENSORS_MAX15301 is not set
# CONFIG_SENSORS_MAX16064 is not set
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
CONFIG_SENSORS_MAX20751=m
# CONFIG_SENSORS_MAX31785 is not set
# CONFIG_SENSORS_MAX34440 is not set
# CONFIG_SENSORS_MAX8688 is not set
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PLI1209BC is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
# CONFIG_SENSORS_TPS546D24 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE152 is not set
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_PWM_FAN is not set
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
# CONFIG_SENSORS_SL28CPLD is not set
# CONFIG_SENSORS_SBTSI is not set
# CONFIG_SENSORS_SBRMI is not set
# CONFIG_SENSORS_SHT15 is not set
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=m
# CONFIG_SENSORS_SHT4x is not set
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_SIS5595=m
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
# CONFIG_SENSORS_EMC2305 is not set
CONFIG_SENSORS_EMC6W201=m
# CONFIG_SENSORS_SMSC47M1 is not set
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=m
# CONFIG_SENSORS_STTS751 is not set
CONFIG_SENSORS_SMM665=m
CONFIG_SENSORS_ADC128D818=m
# CONFIG_SENSORS_ADS7828 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
CONFIG_SENSORS_INA3221=m
# CONFIG_SENSORS_TC74 is not set
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
# CONFIG_SENSORS_TMP108 is not set
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA686A=m
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_VT8231=y
# CONFIG_SENSORS_W83773G is not set
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=m
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
# CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set
# CONFIG_K3_THERMAL is not set
# CONFIG_ROCKCHIP_THERMAL is not set
# CONFIG_RCAR_THERMAL is not set
CONFIG_MTK_THERMAL=y

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
# CONFIG_BRCMSTB_THERMAL is not set
# CONFIG_BCM_NS_THERMAL is not set
# CONFIG_BCM_SR_THERMAL is not set
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
CONFIG_TI_SOC_THERMAL=y
# CONFIG_TI_THERMAL is not set
# CONFIG_OMAP3_THERMAL is not set
CONFIG_OMAP4_THERMAL=y
CONFIG_OMAP5_THERMAL=y
CONFIG_DRA752_THERMAL=y
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# end of Samsung thermal drivers

#
# NVIDIA Tegra thermal drivers
#
# CONFIG_TEGRA_SOCTHERM is not set
# CONFIG_TEGRA_BPMP_THERMAL is not set
# CONFIG_TEGRA30_TSENSOR is not set
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=m

#
# Qualcomm thermal drivers
#
# end of Qualcomm thermal drivers

# CONFIG_SPRD_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
# CONFIG_SSB_PCIHOST is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
CONFIG_BCMA_HOST_SOC=y
CONFIG_BCMA_DRIVER_PCI=y
# CONFIG_BCMA_DRIVER_MIPS is not set
# CONFIG_BCMA_SFLASH is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_SUN4I_GPADC is not set
# CONFIG_MFD_AT91_USART is not set
CONFIG_MFD_BCM590XX=m
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
# CONFIG_MFD_MADERA is not set
# CONFIG_MFD_ASIC3 is not set
CONFIG_MFD_DA9062=m
CONFIG_MFD_DA9063=m
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_ENE_KB3930 is not set
# CONFIG_MFD_EXYNOS_LPASS is not set
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_I2C=m
# CONFIG_MFD_MP2629 is not set
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_HTC_PASIC3=m
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=y
# CONFIG_MFD_IQS62X is not set
CONFIG_MFD_JANZ_CMODIO=y
CONFIG_MFD_KEMPLD=m
CONFIG_MFD_88PM800=m
# CONFIG_MFD_88PM805 is not set
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77650 is not set
# CONFIG_MFD_MAX77686 is not set
CONFIG_MFD_MAX77693=m
# CONFIG_MFD_MAX77714 is not set
CONFIG_MFD_MAX8907=m
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
CONFIG_MFD_MT6397=y
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_NTXEC is not set
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=m
CONFIG_PCF50633_ADC=m
CONFIG_PCF50633_GPIO=m
# CONFIG_MFD_PM8XXX is not set
# CONFIG_MFD_SY7636A is not set
CONFIG_MFD_RDC321X=m
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=m
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SL28CPLD is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SKY81452 is not set
CONFIG_ABX500_CORE=y
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_TI_LMU is not set
CONFIG_TPS6105X=m
CONFIG_TPS65010=m
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=m
CONFIG_MFD_TI_LP873X=m
CONFIG_MFD_TPS65912=m
CONFIG_MFD_TPS65912_I2C=m
CONFIG_MFD_WL1273_CORE=m
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TIMBERDALE is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=y
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_WM8994=m
CONFIG_MFD_STW481X=m
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
# CONFIG_MFD_STMFX is not set
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_KHADAS_MCU is not set
# CONFIG_MFD_ACER_A500_EC is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
CONFIG_REGULATOR_DEBUG=y
CONFIG_REGULATOR_FIXED_VOLTAGE=m
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=m
CONFIG_REGULATOR_ACT8865=m
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_ANATOP=m
# CONFIG_REGULATOR_AXP20X is not set
CONFIG_REGULATOR_BCM590XX=m
CONFIG_REGULATOR_DA9062=m
CONFIG_REGULATOR_DA9210=m
# CONFIG_REGULATOR_DA9211 is not set
# CONFIG_REGULATOR_FAN53555 is not set
# CONFIG_REGULATOR_FAN53880 is not set
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_ISL9305=m
CONFIG_REGULATOR_ISL6271A=m
# CONFIG_REGULATOR_LP3971 is not set
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=m
CONFIG_REGULATOR_LP8755=m
# CONFIG_REGULATOR_LTC3589 is not set
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX14577=m
CONFIG_REGULATOR_MAX1586=m
# CONFIG_REGULATOR_MAX77620 is not set
# CONFIG_REGULATOR_MAX77650 is not set
CONFIG_REGULATOR_MAX8649=m
CONFIG_REGULATOR_MAX8660=m
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8907=m
# CONFIG_REGULATOR_MAX8952 is not set
# CONFIG_REGULATOR_MAX20086 is not set
# CONFIG_REGULATOR_MAX77686 is not set
CONFIG_REGULATOR_MAX77693=m
# CONFIG_REGULATOR_MAX77802 is not set
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
CONFIG_REGULATOR_MC13892=m
# CONFIG_REGULATOR_MP8859 is not set
# CONFIG_REGULATOR_MP886X is not set
CONFIG_REGULATOR_MT6311=m
# CONFIG_REGULATOR_MT6315 is not set
CONFIG_REGULATOR_MT6323=y
# CONFIG_REGULATOR_MT6331 is not set
# CONFIG_REGULATOR_MT6332 is not set
# CONFIG_REGULATOR_MT6358 is not set
# CONFIG_REGULATOR_MT6359 is not set
CONFIG_REGULATOR_MT6397=y
# CONFIG_REGULATOR_PBIAS is not set
# CONFIG_REGULATOR_PCA9450 is not set
# CONFIG_REGULATOR_PCF50633 is not set
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
# CONFIG_REGULATOR_PWM is not set
# CONFIG_REGULATOR_QCOM_RPMH is not set
CONFIG_REGULATOR_QCOM_SPMI=m
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
# CONFIG_REGULATOR_RT4801 is not set
CONFIG_REGULATOR_RT5033=m
# CONFIG_REGULATOR_RT5190A is not set
# CONFIG_REGULATOR_RT5759 is not set
# CONFIG_REGULATOR_RT6160 is not set
# CONFIG_REGULATOR_RT6245 is not set
# CONFIG_REGULATOR_RTQ2134 is not set
# CONFIG_REGULATOR_RTMV20 is not set
# CONFIG_REGULATOR_RTQ6752 is not set
# CONFIG_REGULATOR_S2MPA01 is not set
# CONFIG_REGULATOR_S2MPS11 is not set
# CONFIG_REGULATOR_S5M8767 is not set
# CONFIG_REGULATOR_SC2731 is not set
# CONFIG_REGULATOR_SLG51000 is not set
# CONFIG_REGULATOR_STM32_BOOSTER is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STM32_PWR is not set
# CONFIG_REGULATOR_TI_ABB is not set
CONFIG_REGULATOR_STW481X_VMMC=y
# CONFIG_REGULATOR_SY8106A is not set
# CONFIG_REGULATOR_SY8824X is not set
# CONFIG_REGULATOR_SY8827N is not set
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS6105X=m
CONFIG_REGULATOR_TPS62360=m
# CONFIG_REGULATOR_TPS65023 is not set
CONFIG_REGULATOR_TPS6507X=m
# CONFIG_REGULATOR_TPS65086 is not set
# CONFIG_REGULATOR_TPS65132 is not set
CONFIG_REGULATOR_TPS65912=m
# CONFIG_REGULATOR_TPS68470 is not set
# CONFIG_REGULATOR_WM8994 is not set
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=m
# CONFIG_LIRC is not set
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
# CONFIG_IR_IMON_DECODER is not set
# CONFIG_IR_JVC_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_NEC_DECODER is not set
# CONFIG_IR_RC5_DECODER is not set
CONFIG_IR_RC6_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
# CONFIG_IR_SANYO_DECODER is not set
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_SONY_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
CONFIG_IR_GPIO_CIR=m
CONFIG_IR_HIX5HD2=m
CONFIG_IR_IGORPLUGUSB=m
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_ITE_CIR=m
CONFIG_IR_MCEUSB=m
CONFIG_IR_MESON=m
# CONFIG_IR_MESON_TX is not set
# CONFIG_IR_MTK is not set
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
# CONFIG_IR_RX51 is not set
# CONFIG_IR_SERIAL is not set
CONFIG_IR_STREAMZAP=m
# CONFIG_IR_SUNXI is not set
# CONFIG_IR_TOY is not set
# CONFIG_IR_TTUSBIR is not set
# CONFIG_IR_WINBOND_CIR is not set
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_RC_LOOPBACK=m
CONFIG_RC_ST=m
# CONFIG_RC_XBOX_DVD is not set
# CONFIG_IR_IMG is not set

#
# CEC support
#
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
# CONFIG_CEC_MESON_AO is not set
# CONFIG_CEC_GPIO is not set
# CONFIG_CEC_SAMSUNG_S5P is not set
# CONFIG_CEC_STI is not set
# CONFIG_CEC_STM32 is not set
# CONFIG_CEC_TEGRA is not set
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
CONFIG_VIDEO_DEV=m
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=m
# end of Media core support

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_ADV_DEBUG=y
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEO_TUNER=m
CONFIG_V4L2_H264=m
CONFIG_V4L2_VP9=m
CONFIG_V4L2_MEM2MEM_DEV=m
# CONFIG_V4L2_FLASH_LED_CLASS is not set
CONFIG_V4L2_FWNODE=m
CONFIG_V4L2_ASYNC=m
CONFIG_VIDEOBUF_GEN=m
CONFIG_VIDEOBUF_DMA_SG=m
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
CONFIG_MEDIA_CONTROLLER_REQUEST_API=y
# end of Media controller options

#
# Digital TV options
#
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#
CONFIG_USB_GSPCA=m
# CONFIG_USB_GSPCA_BENQ is not set
# CONFIG_USB_GSPCA_CONEX is not set
# CONFIG_USB_GSPCA_CPIA1 is not set
CONFIG_USB_GSPCA_DTCS033=m
CONFIG_USB_GSPCA_ETOMS=m
CONFIG_USB_GSPCA_FINEPIX=m
CONFIG_USB_GSPCA_JEILINJ=m
# CONFIG_USB_GSPCA_JL2005BCD is not set
# CONFIG_USB_GSPCA_KINECT is not set
# CONFIG_USB_GSPCA_KONICA is not set
CONFIG_USB_GSPCA_MARS=m
# CONFIG_USB_GSPCA_MR97310A is not set
CONFIG_USB_GSPCA_NW80X=m
CONFIG_USB_GSPCA_OV519=m
CONFIG_USB_GSPCA_OV534=m
# CONFIG_USB_GSPCA_OV534_9 is not set
CONFIG_USB_GSPCA_PAC207=m
CONFIG_USB_GSPCA_PAC7302=m
# CONFIG_USB_GSPCA_PAC7311 is not set
# CONFIG_USB_GSPCA_SE401 is not set
# CONFIG_USB_GSPCA_SN9C2028 is not set
# CONFIG_USB_GSPCA_SN9C20X is not set
# CONFIG_USB_GSPCA_SONIXB is not set
# CONFIG_USB_GSPCA_SONIXJ is not set
CONFIG_USB_GSPCA_SPCA1528=m
CONFIG_USB_GSPCA_SPCA500=m
CONFIG_USB_GSPCA_SPCA501=m
CONFIG_USB_GSPCA_SPCA505=m
CONFIG_USB_GSPCA_SPCA506=m
CONFIG_USB_GSPCA_SPCA508=m
CONFIG_USB_GSPCA_SPCA561=m
CONFIG_USB_GSPCA_SQ905=m
CONFIG_USB_GSPCA_SQ905C=m
# CONFIG_USB_GSPCA_SQ930X is not set
CONFIG_USB_GSPCA_STK014=m
CONFIG_USB_GSPCA_STK1135=m
CONFIG_USB_GSPCA_STV0680=m
CONFIG_USB_GSPCA_SUNPLUS=m
CONFIG_USB_GSPCA_T613=m
# CONFIG_USB_GSPCA_TOPRO is not set
CONFIG_USB_GSPCA_TOUPTEK=m
CONFIG_USB_GSPCA_TV8532=m
CONFIG_USB_GSPCA_VC032X=m
CONFIG_USB_GSPCA_VICAM=m
CONFIG_USB_GSPCA_XIRLINK_CIT=m
# CONFIG_USB_GSPCA_ZC3XX is not set
CONFIG_USB_GL860=m
CONFIG_USB_M5602=m
# CONFIG_USB_STV06XX is not set
CONFIG_USB_PWC=m
# CONFIG_USB_PWC_DEBUG is not set
# CONFIG_USB_PWC_INPUT_EVDEV is not set
# CONFIG_USB_S2255 is not set
CONFIG_USB_VIDEO_CLASS=m
CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y

#
# Analog TV USB devices
#
CONFIG_VIDEO_HDPVR=m
# CONFIG_VIDEO_PVRUSB2 is not set
CONFIG_VIDEO_STK1160_COMMON=m
CONFIG_VIDEO_STK1160=m

#
# Analog/digital TV USB devices
#
# CONFIG_VIDEO_AU0828 is not set
CONFIG_VIDEO_CX231XX=m
# CONFIG_VIDEO_CX231XX_RC is not set
# CONFIG_VIDEO_CX231XX_DVB is not set

#
# Digital TV USB devices
#
# CONFIG_DVB_AS102 is not set
# CONFIG_DVB_B2C2_FLEXCOP_USB is not set
# CONFIG_DVB_USB_V2 is not set
# CONFIG_DVB_USB is not set
# CONFIG_SMS_USB_DRV is not set
# CONFIG_DVB_TTUSB_BUDGET is not set
# CONFIG_DVB_TTUSB_DEC is not set

#
# Webcam, TV (analog/digital) USB devices
#
# CONFIG_VIDEO_EM28XX is not set

#
# Software defined radio USB devices
#
CONFIG_USB_AIRSPY=m
CONFIG_USB_HACKRF=m
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
# CONFIG_STA2X11_VIP is not set
CONFIG_VIDEO_TW5864=m
CONFIG_VIDEO_TW68=m
# CONFIG_VIDEO_ZORAN is not set

#
# Media capture/analog TV support
#
# CONFIG_VIDEO_DT3155 is not set
CONFIG_VIDEO_IVTV=m
CONFIG_VIDEO_FB_IVTV=m

#
# Media capture/analog/hybrid TV support
#
CONFIG_VIDEO_BT848=m
# CONFIG_DVB_BT8XX is not set
# CONFIG_VIDEO_CX18 is not set
# CONFIG_VIDEO_CX25821 is not set
# CONFIG_VIDEO_CX88 is not set
CONFIG_VIDEO_SAA7134=m
CONFIG_VIDEO_SAA7134_RC=y
# CONFIG_VIDEO_SAA7134_DVB is not set
# CONFIG_VIDEO_SAA7164 is not set

#
# Media digital TV PCI Adapters
#
# CONFIG_DVB_B2C2_FLEXCOP_PCI is not set
# CONFIG_DVB_DDBRIDGE is not set
# CONFIG_DVB_DM1105 is not set
# CONFIG_MANTIS_CORE is not set
# CONFIG_DVB_NGENE is not set
# CONFIG_DVB_PLUTO2 is not set
# CONFIG_DVB_PT1 is not set
# CONFIG_DVB_PT3 is not set
# CONFIG_DVB_SMIPCIE is not set
CONFIG_RADIO_ADAPTERS=m
CONFIG_RADIO_MAXIRADIO=m
CONFIG_RADIO_SAA7706H=m
CONFIG_RADIO_SHARK=m
CONFIG_RADIO_SHARK2=m
CONFIG_RADIO_SI4713=m
CONFIG_RADIO_TEA575X=m
# CONFIG_RADIO_TEA5764 is not set
CONFIG_RADIO_TEF6862=m
CONFIG_RADIO_WL1273=m
CONFIG_USB_DSBR=m
# CONFIG_USB_KEENE is not set
CONFIG_USB_MA901=m
CONFIG_USB_MR800=m
CONFIG_USB_RAREMONO=m
CONFIG_RADIO_SI470X=m
CONFIG_USB_SI470X=m
CONFIG_I2C_SI470X=m
# CONFIG_USB_SI4713 is not set
CONFIG_PLATFORM_SI4713=m
CONFIG_I2C_SI4713=m
# CONFIG_V4L_RADIO_ISA_DRIVERS is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set
CONFIG_V4L_MEM2MEM_DRIVERS=y
# CONFIG_VIDEO_MEM2MEM_DEINTERLACE is not set

#
# Allegro DVT media platform drivers
#
# CONFIG_VIDEO_ALLEGRO_DVT is not set

#
# Amlogic media platform drivers
#
# CONFIG_VIDEO_MESON_GE2D is not set

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#
# CONFIG_VIDEO_CADENCE_CSI2RX is not set
# CONFIG_VIDEO_CADENCE_CSI2TX is not set

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#

#
# Mediatek media platform drivers
#
# CONFIG_VIDEO_MEDIATEK_JPEG is not set
# CONFIG_VIDEO_MEDIATEK_MDP is not set
CONFIG_VIDEO_MEDIATEK_VCODEC_VPU=y
CONFIG_VIDEO_MEDIATEK_VCODEC=m
CONFIG_VIDEO_MEDIATEK_VPU=m
# CONFIG_VIDEO_MEDIATEK_MDP3 is not set

#
# NVidia media platform drivers
#
# CONFIG_VIDEO_TEGRA_VDE is not set

#
# NXP media platform drivers
#
# CONFIG_VIDEO_IMX_MIPI_CSIS is not set
# CONFIG_VIDEO_IMX_PXP is not set
CONFIG_VIDEO_MX2_EMMAPRP=m
# CONFIG_VIDEO_DW100 is not set
# CONFIG_VIDEO_IMX8_JPEG is not set

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#
# CONFIG_VIDEO_RENESAS_FDP1 is not set
CONFIG_VIDEO_RENESAS_JPU=m
# CONFIG_VIDEO_RENESAS_VSP1 is not set

#
# Rockchip media platform drivers
#
# CONFIG_VIDEO_ROCKCHIP_RGA is not set

#
# Samsung media platform drivers
#
# CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC is not set
CONFIG_VIDEO_SAMSUNG_S5P_G2D=m
# CONFIG_VIDEO_SAMSUNG_S5P_JPEG is not set
# CONFIG_VIDEO_SAMSUNG_S5P_MFC is not set

#
# STMicroelectronics media platform drivers
#
# CONFIG_VIDEO_STI_BDISP is not set
# CONFIG_VIDEO_STI_DELTA is not set
CONFIG_VIDEO_STI_HVA=m
# CONFIG_VIDEO_STI_HVA_DEBUGFS is not set
# CONFIG_VIDEO_STM32_DMA2D is not set

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#
# CONFIG_VIDEO_TI_VPE is not set

#
# Verisilicon media platform drivers
#
# CONFIG_VIDEO_HANTRO is not set

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#

#
# MMC/SDIO DVB adapters
#
# CONFIG_SMS_SDIO_DRV is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_TEST_DRIVERS is not set

#
# FireWire (IEEE 1394) Adapters
#
# CONFIG_DVB_FIREDTV is not set
CONFIG_VIDEO_CX2341X=m
CONFIG_VIDEO_TVEEPROM=m
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_DMA_CONTIG=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEOBUF2_DMA_SG=m
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y

#
# IR I2C driver auto-selected by 'Autoselect ancillary drivers'
#
CONFIG_VIDEO_IR_I2C=m

#
# Camera sensor devices
#
# CONFIG_VIDEO_AR0521 is not set
# CONFIG_VIDEO_HI556 is not set
# CONFIG_VIDEO_HI846 is not set
# CONFIG_VIDEO_HI847 is not set
# CONFIG_VIDEO_IMX208 is not set
# CONFIG_VIDEO_IMX214 is not set
# CONFIG_VIDEO_IMX219 is not set
# CONFIG_VIDEO_IMX258 is not set
# CONFIG_VIDEO_IMX274 is not set
# CONFIG_VIDEO_IMX290 is not set
# CONFIG_VIDEO_IMX319 is not set
# CONFIG_VIDEO_IMX355 is not set
# CONFIG_VIDEO_MT9M001 is not set
# CONFIG_VIDEO_MT9M032 is not set
CONFIG_VIDEO_MT9M111=m
# CONFIG_VIDEO_MT9P031 is not set
# CONFIG_VIDEO_MT9T001 is not set
# CONFIG_VIDEO_MT9T112 is not set
CONFIG_VIDEO_MT9V011=m
# CONFIG_VIDEO_MT9V032 is not set
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_NOON010PC30 is not set
# CONFIG_VIDEO_OG01A1B is not set
# CONFIG_VIDEO_OV02A10 is not set
# CONFIG_VIDEO_OV08D10 is not set
# CONFIG_VIDEO_OV13858 is not set
# CONFIG_VIDEO_OV13B10 is not set
# CONFIG_VIDEO_OV2640 is not set
CONFIG_VIDEO_OV2659=m
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
# CONFIG_VIDEO_OV2740 is not set
# CONFIG_VIDEO_OV5647 is not set
# CONFIG_VIDEO_OV5670 is not set
# CONFIG_VIDEO_OV5675 is not set
# CONFIG_VIDEO_OV5693 is not set
# CONFIG_VIDEO_OV5695 is not set
# CONFIG_VIDEO_OV6650 is not set
# CONFIG_VIDEO_OV7251 is not set
# CONFIG_VIDEO_OV7640 is not set
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV8856 is not set
# CONFIG_VIDEO_OV9640 is not set
# CONFIG_VIDEO_OV9650 is not set
# CONFIG_VIDEO_OV9734 is not set
# CONFIG_VIDEO_RDACM20 is not set
# CONFIG_VIDEO_RDACM21 is not set
# CONFIG_VIDEO_RJ54N1 is not set
# CONFIG_VIDEO_S5K4ECGX is not set
# CONFIG_VIDEO_S5K5BAF is not set
# CONFIG_VIDEO_S5K6A3 is not set
# CONFIG_VIDEO_S5K6AA is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_ET8EK8 is not set
# CONFIG_VIDEO_M5MOLS is not set
# end of Camera sensor devices

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set
# CONFIG_VIDEO_AK7375 is not set
# CONFIG_VIDEO_DW9714 is not set
# CONFIG_VIDEO_DW9768 is not set
# CONFIG_VIDEO_DW9807_VCM is not set
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
# CONFIG_VIDEO_LM3646 is not set
# end of Flash devices

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_CS3308 is not set
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_SONY_BTF_MPX=m
CONFIG_VIDEO_TDA7432=m
CONFIG_VIDEO_TDA9840=m
CONFIG_VIDEO_TEA6415C=m
CONFIG_VIDEO_TEA6420=m
CONFIG_VIDEO_TLV320AIC23B=m
CONFIG_VIDEO_TVAUDIO=m
# CONFIG_VIDEO_UDA1342 is not set
CONFIG_VIDEO_VP27SMPX=m
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_WM8775=m
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m
# end of RDS decoders

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
CONFIG_VIDEO_ADV7183=m
# CONFIG_VIDEO_ADV7604 is not set
# CONFIG_VIDEO_ADV7842 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
CONFIG_VIDEO_KS0127=m
CONFIG_VIDEO_ML86V7667=m
CONFIG_VIDEO_SAA7110=m
CONFIG_VIDEO_SAA711X=m
# CONFIG_VIDEO_TC358743 is not set
CONFIG_VIDEO_TVP514X=m
# CONFIG_VIDEO_TVP5150 is not set
# CONFIG_VIDEO_TVP7002 is not set
CONFIG_VIDEO_TW2804=m
CONFIG_VIDEO_TW9903=m
# CONFIG_VIDEO_TW9906 is not set
# CONFIG_VIDEO_TW9910 is not set
CONFIG_VIDEO_VPX3220=m

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m
# end of Video decoders

#
# Video encoders
#
# CONFIG_VIDEO_AD9389B is not set
CONFIG_VIDEO_ADV7170=m
CONFIG_VIDEO_ADV7175=m
CONFIG_VIDEO_ADV7343=m
CONFIG_VIDEO_ADV7393=m
# CONFIG_VIDEO_ADV7511 is not set
# CONFIG_VIDEO_AK881X is not set
CONFIG_VIDEO_SAA7127=m
CONFIG_VIDEO_SAA7185=m
# CONFIG_VIDEO_THS8200 is not set
# end of Video encoders

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
CONFIG_VIDEO_UPD64083=m
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# CONFIG_SDR_MAX2175 is not set
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_I2C is not set
CONFIG_VIDEO_M52790=m
# CONFIG_VIDEO_ST_MIPID02 is not set
# CONFIG_VIDEO_THS7303 is not set
# end of Miscellaneous helper chips

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_E4000=m
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_FC2580=m
# CONFIG_MEDIA_TUNER_IT913X is not set
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT20XX=m
# CONFIG_MEDIA_TUNER_MT2131 is not set
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MXL301RF=m
CONFIG_MEDIA_TUNER_MXL5005S=m
# CONFIG_MEDIA_TUNER_MXL5007T is not set
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_TDA18218=m
# CONFIG_MEDIA_TUNER_TDA18250 is not set
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_XC5000=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_M88DS3103 is not set
# CONFIG_DVB_MXL5XX is not set
# CONFIG_DVB_STB0899 is not set
# CONFIG_DVB_STB6100 is not set
# CONFIG_DVB_STV090x is not set
# CONFIG_DVB_STV0910 is not set
# CONFIG_DVB_STV6110x is not set
# CONFIG_DVB_STV6111 is not set

#
# Multistandard (cable + terrestrial) frontends
#
# CONFIG_DVB_DRXK is not set
# CONFIG_DVB_MN88472 is not set
# CONFIG_DVB_MN88473 is not set
# CONFIG_DVB_SI2165 is not set
# CONFIG_DVB_TDA18271C2DD is not set

#
# DVB-S (satellite) frontends
#
# CONFIG_DVB_CX24110 is not set
# CONFIG_DVB_CX24116 is not set
# CONFIG_DVB_CX24117 is not set
# CONFIG_DVB_CX24120 is not set
# CONFIG_DVB_CX24123 is not set
# CONFIG_DVB_DS3000 is not set
# CONFIG_DVB_MB86A16 is not set
# CONFIG_DVB_MT312 is not set
# CONFIG_DVB_S5H1420 is not set
# CONFIG_DVB_SI21XX is not set
# CONFIG_DVB_STB6000 is not set
# CONFIG_DVB_STV0288 is not set
# CONFIG_DVB_STV0299 is not set
# CONFIG_DVB_STV0900 is not set
# CONFIG_DVB_STV6110 is not set
# CONFIG_DVB_TDA10071 is not set
# CONFIG_DVB_TDA10086 is not set
# CONFIG_DVB_TDA8083 is not set
# CONFIG_DVB_TDA8261 is not set
# CONFIG_DVB_TDA826X is not set
# CONFIG_DVB_TS2020 is not set
# CONFIG_DVB_TUA6100 is not set
# CONFIG_DVB_TUNER_CX24113 is not set
# CONFIG_DVB_TUNER_ITD1000 is not set
# CONFIG_DVB_VES1X93 is not set
# CONFIG_DVB_ZL10036 is not set
# CONFIG_DVB_ZL10039 is not set

#
# DVB-T (terrestrial) frontends
#
# CONFIG_DVB_AF9013 is not set
# CONFIG_DVB_CX22700 is not set
# CONFIG_DVB_CX22702 is not set
# CONFIG_DVB_CXD2820R is not set
# CONFIG_DVB_CXD2841ER is not set
# CONFIG_DVB_DIB3000MB is not set
# CONFIG_DVB_DIB3000MC is not set
# CONFIG_DVB_DIB7000M is not set
# CONFIG_DVB_DIB7000P is not set
# CONFIG_DVB_DIB9000 is not set
# CONFIG_DVB_DRXD is not set
# CONFIG_DVB_EC100 is not set
# CONFIG_DVB_L64781 is not set
# CONFIG_DVB_MT352 is not set
# CONFIG_DVB_NXT6000 is not set
# CONFIG_DVB_RTL2830 is not set
# CONFIG_DVB_RTL2832 is not set
# CONFIG_DVB_RTL2832_SDR is not set
# CONFIG_DVB_S5H1432 is not set
# CONFIG_DVB_SI2168 is not set
# CONFIG_DVB_SP887X is not set
# CONFIG_DVB_STV0367 is not set
# CONFIG_DVB_TDA10048 is not set
# CONFIG_DVB_TDA1004X is not set
# CONFIG_DVB_ZD1301_DEMOD is not set
# CONFIG_DVB_ZL10353 is not set

#
# DVB-C (cable) frontends
#
# CONFIG_DVB_STV0297 is not set
# CONFIG_DVB_TDA10021 is not set
# CONFIG_DVB_TDA10023 is not set
# CONFIG_DVB_VES1820 is not set

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
# CONFIG_DVB_AU8522_DTV is not set
# CONFIG_DVB_AU8522_V4L is not set
# CONFIG_DVB_BCM3510 is not set
# CONFIG_DVB_LG2160 is not set
# CONFIG_DVB_LGDT3305 is not set
# CONFIG_DVB_LGDT3306A is not set
# CONFIG_DVB_LGDT330X is not set
# CONFIG_DVB_MXL692 is not set
# CONFIG_DVB_NXT200X is not set
# CONFIG_DVB_OR51132 is not set
# CONFIG_DVB_OR51211 is not set
# CONFIG_DVB_S5H1409 is not set
# CONFIG_DVB_S5H1411 is not set

#
# ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_DIB8000 is not set
# CONFIG_DVB_MB86A20S is not set
# CONFIG_DVB_S921 is not set

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_MN88443X is not set
# CONFIG_DVB_TC90522 is not set

#
# Digital terrestrial only tuners/PLL
#
# CONFIG_DVB_PLL is not set
CONFIG_DVB_TUNER_DIB0070=m
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_A8293 is not set
# CONFIG_DVB_AF9033 is not set
# CONFIG_DVB_ASCOT2E is not set
# CONFIG_DVB_ATBM8830 is not set
# CONFIG_DVB_HELENE is not set
# CONFIG_DVB_HORUS3A is not set
# CONFIG_DVB_ISL6405 is not set
# CONFIG_DVB_ISL6421 is not set
# CONFIG_DVB_ISL6423 is not set
# CONFIG_DVB_IX2505V is not set
# CONFIG_DVB_LGS8GL5 is not set
# CONFIG_DVB_LGS8GXX is not set
# CONFIG_DVB_LNBH25 is not set
# CONFIG_DVB_LNBH29 is not set
# CONFIG_DVB_LNBP21 is not set
# CONFIG_DVB_LNBP22 is not set
# CONFIG_DVB_M88RS2000 is not set
# CONFIG_DVB_TDA665x is not set
# CONFIG_DVB_DRX39XYJ is not set

#
# Common Interface (EN50221) controller drivers
#
# CONFIG_DVB_CXD2099 is not set
# CONFIG_DVB_SP2 is not set
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
CONFIG_AGP=m
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=m
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
CONFIG_DRM_I2C_NXP_TDA998X=m
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

CONFIG_DRM_RADEON=m
CONFIG_DRM_RADEON_USERPTR=y
# CONFIG_DRM_AMDGPU is not set
CONFIG_DRM_NOUVEAU=m
CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT=y
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
# CONFIG_NOUVEAU_DEBUG_MMU is not set
# CONFIG_NOUVEAU_DEBUG_PUSH is not set
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
# CONFIG_DRM_KMB_DISPLAY is not set
CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_UDL=m
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
# CONFIG_DRM_QXL is not set
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=m
CONFIG_DRM_ANALOGIX_DP=m
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
# CONFIG_DRM_HISI_HIBMC is not set
# CONFIG_DRM_LOGICVC is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
CONFIG_DRM_LEGACY=y
CONFIG_DRM_TDFX=m
# CONFIG_DRM_R128 is not set
CONFIG_DRM_MGA=m
CONFIG_DRM_SIS=m
# CONFIG_DRM_VIA is not set
CONFIG_DRM_SAVAGE=m
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=m
CONFIG_DRM_NOMODESET=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=m
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_DDC=m
CONFIG_FB_CFB_FILLRECT=m
CONFIG_FB_CFB_COPYAREA=m
CONFIG_FB_CFB_IMAGEBLIT=m
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_SVGALIB=m
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
CONFIG_FB_PM2=m
# CONFIG_FB_PM2_FIFO_DISCONNECT is not set
CONFIG_FB_CLPS711X=m
CONFIG_FB_CYBER2000=m
# CONFIG_FB_CYBER2000_DDC is not set
# CONFIG_FB_ARC is not set
CONFIG_FB_STI=m
# CONFIG_FB_PVR2 is not set
# CONFIG_FB_OPENCORES is not set
CONFIG_FB_S1D13XXX=m
CONFIG_FB_NVIDIA=m
# CONFIG_FB_NVIDIA_I2C is not set
CONFIG_FB_NVIDIA_DEBUG=y
CONFIG_FB_NVIDIA_BACKLIGHT=y
CONFIG_FB_RIVA=m
# CONFIG_FB_RIVA_I2C is not set
# CONFIG_FB_RIVA_DEBUG is not set
# CONFIG_FB_RIVA_BACKLIGHT is not set
CONFIG_FB_I740=m
# CONFIG_FB_MATROX is not set
CONFIG_FB_RADEON=m
# CONFIG_FB_RADEON_I2C is not set
CONFIG_FB_RADEON_BACKLIGHT=y
# CONFIG_FB_RADEON_DEBUG is not set
# CONFIG_FB_ATY128 is not set
CONFIG_FB_ATY=m
# CONFIG_FB_ATY_CT is not set
CONFIG_FB_ATY_GX=y
# CONFIG_FB_ATY_BACKLIGHT is not set
# CONFIG_FB_S3 is not set
CONFIG_FB_SAVAGE=m
# CONFIG_FB_SAVAGE_I2C is not set
# CONFIG_FB_SAVAGE_ACCEL is not set
CONFIG_FB_SIS=m
# CONFIG_FB_SIS_300 is not set
CONFIG_FB_SIS_315=y
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
CONFIG_FB_VT8623=m
CONFIG_FB_TRIDENT=m
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
CONFIG_FB_CARMINE=m
# CONFIG_FB_CARMINE_DRAM_EVAL is not set
CONFIG_CARMINE_DRAM_CUSTOM=y
# CONFIG_FB_W100 is not set
CONFIG_FB_TMIO=m
CONFIG_FB_TMIO_ACCELL=y
CONFIG_FB_SMSCUFX=m
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_GOLDFISH is not set
CONFIG_FB_VIRTUAL=m
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_BROADSHEET=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SSD1307 is not set
CONFIG_FB_SM712=m
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=m
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_LM3533=m
# CONFIG_BACKLIGHT_OMAP1 is not set
CONFIG_BACKLIGHT_PWM=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
CONFIG_BACKLIGHT_ADP8860=m
CONFIG_BACKLIGHT_ADP8870=m
CONFIG_BACKLIGHT_PCF50633=m
CONFIG_BACKLIGHT_LM3630A=m
CONFIG_BACKLIGHT_LM3639=m
# CONFIG_BACKLIGHT_LP855X is not set
# CONFIG_BACKLIGHT_GPIO is not set
CONFIG_BACKLIGHT_LV5207LP=m
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_VGASTATE=m
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=160
CONFIG_DUMMY_CONSOLE_ROWS=64
# CONFIG_FRAMEBUFFER_CONSOLE is not set
CONFIG_STI_CONSOLE=y
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
# CONFIG_LOGO_LINUX_CLUT224 is not set
CONFIG_LOGO_PARISC_CLUT224=y
# end of Graphics support

CONFIG_SOUND=m
# CONFIG_SND is not set

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
CONFIG_HIDRAW=y
# CONFIG_UHID is not set
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACRUX=y
CONFIG_HID_ACRUX_FF=y
# CONFIG_HID_APPLE is not set
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=m
CONFIG_HID_CHERRY=y
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
CONFIG_DRAGONRISE_FF=y
CONFIG_HID_EMS_FF=m
# CONFIG_HID_ELECOM is not set
CONFIG_HID_EZKEY=y
# CONFIG_HID_GEMBIRD is not set
CONFIG_HID_GFRM=y
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_VIVALDI is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=m
# CONFIG_HID_ITE is not set
# CONFIG_HID_JABRA is not set
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
CONFIG_HID_MAGICMOUSE=m
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NINTENDO is not set
# CONFIG_HID_NTI is not set
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
# CONFIG_HID_PICOLCD_LCD is not set
# CONFIG_HID_PICOLCD_LEDS is not set
# CONFIG_HID_PICOLCD_CIR is not set
# CONFIG_HID_PLANTRONICS is not set
# CONFIG_HID_PXRC is not set
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=y
CONFIG_HID_SAITEK=y
# CONFIG_HID_SEMITEK is not set
CONFIG_HID_SPEEDLINK=y
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
# CONFIG_HID_SUNPLUS is not set
CONFIG_HID_RMI=y
CONFIG_HID_GREENASIA=y
CONFIG_GREENASIA_FF=y
# CONFIG_HID_SMARTJOYPLUS is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=y
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
# end of Special HID drivers

#
# USB HID support
#
# CONFIG_USB_HID is not set
CONFIG_HID_PID=y

#
# USB HID Boot Protocol drivers
#
# CONFIG_USB_KBD is not set
CONFIG_USB_MOUSE=m
# end of USB HID Boot Protocol drivers
# end of USB HID support

#
# I2C HID support
#
# end of I2C HID support

#
# Intel ISH HID support
#
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ULPI_BUS=m
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
# CONFIG_USB_DEFAULT_PERSIST is not set
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
# CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=m

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
CONFIG_USB_XHCI_HCD=m
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=m
# CONFIG_USB_XHCI_PCI_RENESAS is not set
CONFIG_USB_XHCI_PLATFORM=m
# CONFIG_USB_XHCI_HISTB is not set
# CONFIG_USB_XHCI_MTK is not set
CONFIG_USB_XHCI_MVEBU=m
CONFIG_USB_XHCI_RCAR=m
# CONFIG_USB_BRCMSTB is not set
# CONFIG_USB_EHCI_HCD is not set
# CONFIG_USB_OXU210HP_HCD is not set
CONFIG_USB_ISP116X_HCD=y
# CONFIG_USB_ISP1362_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_OHCI_HCD is not set
CONFIG_USB_UHCI_HCD=m
# CONFIG_USB_U132_HCD is not set
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
CONFIG_USB_R8A66597_HCD=m
# CONFIG_USB_RENESAS_USBHS_HCD is not set
CONFIG_USB_HCD_BCMA=m
CONFIG_USB_HCD_SSB=y
# CONFIG_USB_HCD_TEST_MODE is not set
CONFIG_USB_RENESAS_USBHS=y

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
CONFIG_USB_PRINTER=m
CONFIG_USB_WDM=y
CONFIG_USB_TMC=m

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MTU3 is not set
CONFIG_USB_MUSB_HDRC=m
# CONFIG_USB_MUSB_HOST is not set
CONFIG_USB_MUSB_GADGET=y
# CONFIG_USB_MUSB_DUAL_ROLE is not set

#
# Platform Glue Layer
#
CONFIG_USB_MUSB_TUSB6010=m
CONFIG_USB_MUSB_UX500=m
# CONFIG_USB_MUSB_MEDIATEK is not set
# CONFIG_USB_MUSB_POLARFIRE_SOC is not set

#
# MUSB DMA mode
#
CONFIG_MUSB_PIO_ONLY=y
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_HOST=y
# CONFIG_USB_DWC3_GADGET is not set
# CONFIG_USB_DWC3_DUAL_ROLE is not set

#
# Platform Glue Driver Support
#
CONFIG_USB_DWC3_HAPS=y
CONFIG_USB_DWC3_KEYSTONE=y
CONFIG_USB_DWC3_AM62=y
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=m
CONFIG_USB_CHIPIDEA_UDC=y
CONFIG_USB_CHIPIDEA_PCI=m
CONFIG_USB_CHIPIDEA_MSM=m
CONFIG_USB_CHIPIDEA_GENERIC=m
CONFIG_USB_ISP1760=m
CONFIG_USB_ISP1761_UDC=y
# CONFIG_USB_ISP1760_HOST_ROLE is not set
CONFIG_USB_ISP1760_GADGET_ROLE=y
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
CONFIG_USB_SERIAL=y
# CONFIG_USB_SERIAL_CONSOLE is not set
# CONFIG_USB_SERIAL_GENERIC is not set
# CONFIG_USB_SERIAL_SIMPLE is not set
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=y
CONFIG_USB_SERIAL_BELKIN=y
CONFIG_USB_SERIAL_CH341=y
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
CONFIG_USB_SERIAL_CP210X=m
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
CONFIG_USB_SERIAL_EMPEG=y
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=y
# CONFIG_USB_SERIAL_IPAQ is not set
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=y
CONFIG_USB_SERIAL_EDGEPORT_TI=y
CONFIG_USB_SERIAL_F81232=m
# CONFIG_USB_SERIAL_F8153X is not set
CONFIG_USB_SERIAL_GARMIN=m
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
CONFIG_USB_SERIAL_KEYSPAN_PDA=m
# CONFIG_USB_SERIAL_KEYSPAN is not set
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=m
CONFIG_USB_SERIAL_MCT_U232=m
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
CONFIG_USB_SERIAL_MOS7840=m
CONFIG_USB_SERIAL_MXUPORT=m
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=m
CONFIG_USB_SERIAL_QUALCOMM=y
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
CONFIG_USB_SERIAL_SIERRAWIRELESS=y
CONFIG_USB_SERIAL_SYMBOL=y
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=m
CONFIG_USB_SERIAL_OMNINET=y
CONFIG_USB_SERIAL_OPTICON=y
CONFIG_USB_SERIAL_XSENS_MT=y
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
# CONFIG_USB_SERIAL_XR is not set
# CONFIG_USB_SERIAL_DEBUG is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
CONFIG_USB_ADUTUX=m
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_LEGOTOWER=m
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
CONFIG_USB_FTDI_ELAN=m
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_QCOM_EUD is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
CONFIG_USB_LD=m
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
CONFIG_USB_TEST=y
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=m
CONFIG_USB_EZUSB_FX2=m
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=m
CONFIG_USB_HSIC_USB4604=m
CONFIG_USB_LINK_LAYER_TEST=y
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_BRCM_USB_PINMAP is not set
# CONFIG_USB_ONBOARD_HUB is not set

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_KEYSTONE_USB_PHY=m
CONFIG_NOP_USB_XCEIV=m
# CONFIG_AM335X_PHY_USB is not set
CONFIG_USB_GPIO_VBUS=y
# CONFIG_USB_ISP1301 is not set
# CONFIG_USB_TEGRA_PHY is not set
# CONFIG_USB_ULPI is not set
# CONFIG_JZ4770_PHY is not set
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG=y
# CONFIG_USB_GADGET_VERBOSE is not set
CONFIG_USB_GADGET_DEBUG_FILES=y
# CONFIG_USB_GADGET_DEBUG_FS is not set
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
# CONFIG_U_SERIAL_CONSOLE is not set

#
# USB Peripheral Controller
#
# CONFIG_USB_LPC32XX is not set
CONFIG_USB_FUSB300=m
# CONFIG_USB_FOTG210_UDC is not set
# CONFIG_USB_GR_UDC is not set
CONFIG_USB_R8A66597=y
CONFIG_USB_RENESAS_USBHS_UDC=y
CONFIG_USB_RENESAS_USB3=y
# CONFIG_USB_PXA27X is not set
# CONFIG_USB_MV_UDC is not set
# CONFIG_USB_MV_U3D is not set
CONFIG_USB_SNP_CORE=m
CONFIG_USB_M66592=m
# CONFIG_USB_BDC_UDC is not set
CONFIG_USB_AMD5536UDC=m
CONFIG_USB_NET2272=y
# CONFIG_USB_NET2272_DMA is not set
CONFIG_USB_NET2280=m
# CONFIG_USB_GOKU is not set
CONFIG_USB_EG20T=y
CONFIG_USB_GADGET_XILINX=m
# CONFIG_USB_ASPEED_UDC is not set
# CONFIG_USB_ASPEED_VHUB is not set
CONFIG_USB_DUMMY_HCD=m
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=m
CONFIG_USB_U_SERIAL=m
CONFIG_USB_F_OBEX=m
CONFIG_USB_F_HID=m
CONFIG_USB_CONFIGFS=m
# CONFIG_USB_CONFIGFS_SERIAL is not set
# CONFIG_USB_CONFIGFS_ACM is not set
CONFIG_USB_CONFIGFS_OBEX=y
# CONFIG_USB_CONFIGFS_MASS_STORAGE is not set
# CONFIG_USB_CONFIGFS_F_LB_SS is not set
# CONFIG_USB_CONFIGFS_F_FS is not set
CONFIG_USB_CONFIGFS_F_HID=y
# CONFIG_USB_CONFIGFS_F_UVC is not set
# CONFIG_USB_CONFIGFS_F_PRINTER is not set

#
# USB Gadget precomposed configurations
#
# CONFIG_USB_ZERO is not set
# CONFIG_USB_GADGETFS is not set
# CONFIG_USB_FUNCTIONFS is not set
# CONFIG_USB_MASS_STORAGE is not set
# CONFIG_USB_G_SERIAL is not set
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_G_ACM_MS is not set
# CONFIG_USB_G_HID is not set
# CONFIG_USB_G_DBGP is not set
# CONFIG_USB_G_WEBCAM is not set
# CONFIG_USB_RAW_GADGET is not set
# end of USB Gadget precomposed configurations

# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=m
# CONFIG_MMC_BLOCK is not set
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
# CONFIG_MMC_SDHCI_PLTFM is not set
# CONFIG_MMC_SDHCI_S3C is not set
# CONFIG_MMC_MOXART is not set
# CONFIG_MMC_OMAP_HS is not set
CONFIG_MMC_TIFM_SD=m
# CONFIG_MMC_DAVINCI is not set
# CONFIG_MMC_S3C is not set
# CONFIG_MMC_TMIO is not set
# CONFIG_MMC_SDHI is not set
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=m
CONFIG_MMC_DW=m
CONFIG_MMC_DW_PLTFM=m
# CONFIG_MMC_DW_BLUEFIELD is not set
CONFIG_MMC_DW_EXYNOS=m
# CONFIG_MMC_DW_HI3798CV200 is not set
CONFIG_MMC_DW_K3=m
CONFIG_MMC_DW_PCI=m
CONFIG_MMC_SH_MMCIF=m
CONFIG_MMC_VUB300=m
CONFIG_MMC_USHC=m
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_BCM2835 is not set
# CONFIG_MMC_OWL is not set
# CONFIG_MMC_LITEX is not set
CONFIG_MEMSTICK=m
CONFIG_MEMSTICK_DEBUG=y

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=m
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
# CONFIG_MEMSTICK_R592 is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_ARIEL is not set
# CONFIG_LEDS_LM3530 is not set
# CONFIG_LEDS_LM3532 is not set
CONFIG_LEDS_LM3533=m
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_MT6323 is not set
# CONFIG_LEDS_S3C24XX is not set
# CONFIG_LEDS_COBALT_QUBE is not set
# CONFIG_LEDS_COBALT_RAQ is not set
CONFIG_LEDS_PCA9532=m
CONFIG_LEDS_PCA9532_GPIO=y
CONFIG_LEDS_GPIO=m
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_PCA955X=m
# CONFIG_LEDS_PCA955X_GPIO is not set
# CONFIG_LEDS_PCA963X is not set
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=m
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=m
CONFIG_LEDS_MC13783=m
CONFIG_LEDS_NS2=y
CONFIG_LEDS_TCA6507=m
CONFIG_LEDS_TLC591XX=m
CONFIG_LEDS_LM355x=m
# CONFIG_LEDS_OT200 is not set
# CONFIG_LEDS_IS31FL319X is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
# CONFIG_LEDS_BLINKM is not set
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set
CONFIG_LEDS_TPS6105X=m
# CONFIG_LEDS_IP30 is not set

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AS3645A is not set
# CONFIG_LEDS_LM3601X is not set
# CONFIG_LEDS_RT8515 is not set
# CONFIG_LEDS_SGM3140 is not set

#
# RGB LED drivers
#

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set

#
# Simple LED drivers
#
CONFIG_ACCESSIBILITY=y
# CONFIG_A11Y_BRAILLE_CONSOLE is not set

#
# Speakup console speech
#
# CONFIG_SPEAKUP is not set
# end of Speakup console speech

CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
CONFIG_RTC_DEBUG=y
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
CONFIG_RTC_INTF_DEV_UIE_EMUL=y
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_88PM80X is not set
CONFIG_RTC_DRV_ABB5ZES3=m
# CONFIG_RTC_DRV_ABEOZ9 is not set
CONFIG_RTC_DRV_ABX80X=m
# CONFIG_RTC_DRV_BRCMSTB is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1672 is not set
# CONFIG_RTC_DRV_MAX6900 is not set
CONFIG_RTC_DRV_MAX8907=m
# CONFIG_RTC_DRV_MAX77686 is not set
CONFIG_RTC_DRV_RS5C372=m
# CONFIG_RTC_DRV_ISL1208 is not set
CONFIG_RTC_DRV_ISL12022=m
# CONFIG_RTC_DRV_ISL12026 is not set
CONFIG_RTC_DRV_X1205=m
# CONFIG_RTC_DRV_PCF8523 is not set
CONFIG_RTC_DRV_PCF85063=m
# CONFIG_RTC_DRV_PCF85363 is not set
# CONFIG_RTC_DRV_PCF8563 is not set
CONFIG_RTC_DRV_PCF8583=m
# CONFIG_RTC_DRV_M41T80 is not set
CONFIG_RTC_DRV_BQ32K=m
CONFIG_RTC_DRV_S35390A=m
CONFIG_RTC_DRV_FM3130=m
CONFIG_RTC_DRV_RX8010=m
# CONFIG_RTC_DRV_RX8581 is not set
# CONFIG_RTC_DRV_RX8025 is not set
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_S5M is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=m

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
# CONFIG_RTC_DRV_RV3029C2 is not set
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_DS1286=m
# CONFIG_RTC_DRV_DS1511 is not set
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
# CONFIG_RTC_DRV_DA9063 is not set
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=y
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=y
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set
# CONFIG_RTC_DRV_GAMECUBE is not set
# CONFIG_RTC_DRV_SC27XX is not set
CONFIG_RTC_DRV_SPEAR=m
CONFIG_RTC_DRV_PCF50633=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_ASM9260 is not set
# CONFIG_RTC_DRV_DAVINCI is not set
CONFIG_RTC_DRV_DIGICOLOR=y
# CONFIG_RTC_DRV_FSL_FTM_ALARM is not set
# CONFIG_RTC_DRV_MESON is not set
# CONFIG_RTC_DRV_MESON_VRTC is not set
CONFIG_RTC_DRV_S3C=m
# CONFIG_RTC_DRV_EP93XX is not set
CONFIG_RTC_DRV_GENERIC=y
# CONFIG_RTC_DRV_VT8500 is not set
CONFIG_RTC_DRV_SUNXI=m
CONFIG_RTC_DRV_MV=y
# CONFIG_RTC_DRV_FTRTC010 is not set
CONFIG_RTC_DRV_STMP=m
CONFIG_RTC_DRV_MC13XXX=m
CONFIG_RTC_DRV_LPC32XX=y
CONFIG_RTC_DRV_PM8XXX=m
CONFIG_RTC_DRV_TEGRA=y
CONFIG_RTC_DRV_MOXART=m
# CONFIG_RTC_DRV_MT2712 is not set
# CONFIG_RTC_DRV_MT6397 is not set
# CONFIG_RTC_DRV_MT7622 is not set
CONFIG_RTC_DRV_XGENE=m
# CONFIG_RTC_DRV_STM32 is not set
# CONFIG_RTC_DRV_RTD119X is not set
# CONFIG_RTC_DRV_TI_K3 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
# CONFIG_RTC_DRV_MSC313 is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set
# CONFIG_VFIO is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=m
CONFIG_VIRTIO_PCI_LIB_LEGACY=m
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=m
CONFIG_VIRTIO_PCI_LEGACY=y
CONFIG_VIRTIO_BALLOON=m
CONFIG_VIRTIO_INPUT=m
CONFIG_VIRTIO_MMIO=m
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=m
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=m
CONFIG_COMEDI_TEST=m
CONFIG_COMEDI_PARPORT=m
CONFIG_COMEDI_SSV_DNP=m
CONFIG_COMEDI_ISA_DRIVERS=y
# CONFIG_COMEDI_PCL711 is not set
CONFIG_COMEDI_PCL724=m
CONFIG_COMEDI_PCL726=m
CONFIG_COMEDI_PCL730=m
CONFIG_COMEDI_PCL812=m
CONFIG_COMEDI_PCL816=m
CONFIG_COMEDI_PCL818=m
CONFIG_COMEDI_PCM3724=m
# CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
CONFIG_COMEDI_AMPLC_PC236_ISA=m
# CONFIG_COMEDI_AMPLC_PC263_ISA is not set
# CONFIG_COMEDI_RTI800 is not set
CONFIG_COMEDI_RTI802=m
CONFIG_COMEDI_DAC02=m
# CONFIG_COMEDI_DAS16M1 is not set
CONFIG_COMEDI_DAS08_ISA=m
# CONFIG_COMEDI_DAS16 is not set
CONFIG_COMEDI_DAS800=m
CONFIG_COMEDI_DAS1800=m
# CONFIG_COMEDI_DAS6402 is not set
CONFIG_COMEDI_DT2801=m
# CONFIG_COMEDI_DT2811 is not set
CONFIG_COMEDI_DT2814=m
CONFIG_COMEDI_DT2815=m
CONFIG_COMEDI_DT2817=m
CONFIG_COMEDI_DT282X=m
CONFIG_COMEDI_DMM32AT=m
# CONFIG_COMEDI_FL512 is not set
CONFIG_COMEDI_AIO_AIO12_8=m
CONFIG_COMEDI_AIO_IIRO_16=m
CONFIG_COMEDI_II_PCI20KC=m
# CONFIG_COMEDI_C6XDIGIO is not set
# CONFIG_COMEDI_MPC624 is not set
CONFIG_COMEDI_ADQ12B=m
CONFIG_COMEDI_NI_AT_A2150=m
CONFIG_COMEDI_NI_AT_AO=m
# CONFIG_COMEDI_NI_ATMIO is not set
# CONFIG_COMEDI_NI_ATMIO16D is not set
CONFIG_COMEDI_NI_LABPC_ISA=m
CONFIG_COMEDI_PCMAD=m
CONFIG_COMEDI_PCMDA12=m
CONFIG_COMEDI_PCMMIO=m
# CONFIG_COMEDI_PCMUIO is not set
CONFIG_COMEDI_MULTIQ3=m
# CONFIG_COMEDI_S526 is not set
# CONFIG_COMEDI_PCI_DRIVERS is not set
CONFIG_COMEDI_USB_DRIVERS=m
# CONFIG_COMEDI_DT9812 is not set
# CONFIG_COMEDI_NI_USB6501 is not set
CONFIG_COMEDI_USBDUX=m
# CONFIG_COMEDI_USBDUXFAST is not set
CONFIG_COMEDI_USBDUXSIGMA=m
# CONFIG_COMEDI_VMK80XX is not set
CONFIG_COMEDI_8254=m
CONFIG_COMEDI_8255=m
CONFIG_COMEDI_8255_SA=m
CONFIG_COMEDI_KCOMEDILIB=m
CONFIG_COMEDI_AMPLC_PC236=m
CONFIG_COMEDI_DAS08=m
CONFIG_COMEDI_NI_LABPC=m
# CONFIG_COMEDI_TESTS is not set
CONFIG_STAGING=y

#
# IIO staging drivers
#

#
# Accelerometers
#
# end of Accelerometers

#
# Analog to digital converters
#
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
# CONFIG_ADT7316 is not set
# end of Analog digital bi-direction converters

#
# Direct Digital Synthesis
#
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
CONFIG_AD5933=m
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
CONFIG_ADE7854=m
CONFIG_ADE7854_I2C=m
# end of Active energy metering IC

#
# Resolver to digital converters
#
# end of Resolver to digital converters
# end of IIO staging drivers

CONFIG_FB_SM750=m
# CONFIG_USB_EMXX is not set
# CONFIG_STAGING_MEDIA is not set
# CONFIG_MOST_COMPONENTS is not set
# CONFIG_FIELDBUS_DEV is not set
CONFIG_VME_BUS=y

#
# VME Bridge Drivers
#
CONFIG_VME_TSI148=m
CONFIG_VME_FAKE=y

#
# VME Device Drivers
#
CONFIG_VME_USER=m
# CONFIG_GOLDFISH is not set
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CROS_EC is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_OLPC_XO175 is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_COMMON_CLK is not set
# CONFIG_HWSPINLOCK is not set
# CONFIG_MAILBOX is not set
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# CONFIG_IOMMU_IO_PGTABLE_ARMV7S is not set
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
# CONFIG_OMAP_IOMMU is not set
# CONFIG_ROCKCHIP_IOMMU is not set
# CONFIG_SUN50I_IOMMU is not set
# CONFIG_S390_CCW_IOMMU is not set
# CONFIG_S390_AP_IOMMU is not set
# CONFIG_MTK_IOMMU is not set
# CONFIG_SPRD_IOMMU is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
# CONFIG_REMOTEPROC_CDEV is not set
# CONFIG_INGENIC_VPU_RPROC is not set
# CONFIG_MTK_SCP is not set
# CONFIG_MESON_MX_AO_ARC_REMOTEPROC is not set
# CONFIG_RCAR_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
# CONFIG_ASPEED_LPC_SNOOP is not set
# CONFIG_ASPEED_UART_ROUTING is not set
# CONFIG_ASPEED_P2A_CTRL is not set
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BCM63XX is not set
# CONFIG_SOC_BRCMSTB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_SOC_IMX8M is not set
# CONFIG_SOC_IMX9 is not set
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
# CONFIG_MTK_DEVAPC is not set
CONFIG_MTK_INFRACFG=y
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_GSBI is not set
# CONFIG_QCOM_LLCC is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_ICC_BWMON is not set
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
CONFIG_SOC_SAMSUNG=y
# CONFIG_EXYNOS_CHIPID is not set
# CONFIG_EXYNOS_USI is not set
CONFIG_EXYNOS_PM_DOMAINS=y
# CONFIG_EXYNOS_REGULATOR_COUPLER is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=m
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=y
CONFIG_EXTCON_MAX14577=m
CONFIG_EXTCON_MAX3355=m
CONFIG_EXTCON_MAX77693=m
# CONFIG_EXTCON_PTN5150 is not set
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=m
CONFIG_EXTCON_SM5502=m
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
# CONFIG_BRCMSTB_DPFE is not set
# CONFIG_BRCMSTB_MEMC is not set
# CONFIG_BT1_L2_CTL is not set
# CONFIG_TI_EMIF is not set
# CONFIG_FSL_CORENET_CF is not set
# CONFIG_FSL_IFC is not set
# CONFIG_MTK_SMI is not set
# CONFIG_DA8XX_DDRCTL is not set
# CONFIG_RENESAS_RPCIF is not set
# CONFIG_STM32_FMC2_EBI is not set
CONFIG_SAMSUNG_MC=y
CONFIG_EXYNOS_SROM=y
CONFIG_IIO=m
CONFIG_IIO_BUFFER=y
# CONFIG_IIO_BUFFER_CB is not set
# CONFIG_IIO_BUFFER_DMA is not set
# CONFIG_IIO_BUFFER_DMAENGINE is not set
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=m
CONFIG_IIO_TRIGGERED_BUFFER=m
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
# CONFIG_IIO_SW_TRIGGER is not set
# CONFIG_IIO_TRIGGERED_EVENT is not set

#
# Accelerometers
#
# CONFIG_ADXL313_I2C is not set
# CONFIG_ADXL345_I2C is not set
# CONFIG_ADXL355_I2C is not set
# CONFIG_ADXL367_I2C is not set
# CONFIG_ADXL372_I2C is not set
CONFIG_BMA180=m
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=m
CONFIG_BMC150_ACCEL_I2C=m
# CONFIG_DA280 is not set
# CONFIG_DA311 is not set
CONFIG_DMARD06=m
# CONFIG_DMARD09 is not set
# CONFIG_DMARD10 is not set
# CONFIG_FXLS8962AF_I2C is not set
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_KXSD9=m
CONFIG_KXSD9_I2C=m
CONFIG_KXCJK1013=m
CONFIG_MC3230=m
# CONFIG_MMA7455_I2C is not set
CONFIG_MMA7660=m
CONFIG_MMA8452=m
CONFIG_MMA9551_CORE=m
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=m
# CONFIG_MSA311 is not set
CONFIG_MXC4005=m
CONFIG_MXC6255=m
CONFIG_STK8312=m
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7091R5 is not set
CONFIG_AD7291=m
CONFIG_AD7606=m
CONFIG_AD7606_IFACE_PARALLEL=m
CONFIG_AD799X=m
# CONFIG_AT91_SAMA5D2_ADC is not set
# CONFIG_AXP20X_ADC is not set
# CONFIG_AXP288_ADC is not set
CONFIG_BCM_IPROC_ADC=m
# CONFIG_BERLIN2_ADC is not set
# CONFIG_ENVELOPE_DETECTOR is not set
# CONFIG_HX711 is not set
# CONFIG_INA2XX_ADC is not set
# CONFIG_INGENIC_ADC is not set
# CONFIG_IMX7D_ADC is not set
# CONFIG_IMX8QXP_ADC is not set
# CONFIG_LPC18XX_ADC is not set
CONFIG_LPC32XX_ADC=m
# CONFIG_LTC2471 is not set
CONFIG_LTC2485=m
# CONFIG_LTC2497 is not set
CONFIG_MAX1363=m
# CONFIG_MAX9611 is not set
CONFIG_MCP3422=m
CONFIG_MEDIATEK_MT6577_AUXADC=m
# CONFIG_NAU7802 is not set
# CONFIG_NPCM_ADC is not set
CONFIG_QCOM_VADC_COMMON=m
CONFIG_QCOM_SPMI_IADC=m
CONFIG_QCOM_SPMI_VADC=m
# CONFIG_QCOM_SPMI_ADC5 is not set
# CONFIG_RCAR_GYRO_ADC is not set
# CONFIG_ROCKCHIP_SARADC is not set
# CONFIG_RICHTEK_RTQ6056 is not set
# CONFIG_RZG2L_ADC is not set
# CONFIG_SC27XX_ADC is not set
# CONFIG_SPEAR_ADC is not set
# CONFIG_SD_ADC_MODULATOR is not set
# CONFIG_STM32_DFSDM_CORE is not set
# CONFIG_STM32_DFSDM_ADC is not set
CONFIG_TI_ADC081C=m
# CONFIG_TI_ADS1015 is not set
# CONFIG_TI_AM335X_ADC is not set
# CONFIG_VF610_ADC is not set
# CONFIG_XILINX_XADC is not set
# CONFIG_XILINX_AMS is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
# CONFIG_IIO_RESCALE is not set
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_HMC425 is not set
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=m
CONFIG_AD7746=m
# end of Capacitance to digital converters

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
# CONFIG_ATLAS_EZO_SENSOR is not set
# CONFIG_BME680 is not set
# CONFIG_CCS811 is not set
CONFIG_IAQCORE=m
# CONFIG_SCD30_CORE is not set
# CONFIG_SCD4X is not set
# CONFIG_SENSIRION_SGP30 is not set
# CONFIG_SENSIRION_SGP40 is not set
# CONFIG_SPS30_I2C is not set
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
CONFIG_VZ89X=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
CONFIG_AD5064=m
# CONFIG_AD5380 is not set
CONFIG_AD5446=m
CONFIG_AD5592R_BASE=m
CONFIG_AD5593R=m
# CONFIG_AD5696_I2C is not set
# CONFIG_DPOT_DAC is not set
# CONFIG_DS4424 is not set
# CONFIG_LPC18XX_DAC is not set
CONFIG_M62332=m
CONFIG_MAX517=m
# CONFIG_MAX5821 is not set
CONFIG_MCP4725=m
# CONFIG_STM32_DAC is not set
# CONFIG_TI_DAC5571 is not set
# CONFIG_VF610_DAC is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
# CONFIG_IIO_SIMPLE_DUMMY is not set
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_BMG160 is not set
# CONFIG_FXAS21002C is not set
# CONFIG_MPU3050_I2C is not set
CONFIG_IIO_ST_GYRO_3AXIS=m
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4404 is not set
# CONFIG_MAX30100 is not set
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
CONFIG_DHT11=m
# CONFIG_HDC100X is not set
# CONFIG_HDC2010 is not set
# CONFIG_HTS221 is not set
CONFIG_HTU21=m
CONFIG_SI7005=m
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=m
CONFIG_BMI160_I2C=m
# CONFIG_BOSCH_BNO055_I2C is not set
# CONFIG_FXOS8700_I2C is not set
CONFIG_KMX61=m
# CONFIG_INV_ICM42600_I2C is not set
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
# CONFIG_IIO_ST_LSM6DSX is not set
# CONFIG_IIO_ST_LSM9DS0 is not set
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ADJD_S311=m
# CONFIG_ADUX1020 is not set
# CONFIG_AL3010 is not set
# CONFIG_AL3320A is not set
CONFIG_APDS9300=m
CONFIG_APDS9960=m
# CONFIG_AS73211 is not set
CONFIG_BH1750=m
CONFIG_BH1780=m
CONFIG_CM32181=m
CONFIG_CM3232=m
CONFIG_CM3323=m
# CONFIG_CM3605 is not set
# CONFIG_CM36651 is not set
# CONFIG_GP2AP002 is not set
CONFIG_GP2AP020A00F=m
# CONFIG_IQS621_ALS is not set
# CONFIG_SENSORS_ISL29018 is not set
CONFIG_SENSORS_ISL29028=m
# CONFIG_ISL29125 is not set
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=m
# CONFIG_SENSORS_LM3533 is not set
# CONFIG_LTR501 is not set
# CONFIG_LTRF216A is not set
# CONFIG_LV0104CS is not set
CONFIG_MAX44000=m
# CONFIG_MAX44009 is not set
# CONFIG_NOA1305 is not set
CONFIG_OPT3001=m
CONFIG_PA12203001=m
# CONFIG_SI1133 is not set
CONFIG_SI1145=m
# CONFIG_STK3310 is not set
# CONFIG_ST_UVIS25 is not set
# CONFIG_TCS3414 is not set
CONFIG_TCS3472=m
CONFIG_SENSORS_TSL2563=m
CONFIG_TSL2583=m
# CONFIG_TSL2591 is not set
# CONFIG_TSL2772 is not set
CONFIG_TSL4531=m
CONFIG_US5182D=m
CONFIG_VCNL4000=m
# CONFIG_VCNL4035 is not set
# CONFIG_VEML6030 is not set
# CONFIG_VEML6070 is not set
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
CONFIG_AK8975=m
CONFIG_AK09911=m
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
CONFIG_MAG3110=m
CONFIG_MMC35240=m
# CONFIG_IIO_ST_MAGN_3AXIS is not set
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_YAMAHA_YAS530 is not set
# end of Magnetometer sensors

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
CONFIG_IIO_INTERRUPT_TRIGGER=m
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
# CONFIG_IIO_STM32_TIMER_TRIGGER is not set
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# CONFIG_IQS624_POS is not set
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# CONFIG_AD5110 is not set
# CONFIG_AD5272 is not set
# CONFIG_DS1803 is not set
# CONFIG_MAX5432 is not set
# CONFIG_MCP4018 is not set
# CONFIG_MCP4531 is not set
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
# CONFIG_BMP280 is not set
# CONFIG_DLHL60D is not set
# CONFIG_DPS310 is not set
# CONFIG_HP03 is not set
# CONFIG_ICP10100 is not set
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
CONFIG_MPL3115=m
CONFIG_MS5611=m
# CONFIG_MS5611_I2C is not set
CONFIG_MS5637=m
# CONFIG_IIO_ST_PRESS is not set
CONFIG_T5403=m
CONFIG_HP206C=m
CONFIG_ZPA2326=m
CONFIG_ZPA2326_I2C=m
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
CONFIG_LIDAR_LITE_V2=m
# CONFIG_MB1232 is not set
# CONFIG_PING is not set
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
# CONFIG_SX9310 is not set
# CONFIG_SX9324 is not set
# CONFIG_SX9360 is not set
CONFIG_SX9500=m
# CONFIG_SRF08 is not set
# CONFIG_VCNL3020 is not set
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_IQS620AT_TEMP is not set
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
CONFIG_TMP006=m
# CONFIG_TMP007 is not set
# CONFIG_TMP117 is not set
CONFIG_TSYS01=m
CONFIG_TSYS02D=m
# end of Temperature sensors

CONFIG_NTB=m
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
CONFIG_NTB_TOOL=m
# CONFIG_NTB_PERF is not set
CONFIG_NTB_TRANSPORT=m
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_BCM2835 is not set
# CONFIG_PWM_BERLIN is not set
# CONFIG_PWM_BRCMSTB is not set
# CONFIG_PWM_CLK is not set
CONFIG_PWM_CLPS711X=m
# CONFIG_PWM_DWC is not set
# CONFIG_PWM_EP93XX is not set
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_IMX1 is not set
# CONFIG_PWM_IMX27 is not set
# CONFIG_PWM_INTEL_LGM is not set
# CONFIG_PWM_IQS620A is not set
# CONFIG_PWM_LPC18XX_SCT is not set
# CONFIG_PWM_LPC32XX is not set
# CONFIG_PWM_LPSS_PCI is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
CONFIG_PWM_MTK_DISP=m
# CONFIG_PWM_MEDIATEK is not set
CONFIG_PWM_PCA9685=m
# CONFIG_PWM_PXA is not set
# CONFIG_PWM_RASPBERRYPI_POE is not set
CONFIG_PWM_RCAR=y
CONFIG_PWM_RENESAS_TPU=y
# CONFIG_PWM_ROCKCHIP is not set
# CONFIG_PWM_SAMSUNG is not set
# CONFIG_PWM_SL28CPLD is not set
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STM32 is not set
# CONFIG_PWM_STM32_LP is not set
# CONFIG_PWM_TEGRA is not set
# CONFIG_PWM_TIECAP is not set
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_VISCONTI is not set
# CONFIG_PWM_VT8500 is not set

#
# IRQ chip support
#
# CONFIG_AL_FIC is not set
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_SL28CPLD_INTC is not set
# CONFIG_TS4800_IRQ is not set
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_MESON_IRQ_GPIO is not set
# CONFIG_IMX_IRQSTEER is not set
# CONFIG_IMX_INTMUX is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
# CONFIG_MCHP_EIC is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_BOARD_TPCI200 is not set
CONFIG_SERIAL_IPOCTAL=m
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_A10SR is not set
# CONFIG_RESET_ATH79 is not set
# CONFIG_RESET_AXS10X is not set
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_QCOM_AOSS is not set
# CONFIG_RESET_QCOM_PDC is not set
CONFIG_RESET_RASPBERRYPI=m
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
# CONFIG_RESET_SCMI is not set
# CONFIG_RESET_SIMPLE is not set
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_STARFIVE_JH7100 is not set
# CONFIG_RESET_SUNPLUS is not set
# CONFIG_RESET_SUNXI is not set
# CONFIG_RESET_TI_SCI is not set
# CONFIG_RESET_TI_SYSCON is not set
# CONFIG_RESET_TI_TPS380X is not set
# CONFIG_RESET_TN48M_CPLD is not set
# CONFIG_RESET_ZYNQ is not set
# CONFIG_COMMON_RESET_HI3660 is not set
# CONFIG_COMMON_RESET_HI6220 is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_PHY_PISTACHIO_USB is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set
# CONFIG_PHY_SUN4I_USB is not set
# CONFIG_PHY_SUN9I_USB is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_HI6220_USB=y
# CONFIG_PHY_HI3660_USB is not set
# CONFIG_PHY_HI3670_USB is not set
# CONFIG_PHY_HI3670_PCIE is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_INGENIC_USB is not set
CONFIG_PHY_PXA_28NM_HSIC=m
CONFIG_PHY_PXA_28NM_USB2=m
# CONFIG_PHY_PXA_USB is not set
# CONFIG_PHY_MMP3_USB is not set
# CONFIG_PHY_MMP3_HSIC is not set
# CONFIG_PHY_CPCAP_USB is not set
# CONFIG_PHY_QCOM_USB_HS is not set
# CONFIG_PHY_QCOM_USB_HSIC is not set
# CONFIG_PHY_MT7621_PCI is not set
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
CONFIG_PHY_ROCKCHIP_PCIE=m
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_SAMSUNG_USB2 is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
# CONFIG_PHY_TEGRA194_P2U is not set
# CONFIG_PHY_DA8XX_USB is not set
# CONFIG_PHY_DM816X_USB is not set
CONFIG_OMAP_CONTROL_PHY=y
# CONFIG_TI_PIPE3 is not set
CONFIG_PHY_TUSB1210=m
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_MCB is not set
# CONFIG_RAS is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

# CONFIG_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_APPLE_EFUSES is not set
# CONFIG_NVMEM_BCM_OCOTP is not set
# CONFIG_NVMEM_BRCM_NVRAM is not set
# CONFIG_NVMEM_IMX_IIM is not set
CONFIG_NVMEM_IMX_OCOTP=m
# CONFIG_NVMEM_LAN9662_OTPC is not set
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
CONFIG_NVMEM_LPC18XX_EEPROM=m
# CONFIG_NVMEM_LPC18XX_OTP is not set
# CONFIG_NVMEM_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_MICROCHIP_OTPC is not set
# CONFIG_NVMEM_MTK_EFUSE is not set
CONFIG_NVMEM_MXS_OCOTP=m
# CONFIG_NVMEM_NINTENDO_OTP is not set
# CONFIG_NVMEM_QCOM_QFPROM is not set
# CONFIG_NVMEM_RMEM is not set
# CONFIG_NVMEM_ROCKCHIP_EFUSE is not set
# CONFIG_NVMEM_ROCKCHIP_OTP is not set
# CONFIG_NVMEM_SC27XX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_NVMEM_SPMI_SDAM is not set
# CONFIG_NVMEM_SPRD_EFUSE is not set
# CONFIG_NVMEM_STM32_ROMEM is not set
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
# CONFIG_NVMEM_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=m
# CONFIG_FPGA_MGR_SOCFPGA is not set
# CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
# CONFIG_ALTERA_PR_IP_CORE is not set
# CONFIG_FPGA_MGR_ALTERA_CVP is not set
CONFIG_FPGA_MGR_ZYNQ_FPGA=m
# CONFIG_FPGA_BRIDGE is not set
# CONFIG_FPGA_DFL is not set
# CONFIG_FPGA_MGR_ZYNQMP_FPGA is not set
# CONFIG_FPGA_MGR_VERSAL_FPGA is not set
# CONFIG_TEE is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
CONFIG_MOST=m
# CONFIG_MOST_USB_HDM is not set
# CONFIG_MOST_CDEV is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=m
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=m
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=m
CONFIG_JBD2_DEBUG=y
CONFIG_FS_MBCACHE=m
CONFIG_REISERFS_FS=m
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
# CONFIG_XFS_ONLINE_SCRUB is not set
CONFIG_XFS_WARN=y
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=y
# CONFIG_BTRFS_FS is not set
CONFIG_NILFS2_FS=y
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
# CONFIG_F2FS_FS_XATTR is not set
CONFIG_F2FS_CHECK_FS=y
CONFIG_F2FS_FAULT_INJECTION=y
# CONFIG_F2FS_FS_COMPRESSION is not set
CONFIG_F2FS_IOSTAT=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
# CONFIG_FILE_LOCKING is not set
# CONFIG_FS_ENCRYPTION is not set
# CONFIG_FS_VERITY is not set
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
CONFIG_PRINT_QUOTA_WARNING=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=m
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=m
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=y
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_CACHEFILES is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
# CONFIG_ZISOFS is not set
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
# CONFIG_VFAT_FS is not set
CONFIG_FAT_DEFAULT_CODEPAGE=437
# CONFIG_EXFAT_FS is not set
CONFIG_NTFS_FS=m
# CONFIG_NTFS_DEBUG is not set
# CONFIG_NTFS_RW is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
# CONFIG_PROC_SYSCTL is not set
# CONFIG_PROC_PAGE_MONITOR is not set
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=m
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=y
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=y
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=y
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
CONFIG_NLS_CODEPAGE_874=y
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=m
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=m
# CONFIG_NLS_ISO8859_9 is not set
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=y
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=y
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=y
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
CONFIG_NLS_MAC_INUIT=m
# CONFIG_NLS_MAC_ROMANIAN is not set
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
# CONFIG_UNICODE is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=y
CONFIG_TRUSTED_KEYS_TPM=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_USER_DECRYPTED_DATA is not set
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITYFS=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
# end of Crypto core or helper

#
# Public-key cryptography
#
# CONFIG_CRYPTO_RSA is not set
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
# CONFIG_CRYPTO_ARIA is not set
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
# CONFIG_CRYPTO_ECHAINIV is not set
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
# CONFIG_CRYPTO_BLAKE2B is not set
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLY1305=m
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_SM3_GENERIC is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_VMAC=m
CONFIG_CRYPTO_WP512=y
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=m
CONFIG_CRYPTO_LZ4HC=m
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_ALLWINNER is not set
CONFIG_CRYPTO_DEV_HIFN_795X=y
CONFIG_CRYPTO_DEV_HIFN_795X_RNG=y
# CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
CONFIG_CRYPTO_DEV_S5P=y
# CONFIG_CRYPTO_DEV_EXYNOS_HASH is not set
# CONFIG_CRYPTO_DEV_ATMEL_AUTHENC is not set
CONFIG_CRYPTO_DEV_ATMEL_AES=m
# CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA is not set
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXX is not set
# CONFIG_CRYPTO_DEV_QAT_C62X is not set
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
# CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
# CONFIG_CRYPTO_DEV_QAT_C3XXXVF is not set
# CONFIG_CRYPTO_DEV_QAT_C62XVF is not set
CONFIG_CRYPTO_DEV_QCE=m
CONFIG_CRYPTO_DEV_QCE_SKCIPHER=y
CONFIG_CRYPTO_DEV_QCE_SHA=y
CONFIG_CRYPTO_DEV_QCE_AEAD=y
CONFIG_CRYPTO_DEV_QCE_ENABLE_ALL=y
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SKCIPHER is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_SHA is not set
# CONFIG_CRYPTO_DEV_QCE_ENABLE_AEAD is not set
CONFIG_CRYPTO_DEV_QCE_SW_MAX_LEN=512
# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
CONFIG_CRYPTO_DEV_IMGTEC_HASH=m
# CONFIG_CRYPTO_DEV_ZYNQMP_AES is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_SHA3 is not set
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_HISI_SEC is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
# CONFIG_CRYPTO_DEV_SA2UL is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4 is not set
# CONFIG_CRYPTO_DEV_ASPEED is not set
# CONFIG_ASYMMETRIC_KEY_TYPE is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=m
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_STMP_DEVICE=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC64_ROCKSOFT is not set
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=m
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4HC_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=m
# CONFIG_XZ_DEC is not set
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_INTERVAL_TREE=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_ARCH_NO_SG_CHAIN=y
CONFIG_ARCH_STACKWALK=y
CONFIG_SBITMAP=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# end of Library routines

CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED=y
CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
# CONFIG_PRINTK_TIME is not set
# CONFIG_PRINTK_CALLER is not set
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_LEB128=y
CONFIG_DEBUG_INFO_NONE=y
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
CONFIG_FRAME_POINTER=y
# CONFIG_VMLINUX_MAP is not set
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_DEBUG_SLAB=y
# CONFIG_PAGE_OWNER is not set
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_RODATA_TEST is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
CONFIG_DEBUG_VM_RB=y
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_DEBUG_STACKOVERFLOW=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set
# CONFIG_DEBUG_PREEMPT is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
CONFIG_DEBUG_MUTEXES=y
# CONFIG_DEBUG_RWSEMS is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=m
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_TRACE=y
CONFIG_RCU_EQS_DEBUG=y
# CONFIG_RCU_STRICT_GRACE_PERIOD is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_LATENCYTOP=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_TRACE_CLOCK=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# parisc Debugging
#
# end of parisc Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
CONFIG_FAIL_PAGE_ALLOC=y
# CONFIG_FAULT_INJECTION_USERCOPY is not set
# CONFIG_FAIL_MAKE_REQUEST is not set
CONFIG_FAIL_IO_TIMEOUT=y
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_MMC_REQUEST is not set
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=m
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_DIV64 is not set
CONFIG_BACKTRACE_SELF_TEST=y
# CONFIG_TEST_REF_TRACKER is not set
CONFIG_RBTREE_TEST=y
# CONFIG_REED_SOLOMON_TEST is not set
CONFIG_INTERVAL_TREE_TEST=m
CONFIG_PERCPU_TEST=m
CONFIG_ATOMIC64_SELFTEST=y
CONFIG_TEST_HEXDUMP=y
# CONFIG_STRING_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
CONFIG_TEST_KSTRTOX=y
CONFIG_TEST_PRINTF=m
# CONFIG_TEST_SCANF is not set
CONFIG_TEST_BITMAP=y
CONFIG_TEST_UUID=y
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_MAPLE_TREE is not set
CONFIG_TEST_RHASHTABLE=y
# CONFIG_TEST_SIPHASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_LKM=m
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
CONFIG_TEST_USER_COPY=m
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=y
CONFIG_TEST_UDELAY=m
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_FREE_PAGES is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Kernel hacking

--sMuQpekBrWtMKT37--

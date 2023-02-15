Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E885CC5D8
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Feb 2023 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676487484; x=1708023484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVn9g/kPSbe0WzrpoxjrnLl2xgy52WNdFrPKkJ9n4oE=;
  b=Ig/Md879g1sJRTv9bErqUjjnVV4tJz6dLMtMppbRISBWvI78Wq1sN8ia
   jJMopw4OVyMTagtuh3ls05aNHby5agByKGrIO6uF1qbnyeHjCKCShwv+G
   d1coPcfJCTzSmOZSClbD5ZEWpDwoIC6YVBeMQQtTFTTHVROXkYX4Cup1t
   RKwFkYmA0Rf2ATROgjvagTIBN4UsfYzu3qghGlwx5nFJg0xua/EYeGP9+
   4zzw2vvGlyMM+Z/25JgsdOg/IeY+k4Ejb8WQiEnL1UIDDghNQe1YpVvt/
   xlPdVSKdOJH+cpUygRy9peZSMDfyVMtG4a+l7fklN0tyI0TqVltFHbWis
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="315181416"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="315181416"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 10:58:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="738478357"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="738478357"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Feb 2023 10:58:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSMyd-0009gf-39;
	Wed, 15 Feb 2023 18:57:59 +0000
Date: Thu, 16 Feb 2023 02:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC 2/3] io_uring: enable io_uring to submit sqes located in
 kernel
Message-ID: <202302160254.XFXTSlCj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230215004122.28917-3-xiaoguang.wang@linux.alibaba.com>
References: <20230215004122.28917-3-xiaoguang.wang@linux.alibaba.com>
TO: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>

Hi Xiaoguang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf/master]
[also build test WARNING on axboe-block/for-next linus/master v6.2-rc8]
[cannot apply to bpf-next/master next-20230215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230215004122.28917-3-xiaoguang.wang%40linux.alibaba.com
patch subject: [RFC 2/3] io_uring: enable io_uring to submit sqes located in kernel
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: sh-randconfig-s053-20230212 (https://download.01.org/0day-ci/archive/20230216/202302160254.XFXTSlCj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/0d433a1cf7f666e5596514da7fab92f2691463ad
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xiaoguang-Wang/bpf-add-UBLK-program-type/20230215-084242
        git checkout 0d433a1cf7f666e5596514da7fab92f2691463ad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302160254.XFXTSlCj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/xattr.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/xattr.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/io_uring.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/io_uring.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/nop.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/nop.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/fs.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/fs.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/splice.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/splice.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/advise.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/advise.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/sync.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/sync.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/openclose.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/openclose.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/uring_cmd.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/uring_cmd.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/statx.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/statx.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/epoll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/epoll.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/msg_ring.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/msg_ring.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/net.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/net.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/timeout.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/timeout.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/sqpoll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/sqpoll.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/fdinfo.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/fdinfo.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/tctx.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/tctx.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/poll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/poll.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/kbuf.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/kbuf.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/cancel.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/cancel.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/opdef.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/opdef.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/notif.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/notif.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   io_uring/io-wq.c: note: in included file:
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/io-wq.c: note: in included file (through io_uring/io-wq.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
--
   kernel/sched/core.c: note: in included file (through kernel/sched/../../io_uring/io-wq.h):
>> include/linux/io_uring_types.h:472:35: sparse: sparse: bad constant expression
   kernel/sched/core.c:7024:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7024:17: sparse:    struct task_struct *
   kernel/sched/core.c:7024:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7240:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7240:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7240:22: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2226:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2226:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2226:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2226:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2226:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2226:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2226:9: sparse:    struct task_struct *

vim +472 include/linux/io_uring_types.h

e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  406  
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  407  enum {
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  408  	/* ctx owns file */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  409  	REQ_F_FIXED_FILE	= BIT(REQ_F_FIXED_FILE_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  410  	/* drain existing IO first */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  411  	REQ_F_IO_DRAIN		= BIT(REQ_F_IO_DRAIN_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  412  	/* linked sqes */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  413  	REQ_F_LINK		= BIT(REQ_F_LINK_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  414  	/* doesn't sever on completion < 0 */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  415  	REQ_F_HARDLINK		= BIT(REQ_F_HARDLINK_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  416  	/* IOSQE_ASYNC */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  417  	REQ_F_FORCE_ASYNC	= BIT(REQ_F_FORCE_ASYNC_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  418  	/* IOSQE_BUFFER_SELECT */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  419  	REQ_F_BUFFER_SELECT	= BIT(REQ_F_BUFFER_SELECT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  420  	/* IOSQE_CQE_SKIP_SUCCESS */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  421  	REQ_F_CQE_SKIP		= BIT(REQ_F_CQE_SKIP_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  422  
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  423  	/* fail rest of links */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  424  	REQ_F_FAIL		= BIT(REQ_F_FAIL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  425  	/* on inflight list, should be cancelled and waited on exit reliably */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  426  	REQ_F_INFLIGHT		= BIT(REQ_F_INFLIGHT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  427  	/* read/write uses file position */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  428  	REQ_F_CUR_POS		= BIT(REQ_F_CUR_POS_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  429  	/* must not punt to workers */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  430  	REQ_F_NOWAIT		= BIT(REQ_F_NOWAIT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  431  	/* has or had linked timeout */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  432  	REQ_F_LINK_TIMEOUT	= BIT(REQ_F_LINK_TIMEOUT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  433  	/* needs cleanup */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  434  	REQ_F_NEED_CLEANUP	= BIT(REQ_F_NEED_CLEANUP_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  435  	/* already went through poll handler */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  436  	REQ_F_POLLED		= BIT(REQ_F_POLLED_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  437  	/* buffer already selected */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  438  	REQ_F_BUFFER_SELECTED	= BIT(REQ_F_BUFFER_SELECTED_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  439  	/* buffer selected from ring, needs commit */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  440  	REQ_F_BUFFER_RING	= BIT(REQ_F_BUFFER_RING_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  441  	/* caller should reissue async */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  442  	REQ_F_REISSUE		= BIT(REQ_F_REISSUE_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  443  	/* supports async reads/writes */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  444  	REQ_F_SUPPORT_NOWAIT	= BIT(REQ_F_SUPPORT_NOWAIT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  445  	/* regular file */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  446  	REQ_F_ISREG		= BIT(REQ_F_ISREG_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  447  	/* has creds assigned */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  448  	REQ_F_CREDS		= BIT(REQ_F_CREDS_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  449  	/* skip refcounting if not set */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  450  	REQ_F_REFCOUNT		= BIT(REQ_F_REFCOUNT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  451  	/* there is a linked timeout that has to be armed */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  452  	REQ_F_ARM_LTIMEOUT	= BIT(REQ_F_ARM_LTIMEOUT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  453  	/* ->async_data allocated */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  454  	REQ_F_ASYNC_DATA	= BIT(REQ_F_ASYNC_DATA_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  455  	/* don't post CQEs while failing linked requests */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  456  	REQ_F_SKIP_LINK_CQES	= BIT(REQ_F_SKIP_LINK_CQES_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  457  	/* single poll may be active */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  458  	REQ_F_SINGLE_POLL	= BIT(REQ_F_SINGLE_POLL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  459  	/* double poll may active */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  460  	REQ_F_DOUBLE_POLL	= BIT(REQ_F_DOUBLE_POLL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  461  	/* request has already done partial IO */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  462  	REQ_F_PARTIAL_IO	= BIT(REQ_F_PARTIAL_IO_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  463  	/* fast poll multishot mode */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  464  	REQ_F_APOLL_MULTISHOT	= BIT(REQ_F_APOLL_MULTISHOT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  465  	/* ->extra1 and ->extra2 are initialised */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  466  	REQ_F_CQE32_INIT	= BIT(REQ_F_CQE32_INIT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  467  	/* recvmsg special flag, clear EPOLLIN */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  468  	REQ_F_CLEAR_POLLIN	= BIT(REQ_F_CLEAR_POLLIN_BIT),
9ca9fb24d5febc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  469  	/* hashed into ->cancel_hash_locked, protected by ->uring_lock */
9ca9fb24d5febc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  470  	REQ_F_HASH_LOCKED	= BIT(REQ_F_HASH_LOCKED_BIT),
0d433a1cf7f666 include/linux/io_uring_types.h Xiaoguang Wang 2023-02-15  471  	/* buffer comes from kernel */
0d433a1cf7f666 include/linux/io_uring_types.h Xiaoguang Wang 2023-02-15 @472  	REQ_F_KBUF		= BIT(REQ_F_KBUF_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  473  };
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  474  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

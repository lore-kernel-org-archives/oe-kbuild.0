Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047AE8473
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Mar 2023 18:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680028699; x=1711564699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jtZjyebrpMJYFPJkLKVs/IYaQF/ibcwOmNxQx9E6qjY=;
  b=ZsfJQBY0AdeKXcw+twNWHJF2DBcnVYlK1z5WQ/Z5m4TDiIpl2V+DATvz
   rEowlRu8txzNF8F0a+tx3at8ajaK/5W9mOTh2f4M6sJMkXw/OuVJtoKN2
   4dN3+1dmqSOmrKMoyq/0Eiy2B1wrNTm3bX69KFILoXolp0oLKrSTY9zKu
   xdC4vOjRs+mO/AucR5RSVr90kQF1EJHxg0xrHWgOpaxPf86EXkHGCbccf
   fBL4raY9OEWPpIqkiNUzTxOp0piG5ughsinLqP0owe/OCfIWiAeezUdEk
   cTpElHmLy1eJScKemJAqzr1IzRPvoeuRS1ic7kOF0C4UWuqBFt2kHi2AE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320311031"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="320311031"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 11:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="827583745"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="827583745"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2023 11:38:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phED2-000Ip1-2S;
	Tue, 28 Mar 2023 18:38:16 +0000
Date: Wed, 29 Mar 2023 02:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V5 02/16] io_uring: add IORING_OP_FUSED_CMD
Message-ID: <202303290247.PxFp8v7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/io_uring.h:112:53: sparse: sparse: no identifier for function argument"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230328150958.1253547-3-ming.lei@redhat.com>
References: <20230328150958.1253547-3-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: io-uring@vger.kernel.org
TO: linux-block@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: ZiyangZhang <ZiyangZhang@linux.alibaba.com>
CC: Xiaoguang Wang <xiaoguang.wang@linux.alibaba.com>
CC: Bernd Schubert <bschubert@ddn.com>
CC: Pavel Begunkov <asml.silence@gmail.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Ming Lei <ming.lei@redhat.com>

Hi Ming,

I love your patch! Perhaps something to improve:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.3-rc4 next-20230328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/io_uring-increase-io_kiocb-flags-into-64bit/20230328-232554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230328150958.1253547-3-ming.lei%40redhat.com
patch subject: [PATCH V5 02/16] io_uring: add IORING_OP_FUSED_CMD
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230329/202303290247.PxFp8v7w-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/1cdd7d77287ea8d97834b37825e63a727e860f6c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ming-Lei/io_uring-increase-io_kiocb-flags-into-64bit/20230328-232554
        git checkout 1cdd7d77287ea8d97834b37825e63a727e860f6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash net/unix/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303290247.PxFp8v7w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/unix/scm.c: note: in included file:
>> include/linux/io_uring.h:112:53: sparse: sparse: no identifier for function argument
   include/linux/io_uring.h:113:39: sparse: sparse: no identifier for function argument
   include/linux/io_uring.h:114:17: sparse: sparse: no identifier for function argument

vim +112 include/linux/io_uring.h

0f2122045b9462 Jens Axboe         2020-09-13   93  
f552a27afe67f0 Hao Xu             2021-08-12   94  static inline void io_uring_files_cancel(void)
0f2122045b9462 Jens Axboe         2020-09-13   95  {
e7a6c00dc77aed Jens Axboe         2022-03-04   96  	if (current->io_uring) {
e7a6c00dc77aed Jens Axboe         2022-03-04   97  		io_uring_unreg_ringfd();
f552a27afe67f0 Hao Xu             2021-08-12   98  		__io_uring_cancel(false);
0f2122045b9462 Jens Axboe         2020-09-13   99  	}
e7a6c00dc77aed Jens Axboe         2022-03-04  100  }
3f48cf18f886c9 Pavel Begunkov     2021-04-11  101  static inline void io_uring_task_cancel(void)
0f2122045b9462 Jens Axboe         2020-09-13  102  {
a4aadd11ea4932 Hao Xu             2021-08-12  103  	if (current->io_uring)
f552a27afe67f0 Hao Xu             2021-08-12  104  		__io_uring_cancel(true);
0f2122045b9462 Jens Axboe         2020-09-13  105  }
0f2122045b9462 Jens Axboe         2020-09-13  106  static inline void io_uring_free(struct task_struct *tsk)
0f2122045b9462 Jens Axboe         2020-09-13  107  {
0f2122045b9462 Jens Axboe         2020-09-13  108  	if (tsk->io_uring)
0f2122045b9462 Jens Axboe         2020-09-13  109  		__io_uring_free(tsk);
0f2122045b9462 Jens Axboe         2020-09-13  110  }
0f2122045b9462 Jens Axboe         2020-09-13  111  #else
1cdd7d77287ea8 Ming Lei           2023-03-28 @112  static inline void io_fused_cmd_start_secondary_req(struct io_uring_cmd *,
1cdd7d77287ea8 Ming Lei           2023-03-28  113  		unsigned issue_flags, const struct io_uring_bvec_buf *,
1cdd7d77287ea8 Ming Lei           2023-03-28  114  		unsigned int,
1cdd7d77287ea8 Ming Lei           2023-03-28  115  		void (*complete_tw_cb)(struct io_uring_cmd *, unsigned))
1cdd7d77287ea8 Ming Lei           2023-03-28  116  {
1cdd7d77287ea8 Ming Lei           2023-03-28  117  }
0e0abad2a71bcd Geert Uytterhoeven 2022-10-04  118  static inline int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
a9216fac3ed881 Anuj Gupta         2022-09-30  119  			      struct iov_iter *iter, void *ioucmd)
a9216fac3ed881 Anuj Gupta         2022-09-30  120  {
a9216fac3ed881 Anuj Gupta         2022-09-30  121  	return -EOPNOTSUPP;
a9216fac3ed881 Anuj Gupta         2022-09-30  122  }
ee692a21e9bf83 Jens Axboe         2022-05-11  123  static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, ssize_t ret,
9d2789ac9d60c0 Jens Axboe         2023-03-20  124  		ssize_t ret2, unsigned issue_flags)
ee692a21e9bf83 Jens Axboe         2022-05-11  125  {
ee692a21e9bf83 Jens Axboe         2022-05-11  126  }
ee692a21e9bf83 Jens Axboe         2022-05-11  127  static inline void io_uring_cmd_complete_in_task(struct io_uring_cmd *ioucmd,
9d2789ac9d60c0 Jens Axboe         2023-03-20  128  			void (*task_work_cb)(struct io_uring_cmd *, unsigned))
ee692a21e9bf83 Jens Axboe         2022-05-11  129  {
ee692a21e9bf83 Jens Axboe         2022-05-11  130  }
a3ec60054082ca Jens Axboe         2020-09-18  131  static inline struct sock *io_uring_get_socket(struct file *file)
a3ec60054082ca Jens Axboe         2020-09-18  132  {
a3ec60054082ca Jens Axboe         2020-09-18  133  	return NULL;
a3ec60054082ca Jens Axboe         2020-09-18  134  }
0f2122045b9462 Jens Axboe         2020-09-13  135  static inline void io_uring_task_cancel(void)
0f2122045b9462 Jens Axboe         2020-09-13  136  {
0f2122045b9462 Jens Axboe         2020-09-13  137  }
f552a27afe67f0 Hao Xu             2021-08-12  138  static inline void io_uring_files_cancel(void)
0f2122045b9462 Jens Axboe         2020-09-13  139  {
0f2122045b9462 Jens Axboe         2020-09-13  140  }
0f2122045b9462 Jens Axboe         2020-09-13  141  static inline void io_uring_free(struct task_struct *tsk)
0f2122045b9462 Jens Axboe         2020-09-13  142  {
0f2122045b9462 Jens Axboe         2020-09-13  143  }
33337d03f04f9e Dylan Yudaken      2022-04-26  144  static inline const char *io_uring_get_opcode(u8 opcode)
33337d03f04f9e Dylan Yudaken      2022-04-26  145  {
33337d03f04f9e Dylan Yudaken      2022-04-26  146  	return "";
33337d03f04f9e Dylan Yudaken      2022-04-26  147  }
0f2122045b9462 Jens Axboe         2020-09-13  148  #endif
0f2122045b9462 Jens Axboe         2020-09-13  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

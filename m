Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313072F39
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 18:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675018223; x=1706554223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=64ycVebN5JCNuLowBlIUIP7xCU3fRcB4oLfIj4c3QLU=;
  b=WfgxorPTO/Pa7ptC49JBwHNGmoueGj6eYwLvXIN4GFVNT+swAMLFr0Xk
   jagtwmMkxmyNrO+/nKivwhqSieH03xtlhlnKXCYM1z/jybv0EBGxZuY3B
   e+u5mIr8lz1SLC+dwzp0PfXPSXnBfqiJ+LWJHF4OvX7dDob7aENBApr9o
   UBPO67zpVhcjGvZh3+yzn2HOYc4gWInCVcPeNTXInRZRnYyMqer/BUmF+
   5UmE6q3HZEB5tqg+r3WvHWAKT6fS3cVPjZKP7175uS90U53UI7KhpB4/h
   qG+V1725DR3HUxNejStaRIUXrBjQW2YVVfU4wDp+UrzWKnPCHW8EjnfnF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="413644358"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="413644358"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 10:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="665840784"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="665840784"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jan 2023 10:50:21 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMCku-000322-0x;
	Sun, 29 Jan 2023 18:50:20 +0000
Date: Mon, 30 Jan 2023 02:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] f2fs: reduce stack memory cost by using bitfield in
 struct f2fs_io_info
Message-ID: <202301300256.4XdrZjzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230129083045.7754-1-chao@kernel.org>
References: <20230129083045.7754-1-chao@kernel.org>
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

Hi Chao,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.2-rc5 next-20230127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Yu/f2fs-reduce-stack-memory-cost-by-using-bitfield-in-struct-f2fs_io_info/20230129-220837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230129083045.7754-1-chao%40kernel.org
patch subject: [PATCH] f2fs: reduce stack memory cost by using bitfield in struct f2fs_io_info
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: csky-randconfig-s051-20230129 (https://download.01.org/0day-ci/archive/20230130/202301300256.4XdrZjzc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/de0eb98b767c053132c5ffc724041551d315f69a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chao-Yu/f2fs-reduce-stack-memory-cost-by-using-bitfield-in-struct-f2fs_io_info/20230129-220837
        git checkout de0eb98b767c053132c5ffc724041551d315f69a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/dir.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/inode.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/namei.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/file.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/hash.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/inline.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/checkpoint.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/gc.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/shrinker.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/sysfs.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/acl.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/recovery.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/debug.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/extent_cache.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/xattr.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/node.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/super.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/compress.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/data.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield
--
   fs/f2fs/segment.c: note: in included file:
>> fs/f2fs/f2fs.h:1217:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1218:22: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1219:21: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1220:20: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1221:24: sparse: sparse: dubious one-bit signed bitfield
   fs/f2fs/f2fs.h:1222:24: sparse: sparse: dubious one-bit signed bitfield

vim +1217 fs/f2fs/f2fs.h

b0af6d491a6b5f Chao Yu         2017-08-02  1200  
458e6197c37de5 Jaegeuk Kim     2013-12-11  1201  struct f2fs_io_info {
05ca3632e5a73b Jaegeuk Kim     2015-04-23  1202  	struct f2fs_sb_info *sbi;	/* f2fs_sb_info pointer */
39d787bec4f792 Chao Yu         2017-09-29  1203  	nid_t ino;		/* inode number */
458e6197c37de5 Jaegeuk Kim     2013-12-11  1204  	enum page_type type;	/* contains DATA/NODE/META/META_FLUSH */
a912b54d3aaa01 Jaegeuk Kim     2017-05-10  1205  	enum temp_type temp;	/* contains HOT/WARM/COLD */
7649c873c16a38 Bart Van Assche 2022-07-14  1206  	enum req_op op;		/* contains REQ_OP_ */
7649c873c16a38 Bart Van Assche 2022-07-14  1207  	blk_opf_t op_flags;	/* req_flag_bits */
7a9d75481b85d5 Chao Yu         2016-02-22  1208  	block_t new_blkaddr;	/* new block address to be written */
28bc106b2346a7 Chao Yu         2016-02-06  1209  	block_t old_blkaddr;	/* old block address before Cow */
05ca3632e5a73b Jaegeuk Kim     2015-04-23  1210  	struct page *page;	/* page to be written */
4375a33664de17 Jaegeuk Kim     2015-04-23  1211  	struct page *encrypted_page;	/* encrypted page */
4c8ff7095bef64 Chao Yu         2019-11-01  1212  	struct page *compressed_page;	/* compressed page */
fb830fc5cfc90b Chao Yu         2017-05-19  1213  	struct list_head list;		/* serialize IOs */
4c8ff7095bef64 Chao Yu         2019-11-01  1214  	int compr_blocks;	/* # of compressed block addresses */
de0eb98b767c05 Chao Yu         2023-01-29  1215  	int need_lock:8;	/* indicate we need to lock cp_rwsem */
de0eb98b767c05 Chao Yu         2023-01-29  1216  	int version:8;		/* version of the node */
de0eb98b767c05 Chao Yu         2023-01-29 @1217  	int submitted:1;	/* indicate IO submission */
de0eb98b767c05 Chao Yu         2023-01-29  1218  	int in_list:1;		/* indicate fio is in io_list */
de0eb98b767c05 Chao Yu         2023-01-29  1219  	int is_por:1;		/* indicate IO is from recovery or not */
de0eb98b767c05 Chao Yu         2023-01-29  1220  	int retry:1;		/* need to reallocate block address */
de0eb98b767c05 Chao Yu         2023-01-29  1221  	int encrypted:1;	/* indicate file is encrypted */
de0eb98b767c05 Chao Yu         2023-01-29  1222  	int post_read:1;	/* require post read */
b0af6d491a6b5f Chao Yu         2017-08-02  1223  	enum iostat_type io_type;	/* io type */
578c647879f74c Yufen Yu        2018-01-09  1224  	struct writeback_control *io_wbc; /* writeback control */
8648de2c581eed Chao Yu         2019-02-19  1225  	struct bio **bio;		/* bio for ipu */
8648de2c581eed Chao Yu         2019-02-19  1226  	sector_t *last_block;		/* last block number in bio */
458e6197c37de5 Jaegeuk Kim     2013-12-11  1227  };
458e6197c37de5 Jaegeuk Kim     2013-12-11  1228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

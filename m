Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9AA7F
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Jan 2023 02:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672797997; x=1704333997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=57rGsHiu9K68VJWmQLWNSHLZhcFvuTA6TS8fZKrc0mE=;
  b=lqQaxThbg137Y/GC3oTy+A2fq5iE1I8jQOchU/2E3PbtvVDhgpf1xgAH
   HxQOCWLQHkiNVr4dGUcWBaXQQfofTGZDQNnJX3+kfuoLZCd09Srs1r0Wr
   TPS6mNQCaZa1UomIkczeceTRrS0bRIodXeaj/Bxs4no4bBROr+wp57iK1
   20cUbUViRSrjo+GF/cweNPYPB/AZlTMnQU8ZIjr6mmIInG5hf5sLlWXvM
   CZbsBQ6Zi8XXxHJimrdlsUkL8+wpbBQMzgAyHMihVTavV8i68GhyMYl4x
   UTH7Fez96YZlGMjhJPInHOY+crLZxGtOeC5PCMCnNNUHG+ExBtJQAi0CD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="309577993"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="309577993"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 18:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="743685163"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; 
   d="scan'208";a="743685163"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Jan 2023 18:06:35 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pCtAo-000T1t-1J;
	Wed, 04 Jan 2023 02:06:34 +0000
Date: Wed, 4 Jan 2023 10:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/defrag.c:46:6: warning: Using argument defrag1 that points
 at uninitialized variable tmp [ctuuninitvar]
Message-ID: <202301041004.bbGTiX1N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/btrfs/defrag.c:46:6: warning: Using argument defrag1 that points at uninitialized variable tmp [ctuuninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69b41ac87e4a664de78a395ff97166f0b2943210
commit: 6e3df18ba7e8e68015dd66bcab326a4b7aaed085 btrfs: move the auto defrag code to defrag.c
date:   4 weeks ago
:::::: branch date: 31 hours ago
:::::: commit date: 4 weeks ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 6e3df18ba7e8e68015dd66bcab326a4b7aaed085
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
   In file included from fs/btrfs/defrag.c:
   fs/btrfs/inode.c:1070:13: warning: Local variable 'start' shadows outer variable [shadowVariable]
     const u64 start = async_extent->start;
               ^
   fs/btrfs/inode.c:992:6: note: Shadowed declaration
    u64 start = async_extent->start;
        ^
   fs/btrfs/inode.c:1070:13: note: Shadow variable
     const u64 start = async_extent->start;
               ^
   fs/btrfs/inode.c:1071:13: warning: Local variable 'end' shadows outer variable [shadowVariable]
     const u64 end = start + async_extent->ram_size - 1;
               ^
   fs/btrfs/inode.c:993:6: note: Shadowed declaration
    u64 end = async_extent->start + async_extent->ram_size - 1;
        ^
   fs/btrfs/inode.c:1071:13: note: Shadow variable
     const u64 end = start + async_extent->ram_size - 1;
               ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/btrfs/defrag.c:
>> fs/btrfs/defrag.c:46:6: warning: Using argument defrag1 that points at uninitialized variable tmp [ctuuninitvar]
    if (defrag1->root > defrag2->root)
        ^
   fs/btrfs/defrag.c:196:38: note: Calling function __compare_inode_defrag, 1st argument is uninitialized
    if (parent && __compare_inode_defrag(&tmp, entry) > 0) {
                                        ^
   fs/btrfs/defrag.c:46:6: note: Using argument defrag1
    if (defrag1->root > defrag2->root)
        ^
--
   fs/btrfs/inode.c:6174:70: warning: Parameter 'now' can be declared as pointer to const [constParameter]
   static int btrfs_update_time(struct inode *inode, struct timespec64 *now,
                                                                        ^
   fs/btrfs/tree-log.h:64:28: warning: Uninitialized variables: ordered.file_offset, ordered.num_bytes, ordered.ram_bytes, ordered.disk_bytenr, ordered.disk_num_bytes, ordered.offset, ordered.bytes_left, ordered.outstanding_isize, ordered.truncated_len, ordered.flags, ordered.compress_type, ordered.qgroup_rsv, ordered.refs, ordered.inode, ordered.list, ordered.wait, ordered.rb_node, ordered.root_extent_list, ordered.work, ordered.completion, ordered.flush_work, ordered.work_list, ordered.physical, ordered.bdev [uninitvar]
     btrfs_put_ordered_extent(ordered);
                              ^
>> fs/btrfs/inode.c:240:32: warning: Uninitialized variable: page_start [uninitvar]
     if (locked_page && index == (page_start >> PAGE_SHIFT)) {
                                  ^
   fs/btrfs/inode.c:223:6: note: Assuming condition is false
    if (locked_page) {
        ^
   fs/btrfs/inode.c:240:32: note: Uninitialized variable: page_start
     if (locked_page && index == (page_start >> PAGE_SHIFT)) {
                                  ^
   fs/btrfs/inode.c:2809:16: warning: Uninitialized variable: sum->bytenr [uninitvar]
             sum->bytenr);
                  ^

vim +46 fs/btrfs/defrag.c

6e3df18ba7e8e6 Josef Bacik 2022-10-26  42  
6e3df18ba7e8e6 Josef Bacik 2022-10-26  43  static int __compare_inode_defrag(struct inode_defrag *defrag1,
6e3df18ba7e8e6 Josef Bacik 2022-10-26  44  				  struct inode_defrag *defrag2)
6e3df18ba7e8e6 Josef Bacik 2022-10-26  45  {
6e3df18ba7e8e6 Josef Bacik 2022-10-26 @46  	if (defrag1->root > defrag2->root)
6e3df18ba7e8e6 Josef Bacik 2022-10-26  47  		return 1;
6e3df18ba7e8e6 Josef Bacik 2022-10-26  48  	else if (defrag1->root < defrag2->root)
6e3df18ba7e8e6 Josef Bacik 2022-10-26  49  		return -1;
6e3df18ba7e8e6 Josef Bacik 2022-10-26  50  	else if (defrag1->ino > defrag2->ino)
6e3df18ba7e8e6 Josef Bacik 2022-10-26  51  		return 1;
6e3df18ba7e8e6 Josef Bacik 2022-10-26  52  	else if (defrag1->ino < defrag2->ino)
6e3df18ba7e8e6 Josef Bacik 2022-10-26  53  		return -1;
6e3df18ba7e8e6 Josef Bacik 2022-10-26  54  	else
6e3df18ba7e8e6 Josef Bacik 2022-10-26  55  		return 0;
6e3df18ba7e8e6 Josef Bacik 2022-10-26  56  }
6e3df18ba7e8e6 Josef Bacik 2022-10-26  57  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

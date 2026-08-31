Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7123E316C
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Aug 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176055; cv=none; b=PWPhcYTwtAFARW1xLwhI/WpluCn4lAW0Buk1roCNZFBVTbI5+ph3Ks3Z4HhGCKtme5GgYlUgkaGtE44/vc58TA8rq465pCU994bYiOGxWRr5CYkoAkpL6mzCh+oNqvcX4nCWC8wv9kXnEJ0wwYBJAL4l2iL1vEVNRLeA/8obrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176055; c=relaxed/simple;
	bh=wb4A6cCDs8XWthOIbzlEDWXdhJFYlIy14Ttnmb8kvjs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kmMk5Q8US6kflRUli3OKtMzg2SlLihtv9BQbrDhXhWF/a6+hD9mw6nmM3xjXaZ4MS1zMXBnHP4UVQ8jViATVVYOGQ+VFiTD3gwUrw3LyHxJwmN00Xr/rEMFG1gl1ptYniDL7mLB2dIipQqzw6LRUUrqdNDQFxYo2Eb+qZn/WpkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gb0tiEBg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gb0tiEBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788176052; x=1819712052;
  h=date:from:to:cc:subject:message-id;
  bh=wb4A6cCDs8XWthOIbzlEDWXdhJFYlIy14Ttnmb8kvjs=;
  b=gb0tiEBgvuDpvJx1dBeUvCf+zEPnvOu5yk/T9HMgDLum/ui5fEaIgLDw
   M6RUcnN0f+8jDUIKbGDrpHV9qQ1naB3PVyAPbXLQ012aHhgE3r5PTsebZ
   hSQrN2E8f1dmBwmHp+znI/nM2nZx7XNxyrsda72MdNaExJPKjFL0cNWFD
   4pKXvOKa2VVgrhcgYSVx1Smg8I3nhFMPwMJZrtX4IUQJBGWY9rDDT8bFI
   8WLvX6Z3kU4BO+ZC3VgzaAsVZR4NUoljxdL9v24lLP4wyFBQ7/9Dmmq/3
   0ZuQtFVRU2cQWsTPOo/UdiO+NbM4tHMN4HPiwu/UI9TXdxfMzba5A71KE
   g==;
X-CSE-ConnectionGUID: qvxHFXbESROiG0wAVif4Fg==
X-CSE-MsgGUID: LwweAvYLSZ+Lxf2amKseOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="87716535"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="87716535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:34:08 -0700
X-CSE-ConnectionGUID: Q5r9IP/STTeLTehfh40bfA==
X-CSE-MsgGUID: Bbc3U/G0QKahOZj9IUW3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="298691127"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2026 04:33:51 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x10Gq-000000000Vj-3JIl;
	Mon, 31 Aug 2026 11:33:48 +0000
Date: Mon, 31 Aug 2026 19:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chao:feature/kelvin_subpage 5/22]
 include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member
 'i_addr' in a union
Message-ID: <202608311908.QPDnGekH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Chao Yu <chao@kernel.org>
TO: Kelvin Zhang <zhangxp1998@gmail.com>
CC: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/kelvin_subpage
head:   c1bd92d1f34a6b496c203d87db044e61059c28ae
commit: 0afae9798e90aeeeebfaaf8878c16c2a5f1dbc9f [5/22] f2fs: describe {i,d,id}node block layout dynamically
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-r132-20260830 (https://download.01.org/0day-ci/archive/20260831/202608311908.QPDnGekH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608311908.QPDnGekH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608311908.QPDnGekH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/dir.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
--
   fs/f2fs/extent_cache.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
--
   fs/f2fs/xattr.c:851:1: sparse: sparse: no newline at end of file
   fs/f2fs/xattr.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
--
   fs/f2fs/recovery.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
--
   fs/f2fs/inode.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
--
   fs/f2fs/namei.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
--
   fs/f2fs/inline.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
--
   fs/f2fs/gc.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
--
   fs/f2fs/data.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
   fs/f2fs/data.c:2557:39: sparse: sparse: Using plain integer as NULL pointer
--
   fs/f2fs/file.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
   fs/f2fs/file.c:4082:36: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const [usertype] *pwcs @@     got restricted __le16 * @@
   fs/f2fs/file.c:4082:36: sparse:     expected unsigned short const [usertype] *pwcs
   fs/f2fs/file.c:4082:36: sparse:     got restricted __le16 *
   fs/f2fs/file.c:4118:28: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 * @@
   fs/f2fs/file.c:4118:28: sparse:     expected unsigned short [usertype] *pwcs
   fs/f2fs/file.c:4118:28: sparse:     got restricted __le16 *
   fs/f2fs/file.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: asm output is not an lvalue
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: cast removes address space '__user' of expression
   arch/csky/include/asm/uaccess.h:110:17: sparse: sparse: generating address of non-lvalue (11)
--
   fs/f2fs/node.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union
--
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long flags @@     got restricted vm_fault_t [usertype] ret @@
   include/trace/events/f2fs.h:1470:1: sparse:     expected unsigned long flags
   include/trace/events/f2fs.h:1470:1: sparse:     got restricted vm_fault_t [usertype] ret
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
   include/trace/events/f2fs.h:1173:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1173:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1173:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1173:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1173:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1173:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1232:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1232:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1232:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1232:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1232:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1232:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1470:1: sparse: sparse: cast to restricted vm_fault_t
   include/trace/events/f2fs.h:1470:1: sparse: sparse: restricted vm_fault_t degrades to integer
   include/trace/events/f2fs.h:1470:1: sparse: sparse: restricted vm_fault_t degrades to integer
   fs/f2fs/super.c: note: in included file:
>> include/linux/f2fs_fs.h:347:24: sparse: sparse: flexible array member 'i_addr' in a union

vim +/i_addr +347 include/linux/f2fs_fs.h

1001b3479ce96e3 Huajun Li    2013-11-10  297  
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  298  struct f2fs_inode {
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  299  	__le16 i_mode;			/* file mode */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  300  	__u8 i_advise;			/* file hints */
444c580f7e9ad29 Jaegeuk Kim  2013-08-08  301  	__u8 i_inline;			/* file inline flags */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  302  	__le32 i_uid;			/* user ID */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  303  	__le32 i_gid;			/* group ID */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  304  	__le32 i_links;			/* links count */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  305  	__le64 i_size;			/* file size in bytes */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  306  	__le64 i_blocks;		/* file size in blocks */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  307  	__le64 i_atime;			/* access time */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  308  	__le64 i_ctime;			/* change time */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  309  	__le64 i_mtime;			/* modification time */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  310  	__le32 i_atime_nsec;		/* access time in nano scale */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  311  	__le32 i_ctime_nsec;		/* change time in nano scale */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  312  	__le32 i_mtime_nsec;		/* modification time in nano scale */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  313  	__le32 i_generation;		/* file version (for NFS) */
1ad71a27124caf0 Jaegeuk Kim  2017-12-07  314  	union {
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  315  		__le32 i_current_depth;	/* only for directory depth */
1ad71a27124caf0 Jaegeuk Kim  2017-12-07  316  		__le16 i_gc_failures;	/*
1ad71a27124caf0 Jaegeuk Kim  2017-12-07  317  					 * # of gc failures on pinned file.
1ad71a27124caf0 Jaegeuk Kim  2017-12-07  318  					 * only for regular files.
1ad71a27124caf0 Jaegeuk Kim  2017-12-07  319  					 */
1ad71a27124caf0 Jaegeuk Kim  2017-12-07  320  	};
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  321  	__le32 i_xattr_nid;		/* nid to save xattr */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  322  	__le32 i_flags;			/* file attributes */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  323  	__le32 i_pino;			/* parent inode number */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  324  	__le32 i_namelen;		/* file name length */
5a20d339c785d98 Jaegeuk Kim  2013-03-03  325  	__u8 i_name[F2FS_NAME_LEN];	/* file name for SPOR */
3843154598a0040 Jaegeuk Kim  2014-02-27  326  	__u8 i_dir_level;		/* dentry_level for large dir */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  327  
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  328  	struct f2fs_extent i_ext;	/* caching a largest extent */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  329  
7a2af766af15887 Chao Yu      2017-07-19  330  	union {
7a2af766af15887 Chao Yu      2017-07-19  331  		struct {
7a2af766af15887 Chao Yu      2017-07-19  332  			__le16 i_extra_isize;	/* extra inode attribute size */
6afc662e68b5f98 Chao Yu      2017-09-06  333  			__le16 i_inline_xattr_size;	/* inline xattr size, unit: 4 bytes */
5c57132eaf52659 Chao Yu      2017-07-26  334  			__le32 i_projid;	/* project id */
704956ecf5bcdc1 Chao Yu      2017-07-31  335  			__le32 i_inode_checksum;/* inode meta checksum */
1c1d35df71104c7 Chao Yu      2018-01-25  336  			__le64 i_crtime;	/* creation time */
1c1d35df71104c7 Chao Yu      2018-01-25  337  			__le32 i_crtime_nsec;	/* creation time in nano scale */
4c8ff7095bef64f Chao Yu      2019-11-01  338  			__le64 i_compr_blocks;	/* # of compressed blocks */
4c8ff7095bef64f Chao Yu      2019-11-01  339  			__u8 i_compress_algorithm;	/* compress algorithm */
4c8ff7095bef64f Chao Yu      2019-11-01  340  			__u8 i_log_cluster_size;	/* log of cluster size */
b28f047b28c51d0 Chao Yu      2020-11-26  341  			__le16 i_compress_flag;		/* compress flag */
3fde13f817e23f0 Chao Yu      2021-01-22  342  						/* 0 bit: chksum flag
c1085957dece02b Yangtao Li   2023-01-12  343  						 * [8,15] bits: compress level
3fde13f817e23f0 Chao Yu      2021-01-22  344  						 */
7a2af766af15887 Chao Yu      2017-07-19  345  			__le32 i_extra_end[0];	/* for attribute size calculation */
1c1d35df71104c7 Chao Yu      2018-01-25  346  		} __packed;
0afae9798e90aee Kelvin Zhang 2026-08-20 @347  		__le32 i_addr[];		/* data block pointers */
7a2af766af15887 Chao Yu      2017-07-19  348  	};
0afae9798e90aee Kelvin Zhang 2026-08-20  349  	/*
0afae9798e90aee Kelvin Zhang 2026-08-20  350  	 * __le32 i_nid[DEF_NIDS_PER_INODE];
0afae9798e90aee Kelvin Zhang 2026-08-20  351  	 *
0afae9798e90aee Kelvin Zhang 2026-08-20  352  	 * It is stored immediately before the node footer at the end of the
0afae9798e90aee Kelvin Zhang 2026-08-20  353  	 * filesystem block. Its offset depends on the filesystem block size, so
0afae9798e90aee Kelvin Zhang 2026-08-20  354  	 * locate it dynamically with F2FS_INODE_NIDS().
0afae9798e90aee Kelvin Zhang 2026-08-20  355  	 */
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  356  } __packed;
dd31866b0d55c9b Jaegeuk Kim  2012-11-02  357  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

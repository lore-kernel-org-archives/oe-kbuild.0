Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F46D1E25E3
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 17:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242092; cv=none; b=TNdRHAESJov/8z4uORaKmHxn7kkTm8OF7X+ErGDrK3D5GTOqidH/DVLy4/SEzERvf9lxkAmMIQ8oGNN9WFZszGyDzuWo1IMSlik+XkUZsbypN/cMrZ3kP0dBrWyrz0ngqjGQz0nHZ9aOp7kVrIuTiGLXLS7mvtW8QZIDw+hM8to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242092; c=relaxed/simple;
	bh=8MPDfBlte/FRBdHg1cvPxlb61Xp2T5tDTsOs4toN0Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4X9HbNgiv0kCQ6YsDnf8DhPzYmQ2ePi3NKN8aWp1PbNWvSTpQ5X0DXwI8eARRt+ZLZ3UmXch+jJLUMmMOveIB+2XcpujJowFAcznvBcKJIaJpt7SxNloubiUVtbSsysaFWqY/QZd+x0UNAbEoYVrXR98Qn6tw8xPgaJaIcA1/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSkT0k6i; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSkT0k6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761242090; x=1792778090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8MPDfBlte/FRBdHg1cvPxlb61Xp2T5tDTsOs4toN0Ew=;
  b=iSkT0k6imDM/2KE7/nnkpjxLVtxS86h69kCovq0hdYNeuc677POgjfsK
   FHBeZpsxzhX9Gd0SN6Wo+Ze+EuDSAwt/YF8aNWH2NL1t7sn0ezn5m4X15
   TSPZdDiI6KuB+Ud85pJgi+WJx/EmibIGcIEIrwm2cQACvlvK/qzVa5zeT
   RTTaUk7FDCOh6BofDTGWlTIS++HymL1ZTt2FXo/NJpIGGv037CgABvDJt
   8g61YSicHlMA3zDSac7xGmWNKk+0dKZGatreNGyX8KAVENQ26mqfxRp2B
   p0GDuiUD0NCyn1MOrYT4Xwt3/2uRVzH9ZvsBG8omaMJABvZp7YJh6OZUQ
   Q==;
X-CSE-ConnectionGUID: S63AMKsYTouzVzLfCmtGdQ==
X-CSE-MsgGUID: ZEswQZ+nRM6CwrMwYd3wIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80856130"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="80856130"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 10:54:50 -0700
X-CSE-ConnectionGUID: 7T3U5dE8SOmw7lJXG1WtDA==
X-CSE-MsgGUID: md9VaixsRce+YkULOdvJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="183398141"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2025 10:54:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBzWP-000DlB-2I;
	Thu, 23 Oct 2025 17:54:45 +0000
Date: Fri, 24 Oct 2025 01:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 3533/3772] fs/jfs/jfs_incore.h:86:13: error: type
 name does not allow function specifier to be specified
Message-ID: <202510240105.5IZwS9F5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   efb26a23ed5f5dc3554886ab398f559dcb1de96b
commit: 778740ee2d00e5c04d0c8ffd9c3beea89b1ec554 [3533/3772] Kbuild: enable -fms-extensions
:::::: branch date: 15 hours ago
:::::: commit date: 21 hours ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251024/202510240105.5IZwS9F5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240105.5IZwS9F5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510240105.5IZwS9F5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/jfs/super.c:12:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from fs/jfs/super.c:25:
>> fs/jfs/jfs_incore.h:86:13: error: type name does not allow function specifier to be specified
      86 |                                         unchar _inline[128];
         |                                                ^
>> fs/jfs/jfs_incore.h:86:20: error: expected member name or ';' after declaration specifiers
      86 |                                         unchar _inline[128];
         |                                         ~~~~~~~~~~~~~~^
   1 warning and 2 errors generated.
--
   In file included from fs/jfs/file.c:11:
>> fs/jfs/jfs_incore.h:86:13: error: type name does not allow function specifier to be specified
      86 |                                         unchar _inline[128];
         |                                                ^
>> fs/jfs/jfs_incore.h:86:20: error: expected member name or ';' after declaration specifiers
      86 |                                         unchar _inline[128];
         |                                         ~~~~~~~~~~~~~~^
   2 errors generated.
--
   In file included from fs/jfs/inode.c:9:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from fs/jfs/inode.c:14:
>> fs/jfs/jfs_incore.h:86:13: error: type name does not allow function specifier to be specified
      86 |                                         unchar _inline[128];
         |                                                ^
>> fs/jfs/jfs_incore.h:86:20: error: expected member name or ';' after declaration specifiers
      86 |                                         unchar _inline[128];
         |                                         ~~~~~~~~~~~~~~^
>> fs/jfs/inode.c:55:35: error: expected identifier
      55 |                         inode->i_link = JFS_IP(inode)->i_inline;
         |                                                        ^
   fs/jfs/jfs_incore.h:104:25: note: expanded from macro 'i_inline'
     104 | #define i_inline u.link._inline
         |                         ^
   1 warning and 3 errors generated.
--
   In file included from fs/jfs/namei.c:12:
>> fs/jfs/jfs_incore.h:86:13: error: type name does not allow function specifier to be specified
      86 |                                         unchar _inline[128];
         |                                                ^
>> fs/jfs/jfs_incore.h:86:20: error: expected member name or ';' after declaration specifiers
      86 |                                         unchar _inline[128];
         |                                         ~~~~~~~~~~~~~~^
   In file included from fs/jfs/namei.c:18:
   In file included from fs/jfs/jfs_metapage.h:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> fs/jfs/namei.c:963:35: error: expected identifier
     963 |                 if (ssize > sizeof (JFS_IP(ip)->i_inline))
         |                                                 ^
   fs/jfs/jfs_incore.h:104:25: note: expanded from macro 'i_inline'
     104 | #define i_inline u.link._inline
         |                         ^
   1 warning and 3 errors generated.
--
   In file included from fs/jfs/jfs_umount.c:18:
>> fs/jfs/jfs_incore.h:86:13: error: type name does not allow function specifier to be specified
      86 |                                         unchar _inline[128];
         |                                                ^
>> fs/jfs/jfs_incore.h:86:20: error: expected member name or ';' after declaration specifiers
      86 |                                         unchar _inline[128];
         |                                         ~~~~~~~~~~~~~~^
   In file included from fs/jfs/jfs_umount.c:23:
   In file included from fs/jfs/jfs_metapage.h:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   1 warning and 2 errors generated.
--
   In file included from fs/jfs/jfs_imap.c:32:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from fs/jfs/jfs_imap.c:37:
>> fs/jfs/jfs_incore.h:86:13: error: type name does not allow function specifier to be specified
      86 |                                         unchar _inline[128];
         |                                                ^
>> fs/jfs/jfs_incore.h:86:20: error: expected member name or ';' after declaration specifiers
      86 |                                         unchar _inline[128];
         |                                         ~~~~~~~~~~~~~~^
>> fs/jfs/jfs_imap.c:779:36: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     779 |                 memcpy(&dp->di_inlineea, jfs_ip->i_inline_ea, INODESLOTSIZE);
         |                                                  ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
>> fs/jfs/jfs_imap.c:779:36: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     779 |                 memcpy(&dp->di_inlineea, jfs_ip->i_inline_ea, INODESLOTSIZE);
         |                                                  ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
>> fs/jfs/jfs_imap.c:779:36: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     779 |                 memcpy(&dp->di_inlineea, jfs_ip->i_inline_ea, INODESLOTSIZE);
         |                                                  ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/jfs_imap.c:3108:19: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
    3108 |                 memcpy(&jfs_ip->i_inline_ea, &dip->di_inlineea, 128);
         |                                 ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/jfs_imap.c:3108:19: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
    3108 |                 memcpy(&jfs_ip->i_inline_ea, &dip->di_inlineea, 128);
         |                                 ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/jfs_imap.c:3108:19: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
    3108 |                 memcpy(&jfs_ip->i_inline_ea, &dip->di_inlineea, 128);
         |                                 ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   1 warning and 8 errors generated.
--
   In file included from fs/jfs/jfs_dtree.c:93:
>> fs/jfs/jfs_incore.h:86:13: error: type name does not allow function specifier to be specified
      86 |                                         unchar _inline[128];
         |                                                ^
>> fs/jfs/jfs_incore.h:86:20: error: expected member name or ';' after declaration specifiers
      86 |                                         unchar _inline[128];
         |                                         ~~~~~~~~~~~~~~^
   In file included from fs/jfs/jfs_dtree.c:96:
   In file included from fs/jfs/jfs_metapage.h:9:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   fs/jfs/jfs_dtree.c:2906:31: warning: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
    2906 |                         if (stbl[i] < 0 || stbl[i] >= DTPAGEMAXSLOT) {
         |                                            ~~~~~~~ ^  ~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:3111:30: warning: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Wtautological-constant-out-of-range-compare]
    3111 |                 if (stbl[0] < 0 || stbl[0] >= DTPAGEMAXSLOT) {
         |                                    ~~~~~~~ ^  ~~~~~~~~~~~~~
   3 warnings and 2 errors generated.
--
   In file included from fs/jfs/xattr.c:13:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from fs/jfs/xattr.c:14:
>> fs/jfs/jfs_incore.h:86:13: error: type name does not allow function specifier to be specified
      86 |                                         unchar _inline[128];
         |                                                ^
>> fs/jfs/jfs_incore.h:86:20: error: expected member name or ';' after declaration specifiers
      86 |                                         unchar _inline[128];
         |                                         ~~~~~~~~~~~~~~^
>> fs/jfs/xattr.c:153:30: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     153 |                 assert(size <= sizeof (ji->i_inline_ea));
         |                                            ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:165:14: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     165 |                 memcpy(ji->i_inline_ea, ealist, size);
         |                            ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:165:14: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     165 |                 memcpy(ji->i_inline_ea, ealist, size);
         |                            ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:165:14: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     165 |                 memcpy(ji->i_inline_ea, ealist, size);
         |                            ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:219:37: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     219 |         if (!ealist || size <= sizeof (ji->i_inline_ea)) {
         |                                            ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:328:38: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     328 |         if ((sizeDXD(&ji->ea) > sizeof (ji->i_inline_ea)))
         |                                             ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:330:47: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     330 |         if (le32_to_cpu(((struct jfs_ea_list *) &ji->i_inline_ea)->size)
         |                                                      ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:334:21: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     334 |         memcpy(ealist, ji->i_inline_ea, ea_size);
         |                            ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:334:21: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     334 |         memcpy(ealist, ji->i_inline_ea, ea_size);
         |                            ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:334:21: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     334 |         memcpy(ealist, ji->i_inline_ea, ea_size);
         |                            ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:450:32: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     450 |                 if ((min_size <= sizeof (ji->i_inline_ea)) &&
         |                                              ^
   fs/jfs/jfs_incore.h:105:28: note: expanded from macro 'i_inline_ea'
     105 | #define i_inline_ea u.link._inline_ea
         |                            ^
   fs/jfs/jfs_incore.h:90:12: note: '_inline_all' declared here
      90 |                                 unchar _inline_all[256];
         |                                        ^
   fs/jfs/xattr.c:453:35: error: no member named '_inline_ea' in 'struct jfs_inode_info::(unnamed at fs/jfs/jfs_incore.h:76:3)'; did you mean '_inline_all'?
     453 |                         ea_buf->max_size = sizeof (ji->i_inline_ea);


vim +86 fs/jfs/jfs_incore.h

^1da177e4c3f41 Linus Torvalds    2005-04-16   23  
^1da177e4c3f41 Linus Torvalds    2005-04-16   24  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16   25   * JFS-private inode information
^1da177e4c3f41 Linus Torvalds    2005-04-16   26   */
^1da177e4c3f41 Linus Torvalds    2005-04-16   27  struct jfs_inode_info {
^1da177e4c3f41 Linus Torvalds    2005-04-16   28  	int	fileset;	/* fileset number (always 16)*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   29  	uint	mode2;		/* jfs-specific mode		*/
c18cdc1a3ec643 Eric W. Biederman 2012-02-10   30  	kuid_t	saved_uid;	/* saved for uid mount option */
c18cdc1a3ec643 Eric W. Biederman 2012-02-10   31  	kgid_t	saved_gid;	/* saved for gid mount option */
^1da177e4c3f41 Linus Torvalds    2005-04-16   32  	pxd_t	ixpxd;		/* inode extent descriptor	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   33  	dxd_t	acl;		/* dxd describing acl	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   34  	dxd_t	ea;		/* dxd describing ea	*/
bd646104ac5a6b Arnd Bergmann     2018-06-19   35  	time64_t otime;		/* time created	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   36  	uint	next_index;	/* next available directory entry index */
^1da177e4c3f41 Linus Torvalds    2005-04-16   37  	int	acltype;	/* Type of ACL	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   38  	short	btorder;	/* access order	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   39  	short	btindex;	/* btpage entry index*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   40  	struct inode *ipimap;	/* inode map			*/
5ba253313d0143 Al Viro           2007-10-14   41  	unsigned long cflag;	/* commit flags		*/
ecc90462b428db Dave Kleikamp     2011-06-20   42  	u64	agstart;	/* agstart of the containing IAG */
^1da177e4c3f41 Linus Torvalds    2005-04-16   43  	u16	bxflag;		/* xflag of pseudo buffer?	*/
d31b53e3cd069e Dave Kleikamp     2011-06-20   44  	unchar	pad;
^1da177e4c3f41 Linus Torvalds    2005-04-16   45  	signed char active_ag;	/* ag currently allocating from	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   46  	lid_t	blid;		/* lid of pseudo buffer?	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   47  	lid_t	atlhead;	/* anonymous tlock list head	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   48  	lid_t	atltail;	/* anonymous tlock list tail	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   49  	spinlock_t ag_lock;	/* protects active_ag		*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   50  	struct list_head anon_inode_list; /* inodes having anonymous txns */
^1da177e4c3f41 Linus Torvalds    2005-04-16   51  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16   52  	 * rdwrlock serializes xtree between reads & writes and synchronizes
^1da177e4c3f41 Linus Torvalds    2005-04-16   53  	 * changes to special inodes.  It's use would be redundant on
1b1dcc1b57a491 Jes Sorensen      2006-01-09   54  	 * directories since the i_mutex taken in the VFS is sufficient.
^1da177e4c3f41 Linus Torvalds    2005-04-16   55  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   56  	struct rw_semaphore rdwrlock;
^1da177e4c3f41 Linus Torvalds    2005-04-16   57  	/*
1de87444f8f910 Ingo Molnar       2006-01-24   58  	 * commit_mutex serializes transaction processing on an inode.
^1da177e4c3f41 Linus Torvalds    2005-04-16   59  	 * It must be taken after beginning a transaction (txBegin), since
^1da177e4c3f41 Linus Torvalds    2005-04-16   60  	 * dirty inodes may be committed while a new transaction on the
^1da177e4c3f41 Linus Torvalds    2005-04-16   61  	 * inode is blocked in txBegin or TxBeginAnon
^1da177e4c3f41 Linus Torvalds    2005-04-16   62  	 */
1de87444f8f910 Ingo Molnar       2006-01-24   63  	struct mutex commit_mutex;
1b1dcc1b57a491 Jes Sorensen      2006-01-09   64  	/* xattr_sem allows us to access the xattrs without taking i_mutex */
^1da177e4c3f41 Linus Torvalds    2005-04-16   65  	struct rw_semaphore xattr_sem;
^1da177e4c3f41 Linus Torvalds    2005-04-16   66  	lid_t	xtlid;		/* lid of xtree lock on directory */
^1da177e4c3f41 Linus Torvalds    2005-04-16   67  	union {
^1da177e4c3f41 Linus Torvalds    2005-04-16   68  		struct {
a779ed754e52d5 Dave Kleikamp     2023-10-05   69  			xtroot_t _xtroot;	/* 288: xtree root */
^1da177e4c3f41 Linus Torvalds    2005-04-16   70  			struct inomap *_imap;	/* 4: inode map header	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16   71  		} file;
^1da177e4c3f41 Linus Torvalds    2005-04-16   72  		struct {
^1da177e4c3f41 Linus Torvalds    2005-04-16   73  			struct dir_table_slot _table[12]; /* 96: dir index */
^1da177e4c3f41 Linus Torvalds    2005-04-16   74  			dtroot_t _dtroot;	/* 288: dtree root */
^1da177e4c3f41 Linus Torvalds    2005-04-16   75  		} dir;
^1da177e4c3f41 Linus Torvalds    2005-04-16   76  		struct {
^1da177e4c3f41 Linus Torvalds    2005-04-16   77  			unchar _unused[16];	/* 16: */
^1da177e4c3f41 Linus Torvalds    2005-04-16   78  			dxd_t _dxd;		/* 16: */
961b33c244e5ba Kees Cook         2018-08-03   79  			/* _inline may overflow into _inline_ea when needed */
^1da177e4c3f41 Linus Torvalds    2005-04-16   80  			/* _inline_ea may overlay the last part of
^1da177e4c3f41 Linus Torvalds    2005-04-16   81  			 * file._xtroot if maxentry = XTROOTINITSLOT
^1da177e4c3f41 Linus Torvalds    2005-04-16   82  			 */
5d299f44d7658f Kees Cook         2021-06-21   83  			union {
5d299f44d7658f Kees Cook         2021-06-21   84  				struct {
5d299f44d7658f Kees Cook         2021-06-21   85  					/* 128: inline symlink */
5d299f44d7658f Kees Cook         2021-06-21  @86  					unchar _inline[128];
5d299f44d7658f Kees Cook         2021-06-21   87  					/* 128: inline extended attr */
5d299f44d7658f Kees Cook         2021-06-21   88  					unchar _inline_ea[128];
5d299f44d7658f Kees Cook         2021-06-21   89  				};
5d299f44d7658f Kees Cook         2021-06-21   90  				unchar _inline_all[256];
5d299f44d7658f Kees Cook         2021-06-21   91  			};
^1da177e4c3f41 Linus Torvalds    2005-04-16   92  		} link;
^1da177e4c3f41 Linus Torvalds    2005-04-16   93  	} u;
507e1fa697097b Jan Kara          2014-10-01   94  #ifdef CONFIG_QUOTA
ccb49011bb2ebf Jan Kara          2024-02-06   95  	struct dquot __rcu *i_dquot[MAXQUOTAS];
507e1fa697097b Jan Kara          2014-10-01   96  #endif
^1da177e4c3f41 Linus Torvalds    2005-04-16   97  	u32 dev;	/* will die when we get wide dev_t */
^1da177e4c3f41 Linus Torvalds    2005-04-16   98  	struct inode	vfs_inode;
^1da177e4c3f41 Linus Torvalds    2005-04-16   99  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  100  #define i_xtroot u.file._xtroot
^1da177e4c3f41 Linus Torvalds    2005-04-16  101  #define i_imap u.file._imap
^1da177e4c3f41 Linus Torvalds    2005-04-16  102  #define i_dirtable u.dir._table
^1da177e4c3f41 Linus Torvalds    2005-04-16  103  #define i_dtroot u.dir._dtroot
^1da177e4c3f41 Linus Torvalds    2005-04-16  104  #define i_inline u.link._inline
^1da177e4c3f41 Linus Torvalds    2005-04-16  105  #define i_inline_ea u.link._inline_ea
5d299f44d7658f Kees Cook         2021-06-21  106  #define i_inline_all u.link._inline_all
^1da177e4c3f41 Linus Torvalds    2005-04-16  107  
82d5b9a7c63054 Dave Kleikamp     2007-01-09  108  #define IREAD_LOCK(ip, subclass) \
82d5b9a7c63054 Dave Kleikamp     2007-01-09  109  	down_read_nested(&JFS_IP(ip)->rdwrlock, subclass)
^1da177e4c3f41 Linus Torvalds    2005-04-16  110  #define IREAD_UNLOCK(ip)	up_read(&JFS_IP(ip)->rdwrlock)
82d5b9a7c63054 Dave Kleikamp     2007-01-09  111  #define IWRITE_LOCK(ip, subclass) \
82d5b9a7c63054 Dave Kleikamp     2007-01-09  112  	down_write_nested(&JFS_IP(ip)->rdwrlock, subclass)
^1da177e4c3f41 Linus Torvalds    2005-04-16  113  #define IWRITE_UNLOCK(ip)	up_write(&JFS_IP(ip)->rdwrlock)
^1da177e4c3f41 Linus Torvalds    2005-04-16  114  
^1da177e4c3f41 Linus Torvalds    2005-04-16  115  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  116   * cflag
^1da177e4c3f41 Linus Torvalds    2005-04-16  117   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  118  enum cflags {
^1da177e4c3f41 Linus Torvalds    2005-04-16  119  	COMMIT_Nolink,		/* inode committed with zero link count */
^1da177e4c3f41 Linus Torvalds    2005-04-16  120  	COMMIT_Inlineea,	/* commit inode inline EA */
^1da177e4c3f41 Linus Torvalds    2005-04-16  121  	COMMIT_Freewmap,	/* free WMAP at iClose() */
^1da177e4c3f41 Linus Torvalds    2005-04-16  122  	COMMIT_Dirty,		/* Inode is really dirty */
^1da177e4c3f41 Linus Torvalds    2005-04-16  123  	COMMIT_Dirtable,	/* commit changes to di_dirtable */
^1da177e4c3f41 Linus Torvalds    2005-04-16  124  	COMMIT_Stale,		/* data extent is no longer valid */
^1da177e4c3f41 Linus Torvalds    2005-04-16  125  	COMMIT_Synclist,	/* metadata pages on group commit synclist */
^1da177e4c3f41 Linus Torvalds    2005-04-16  126  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  127  
82d5b9a7c63054 Dave Kleikamp     2007-01-09  128  /*
82d5b9a7c63054 Dave Kleikamp     2007-01-09  129   * commit_mutex nesting subclasses:
82d5b9a7c63054 Dave Kleikamp     2007-01-09  130   */
82d5b9a7c63054 Dave Kleikamp     2007-01-09  131  enum commit_mutex_class
82d5b9a7c63054 Dave Kleikamp     2007-01-09  132  {
82d5b9a7c63054 Dave Kleikamp     2007-01-09  133  	COMMIT_MUTEX_PARENT,
82d5b9a7c63054 Dave Kleikamp     2007-01-09  134  	COMMIT_MUTEX_CHILD,
82d5b9a7c63054 Dave Kleikamp     2007-01-09  135  	COMMIT_MUTEX_SECOND_PARENT,	/* Renaming */
82d5b9a7c63054 Dave Kleikamp     2007-01-09  136  	COMMIT_MUTEX_VICTIM		/* Inode being unlinked due to rename */
82d5b9a7c63054 Dave Kleikamp     2007-01-09  137  };
82d5b9a7c63054 Dave Kleikamp     2007-01-09  138  
82d5b9a7c63054 Dave Kleikamp     2007-01-09  139  /*
82d5b9a7c63054 Dave Kleikamp     2007-01-09  140   * rdwrlock subclasses:
82d5b9a7c63054 Dave Kleikamp     2007-01-09  141   * The dmap inode may be locked while a normal inode or the imap inode are
82d5b9a7c63054 Dave Kleikamp     2007-01-09  142   * locked.
82d5b9a7c63054 Dave Kleikamp     2007-01-09  143   */
82d5b9a7c63054 Dave Kleikamp     2007-01-09  144  enum rdwrlock_class
82d5b9a7c63054 Dave Kleikamp     2007-01-09  145  {
82d5b9a7c63054 Dave Kleikamp     2007-01-09  146  	RDWRLOCK_NORMAL,
82d5b9a7c63054 Dave Kleikamp     2007-01-09  147  	RDWRLOCK_IMAP,
82d5b9a7c63054 Dave Kleikamp     2007-01-09  148  	RDWRLOCK_DMAP
82d5b9a7c63054 Dave Kleikamp     2007-01-09  149  };
82d5b9a7c63054 Dave Kleikamp     2007-01-09  150  
^1da177e4c3f41 Linus Torvalds    2005-04-16  151  #define set_cflag(flag, ip)	set_bit(flag, &(JFS_IP(ip)->cflag))
^1da177e4c3f41 Linus Torvalds    2005-04-16  152  #define clear_cflag(flag, ip)	clear_bit(flag, &(JFS_IP(ip)->cflag))
^1da177e4c3f41 Linus Torvalds    2005-04-16 @153  #define test_cflag(flag, ip)	test_bit(flag, &(JFS_IP(ip)->cflag))
^1da177e4c3f41 Linus Torvalds    2005-04-16  154  #define test_and_clear_cflag(flag, ip) \
^1da177e4c3f41 Linus Torvalds    2005-04-16  155  	test_and_clear_bit(flag, &(JFS_IP(ip)->cflag))
^1da177e4c3f41 Linus Torvalds    2005-04-16  156  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  157   * JFS-private superblock information.
^1da177e4c3f41 Linus Torvalds    2005-04-16  158   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  159  struct jfs_sb_info {
^1da177e4c3f41 Linus Torvalds    2005-04-16  160  	struct super_block *sb;		/* Point back to vfs super block */
^1da177e4c3f41 Linus Torvalds    2005-04-16  161  	unsigned long	mntflag;	/* aggregate attributes	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  162  	struct inode	*ipbmap;	/* block map inode		*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  163  	struct inode	*ipaimap;	/* aggregate inode map inode	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  164  	struct inode	*ipaimap2;	/* secondary aimap inode	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  165  	struct inode	*ipimap;	/* aggregate inode map inode	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  166  	struct jfs_log	*log;		/* log			*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  167  	struct list_head log_list;	/* volumes associated with a journal */
^1da177e4c3f41 Linus Torvalds    2005-04-16  168  	short		bsize;		/* logical block size	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  169  	short		l2bsize;	/* log2 logical block size	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  170  	short		nbperpage;	/* blocks per page		*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  171  	short		l2nbperpage;	/* log2 blocks per page	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  172  	short		l2niperblk;	/* log2 inodes per page	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  173  	dev_t		logdev;		/* external log device	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  174  	uint		aggregate;	/* volume identifier in log record */
^1da177e4c3f41 Linus Torvalds    2005-04-16  175  	pxd_t		logpxd;		/* pxd describing log	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  176  	pxd_t		fsckpxd;	/* pxd describing fsck wkspc */
^1da177e4c3f41 Linus Torvalds    2005-04-16  177  	pxd_t		ait2;		/* pxd describing AIT copy	*/
2e3bc6125154c6 Andy Shevchenko   2019-01-10  178  	uuid_t		uuid;		/* 128-bit uuid for volume	*/
2e3bc6125154c6 Andy Shevchenko   2019-01-10  179  	uuid_t		loguuid;	/* 128-bit uuid for log	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  180  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  181  	 * commit_state is used for synchronization of the jfs_commit
^1da177e4c3f41 Linus Torvalds    2005-04-16  182  	 * threads.  It is protected by LAZY_LOCK().
^1da177e4c3f41 Linus Torvalds    2005-04-16  183  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  184  	int		commit_state;	/* commit state */
^1da177e4c3f41 Linus Torvalds    2005-04-16  185  	/* Formerly in ipimap */
^1da177e4c3f41 Linus Torvalds    2005-04-16  186  	uint		gengen;		/* inode generation generator*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  187  	uint		inostamp;	/* shows inode belongs to fileset*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  188  
^1da177e4c3f41 Linus Torvalds    2005-04-16  189  	/* Formerly in ipbmap */
^1da177e4c3f41 Linus Torvalds    2005-04-16  190  	struct bmap	*bmap;		/* incore bmap descriptor	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  191  	struct nls_table *nls_tab;	/* current codepage		*/
7fab479bebb96b Dave Kleikamp     2005-05-02  192  	struct inode *direct_inode;	/* metadata inode */
^1da177e4c3f41 Linus Torvalds    2005-04-16  193  	uint		state;		/* mount/recovery state	*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  194  	unsigned long	flag;		/* mount time flags */
^1da177e4c3f41 Linus Torvalds    2005-04-16  195  	uint		p_state;	/* state prior to going no integrity */
c18cdc1a3ec643 Eric W. Biederman 2012-02-10  196  	kuid_t		uid;		/* uid to override on-disk uid */
c18cdc1a3ec643 Eric W. Biederman 2012-02-10  197  	kgid_t		gid;		/* gid to override on-disk gid */
69eb66d7da7dba Dave Kleikamp     2006-03-09  198  	uint		umask;		/* umask to override on-disk umask */
b40c2e665cd552 Tino Reichardt    2012-09-17  199  	uint		minblks_trim;	/* minimum blocks, for online trim */
^1da177e4c3f41 Linus Torvalds    2005-04-16  200  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  201  

:::::: The code at line 86 was first introduced by commit
:::::: 5d299f44d7658f4423e33a0b9915bc8d81687511 jfs: Avoid field-overflowing memcpy()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Dave Kleikamp <dave.kleikamp@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

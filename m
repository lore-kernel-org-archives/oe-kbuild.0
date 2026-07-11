Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8A25B0AB
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 22:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783809099; cv=none; b=M4e4cl4f4A4QIRcITqrSBhDKwimR9tL66tUiIPn0HddTbMrejjmt+mYaKGacGtS8zdo6VIFsmViABy/+D14aBOHZ/+MxN0gu7obmqP5uGuWUrFZE+Z5dB8nuP4JPpl5fjAtMTNnszX0ArsZU0EiZX9MuzySh9MMdgs1dSyRY75M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783809099; c=relaxed/simple;
	bh=DJmOz3CIRIHpgu8s2LgQdFfjpfq3oweHdI+gKOMGsE0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FYZPhUF+z+mi06+kGp72r0+D93W84QZzC0TgbF7G2dGS+WTElQI107xTHqRezDnbWFjyPUP07YppUh9lL93TjkuDxZ73dQpNF1Cx6xz+vBw8VkResQDg109m82DN0iO03/qsQrAGiebS92dpl4kxorgQh9T/khP53AeIkvFkrUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0Q88jsK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0Q88jsK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783809096; x=1815345096;
  h=date:from:to:cc:subject:message-id;
  bh=DJmOz3CIRIHpgu8s2LgQdFfjpfq3oweHdI+gKOMGsE0=;
  b=I0Q88jsKimqIXmw7NmgBbFk4xBbHu09YOnSv1c+fSKaWT0LDb1c0lmL5
   gxWg8HcYGq/5dbUwVQZ+gr4l24uDq9Tf+j9dNhctTNnTvNTvWSTdX3hxv
   uFoKulb+z+fczMmuH06AkRHJtSLgVnut+GMu3f/MU5jB89oXxZgeeYZ3I
   dgm5sDf+9mGgEdCUmVoULdTzaPOEjpstlwzGcZiqE+NdFKyH0ZnXYDcfk
   /QkfPYp/IpynGoNMc3Xwmk8wZdIH0rf76oTNshdsKSXLXkVsHcFVCk0To
   UpIfMBjjv77FfHXKc433xKtqCFVvinXAVubB/pxtA0cUyFvhC5oH/BSZ0
   A==;
X-CSE-ConnectionGUID: 3FzMb1DQTK2mn5iuvumu5Q==
X-CSE-MsgGUID: IhqthrGDT/ywywgEhjWSFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101897496"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101897496"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 15:31:36 -0700
X-CSE-ConnectionGUID: 71XGhpVLTvq3IUXC3Towog==
X-CSE-MsgGUID: 2Fc50KBOQ02Ij2oM4wOjIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279603984"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2026 15:31:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wigEN-00000000KR8-3RFo;
	Sat, 11 Jul 2026 22:31:31 +0000
Date: Sun, 12 Jul 2026 06:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 180/180]
 fs/jfs/jfs_dtree.c:2894 jfs_readdir() warn: impossible condition '(stbl[i] >
 127) => (0-127 > 127)'
Message-ID: <202607120604.PssO3RAp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   1517b793772a02ed13258dd27cd6ac22fe27c5a6
commit: ff9fc48fab0e1ea0d423c23c99b91bba178f0b05 [180/180] jfs: fix array-index-out-of-bounds in jfs_readdir
:::::: branch date: 22 hours ago
:::::: commit date: 1 year, 7 months ago
config: x86_64-randconfig-161-20260708 (https://download.01.org/0day-ci/archive/20260712/202607120604.PssO3RAp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607120604.PssO3RAp-lkp@intel.com/

New smatch warnings:
fs/jfs/jfs_dtree.c:2894 jfs_readdir() warn: impossible condition '(stbl[i] > 127) => (0-127 > 127)'

Old smatch warnings:
fs/jfs/jfs_dtree.c:3098 dtReadFirst() warn: impossible condition '(stbl[0] > 127) => (0-127 > 127)'

vim +2894 fs/jfs/jfs_dtree.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  2690  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2691  /*
^1da177e4c3f415 Linus Torvalds    2005-04-16  2692   *	jfs_readdir()
^1da177e4c3f415 Linus Torvalds    2005-04-16  2693   *
^1da177e4c3f415 Linus Torvalds    2005-04-16  2694   * function: read directory entries sequentially
^1da177e4c3f415 Linus Torvalds    2005-04-16  2695   *	from the specified entry offset
^1da177e4c3f415 Linus Torvalds    2005-04-16  2696   *
^1da177e4c3f415 Linus Torvalds    2005-04-16  2697   * parameter:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2698   *
^1da177e4c3f415 Linus Torvalds    2005-04-16  2699   * return: offset = (pn, index) of start entry
^1da177e4c3f415 Linus Torvalds    2005-04-16  2700   *	of next jfs_readdir()/dtRead()
^1da177e4c3f415 Linus Torvalds    2005-04-16  2701   */
070a0ebf42e15c9 Al Viro           2013-05-17  2702  int jfs_readdir(struct file *file, struct dir_context *ctx)
^1da177e4c3f415 Linus Torvalds    2005-04-16  2703  {
070a0ebf42e15c9 Al Viro           2013-05-17  2704  	struct inode *ip = file_inode(file);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2705  	struct nls_table *codepage = JFS_SBI(ip->i_sb)->nls_tab;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2706  	int rc = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2707  	loff_t dtpos;	/* legacy OS/2 style position */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2708  	struct dtoffset {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2709  		s16 pn;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2710  		s16 index;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2711  		s32 unused;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2712  	} *dtoffset = (struct dtoffset *) &dtpos;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2713  	s64 bn;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2714  	struct metapage *mp;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2715  	dtpage_t *p;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2716  	int index;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2717  	s8 *stbl;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2718  	struct btstack btstack;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2719  	int i, next;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2720  	struct ldtentry *d;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2721  	struct dtslot *t;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2722  	int d_namleft, len, outlen;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2723  	unsigned long dirent_buf;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2724  	char *name_ptr;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2725  	u32 dir_index;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2726  	int do_index = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2727  	uint loop_count = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2728  	struct jfs_dirent *jfs_dirent;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2729  	int jfs_dirents;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2730  	int overflow, fix_page, page_fixed = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2731  	static int unique_pos = 2;	/* If we can't fix broken index */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2732  
070a0ebf42e15c9 Al Viro           2013-05-17  2733  	if (ctx->pos == DIREND)
^1da177e4c3f415 Linus Torvalds    2005-04-16  2734  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2735  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2736  	if (DO_INDEX(ip)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2737  		/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  2738  		 * persistent index is stored in directory entries.
^1da177e4c3f415 Linus Torvalds    2005-04-16  2739  		 * Special cases:	 0 = .
^1da177e4c3f415 Linus Torvalds    2005-04-16  2740  		 *			 1 = ..
^1da177e4c3f415 Linus Torvalds    2005-04-16  2741  		 *			-1 = End of directory
^1da177e4c3f415 Linus Torvalds    2005-04-16  2742  		 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2743  		do_index = 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2744  
070a0ebf42e15c9 Al Viro           2013-05-17  2745  		dir_index = (u32) ctx->pos;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2746  
44512449c0ab368 Dave Kleikamp     2013-08-15  2747  		/*
44512449c0ab368 Dave Kleikamp     2013-08-15  2748  		 * NFSv4 reserves cookies 1 and 2 for . and .. so the value
44512449c0ab368 Dave Kleikamp     2013-08-15  2749  		 * we return to the vfs is one greater than the one we use
44512449c0ab368 Dave Kleikamp     2013-08-15  2750  		 * internally.
44512449c0ab368 Dave Kleikamp     2013-08-15  2751  		 */
44512449c0ab368 Dave Kleikamp     2013-08-15  2752  		if (dir_index)
44512449c0ab368 Dave Kleikamp     2013-08-15  2753  			dir_index--;
44512449c0ab368 Dave Kleikamp     2013-08-15  2754  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2755  		if (dir_index > 1) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2756  			struct dir_table_slot dirtab_slot;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2757  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2758  			if (dtEmpty(ip) ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  2759  			    (dir_index >= JFS_IP(ip)->next_index)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2760  				/* Stale position.  Directory has shrunk */
070a0ebf42e15c9 Al Viro           2013-05-17  2761  				ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2762  				return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2763  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2764  		      repeat:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2765  			rc = read_index(ip, dir_index, &dirtab_slot);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2766  			if (rc) {
070a0ebf42e15c9 Al Viro           2013-05-17  2767  				ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2768  				return rc;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2769  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2770  			if (dirtab_slot.flag == DIR_INDEX_FREE) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2771  				if (loop_count++ > JFS_IP(ip)->next_index) {
6ed71e9819ac341 Joe Perches       2016-03-30  2772  					jfs_err("jfs_readdir detected infinite loop!");
070a0ebf42e15c9 Al Viro           2013-05-17  2773  					ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2774  					return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2775  				}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2776  				dir_index = le32_to_cpu(dirtab_slot.addr2);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2777  				if (dir_index == -1) {
070a0ebf42e15c9 Al Viro           2013-05-17  2778  					ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2779  					return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2780  				}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2781  				goto repeat;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2782  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2783  			bn = addressDTS(&dirtab_slot);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2784  			index = dirtab_slot.slot;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2785  			DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2786  			if (rc) {
070a0ebf42e15c9 Al Viro           2013-05-17  2787  				ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2788  				return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2789  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2790  			if (p->header.flag & BT_INTERNAL) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2791  				jfs_err("jfs_readdir: bad index table");
^1da177e4c3f415 Linus Torvalds    2005-04-16  2792  				DT_PUTPAGE(mp);
44512449c0ab368 Dave Kleikamp     2013-08-15  2793  				ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2794  				return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2795  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2796  		} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2797  			if (dir_index == 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2798  				/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  2799  				 * self "."
^1da177e4c3f415 Linus Torvalds    2005-04-16  2800  				 */
44512449c0ab368 Dave Kleikamp     2013-08-15  2801  				ctx->pos = 1;
070a0ebf42e15c9 Al Viro           2013-05-17  2802  				if (!dir_emit(ctx, ".", 1, ip->i_ino, DT_DIR))
^1da177e4c3f415 Linus Torvalds    2005-04-16  2803  					return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2804  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2805  			/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  2806  			 * parent ".."
^1da177e4c3f415 Linus Torvalds    2005-04-16  2807  			 */
44512449c0ab368 Dave Kleikamp     2013-08-15  2808  			ctx->pos = 2;
070a0ebf42e15c9 Al Viro           2013-05-17  2809  			if (!dir_emit(ctx, "..", 2, PARENT(ip), DT_DIR))
^1da177e4c3f415 Linus Torvalds    2005-04-16  2810  				return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2811  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2812  			/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  2813  			 * Find first entry of left-most leaf
^1da177e4c3f415 Linus Torvalds    2005-04-16  2814  			 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2815  			if (dtEmpty(ip)) {
070a0ebf42e15c9 Al Viro           2013-05-17  2816  				ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2817  				return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2818  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2819  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2820  			if ((rc = dtReadFirst(ip, &btstack)))
^1da177e4c3f415 Linus Torvalds    2005-04-16  2821  				return rc;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2822  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2823  			DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2824  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2825  	} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2826  		/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  2827  		 * Legacy filesystem - OS/2 & Linux JFS < 0.3.6
^1da177e4c3f415 Linus Torvalds    2005-04-16  2828  		 *
44512449c0ab368 Dave Kleikamp     2013-08-15  2829  		 * pn = 0; index = 1:	First entry "."
44512449c0ab368 Dave Kleikamp     2013-08-15  2830  		 * pn = 0; index = 2:	Second entry ".."
^1da177e4c3f415 Linus Torvalds    2005-04-16  2831  		 * pn > 0:		Real entries, pn=1 -> leftmost page
^1da177e4c3f415 Linus Torvalds    2005-04-16  2832  		 * pn = index = -1:	No more entries
^1da177e4c3f415 Linus Torvalds    2005-04-16  2833  		 */
070a0ebf42e15c9 Al Viro           2013-05-17  2834  		dtpos = ctx->pos;
44512449c0ab368 Dave Kleikamp     2013-08-15  2835  		if (dtpos < 2) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2836  			/* build "." entry */
44512449c0ab368 Dave Kleikamp     2013-08-15  2837  			ctx->pos = 1;
070a0ebf42e15c9 Al Viro           2013-05-17  2838  			if (!dir_emit(ctx, ".", 1, ip->i_ino, DT_DIR))
^1da177e4c3f415 Linus Torvalds    2005-04-16  2839  				return 0;
44512449c0ab368 Dave Kleikamp     2013-08-15  2840  			dtoffset->index = 2;
070a0ebf42e15c9 Al Viro           2013-05-17  2841  			ctx->pos = dtpos;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2842  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2843  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2844  		if (dtoffset->pn == 0) {
44512449c0ab368 Dave Kleikamp     2013-08-15  2845  			if (dtoffset->index == 2) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2846  				/* build ".." entry */
070a0ebf42e15c9 Al Viro           2013-05-17  2847  				if (!dir_emit(ctx, "..", 2, PARENT(ip), DT_DIR))
^1da177e4c3f415 Linus Torvalds    2005-04-16  2848  					return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2849  			} else {
6ed71e9819ac341 Joe Perches       2016-03-30  2850  				jfs_err("jfs_readdir called with invalid offset!");
^1da177e4c3f415 Linus Torvalds    2005-04-16  2851  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2852  			dtoffset->pn = 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2853  			dtoffset->index = 0;
070a0ebf42e15c9 Al Viro           2013-05-17  2854  			ctx->pos = dtpos;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2855  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2856  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2857  		if (dtEmpty(ip)) {
070a0ebf42e15c9 Al Viro           2013-05-17  2858  			ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2859  			return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2860  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2861  
070a0ebf42e15c9 Al Viro           2013-05-17  2862  		if ((rc = dtReadNext(ip, &ctx->pos, &btstack))) {
6ed71e9819ac341 Joe Perches       2016-03-30  2863  			jfs_err("jfs_readdir: unexpected rc = %d from dtReadNext",
6ed71e9819ac341 Joe Perches       2016-03-30  2864  				rc);
070a0ebf42e15c9 Al Viro           2013-05-17  2865  			ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2866  			return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2867  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2868  		/* get start leaf page and index */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2869  		DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2870  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2871  		/* offset beyond directory eof ? */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2872  		if (bn < 0) {
070a0ebf42e15c9 Al Viro           2013-05-17  2873  			ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2874  			return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2875  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2876  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2877  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2878  	dirent_buf = __get_free_page(GFP_KERNEL);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2879  	if (dirent_buf == 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2880  		DT_PUTPAGE(mp);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2881  		jfs_warn("jfs_readdir: __get_free_page failed!");
070a0ebf42e15c9 Al Viro           2013-05-17  2882  		ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2883  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2884  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2885  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2886  	while (1) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2887  		jfs_dirent = (struct jfs_dirent *) dirent_buf;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2888  		jfs_dirents = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2889  		overflow = fix_page = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2890  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2891  		stbl = DT_GETSTBL(p);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2892  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2893  		for (i = index; i < p->header.nextindex; i++) {
ff9fc48fab0e1ea Ghanshyam Agrawal 2024-10-01 @2894  			if (stbl[i] < 0 || stbl[i] > 127) {
ff9fc48fab0e1ea Ghanshyam Agrawal 2024-10-01  2895  				jfs_err("JFS: Invalid stbl[%d] = %d for inode %ld, block = %lld",
ff9fc48fab0e1ea Ghanshyam Agrawal 2024-10-01  2896  					i, stbl[i], (long)ip->i_ino, (long long)bn);
ff9fc48fab0e1ea Ghanshyam Agrawal 2024-10-01  2897  				free_page(dirent_buf);
ff9fc48fab0e1ea Ghanshyam Agrawal 2024-10-01  2898  				DT_PUTPAGE(mp);
ff9fc48fab0e1ea Ghanshyam Agrawal 2024-10-01  2899  				return -EIO;
ff9fc48fab0e1ea Ghanshyam Agrawal 2024-10-01  2900  			}
ff9fc48fab0e1ea Ghanshyam Agrawal 2024-10-01  2901  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2902  			d = (struct ldtentry *) & p->slot[stbl[i]];
^1da177e4c3f415 Linus Torvalds    2005-04-16  2903  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2904  			if (((long) jfs_dirent + d->namlen + 1) >
dc5798d9a7b6565 Dave Kleikamp     2005-05-02  2905  			    (dirent_buf + PAGE_SIZE)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2906  				/* DBCS codepages could overrun dirent_buf */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2907  				index = i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2908  				overflow = 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2909  				break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2910  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2911  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2912  			d_namleft = d->namlen;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2913  			name_ptr = jfs_dirent->name;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2914  			jfs_dirent->ino = le32_to_cpu(d->inumber);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2915  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2916  			if (do_index) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2917  				len = min(d_namleft, DTLHDRDATALEN);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2918  				jfs_dirent->position = le32_to_cpu(d->index);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2919  				/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  2920  				 * d->index should always be valid, but it
^1da177e4c3f415 Linus Torvalds    2005-04-16  2921  				 * isn't.  fsck.jfs doesn't create the
^1da177e4c3f415 Linus Torvalds    2005-04-16  2922  				 * directory index for the lost+found
^1da177e4c3f415 Linus Torvalds    2005-04-16  2923  				 * directory.  Rather than let it go,
^1da177e4c3f415 Linus Torvalds    2005-04-16  2924  				 * we can try to fix it.
^1da177e4c3f415 Linus Torvalds    2005-04-16  2925  				 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2926  				if ((jfs_dirent->position < 2) ||
^1da177e4c3f415 Linus Torvalds    2005-04-16  2927  				    (jfs_dirent->position >=
^1da177e4c3f415 Linus Torvalds    2005-04-16  2928  				     JFS_IP(ip)->next_index)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2929  					if (!page_fixed && !isReadOnly(ip)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2930  						fix_page = 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2931  						/*
^1da177e4c3f415 Linus Torvalds    2005-04-16  2932  						 * setting overflow and setting
^1da177e4c3f415 Linus Torvalds    2005-04-16  2933  						 * index to i will cause the
^1da177e4c3f415 Linus Torvalds    2005-04-16  2934  						 * same page to be processed
^1da177e4c3f415 Linus Torvalds    2005-04-16  2935  						 * again starting here
^1da177e4c3f415 Linus Torvalds    2005-04-16  2936  						 */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2937  						overflow = 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2938  						index = i;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2939  						break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2940  					}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2941  					jfs_dirent->position = unique_pos++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2942  				}
44512449c0ab368 Dave Kleikamp     2013-08-15  2943  				/*
44512449c0ab368 Dave Kleikamp     2013-08-15  2944  				 * We add 1 to the index because we may
44512449c0ab368 Dave Kleikamp     2013-08-15  2945  				 * use a value of 2 internally, and NFSv4
44512449c0ab368 Dave Kleikamp     2013-08-15  2946  				 * doesn't like that.
44512449c0ab368 Dave Kleikamp     2013-08-15  2947  				 */
44512449c0ab368 Dave Kleikamp     2013-08-15  2948  				jfs_dirent->position++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2949  			} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2950  				jfs_dirent->position = dtpos;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2951  				len = min(d_namleft, DTLHDRDATALEN_LEGACY);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2952  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2953  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2954  			/* copy the name of head/only segment */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2955  			outlen = jfs_strfromUCS_le(name_ptr, d->name, len,
^1da177e4c3f415 Linus Torvalds    2005-04-16  2956  						   codepage);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2957  			jfs_dirent->name_len = outlen;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2958  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2959  			/* copy name in the additional segment(s) */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2960  			next = d->next;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2961  			while (next >= 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2962  				t = (struct dtslot *) & p->slot[next];
^1da177e4c3f415 Linus Torvalds    2005-04-16  2963  				name_ptr += outlen;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2964  				d_namleft -= len;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2965  				/* Sanity Check */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2966  				if (d_namleft == 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2967  					jfs_error(ip->i_sb,
eb8630d7d2fd135 Joe Perches       2013-06-04  2968  						  "JFS:Dtree error: ino = %ld, bn=%lld, index = %d\n",
^1da177e4c3f415 Linus Torvalds    2005-04-16  2969  						  (long)ip->i_ino,
^1da177e4c3f415 Linus Torvalds    2005-04-16  2970  						  (long long)bn,
^1da177e4c3f415 Linus Torvalds    2005-04-16  2971  						  i);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2972  					goto skip_one;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2973  				}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2974  				len = min(d_namleft, DTSLOTDATALEN);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2975  				outlen = jfs_strfromUCS_le(name_ptr, t->name,
^1da177e4c3f415 Linus Torvalds    2005-04-16  2976  							   len, codepage);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2977  				jfs_dirent->name_len += outlen;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2978  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2979  				next = t->next;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2980  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2981  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2982  			jfs_dirents++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2983  			jfs_dirent = next_jfs_dirent(jfs_dirent);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2984  skip_one:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2985  			if (!do_index)
^1da177e4c3f415 Linus Torvalds    2005-04-16  2986  				dtoffset->index++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2987  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2988  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2989  		if (!overflow) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2990  			/* Point to next leaf page */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2991  			if (p->header.flag & BT_ROOT)
^1da177e4c3f415 Linus Torvalds    2005-04-16  2992  				bn = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2993  			else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2994  				bn = le64_to_cpu(p->header.next);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2995  				index = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2996  				/* update offset (pn:index) for new page */
^1da177e4c3f415 Linus Torvalds    2005-04-16  2997  				if (!do_index) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2998  					dtoffset->pn++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2999  					dtoffset->index = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3000  				}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3001  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3002  			page_fixed = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3003  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3004  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3005  		/* unpin previous leaf page */
^1da177e4c3f415 Linus Torvalds    2005-04-16  3006  		DT_PUTPAGE(mp);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3007  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3008  		jfs_dirent = (struct jfs_dirent *) dirent_buf;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3009  		while (jfs_dirents--) {
070a0ebf42e15c9 Al Viro           2013-05-17  3010  			ctx->pos = jfs_dirent->position;
070a0ebf42e15c9 Al Viro           2013-05-17  3011  			if (!dir_emit(ctx, jfs_dirent->name,
070a0ebf42e15c9 Al Viro           2013-05-17  3012  				    jfs_dirent->name_len,
^1da177e4c3f415 Linus Torvalds    2005-04-16  3013  				    jfs_dirent->ino, DT_UNKNOWN))
^1da177e4c3f415 Linus Torvalds    2005-04-16  3014  				goto out;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3015  			jfs_dirent = next_jfs_dirent(jfs_dirent);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3016  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3017  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3018  		if (fix_page) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3019  			add_missing_indices(ip, bn);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3020  			page_fixed = 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3021  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3022  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3023  		if (!overflow && (bn == 0)) {
070a0ebf42e15c9 Al Viro           2013-05-17  3024  			ctx->pos = DIREND;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3025  			break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3026  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3027  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3028  		DT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3029  		if (rc) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  3030  			free_page(dirent_buf);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3031  			return rc;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3032  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3033  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  3034  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3035        out:
^1da177e4c3f415 Linus Torvalds    2005-04-16  3036  	free_page(dirent_buf);
^1da177e4c3f415 Linus Torvalds    2005-04-16  3037  
^1da177e4c3f415 Linus Torvalds    2005-04-16  3038  	return rc;
^1da177e4c3f415 Linus Torvalds    2005-04-16  3039  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  3040  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834094;
	b=eyHEs7fr/sKH/nPOjWECGkT83I3TrcwRel3zoi9ZxhPA7HkKXnKxICV44sbvP22MTcqe
	 y0aqRjbyyCSZtiFH6Nv8KN05DWaxzRJg5ANqqQgwOuJ4OsIyCpX5FOXXwqLs6YhNC+/CJ
	 DXCg8OybOVVm7HaOruNDo/HbhTZf36HzjdM4LxNDecsDUnitTi23me1dJy71/4eJMm0qj
	 Nn0TtPBUYoDVDjaMDRvXYUy2pKeIZ9oKLfWFsR+WQ3bSi6u2boWgS3JJ8H1LvZBsDXbpb
	 eOCUXli3ZGxYm289SuCXelh6G1HdJgMLaS90J/SY73w58oQIQRTDWwLJPrKUEhChppA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834094;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=20YSgyG1fSdxEGA2RLi6W+xMxR3nOEU7eBBY1xF8x2w=;
	b=2D2anzZ/6GZ2u6vqbEc9Lop4mG0aQTWaXiqd8btrd0RX+outXoUL2yfPSue1saMEm0oG
	 gQTaJ6pscn39NtLnY1L1VAFnkjtKLuFRAJTheSpH47czk3iSZwtbMaLagkSM5d+Ei5gy4
	 5E6tPqw+xA6QMkfcNRppoTze6asVfcFbrnw9nrT7pG7LAXHVWJbAuY8u0RWuv6UGEFBy6
	 fDBcMlRx+ZKfKo+48U762bLOS/4A/QDTMiu6GxpcB6NBj6GDdSWdfaSUR8VLpl7BnWcpT
	 ZQIsh0W44omoSKNd8A2s7FA5AkizkZyyqF7hdQZJtgMXy/dqrlmaDVATiUzt0pGPLaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QM8IwkZd;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85053606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Nov 2026 02:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85053606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QM8IwkZd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795834093; x=1827370093;
  h=date:from:to:cc:subject:message-id;
  bh=QKUrpIXW5fREXltseapky9OS0ImCmmv3MxFNlyyInAg=;
  b=QM8IwkZdBH0oycppdYXmoucoMTUQObqNfaP/xh55cjHEK27RmAwlQ70S
   K5I11koxcEqpTavLovhV8YUyKE83klvKgmkwRpMBfP+OBex5vnMvHk/WQ
   lZ7lw3tuZGCIpPl7cE2lTPBtA+UEVwn3H8jlhggkbvntfIelWXCTvBKkY
   SEy9jSrt/JnwHgOshGs3kaeqV8XmVe1HlvgtEwdgq/mMA3DtTV0Mt1ybi
   wsfXiVnwwOTMI9mfUPMquzXr7D0bBmJ8ca/LQNhxlhdPTqUNw/+MgdCD7
   NmJMo6q5JKmrqdGFWIIV2Z1uXsR8POvjCHKq9CHsjt5noFZWqKzeYx8s8
   g==;
X-CSE-ConnectionGUID: Layw7oB3RMesQkmSImd21w==
X-CSE-MsgGUID: c9u9F+iZSvKuJZPzaNneHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4637369"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4637369"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 18:48:13 -0800
X-CSE-ConnectionGUID: fi8y6NvzTzOHeTPPlqEqyg==
X-CSE-MsgGUID: QoqUjIOtSVeXcQMCEARkrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12859182"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2026 18:48:12 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX8Tx-000000000UQ-3R6z;
	Sat, 28 Nov 2026 02:48:09 +0000
Date: Sat, 28 Nov 2026 03:47:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vdubeyko-nilfs2:for-next 6/12] fs/nilfs2/sufile.c:226
 nilfs_sufile_updatev() warn: passing freed memory 'bh' (line 221)
Message-ID: <20261128034341.xWyWiCif-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ryusuke Konishi <konishi.ryusuke@gmail.com>
CC: Viacheslav Dubeyko <slava@dubeyko.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vdubeyko/nilfs2.git for-next
head:   4a88fad89f09ec470d42a7006ed8c020116759f7
commit: 3553acdb2f394205ac3dfea5df5827b26a7c1378 [6/12] nilfs2: restore segment usage from the save buffer when aborting GC
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: sparc64-randconfig-2200-20261128 (https://download.01.org/0day-ci/archive/20261128/20261128034341.xWyWiCif-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261128034341.xWyWiCif-lkp@intel.com/

smatch warnings:
fs/nilfs2/sufile.c:226 nilfs_sufile_updatev() warn: passing freed memory 'bh' (line 221)

vim +/bh +226 fs/nilfs2/sufile.c

ef7d4757a5b7b07 Ryusuke Konishi 2009-11-13  143  
dda54f4b872512e Ryusuke Konishi 2009-05-16  144  /**
dda54f4b872512e Ryusuke Konishi 2009-05-16  145   * nilfs_sufile_updatev - modify multiple segment usages at a time
dda54f4b872512e Ryusuke Konishi 2009-05-16  146   * @sufile: inode of segment usage file
dda54f4b872512e Ryusuke Konishi 2009-05-16  147   * @segnumv: array of segment numbers
dda54f4b872512e Ryusuke Konishi 2009-05-16  148   * @nsegs: size of @segnumv array
dda54f4b872512e Ryusuke Konishi 2009-05-16  149   * @create: creation flag
dda54f4b872512e Ryusuke Konishi 2009-05-16  150   * @ndone: place to store number of modified segments on @segnumv
3553acdb2f39420 Ryusuke Konishi 2026-11-27  151   * @suv: buffer for saving or restoring segment usage entries
dda54f4b872512e Ryusuke Konishi 2009-05-16  152   * @dofunc: primitive operation for the update
dda54f4b872512e Ryusuke Konishi 2009-05-16  153   *
dda54f4b872512e Ryusuke Konishi 2009-05-16  154   * Description: nilfs_sufile_updatev() repeatedly calls @dofunc
dda54f4b872512e Ryusuke Konishi 2009-05-16  155   * against the given array of segments.  The @dofunc is called with
dda54f4b872512e Ryusuke Konishi 2009-05-16  156   * buffers of a header block and the sufile block in which the target
dda54f4b872512e Ryusuke Konishi 2009-05-16  157   * segment usage entry is contained.  If @ndone is given, the number
dda54f4b872512e Ryusuke Konishi 2009-05-16  158   * of successfully modified segments from the head is stored in the
dda54f4b872512e Ryusuke Konishi 2009-05-16  159   * place @ndone points to.
dda54f4b872512e Ryusuke Konishi 2009-05-16  160   *
d33544adcb89cd1 Ryusuke Konishi 2025-01-10  161   * Return: 0 on success, or one of the following negative error codes on
d33544adcb89cd1 Ryusuke Konishi 2025-01-10  162   * failure:
d33544adcb89cd1 Ryusuke Konishi 2025-01-10  163   * * %-EINVAL	- Invalid segment usage number
d33544adcb89cd1 Ryusuke Konishi 2025-01-10  164   * * %-EIO	- I/O error (including metadata corruption).
d33544adcb89cd1 Ryusuke Konishi 2025-01-10  165   * * %-ENOENT	- Given segment usage is in hole block (may be returned if
dda54f4b872512e Ryusuke Konishi 2009-05-16  166   *		  @create is zero)
d33544adcb89cd1 Ryusuke Konishi 2025-01-10  167   * * %-ENOMEM	- Insufficient memory available.
dda54f4b872512e Ryusuke Konishi 2009-05-16  168   */
dda54f4b872512e Ryusuke Konishi 2009-05-16  169  int nilfs_sufile_updatev(struct inode *sufile, __u64 *segnumv, size_t nsegs,
3553acdb2f39420 Ryusuke Konishi 2026-11-27  170  			 int create, size_t *ndone, void *suv,
dda54f4b872512e Ryusuke Konishi 2009-05-16  171  			 void (*dofunc)(struct inode *, __u64,
dda54f4b872512e Ryusuke Konishi 2009-05-16  172  					struct buffer_head *,
3553acdb2f39420 Ryusuke Konishi 2026-11-27  173  					struct buffer_head *, void *))
dda54f4b872512e Ryusuke Konishi 2009-05-16  174  {
dda54f4b872512e Ryusuke Konishi 2009-05-16  175  	struct buffer_head *header_bh, *bh;
dda54f4b872512e Ryusuke Konishi 2009-05-16  176  	unsigned long blkoff, prev_blkoff;
dda54f4b872512e Ryusuke Konishi 2009-05-16  177  	__u64 *seg;
dda54f4b872512e Ryusuke Konishi 2009-05-16  178  	size_t nerr = 0, n = 0;
3553acdb2f39420 Ryusuke Konishi 2026-11-27  179  	size_t susz = NILFS_MDT(sufile)->mi_entry_size;
3553acdb2f39420 Ryusuke Konishi 2026-11-27  180  	void *su;
dda54f4b872512e Ryusuke Konishi 2009-05-16  181  	int ret = 0;
dda54f4b872512e Ryusuke Konishi 2009-05-16  182  
dda54f4b872512e Ryusuke Konishi 2009-05-16  183  	if (unlikely(nsegs == 0))
dda54f4b872512e Ryusuke Konishi 2009-05-16  184  		goto out;
dda54f4b872512e Ryusuke Konishi 2009-05-16  185  
dda54f4b872512e Ryusuke Konishi 2009-05-16  186  	down_write(&NILFS_MDT(sufile)->mi_sem);
dda54f4b872512e Ryusuke Konishi 2009-05-16  187  	for (seg = segnumv; seg < segnumv + nsegs; seg++) {
dda54f4b872512e Ryusuke Konishi 2009-05-16  188  		if (unlikely(*seg >= nilfs_sufile_get_nsegments(sufile))) {
a1d0747a393a079 Joe Perches     2020-08-11  189  			nilfs_warn(sufile->i_sb,
feee880fa58254f Ryusuke Konishi 2016-08-02  190  				   "%s: invalid segment number: %llu",
feee880fa58254f Ryusuke Konishi 2016-08-02  191  				   __func__, (unsigned long long)*seg);
dda54f4b872512e Ryusuke Konishi 2009-05-16  192  			nerr++;
dda54f4b872512e Ryusuke Konishi 2009-05-16  193  		}
dda54f4b872512e Ryusuke Konishi 2009-05-16  194  	}
dda54f4b872512e Ryusuke Konishi 2009-05-16  195  	if (nerr > 0) {
dda54f4b872512e Ryusuke Konishi 2009-05-16  196  		ret = -EINVAL;
dda54f4b872512e Ryusuke Konishi 2009-05-16  197  		goto out_sem;
dda54f4b872512e Ryusuke Konishi 2009-05-16  198  	}
dda54f4b872512e Ryusuke Konishi 2009-05-16  199  
dda54f4b872512e Ryusuke Konishi 2009-05-16  200  	ret = nilfs_sufile_get_header_block(sufile, &header_bh);
dda54f4b872512e Ryusuke Konishi 2009-05-16  201  	if (ret < 0)
dda54f4b872512e Ryusuke Konishi 2009-05-16  202  		goto out_sem;
dda54f4b872512e Ryusuke Konishi 2009-05-16  203  
dda54f4b872512e Ryusuke Konishi 2009-05-16  204  	seg = segnumv;
dda54f4b872512e Ryusuke Konishi 2009-05-16  205  	blkoff = nilfs_sufile_get_blkoff(sufile, *seg);
dda54f4b872512e Ryusuke Konishi 2009-05-16  206  	ret = nilfs_mdt_get_block(sufile, blkoff, create, NULL, &bh);
dda54f4b872512e Ryusuke Konishi 2009-05-16  207  	if (ret < 0)
dda54f4b872512e Ryusuke Konishi 2009-05-16  208  		goto out_header;
dda54f4b872512e Ryusuke Konishi 2009-05-16  209  
3553acdb2f39420 Ryusuke Konishi 2026-11-27  210  	for (su = suv; ; su = su ? su + susz : NULL) {
3553acdb2f39420 Ryusuke Konishi 2026-11-27  211  		dofunc(sufile, *seg, header_bh, bh, su);
dda54f4b872512e Ryusuke Konishi 2009-05-16  212  
dda54f4b872512e Ryusuke Konishi 2009-05-16  213  		if (++seg >= segnumv + nsegs)
dda54f4b872512e Ryusuke Konishi 2009-05-16  214  			break;
dda54f4b872512e Ryusuke Konishi 2009-05-16  215  		prev_blkoff = blkoff;
dda54f4b872512e Ryusuke Konishi 2009-05-16  216  		blkoff = nilfs_sufile_get_blkoff(sufile, *seg);
dda54f4b872512e Ryusuke Konishi 2009-05-16  217  		if (blkoff == prev_blkoff)
dda54f4b872512e Ryusuke Konishi 2009-05-16  218  			continue;
dda54f4b872512e Ryusuke Konishi 2009-05-16  219  
dda54f4b872512e Ryusuke Konishi 2009-05-16  220  		/* get different block */
dda54f4b872512e Ryusuke Konishi 2009-05-16 @221  		brelse(bh);
dda54f4b872512e Ryusuke Konishi 2009-05-16  222  		ret = nilfs_mdt_get_block(sufile, blkoff, create, NULL, &bh);
dda54f4b872512e Ryusuke Konishi 2009-05-16  223  		if (unlikely(ret < 0))
dda54f4b872512e Ryusuke Konishi 2009-05-16  224  			goto out_header;
dda54f4b872512e Ryusuke Konishi 2009-05-16  225  	}
dda54f4b872512e Ryusuke Konishi 2009-05-16 @226  	brelse(bh);
dda54f4b872512e Ryusuke Konishi 2009-05-16  227  
dda54f4b872512e Ryusuke Konishi 2009-05-16  228   out_header:
dda54f4b872512e Ryusuke Konishi 2009-05-16  229  	n = seg - segnumv;
dda54f4b872512e Ryusuke Konishi 2009-05-16  230  	brelse(header_bh);
dda54f4b872512e Ryusuke Konishi 2009-05-16  231   out_sem:
dda54f4b872512e Ryusuke Konishi 2009-05-16  232  	up_write(&NILFS_MDT(sufile)->mi_sem);
dda54f4b872512e Ryusuke Konishi 2009-05-16  233   out:
dda54f4b872512e Ryusuke Konishi 2009-05-16  234  	if (ndone)
dda54f4b872512e Ryusuke Konishi 2009-05-16  235  		*ndone = n;
dda54f4b872512e Ryusuke Konishi 2009-05-16  236  	return ret;
dda54f4b872512e Ryusuke Konishi 2009-05-16  237  }
dda54f4b872512e Ryusuke Konishi 2009-05-16  238  

:::::: The code at line 226 was first introduced by commit
:::::: dda54f4b872512eba484c38631bd6ae5b5716f41 nilfs2: add sufile function that can modify multiple segment usages

:::::: TO: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
:::::: CC: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

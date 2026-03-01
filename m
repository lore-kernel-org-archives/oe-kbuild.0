Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924C22339
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Mar 2026 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772335545; cv=none; b=S//oFqTErmpJ2FgzmjbTM6npkzmDsD+WrhcoKuUVCGvSa28zQi4vnSS1iG8MYGy6zYlCh92oFO5/HYtByKeLOn/7b4ophGuBAIUr0+VmVVg8PmD81OO4dkuL7ygvlDMXOatRQUeraDXIyjmqg0I6xLF8qKbsb3KDExW90dzT0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772335545; c=relaxed/simple;
	bh=qCAFjRBwLRrXT5noy92ZjlTnIBBo0XpT/FdV987izUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qDD+DVI2ayNn04ZhEJr89xAWVimeDhSu2WPLd4kZzU5jdTQc1rUgznXGzOsGJPOE5hSZ5+GaYoT2Ss65DoUWh/wXP+2DgqlvW0/Mx3JaMIzVf3d6TXdMr/4cFj0L+Mp74VPRB6SBJ4XXiJvNTZQBEyR099mFj+/2kGzT+RvizT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bs0pYhm2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bs0pYhm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772335542; x=1803871542;
  h=date:from:to:cc:subject:message-id;
  bh=qCAFjRBwLRrXT5noy92ZjlTnIBBo0XpT/FdV987izUo=;
  b=Bs0pYhm2AQeTBFHKuA0ywq11SkefSnwHSy91SRlxaUMQbr4Mg1Jr99bQ
   ff0ETrDoFgxDikLrTYVoYIJ6IKpMInplHZC/YPAALQVR19+Jma6AtsyXV
   d1kptuyiaPaSxYSytwduBpRJU8Elf8ktX/ePzDrYh+lmxzT+UiF1Pdj1M
   BmVaIzg7jc6zz6VIn4Fw5yxhGYEe3VuswugpZ3C5koocWpjFEbBVeAqFi
   7wsk/JBDb9ctPHtfoEvwdCKuS+tCLijY/nh8MT7++u9DIQN3nyFILWk26
   YBuRj1Pux3oJgpnlJ6npOzIku5eutI4K/Igf0JeMgW12PryKmNzK/zn20
   Q==;
X-CSE-ConnectionGUID: 76XzECWxRyewrblGzZSkDQ==
X-CSE-MsgGUID: lS2ignfMQXynWclUYU8Vxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73444423"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="73444423"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 19:25:41 -0800
X-CSE-ConnectionGUID: IkGfQTFYRoOqTRGlLBWZHQ==
X-CSE-MsgGUID: vBQ86gy8Ro2xrXoQ5UFxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="216521232"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Feb 2026 19:25:40 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwXR3-000000001F7-1ds8;
	Sun, 01 Mar 2026 03:25:37 +0000
Date: Sun, 01 Mar 2026 11:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-next 5/16] fs/netfs/bvecq.c:299
 netfs_shorten_bvecq_buffer() error: we previously assumed 'bq' could be null
 (see line 289)
Message-ID: <202603011130.BCCzYGYx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   64a2722c2705a6c6f46b7214477a4a0a2106c1b6
commit: 7cdad319bd204a832475adebf1dfaf11ccad0d8a [5/16] netfs: Add some tools for managing bvecq chains
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-141-20260301 (https://download.01.org/0day-ci/archive/20260301/202603011130.BCCzYGYx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603011130.BCCzYGYx-lkp@intel.com/

smatch warnings:
fs/netfs/bvecq.c:299 netfs_shorten_bvecq_buffer() error: we previously assumed 'bq' could be null (see line 289)

vim +/bq +299 fs/netfs/bvecq.c

7cdad319bd204a David Howells 2026-02-28  273  
7cdad319bd204a David Howells 2026-02-28  274  /**
7cdad319bd204a David Howells 2026-02-28  275   * netfs_shorten_bvecq_buffer - Shorten a bvec queue buffer
7cdad319bd204a David Howells 2026-02-28  276   * @bq: The start of the buffer to shorten
7cdad319bd204a David Howells 2026-02-28  277   * @seg: The slot to start from
7cdad319bd204a David Howells 2026-02-28  278   * @size: The size to retain
7cdad319bd204a David Howells 2026-02-28  279   *
7cdad319bd204a David Howells 2026-02-28  280   * Shorten the content of a bvec queue down to the minimum number of segments,
7cdad319bd204a David Howells 2026-02-28  281   * starting at the specified segment, to retain the specified size.  An error
7cdad319bd204a David Howells 2026-02-28  282   * will be reported if the bvec queue is undersized.
7cdad319bd204a David Howells 2026-02-28  283   */
7cdad319bd204a David Howells 2026-02-28  284  int netfs_shorten_bvecq_buffer(struct bvecq *bq, unsigned int seg, size_t size)
7cdad319bd204a David Howells 2026-02-28  285  {
7cdad319bd204a David Howells 2026-02-28  286  	ssize_t retain = size;
7cdad319bd204a David Howells 2026-02-28  287  
7cdad319bd204a David Howells 2026-02-28  288  	/* Skip through the segments we want to keep. */
7cdad319bd204a David Howells 2026-02-28 @289  	for (; bq; bq = bq->next) {
7cdad319bd204a David Howells 2026-02-28  290  		for (; seg < bq->nr_segs; seg++) {
7cdad319bd204a David Howells 2026-02-28  291  			retain -= bq->bv[seg].bv_len;
7cdad319bd204a David Howells 2026-02-28  292  			if (retain < 0)
7cdad319bd204a David Howells 2026-02-28  293  				goto found;
7cdad319bd204a David Howells 2026-02-28  294  		}
7cdad319bd204a David Howells 2026-02-28  295  		seg = 0;
7cdad319bd204a David Howells 2026-02-28  296  	}
7cdad319bd204a David Howells 2026-02-28  297  	if (WARN_ON_ONCE(retain > 0))
7cdad319bd204a David Howells 2026-02-28  298  		return -EMSGSIZE;
7cdad319bd204a David Howells 2026-02-28 @299  	bq->bv[seg].bv_len += retain;
7cdad319bd204a David Howells 2026-02-28  300  	return 0;
7cdad319bd204a David Howells 2026-02-28  301  
7cdad319bd204a David Howells 2026-02-28  302  found:
7cdad319bd204a David Howells 2026-02-28  303  	/* Shorten the entry to be retained and clean the rest of this bvecq. */
7cdad319bd204a David Howells 2026-02-28  304  	bq->bv[seg].bv_len += retain;
7cdad319bd204a David Howells 2026-02-28  305  	seg++;
7cdad319bd204a David Howells 2026-02-28  306  	for (int i = seg; i < bq->nr_segs; i++)
7cdad319bd204a David Howells 2026-02-28  307  		netfs_bvecq_free_seg(bq, i);
7cdad319bd204a David Howells 2026-02-28  308  	bq->nr_segs = seg;
7cdad319bd204a David Howells 2026-02-28  309  
7cdad319bd204a David Howells 2026-02-28  310  	/* Free the queue tail. */
7cdad319bd204a David Howells 2026-02-28  311  	netfs_free_bvecq_buffer(bq->next);
7cdad319bd204a David Howells 2026-02-28  312  	bq->next = NULL;
7cdad319bd204a David Howells 2026-02-28  313  	return 0;
7cdad319bd204a David Howells 2026-02-28  314  }
7cdad319bd204a David Howells 2026-02-28  315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

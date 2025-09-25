Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DDE246BC5
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758778977; cv=none; b=ZFyjntUi6hYITOq/XdSShlF2qOIw9dQ6Bx+wEoDebuLAnXaIlE/G6vZR5Dyq9YQ9gsiHjsLpPkcdxedbS6BscwlQSu5DfMUvhlSCAog2G8F+ZKVURQSnt7UQrdgyX+t8ikhQp19R+p/U7LjxmNklNCH1wclu1gxSUvy1Axc5Qjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758778977; c=relaxed/simple;
	bh=DxDasENyE729zRbd0oTyRwd9UAGpHiEQFgGGf9QsdRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KjEOZNa/WpASumlDJQoBZCC9e0rvlAqDbYIzUlEhWLDDc5GJVC6IxhLbKnsSi/NE3fSRnMV9nwhsz0I8rftm20Bijxl5ekHoW7WC9HIPGxlj1ZheincNfCTvN6kWEO1QVs/xc0jaB2Am5q0YtR4rJ4w++Knt8dB8WZcKdUfxOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WANjFW6b; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WANjFW6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758778976; x=1790314976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DxDasENyE729zRbd0oTyRwd9UAGpHiEQFgGGf9QsdRc=;
  b=WANjFW6bTmXLZc5qyEy5g1xcf8Bw4bg5gHL7273/AkuaQXwENGTohPj7
   NWwMPQIaiWQLq3KLd7WZw0MFtPiJjMhbJGhMOlkx8DbLytl5j11NgIhxq
   iZjMRkeSrTSYpFdkkZurVcxmkVh2xlgPlXopxxb1VVfd+j+C68HssHiX6
   0Xiao9Hi74Rgvua7iIJfctCmU24CuN+32IOh5LAIOcdx9Qz+JkZS7P6mV
   BH9mTKwSQF3WqYuS18ZmkJK9CnAlmhEIKZnFppgXm2/H8o/sfFi3WBQfM
   KVgHXZmRyhJiapxwLA9PpO9pgtkAXP/zplJRiSv1g0yoJL5d2va8Irq3T
   w==;
X-CSE-ConnectionGUID: Mapp+I2lRJO2/CuzVrrVqg==
X-CSE-MsgGUID: hDFD5KwtRaqfFfnX2kUmxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="78726019"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="78726019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 22:42:55 -0700
X-CSE-ConnectionGUID: rdTj5FRlT6Sv8TKFK6NQrQ==
X-CSE-MsgGUID: vs2Re7eBQ56VQbc+9Ldb0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177673491"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Sep 2025 22:42:45 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1ekc-0004wr-1f;
	Thu, 25 Sep 2025 05:42:42 +0000
Date: Thu, 25 Sep 2025 13:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10202/12207] fs/fs-writeback.c:718
 cleanup_offline_cgwb() error: uninitialized symbol 'new_wb'.
Message-ID: <202509251347.F32MUauR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jan Kara <jack@suse.cz>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b5a4da2c459f79a2c87c867398f1c0c315779781
commit: e1b849cfa6b61f1c866a908c9e8dd9b5aaab820b [10202/12207] writeback: Avoid contention on wb->list_lock when switching inodes
:::::: branch date: 15 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250925 (https://download.01.org/0day-ci/archive/20250925/202509251347.F32MUauR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509251347.F32MUauR-lkp@intel.com/

smatch warnings:
fs/fs-writeback.c:718 cleanup_offline_cgwb() error: uninitialized symbol 'new_wb'.

vim +/new_wb +718 fs/fs-writeback.c

6654408a33e6297 Jingbo Xu      2023-10-14  688  
c22d70a162d3cc1 Roman Gushchin 2021-06-28  689  /**
c22d70a162d3cc1 Roman Gushchin 2021-06-28  690   * cleanup_offline_cgwb - detach associated inodes
c22d70a162d3cc1 Roman Gushchin 2021-06-28  691   * @wb: target wb
c22d70a162d3cc1 Roman Gushchin 2021-06-28  692   *
c22d70a162d3cc1 Roman Gushchin 2021-06-28  693   * Switch all inodes attached to @wb to a nearest living ancestor's wb in order
c22d70a162d3cc1 Roman Gushchin 2021-06-28  694   * to eventually release the dying @wb.  Returns %true if not all inodes were
c22d70a162d3cc1 Roman Gushchin 2021-06-28  695   * switched and the function has to be restarted.
c22d70a162d3cc1 Roman Gushchin 2021-06-28  696   */
c22d70a162d3cc1 Roman Gushchin 2021-06-28  697  bool cleanup_offline_cgwb(struct bdi_writeback *wb)
c22d70a162d3cc1 Roman Gushchin 2021-06-28  698  {
c22d70a162d3cc1 Roman Gushchin 2021-06-28  699  	struct cgroup_subsys_state *memcg_css;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  700  	struct inode_switch_wbs_context *isw;
e1b849cfa6b61f1 Jan Kara       2025-04-09  701  	struct bdi_writeback *new_wb;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  702  	int nr;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  703  	bool restart = false;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  704  
98b160c828f3129 Len Baker      2021-09-25  705  	isw = kzalloc(struct_size(isw, inodes, WB_MAX_INODES_PER_ISW),
98b160c828f3129 Len Baker      2021-09-25  706  		      GFP_KERNEL);
c22d70a162d3cc1 Roman Gushchin 2021-06-28  707  	if (!isw)
c22d70a162d3cc1 Roman Gushchin 2021-06-28  708  		return restart;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  709  
c22d70a162d3cc1 Roman Gushchin 2021-06-28  710  	atomic_inc(&isw_nr_in_flight);
c22d70a162d3cc1 Roman Gushchin 2021-06-28  711  
c22d70a162d3cc1 Roman Gushchin 2021-06-28  712  	for (memcg_css = wb->memcg_css->parent; memcg_css;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  713  	     memcg_css = memcg_css->parent) {
e1b849cfa6b61f1 Jan Kara       2025-04-09  714  		new_wb = wb_get_create(wb->bdi, memcg_css, GFP_KERNEL);
e1b849cfa6b61f1 Jan Kara       2025-04-09  715  		if (new_wb)
c22d70a162d3cc1 Roman Gushchin 2021-06-28  716  			break;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  717  	}
e1b849cfa6b61f1 Jan Kara       2025-04-09 @718  	if (unlikely(!new_wb))
e1b849cfa6b61f1 Jan Kara       2025-04-09  719  		new_wb = &wb->bdi->wb; /* wb_get() is noop for bdi's wb */
c22d70a162d3cc1 Roman Gushchin 2021-06-28  720  
c22d70a162d3cc1 Roman Gushchin 2021-06-28  721  	nr = 0;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  722  	spin_lock(&wb->list_lock);
6654408a33e6297 Jingbo Xu      2023-10-14  723  	/*
6654408a33e6297 Jingbo Xu      2023-10-14  724  	 * In addition to the inodes that have completed writeback, also switch
6654408a33e6297 Jingbo Xu      2023-10-14  725  	 * cgwbs for those inodes only with dirty timestamps. Otherwise, those
6654408a33e6297 Jingbo Xu      2023-10-14  726  	 * inodes won't be written back for a long time when lazytime is
6654408a33e6297 Jingbo Xu      2023-10-14  727  	 * enabled, and thus pinning the dying cgwbs. It won't break the
6654408a33e6297 Jingbo Xu      2023-10-14  728  	 * bandwidth restrictions, as writeback of inode metadata is not
6654408a33e6297 Jingbo Xu      2023-10-14  729  	 * accounted for.
6654408a33e6297 Jingbo Xu      2023-10-14  730  	 */
e1b849cfa6b61f1 Jan Kara       2025-04-09  731  	restart = isw_prepare_wbs_switch(new_wb, isw, &wb->b_attached, &nr);
6654408a33e6297 Jingbo Xu      2023-10-14  732  	if (!restart)
e1b849cfa6b61f1 Jan Kara       2025-04-09  733  		restart = isw_prepare_wbs_switch(new_wb, isw, &wb->b_dirty_time,
e1b849cfa6b61f1 Jan Kara       2025-04-09  734  						 &nr);
c22d70a162d3cc1 Roman Gushchin 2021-06-28  735  	spin_unlock(&wb->list_lock);
c22d70a162d3cc1 Roman Gushchin 2021-06-28  736  
c22d70a162d3cc1 Roman Gushchin 2021-06-28  737  	/* no attached inodes? bail out */
c22d70a162d3cc1 Roman Gushchin 2021-06-28  738  	if (nr == 0) {
c22d70a162d3cc1 Roman Gushchin 2021-06-28  739  		atomic_dec(&isw_nr_in_flight);
e1b849cfa6b61f1 Jan Kara       2025-04-09  740  		wb_put(new_wb);
c22d70a162d3cc1 Roman Gushchin 2021-06-28  741  		kfree(isw);
c22d70a162d3cc1 Roman Gushchin 2021-06-28  742  		return restart;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  743  	}
c22d70a162d3cc1 Roman Gushchin 2021-06-28  744  
e1b849cfa6b61f1 Jan Kara       2025-04-09  745  	wb_queue_isw(new_wb, isw);
c22d70a162d3cc1 Roman Gushchin 2021-06-28  746  
c22d70a162d3cc1 Roman Gushchin 2021-06-28  747  	return restart;
c22d70a162d3cc1 Roman Gushchin 2021-06-28  748  }
c22d70a162d3cc1 Roman Gushchin 2021-06-28  749  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A232A625
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 00:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725235287; cv=none; b=CIXS/+thT0F/m99vNmprjt+08AT+N4Ims+BMWshxNNJOuqFXKh5K9iVfKEiDkmZSsi3CIkm/n4uHq9Hn6LOVKxMoEwb1dACY+ppB/PR4J7E1y+wpBm2OJZ9dAZaPnNpNTqlL2jxj1j1wGDWEL7Q8a/P4qGRlg4V7ItUg1r5Q/Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725235287; c=relaxed/simple;
	bh=uX4+sDbmVJRI+Al+X75QV5UhnRIV8wS0uDDP41jXBvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfWYGWWO6/ISKX5P1Wrfn7Sh9HBaqTRpVvI/H3gUNu/vbwnwKOUQDFj/MehI6N4otc8koj55CD9eJHPIAVPwDLvWe+q/5o5X/pwgX61//rOW/dTmsQ76aAHIKnEvuIJmLFtvRuau3+BUtQ4ckDt7FdNyxRTwTvbXMJyj3pbOfvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mdh+Eh4+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mdh+Eh4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725235284; x=1756771284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uX4+sDbmVJRI+Al+X75QV5UhnRIV8wS0uDDP41jXBvk=;
  b=Mdh+Eh4+zrrJolQV1DDzlFT+U4vFUOw6bcTw4okaRjj/3fXUqnXeFqXw
   zvqHYJJ4gR4nCnfxP13Ra+Y7zu5mtE8KqX9by+qtgepPBQVWejM2sNgLf
   1yZ9VByq7eQ8rSllTG+f2K/G0YxKhQYI73lmPAqgHUYI/bAZ+He7iQzCZ
   7aZLnqqVkJCL56ji/HJwa2jOKmSg76ezyHMaLdG5uyXM1Y6jysgaR/DOr
   L/I7WOFXrIqCjlse0hQ4b9Eo52JIssRv0WIQID9rfkjDM72mwhsKKdGlY
   ZTv+6tdqIqizyQmMxR8AE+eND3xKonVRGnZ7r6/C0wJm8ON6SGmtR8KDe
   A==;
X-CSE-ConnectionGUID: jgMmQ2MORDOTCiNVSCAhGw==
X-CSE-MsgGUID: 928Y9q11QpWpoqLctl6e3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="34965224"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="34965224"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 17:01:23 -0700
X-CSE-ConnectionGUID: bkKTvI2NSJCyNTzl24h6+A==
X-CSE-MsgGUID: juX/JiqLTwK0M7+x5QPmeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="68841043"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Sep 2024 17:01:22 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skuVU-0004zM-0b;
	Mon, 02 Sep 2024 00:01:20 +0000
Date: Mon, 2 Sep 2024 08:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 26998/30000] fs/cifs/file.c:2986
 cifs_write_from_iter() error: uninitialized symbol 'pagevec'.
Message-ID: <202409020711.CVj7KUmD-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zizhi Wo <wozizhi@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   02994a9b68a17040658e1a32a4438a31ae6f273b
commit: 9f14fd51e0779baa09eeeb3582d3d8a0557561fb [26998/30000] cifs: Fix pages leak when writedata alloc failed in cifs_write_from_iter()
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20240901 (https://download.01.org/0day-ci/archive/20240902/202409020711.CVj7KUmD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409020711.CVj7KUmD-lkp@intel.com/

New smatch warnings:
fs/cifs/file.c:2986 cifs_write_from_iter() error: uninitialized symbol 'pagevec'.

Old smatch warnings:
fs/cifs/file.c:2987 cifs_write_from_iter() error: uninitialized symbol 'pagevec'.

vim +/pagevec +2986 fs/cifs/file.c

8c5f9c1ab7cb45 Long Li         2018-10-31  2895  
43de94eadf0ced Pavel Shilovsky 2014-06-20  2896  static int
43de94eadf0ced Pavel Shilovsky 2014-06-20  2897  cifs_write_from_iter(loff_t offset, size_t len, struct iov_iter *from,
43de94eadf0ced Pavel Shilovsky 2014-06-20  2898  		     struct cifsFileInfo *open_file,
c610c4b619e534 Pavel Shilovsky 2017-04-25  2899  		     struct cifs_sb_info *cifs_sb, struct list_head *wdata_list,
c610c4b619e534 Pavel Shilovsky 2017-04-25  2900  		     struct cifs_aio_ctx *ctx)
72432ffcf555de Pavel Shilovsky 2011-01-24  2901  {
43de94eadf0ced Pavel Shilovsky 2014-06-20  2902  	int rc = 0;
43de94eadf0ced Pavel Shilovsky 2014-06-20  2903  	size_t cur_len;
66386c08be5d1a Pavel Shilovsky 2014-06-20  2904  	unsigned long nr_pages, num_pages, i;
43de94eadf0ced Pavel Shilovsky 2014-06-20  2905  	struct cifs_writedata *wdata;
fc56b9838a20d4 Al Viro         2016-09-21  2906  	struct iov_iter saved_from = *from;
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  2907  	loff_t saved_offset = offset;
da82f7e755d280 Jeff Layton     2012-03-23  2908  	pid_t pid;
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  2909  	struct TCP_Server_Info *server;
8c5f9c1ab7cb45 Long Li         2018-10-31  2910  	struct page **pagevec;
8c5f9c1ab7cb45 Long Li         2018-10-31  2911  	size_t start;
335b7b62ffb69d Pavel Shilovsky 2019-01-16  2912  	unsigned int xid;
d4ffff1fa9695c Pavel Shilovsky 2011-05-26  2913  
d4ffff1fa9695c Pavel Shilovsky 2011-05-26  2914  	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_RWPIDFORWARD)
d4ffff1fa9695c Pavel Shilovsky 2011-05-26  2915  		pid = open_file->pid;
d4ffff1fa9695c Pavel Shilovsky 2011-05-26  2916  	else
d4ffff1fa9695c Pavel Shilovsky 2011-05-26  2917  		pid = current->tgid;
d4ffff1fa9695c Pavel Shilovsky 2011-05-26  2918  
352d96f3acc6e0 Aurelien Aptel  2020-05-31  2919  	server = cifs_pick_channel(tlink_tcon(open_file->tlink)->ses);
335b7b62ffb69d Pavel Shilovsky 2019-01-16  2920  	xid = get_xid();
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  2921  
72432ffcf555de Pavel Shilovsky 2011-01-24  2922  	do {
335b7b62ffb69d Pavel Shilovsky 2019-01-16  2923  		unsigned int wsize;
335b7b62ffb69d Pavel Shilovsky 2019-01-16  2924  		struct cifs_credits credits_on_stack;
335b7b62ffb69d Pavel Shilovsky 2019-01-16  2925  		struct cifs_credits *credits = &credits_on_stack;
72432ffcf555de Pavel Shilovsky 2011-01-24  2926  
3e9529944d4177 Pavel Shilovsky 2019-01-25  2927  		if (open_file->invalidHandle) {
3e9529944d4177 Pavel Shilovsky 2019-01-25  2928  			rc = cifs_reopen_file(open_file, false);
3e9529944d4177 Pavel Shilovsky 2019-01-25  2929  			if (rc == -EAGAIN)
3e9529944d4177 Pavel Shilovsky 2019-01-25  2930  				continue;
3e9529944d4177 Pavel Shilovsky 2019-01-25  2931  			else if (rc)
3e9529944d4177 Pavel Shilovsky 2019-01-25  2932  				break;
3e9529944d4177 Pavel Shilovsky 2019-01-25  2933  		}
3e9529944d4177 Pavel Shilovsky 2019-01-25  2934  
cb7e9eabb2b584 Pavel Shilovsky 2014-06-05  2935  		rc = server->ops->wait_mtu_credits(server, cifs_sb->wsize,
335b7b62ffb69d Pavel Shilovsky 2019-01-16  2936  						   &wsize, credits);
cb7e9eabb2b584 Pavel Shilovsky 2014-06-05  2937  		if (rc)
cb7e9eabb2b584 Pavel Shilovsky 2014-06-05  2938  			break;
cb7e9eabb2b584 Pavel Shilovsky 2014-06-05  2939  
b6bc8a7b993e62 Long Li         2018-12-16  2940  		cur_len = min_t(const size_t, len, wsize);
b6bc8a7b993e62 Long Li         2018-12-16  2941  
8c5f9c1ab7cb45 Long Li         2018-10-31  2942  		if (ctx->direct_io) {
b98e26df07549d Steve French    2018-11-01  2943  			ssize_t result;
b98e26df07549d Steve French    2018-11-01  2944  
b98e26df07549d Steve French    2018-11-01  2945  			result = iov_iter_get_pages_alloc(
b6bc8a7b993e62 Long Li         2018-12-16  2946  				from, &pagevec, cur_len, &start);
b98e26df07549d Steve French    2018-11-01  2947  			if (result < 0) {
8c5f9c1ab7cb45 Long Li         2018-10-31  2948  				cifs_dbg(VFS,
a0a3036b81f1f6 Joe Perches     2020-04-14  2949  					 "direct_writev couldn't get user pages (rc=%zd) iter type %d iov_offset %zd count %zd\n",
6629400a2227c8 David Howells   2019-11-21  2950  					 result, iov_iter_type(from),
8c5f9c1ab7cb45 Long Li         2018-10-31  2951  					 from->iov_offset, from->count);
8c5f9c1ab7cb45 Long Li         2018-10-31  2952  				dump_stack();
54e94ff94eac88 Long Li         2018-12-16  2953  
54e94ff94eac88 Long Li         2018-12-16  2954  				rc = result;
54e94ff94eac88 Long Li         2018-12-16  2955  				add_credits_and_wake_if(server, credits, 0);
8c5f9c1ab7cb45 Long Li         2018-10-31  2956  				break;
8c5f9c1ab7cb45 Long Li         2018-10-31  2957  			}
b98e26df07549d Steve French    2018-11-01  2958  			cur_len = (size_t)result;
8c5f9c1ab7cb45 Long Li         2018-10-31  2959  			iov_iter_advance(from, cur_len);
8c5f9c1ab7cb45 Long Li         2018-10-31  2960  
8c5f9c1ab7cb45 Long Li         2018-10-31  2961  			nr_pages =
8c5f9c1ab7cb45 Long Li         2018-10-31  2962  				(cur_len + start + PAGE_SIZE - 1) / PAGE_SIZE;
8c5f9c1ab7cb45 Long Li         2018-10-31  2963  
8c5f9c1ab7cb45 Long Li         2018-10-31  2964  			wdata = cifs_writedata_direct_alloc(pagevec,
8c5f9c1ab7cb45 Long Li         2018-10-31  2965  					     cifs_uncached_writev_complete);
8c5f9c1ab7cb45 Long Li         2018-10-31  2966  			if (!wdata) {
8c5f9c1ab7cb45 Long Li         2018-10-31  2967  				rc = -ENOMEM;
8c5f9c1ab7cb45 Long Li         2018-10-31  2968  				add_credits_and_wake_if(server, credits, 0);
8c5f9c1ab7cb45 Long Li         2018-10-31  2969  				break;
8c5f9c1ab7cb45 Long Li         2018-10-31  2970  			}
8c5f9c1ab7cb45 Long Li         2018-10-31  2971  
8c5f9c1ab7cb45 Long Li         2018-10-31  2972  
8c5f9c1ab7cb45 Long Li         2018-10-31  2973  			wdata->page_offset = start;
8c5f9c1ab7cb45 Long Li         2018-10-31  2974  			wdata->tailsz =
8c5f9c1ab7cb45 Long Li         2018-10-31  2975  				nr_pages > 1 ?
8c5f9c1ab7cb45 Long Li         2018-10-31  2976  					cur_len - (PAGE_SIZE - start) -
8c5f9c1ab7cb45 Long Li         2018-10-31  2977  					(nr_pages - 2) * PAGE_SIZE :
8c5f9c1ab7cb45 Long Li         2018-10-31  2978  					cur_len;
8c5f9c1ab7cb45 Long Li         2018-10-31  2979  		} else {
cb7e9eabb2b584 Pavel Shilovsky 2014-06-05  2980  			nr_pages = get_numpages(wsize, len, &cur_len);
da82f7e755d280 Jeff Layton     2012-03-23  2981  			wdata = cifs_writedata_alloc(nr_pages,
da82f7e755d280 Jeff Layton     2012-03-23  2982  					     cifs_uncached_writev_complete);
da82f7e755d280 Jeff Layton     2012-03-23  2983  			if (!wdata) {
da82f7e755d280 Jeff Layton     2012-03-23  2984  				rc = -ENOMEM;
9f14fd51e0779b Zhang Xiaoxu    2024-05-23  2985  				for (i = 0; i < nr_pages; i++)
9f14fd51e0779b Zhang Xiaoxu    2024-05-23 @2986  					put_page(pagevec[i]);
9f14fd51e0779b Zhang Xiaoxu    2024-05-23  2987  				kvfree(pagevec);
cb7e9eabb2b584 Pavel Shilovsky 2014-06-05  2988  				add_credits_and_wake_if(server, credits, 0);
da82f7e755d280 Jeff Layton     2012-03-23  2989  				break;
da82f7e755d280 Jeff Layton     2012-03-23  2990  			}
72432ffcf555de Pavel Shilovsky 2011-01-24  2991  
da82f7e755d280 Jeff Layton     2012-03-23  2992  			rc = cifs_write_allocate_pages(wdata->pages, nr_pages);
da82f7e755d280 Jeff Layton     2012-03-23  2993  			if (rc) {
9bda8723da2d55 Pavel Shilovsky 2019-01-23  2994  				kvfree(wdata->pages);
da82f7e755d280 Jeff Layton     2012-03-23  2995  				kfree(wdata);
cb7e9eabb2b584 Pavel Shilovsky 2014-06-05  2996  				add_credits_and_wake_if(server, credits, 0);
72432ffcf555de Pavel Shilovsky 2011-01-24  2997  				break;
72432ffcf555de Pavel Shilovsky 2011-01-24  2998  			}
72432ffcf555de Pavel Shilovsky 2011-01-24  2999  
66386c08be5d1a Pavel Shilovsky 2014-06-20  3000  			num_pages = nr_pages;
8c5f9c1ab7cb45 Long Li         2018-10-31  3001  			rc = wdata_fill_from_iovec(
8c5f9c1ab7cb45 Long Li         2018-10-31  3002  				wdata, from, &cur_len, &num_pages);
66386c08be5d1a Pavel Shilovsky 2014-06-20  3003  			if (rc) {
5d81de8e8667da Jeff Layton     2014-02-14  3004  				for (i = 0; i < nr_pages; i++)
5d81de8e8667da Jeff Layton     2014-02-14  3005  					put_page(wdata->pages[i]);
9bda8723da2d55 Pavel Shilovsky 2019-01-23  3006  				kvfree(wdata->pages);
5d81de8e8667da Jeff Layton     2014-02-14  3007  				kfree(wdata);
cb7e9eabb2b584 Pavel Shilovsky 2014-06-05  3008  				add_credits_and_wake_if(server, credits, 0);
5d81de8e8667da Jeff Layton     2014-02-14  3009  				break;
5d81de8e8667da Jeff Layton     2014-02-14  3010  			}
5d81de8e8667da Jeff Layton     2014-02-14  3011  
5d81de8e8667da Jeff Layton     2014-02-14  3012  			/*
8c5f9c1ab7cb45 Long Li         2018-10-31  3013  			 * Bring nr_pages down to the number of pages we
8c5f9c1ab7cb45 Long Li         2018-10-31  3014  			 * actually used, and free any pages that we didn't use.
5d81de8e8667da Jeff Layton     2014-02-14  3015  			 */
66386c08be5d1a Pavel Shilovsky 2014-06-20  3016  			for ( ; nr_pages > num_pages; nr_pages--)
5d81de8e8667da Jeff Layton     2014-02-14  3017  				put_page(wdata->pages[nr_pages - 1]);
5d81de8e8667da Jeff Layton     2014-02-14  3018  
8c5f9c1ab7cb45 Long Li         2018-10-31  3019  			wdata->tailsz = cur_len - ((nr_pages - 1) * PAGE_SIZE);
8c5f9c1ab7cb45 Long Li         2018-10-31  3020  		}
8c5f9c1ab7cb45 Long Li         2018-10-31  3021  
da82f7e755d280 Jeff Layton     2012-03-23  3022  		wdata->sync_mode = WB_SYNC_ALL;
da82f7e755d280 Jeff Layton     2012-03-23  3023  		wdata->nr_pages = nr_pages;
da82f7e755d280 Jeff Layton     2012-03-23  3024  		wdata->offset = (__u64)offset;
da82f7e755d280 Jeff Layton     2012-03-23  3025  		wdata->cfile = cifsFileInfo_get(open_file);
352d96f3acc6e0 Aurelien Aptel  2020-05-31  3026  		wdata->server = server;
da82f7e755d280 Jeff Layton     2012-03-23  3027  		wdata->pid = pid;
da82f7e755d280 Jeff Layton     2012-03-23  3028  		wdata->bytes = cur_len;
eddb079deb4deb Jeff Layton     2012-09-18  3029  		wdata->pagesz = PAGE_SIZE;
335b7b62ffb69d Pavel Shilovsky 2019-01-16  3030  		wdata->credits = credits_on_stack;
c610c4b619e534 Pavel Shilovsky 2017-04-25  3031  		wdata->ctx = ctx;
c610c4b619e534 Pavel Shilovsky 2017-04-25  3032  		kref_get(&ctx->refcount);
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  3033  
9a1c67e8d5dad1 Pavel Shilovsky 2019-01-23  3034  		rc = adjust_credits(server, &wdata->credits, wdata->bytes);
9a1c67e8d5dad1 Pavel Shilovsky 2019-01-23  3035  
9a1c67e8d5dad1 Pavel Shilovsky 2019-01-23  3036  		if (!rc) {
9a1c67e8d5dad1 Pavel Shilovsky 2019-01-23  3037  			if (wdata->cfile->invalidHandle)
3e9529944d4177 Pavel Shilovsky 2019-01-25  3038  				rc = -EAGAIN;
3e9529944d4177 Pavel Shilovsky 2019-01-25  3039  			else
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  3040  				rc = server->ops->async_writev(wdata,
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  3041  					cifs_uncached_writedata_release);
9a1c67e8d5dad1 Pavel Shilovsky 2019-01-23  3042  		}
9a1c67e8d5dad1 Pavel Shilovsky 2019-01-23  3043  
da82f7e755d280 Jeff Layton     2012-03-23  3044  		if (rc) {
335b7b62ffb69d Pavel Shilovsky 2019-01-16  3045  			add_credits_and_wake_if(server, &wdata->credits, 0);
4a5c80d7b5615b Steve French    2014-02-07  3046  			kref_put(&wdata->refcount,
4a5c80d7b5615b Steve French    2014-02-07  3047  				 cifs_uncached_writedata_release);
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  3048  			if (rc == -EAGAIN) {
fc56b9838a20d4 Al Viro         2016-09-21  3049  				*from = saved_from;
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  3050  				iov_iter_advance(from, offset - saved_offset);
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  3051  				continue;
6ec0b01b2691d1 Pavel Shilovsky 2014-06-20  3052  			}
72432ffcf555de Pavel Shilovsky 2011-01-24  3053  			break;
72432ffcf555de Pavel Shilovsky 2011-01-24  3054  		}
72432ffcf555de Pavel Shilovsky 2011-01-24  3055  
43de94eadf0ced Pavel Shilovsky 2014-06-20  3056  		list_add_tail(&wdata->list, wdata_list);
da82f7e755d280 Jeff Layton     2012-03-23  3057  		offset += cur_len;
da82f7e755d280 Jeff Layton     2012-03-23  3058  		len -= cur_len;
72432ffcf555de Pavel Shilovsky 2011-01-24  3059  	} while (len > 0);
72432ffcf555de Pavel Shilovsky 2011-01-24  3060  
335b7b62ffb69d Pavel Shilovsky 2019-01-16  3061  	free_xid(xid);
43de94eadf0ced Pavel Shilovsky 2014-06-20  3062  	return rc;
43de94eadf0ced Pavel Shilovsky 2014-06-20  3063  }
43de94eadf0ced Pavel Shilovsky 2014-06-20  3064  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C42F5A0E
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 17:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787506101; cv=none; b=iTzWz81Nz1ojV6qwD2cB7sdavf6XgkcsDxq+SJOSCI3vXbrnhIeuTSp1Vtqr9cZfhH574P6EieKTEYYb3hM9kt81KVlle4DB/4LpnclMzE1VJ6eYbkrFgzzvwetvkaUFv87iD7jv13RxHtgEKgLtT/o/sR8om4wZOS2coOg5+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787506101; c=relaxed/simple;
	bh=9MRBsGRAHgXUJZdgqsoD8u9P7NHIYXg1gH1u61wVbQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hli0aUae1tlkaDQSkzzGIFyUTwpQL1N2ZLHdJ81CLnI4c4AWiAgdVordVBZWfImPuFASblFscHHbhzExiilwNPDVwNn8MPCDHYbhG82IiAHtJvqNQQHKT4D0Ea9ZJ8AFn8IvrOD2KwVmOAkl9uYkZ8Smx/bxKLwRxsozolXoLbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UO6CmyJ3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UO6CmyJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787506097; x=1819042097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MRBsGRAHgXUJZdgqsoD8u9P7NHIYXg1gH1u61wVbQ4=;
  b=UO6CmyJ3GVI7hKNwDTNFOHM5cz+VAj3rR9Y/N0mYKPs2/xuml0KPed0g
   vKMhiSyK6S2dfUN81hSr6s+yJzWSZm5Fp1CCOXbawmXBnPRlCJSRfkKH4
   KyY3TR1LL5fHtWGUsjxPNdT564HVA76zgnDKdikUzOBDNO2/4pvO7vIM1
   flqMpnMKcsQrYwLDXo+x0cAFePKTt7cmZSif79GUcUa/qYUD2ycLiUBaG
   BVQuuhJ4QHngrG+rbuHrJtH2a4Rw2GkhNxsbht5FOGcYDIxyPcWaQMAoO
   bpFxBHSztn3+ETJMBkIio80bLNLVM/f8ZoqRDvvIJhjrRr3gspPb3JTI8
   w==;
X-CSE-ConnectionGUID: 3QAr7NOlRtinP02vL9fooA==
X-CSE-MsgGUID: b0j7qwBlSnuUZW8bwVL84Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87892751"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="87892751"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 10:28:17 -0700
X-CSE-ConnectionGUID: c2Oyl+o7Q4iTCEgF/729RQ==
X-CSE-MsgGUID: QyHuTSsYT26euYdznSAzwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="265030122"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Aug 2026 10:28:16 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyBzR-000000000lr-2PJc;
	Sun, 23 Aug 2026 17:28:13 +0000
Date: Mon, 24 Aug 2026 01:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] gfs2: annotate i_gl with __rcu and convert to
 accessor helpers
Message-ID: <202608240109.e8n1gQMm-lkp@intel.com>
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
In-Reply-To: <6a74d41a.f3f7def5.e164f.560e@mx.google.com>
References: <6a74d41a.f3f7def5.e164f.560e@mx.google.com>
TO: Adrian Garcia Casado <adriangarciacasado42@gmail.com>
TO: Andreas Gruenbacher <agruenba@redhat.com>
CC: gfs2@lists.linux.dev
CC: linux-kernel@vger.kernel.org

Hi Adrian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on gfs2/for-next]
[also build test WARNING on linus/master v7.2 next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Garcia-Casado/gfs2-annotate-i_gl-with-__rcu-and-convert-to-accessor-helpers/20260806-113610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
patch link:    https://lore.kernel.org/r/6a74d41a.f3f7def5.e164f.560e%40mx.google.com
patch subject: [PATCH v2] gfs2: annotate i_gl with __rcu and convert to accessor helpers
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260824/202608240109.e8n1gQMm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608240109.e8n1gQMm-lkp@intel.com/

New smatch warnings:
fs/gfs2/inode.c:150 gfs2_inode_lookup() warn: inconsistent indenting

Old smatch warnings:
fs/gfs2/inode.c:364 gfs2_lookupi() warn: passing zero to 'ERR_PTR'

vim +150 fs/gfs2/inode.c

2c5f4a53476e3c fs/gfs2/inode.c     Andreas Gruenbacher  2025-11-13  104  
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  105  /**
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  106   * gfs2_inode_lookup - Lookup an inode
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  107   * @sb: The super block
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  108   * @type: The type of the inode
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  109   * @no_addr: The inode number
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  110   * @no_formal_ino: The inode generation number
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  111   * @blktype: Requested block type (GFS2_BLKST_DINODE or GFS2_BLKST_UNLINKED;
61b91cfdc6c0c4 fs/gfs2/inode.c     Andreas Gruenbacher  2017-08-01  112   *           GFS2_BLKST_FREE to indicate not to verify)
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  113   *
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  114   * If @type is DT_UNKNOWN, the inode type is fetched from disk.
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  115   *
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  116   * If @blktype is anything other than GFS2_BLKST_FREE (which is used as a
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  117   * placeholder because it doesn't otherwise make sense), the on-disk block type
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  118   * is verified to be @blktype.
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  119   *
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  120   * When @no_formal_ino is non-zero, this function will return ERR_PTR(-ESTALE)
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  121   * if it detects that @no_formal_ino doesn't match the actual inode generation
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  122   * number.  However, it doesn't always know unless @type is DT_UNKNOWN.
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  123   *
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  124   * Returns: A VFS inode, or an error
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  125   */
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  126  
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  127  struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  128  				u64 no_addr, u64 no_formal_ino,
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  129  				unsigned int blktype)
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  130  {
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  131  	struct inode *inode;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  132  	struct gfs2_inode *ip;
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  133  	struct gfs2_holder i_gh;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  134  	int error;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  135  
6df9f9a253c7dc fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-17  136  	gfs2_holder_mark_uninitialized(&i_gh);
5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  137  	inode = iget5_locked(sb, no_addr, iget_test, iget_set, &no_addr);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  138  	if (!inode)
ac3beb6a5de048 fs/gfs2/inode.c     Steven Whitehouse    2014-01-16  139  		return ERR_PTR(-ENOMEM);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  140  
e97321fa095f1e fs/gfs2/inode.c     Bob Peterson         2016-04-12  141  	ip = GFS2_I(inode);
e97321fa095f1e fs/gfs2/inode.c     Bob Peterson         2016-04-12  142  
40a4c512ad2564 fs/gfs2/inode.c     Mateusz Guzik        2025-10-09  143  	if (inode_state_read_once(inode) & I_NEW) {
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  144  		struct gfs2_sbd *sdp = GFS2_SB(inode);
5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  145  		struct gfs2_glock *io_gl;
c412a97cf6c525 fs/gfs2/inode.c     Bob Peterson         2022-08-22  146  		int extra_flags = 0;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  147  
2c5f4a53476e3c fs/gfs2/inode.c     Andreas Gruenbacher  2025-11-13  148  		gfs2_setup_inode(inode);
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  149  		{ struct gfs2_glock *gl;
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06 @150  		error = gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE, &gl);
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  151  		if (!error)
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  152  			rcu_assign_pointer(ip->i_gl, gl); }
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  153  		if (unlikely(error))
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  154  			goto fail;
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  155  
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  156  		error = gfs2_glock_get(sdp, no_addr, &gfs2_iopen_glops, CREATE,
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  157  				       &io_gl);
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  158  		if (unlikely(error))
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  159  			goto fail;
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  160  
2ec750a01d189c fs/gfs2/inode.c     Andreas Gruenbacher  2022-12-04  161  		/*
2ec750a01d189c fs/gfs2/inode.c     Andreas Gruenbacher  2022-12-04  162  		 * The only caller that sets @blktype to GFS2_BLKST_UNLINKED is
2ec750a01d189c fs/gfs2/inode.c     Andreas Gruenbacher  2022-12-04  163  		 * delete_work_func().  Make sure not to cancel the delete work
2ec750a01d189c fs/gfs2/inode.c     Andreas Gruenbacher  2022-12-04  164  		 * from within itself here.
2ec750a01d189c fs/gfs2/inode.c     Andreas Gruenbacher  2022-12-04  165  		 */
c412a97cf6c525 fs/gfs2/inode.c     Bob Peterson         2022-08-22  166  		if (blktype == GFS2_BLKST_UNLINKED)
c412a97cf6c525 fs/gfs2/inode.c     Bob Peterson         2022-08-22  167  			extra_flags |= LM_FLAG_TRY;
c412a97cf6c525 fs/gfs2/inode.c     Bob Peterson         2022-08-22  168  		else
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  169  			gfs2_cancel_delete_work(io_gl);
c412a97cf6c525 fs/gfs2/inode.c     Bob Peterson         2022-08-22  170  		error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED,
c7d7d2d345697e fs/gfs2/inode.c     Andreas Gruenbacher  2022-10-09  171  					   GL_EXACT | GL_NOPID | extra_flags,
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  172  					   &ip->i_iopen_gh);
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher  2022-01-24  173  		gfs2_glock_put(io_gl);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  174  		if (unlikely(error))
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  175  			goto fail;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  176  
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  177  		if (type == DT_UNKNOWN || blktype != GFS2_BLKST_FREE) {
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  178  			/*
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  179  			 * The GL_SKIP flag indicates to skip reading the inode
5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  180  			 * block.  We read the inode when instantiating it
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  181  			 * after possibly checking the block type.
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  182  			 */
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  183  			error = gfs2_glock_nq_init(gfs2_inode_glock(ip), LM_ST_EXCLUSIVE,
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  184  						   GL_SKIP, &i_gh);
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  185  			if (error)
40e7e86ef16550 fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-24  186  				goto fail;
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  187  
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  188  			error = -ESTALE;
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  189  			if (no_formal_ino &&
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  190  			    gfs2_inode_already_deleted(gfs2_inode_glock(ip), no_formal_ino))
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  191  				goto fail;
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  192  
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  193  			if (blktype != GFS2_BLKST_FREE) {
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  194  				error = gfs2_check_blk_type(sdp, no_addr,
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  195  							    blktype);
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  196  				if (error)
40e7e86ef16550 fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-24  197  					goto fail;
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  198  			}
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  199  		}
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  200  
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  201  		set_bit(GLF_INSTANTIATE_NEEDED, &gfs2_inode_glock(ip)->gl_flags);
5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  202  
2b0fb353c029de fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  203  		/* Lowest possible timestamp; will be overwritten in gfs2_dinode_in. */
580f721b6f5ad5 fs/gfs2/inode.c     Jeff Layton          2023-10-04  204  		inode_set_atime(inode,
580f721b6f5ad5 fs/gfs2/inode.c     Jeff Layton          2023-10-04  205  				1LL << (8 * sizeof(inode_get_atime_sec(inode)) - 1),
580f721b6f5ad5 fs/gfs2/inode.c     Jeff Layton          2023-10-04  206  				0);
2b0fb353c029de fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  207  
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  208  		glock_set_object(gfs2_inode_glock(ip), ip);
5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  209  
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  210  		if (type == DT_UNKNOWN) {
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  211  			/* Inode glock must be locked already */
f2e70d8f2fdff0 fs/gfs2/inode.c     Bob Peterson         2021-10-06  212  			error = gfs2_instantiate(&i_gh);
5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  213  			if (error) {
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  214  				glock_clear_object(gfs2_inode_glock(ip), ip);
40e7e86ef16550 fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-24  215  				goto fail;
5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  216  			}
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  217  		} else {
2b0fb353c029de fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  218  			ip->i_no_formal_ino = no_formal_ino;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  219  			inode->i_mode = DT2IF(type);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  220  		}
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  221  
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  222  		if (gfs2_holder_initialized(&i_gh))
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  223  			gfs2_glock_dq_uninit(&i_gh);
5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  224  		glock_set_object(ip->i_iopen_gh.gh_gl, ip);
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  225  
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  226  		gfs2_set_iop(inode);
b8e12e3599ad61 fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  227  		unlock_new_inode(inode);
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  228  	}
332f51d7db13ff fs/gfs2/inode.c     Andreas Gruenbacher  2016-09-26  229  
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  230  	if (no_formal_ino && ip->i_no_formal_ino &&
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  231  	    no_formal_ino != ip->i_no_formal_ino) {
b66648ad6dcfef fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-15  232  		iput(inode);
b8e12e3599ad61 fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  233  		return ERR_PTR(-ESTALE);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  234  	}
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  235  
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  236  	return inode;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  237  
40e7e86ef16550 fs/gfs2/inode.c     Andreas Gruenbacher  2020-01-24  238  fail:
c412a97cf6c525 fs/gfs2/inode.c     Bob Peterson         2022-08-22  239  	if (error == GLR_TRYFAILED)
c412a97cf6c525 fs/gfs2/inode.c     Bob Peterson         2022-08-22  240  		error = -EAGAIN;
5f6e13baebf31d fs/gfs2/inode.c     Andreas Gruenbacher  2021-11-29  241  	if (gfs2_holder_initialized(&ip->i_iopen_gh))
763766c0571ea1 fs/gfs2/inode.c     Bob Peterson         2021-09-29  242  		gfs2_glock_dq_uninit(&ip->i_iopen_gh);
6df9f9a253c7dc fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-17  243  	if (gfs2_holder_initialized(&i_gh))
3ce37b2cb49176 fs/gfs2/inode.c     Andreas Gruenbacher  2016-06-14  244  		gfs2_glock_dq_uninit(&i_gh);
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  245  	if (gfs2_inode_glock(ip)) {
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  246  		gfs2_glock_put(gfs2_inode_glock(ip));
f7e98cd66761db fs/gfs2/inode.c     Adrian Garcia Casado 2026-08-06  247  		rcu_assign_pointer(ip->i_gl, NULL);
9ffa18884cceb2 fs/gfs2/inode.c     Andreas Gruenbacher  2023-01-23  248  	}
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  249  	iget_failed(inode);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  250  	return ERR_PTR(error);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  251  }
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse    2011-05-09  252  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

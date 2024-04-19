Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75D13C913
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Apr 2024 20:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713557119; cv=none; b=DK1XA3AG+FQ/FJyMps7P1Z0wkqmUvEkVYo6Lxw92tJi8L2wkBa5M7M00ITMGmTYbgcJN3BJbXr2gmPVK2dSTNUoaplstG5Xd7UsoUsWW/HCxW5tXOCZUZF+gQcWF2K7uFOoDwLdWz69w9xDR6BRwAxq8FjUW3wFF1hisE+s+CIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713557119; c=relaxed/simple;
	bh=fAbS/1GFXvKk9gMMVo8v/IP1hC0DtBJYsKQBUmI4dyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsMzJjfngvpBYizhcwt+/9DuG5+AIu6DKh9Dtat322f0Fuq37qTJsjO3nm7ry+VnuG6xSH5WYMMpQrGux5mrMUQ4VanOB1S8pxuqf+qT8AoJhWT/1YRViqlyMmTN50qjYTvJpFhrlDEO0ub48WGqba4/tMts1rff71hNaXHebMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TP0dzVNB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TP0dzVNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713557117; x=1745093117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fAbS/1GFXvKk9gMMVo8v/IP1hC0DtBJYsKQBUmI4dyU=;
  b=TP0dzVNBp4xtiMtvV3UVusGlhOfGna9iM07GMRhjNf2wvq25teDWOV0U
   M8QzeDVLJ6nX9cKq3mbrF8trKcOhAlvW1AouPjPaBNvduo181rz5djFd9
   /abCPNjj4QcAQd60yERVUhQbnZmx0Z/T90q8dT+ZBtsU5ettxHXqmpPRk
   0MXKrbCS1h/g0140qFJg01RQNRgMF/sBmwO0qrlfUa8BEMsI1YNyyUdUQ
   d/xC7uP/WPNpieImAMY+02xup85hKj5FdluSFgFoDwm3u2GzNEwIm1LTL
   NMfDBqR3Z9eYAFo2ndJppSk25pZlAazwrA9FApyNbR4hgPHKWcI93C65y
   w==;
X-CSE-ConnectionGUID: r441607/RkKCtvKQlrQXhA==
X-CSE-MsgGUID: c5NKNd+wQYSsfytDcCy0qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12968042"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="12968042"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 13:05:17 -0700
X-CSE-ConnectionGUID: T7EeHThHTOq4GfJ+pofIzQ==
X-CSE-MsgGUID: NOC1Wi0sQYmDwbwEAPbJBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="23874772"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Apr 2024 13:05:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxuTx-000AR2-1T;
	Fri, 19 Apr 2024 20:05:13 +0000
Date: Sat, 20 Apr 2024 04:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bcachefs:master 145/169] fs/bcachefs/dirent.c:590:13-14: WARNING
 opportunity for min()
Message-ID: <202404200457.FJpvGdxL-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   da016a120d583584479174b63edf4c8f61ae3598
commit: bd2ba246e93dc1c9ac1fea334bd55511bf3a1bc5 [145/169] bcachefs: bch2_dir_emit() - drop_locks_do() conversion
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r052-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200457.FJpvGdxL-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404200457.FJpvGdxL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/dirent.c:590:13-14: WARNING opportunity for min()

vim +590 fs/bcachefs/dirent.c

bd2ba246e93dc1 Kent Overstreet 2024-04-10  542  
6fed42bb7750e2 Kent Overstreet 2021-03-16  543  int bch2_readdir(struct bch_fs *c, subvol_inum inum, struct dir_context *ctx)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  544  {
6bd68ec266ad71 Kent Overstreet 2023-09-12  545  	struct btree_trans *trans = bch2_trans_get(c);
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  546  	struct btree_iter iter;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  547  	struct bkey_s_c k;
4db650277d42c0 Kent Overstreet 2021-10-12  548  	subvol_inum target;
6fed42bb7750e2 Kent Overstreet 2021-03-16  549  	u32 snapshot;
462f494bc56052 Kent Overstreet 2023-06-21  550  	struct bkey_buf sk;
94f651e2c7e280 Kent Overstreet 2019-04-17  551  	int ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  552  
462f494bc56052 Kent Overstreet 2023-06-21  553  	bch2_bkey_buf_init(&sk);
6fed42bb7750e2 Kent Overstreet 2021-03-16  554  retry:
6bd68ec266ad71 Kent Overstreet 2023-09-12  555  	bch2_trans_begin(trans);
6fed42bb7750e2 Kent Overstreet 2021-03-16  556  
6bd68ec266ad71 Kent Overstreet 2023-09-12  557  	ret = bch2_subvolume_get_snapshot(trans, inum.subvol, &snapshot);
6fed42bb7750e2 Kent Overstreet 2021-03-16  558  	if (ret)
6fed42bb7750e2 Kent Overstreet 2021-03-16  559  		goto err;
424eb881300467 Kent Overstreet 2019-03-25  560  
6bd68ec266ad71 Kent Overstreet 2023-09-12  561  	for_each_btree_key_upto_norestart(trans, iter, BTREE_ID_dirents,
85d8cf161f9899 Kent Overstreet 2022-03-11  562  			   SPOS(inum.inum, ctx->pos, snapshot),
85d8cf161f9899 Kent Overstreet 2022-03-11  563  			   POS(inum.inum, U64_MAX), 0, k, ret) {
26609b619fa230 Kent Overstreet 2018-11-01  564  		if (k.k->type != KEY_TYPE_dirent)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  565  			continue;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  566  
bd2ba246e93dc1 Kent Overstreet 2024-04-10  567  		/* dir_emit() can fault and block: */
bd2ba246e93dc1 Kent Overstreet 2024-04-10  568  		bch2_bkey_buf_reassemble(&sk, c, k);
bd2ba246e93dc1 Kent Overstreet 2024-04-10  569  		struct bkey_s_c_dirent dirent = bkey_i_to_s_c_dirent(sk.k);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  570  
6bd68ec266ad71 Kent Overstreet 2023-09-12  571  		ret = bch2_dirent_read_target(trans, inum, dirent, &target);
4db650277d42c0 Kent Overstreet 2021-10-12  572  		if (ret < 0)
4db650277d42c0 Kent Overstreet 2021-10-12  573  			break;
4db650277d42c0 Kent Overstreet 2021-10-12  574  		if (ret)
4db650277d42c0 Kent Overstreet 2021-10-12  575  			continue;
4db650277d42c0 Kent Overstreet 2021-10-12  576  
ab44d7bdeebe31 Kent Overstreet 2021-10-22  577  		/*
ab44d7bdeebe31 Kent Overstreet 2021-10-22  578  		 * read_target looks up subvolumes, we can overflow paths if the
ab44d7bdeebe31 Kent Overstreet 2021-10-22  579  		 * directory has many subvolumes in it
bd2ba246e93dc1 Kent Overstreet 2024-04-10  580  		 *
bd2ba246e93dc1 Kent Overstreet 2024-04-10  581  		 * XXX: btree_trans_too_many_iters() is something we'd like to
bd2ba246e93dc1 Kent Overstreet 2024-04-10  582  		 * get rid of, and there's no good reason to be using it here
bd2ba246e93dc1 Kent Overstreet 2024-04-10  583  		 * except that we don't yet have a for_each_btree_key() helper
bd2ba246e93dc1 Kent Overstreet 2024-04-10  584  		 * that does subvolume_get_snapshot().
ab44d7bdeebe31 Kent Overstreet 2021-10-22  585  		 */
bd2ba246e93dc1 Kent Overstreet 2024-04-10  586  		ret =   drop_locks_do(trans,
bd2ba246e93dc1 Kent Overstreet 2024-04-10  587  				bch2_dir_emit(ctx, dirent, target)) ?:
bd2ba246e93dc1 Kent Overstreet 2024-04-10  588  			btree_trans_too_many_iters(trans);
bd2ba246e93dc1 Kent Overstreet 2024-04-10  589  		if (ret) {
bd2ba246e93dc1 Kent Overstreet 2024-04-10 @590  			ret = ret < 0 ? ret : 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

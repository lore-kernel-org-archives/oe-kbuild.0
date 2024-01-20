Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21911FBC
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705734093; cv=none; b=kbSQMNuEY0+F74SqcWvT5zAwyfe/NaSNqlPbBnaRyATGkLQXDSWvP1D3Qzg5idmxyqbJJWNOPddWDCmOOuy2bMLtg8vorJA4bPj2T4VULsmJ36RiBNd6uXB10+jguqPVRIczd425GN3AEE8+Jf2jC69zt/F1EA4wdtkyfnhD8AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705734093; c=relaxed/simple;
	bh=d5CH+bWD0uAxlb0u68jDuNPTNQWnVD/9ex551bKgsA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFN67aD9zFyjt13iMgDUzLCFYekSga4IlLEh8lw+iBFIiudw1aC16O5tinao1S5iQXx/bx9GXPODq4vq4ASCguE2m9fJDj4R4L7cIWs1TAFwm8fnd7Gs/X6uThc74X8sizrc7t68cuPOXm6SorQWw18Wcng4WRSUhdtMt5zlJIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tdr5yDC/; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tdr5yDC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705734091; x=1737270091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5CH+bWD0uAxlb0u68jDuNPTNQWnVD/9ex551bKgsA8=;
  b=Tdr5yDC/8B72qbUnd8eRbFpCYaxBjC1prT9/woztkTRW78oxlADq4lrP
   7u0Tnm5mX2XeUqvCnr/GX2FnkSIv/+R1rWfv1+IyitQWSbKIpQX1iE6di
   MigO4v1g+qMI7dPpKIZyGcnL2IDdXLmUj0xaAKlRpGXb5REEu9od7hK4J
   YtLVFCNwZ8iq/76okHHcsmzVCG8R+GTI1oSSQy+xVipuSFLsbxgyxsGhE
   fNdKJD0gx8Svz1/NlpK41xK9/f6zRZY0vwvyZnnRZ6LHzWxHL76b7/Vfs
   Thy10T8Y1zAbTkKn0nDamBl5kRrzMFPvI29XI496zy2DmwziqPQwGVx+F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="404687285"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="404687285"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 23:01:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1032135347"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="1032135347"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jan 2024 23:01:29 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR5M7-0004qI-2I;
	Sat, 20 Jan 2024 07:01:27 +0000
Date: Sat, 20 Jan 2024 15:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13435/13959] fs/bcachefs/btree_locking.c:773
 bch2_trans_relock() warn: passing zero to 'PTR_ERR'
Message-ID: <202401201431.mFljHXKZ-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad5c60d66016e544c51ed98635a74073f761f45d
commit: cf89efce1ca6edbad5047b57d6d21a89f1e67d7b [13435/13959] bcachefs: Improve trace_trans_restart_relock
:::::: branch date: 29 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240119 (https://download.01.org/0day-ci/archive/20240120/202401201431.mFljHXKZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401201431.mFljHXKZ-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree_locking.c:773 bch2_trans_relock() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +773 fs/bcachefs/btree_locking.c

cd5afabea1acd2 Kent Overstreet 2022-08-19  752  
cd5afabea1acd2 Kent Overstreet 2022-08-19  753  int bch2_trans_relock(struct btree_trans *trans)
cd5afabea1acd2 Kent Overstreet 2022-08-19  754  {
cd5afabea1acd2 Kent Overstreet 2022-08-19  755  	struct btree_path *path;
ccb7b08fbbb85e Kent Overstreet 2023-12-10  756  	unsigned i;
cd5afabea1acd2 Kent Overstreet 2022-08-19  757  
cd5afabea1acd2 Kent Overstreet 2022-08-19  758  	if (unlikely(trans->restarted))
e87b0e4a7120ee Kent Overstreet 2022-09-04  759  		return -((int) trans->restarted);
cd5afabea1acd2 Kent Overstreet 2022-08-19  760  
cf89efce1ca6ed Kent Overstreet 2024-01-15  761  	trans_for_each_path(trans, path, i) {
cf89efce1ca6ed Kent Overstreet 2024-01-15  762  		struct get_locks_fail f;
cf89efce1ca6ed Kent Overstreet 2024-01-15  763  
cd5afabea1acd2 Kent Overstreet 2022-08-19  764  		if (path->should_be_locked &&
cf89efce1ca6ed Kent Overstreet 2024-01-15  765  		    !btree_path_get_locks(trans, path, false, &f)) {
cf89efce1ca6ed Kent Overstreet 2024-01-15  766  			if (trace_trans_restart_relock_enabled()) {
cf89efce1ca6ed Kent Overstreet 2024-01-15  767  				struct printbuf buf = PRINTBUF;
cf89efce1ca6ed Kent Overstreet 2024-01-15  768  
cf89efce1ca6ed Kent Overstreet 2024-01-15  769  				bch2_bpos_to_text(&buf, path->pos);
cf89efce1ca6ed Kent Overstreet 2024-01-15  770  				prt_printf(&buf, " l=%u seq=%u node seq=",
cf89efce1ca6ed Kent Overstreet 2024-01-15  771  					   f.l, path->l[f.l].lock_seq);
cf89efce1ca6ed Kent Overstreet 2024-01-15  772  				if (IS_ERR_OR_NULL(f.b)) {
cf89efce1ca6ed Kent Overstreet 2024-01-15 @773  					prt_str(&buf, bch2_err_str(PTR_ERR(f.b)));
cf89efce1ca6ed Kent Overstreet 2024-01-15  774  				} else {
cf89efce1ca6ed Kent Overstreet 2024-01-15  775  					prt_printf(&buf, "%u", f.b->c.lock.seq);
cf89efce1ca6ed Kent Overstreet 2024-01-15  776  
cf89efce1ca6ed Kent Overstreet 2024-01-15  777  					struct six_lock_count c =
cf89efce1ca6ed Kent Overstreet 2024-01-15  778  						bch2_btree_node_lock_counts(trans, NULL, &f.b->c, f.l);
cf89efce1ca6ed Kent Overstreet 2024-01-15  779  					prt_printf(&buf, " self locked %u.%u.%u", c.n[0], c.n[1], c.n[2]);
cf89efce1ca6ed Kent Overstreet 2024-01-15  780  
cf89efce1ca6ed Kent Overstreet 2024-01-15  781  					c = six_lock_counts(&f.b->c.lock);
cf89efce1ca6ed Kent Overstreet 2024-01-15  782  					prt_printf(&buf, " total locked %u.%u.%u", c.n[0], c.n[1], c.n[2]);
cf89efce1ca6ed Kent Overstreet 2024-01-15  783  				}
cf89efce1ca6ed Kent Overstreet 2024-01-15  784  
cf89efce1ca6ed Kent Overstreet 2024-01-15  785  				trace_trans_restart_relock(trans, _RET_IP_, buf.buf);
cf89efce1ca6ed Kent Overstreet 2024-01-15  786  				printbuf_exit(&buf);
cf89efce1ca6ed Kent Overstreet 2024-01-15  787  			}
cf89efce1ca6ed Kent Overstreet 2024-01-15  788  
cf89efce1ca6ed Kent Overstreet 2024-01-15  789  			count_event(trans->c, trans_restart_relock);
e87b0e4a7120ee Kent Overstreet 2022-09-04  790  			return btree_trans_restart(trans, BCH_ERR_transaction_restart_relock);
cd5afabea1acd2 Kent Overstreet 2022-08-19  791  		}
cf89efce1ca6ed Kent Overstreet 2024-01-15  792  	}
cf89efce1ca6ed Kent Overstreet 2024-01-15  793  
cd5afabea1acd2 Kent Overstreet 2022-08-19  794  	return 0;
cd5afabea1acd2 Kent Overstreet 2022-08-19  795  }
cd5afabea1acd2 Kent Overstreet 2022-08-19  796  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

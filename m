Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB47185931
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441364; cv=none; b=P/racKd2F7Q/TIWyYyPVXgjJ/PY1gPKMVRd5CZYT9C2eJPLQ1RyqfghFSaH7eHAjgs+jaf1RA1xzfr+sZYZQp5JRZYcm7mqn+83qbuajmO93zK6SsczxYYvBZH66uZGLeViwPV4w+z181q34c/H3m/IUiudNXuK8+zadvyE+JVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441364; c=relaxed/simple;
	bh=hY+47iPBCBQGmsi2YtieO+1l2czYolI1QjYlTXCTKVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kwDQ+54TEncWF9aCLeSgXBneeyBVL2a0D9/s2DnOynIImL4PbR+981voWeoUwJGkkgBbx5dHBU3Fy4vU4d72ZGE+lTOV6E2LSPcQOVcZ03McFjgmE2TKB7OymObBUK46d0VXKfGGFedsrN3qX2A6gU0Eg1bLTexOwo1sxu8Dt4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI7zLcTM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI7zLcTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727441363; x=1758977363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hY+47iPBCBQGmsi2YtieO+1l2czYolI1QjYlTXCTKVw=;
  b=nI7zLcTMCd4YfhQaHIXrCC4/P6MFf8zQuszrNhogontlnmNLKtZyeNNK
   NQ+vmjslNrctuYcYO/2tUAhKoK98hbF3ZQLAMI2i3rQO3blV/ePWmocf5
   IsnWI3wZ/SwFZ5DGS4FZHNkkv3TFsD/fpBcEz/WSK/0H38RTi4ebRTu21
   qF+qZd9NK0nm4JxWuqmr+ddLGIUkdrAdImSDRdQzOFFC6TLfU6iKYTS7Q
   DYy/odbpyUiZjj0o6qWTf2zD7wlVETMd1yMcof2TOPDKoq4hJZp9QErY0
   kOUF42fhuA0OiodS5f5+XQGOM8BpN33vUoWD8w2gIjdhUiTde0PPbwy4i
   g==;
X-CSE-ConnectionGUID: u7PB/b9nQiaP7aQ0+H7b7Q==
X-CSE-MsgGUID: HQNEG3iERgiVCQ2JQ6d/YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44052269"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="44052269"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 05:49:22 -0700
X-CSE-ConnectionGUID: 1jWC6fRUR6mkGLj4eefDyg==
X-CSE-MsgGUID: S3vIDEdQTlKz64Oj5q49Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="95863639"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2024 05:49:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suAPO-000M77-0o;
	Fri, 27 Sep 2024 12:49:18 +0000
Date: Fri, 27 Sep 2024 20:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/nfsd/nfs4state.c:6277:2-11: second lock on line 6277
Message-ID: <202409272036.BAkxVtqo-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: NeilBrown <neilb@suse.de>
CC: Chuck Lever <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
commit: d688d8585e6bea5e4e37f7497feea93b6b0a469c nfsd: allow admin-revoked NFSv4.0 state to be freed.
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r053-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272036.BAkxVtqo-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409272036.BAkxVtqo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/nfsd/nfs4state.c:6277:2-11: second lock on line 6277
--
>> fs/nfsd/nfs4state.c:6291:0-1: preceding lock on line 6277
   fs/nfsd/nfs4state.c:6970:1-7: preceding lock on line 6930

vim +6277 fs/nfsd/nfs4state.c

7746b32f467b38 Dai Ngo   2022-09-14  6255  
d688d8585e6bea NeilBrown 2024-01-30  6256  static void nfs40_clean_admin_revoked(struct nfsd_net *nn,
d688d8585e6bea NeilBrown 2024-01-30  6257  				      struct laundry_time *lt)
d688d8585e6bea NeilBrown 2024-01-30  6258  {
d688d8585e6bea NeilBrown 2024-01-30  6259  	struct nfs4_client *clp;
d688d8585e6bea NeilBrown 2024-01-30  6260  
d688d8585e6bea NeilBrown 2024-01-30  6261  	spin_lock(&nn->client_lock);
d688d8585e6bea NeilBrown 2024-01-30  6262  	if (nn->nfs40_last_revoke == 0 ||
d688d8585e6bea NeilBrown 2024-01-30  6263  	    nn->nfs40_last_revoke > lt->cutoff) {
d688d8585e6bea NeilBrown 2024-01-30  6264  		spin_unlock(&nn->client_lock);
d688d8585e6bea NeilBrown 2024-01-30  6265  		return;
d688d8585e6bea NeilBrown 2024-01-30  6266  	}
d688d8585e6bea NeilBrown 2024-01-30  6267  	nn->nfs40_last_revoke = 0;
d688d8585e6bea NeilBrown 2024-01-30  6268  
d688d8585e6bea NeilBrown 2024-01-30  6269  retry:
d688d8585e6bea NeilBrown 2024-01-30  6270  	list_for_each_entry(clp, &nn->client_lru, cl_lru) {
d688d8585e6bea NeilBrown 2024-01-30  6271  		unsigned long id, tmp;
d688d8585e6bea NeilBrown 2024-01-30  6272  		struct nfs4_stid *stid;
d688d8585e6bea NeilBrown 2024-01-30  6273  
d688d8585e6bea NeilBrown 2024-01-30  6274  		if (atomic_read(&clp->cl_admin_revoked) == 0)
d688d8585e6bea NeilBrown 2024-01-30  6275  			continue;
d688d8585e6bea NeilBrown 2024-01-30  6276  
d688d8585e6bea NeilBrown 2024-01-30 @6277  		spin_lock(&clp->cl_lock);
d688d8585e6bea NeilBrown 2024-01-30  6278  		idr_for_each_entry_ul(&clp->cl_stateids, stid, tmp, id)
d688d8585e6bea NeilBrown 2024-01-30  6279  			if (stid->sc_status & SC_STATUS_ADMIN_REVOKED) {
d688d8585e6bea NeilBrown 2024-01-30  6280  				refcount_inc(&stid->sc_count);
d688d8585e6bea NeilBrown 2024-01-30  6281  				spin_unlock(&nn->client_lock);
d688d8585e6bea NeilBrown 2024-01-30  6282  				/* this function drops ->cl_lock */
d688d8585e6bea NeilBrown 2024-01-30  6283  				nfsd4_drop_revoked_stid(stid);
d688d8585e6bea NeilBrown 2024-01-30  6284  				nfs4_put_stid(stid);
d688d8585e6bea NeilBrown 2024-01-30  6285  				spin_lock(&nn->client_lock);
d688d8585e6bea NeilBrown 2024-01-30  6286  				goto retry;
d688d8585e6bea NeilBrown 2024-01-30  6287  			}
d688d8585e6bea NeilBrown 2024-01-30  6288  		spin_unlock(&clp->cl_lock);
d688d8585e6bea NeilBrown 2024-01-30  6289  	}
d688d8585e6bea NeilBrown 2024-01-30  6290  	spin_unlock(&nn->client_lock);
d688d8585e6bea NeilBrown 2024-01-30 @6291  }
d688d8585e6bea NeilBrown 2024-01-30  6292  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

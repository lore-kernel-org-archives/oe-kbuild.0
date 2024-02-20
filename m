Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8355A0FA
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Feb 2024 07:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708412861; cv=none; b=fNZElQB2HwKHzjfPE2iSiV4o52zc8LAfUbieyL0SQCp6b6V5t4GuX7cynP+QRuwRkfl6AAYD5LGbogpq1MUSVZnBg+G3WVBqhGM+Z1uLaNXCgl0RfzDx5r3MZtrBBW9iyPIIySjcFXRniYjVzdkQcqNDj8Cm5bTv9PCj0EwKADE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708412861; c=relaxed/simple;
	bh=WJdXGb1aT4iXaUyjKm72nSaRJMj0XV6Pxxv/Sdg3eCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbLQOoiBz7d2cGApcDA8j3qJKhU/1McTe6WzD10+HC57Obl40sGKRSarc1hrBMJWiDrYW0zXe+AqNm3bZQ2o215Qk5pYskXh+/F+z3fgn37Z7TqlaGG74KANDfTlGpcbboHW7ptp4bFHqMgsggrmduSYRjPThxkWUQqQSjnoIyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3WtjjR4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3WtjjR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708412860; x=1739948860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WJdXGb1aT4iXaUyjKm72nSaRJMj0XV6Pxxv/Sdg3eCg=;
  b=a3WtjjR4rWtsnt8bcLxOJZvA/sLjl17habdQbc7DM201Y61Cp6k7PHdT
   oReDI7+zYHi6i7VBVmqYa9W85PR7Ns+7cjoZN/HCIkDPb9p/AiEmMwRnh
   UoTl6OYZb73E4/qvoRrz9xIvmo0RRYDkL7mGfeSoNMgu5VW4ihvITkID6
   xCsFnPekpgD6LFrsy+AvPUuijzaleBIGYqipD7yS64jhsUXDk/S/NVvJM
   8N7K6h56vbyyjQgID66tdy91v9j8hm6XE2HJfpVW08L3qGy5hqmG2n0Ic
   Y2WYalAWoYVmJsZT3Az1qLXB/9LbsjerlQw+jFVnKhGBcWJCJvaVh5MRo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13913873"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13913873"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 23:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="827116925"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="827116925"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Feb 2024 23:07:36 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcKE1-0004Ie-18;
	Tue, 20 Feb 2024 07:07:33 +0000
Date: Tue, 20 Feb 2024 15:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 7484/8260] fs/nfsd/nfs4state.c:6277:2-11: second
 lock on line 6277
Message-ID: <202402201556.NcGLaU98-lkp@intel.com>
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
TO: NeilBrown <neilb@suse.de>
CC: Chuck Lever <chuck.lever@oracle.com>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   35a4fdde2466b9d90af297f249436a270ef9d30e
commit: 2bb75f5ba7e56ce1c1d0d9236db57defd7a8a028 [7484/8260] nfsd: allow admin-revoked NFSv4.0 state to be freed.
:::::: branch date: 26 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-103-20240220 (https://download.01.org/0day-ci/archive/20240220/202402201556.NcGLaU98-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402201556.NcGLaU98-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/nfsd/nfs4state.c:6277:2-11: second lock on line 6277
--
>> fs/nfsd/nfs4state.c:6291:0-1: preceding lock on line 6277
   fs/nfsd/nfs4state.c:6970:1-7: preceding lock on line 6930

vim +6277 fs/nfsd/nfs4state.c

7746b32f467b38 Dai Ngo   2022-09-14  6255  
2bb75f5ba7e56c NeilBrown 2024-01-30  6256  static void nfs40_clean_admin_revoked(struct nfsd_net *nn,
2bb75f5ba7e56c NeilBrown 2024-01-30  6257  				      struct laundry_time *lt)
2bb75f5ba7e56c NeilBrown 2024-01-30  6258  {
2bb75f5ba7e56c NeilBrown 2024-01-30  6259  	struct nfs4_client *clp;
2bb75f5ba7e56c NeilBrown 2024-01-30  6260  
2bb75f5ba7e56c NeilBrown 2024-01-30  6261  	spin_lock(&nn->client_lock);
2bb75f5ba7e56c NeilBrown 2024-01-30  6262  	if (nn->nfs40_last_revoke == 0 ||
2bb75f5ba7e56c NeilBrown 2024-01-30  6263  	    nn->nfs40_last_revoke > lt->cutoff) {
2bb75f5ba7e56c NeilBrown 2024-01-30  6264  		spin_unlock(&nn->client_lock);
2bb75f5ba7e56c NeilBrown 2024-01-30  6265  		return;
2bb75f5ba7e56c NeilBrown 2024-01-30  6266  	}
2bb75f5ba7e56c NeilBrown 2024-01-30  6267  	nn->nfs40_last_revoke = 0;
2bb75f5ba7e56c NeilBrown 2024-01-30  6268  
2bb75f5ba7e56c NeilBrown 2024-01-30  6269  retry:
2bb75f5ba7e56c NeilBrown 2024-01-30  6270  	list_for_each_entry(clp, &nn->client_lru, cl_lru) {
2bb75f5ba7e56c NeilBrown 2024-01-30  6271  		unsigned long id, tmp;
2bb75f5ba7e56c NeilBrown 2024-01-30  6272  		struct nfs4_stid *stid;
2bb75f5ba7e56c NeilBrown 2024-01-30  6273  
2bb75f5ba7e56c NeilBrown 2024-01-30  6274  		if (atomic_read(&clp->cl_admin_revoked) == 0)
2bb75f5ba7e56c NeilBrown 2024-01-30  6275  			continue;
2bb75f5ba7e56c NeilBrown 2024-01-30  6276  
2bb75f5ba7e56c NeilBrown 2024-01-30 @6277  		spin_lock(&clp->cl_lock);
2bb75f5ba7e56c NeilBrown 2024-01-30  6278  		idr_for_each_entry_ul(&clp->cl_stateids, stid, tmp, id)
2bb75f5ba7e56c NeilBrown 2024-01-30  6279  			if (stid->sc_status & SC_STATUS_ADMIN_REVOKED) {
2bb75f5ba7e56c NeilBrown 2024-01-30  6280  				refcount_inc(&stid->sc_count);
2bb75f5ba7e56c NeilBrown 2024-01-30  6281  				spin_unlock(&nn->client_lock);
2bb75f5ba7e56c NeilBrown 2024-01-30  6282  				/* this function drops ->cl_lock */
2bb75f5ba7e56c NeilBrown 2024-01-30  6283  				nfsd4_drop_revoked_stid(stid);
2bb75f5ba7e56c NeilBrown 2024-01-30  6284  				nfs4_put_stid(stid);
2bb75f5ba7e56c NeilBrown 2024-01-30  6285  				spin_lock(&nn->client_lock);
2bb75f5ba7e56c NeilBrown 2024-01-30  6286  				goto retry;
2bb75f5ba7e56c NeilBrown 2024-01-30  6287  			}
2bb75f5ba7e56c NeilBrown 2024-01-30  6288  		spin_unlock(&clp->cl_lock);
2bb75f5ba7e56c NeilBrown 2024-01-30  6289  	}
2bb75f5ba7e56c NeilBrown 2024-01-30  6290  	spin_unlock(&nn->client_lock);
2bb75f5ba7e56c NeilBrown 2024-01-30 @6291  }
2bb75f5ba7e56c NeilBrown 2024-01-30  6292  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

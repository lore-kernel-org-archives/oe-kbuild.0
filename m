Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C50EA8
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQbEDjmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585173; x=1733121173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFGiXL2RjwsLJJIbZ7Y0hi6lhZZUqwZdzpdAPZtzBo8=;
  b=dQbEDjmQYfVWZjcM8LOZJhKnH7RC0jTuNf2J+NOvHoV1cGN7gwXNbT5P
   KJo/LWma3kn+3+0H4yNvhE8LScaKQMjGBclwI18MW11RCD3h2GQS40M8g
   BmBcXBW1J4hedbzDKgHgkETZAezHsnZMcFmVLQTCIlwzS3raSM4Kt3YeU
   Uq8j84QDidApXNGmG9k/IW3KkvASDRA3OzF5nEk9M056xjyWfw//ROqWl
   Cb/grfrr7FU4AIk6ydOx00RZIdqKHwBcbgtUfdo7Mza6G8aR1Rsb7uV33
   VRqvC2XDrC+ZJ0ENfT/1g/Q3NMGvWO5cwkgZdiikY7LVs+horIiD5fD8z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906510"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906510"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191177"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191177"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006LW-1e;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/nfsd/nfs4state.c:5708 manage_cpntf_state() warn: can 'state' even
 be NULL?
Message-ID: <202312031425.LffZTarR-lkp@intel.com>
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
TO: Olga Kornievskaia <kolga@netapp.com>
CC: "J. Bruce Fields" <bfields@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: ce0887ac96d35c7105090e166bb0807dc0a0e838 NFSD add nfs4 inter ssc to nfsd4_copy
date:   4 years ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 years ago
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231203/202312031425.LffZTarR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031425.LffZTarR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312031425.LffZTarR-lkp@intel.com/

smatch warnings:
fs/nfsd/nfs4state.c:5708 manage_cpntf_state() warn: can 'state' even be NULL?

vim +/state +5708 fs/nfsd/nfs4state.c

a0649b2d3fffb1 Christoph Hellwig 2015-06-18  5642  
af90f707fa6d54 Christoph Hellwig 2015-06-18  5643  static __be32
af90f707fa6d54 Christoph Hellwig 2015-06-18  5644  nfs4_check_file(struct svc_rqst *rqstp, struct svc_fh *fhp, struct nfs4_stid *s,
5c4583b2b78eef Jeff Layton       2019-08-18  5645  		struct nfsd_file **nfp, int flags)
af90f707fa6d54 Christoph Hellwig 2015-06-18  5646  {
af90f707fa6d54 Christoph Hellwig 2015-06-18  5647  	int acc = (flags & RD_STATE) ? NFSD_MAY_READ : NFSD_MAY_WRITE;
eb82dd39374410 Jeff Layton       2019-08-18  5648  	struct nfsd_file *nf;
af90f707fa6d54 Christoph Hellwig 2015-06-18  5649  	__be32 status;
af90f707fa6d54 Christoph Hellwig 2015-06-18  5650  
eb82dd39374410 Jeff Layton       2019-08-18  5651  	nf = nfs4_find_file(s, flags);
eb82dd39374410 Jeff Layton       2019-08-18  5652  	if (nf) {
af90f707fa6d54 Christoph Hellwig 2015-06-18  5653  		status = nfsd_permission(rqstp, fhp->fh_export, fhp->fh_dentry,
af90f707fa6d54 Christoph Hellwig 2015-06-18  5654  				acc | NFSD_MAY_OWNER_OVERRIDE);
5c4583b2b78eef Jeff Layton       2019-08-18  5655  		if (status) {
5c4583b2b78eef Jeff Layton       2019-08-18  5656  			nfsd_file_put(nf);
eb82dd39374410 Jeff Layton       2019-08-18  5657  			goto out;
5c4583b2b78eef Jeff Layton       2019-08-18  5658  		}
af90f707fa6d54 Christoph Hellwig 2015-06-18  5659  	} else {
eb82dd39374410 Jeff Layton       2019-08-18  5660  		status = nfsd_file_acquire(rqstp, fhp, acc, &nf);
af90f707fa6d54 Christoph Hellwig 2015-06-18  5661  		if (status)
af90f707fa6d54 Christoph Hellwig 2015-06-18  5662  			return status;
af90f707fa6d54 Christoph Hellwig 2015-06-18  5663  	}
5c4583b2b78eef Jeff Layton       2019-08-18  5664  	*nfp = nf;
eb82dd39374410 Jeff Layton       2019-08-18  5665  out:
eb82dd39374410 Jeff Layton       2019-08-18  5666  	return status;
af90f707fa6d54 Christoph Hellwig 2015-06-18  5667  }
624322f1adc58a Olga Kornievskaia 2019-10-04  5668  static void
624322f1adc58a Olga Kornievskaia 2019-10-04  5669  _free_cpntf_state_locked(struct nfsd_net *nn, struct nfs4_cpntf_state *cps)
624322f1adc58a Olga Kornievskaia 2019-10-04  5670  {
624322f1adc58a Olga Kornievskaia 2019-10-04  5671  	WARN_ON_ONCE(cps->cp_stateid.sc_type != NFS4_COPYNOTIFY_STID);
624322f1adc58a Olga Kornievskaia 2019-10-04  5672  	if (!refcount_dec_and_test(&cps->cp_stateid.sc_count))
624322f1adc58a Olga Kornievskaia 2019-10-04  5673  		return;
624322f1adc58a Olga Kornievskaia 2019-10-04  5674  	list_del(&cps->cp_list);
624322f1adc58a Olga Kornievskaia 2019-10-04  5675  	idr_remove(&nn->s2s_cp_stateids,
624322f1adc58a Olga Kornievskaia 2019-10-04  5676  		   cps->cp_stateid.stid.si_opaque.so_id);
624322f1adc58a Olga Kornievskaia 2019-10-04  5677  	kfree(cps);
624322f1adc58a Olga Kornievskaia 2019-10-04  5678  }
b7342204253aaa Olga Kornievskaia 2019-09-06  5679  /*
b7342204253aaa Olga Kornievskaia 2019-09-06  5680   * A READ from an inter server to server COPY will have a
b7342204253aaa Olga Kornievskaia 2019-09-06  5681   * copy stateid. Look up the copy notify stateid from the
b7342204253aaa Olga Kornievskaia 2019-09-06  5682   * idr structure and take a reference on it.
b7342204253aaa Olga Kornievskaia 2019-09-06  5683   */
ce0887ac96d35c Olga Kornievskaia 2019-10-09  5684  __be32 manage_cpntf_state(struct nfsd_net *nn, stateid_t *st,
ce0887ac96d35c Olga Kornievskaia 2019-10-09  5685  			  struct nfs4_client *clp,
b7342204253aaa Olga Kornievskaia 2019-09-06  5686  			  struct nfs4_cpntf_state **cps)
b7342204253aaa Olga Kornievskaia 2019-09-06  5687  {
b7342204253aaa Olga Kornievskaia 2019-09-06  5688  	copy_stateid_t *cps_t;
b7342204253aaa Olga Kornievskaia 2019-09-06  5689  	struct nfs4_cpntf_state *state = NULL;
b7342204253aaa Olga Kornievskaia 2019-09-06  5690  
b7342204253aaa Olga Kornievskaia 2019-09-06  5691  	if (st->si_opaque.so_clid.cl_id != nn->s2s_cp_cl_id)
b7342204253aaa Olga Kornievskaia 2019-09-06  5692  		return nfserr_bad_stateid;
b7342204253aaa Olga Kornievskaia 2019-09-06  5693  	spin_lock(&nn->s2s_cp_lock);
b7342204253aaa Olga Kornievskaia 2019-09-06  5694  	cps_t = idr_find(&nn->s2s_cp_stateids, st->si_opaque.so_id);
b7342204253aaa Olga Kornievskaia 2019-09-06  5695  	if (cps_t) {
b7342204253aaa Olga Kornievskaia 2019-09-06  5696  		state = container_of(cps_t, struct nfs4_cpntf_state,
b7342204253aaa Olga Kornievskaia 2019-09-06  5697  				     cp_stateid);
b7342204253aaa Olga Kornievskaia 2019-09-06  5698  		if (state->cp_stateid.sc_type != NFS4_COPYNOTIFY_STID)
b7342204253aaa Olga Kornievskaia 2019-09-06  5699  			return nfserr_bad_stateid;
ce0887ac96d35c Olga Kornievskaia 2019-10-09  5700  		if (!clp)
b7342204253aaa Olga Kornievskaia 2019-09-06  5701  			refcount_inc(&state->cp_stateid.sc_count);
ce0887ac96d35c Olga Kornievskaia 2019-10-09  5702  		else
ce0887ac96d35c Olga Kornievskaia 2019-10-09  5703  			_free_cpntf_state_locked(nn, state);
b7342204253aaa Olga Kornievskaia 2019-09-06  5704  	}
b7342204253aaa Olga Kornievskaia 2019-09-06  5705  	spin_unlock(&nn->s2s_cp_lock);
b7342204253aaa Olga Kornievskaia 2019-09-06  5706  	if (!state)
b7342204253aaa Olga Kornievskaia 2019-09-06  5707  		return nfserr_bad_stateid;
ce0887ac96d35c Olga Kornievskaia 2019-10-09 @5708  	if (!clp && state)
b7342204253aaa Olga Kornievskaia 2019-09-06  5709  		*cps = state;
b7342204253aaa Olga Kornievskaia 2019-09-06  5710  	return 0;
b7342204253aaa Olga Kornievskaia 2019-09-06  5711  }
b7342204253aaa Olga Kornievskaia 2019-09-06  5712  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

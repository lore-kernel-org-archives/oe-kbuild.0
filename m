Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC5197
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Apr 2023 00:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682640935; x=1714176935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cS2Lr1K42LP+gaHoU61orezalu4RiV6qRqVh2s7iBmI=;
  b=F6KhYiym2Rsqv8buxvR4VCPP5hOm/6ykUvE1yId0y16K56+WSNoJGAUl
   CNGmHOxgDOK1M+LG3KmIC3fCRJ4Rjzp2XOkg5NcnJpMVIHYXqAzWck0pn
   dU5oaDjaEydQkw5shxMjio51lxSokobOTJ0kkfyvDuMid0aFftGwZWF7F
   9D4WVyQGYEPQ69+p9zWxoh11DwJIW9wJmQv56WNH4d68o4/r12NNZb3/n
   Bn6OOqetY3Nbf4H4vIcBjJ64k/QNmANd2ynbRu89z4iBXlUW/4xNayL8z
   IhpEfeItErWLCcvDcp7tLk6zvqhgVKuIGJxwc7VRQb05AP6mvGyG0ewrH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="412989411"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="412989411"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 17:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868940772"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="868940772"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 17:15:30 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psBlq-0000DW-07;
	Fri, 28 Apr 2023 00:15:30 +0000
Date: Fri, 28 Apr 2023 08:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/cifs/dfs_cache.c:832 cache_refresh_path() warn: inconsistent
 returns '&htable_rw_lock'.
Message-ID: <202304280845.2mWZ9TLV-lkp@intel.com>
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
TO: Paulo Alcantara <pc@cjr.nz>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d06f5a3f7140921ada47d49574ae6fa4de5e2a89
commit: 48d240bf00af943db6f069a53f090e444e85f760 cifs: avoid re-lookups in dfs_cache_find()
date:   3 months ago
:::::: branch date: 52 minutes ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-m041-20230423 (https://download.01.org/0day-ci/archive/20230428/202304280845.2mWZ9TLV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304280845.2mWZ9TLV-lkp@intel.com/

New smatch warnings:
fs/cifs/dfs_cache.c:832 cache_refresh_path() warn: inconsistent returns '&htable_rw_lock'.

Old smatch warnings:
fs/cifs/dfs_cache.c:488 copy_ref_data() warn: passing a valid pointer to 'PTR_ERR'
fs/cifs/dfs_cache.c:1082 dfs_cache_update_tgthint() error: uninitialized symbol 'rc'.

vim +832 fs/cifs/dfs_cache.c

54be1f6c1c3749 Paulo Alcantara        2018-11-14  762  
54be1f6c1c3749 Paulo Alcantara        2018-11-14  763  /*
54be1f6c1c3749 Paulo Alcantara        2018-11-14  764   * Find, create or update a DFS cache entry.
54be1f6c1c3749 Paulo Alcantara        2018-11-14  765   *
54be1f6c1c3749 Paulo Alcantara        2018-11-14  766   * If the entry wasn't found, it will create a new one. Or if it was found but
54be1f6c1c3749 Paulo Alcantara        2018-11-14  767   * expired, then it will update the entry accordingly.
54be1f6c1c3749 Paulo Alcantara        2018-11-14  768   *
c9f71103990591 Paulo Alcantara        2021-06-04  769   * For interlinks, cifs_mount() and expand_dfs_referral() are supposed to
54be1f6c1c3749 Paulo Alcantara        2018-11-14  770   * handle them properly.
48d240bf00af94 Paulo Alcantara        2023-01-17  771   *
48d240bf00af94 Paulo Alcantara        2023-01-17  772   * On success, return entry with acquired lock for reading, otherwise error ptr.
54be1f6c1c3749 Paulo Alcantara        2018-11-14  773   */
48d240bf00af94 Paulo Alcantara        2023-01-17  774  static struct cache_entry *cache_refresh_path(const unsigned int xid,
48d240bf00af94 Paulo Alcantara        2023-01-17  775  					      struct cifs_ses *ses,
48d240bf00af94 Paulo Alcantara        2023-01-17  776  					      const char *path)
54be1f6c1c3749 Paulo Alcantara        2018-11-14  777  {
742d8de0186e9f Paulo Alcantara (SUSE  2019-12-04  778) 	struct dfs_info3_param *refs = NULL;
9fb0db40513e27 Paulo Alcantara        2023-01-17  779  	struct cache_entry *ce;
742d8de0186e9f Paulo Alcantara (SUSE  2019-12-04  780) 	int numrefs = 0;
9fb0db40513e27 Paulo Alcantara        2023-01-17  781  	int rc;
54be1f6c1c3749 Paulo Alcantara        2018-11-14  782  
54be1f6c1c3749 Paulo Alcantara        2018-11-14  783  	cifs_dbg(FYI, "%s: search path: %s\n", __func__, path);
54be1f6c1c3749 Paulo Alcantara        2018-11-14  784  
9fb0db40513e27 Paulo Alcantara        2023-01-17  785  	down_read(&htable_rw_lock);
742d8de0186e9f Paulo Alcantara (SUSE  2019-12-04  786) 
42caeba713b12e Paulo Alcantara        2021-06-04  787  	ce = lookup_cache_entry(path);
48d240bf00af94 Paulo Alcantara        2023-01-17  788  	if (!IS_ERR(ce) && !cache_entry_expired(ce))
48d240bf00af94 Paulo Alcantara        2023-01-17  789  		return ce;
48d240bf00af94 Paulo Alcantara        2023-01-17  790  
9fb0db40513e27 Paulo Alcantara        2023-01-17  791  	/*
9fb0db40513e27 Paulo Alcantara        2023-01-17  792  	 * Unlock shared access as we don't want to hold any locks while getting
9fb0db40513e27 Paulo Alcantara        2023-01-17  793  	 * a new referral.  The @ses used for performing the I/O could be
9fb0db40513e27 Paulo Alcantara        2023-01-17  794  	 * reconnecting and it acquires @htable_rw_lock to look up the dfs cache
9fb0db40513e27 Paulo Alcantara        2023-01-17  795  	 * in order to failover -- if necessary.
9fb0db40513e27 Paulo Alcantara        2023-01-17  796  	 */
9fb0db40513e27 Paulo Alcantara        2023-01-17  797  	up_read(&htable_rw_lock);
54be1f6c1c3749 Paulo Alcantara        2018-11-14  798  
742d8de0186e9f Paulo Alcantara (SUSE  2019-12-04  799) 	/*
c9f71103990591 Paulo Alcantara        2021-06-04  800  	 * Either the entry was not found, or it is expired.
c9f71103990591 Paulo Alcantara        2021-06-04  801  	 * Request a new DFS referral in order to create or update a cache entry.
742d8de0186e9f Paulo Alcantara (SUSE  2019-12-04  802) 	 */
c870a8e70e6827 Paulo Alcantara        2021-06-04  803  	rc = get_dfs_referral(xid, ses, path, &refs, &numrefs);
48d240bf00af94 Paulo Alcantara        2023-01-17  804  	if (rc) {
48d240bf00af94 Paulo Alcantara        2023-01-17  805  		ce = ERR_PTR(rc);
9fb0db40513e27 Paulo Alcantara        2023-01-17  806  		goto out;
48d240bf00af94 Paulo Alcantara        2023-01-17  807  	}
54be1f6c1c3749 Paulo Alcantara        2018-11-14  808  
742d8de0186e9f Paulo Alcantara (SUSE  2019-12-04  809) 	dump_refs(refs, numrefs);
54be1f6c1c3749 Paulo Alcantara        2018-11-14  810  
9fb0db40513e27 Paulo Alcantara        2023-01-17  811  	down_write(&htable_rw_lock);
9fb0db40513e27 Paulo Alcantara        2023-01-17  812  	/* Re-check as another task might have it added or refreshed already */
9fb0db40513e27 Paulo Alcantara        2023-01-17  813  	ce = lookup_cache_entry(path);
9fb0db40513e27 Paulo Alcantara        2023-01-17  814  	if (!IS_ERR(ce)) {
48d240bf00af94 Paulo Alcantara        2023-01-17  815  		if (cache_entry_expired(ce)) {
1023e90b733acd Paulo Alcantara        2021-06-08  816  			rc = update_cache_entry_locked(ce, refs, numrefs);
48d240bf00af94 Paulo Alcantara        2023-01-17  817  			if (rc)
48d240bf00af94 Paulo Alcantara        2023-01-17  818  				ce = ERR_PTR(rc);
48d240bf00af94 Paulo Alcantara        2023-01-17  819  		}
9fb0db40513e27 Paulo Alcantara        2023-01-17  820  	} else {
48d240bf00af94 Paulo Alcantara        2023-01-17  821  		ce = add_cache_entry_locked(refs, numrefs);
9fb0db40513e27 Paulo Alcantara        2023-01-17  822  	}
54be1f6c1c3749 Paulo Alcantara        2018-11-14  823  
48d240bf00af94 Paulo Alcantara        2023-01-17  824  	if (IS_ERR(ce)) {
c9f71103990591 Paulo Alcantara        2021-06-04  825  		up_write(&htable_rw_lock);
48d240bf00af94 Paulo Alcantara        2023-01-17  826  		goto out;
48d240bf00af94 Paulo Alcantara        2023-01-17  827  	}
48d240bf00af94 Paulo Alcantara        2023-01-17  828  
48d240bf00af94 Paulo Alcantara        2023-01-17  829  	downgrade_write(&htable_rw_lock);
9fb0db40513e27 Paulo Alcantara        2023-01-17  830  out:
742d8de0186e9f Paulo Alcantara (SUSE  2019-12-04  831) 	free_dfs_info_array(refs, numrefs);
48d240bf00af94 Paulo Alcantara        2023-01-17 @832  	return ce;
54be1f6c1c3749 Paulo Alcantara        2018-11-14  833  }
54be1f6c1c3749 Paulo Alcantara        2018-11-14  834  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EBE811
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Jul 2023 03:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690084720; x=1721620720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oLNv9zOJl40lItWzuEPFXYK2WWynhbQNHocfu58n4iA=;
  b=Lbs3zfdrpkferfUmfMA0L4x9ZCV1Xjp6fbC7o2pfVbv+laks1l3WBsxg
   B8JHaGeUe20og1ty/oaKAYCetc7eEH+aR0mj8zp5zC1jHg5tekGQ/8cuV
   j6RPtScEqivDYpPlIDEeruW0svALl24iNL86poKd5ImT3XDWYPs2HA3Yv
   sE2NUgcCKR8afaRhBi2+1PWeRCzsDNzXGRzdaf/pvNWaou6txWSd4P6s8
   IAxCivS7SjLJBBBSmrsPOeFlHKrKGp8KQHGAcy0WaPw9L2OY0+4SmGIe4
   QRE26hdi1ozgCrmiI+iJaJX9PVUUu9M1T3y7DNhqUPr8ezYJNHV0uj/pp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="398145275"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="398145275"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 20:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="728514870"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="728514870"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Jul 2023 20:58:38 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNQEv-0008oH-2P;
	Sun, 23 Jul 2023 03:58:37 +0000
Date: Sun, 23 Jul 2023 11:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/client/dfs_cache.c:750 cache_refresh_path() warn:
 inconsistent returns '&htable_rw_lock'.
Message-ID: <202307231110.D2DlDq9B-lkp@intel.com>
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
TO: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   295e1388de2d5c0c354adbd65d0319c5d636c222
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   8 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-m021-20230723 (https://download.01.org/0day-ci/archive/20230723/202307231110.D2DlDq9B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307231110.D2DlDq9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307231110.D2DlDq9B-lkp@intel.com/

New smatch warnings:
fs/smb/client/dfs_cache.c:750 cache_refresh_path() warn: inconsistent returns '&htable_rw_lock'.

Old smatch warnings:
fs/smb/client/dfs_cache.c:403 copy_ref_data() warn: passing a valid pointer to 'PTR_ERR'

vim +750 fs/smb/client/dfs_cache.c

54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  673  
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  674  /*
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  675   * Find, create or update a DFS cache entry.
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  676   *
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  677   * If the entry wasn't found, it will create a new one. Or if it was found but
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  678   * expired, then it will update the entry accordingly.
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  679   *
c9f71103990591 fs/cifs/dfs_cache.c Paulo Alcantara        2021-06-04  680   * For interlinks, cifs_mount() and expand_dfs_referral() are supposed to
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  681   * handle them properly.
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  682   *
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  683   * On success, return entry with acquired lock for reading, otherwise error ptr.
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  684   */
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  685  static struct cache_entry *cache_refresh_path(const unsigned int xid,
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  686  					      struct cifs_ses *ses,
8064f711c6a461 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  687  					      const char *path,
8064f711c6a461 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  688  					      bool force_refresh)
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  689  {
742d8de0186e9f fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  690) 	struct dfs_info3_param *refs = NULL;
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  691  	struct cache_entry *ce;
742d8de0186e9f fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  692) 	int numrefs = 0;
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  693  	int rc;
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  694  
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  695  	cifs_dbg(FYI, "%s: search path: %s\n", __func__, path);
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  696  
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  697  	down_read(&htable_rw_lock);
742d8de0186e9f fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  698) 
42caeba713b12e fs/cifs/dfs_cache.c Paulo Alcantara        2021-06-04  699  	ce = lookup_cache_entry(path);
3deddb77fdd932 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  700  	if (!IS_ERR(ce)) {
3deddb77fdd932 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  701  		if (!force_refresh && !cache_entry_expired(ce))
3deddb77fdd932 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  702  			return ce;
3deddb77fdd932 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  703  	} else if (PTR_ERR(ce) != -ENOENT) {
3deddb77fdd932 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  704  		up_read(&htable_rw_lock);
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  705  		return ce;
3deddb77fdd932 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  706  	}
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  707  
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  708  	/*
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  709  	 * Unlock shared access as we don't want to hold any locks while getting
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  710  	 * a new referral.  The @ses used for performing the I/O could be
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  711  	 * reconnecting and it acquires @htable_rw_lock to look up the dfs cache
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  712  	 * in order to failover -- if necessary.
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  713  	 */
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  714  	up_read(&htable_rw_lock);
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  715  
742d8de0186e9f fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  716) 	/*
8064f711c6a461 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  717  	 * Either the entry was not found, or it is expired, or it is a forced
8064f711c6a461 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  718  	 * refresh.
c9f71103990591 fs/cifs/dfs_cache.c Paulo Alcantara        2021-06-04  719  	 * Request a new DFS referral in order to create or update a cache entry.
742d8de0186e9f fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  720) 	 */
c870a8e70e6827 fs/cifs/dfs_cache.c Paulo Alcantara        2021-06-04  721  	rc = get_dfs_referral(xid, ses, path, &refs, &numrefs);
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  722  	if (rc) {
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  723  		ce = ERR_PTR(rc);
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  724  		goto out;
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  725  	}
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  726  
742d8de0186e9f fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  727) 	dump_refs(refs, numrefs);
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  728  
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  729  	down_write(&htable_rw_lock);
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  730  	/* Re-check as another task might have it added or refreshed already */
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  731  	ce = lookup_cache_entry(path);
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  732  	if (!IS_ERR(ce)) {
8064f711c6a461 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  733  		if (force_refresh || cache_entry_expired(ce)) {
1023e90b733acd fs/cifs/dfs_cache.c Paulo Alcantara        2021-06-08  734  			rc = update_cache_entry_locked(ce, refs, numrefs);
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  735  			if (rc)
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  736  				ce = ERR_PTR(rc);
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  737  		}
3deddb77fdd932 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  738  	} else if (PTR_ERR(ce) == -ENOENT) {
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  739  		ce = add_cache_entry_locked(refs, numrefs);
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  740  	}
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  741  
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  742  	if (IS_ERR(ce)) {
c9f71103990591 fs/cifs/dfs_cache.c Paulo Alcantara        2021-06-04  743  		up_write(&htable_rw_lock);
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  744  		goto out;
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  745  	}
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  746  
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  747  	downgrade_write(&htable_rw_lock);
9fb0db40513e27 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  748  out:
742d8de0186e9f fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  749) 	free_dfs_info_array(refs, numrefs);
48d240bf00af94 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17 @750  	return ce;
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  751  }
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  752  

:::::: The code at line 750 was first introduced by commit
:::::: 48d240bf00af943db6f069a53f090e444e85f760 cifs: avoid re-lookups in dfs_cache_find()

:::::: TO: Paulo Alcantara <pc@cjr.nz>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

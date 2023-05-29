Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE67A53
	for <oe-kbuild@lists.linux.dev>; Mon, 29 May 2023 10:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685357273; x=1716893273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7yuhB/tr4RAEBh1dUazB6In1EdlQY97iJQ4vvXi7I1w=;
  b=VSiP8bclmkDZ1L/5X+JYD2omqbOPV/Fn+RxhC9nVGWOI8O5lyHqbSHKd
   vK8295YWSNxTVXxivGN1XQ4jNBec1ryENAzf205dBRD0PMuVJBwBpLB9r
   LiTYUZvR1V8XLNpIZUqxmRENI8B4pm2CJ+36c5/gfev1gtB147GNp5/4V
   uun0ht4ovWXnJtJ0FxUCowcDkyLFZE9wXAV8JQxPh7MfTwSC920JOAC84
   uUMFdBZ5MMI6KRSEgMFXpn7gyGERmr/0ovMUX53ve6bewQooEbV1iWC12
   yi6KrwZ2hHwLgsiDSkPYL0XA2Kw11H/9ce4AInFlwFtZPwl9ZLckpmoZq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="357928803"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="357928803"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="771126618"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="771126618"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 May 2023 03:47:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3aPn-000Kyc-0a;
	Mon, 29 May 2023 10:47:51 +0000
Date: Mon, 29 May 2023 18:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/client/dfs_cache.c:403 copy_ref_data() warn: passing a valid
 pointer to 'PTR_ERR'
Message-ID: <202305291817.4nBE0sf4-lkp@intel.com>
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
head:   e338142b39cf40155054f95daa28d210d2ee1b2d
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   5 days ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-m021-20230529 (https://download.01.org/0day-ci/archive/20230529/202305291817.4nBE0sf4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305291817.4nBE0sf4-lkp@intel.com/

smatch warnings:
fs/smb/client/dfs_cache.c:403 copy_ref_data() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +403 fs/smb/client/dfs_cache.c

54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  379  
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  380  /*
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  381   * Copy DFS referral information to a cache entry and conditionally update
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  382   * target hint.
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  383   */
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  384  static int copy_ref_data(const struct dfs_info3_param *refs, int numrefs,
185352ae6171c8 fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  385) 			 struct cache_entry *ce, const char *tgthint)
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  386  {
11c8b3f8493cb5 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  387  	struct cache_dfs_tgt *target;
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  388  	int i;
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  389  
c950fc7af9a7c2 fs/cifs/dfs_cache.c Paulo Alcantara        2021-06-04  390  	ce->ttl = max_t(int, refs[0].ttl, CACHE_MIN_TTL);
185352ae6171c8 fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  391) 	ce->etime = get_expire_time(ce->ttl);
185352ae6171c8 fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  392) 	ce->srvtype = refs[0].server_type;
5ff2836ed3a5c2 fs/cifs/dfs_cache.c Paulo Alcantara        2021-02-24  393  	ce->hdr_flags = refs[0].flags;
5ff2836ed3a5c2 fs/cifs/dfs_cache.c Paulo Alcantara        2021-02-24  394  	ce->ref_flags = refs[0].ref_flag;
185352ae6171c8 fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  395) 	ce->path_consumed = refs[0].path_consumed;
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  396  
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  397  	for (i = 0; i < numrefs; i++) {
185352ae6171c8 fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  398) 		struct cache_dfs_tgt *t;
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  399  
7548e1da8d2d34 fs/cifs/dfs_cache.c Paulo Alcantara        2020-07-21  400  		t = alloc_target(refs[i].node_name, refs[i].path_consumed);
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  401  		if (IS_ERR(t)) {
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  402  			free_tgts(ce);
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14 @403  			return PTR_ERR(t);
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  404  		}
185352ae6171c8 fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  405) 		if (tgthint && !strcasecmp(t->name, tgthint)) {
185352ae6171c8 fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  406) 			list_add(&t->list, &ce->tlist);
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  407  			tgthint = NULL;
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  408  		} else {
185352ae6171c8 fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  409) 			list_add_tail(&t->list, &ce->tlist);
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  410  		}
185352ae6171c8 fs/cifs/dfs_cache.c Paulo Alcantara (SUSE  2019-12-04  411) 		ce->numtgts++;
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  412  	}
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  413  
11c8b3f8493cb5 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  414  	target = list_first_entry_or_null(&ce->tlist, struct cache_dfs_tgt,
11c8b3f8493cb5 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  415  					  list);
11c8b3f8493cb5 fs/cifs/dfs_cache.c Paulo Alcantara        2023-01-17  416  	WRITE_ONCE(ce->tgthint, target);
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  417  
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  418  	return 0;
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  419  }
54be1f6c1c3749 fs/cifs/dfs_cache.c Paulo Alcantara        2018-11-14  420  

:::::: The code at line 403 was first introduced by commit
:::::: 54be1f6c1c37498bba557049df646cc239fa37e3 cifs: Add DFS cache routines

:::::: TO: Paulo Alcantara <palcantara@suse.de>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A79185B
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 07:49:02 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b70bfc8db5so55942351fa.2
        for <oe-kbuild@lists.linux.dev>; Mon, 24 Jul 2023 00:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690184940; x=1690789740;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VGFCCeg2byd2qpHnykIbQNcCUC+/iaRSYwJUr21hqv0=;
        b=OygH/B4P60d/08GcNqBfcwRPiqXI3HpJr+TwA59TPKg+67U/86cITcUYi7fNrUCOsh
         FI8Q2doTAxER+MBRfTOMvF7apCtB0rDdicD7zwE8x1uIHjKNOUaN3t/l4QReTrdlNLnt
         ddUL18EiHX3qe9HSEho9uLU8WFP+W92bPycaULowuw7Q6Yae8KvMCmkPfS2hnItIfAJF
         D2j3tIjGf1tkFcAVx2cDhzsN4AvLJXFcVTvFYWtBYqgXBsqbh33w1b5C8zBFb4CkpeUt
         o4uhjUWKSHV4HqXc8JgYH2CIxz2F+jxX0Wib9UC2dcdMkqczUk/2l3Av19YkIIrgVM99
         vLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690184940; x=1690789740;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGFCCeg2byd2qpHnykIbQNcCUC+/iaRSYwJUr21hqv0=;
        b=Pj6NBSWy3bbcDMlJqKti9JMhMPlnQ11G39nkxGZe+Q1L5hKjLCq/7gwQOaQx44h8y+
         vihoa7ml+lulUcPUAwVM/xjATzP0eQGMdyjgcHhSXAmPflIQq44aX+fnI1TI+cw5aPFs
         kF+CvjqlyKJuAyV7C3/3hPXn5zaWP/WIgaoqUjs5lC930F2iZh2xonQBYnQ48DxjLHKJ
         LNnPW9xrgNsShfWiycTj+uENWGJqbohuRlxaXmvzqGhqmVc0Bap1jWnAIe+5Pik1D78K
         sYRlsBmx+jst1bNjh6ZRKj7Iuz7nKOIigh6OIPHbshh6wqz9bu2nKVWGIedmFIdFx3kJ
         L9aw==
X-Gm-Message-State: ABy/qLbqan+dyQlbxtw5ZY+HlgoCvmhrMbz8zcBvDIdDiFNpEzhptKr+
	ruNB0/QTpHHA8gxV9dKgTFKoUxaZWnWd04FFxE8=
X-Google-Smtp-Source: APBJJlFS+YxymqSyaSgKgMWRHZEXV72PB7gTsbnol+aUZEWOebWGk3pz7kRD0nnKJRtI1w4KteFuNw==
X-Received: by 2002:a05:651c:21b:b0:2b6:e128:e7a3 with SMTP id y27-20020a05651c021b00b002b6e128e7a3mr5267999ljn.33.1690184940059;
        Mon, 24 Jul 2023 00:49:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q3-20020a05600c46c300b003fc3b03caa5sm12302287wmo.1.2023.07.24.00.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 00:48:59 -0700 (PDT)
Date: Mon, 24 Jul 2023 10:48:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steve French <stfrench@microsoft.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: fs/smb/client/dfs_cache.c:750 cache_refresh_path() warn:
 inconsistent returns '&htable_rw_lock'.
Message-ID: <a0160841-6ea2-4989-8250-877ee9d82c82@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   295e1388de2d5c0c354adbd65d0319c5d636c222
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
config: i386-randconfig-m021-20230723 (https://download.01.org/0day-ci/archive/20230723/202307231110.D2DlDq9B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307231110.D2DlDq9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307231110.D2DlDq9B-lkp@intel.com/

New smatch warnings:
fs/smb/client/dfs_cache.c:750 cache_refresh_path() warn: inconsistent returns '&htable_rw_lock'.

Old smatch warnings:
fs/smb/client/dfs_cache.c:403 copy_ref_data() warn: passing a valid pointer to 'PTR_ERR'

vim +750 fs/smb/client/dfs_cache.c

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

Call up_read(&htable_rw_lock) before returning

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


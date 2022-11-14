Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371521FBE;
	Mon, 14 Nov 2022 08:26:35 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id bj12so26332037ejb.13;
        Mon, 14 Nov 2022 00:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnuZYJhotCxb8YG9McpBbbHnrBB6ONTsO29/0s7+tbA=;
        b=NAUp9zXL8jQpQEG6kgb1zHcSQ7KF51WfPVXPSp/c2LvSycMTg0EXOwxCdWEvhN3ey5
         vBLp99vWcrrsMIqDx7bxjPOEB24iKvh+gp+v06phacJSxE1zrHM6v5RcPMkwxJ73Fs5e
         OGjBC6TquE7jYfoRhOVjEBnJ2+7+wOs926qp3bMfz038GtHfHwJpNIi9VpkXZguv5M/4
         yjZs1+OnWTeWP5mbdUcDE5F9wjnlIQFN/pn7HCNIJK0j74eRmGd2ye5F5xcyU3G0inVC
         FRXiB7g0x2F/xg9x1CGaeSgONbrkWZx5MO0Pq1d84dfmHMCIEaXg33fvpEaO6ee5Boye
         PJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnuZYJhotCxb8YG9McpBbbHnrBB6ONTsO29/0s7+tbA=;
        b=17tbpK8EGWPcxIW3pKOTgYn/TGGDuObsYP8ACirPCoCbvsz/WF6+muwR27X6DdQkuv
         AUjtTV2DY5t6Mr/6+Iy040L5j5GwG2Ay+4d4FIbejDJJZtJfrqM4zpqifOeLGCyTqJpX
         o7D69lde+cnZze9RLD6gmu70E7WeMsfw8tzAhxxqXquiyQWSfgcrjiM464vSdRkTIZd/
         uLH62goCISGgi8AaESscGOzwQzvScP1J19pBgY0+Slfuj6aiHLROljAmlqTi17Sk/oPN
         CFtKOHCzIVixphCAUGA0/MEpQK7/tLYPplPKn105tpZ9hYjs0raSk2xjjpvpCzuuZaOn
         pPeg==
X-Gm-Message-State: ANoB5pn2JhpcN+xkiv4JoRcROCjOeBf1ELjk/YVZJC2Y5dn/NNK8fELl
	f7MfI0LCEpXfh8PJfngnWk1c8P4XJ6jhUw==
X-Google-Smtp-Source: AA0mqf7MdtOc/mSoJ6XApSrxt7dFwmyMNaxp9RgzYNdEkgf9lWKxQD1FSvIDQ4WPMrrlReUFW3ALuQ==
X-Received: by 2002:a17:906:4a4c:b0:7ad:f6ef:e6c8 with SMTP id a12-20020a1709064a4c00b007adf6efe6c8mr8898838ejv.541.1668414392973;
        Mon, 14 Nov 2022 00:26:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d18-20020a056402401200b004580862ffdbsm4511088eda.59.2022.11.14.00.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 00:26:32 -0800 (PST)
Date: Mon, 14 Nov 2022 11:26:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 461/498]
 fs/xfs/libxfs/xfs_refcount.c:2007 xfs_refcount_recover_group_cow_leftovers()
 error: we previously assumed 'pag' could be null (see line 1944)
Message-ID: <202211131931.iBIVNoRG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221114082628.visPQhHuLzDAlt2LvHpQkVBjQX3dM_TUFfxE-HMDRhw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   37fb90fd6eb0a30eb7133a2ca9ead780b574ed69
commit: aa00406b3a9251a3a0f7f622ad54d9c34255cd33 [461/498] xfs: refcover CoW leftovers in the realtime volume
config: m68k-randconfig-m041-20221110
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:2007 xfs_refcount_recover_group_cow_leftovers() error: we previously assumed 'pag' could be null (see line 1944)

vim +/pag +2007 fs/xfs/libxfs/xfs_refcount.c

aa00406b3a9251 Darrick J. Wong 2022-07-14  1926  static int
aa00406b3a9251 Darrick J. Wong 2022-07-14  1927  xfs_refcount_recover_group_cow_leftovers(
174edb0e46e520 Darrick J. Wong 2016-10-03  1928  	struct xfs_mount		*mp,
aa00406b3a9251 Darrick J. Wong 2022-07-14  1929  	struct xfs_perag		*pag,
aa00406b3a9251 Darrick J. Wong 2022-07-14  1930  	struct xfs_rtgroup		*rtg)
174edb0e46e520 Darrick J. Wong 2016-10-03  1931  {
174edb0e46e520 Darrick J. Wong 2016-10-03  1932  	struct xfs_trans		*tp;
174edb0e46e520 Darrick J. Wong 2016-10-03  1933  	struct xfs_btree_cur		*cur;
aa00406b3a9251 Darrick J. Wong 2022-07-14  1934  	struct xfs_buf			*agbp = NULL;
174edb0e46e520 Darrick J. Wong 2016-10-03  1935  	struct xfs_refcount_recovery	*rr, *n;
174edb0e46e520 Darrick J. Wong 2016-10-03  1936  	struct list_head		debris;
174edb0e46e520 Darrick J. Wong 2016-10-03  1937  	union xfs_btree_irec		low;
174edb0e46e520 Darrick J. Wong 2016-10-03  1938  	union xfs_btree_irec		high;
174edb0e46e520 Darrick J. Wong 2016-10-03  1939  	xfs_fsblock_t			fsb;
174edb0e46e520 Darrick J. Wong 2016-10-03  1940  	int				error;
174edb0e46e520 Darrick J. Wong 2016-10-03  1941  
f1fdc820784067 Darrick J. Wong 2022-10-27  1942  	/* reflink filesystems mustn't have AGs larger than 2^31-1 blocks */
8b972158afcaa6 Darrick J. Wong 2022-10-10  1943  	BUILD_BUG_ON(XFS_MAX_CRC_AG_BLOCKS >= XFS_REFC_COWFLAG);
aa00406b3a9251 Darrick J. Wong 2022-07-14 @1944  	if (pag && mp->m_sb.sb_agblocks > XFS_MAX_CRC_AG_BLOCKS)
                                                            ^^^
Can "pag" be NULL?

aa00406b3a9251 Darrick J. Wong 2022-07-14  1945  		return -EOPNOTSUPP;
aa00406b3a9251 Darrick J. Wong 2022-07-14  1946  
aa00406b3a9251 Darrick J. Wong 2022-07-14  1947  	/* rtreflink filesystems can't have rtgroups larger than 2^31-1 blocks */
aa00406b3a9251 Darrick J. Wong 2022-07-14  1948  	BUILD_BUG_ON(XFS_MAX_RGBLOCKS >= XFS_REFC_COWFLAG);
aa00406b3a9251 Darrick J. Wong 2022-07-14  1949  	if (rtg && mp->m_sb.sb_rgblocks >= XFS_MAX_RGBLOCKS)
174edb0e46e520 Darrick J. Wong 2016-10-03  1950  		return -EOPNOTSUPP;
174edb0e46e520 Darrick J. Wong 2016-10-03  1951  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1952  	INIT_LIST_HEAD(&debris);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1953  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1954  	/*
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1955  	 * In this first part, we use an empty transaction to gather up
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1956  	 * all the leftover CoW extents so that we can subsequently
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1957  	 * delete them.  The empty transaction is used to avoid
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1958  	 * a buffer lock deadlock if there happens to be a loop in the
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1959  	 * refcountbt because we're allowed to re-grab a buffer that is
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1960  	 * already attached to our transaction.  When we're done
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1961  	 * recording the CoW debris we cancel the (empty) transaction
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1962  	 * and everything goes away cleanly.
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1963  	 */
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1964  	error = xfs_trans_alloc_empty(mp, &tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  1965  	if (error)
174edb0e46e520 Darrick J. Wong 2016-10-03  1966  		return error;
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1967  
aa00406b3a9251 Darrick J. Wong 2022-07-14  1968  	if (rtg) {
aa00406b3a9251 Darrick J. Wong 2022-07-14  1969  		xfs_rtgroup_lock(NULL, rtg, XFS_RTGLOCK_REFCOUNT);
aa00406b3a9251 Darrick J. Wong 2022-07-14  1970  		cur = xfs_rtrefcountbt_init_cursor(mp, tp, rtg,
aa00406b3a9251 Darrick J. Wong 2022-07-14  1971  				rtg->rtg_refcountip);
aa00406b3a9251 Darrick J. Wong 2022-07-14  1972  	} else {
08d3e84feeb8cb Dave Chinner    2022-07-07  1973  		error = xfs_alloc_read_agf(pag, tp, 0, &agbp);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1974  		if (error)
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1975  			goto out_trans;
a81a06211fb43d Dave Chinner    2021-06-02  1976  		cur = xfs_refcountbt_init_cursor(mp, tp, agbp, pag);
aa00406b3a9251 Darrick J. Wong 2022-07-14  1977  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  1978  
174edb0e46e520 Darrick J. Wong 2016-10-03  1979  	/* Find all the leftover CoW staging extents. */
174edb0e46e520 Darrick J. Wong 2016-10-03  1980  	memset(&low, 0, sizeof(low));
174edb0e46e520 Darrick J. Wong 2016-10-03  1981  	memset(&high, 0, sizeof(high));
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10  1982  	low.rc.rc_domain = high.rc.rc_domain = XFS_REFC_DOMAIN_COW;
174edb0e46e520 Darrick J. Wong 2016-10-03  1983  	high.rc.rc_startblock = -1U;
174edb0e46e520 Darrick J. Wong 2016-10-03  1984  	error = xfs_btree_query_range(cur, &low, &high,
174edb0e46e520 Darrick J. Wong 2016-10-03  1985  			xfs_refcount_recover_extent, &debris);
ef97ef26d263fb Darrick J. Wong 2018-07-19  1986  	xfs_btree_del_cursor(cur, error);
aa00406b3a9251 Darrick J. Wong 2022-07-14  1987  	if (agbp)
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1988  		xfs_trans_brelse(tp, agbp);
aa00406b3a9251 Darrick J. Wong 2022-07-14  1989  	else
aa00406b3a9251 Darrick J. Wong 2022-07-14  1990  		xfs_rtgroup_unlock(rtg, XFS_RTGLOCK_REFCOUNT);
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1991  	xfs_trans_cancel(tp);
ef97ef26d263fb Darrick J. Wong 2018-07-19  1992  	if (error)
ef97ef26d263fb Darrick J. Wong 2018-07-19  1993  		goto out_free;
174edb0e46e520 Darrick J. Wong 2016-10-03  1994  
174edb0e46e520 Darrick J. Wong 2016-10-03  1995  	/* Now iterate the list to free the leftovers */
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  1996  	list_for_each_entry_safe(rr, n, &debris, rr_list) {
174edb0e46e520 Darrick J. Wong 2016-10-03  1997  		/* Set up transaction. */
174edb0e46e520 Darrick J. Wong 2016-10-03  1998  		error = xfs_trans_alloc(mp, &M_RES(mp)->tr_write, 0, 0, 0, &tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  1999  		if (error)
174edb0e46e520 Darrick J. Wong 2016-10-03  2000  			goto out_free;
174edb0e46e520 Darrick J. Wong 2016-10-03  2001  
174edb0e46e520 Darrick J. Wong 2016-10-03  2002  		/* Free the orphan record */
aa00406b3a9251 Darrick J. Wong 2022-07-14  2003  		if (rtg)
aa00406b3a9251 Darrick J. Wong 2022-07-14  2004  			fsb = xfs_rgbno_to_rtb(mp, rtg->rtg_rgno,
aa00406b3a9251 Darrick J. Wong 2022-07-14  2005  					rr->rr_rrec.rc_startblock);
aa00406b3a9251 Darrick J. Wong 2022-07-14  2006  		else
9a50ee4f8db6e4 Darrick J. Wong 2022-10-10 @2007  			fsb = XFS_AGB_TO_FSB(mp, pag->pag_agno,
                                                                                                 ^^^^^^^^^^^^^
Unchecked dereference.

9a50ee4f8db6e4 Darrick J. Wong 2022-10-10  2008  					rr->rr_rrec.rc_startblock);
aa00406b3a9251 Darrick J. Wong 2022-07-14  2009  		xfs_refcount_free_cow_extent(tp, rtg != NULL, fsb,
174edb0e46e520 Darrick J. Wong 2016-10-03  2010  				rr->rr_rrec.rc_blockcount);
174edb0e46e520 Darrick J. Wong 2016-10-03  2011  
174edb0e46e520 Darrick J. Wong 2016-10-03  2012  		/* Free the block. */
4ae7e45a0598e5 Darrick J. Wong 2022-07-14  2013  		xfs_free_extent_later(tp, fsb, rr->rr_rrec.rc_blockcount, NULL,
aa00406b3a9251 Darrick J. Wong 2022-07-14  2014  				rtg != NULL ? XFS_FREE_EXTENT_REALTIME : 0);
174edb0e46e520 Darrick J. Wong 2016-10-03  2015  
174edb0e46e520 Darrick J. Wong 2016-10-03  2016  		error = xfs_trans_commit(tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2017  		if (error)
174edb0e46e520 Darrick J. Wong 2016-10-03  2018  			goto out_free;
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2019  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2020  		list_del(&rr->rr_list);
c1ccf967bf962b Darrick J. Wong 2022-10-26  2021  		kfree(rr);
6f97077ff6ef28 Darrick J. Wong 2016-10-10  2022  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  2023  
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2024  	return error;
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2025  out_trans:
3ecb3ac7b950ff Darrick J. Wong 2017-05-15  2026  	xfs_trans_cancel(tp);
174edb0e46e520 Darrick J. Wong 2016-10-03  2027  out_free:
174edb0e46e520 Darrick J. Wong 2016-10-03  2028  	/* Free the leftover list */
174edb0e46e520 Darrick J. Wong 2016-10-03  2029  	list_for_each_entry_safe(rr, n, &debris, rr_list) {
174edb0e46e520 Darrick J. Wong 2016-10-03  2030  		list_del(&rr->rr_list);
c1ccf967bf962b Darrick J. Wong 2022-10-26  2031  		kfree(rr);
174edb0e46e520 Darrick J. Wong 2016-10-03  2032  	}
174edb0e46e520 Darrick J. Wong 2016-10-03  2033  	return error;
174edb0e46e520 Darrick J. Wong 2016-10-03  2034  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


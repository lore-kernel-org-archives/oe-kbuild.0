Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34E62F44
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680981551; x=1712517551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IKTBJyPkW4AxQ8+lHZMBxMh9+SrRV+14pf8QPN7sfXQ=;
  b=OQI5rjk6ZzPpAvd7cB6Y41Hbc/z88kH53jbMHyYX5ZSo0VXaMekdAZa5
   DH/r61NdAJg2p5HHOKrOqkAt0rf5MlrtrGIYl+LtMK1kpWXagFf2BORhq
   jRu0QQtEWkoEC/ZPcIhkTtarAyNeQv02o94OHuXzRKj3dGwRr3hLYwz1i
   XS39MbLs0+8wyUvR6nqLe5BtKW40s7yYJ6CAGoXAveRTRfcmw5YG8J3eu
   Mu4ml0alhFsjUZKhXSfj9S881HPrHkZXZyyf0ZVykke8eIgkTQ3jJX+O6
   Nf9NF46FOijLRzFpYxS9YK/I/aD5vofOQ0ynT/0ZIv3Ys+dkTi2wRkqQ0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="408297161"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="408297161"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 12:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="665212958"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="665212958"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Apr 2023 12:19:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plE5d-000U2K-0j;
	Sat, 08 Apr 2023 19:19:09 +0000
Date: Sun, 9 Apr 2023 03:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave-btrfs-devel:misc-next 144/147] fs/btrfs/scrub.c:2254
 scrub_stripe() error: uninitialized symbol 'offset'.
Message-ID: <202304090328.x3mPnw3F-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   0289ad4274bf9ba1b0748a3b1201ad11f4820994
commit: fe5a1f6da71b1a6b22f7c33fd0a389cf965b5ade [144/147] btrfs: dev-replace: error out if we have unrepaired metadata error during
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230409/202304090328.x3mPnw3F-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304090328.x3mPnw3F-lkp@intel.com/

New smatch warnings:
fs/btrfs/scrub.c:2254 scrub_stripe() error: uninitialized symbol 'offset'.

Old smatch warnings:
fs/btrfs/scrub.c:2028 scrub_simple_mirror() error: uninitialized symbol 'ret'.

vim +/offset +2254 fs/btrfs/scrub.c

8557635ed2b04bd Qu Wenruo       2022-03-11  2100  
d9d181c1ba7aa09 Stefan Behrens  2012-11-02  2101  static noinline_for_stack int scrub_stripe(struct scrub_ctx *sctx,
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  2102  					   struct btrfs_block_group *bg,
bc88b486d54b2a1 Qu Wenruo       2022-05-13  2103  					   struct extent_map *em,
a36cf8b8933e4a7 Stefan Behrens  2012-11-02  2104  					   struct btrfs_device *scrub_dev,
bc88b486d54b2a1 Qu Wenruo       2022-05-13  2105  					   int stripe_index)
a2de733c78fa7af Arne Jansen     2011-03-08  2106  {
fb456252d3d9c05 Jeff Mahoney    2016-06-22  2107  	struct btrfs_fs_info *fs_info = sctx->fs_info;
bc88b486d54b2a1 Qu Wenruo       2022-05-13  2108  	struct map_lookup *map = em->map_lookup;
09022b14fafc869 Qu Wenruo       2022-03-11  2109  	const u64 profile = map->type & BTRFS_BLOCK_GROUP_PROFILE_MASK;
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  2110  	const u64 chunk_logical = bg->start;
a2de733c78fa7af Arne Jansen     2011-03-08  2111  	int ret;
fe5a1f6da71b1a6 Qu Wenruo       2023-04-06  2112  	int ret2;
1194a82481d8f37 Qu Wenruo       2022-03-11  2113  	u64 physical = map->stripes[stripe_index].physical;
bc88b486d54b2a1 Qu Wenruo       2022-05-13  2114  	const u64 dev_stripe_len = btrfs_calc_stripe_length(em);
bc88b486d54b2a1 Qu Wenruo       2022-05-13  2115  	const u64 physical_end = physical + dev_stripe_len;
a2de733c78fa7af Arne Jansen     2011-03-08  2116  	u64 logical;
625f1c8dc66d778 Liu Bo          2013-04-27  2117  	u64 logic_end;
18d30ab961497f2 Qu Wenruo       2022-03-11  2118  	/* The logical increment after finishing one stripe */
5c07c53f2d273bd Jiapeng Chong   2022-01-21  2119  	u64 increment;
18d30ab961497f2 Qu Wenruo       2022-03-11  2120  	/* Offset inside the chunk */
a2de733c78fa7af Arne Jansen     2011-03-08  2121  	u64 offset;
5a6ac9eacb49143 Miao Xie        2014-11-06  2122  	u64 stripe_logical;
3b080b2564287be Wang Shilong    2014-04-01  2123  	int stop_loop = 0;
53b381b3abeb86f David Woodhouse 2013-01-29  2124  
cb7ab02156e4ba9 Wang Shilong    2013-12-04  2125  	scrub_blocked_if_needed(fs_info);
a2de733c78fa7af Arne Jansen     2011-03-08  2126  
de17addce7a20db Naohiro Aota    2021-02-04  2127  	if (sctx->is_dev_replace &&
de17addce7a20db Naohiro Aota    2021-02-04  2128  	    btrfs_dev_is_sequential(sctx->wr_tgtdev, physical)) {
de17addce7a20db Naohiro Aota    2021-02-04  2129  		mutex_lock(&sctx->wr_lock);
de17addce7a20db Naohiro Aota    2021-02-04  2130  		sctx->write_pointer = physical;
de17addce7a20db Naohiro Aota    2021-02-04  2131  		mutex_unlock(&sctx->wr_lock);
de17addce7a20db Naohiro Aota    2021-02-04  2132  	}
de17addce7a20db Naohiro Aota    2021-02-04  2133  
80fe35526e75cf3 Qu Wenruo       2023-03-28  2134  	/* Prepare the extra data stripes used by RAID56. */
80fe35526e75cf3 Qu Wenruo       2023-03-28  2135  	if (profile & BTRFS_BLOCK_GROUP_RAID56_MASK) {
80fe35526e75cf3 Qu Wenruo       2023-03-28  2136  		ASSERT(sctx->raid56_data_stripes == NULL);
80fe35526e75cf3 Qu Wenruo       2023-03-28  2137  
80fe35526e75cf3 Qu Wenruo       2023-03-28  2138  		sctx->raid56_data_stripes = kcalloc(nr_data_stripes(map),
80fe35526e75cf3 Qu Wenruo       2023-03-28  2139  						    sizeof(struct scrub_stripe),
80fe35526e75cf3 Qu Wenruo       2023-03-28  2140  						    GFP_KERNEL);
80fe35526e75cf3 Qu Wenruo       2023-03-28  2141  		if (!sctx->raid56_data_stripes) {
80fe35526e75cf3 Qu Wenruo       2023-03-28  2142  			ret = -ENOMEM;
80fe35526e75cf3 Qu Wenruo       2023-03-28  2143  			goto out;
80fe35526e75cf3 Qu Wenruo       2023-03-28  2144  		}
80fe35526e75cf3 Qu Wenruo       2023-03-28  2145  		for (int i = 0; i < nr_data_stripes(map); i++) {
80fe35526e75cf3 Qu Wenruo       2023-03-28  2146  			ret = init_scrub_stripe(fs_info,
80fe35526e75cf3 Qu Wenruo       2023-03-28  2147  						&sctx->raid56_data_stripes[i]);
80fe35526e75cf3 Qu Wenruo       2023-03-28  2148  			if (ret < 0)
80fe35526e75cf3 Qu Wenruo       2023-03-28  2149  				goto out;
80fe35526e75cf3 Qu Wenruo       2023-03-28  2150  			sctx->raid56_data_stripes[i].bg = bg;
80fe35526e75cf3 Qu Wenruo       2023-03-28  2151  			sctx->raid56_data_stripes[i].sctx = sctx;
80fe35526e75cf3 Qu Wenruo       2023-03-28  2152  		}
80fe35526e75cf3 Qu Wenruo       2023-03-28  2153  	}
09022b14fafc869 Qu Wenruo       2022-03-11  2154  	/*
09022b14fafc869 Qu Wenruo       2022-03-11  2155  	 * There used to be a big double loop to handle all profiles using the
09022b14fafc869 Qu Wenruo       2022-03-11  2156  	 * same routine, which grows larger and more gross over time.
09022b14fafc869 Qu Wenruo       2022-03-11  2157  	 *
09022b14fafc869 Qu Wenruo       2022-03-11  2158  	 * So here we handle each profile differently, so simpler profiles
09022b14fafc869 Qu Wenruo       2022-03-11  2159  	 * have simpler scrubbing function.
09022b14fafc869 Qu Wenruo       2022-03-11  2160  	 */
09022b14fafc869 Qu Wenruo       2022-03-11  2161  	if (!(profile & (BTRFS_BLOCK_GROUP_RAID0 | BTRFS_BLOCK_GROUP_RAID10 |
09022b14fafc869 Qu Wenruo       2022-03-11  2162  			 BTRFS_BLOCK_GROUP_RAID56_MASK))) {
09022b14fafc869 Qu Wenruo       2022-03-11  2163  		/*
09022b14fafc869 Qu Wenruo       2022-03-11  2164  		 * Above check rules out all complex profile, the remaining
09022b14fafc869 Qu Wenruo       2022-03-11  2165  		 * profiles are SINGLE|DUP|RAID1|RAID1C*, which is simple
09022b14fafc869 Qu Wenruo       2022-03-11  2166  		 * mirrored duplication without stripe.
09022b14fafc869 Qu Wenruo       2022-03-11  2167  		 *
09022b14fafc869 Qu Wenruo       2022-03-11  2168  		 * Only @physical and @mirror_num needs to calculated using
09022b14fafc869 Qu Wenruo       2022-03-11  2169  		 * @stripe_index.
09022b14fafc869 Qu Wenruo       2022-03-11  2170  		 */
8f116b59d6a3a38 Qu Wenruo       2023-01-16  2171  		ret = scrub_simple_mirror(sctx, bg, map, bg->start, bg->length,
8f116b59d6a3a38 Qu Wenruo       2023-01-16  2172  				scrub_dev, map->stripes[stripe_index].physical,
09022b14fafc869 Qu Wenruo       2022-03-11  2173  				stripe_index + 1);
e430c4287ebdafe Qu Wenruo       2022-03-11  2174  		offset = 0;
09022b14fafc869 Qu Wenruo       2022-03-11  2175  		goto out;
09022b14fafc869 Qu Wenruo       2022-03-11  2176  	}
8557635ed2b04bd Qu Wenruo       2022-03-11  2177  	if (profile & (BTRFS_BLOCK_GROUP_RAID0 | BTRFS_BLOCK_GROUP_RAID10)) {
8f116b59d6a3a38 Qu Wenruo       2023-01-16  2178  		ret = scrub_simple_stripe(sctx, bg, map, scrub_dev, stripe_index);
76066906df3b3ff Qu Wenruo       2023-02-17  2179  		offset = (stripe_index / map->sub_stripes) << BTRFS_STRIPE_LEN_SHIFT;
8557635ed2b04bd Qu Wenruo       2022-03-11  2180  		goto out;
8557635ed2b04bd Qu Wenruo       2022-03-11  2181  	}
8557635ed2b04bd Qu Wenruo       2022-03-11  2182  
8557635ed2b04bd Qu Wenruo       2022-03-11  2183  	/* Only RAID56 goes through the old code */
8557635ed2b04bd Qu Wenruo       2022-03-11  2184  	ASSERT(map->type & BTRFS_BLOCK_GROUP_RAID56_MASK);
a2de733c78fa7af Arne Jansen     2011-03-08  2185  	ret = 0;
e430c4287ebdafe Qu Wenruo       2022-03-11  2186  
e430c4287ebdafe Qu Wenruo       2022-03-11  2187  	/* Calculate the logical end of the stripe */
e430c4287ebdafe Qu Wenruo       2022-03-11  2188  	get_raid56_logic_offset(physical_end, stripe_index,
e430c4287ebdafe Qu Wenruo       2022-03-11  2189  				map, &logic_end, NULL);
e430c4287ebdafe Qu Wenruo       2022-03-11  2190  	logic_end += chunk_logical;
e430c4287ebdafe Qu Wenruo       2022-03-11  2191  
e430c4287ebdafe Qu Wenruo       2022-03-11  2192  	/* Initialize @offset in case we need to go to out: label */
e430c4287ebdafe Qu Wenruo       2022-03-11  2193  	get_raid56_logic_offset(physical, stripe_index, map, &offset, NULL);
76066906df3b3ff Qu Wenruo       2023-02-17  2194  	increment = nr_data_stripes(map) << BTRFS_STRIPE_LEN_SHIFT;
e430c4287ebdafe Qu Wenruo       2022-03-11  2195  
a2de733c78fa7af Arne Jansen     2011-03-08  2196  	/*
18d30ab961497f2 Qu Wenruo       2022-03-11  2197  	 * Due to the rotation, for RAID56 it's better to iterate each stripe
18d30ab961497f2 Qu Wenruo       2022-03-11  2198  	 * using their physical offset.
a2de733c78fa7af Arne Jansen     2011-03-08  2199  	 */
18d30ab961497f2 Qu Wenruo       2022-03-11  2200  	while (physical < physical_end) {
18d30ab961497f2 Qu Wenruo       2022-03-11  2201  		ret = get_raid56_logic_offset(physical, stripe_index, map,
18d30ab961497f2 Qu Wenruo       2022-03-11  2202  					      &logical, &stripe_logical);
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  2203  		logical += chunk_logical;
f2f66a2f886383f Zhao Lei        2015-07-21  2204  		if (ret) {
7955323bdcab307 Zhao Lei        2015-08-18  2205  			/* it is parity strip */
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  2206  			stripe_logical += chunk_logical;
80fe35526e75cf3 Qu Wenruo       2023-03-28  2207  			ret = scrub_raid56_parity_stripe(sctx, scrub_dev, bg,
80fe35526e75cf3 Qu Wenruo       2023-03-28  2208  							 map, stripe_logical);
f2f66a2f886383f Zhao Lei        2015-07-21  2209  			if (ret)
f2f66a2f886383f Zhao Lei        2015-07-21  2210  				goto out;
d7cad2389560f32 Zhao Lei        2015-07-22  2211  			goto next;
89490303a429423 Filipe Manana   2020-05-08  2212  		}
625f1c8dc66d778 Liu Bo          2013-04-27  2213  
3b080b2564287be Wang Shilong    2014-04-01  2214  		/*
18d30ab961497f2 Qu Wenruo       2022-03-11  2215  		 * Now we're at a data stripe, scrub each extents in the range.
18d30ab961497f2 Qu Wenruo       2022-03-11  2216  		 *
18d30ab961497f2 Qu Wenruo       2022-03-11  2217  		 * At this stage, if we ignore the repair part, inside each data
18d30ab961497f2 Qu Wenruo       2022-03-11  2218  		 * stripe it is no different than SINGLE profile.
18d30ab961497f2 Qu Wenruo       2022-03-11  2219  		 * We can reuse scrub_simple_mirror() here, as the repair part
18d30ab961497f2 Qu Wenruo       2022-03-11  2220  		 * is still based on @mirror_num.
3b080b2564287be Wang Shilong    2014-04-01  2221  		 */
8f116b59d6a3a38 Qu Wenruo       2023-01-16  2222  		ret = scrub_simple_mirror(sctx, bg, map, logical, BTRFS_STRIPE_LEN,
18d30ab961497f2 Qu Wenruo       2022-03-11  2223  					  scrub_dev, physical, 1);
18d30ab961497f2 Qu Wenruo       2022-03-11  2224  		if (ret < 0)
5a6ac9eacb49143 Miao Xie        2014-11-06  2225  			goto out;
a2de733c78fa7af Arne Jansen     2011-03-08  2226  next:
a2de733c78fa7af Arne Jansen     2011-03-08  2227  		logical += increment;
76066906df3b3ff Qu Wenruo       2023-02-17  2228  		physical += BTRFS_STRIPE_LEN;
d9d181c1ba7aa09 Stefan Behrens  2012-11-02  2229  		spin_lock(&sctx->stat_lock);
625f1c8dc66d778 Liu Bo          2013-04-27  2230  		if (stop_loop)
bc88b486d54b2a1 Qu Wenruo       2022-05-13  2231  			sctx->stat.last_physical =
bc88b486d54b2a1 Qu Wenruo       2022-05-13  2232  				map->stripes[stripe_index].physical + dev_stripe_len;
625f1c8dc66d778 Liu Bo          2013-04-27  2233  		else
d9d181c1ba7aa09 Stefan Behrens  2012-11-02  2234  			sctx->stat.last_physical = physical;
d9d181c1ba7aa09 Stefan Behrens  2012-11-02  2235  		spin_unlock(&sctx->stat_lock);
625f1c8dc66d778 Liu Bo          2013-04-27  2236  		if (stop_loop)
625f1c8dc66d778 Liu Bo          2013-04-27  2237  			break;
a2de733c78fa7af Arne Jansen     2011-03-08  2238  	}
ff023aac31198e8 Stefan Behrens  2012-11-06  2239  out:
fe5a1f6da71b1a6 Qu Wenruo       2023-04-06  2240  	ret2 = flush_scrub_stripes(sctx);
fe5a1f6da71b1a6 Qu Wenruo       2023-04-06  2241  	if (!ret2)
fe5a1f6da71b1a6 Qu Wenruo       2023-04-06  2242  		ret = ret2;
80fe35526e75cf3 Qu Wenruo       2023-03-28  2243  	if (sctx->raid56_data_stripes) {
80fe35526e75cf3 Qu Wenruo       2023-03-28  2244  		for (int i = 0; i < nr_data_stripes(map); i++)
80fe35526e75cf3 Qu Wenruo       2023-03-28  2245  			release_scrub_stripe(&sctx->raid56_data_stripes[i]);
80fe35526e75cf3 Qu Wenruo       2023-03-28  2246  		kfree(sctx->raid56_data_stripes);
80fe35526e75cf3 Qu Wenruo       2023-03-28  2247  		sctx->raid56_data_stripes = NULL;
80fe35526e75cf3 Qu Wenruo       2023-03-28  2248  	}
7db1c5d14dcd521 Naohiro Aota    2021-02-04  2249  
7db1c5d14dcd521 Naohiro Aota    2021-02-04  2250  	if (sctx->is_dev_replace && ret >= 0) {
7db1c5d14dcd521 Naohiro Aota    2021-02-04  2251  		int ret2;
7db1c5d14dcd521 Naohiro Aota    2021-02-04  2252  
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  2253  		ret2 = sync_write_pointer_for_zoned(sctx,
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15 @2254  				chunk_logical + offset,
2ae8ae3d3def4c3 Qu Wenruo       2021-12-15  2255  				map->stripes[stripe_index].physical,
7db1c5d14dcd521 Naohiro Aota    2021-02-04  2256  				physical_end);
7db1c5d14dcd521 Naohiro Aota    2021-02-04  2257  		if (ret2)
7db1c5d14dcd521 Naohiro Aota    2021-02-04  2258  			ret = ret2;
7db1c5d14dcd521 Naohiro Aota    2021-02-04  2259  	}
7db1c5d14dcd521 Naohiro Aota    2021-02-04  2260  
a2de733c78fa7af Arne Jansen     2011-03-08  2261  	return ret < 0 ? ret : 0;
a2de733c78fa7af Arne Jansen     2011-03-08  2262  }
a2de733c78fa7af Arne Jansen     2011-03-08  2263  

:::::: The code at line 2254 was first introduced by commit
:::::: 2ae8ae3d3def4c3ba73a58cc2531c42f0916f14e btrfs: scrub: cleanup the argument list of scrub_stripe()

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

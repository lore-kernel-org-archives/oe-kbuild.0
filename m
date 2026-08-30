Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A943603C3
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Aug 2026 06:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788072369; cv=none; b=E6liEdto9tVYTZ0+O/khHbfHbaVC92qX+fKD2eDvHD6CoBM3lrLNOysyOI+vrygDUXaTwAdJ1NmSm9mxF9vYw6EZhMYgg1rMWIEp8Hsigl+g5aQD3hCeL5ximC5YdpGW64t3R6wfQS39vXn5UcT4D3CwXJJXfKXUfbPD/O1tAl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788072369; c=relaxed/simple;
	bh=ZUOqjr5WeYIRJxbPEu7dfvIx7u/Uifd+Q+Ib+bCyBew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YSDIuMMVTywxtBGZCWLT9Z74XN1oSbWysH/xaMexySZK6vJ9acPchNVnjSDw5HLSXFgVtPkDzVlZ5+mjmr4aLM+3jqAw00OyPIaMYzkGtunthnZihCYAD51grJ/X+sujV3lMh2Z7j6VBi+BHiOGiLJ0YlF/PN8APwgRhhWCQOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDe9Mqvd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDe9Mqvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788072366; x=1819608366;
  h=date:from:to:cc:subject:message-id;
  bh=ZUOqjr5WeYIRJxbPEu7dfvIx7u/Uifd+Q+Ib+bCyBew=;
  b=DDe9MqvdCRpYcx0Plg8f1mL3XHxAio+tgUmd6OOB327/QWVv92llrLSp
   gTshCPUlQWL9qpyLgb+6JTLkUjEQvxvsErSYX5Twv83w6cuCDccFffFUl
   f9rG1q9PtJRTY5wQoeSCOIDZSqAhPUSrkPhlBjXJZ8cXqBgWAWJhJeTD8
   K8WS/u3n++7tOahMuvY6si54UKObYLveNC61/RMv6o8BCZ9hzC8N7K1qT
   724hRI57HrU+wRyQO26paAOyygsNE8sm3uxvru6zXeZIuYbJ2EVmRrLx/
   e/KXXPr2Qd741Lj983oL/KICB2tREvwLHENE1Wb1KBLAb/s3KJsrKfAi6
   w==;
X-CSE-ConnectionGUID: 1+laJaocSrmvOKrUoePU6w==
X-CSE-MsgGUID: JL2o6g3mSQKSqK1JZYt+gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="99177012"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="99177012"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 23:46:05 -0700
X-CSE-ConnectionGUID: DDMGnxwJShuBhPRAHw4btg==
X-CSE-MsgGUID: 3DYItJL7R+qFmbM1/HHw8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="264771936"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Aug 2026 23:46:04 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0ZIn-00000000Dem-2kxl;
	Sun, 30 Aug 2026 06:46:01 +0000
Date: Sun, 30 Aug 2026 14:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:7.2/zen-sauce 4/26] fs/btrfs/scrub.c:2576:24: warning:
 'offset' may be used uninitialized
Message-ID: <202608301447.1DDA5Sv0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 7.2/zen-sauce
head:   299e73098bef8870b60c6ce830084457d222b0f5
commit: 4552ae443b368caad94ec1a5dfb1e92047dc62a6 [4/26] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: um-randconfig-r134-20260829 (https://download.01.org/0day-ci/archive/20260830/202608301447.1DDA5Sv0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301447.1DDA5Sv0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608301447.1DDA5Sv0-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/scrub.c: In function 'scrub_stripe':
>> fs/btrfs/scrub.c:2576:24: warning: 'offset' may be used uninitialized [-Wmaybe-uninitialized]
    2576 |                 ret2 = sync_write_pointer_for_zoned(sctx,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2577 |                                 chunk_logical + offset,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~
    2578 |                                 map->stripes[stripe_index].physical,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2579 |                                 physical_end);
         |                                 ~~~~~~~~~~~~~
   fs/btrfs/scrub.c:2444:13: note: 'offset' was declared here
    2444 |         u64 offset;
         |             ^~~~~~


vim +/offset +2576 fs/btrfs/scrub.c

8557635ed2b04b Qu Wenruo       2022-03-11  2424  
d9d181c1ba7aa0 Stefan Behrens  2012-11-02  2425  static noinline_for_stack int scrub_stripe(struct scrub_ctx *sctx,
2ae8ae3d3def4c Qu Wenruo       2021-12-15  2426  					   struct btrfs_block_group *bg,
7dc66abb5a4777 Filipe Manana   2023-11-21  2427  					   struct btrfs_chunk_map *map,
a36cf8b8933e4a Stefan Behrens  2012-11-02  2428  					   struct btrfs_device *scrub_dev,
bc88b486d54b2a Qu Wenruo       2022-05-13  2429  					   int stripe_index)
a2de733c78fa7a Arne Jansen     2011-03-08  2430  {
fb456252d3d9c0 Jeff Mahoney    2016-06-22  2431  	struct btrfs_fs_info *fs_info = sctx->fs_info;
09022b14fafc86 Qu Wenruo       2022-03-11  2432  	const u64 profile = map->type & BTRFS_BLOCK_GROUP_PROFILE_MASK;
2ae8ae3d3def4c Qu Wenruo       2021-12-15  2433  	const u64 chunk_logical = bg->start;
a2de733c78fa7a Arne Jansen     2011-03-08  2434  	int ret;
8eb3dd17eadd21 Qu Wenruo       2023-04-06  2435  	int ret2;
1194a82481d8f3 Qu Wenruo       2022-03-11  2436  	u64 physical = map->stripes[stripe_index].physical;
7dc66abb5a4777 Filipe Manana   2023-11-21  2437  	const u64 dev_stripe_len = btrfs_calc_stripe_length(map);
bc88b486d54b2a Qu Wenruo       2022-05-13  2438  	const u64 physical_end = physical + dev_stripe_len;
a2de733c78fa7a Arne Jansen     2011-03-08  2439  	u64 logical;
625f1c8dc66d77 Liu Bo          2013-04-27  2440  	u64 logic_end;
18d30ab961497f Qu Wenruo       2022-03-11  2441  	/* The logical increment after finishing one stripe */
5c07c53f2d273b Jiapeng Chong   2022-01-21  2442  	u64 increment;
18d30ab961497f Qu Wenruo       2022-03-11  2443  	/* Offset inside the chunk */
a2de733c78fa7a Arne Jansen     2011-03-08  2444  	u64 offset;
5a6ac9eacb4914 Miao Xie        2014-11-06  2445  	u64 stripe_logical;
53b381b3abeb86 David Woodhouse 2013-01-29  2446  
1dc4888e725dc7 Qu Wenruo       2023-08-03  2447  	/* Extent_path should be released by now. */
1dc4888e725dc7 Qu Wenruo       2023-08-03  2448  	ASSERT(sctx->extent_path.nodes[0] == NULL);
1dc4888e725dc7 Qu Wenruo       2023-08-03  2449  
cb7ab02156e4ba Wang Shilong    2013-12-04  2450  	scrub_blocked_if_needed(fs_info);
a2de733c78fa7a Arne Jansen     2011-03-08  2451  
de17addce7a20d Naohiro Aota    2021-02-04  2452  	if (sctx->is_dev_replace &&
de17addce7a20d Naohiro Aota    2021-02-04  2453  	    btrfs_dev_is_sequential(sctx->wr_tgtdev, physical)) {
de17addce7a20d Naohiro Aota    2021-02-04  2454  		mutex_lock(&sctx->wr_lock);
de17addce7a20d Naohiro Aota    2021-02-04  2455  		sctx->write_pointer = physical;
de17addce7a20d Naohiro Aota    2021-02-04  2456  		mutex_unlock(&sctx->wr_lock);
de17addce7a20d Naohiro Aota    2021-02-04  2457  	}
de17addce7a20d Naohiro Aota    2021-02-04  2458  
1009254bf22a3f Qu Wenruo       2023-03-28  2459  	/* Prepare the extra data stripes used by RAID56. */
1009254bf22a3f Qu Wenruo       2023-03-28  2460  	if (profile & BTRFS_BLOCK_GROUP_RAID56_MASK) {
1009254bf22a3f Qu Wenruo       2023-03-28  2461  		ASSERT(sctx->raid56_data_stripes == NULL);
1009254bf22a3f Qu Wenruo       2023-03-28  2462  
69050f8d6d075d Kees Cook       2026-02-20  2463  		sctx->raid56_data_stripes = kzalloc_objs(struct scrub_stripe,
189f164e573e18 Kees Cook       2026-02-21  2464  							 nr_data_stripes(map));
1009254bf22a3f Qu Wenruo       2023-03-28  2465  		if (!sctx->raid56_data_stripes) {
1009254bf22a3f Qu Wenruo       2023-03-28  2466  			ret = -ENOMEM;
1009254bf22a3f Qu Wenruo       2023-03-28  2467  			goto out;
1009254bf22a3f Qu Wenruo       2023-03-28  2468  		}
1009254bf22a3f Qu Wenruo       2023-03-28  2469  		for (int i = 0; i < nr_data_stripes(map); i++) {
1009254bf22a3f Qu Wenruo       2023-03-28  2470  			ret = init_scrub_stripe(fs_info,
1009254bf22a3f Qu Wenruo       2023-03-28  2471  						&sctx->raid56_data_stripes[i]);
1009254bf22a3f Qu Wenruo       2023-03-28  2472  			if (ret < 0)
1009254bf22a3f Qu Wenruo       2023-03-28  2473  				goto out;
1009254bf22a3f Qu Wenruo       2023-03-28  2474  			sctx->raid56_data_stripes[i].bg = bg;
1009254bf22a3f Qu Wenruo       2023-03-28  2475  			sctx->raid56_data_stripes[i].sctx = sctx;
1009254bf22a3f Qu Wenruo       2023-03-28  2476  		}
1009254bf22a3f Qu Wenruo       2023-03-28  2477  	}
09022b14fafc86 Qu Wenruo       2022-03-11  2478  	/*
09022b14fafc86 Qu Wenruo       2022-03-11  2479  	 * There used to be a big double loop to handle all profiles using the
09022b14fafc86 Qu Wenruo       2022-03-11  2480  	 * same routine, which grows larger and more gross over time.
09022b14fafc86 Qu Wenruo       2022-03-11  2481  	 *
09022b14fafc86 Qu Wenruo       2022-03-11  2482  	 * So here we handle each profile differently, so simpler profiles
09022b14fafc86 Qu Wenruo       2022-03-11  2483  	 * have simpler scrubbing function.
09022b14fafc86 Qu Wenruo       2022-03-11  2484  	 */
09022b14fafc86 Qu Wenruo       2022-03-11  2485  	if (!(profile & (BTRFS_BLOCK_GROUP_RAID0 | BTRFS_BLOCK_GROUP_RAID10 |
09022b14fafc86 Qu Wenruo       2022-03-11  2486  			 BTRFS_BLOCK_GROUP_RAID56_MASK))) {
09022b14fafc86 Qu Wenruo       2022-03-11  2487  		/*
09022b14fafc86 Qu Wenruo       2022-03-11  2488  		 * Above check rules out all complex profile, the remaining
09022b14fafc86 Qu Wenruo       2022-03-11  2489  		 * profiles are SINGLE|DUP|RAID1|RAID1C*, which is simple
09022b14fafc86 Qu Wenruo       2022-03-11  2490  		 * mirrored duplication without stripe.
09022b14fafc86 Qu Wenruo       2022-03-11  2491  		 *
09022b14fafc86 Qu Wenruo       2022-03-11  2492  		 * Only @physical and @mirror_num needs to calculated using
09022b14fafc86 Qu Wenruo       2022-03-11  2493  		 * @stripe_index.
09022b14fafc86 Qu Wenruo       2022-03-11  2494  		 */
887d417f0a57ea David Sterba    2024-10-09  2495  		ret = scrub_simple_mirror(sctx, bg, bg->start, bg->length,
6b4d375a81551b Qu Wenruo       2023-01-16  2496  				scrub_dev, map->stripes[stripe_index].physical,
09022b14fafc86 Qu Wenruo       2022-03-11  2497  				stripe_index + 1);
e430c4287ebdaf Qu Wenruo       2022-03-11  2498  		offset = 0;
09022b14fafc86 Qu Wenruo       2022-03-11  2499  		goto out;
09022b14fafc86 Qu Wenruo       2022-03-11  2500  	}
8557635ed2b04b Qu Wenruo       2022-03-11  2501  	if (profile & (BTRFS_BLOCK_GROUP_RAID0 | BTRFS_BLOCK_GROUP_RAID10)) {
6b4d375a81551b Qu Wenruo       2023-01-16  2502  		ret = scrub_simple_stripe(sctx, bg, map, scrub_dev, stripe_index);
cb091225a53800 Qu Wenruo       2023-06-22  2503  		offset = btrfs_stripe_nr_to_offset(stripe_index / map->sub_stripes);
8557635ed2b04b Qu Wenruo       2022-03-11  2504  		goto out;
8557635ed2b04b Qu Wenruo       2022-03-11  2505  	}
8557635ed2b04b Qu Wenruo       2022-03-11  2506  
8557635ed2b04b Qu Wenruo       2022-03-11  2507  	/* Only RAID56 goes through the old code */
8557635ed2b04b Qu Wenruo       2022-03-11  2508  	ASSERT(map->type & BTRFS_BLOCK_GROUP_RAID56_MASK);
a2de733c78fa7a Arne Jansen     2011-03-08  2509  	ret = 0;
e430c4287ebdaf Qu Wenruo       2022-03-11  2510  
e430c4287ebdaf Qu Wenruo       2022-03-11  2511  	/* Calculate the logical end of the stripe */
e430c4287ebdaf Qu Wenruo       2022-03-11  2512  	get_raid56_logic_offset(physical_end, stripe_index,
e430c4287ebdaf Qu Wenruo       2022-03-11  2513  				map, &logic_end, NULL);
e430c4287ebdaf Qu Wenruo       2022-03-11  2514  	logic_end += chunk_logical;
e430c4287ebdaf Qu Wenruo       2022-03-11  2515  
e430c4287ebdaf Qu Wenruo       2022-03-11  2516  	/* Initialize @offset in case we need to go to out: label */
e430c4287ebdaf Qu Wenruo       2022-03-11  2517  	get_raid56_logic_offset(physical, stripe_index, map, &offset, NULL);
cb091225a53800 Qu Wenruo       2023-06-22  2518  	increment = btrfs_stripe_nr_to_offset(nr_data_stripes(map));
e430c4287ebdaf Qu Wenruo       2022-03-11  2519  
a2de733c78fa7a Arne Jansen     2011-03-08  2520  	/*
18d30ab961497f Qu Wenruo       2022-03-11  2521  	 * Due to the rotation, for RAID56 it's better to iterate each stripe
18d30ab961497f Qu Wenruo       2022-03-11  2522  	 * using their physical offset.
a2de733c78fa7a Arne Jansen     2011-03-08  2523  	 */
18d30ab961497f Qu Wenruo       2022-03-11  2524  	while (physical < physical_end) {
18d30ab961497f Qu Wenruo       2022-03-11  2525  		ret = get_raid56_logic_offset(physical, stripe_index, map,
18d30ab961497f Qu Wenruo       2022-03-11  2526  					      &logical, &stripe_logical);
2ae8ae3d3def4c Qu Wenruo       2021-12-15  2527  		logical += chunk_logical;
f2f66a2f886383 Zhao Lei        2015-07-21  2528  		if (ret) {
7955323bdcab30 Zhao Lei        2015-08-18  2529  			/* it is parity strip */
2ae8ae3d3def4c Qu Wenruo       2021-12-15  2530  			stripe_logical += chunk_logical;
1009254bf22a3f Qu Wenruo       2023-03-28  2531  			ret = scrub_raid56_parity_stripe(sctx, scrub_dev, bg,
1009254bf22a3f Qu Wenruo       2023-03-28  2532  							 map, stripe_logical);
63447b7dd40c6a Qu Wenruo       2024-03-08  2533  			spin_lock(&sctx->stat_lock);
63447b7dd40c6a Qu Wenruo       2024-03-08  2534  			sctx->stat.last_physical = min(physical + BTRFS_STRIPE_LEN,
63447b7dd40c6a Qu Wenruo       2024-03-08  2535  						       physical_end);
63447b7dd40c6a Qu Wenruo       2024-03-08  2536  			spin_unlock(&sctx->stat_lock);
f2f66a2f886383 Zhao Lei        2015-07-21  2537  			if (ret)
f2f66a2f886383 Zhao Lei        2015-07-21  2538  				goto out;
d7cad2389560f3 Zhao Lei        2015-07-22  2539  			goto next;
89490303a42942 Filipe Manana   2020-05-08  2540  		}
625f1c8dc66d77 Liu Bo          2013-04-27  2541  
3b080b2564287b Wang Shilong    2014-04-01  2542  		/*
18d30ab961497f Qu Wenruo       2022-03-11  2543  		 * Now we're at a data stripe, scrub each extents in the range.
18d30ab961497f Qu Wenruo       2022-03-11  2544  		 *
18d30ab961497f Qu Wenruo       2022-03-11  2545  		 * At this stage, if we ignore the repair part, inside each data
18d30ab961497f Qu Wenruo       2022-03-11  2546  		 * stripe it is no different than SINGLE profile.
18d30ab961497f Qu Wenruo       2022-03-11  2547  		 * We can reuse scrub_simple_mirror() here, as the repair part
18d30ab961497f Qu Wenruo       2022-03-11  2548  		 * is still based on @mirror_num.
3b080b2564287b Wang Shilong    2014-04-01  2549  		 */
887d417f0a57ea David Sterba    2024-10-09  2550  		ret = scrub_simple_mirror(sctx, bg, logical, BTRFS_STRIPE_LEN,
18d30ab961497f Qu Wenruo       2022-03-11  2551  					  scrub_dev, physical, 1);
18d30ab961497f Qu Wenruo       2022-03-11  2552  		if (ret < 0)
5a6ac9eacb4914 Miao Xie        2014-11-06  2553  			goto out;
a2de733c78fa7a Arne Jansen     2011-03-08  2554  next:
a2de733c78fa7a Arne Jansen     2011-03-08  2555  		logical += increment;
a97699d1d61071 Qu Wenruo       2023-02-17  2556  		physical += BTRFS_STRIPE_LEN;
d9d181c1ba7aa0 Stefan Behrens  2012-11-02  2557  		spin_lock(&sctx->stat_lock);
d9d181c1ba7aa0 Stefan Behrens  2012-11-02  2558  		sctx->stat.last_physical = physical;
d9d181c1ba7aa0 Stefan Behrens  2012-11-02  2559  		spin_unlock(&sctx->stat_lock);
a2de733c78fa7a Arne Jansen     2011-03-08  2560  	}
ff023aac31198e Stefan Behrens  2012-11-06  2561  out:
8eb3dd17eadd21 Qu Wenruo       2023-04-06  2562  	ret2 = flush_scrub_stripes(sctx);
b50f2d048ecf15 Qu Wenruo       2023-06-14  2563  	if (!ret)
8eb3dd17eadd21 Qu Wenruo       2023-04-06  2564  		ret = ret2;
1dc4888e725dc7 Qu Wenruo       2023-08-03  2565  	btrfs_release_path(&sctx->extent_path);
3c771c194402ff Qu Wenruo       2023-08-03  2566  	btrfs_release_path(&sctx->csum_path);
1dc4888e725dc7 Qu Wenruo       2023-08-03  2567  
1009254bf22a3f Qu Wenruo       2023-03-28  2568  	if (sctx->raid56_data_stripes) {
1009254bf22a3f Qu Wenruo       2023-03-28  2569  		for (int i = 0; i < nr_data_stripes(map); i++)
1009254bf22a3f Qu Wenruo       2023-03-28  2570  			release_scrub_stripe(&sctx->raid56_data_stripes[i]);
1009254bf22a3f Qu Wenruo       2023-03-28  2571  		kfree(sctx->raid56_data_stripes);
1009254bf22a3f Qu Wenruo       2023-03-28  2572  		sctx->raid56_data_stripes = NULL;
1009254bf22a3f Qu Wenruo       2023-03-28  2573  	}
7db1c5d14dcd52 Naohiro Aota    2021-02-04  2574  
7db1c5d14dcd52 Naohiro Aota    2021-02-04  2575  	if (sctx->is_dev_replace && ret >= 0) {
2ae8ae3d3def4c Qu Wenruo       2021-12-15 @2576  		ret2 = sync_write_pointer_for_zoned(sctx,
2ae8ae3d3def4c Qu Wenruo       2021-12-15  2577  				chunk_logical + offset,
2ae8ae3d3def4c Qu Wenruo       2021-12-15  2578  				map->stripes[stripe_index].physical,
7db1c5d14dcd52 Naohiro Aota    2021-02-04  2579  				physical_end);
7db1c5d14dcd52 Naohiro Aota    2021-02-04  2580  		if (ret2)
7db1c5d14dcd52 Naohiro Aota    2021-02-04  2581  			ret = ret2;
7db1c5d14dcd52 Naohiro Aota    2021-02-04  2582  	}
7db1c5d14dcd52 Naohiro Aota    2021-02-04  2583  
a2de733c78fa7a Arne Jansen     2011-03-08  2584  	return ret < 0 ? ret : 0;
a2de733c78fa7a Arne Jansen     2011-03-08  2585  }
a2de733c78fa7a Arne Jansen     2011-03-08  2586  

:::::: The code at line 2576 was first introduced by commit
:::::: 2ae8ae3d3def4c3ba73a58cc2531c42f0916f14e btrfs: scrub: cleanup the argument list of scrub_stripe()

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

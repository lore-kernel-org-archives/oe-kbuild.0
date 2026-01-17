Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC03E219319
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jan 2026 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768651800; cv=none; b=q7Otkivyd8ktIIbZSkXEQ1Wfmkd1TXJkTC9Hpvt2dDi6dTWtI0GQ37oug/G3geTnNl2+hjldpr5IQfWFzEMcCc+H7NluJH84CK+GkxZqZLhVAM2mKnQN2gEHFviPhZwEpGLBlhn/WSdJHpfKo53e1Uqx8tpHA+mRaoEpJkK9cjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768651800; c=relaxed/simple;
	bh=EhbKCtIc/T7nTGhlrqOnCfEPSIk1TvH4RX8SSVPeGPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GRdUS3Fz3ldYqljm2tyrBhL305580tp1Pu1fUq/tAKeFQ1sylfLefaQDpCDCe443Vg57Eyr3vBwQdBYfWoS9KB9ahvDDWyd+kf6NpEBkVE+qpfSmD0BFJbLDgFKou5TUZ7YlHqjY+eh319qXS9195XxnUqOzedPXtOYBenYKqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FifPhM7w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FifPhM7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768651797; x=1800187797;
  h=date:from:to:cc:subject:message-id;
  bh=EhbKCtIc/T7nTGhlrqOnCfEPSIk1TvH4RX8SSVPeGPU=;
  b=FifPhM7wqzg78XXXMVbTwvaX9k7UB4S+/OdC2+oc/MmxmEwg51Ewq1Xl
   i/xwGx0TyibNvMYX8vK0sJ+m+a0z/CUY1OCC2/9FKtsnm72qBk6jVBERg
   5tC+bFbR2/TrKDS15964tzlpF+g15HbmMaaTWSv32VbdZdm7CkGiPqMvK
   vrn3OI9DvEoizfimZj9UJ+YccC3tlKW++bBr+DP7aeDcaM+vgj0tIu5ur
   jDhSOPKQYtYmVsC0wR/wm2JlfcK6kN+ZcZbVccPf7fKLRZG1a8sMraNWp
   Tegwqywc1D1nuOh8QbwX3wK8qEPBFu85RUo9p8EqA+oYAvu6flTVo6sdQ
   g==;
X-CSE-ConnectionGUID: 6FjlAms7Tou72puxvwX0aw==
X-CSE-MsgGUID: L53eb15yQdu8DO8qZxqgLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73574998"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="73574998"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 04:09:56 -0800
X-CSE-ConnectionGUID: 1Zht9ZUKQU+vNiGr12FJYQ==
X-CSE-MsgGUID: BLlOejDgTr6fY/WBK6iPEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="209950514"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2026 04:09:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh57o-00000000LpM-1sjU;
	Sat, 17 Jan 2026 12:09:52 +0000
Date: Sat, 17 Jan 2026 20:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [btrfs:pr/1157 79/80] fs/btrfs/discard.c:591:6: warning:
 'discard_state' may be used uninitialized in this function
Message-ID: <202601171912.A4RZz1G4-lkp@intel.com>
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
TO: Mark Harmstone <mark@harmstone.com>
CC: David Sterba <dsterba@suse.com>
CC: Boris Burkov <boris@bur.io>

tree:   https://github.com/btrfs/linux.git pr/1157
head:   92a19b3e78cc245671e8937ffd5530cb4bb9bcc4
commit: 178d2180da6a9f830e77d9c16a02b16a2e14d958 [79/80] btrfs: handle discarding fully-remapped block groups
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm-randconfig-003-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171912.A4RZz1G4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171912.A4RZz1G4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601171912.A4RZz1G4-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/discard.c: In function 'btrfs_discard_workfn':
>> fs/btrfs/discard.c:591:6: warning: 'discard_state' may be used uninitialized in this function [-Wmaybe-uninitialized]
      if (discard_state == BTRFS_DISCARD_BITMAPS ||
         ^


vim +/discard_state +591 fs/btrfs/discard.c

6e80d4f8c422d3 Dennis Zhou    2019-12-13  508  
43dd529abed2bc David Sterba   2022-10-27  509  /*
43dd529abed2bc David Sterba   2022-10-27  510   * Discard work queue callback
43dd529abed2bc David Sterba   2022-10-27  511   *
b0643e59cfa609 Dennis Zhou    2019-12-13  512   * @work: work
b0643e59cfa609 Dennis Zhou    2019-12-13  513   *
43dd529abed2bc David Sterba   2022-10-27  514   * Find the next block_group to start discarding and then discard a single
43dd529abed2bc David Sterba   2022-10-27  515   * region.  It does this in a two-pass fashion: first extents and second
2bee7eb8bb8185 Dennis Zhou    2019-12-13  516   * bitmaps.  Completely discarded block groups are sent to the unused_bgs path.
b0643e59cfa609 Dennis Zhou    2019-12-13  517   */
b0643e59cfa609 Dennis Zhou    2019-12-13  518  static void btrfs_discard_workfn(struct work_struct *work)
b0643e59cfa609 Dennis Zhou    2019-12-13  519  {
b0643e59cfa609 Dennis Zhou    2019-12-13  520  	struct btrfs_discard_ctl *discard_ctl;
b0643e59cfa609 Dennis Zhou    2019-12-13  521  	struct btrfs_block_group *block_group;
2bee7eb8bb8185 Dennis Zhou    2019-12-13  522  	enum btrfs_discard_state discard_state;
7fe6d45e4009d9 Dennis Zhou    2020-01-02  523  	int discard_index = 0;
b0643e59cfa609 Dennis Zhou    2019-12-13  524  	u64 trimmed = 0;
7fe6d45e4009d9 Dennis Zhou    2020-01-02  525  	u64 minlen = 0;
ea9ed87c73e87e Pavel Begunkov 2020-12-06  526  	u64 now = ktime_get_ns();
b0643e59cfa609 Dennis Zhou    2019-12-13  527  
b0643e59cfa609 Dennis Zhou    2019-12-13  528  	discard_ctl = container_of(work, struct btrfs_discard_ctl, work.work);
b0643e59cfa609 Dennis Zhou    2019-12-13  529  
7fe6d45e4009d9 Dennis Zhou    2020-01-02  530  	block_group = peek_discard_list(discard_ctl, &discard_state,
ea9ed87c73e87e Pavel Begunkov 2020-12-06  531  					&discard_index, now);
895c6721d310c0 Boris Burkov   2025-03-03  532  	if (!block_group)
895c6721d310c0 Boris Burkov   2025-03-03  533  		return;
895c6721d310c0 Boris Burkov   2025-03-03  534  	if (!btrfs_run_discard_work(discard_ctl)) {
895c6721d310c0 Boris Burkov   2025-03-03  535  		spin_lock(&discard_ctl->lock);
895c6721d310c0 Boris Burkov   2025-03-03  536  		btrfs_put_block_group(block_group);
895c6721d310c0 Boris Burkov   2025-03-03  537  		discard_ctl->block_group = NULL;
895c6721d310c0 Boris Burkov   2025-03-03  538  		spin_unlock(&discard_ctl->lock);
b0643e59cfa609 Dennis Zhou    2019-12-13  539  		return;
895c6721d310c0 Boris Burkov   2025-03-03  540  	}
ea9ed87c73e87e Pavel Begunkov 2020-12-06  541  	if (now < block_group->discard_eligible_time) {
895c6721d310c0 Boris Burkov   2025-03-03  542  		spin_lock(&discard_ctl->lock);
895c6721d310c0 Boris Burkov   2025-03-03  543  		btrfs_put_block_group(block_group);
895c6721d310c0 Boris Burkov   2025-03-03  544  		discard_ctl->block_group = NULL;
895c6721d310c0 Boris Burkov   2025-03-03  545  		spin_unlock(&discard_ctl->lock);
ea9ed87c73e87e Pavel Begunkov 2020-12-06  546  		btrfs_discard_schedule_work(discard_ctl, false);
ea9ed87c73e87e Pavel Begunkov 2020-12-06  547  		return;
ea9ed87c73e87e Pavel Begunkov 2020-12-06  548  	}
b0643e59cfa609 Dennis Zhou    2019-12-13  549  
2bee7eb8bb8185 Dennis Zhou    2019-12-13  550  	/* Perform discarding */
7fe6d45e4009d9 Dennis Zhou    2020-01-02  551  	minlen = discard_minlen[discard_index];
7fe6d45e4009d9 Dennis Zhou    2020-01-02  552  
178d2180da6a9f Mark Harmstone 2026-01-07  553  	switch (discard_state) {
178d2180da6a9f Mark Harmstone 2026-01-07  554  	case BTRFS_DISCARD_BITMAPS: {
7fe6d45e4009d9 Dennis Zhou    2020-01-02  555  		u64 maxlen = 0;
7fe6d45e4009d9 Dennis Zhou    2020-01-02  556  
7fe6d45e4009d9 Dennis Zhou    2020-01-02  557  		/*
7fe6d45e4009d9 Dennis Zhou    2020-01-02  558  		 * Use the previous levels minimum discard length as the max
7fe6d45e4009d9 Dennis Zhou    2020-01-02  559  		 * length filter.  In the case something is added to make a
7fe6d45e4009d9 Dennis Zhou    2020-01-02  560  		 * region go beyond the max filter, the entire bitmap is set
7fe6d45e4009d9 Dennis Zhou    2020-01-02  561  		 * back to BTRFS_TRIM_STATE_UNTRIMMED.
7fe6d45e4009d9 Dennis Zhou    2020-01-02  562  		 */
7fe6d45e4009d9 Dennis Zhou    2020-01-02  563  		if (discard_index != BTRFS_DISCARD_INDEX_UNUSED)
7fe6d45e4009d9 Dennis Zhou    2020-01-02  564  			maxlen = discard_minlen[discard_index - 1];
7fe6d45e4009d9 Dennis Zhou    2020-01-02  565  
2bee7eb8bb8185 Dennis Zhou    2019-12-13  566  		btrfs_trim_block_group_bitmaps(block_group, &trimmed,
2bee7eb8bb8185 Dennis Zhou    2019-12-13  567  				       block_group->discard_cursor,
2bee7eb8bb8185 Dennis Zhou    2019-12-13  568  				       btrfs_block_group_end(block_group),
7fe6d45e4009d9 Dennis Zhou    2020-01-02  569  				       minlen, maxlen, true);
9ddf648f9c2a49 Dennis Zhou    2020-01-02  570  		discard_ctl->discard_bitmap_bytes += trimmed;
178d2180da6a9f Mark Harmstone 2026-01-07  571  
178d2180da6a9f Mark Harmstone 2026-01-07  572  		break;
178d2180da6a9f Mark Harmstone 2026-01-07  573  	}
178d2180da6a9f Mark Harmstone 2026-01-07  574  
178d2180da6a9f Mark Harmstone 2026-01-07  575  	case BTRFS_DISCARD_FULLY_REMAPPED:
178d2180da6a9f Mark Harmstone 2026-01-07  576  		btrfs_trim_fully_remapped_block_group(block_group);
178d2180da6a9f Mark Harmstone 2026-01-07  577  		break;
178d2180da6a9f Mark Harmstone 2026-01-07  578  
178d2180da6a9f Mark Harmstone 2026-01-07  579  	default:
2bee7eb8bb8185 Dennis Zhou    2019-12-13  580  		btrfs_trim_block_group_extents(block_group, &trimmed,
2bee7eb8bb8185 Dennis Zhou    2019-12-13  581  				       block_group->discard_cursor,
2bee7eb8bb8185 Dennis Zhou    2019-12-13  582  				       btrfs_block_group_end(block_group),
7fe6d45e4009d9 Dennis Zhou    2020-01-02  583  				       minlen, true);
9ddf648f9c2a49 Dennis Zhou    2020-01-02  584  		discard_ctl->discard_extent_bytes += trimmed;
178d2180da6a9f Mark Harmstone 2026-01-07  585  
178d2180da6a9f Mark Harmstone 2026-01-07  586  		break;
7fe6d45e4009d9 Dennis Zhou    2020-01-02  587  	}
2bee7eb8bb8185 Dennis Zhou    2019-12-13  588  
2bee7eb8bb8185 Dennis Zhou    2019-12-13  589  	/* Determine next steps for a block_group */
2bee7eb8bb8185 Dennis Zhou    2019-12-13  590  	if (block_group->discard_cursor >= btrfs_block_group_end(block_group)) {
178d2180da6a9f Mark Harmstone 2026-01-07 @591  		if (discard_state == BTRFS_DISCARD_BITMAPS ||
178d2180da6a9f Mark Harmstone 2026-01-07  592  		    discard_state == BTRFS_DISCARD_FULLY_REMAPPED) {
6e80d4f8c422d3 Dennis Zhou    2019-12-13  593  			btrfs_finish_discard_pass(discard_ctl, block_group);
2bee7eb8bb8185 Dennis Zhou    2019-12-13  594  		} else {
2bee7eb8bb8185 Dennis Zhou    2019-12-13  595  			block_group->discard_cursor = block_group->start;
2bee7eb8bb8185 Dennis Zhou    2019-12-13  596  			spin_lock(&discard_ctl->lock);
2bee7eb8bb8185 Dennis Zhou    2019-12-13  597  			if (block_group->discard_state !=
2bee7eb8bb8185 Dennis Zhou    2019-12-13  598  			    BTRFS_DISCARD_RESET_CURSOR)
2bee7eb8bb8185 Dennis Zhou    2019-12-13  599  				block_group->discard_state =
2bee7eb8bb8185 Dennis Zhou    2019-12-13  600  							BTRFS_DISCARD_BITMAPS;
2bee7eb8bb8185 Dennis Zhou    2019-12-13  601  			spin_unlock(&discard_ctl->lock);
2bee7eb8bb8185 Dennis Zhou    2019-12-13  602  		}
2bee7eb8bb8185 Dennis Zhou    2019-12-13  603  	}
2bee7eb8bb8185 Dennis Zhou    2019-12-13  604  
1ea2872fc6f2aa Pavel Begunkov 2020-12-06  605  	now = ktime_get_ns();
2bee7eb8bb8185 Dennis Zhou    2019-12-13  606  	spin_lock(&discard_ctl->lock);
1ea2872fc6f2aa Pavel Begunkov 2020-12-06  607  	discard_ctl->prev_discard = trimmed;
1ea2872fc6f2aa Pavel Begunkov 2020-12-06  608  	discard_ctl->prev_discard_time = now;
2b5463fcbdfb24 Boris Burkov   2023-01-12  609  	btrfs_put_block_group(block_group);
2bee7eb8bb8185 Dennis Zhou    2019-12-13  610  	discard_ctl->block_group = NULL;
8fc058597a283e Pavel Begunkov 2020-12-06  611  	__btrfs_discard_schedule_work(discard_ctl, now, false);
2bee7eb8bb8185 Dennis Zhou    2019-12-13  612  	spin_unlock(&discard_ctl->lock);
b0643e59cfa609 Dennis Zhou    2019-12-13  613  }
b0643e59cfa609 Dennis Zhou    2019-12-13  614  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

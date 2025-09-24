Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE1307AEC
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724388; cv=none; b=DuOvoiM+oFe88lGzA6sKV78vx+N0X7POCeCqU+yngSLd/tyY5KZw650NdEoudu9+YQPluVv/FSdC9jLNgb4NKIcyrufIIe2/KsMzTN2Mx2kUh+nQ9hd07vRXLeRz84bKyqV5KqSdEGWk+fl6YrbCs2yY7fFXryvCSDG8lo9LtO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724388; c=relaxed/simple;
	bh=fmP9goA/fI5JyprvZgzwBwslH4Dcff8ehXZ4gPi2j3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O6TNwbz0sAcwtnvhFEJyUq9dqVZGA2ViOR2puMhCHNrdTr10PQ6+qmYk3/WJeYwIpCJIJ+vvsO/QPFgidW7PArH5GFAsvhZ5j1fp2YLdomelS+sh58VL36TynzrrodU2OqL1qVLi4KMgMDQ01oPen1Mmw2CfpyETrBjTQxhQi2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSUfzK9K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSUfzK9K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758724386; x=1790260386;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fmP9goA/fI5JyprvZgzwBwslH4Dcff8ehXZ4gPi2j3M=;
  b=fSUfzK9KRWaHpuBk0VoKGctD1V7lfn2hTrr5H7El1b2MnpsLwuP8a757
   u06/XfvRqwlcg3owJL80S3P47HAndO3+/HPW0FChvO9QY2m2DiZs8C69P
   aFHM6uDAj0VlCyehYOpU4Wa2O6UfsSc532YuOUZKN/l6T+wkwnTEJDi1E
   5aS5D6mVFaC3OikwrObW02rLPhBOYuXdvSZ7ZV2SOxouT4+xOG91zvF6H
   v13o/4ndbrq8n0fguj2VAALZSnJjyGaJPxEGDbNNXb3A4BdsW1obTlvRv
   GC2cXHiE2jGykiTjqnfX8/7RAPu8Gsvld508C1bHQKt20HCLu/gnDAgy4
   w==;
X-CSE-ConnectionGUID: ejbr+ZozQRm2IW077FTC4w==
X-CSE-MsgGUID: YjXtAaOlTgir3MQXuhdDmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72125151"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="72125151"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 07:33:06 -0700
X-CSE-ConnectionGUID: KNps6xdYRoKa9uf2uhkScw==
X-CSE-MsgGUID: ZfcRwH8OQHGduOTTrtIW9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="177126285"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Sep 2025 07:33:03 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1QYF-0004E9-1c;
	Wed, 24 Sep 2025 14:32:59 +0000
Date: Wed, 24 Sep 2025 22:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/6] firewire: core; eliminate pick_me goto label
Message-ID: <202509242259.ICWpLRW0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250918230857.127400-6-o-takashi@sakamocchi.jp>
References: <20250918230857.127400-6-o-takashi@sakamocchi.jp>
TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Hi Takashi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e6d2338b6f3e522872f3a14fcc5e5de2f58bf23b]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Sakamoto/firewire-core-remove-useless-generation-check/20250919-115832
base:   e6d2338b6f3e522872f3a14fcc5e5de2f58bf23b
patch link:    https://lore.kernel.org/r/20250918230857.127400-6-o-takashi%40sakamocchi.jp
patch subject: [PATCH 5/6] firewire: core; eliminate pick_me goto label
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r072-20250922 (https://download.01.org/0day-ci/archive/20250924/202509242259.ICWpLRW0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509242259.ICWpLRW0-lkp@intel.com/

New smatch warnings:
drivers/firewire/core-card.c:445 bm_work() error: uninitialized symbol 'stand_for_root'.

Old smatch warnings:
drivers/firewire/core-card.c:498 bm_work() warn: always true condition '(root_node->max_hops < (16 / 1 + (0))) => (0-15 < 16)'

vim +/stand_for_root +445 drivers/firewire/core-card.c

e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  380  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  381  static void bm_work(struct work_struct *work)
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  382  {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  383  	static const char gap_count_table[] = {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  384  		63, 5, 7, 8, 10, 13, 16, 18, 21, 24, 26, 29, 32, 35, 37, 40
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  385  	};
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  386  	struct fw_card *card __free(card_unref) = from_work(card, work, bm_work.work);
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  387  	struct fw_node *root_node __free(node_unref) = NULL;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  388  	int root_id, new_root_id, irm_id, local_id;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  389  	int expected_gap_count, generation;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  390  	bool do_reset = false;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  391  	bool stand_for_root;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  392  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  393  	if (card->local_node == NULL)
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  394  		return;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  395  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  396  	generation = card->generation;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  397  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  398  	root_node = fw_node_get(card->root_node);
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  399  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  400  	root_id  = root_node->node_id;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  401  	irm_id   = card->irm_node->node_id;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  402  	local_id = card->local_node->node_id;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  403  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  404  	if (card->bm_generation != generation) {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  405  		enum bm_contention_outcome result = contend_for_bm(card);
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  406  
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  407  		switch (result) {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  408  		case BM_CONTENTION_OUTCOME_WITHIN_WINDOW:
379b870c28c6a6 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-15  409  			fw_schedule_bm_work(card, msecs_to_jiffies(125));
25feb1a96e21ae drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  410  			return;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  411  		case BM_CONTENTION_OUTCOME_IRM_HAS_LINK_OFF:
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  412  			stand_for_root = true;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  413  			break;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  414  		case BM_CONTENTION_OUTCOME_IRM_COMPLIES_1394_1995_ONLY:
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  415  			stand_for_root = true;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  416  			break;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  417  		case BM_CONTENTION_OUTCOME_AT_NEW_GENERATION:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  418  			// BM work has been rescheduled.
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  419  			return;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  420  		case BM_CONTENTION_OUTCOME_LOCAL_PROBLEM_AT_TRANSACTION:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  421  			// Let's try again later and hope that the local problem has gone away by
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  422  			// then.
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  423  			fw_schedule_bm_work(card, msecs_to_jiffies(125));
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  424  			return;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  425  		case BM_CONTENTION_OUTCOME_IRM_IS_NOT_CAPABLE_FOR_IRM:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  426  			// Let's do a bus reset and pick the local node as root, and thus, IRM.
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  427  			stand_for_root = true;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  428  			break;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  429  		case BM_CONTENTION_OUTCOME_IRM_HOLDS_ANOTHER_NODE_AS_BM:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  430  			if (local_id == irm_id) {
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  431  				// Only acts as IRM.
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  432  				allocate_broadcast_channel(card, generation);
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  433  			}
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  434  			fallthrough;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  435  		case BM_CONTENTION_OUTCOME_IRM_HOLDS_LOCAL_NODE_AS_BM:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  436  		default:
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  437  			card->bm_generation = generation;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  438  			stand_for_root = false;
e309c29e1b26f4 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  439  			break;
931c4834c8d1e1 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-01-26  440  		}
ff94548bbb2edf drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  441  	}
931c4834c8d1e1 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-01-26  442  
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  443  	// We're bus manager for this generation, so next step is to make sure we have an active
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  444  	// cycle master and do gap count optimization.
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19 @445  	if (!stand_for_root) {
91bf158f8cdf6f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-13  446  		if (card->gap_count == GAP_COUNT_MISMATCHED) {
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  447  			// If self IDs have inconsistent gap counts, do a
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  448  			// bus reset ASAP. The config rom read might never
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  449  			// complete, so don't wait for it. However, still
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  450  			// send a PHY configuration packet prior to the
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  451  			// bus reset. The PHY configuration packet might
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  452  			// fail, but 1394-2008 8.4.5.2 explicitly permits
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  453  			// it in this case, so it should be safe to try.
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  454  			stand_for_root = true;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  455  
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  456  			// We must always send a bus reset if the gap count
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  457  			// is inconsistent, so bypass the 5-reset limit.
7ed4380009e96d drivers/firewire/core-card.c Takashi Sakamoto  2024-02-07  458  			card->bm_retries = 0;
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  459  		} else {
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  460  			// Now investigate root node.
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  461  			struct fw_device *root_device = fw_node_get_device(root_node);
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  462  
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  463  			if (root_device == NULL) {
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  464  				// Either link_on is false, or we failed to read the
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  465  				// config rom.  In either case, pick another root.
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  466  				stand_for_root = true;
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  467  			} else {
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  468  				bool root_device_is_running =
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  469  					atomic_read(&root_device->state) == FW_DEVICE_RUNNING;
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  470  
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  471  				if (!root_device_is_running) {
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  472  					// If we haven't probed this device yet, bail out now
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  473  					// and let's try again once that's done.
25feb1a96e21ae drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  474  					return;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  475  				} else if (!root_device->cmc) {
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  476  					// Current root has an active link layer and we
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  477  					// successfully read the config rom, but it's not
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  478  					// cycle master capable.
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  479  					stand_for_root = true;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  480  				}
83db801ce8c644 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-01-26  481  			}
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  482  		}
cae2d92cdcae3f drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  483  	}
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  484  
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  485  	if (stand_for_root) {
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  486  		new_root_id = local_id;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  487  	} else {
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  488  		// We will send out a force root packet for this node as part of the gap count
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  489  		// optimization on behalf of the node.
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  490  		new_root_id = root_id;
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  491  	}
de5d138456fb29 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-19  492  
24d40125f1f59a drivers/firewire/fw-card.c   Stefan Richter    2007-06-18  493  	/*
24d40125f1f59a drivers/firewire/fw-card.c   Stefan Richter    2007-06-18  494  	 * Pick a gap count from 1394a table E-1.  The table doesn't cover
24d40125f1f59a drivers/firewire/fw-card.c   Stefan Richter    2007-06-18  495  	 * the typically much larger 1394b beta repeater delays though.
24d40125f1f59a drivers/firewire/fw-card.c   Stefan Richter    2007-06-18  496  	 */
24d40125f1f59a drivers/firewire/fw-card.c   Stefan Richter    2007-06-18  497  	if (!card->beta_repeaters_present &&
15803478fdea96 drivers/firewire/fw-card.c   Stefan Richter    2008-02-24  498  	    root_node->max_hops < ARRAY_SIZE(gap_count_table))
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  499  		expected_gap_count = gap_count_table[root_node->max_hops];
83db801ce8c644 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-01-26  500  	else
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  501  		expected_gap_count = 63;
83db801ce8c644 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-01-26  502  
c781c06d119d04 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-05-07  503  	/*
25b1c3d8889f98 drivers/firewire/fw-card.c   Stefan Richter    2008-03-24  504  	 * Finally, figure out if we should do a reset or not.  If we have
25b1c3d8889f98 drivers/firewire/fw-card.c   Stefan Richter    2008-03-24  505  	 * done less than 5 resets with the same physical topology and we
c781c06d119d04 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-05-07  506  	 * have either a new root or a new gap count setting, let's do it.
c781c06d119d04 drivers/firewire/fw-card.c   Kristian Høgsberg 2007-05-07  507  	 */
19a15b937b2663 drivers/firewire/fw-card.c   Kristian Høgsberg 2006-12-19  508  
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  509  	if (card->bm_retries++ < 5 && (card->gap_count != expected_gap_count || new_root_id != root_id))
25b1c3d8889f98 drivers/firewire/fw-card.c   Stefan Richter    2008-03-24  510  		do_reset = true;
19a15b937b2663 drivers/firewire/fw-card.c   Kristian Høgsberg 2006-12-19  511  
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  512  	if (do_reset) {
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  513  		int card_gap_count = card->gap_count;
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  514  
26b4950de174bc drivers/firewire/core-card.c Stefan Richter    2012-02-18  515  		fw_notice(card, "phy config: new root=%x, gap_count=%d\n",
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  516  			  new_root_id, expected_gap_count);
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  517  		fw_send_phy_config(card, new_root_id, generation, expected_gap_count);
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  518  		/*
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  519  		 * Where possible, use a short bus reset to minimize
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  520  		 * disruption to isochronous transfers. But in the event
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  521  		 * of a gap count inconsistency, use a long bus reset.
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  522  		 *
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  523  		 * As noted in 1394a 8.4.6.2, nodes on a mixed 1394/1394a bus
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  524  		 * may set different gap counts after a bus reset. On a mixed
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  525  		 * 1394/1394a bus, a short bus reset can get doubled. Some
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  526  		 * nodes may treat the double reset as one bus reset and others
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  527  		 * may treat it as two, causing a gap count inconsistency
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  528  		 * again. Using a long bus reset prevents this.
d0b06dc48fb159 drivers/firewire/core-card.c Takashi Sakamoto  2024-02-29  529  		 */
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  530  		reset_bus(card, card_gap_count != 0);
cbae787c0f288c drivers/firewire/fw-card.c   Stefan Richter    2009-03-10  531  		/* Will allocate broadcast channel after the reset. */
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  532  	} else {
a4bac55d99d379 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  533  		struct fw_device *root_device = fw_node_get_device(root_node);
a4bac55d99d379 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  534  
a4bac55d99d379 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  535  		if (root_device && root_device->cmc) {
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  536  			// Make sure that the cycle master sends cycle start packets.
b70a5f33381f78 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  537  			__be32 data = cpu_to_be32(CSR_STATE_BIT_CMSTR);
b70a5f33381f78 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  538  			int rcode = fw_run_transaction(card, TCODE_WRITE_QUADLET_REQUEST,
c374ab424249b6 drivers/firewire/core-card.c Clemens Ladisch   2010-06-10  539  					root_id, generation, SCODE_100,
c374ab424249b6 drivers/firewire/core-card.c Clemens Ladisch   2010-06-10  540  					CSR_REGISTER_BASE + CSR_STATE_SET,
b70a5f33381f78 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  541  					&data, sizeof(data));
c374ab424249b6 drivers/firewire/core-card.c Clemens Ladisch   2010-06-10  542  			if (rcode == RCODE_GENERATION)
25feb1a96e21ae drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  543  				return;
c374ab424249b6 drivers/firewire/core-card.c Clemens Ladisch   2010-06-10  544  		}
c374ab424249b6 drivers/firewire/core-card.c Clemens Ladisch   2010-06-10  545  
cbae787c0f288c drivers/firewire/fw-card.c   Stefan Richter    2009-03-10  546  		if (local_id == irm_id)
cbae787c0f288c drivers/firewire/fw-card.c   Stefan Richter    2009-03-10  547  			allocate_broadcast_channel(card, generation);
19a15b937b2663 drivers/firewire/fw-card.c   Kristian Høgsberg 2006-12-19  548  	}
8c2d2fcd6b7934 drivers/firewire/core-card.c Takashi Sakamoto  2025-09-08  549  }
19a15b937b2663 drivers/firewire/fw-card.c   Kristian Høgsberg 2006-12-19  550  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

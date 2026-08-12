Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641A35200B
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564878; cv=none; b=LsbvvVQXfap7VVUclZMNKeh/3ScMzeXNRtxR2K6uz5yRq9elqdgEXko1Xbulpu9Txj9WwolJsmRSrNARp63NtVoCWxOj4151u+8jJE9W7Hyn/2emxNh3guHdl9CVtB3fzaqMiAZHK1tRJiifibQtKU3KzL3ZWdwTcAu81VEFFQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564878; c=relaxed/simple;
	bh=NgffUgT5ZVZDZhjNfC4FuYtC9mp0fXfMqF17FEFp0KE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VE8cM4v0hy88r+eefzii7xiuMspICHi4+7RCSATARD07droNtfY1gfJ6jfMGwWWiYx0S0sC65QxFPwEEVUbHaG0CtvoBwyDQKMqFoghwkkFJATpMWGwGWfQ2zE4iUdW+bmVWLqRiJQRHwPG/hqL3V5+WAwj4P2lBAIY7tntwEfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmAnU6Tz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmAnU6Tz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786564876; x=1818100876;
  h=date:from:to:cc:subject:message-id;
  bh=NgffUgT5ZVZDZhjNfC4FuYtC9mp0fXfMqF17FEFp0KE=;
  b=hmAnU6TzrTPcqYFMFoNVtoexcE14iz3PIjZcJ+Zepd1RqBcaNfafqGPO
   DkwHaSxpe5cQpqGmb+CpqgzYBQiTPEUOKKeCGfzFwAlPvP7YPjiPtcaSb
   8+acihebe0ZetJsSYQ4Pfv3RuAXuyQ0Z8ehTyP+x7F9VJ1eN5kpEVMsMG
   OfWBsFAHzxtDgsPdCBZYh9Kt/9H8jgcWzh17ZUwLrC4VyBDJDLdT1Zcyl
   1HCrsYqrxjAVPuFG0LOwOXgmkqvAxruxE7Tdeb0BF5fAVuzhg6s4YlwLk
   WObFT7U5wR+aR+v2Bp7JbqPPL5yVTtCg/1PRm09xCP9xwQBw6k7CJF/46
   Q==;
X-CSE-ConnectionGUID: YNpOOcycRtW/eFeIj2L1xg==
X-CSE-MsgGUID: 5jclnYPESwaF8ZXnaLDSnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98646217"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="98646217"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 13:01:15 -0700
X-CSE-ConnectionGUID: +vq3YBynTmWr8ShSfEJJ5g==
X-CSE-MsgGUID: Ax8FRg8/SOSmCioHA4HSWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="288515599"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 13:01:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuF8R-00000000RWu-2fQz;
	Wed, 12 Aug 2026 20:01:11 +0000
Date: Thu, 13 Aug 2026 04:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:948
 npc_update_entry() error: buffer overflow 'kw' 8 <= 8
Message-ID: <202608130355.xYjI60dO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ratheesh Kannoth <rkannoth@marvell.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
commit: de3f88b465c8fda07b1dc44648a99f7dec390705 octeontx2-af: npc: cn20k: Prepare for new SoC
date:   6 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r071-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130355.xYjI60dO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: de3f88b465c8 ("octeontx2-af: npc: cn20k: Prepare for new SoC")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608130355.xYjI60dO-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:948 npc_update_entry() error: buffer overflow 'kw' 8 <= 8
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:953 npc_update_entry() error: buffer overflow 'kw_mask' 8 <= 8

Old smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:947 npc_update_entry() error: buffer overflow 'field->kw_mask' 8 <= 8
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:952 npc_update_entry() error: buffer overflow 'field->kw_mask' 8 <= 8
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:961 npc_update_entry() error: buffer overflow 'field->kw_mask' 8 <= 8
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:963 npc_update_entry() error: buffer overflow 'field->kw_mask' 8 <= 9
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:964 npc_update_entry() error: buffer overflow 'kw' 8 <= 8
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:965 npc_update_entry() error: buffer overflow 'kw' 8 <= 9
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:969 npc_update_entry() error: buffer overflow 'field->kw_mask' 8 <= 8
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:971 npc_update_entry() error: buffer overflow 'field->kw_mask' 8 <= 9
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:972 npc_update_entry() error: buffer overflow 'kw_mask' 8 <= 8
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c:973 npc_update_entry() error: buffer overflow 'kw_mask' 8 <= 9

vim +/kw +948 drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_fs.c

55307fcb925846d Subbaraya Sundeep 2020-11-15  893  
55307fcb925846d Subbaraya Sundeep 2020-11-15  894  /* npc_update_entry - Based on the masks generated during
55307fcb925846d Subbaraya Sundeep 2020-11-15  895   * the key scanning, updates the given entry with value and
55307fcb925846d Subbaraya Sundeep 2020-11-15  896   * masks for the field of interest. Maximum 16 bytes of a packet
55307fcb925846d Subbaraya Sundeep 2020-11-15  897   * header can be extracted by HW hence lo and hi are sufficient.
55307fcb925846d Subbaraya Sundeep 2020-11-15  898   * When field bytes are less than or equal to 8 then hi should be
55307fcb925846d Subbaraya Sundeep 2020-11-15  899   * 0 for value and mask.
55307fcb925846d Subbaraya Sundeep 2020-11-15  900   *
55307fcb925846d Subbaraya Sundeep 2020-11-15  901   * If exact match of value is required then mask should be all 1's.
55307fcb925846d Subbaraya Sundeep 2020-11-15  902   * If any bits in mask are 0 then corresponding bits in value are
55307fcb925846d Subbaraya Sundeep 2020-11-15  903   * dont care.
55307fcb925846d Subbaraya Sundeep 2020-11-15  904   */
56d9f5fd2246241 Ratheesh Kannoth  2022-07-08  905  void npc_update_entry(struct rvu *rvu, enum key_fields type,
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  906  		      struct mcam_entry_mdata *mdata, u64 val_lo,
55307fcb925846d Subbaraya Sundeep 2020-11-15  907  		      u64 val_hi, u64 mask_lo, u64 mask_hi, u8 intf)
55307fcb925846d Subbaraya Sundeep 2020-11-15  908  {
55307fcb925846d Subbaraya Sundeep 2020-11-15  909  	struct npc_mcam *mcam = &rvu->hw->mcam;
55307fcb925846d Subbaraya Sundeep 2020-11-15  910  	struct mcam_entry dummy = { {0} };
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  911  	u64 *kw, *kw_mask, *val, *mask;
55307fcb925846d Subbaraya Sundeep 2020-11-15  912  	struct npc_key_field *field;
55307fcb925846d Subbaraya Sundeep 2020-11-15  913  	u64 kw1, kw2, kw3;
ef992a0f12e8268 Suman Ghosh       2026-02-24  914  	int i, max_kw;
55307fcb925846d Subbaraya Sundeep 2020-11-15  915  	u8 shift;
55307fcb925846d Subbaraya Sundeep 2020-11-15  916  
55307fcb925846d Subbaraya Sundeep 2020-11-15  917  	field = &mcam->rx_key_fields[type];
55307fcb925846d Subbaraya Sundeep 2020-11-15  918  	if (is_npc_intf_tx(intf))
55307fcb925846d Subbaraya Sundeep 2020-11-15  919  		field = &mcam->tx_key_fields[type];
55307fcb925846d Subbaraya Sundeep 2020-11-15  920  
55307fcb925846d Subbaraya Sundeep 2020-11-15  921  	if (!field->nr_kws)
55307fcb925846d Subbaraya Sundeep 2020-11-15  922  		return;
55307fcb925846d Subbaraya Sundeep 2020-11-15  923  
ef992a0f12e8268 Suman Ghosh       2026-02-24  924  	max_kw = NPC_MAX_KWS_IN_KEY;
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  925  	kw = dummy.kw;
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  926  	kw_mask = dummy.kw_mask;
ef992a0f12e8268 Suman Ghosh       2026-02-24  927  
ef992a0f12e8268 Suman Ghosh       2026-02-24  928  	for (i = 0; i < max_kw; i++) {
55307fcb925846d Subbaraya Sundeep 2020-11-15  929  		if (!field->kw_mask[i])
55307fcb925846d Subbaraya Sundeep 2020-11-15  930  			continue;
55307fcb925846d Subbaraya Sundeep 2020-11-15  931  		/* place key value in kw[x] */
55307fcb925846d Subbaraya Sundeep 2020-11-15  932  		shift = __ffs64(field->kw_mask[i]);
55307fcb925846d Subbaraya Sundeep 2020-11-15  933  		/* update entry value */
55307fcb925846d Subbaraya Sundeep 2020-11-15  934  		kw1 = (val_lo << shift) & field->kw_mask[i];
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  935  		kw[i] = kw1;
55307fcb925846d Subbaraya Sundeep 2020-11-15  936  		/* update entry mask */
55307fcb925846d Subbaraya Sundeep 2020-11-15  937  		kw1 = (mask_lo << shift) & field->kw_mask[i];
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  938  		kw_mask[i] = kw1;
55307fcb925846d Subbaraya Sundeep 2020-11-15  939  
55307fcb925846d Subbaraya Sundeep 2020-11-15  940  		if (field->nr_kws == 1)
55307fcb925846d Subbaraya Sundeep 2020-11-15  941  			break;
55307fcb925846d Subbaraya Sundeep 2020-11-15  942  		/* place remaining bits of key value in kw[x + 1] */
55307fcb925846d Subbaraya Sundeep 2020-11-15  943  		if (field->nr_kws == 2) {
55307fcb925846d Subbaraya Sundeep 2020-11-15  944  			/* update entry value */
55307fcb925846d Subbaraya Sundeep 2020-11-15  945  			kw2 = shift ? val_lo >> (64 - shift) : 0;
55307fcb925846d Subbaraya Sundeep 2020-11-15  946  			kw2 |= (val_hi << shift);
55307fcb925846d Subbaraya Sundeep 2020-11-15  947  			kw2 &= field->kw_mask[i + 1];
de3f88b465c8fda Ratheesh Kannoth  2026-02-24 @948  			kw[i + 1] = kw2;
55307fcb925846d Subbaraya Sundeep 2020-11-15  949  			/* update entry mask */
55307fcb925846d Subbaraya Sundeep 2020-11-15  950  			kw2 = shift ? mask_lo >> (64 - shift) : 0;
55307fcb925846d Subbaraya Sundeep 2020-11-15  951  			kw2 |= (mask_hi << shift);
55307fcb925846d Subbaraya Sundeep 2020-11-15  952  			kw2 &= field->kw_mask[i + 1];
de3f88b465c8fda Ratheesh Kannoth  2026-02-24 @953  			kw_mask[i + 1] = kw2;
55307fcb925846d Subbaraya Sundeep 2020-11-15  954  			break;
55307fcb925846d Subbaraya Sundeep 2020-11-15  955  		}
55307fcb925846d Subbaraya Sundeep 2020-11-15  956  		/* place remaining bits of key value in kw[x + 1], kw[x + 2] */
55307fcb925846d Subbaraya Sundeep 2020-11-15  957  		if (field->nr_kws == 3) {
55307fcb925846d Subbaraya Sundeep 2020-11-15  958  			/* update entry value */
55307fcb925846d Subbaraya Sundeep 2020-11-15  959  			kw2 = shift ? val_lo >> (64 - shift) : 0;
55307fcb925846d Subbaraya Sundeep 2020-11-15  960  			kw2 |= (val_hi << shift);
55307fcb925846d Subbaraya Sundeep 2020-11-15  961  			kw2 &= field->kw_mask[i + 1];
55307fcb925846d Subbaraya Sundeep 2020-11-15  962  			kw3 = shift ? val_hi >> (64 - shift) : 0;
55307fcb925846d Subbaraya Sundeep 2020-11-15  963  			kw3 &= field->kw_mask[i + 2];
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  964  			kw[i + 1] = kw2;
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  965  			kw[i + 2] = kw3;
55307fcb925846d Subbaraya Sundeep 2020-11-15  966  			/* update entry mask */
55307fcb925846d Subbaraya Sundeep 2020-11-15  967  			kw2 = shift ? mask_lo >> (64 - shift) : 0;
55307fcb925846d Subbaraya Sundeep 2020-11-15  968  			kw2 |= (mask_hi << shift);
55307fcb925846d Subbaraya Sundeep 2020-11-15  969  			kw2 &= field->kw_mask[i + 1];
55307fcb925846d Subbaraya Sundeep 2020-11-15  970  			kw3 = shift ? mask_hi >> (64 - shift) : 0;
55307fcb925846d Subbaraya Sundeep 2020-11-15  971  			kw3 &= field->kw_mask[i + 2];
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  972  			kw_mask[i + 1] = kw2;
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  973  			kw_mask[i + 2] = kw3;
55307fcb925846d Subbaraya Sundeep 2020-11-15  974  			break;
55307fcb925846d Subbaraya Sundeep 2020-11-15  975  		}
55307fcb925846d Subbaraya Sundeep 2020-11-15  976  	}
55307fcb925846d Subbaraya Sundeep 2020-11-15  977  	/* dummy is ready with values and masks for given key
55307fcb925846d Subbaraya Sundeep 2020-11-15  978  	 * field now clear and update input entry with those
55307fcb925846d Subbaraya Sundeep 2020-11-15  979  	 */
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  980  
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  981  	val = mdata->kw;
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  982  	mask = mdata->kw_mask;
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  983  
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  984  	for (i = 0; i < max_kw; i++, val++, mask++) {
55307fcb925846d Subbaraya Sundeep 2020-11-15  985  		if (!field->kw_mask[i])
55307fcb925846d Subbaraya Sundeep 2020-11-15  986  			continue;
55307fcb925846d Subbaraya Sundeep 2020-11-15  987  
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  988  		*val &= ~field->kw_mask[i];
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  989  		*mask &= ~field->kw_mask[i];
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  990  
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  991  		*val |= kw[i];
de3f88b465c8fda Ratheesh Kannoth  2026-02-24  992  		*mask |= kw_mask[i];
55307fcb925846d Subbaraya Sundeep 2020-11-15  993  	}
55307fcb925846d Subbaraya Sundeep 2020-11-15  994  }
55307fcb925846d Subbaraya Sundeep 2020-11-15  995  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

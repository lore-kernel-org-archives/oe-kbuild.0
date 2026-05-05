Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7373451A9
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981854; cv=none; b=n1OclBH4qX4autqLEUk2Ya1775nKqEiWVYS73zGfb/ZQqWcqqHla8AUHQ/HH7u0wLO14f0YOYi9fB5GRYESIdbSTh3Q+OMoHrPNJmgpw4WFLw0GvcC06yU9LXou9iIfRf1+Q04limI3ELV2aNR1oICvsXI90BQAhuZVkJaVXUcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981854; c=relaxed/simple;
	bh=Ir3aQq+/uJZiSyXI8IZEHxcfXu9SjqTXASNnqx9Jew0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZXvd29SFMq6e//3ZXSSbh6iZ1UiKbO8YBnC6MG97snoK0Bcn7D047VKK5gEBDflIImq4Uzfs/xQEDVWq143IZUZa2Km/JXQgucRNJ/ZrohHFVSuomdlysg7L3ZG1hZyYEbj3/lkHy4+wwkorIWRL2Oyg1WGNqyC93Knr9ksKWYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBbfAIty; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBbfAIty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777981851; x=1809517851;
  h=date:from:to:cc:subject:message-id;
  bh=Ir3aQq+/uJZiSyXI8IZEHxcfXu9SjqTXASNnqx9Jew0=;
  b=oBbfAIty0ReHZHG9iZqRWv/LosPYSke4na5KWpckkwyBZgZ6iwi12t39
   Vpm/uJGdho+iV6oMCCNwm1bA6pB3qUlcDMNbPDY6CRqHU6FO9h3qUEQ3I
   hGa9A90TtgfzmARVWzVk6c0JN0X2+T5IqpbKNmESy9NbJXNAHziO3AWdU
   E0E4E6f/KHKKg4BLCcWbo1fseaWaTe3xU8549rlnXdxt1TsFbDscyWCBk
   BYtDp9PyW0EZMCMtHFOwiY6Zu6WQiqpk2dzSZQQcC97WGkOCdmSGgdE0D
   PWMfDk8yI8LQMawZPMKbwr6ZUFYN94auAO/vM9gPWmHVQG+YU9lMWSSHm
   Q==;
X-CSE-ConnectionGUID: P5eZCJ/9RrmY/dvPjVoA7Q==
X-CSE-MsgGUID: xa83TqIsTZ6QyhiBVmT2cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66377022"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="66377022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 04:50:50 -0700
X-CSE-ConnectionGUID: UK0D00NLTROVYsMiGS1IaQ==
X-CSE-MsgGUID: vsXS6bcISb2BXo86Srrblw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="232653365"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 May 2026 04:50:49 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKEIY-00000000077-18W4;
	Tue, 05 May 2026 11:50:46 +0000
Date: Tue, 05 May 2026 19:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2139/2816] fs/ntfs/attrib.c:2631
 ntfs_attr_add() warn: variable dereferenced before check 'ni' (see line 2628)
Message-ID: <202605051951.OStHgx7p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
commit: ae00c45e40f1eb19428865ee3a3f487a454bdc20 [2139/2816] ntfs: fix variable dereferenced before check ni in ntfs_attr_open()
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r071-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051951.OStHgx7p-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605051951.OStHgx7p-lkp@intel.com/

New smatch warnings:
fs/ntfs/attrib.c:2631 ntfs_attr_add() warn: variable dereferenced before check 'ni' (see line 2628)

Old smatch warnings:
fs/ntfs/attrib.c:2930 ntfs_attr_open() warn: variable dereferenced before check 'ni' (see line 2927)

vim +/ni +2631 fs/ntfs/attrib.c

495e90fa334828 Namjae Jeon   2026-02-13  2589  
495e90fa334828 Namjae Jeon   2026-02-13  2590  /*
495e90fa334828 Namjae Jeon   2026-02-13  2591   * ntfs_attr_add - add attribute to inode
495e90fa334828 Namjae Jeon   2026-02-13  2592   * @ni:		opened ntfs inode to which add attribute
495e90fa334828 Namjae Jeon   2026-02-13  2593   * @type:	type of the new attribute
495e90fa334828 Namjae Jeon   2026-02-13  2594   * @name:	name in unicode of the new attribute
495e90fa334828 Namjae Jeon   2026-02-13  2595   * @name_len:	name length in unicode characters of the new attribute
495e90fa334828 Namjae Jeon   2026-02-13  2596   * @val:	value of new attribute
495e90fa334828 Namjae Jeon   2026-02-13  2597   * @size:	size of the new attribute / length of @val (if specified)
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2598   *
495e90fa334828 Namjae Jeon   2026-02-13  2599   * @val should always be specified for always resident attributes (eg. FILE_NAME
495e90fa334828 Namjae Jeon   2026-02-13  2600   * attribute), for attributes that can become non-resident @val can be NULL
495e90fa334828 Namjae Jeon   2026-02-13  2601   * (eg. DATA attribute). @size can be specified even if @val is NULL, in this
495e90fa334828 Namjae Jeon   2026-02-13  2602   * case data size will be equal to @size and initialized size will be equal
495e90fa334828 Namjae Jeon   2026-02-13  2603   * to 0.
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2604   *
495e90fa334828 Namjae Jeon   2026-02-13  2605   * If inode haven't got enough space to add attribute, add attribute to one of
495e90fa334828 Namjae Jeon   2026-02-13  2606   * it extents, if no extents present or no one of them have enough space, than
495e90fa334828 Namjae Jeon   2026-02-13  2607   * allocate new extent and add attribute to it.
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2608   *
495e90fa334828 Namjae Jeon   2026-02-13  2609   * If on one of this steps attribute list is needed but not present, than it is
495e90fa334828 Namjae Jeon   2026-02-13  2610   * added transparently to caller. So, this function should not be called with
495e90fa334828 Namjae Jeon   2026-02-13  2611   * @type == AT_ATTRIBUTE_LIST, if you really need to add attribute list call
495e90fa334828 Namjae Jeon   2026-02-13  2612   * ntfs_inode_add_attrlist instead.
495e90fa334828 Namjae Jeon   2026-02-13  2613   *
495e90fa334828 Namjae Jeon   2026-02-13  2614   * On success return 0. On error return -1 with errno set to the error code.
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2615   */
495e90fa334828 Namjae Jeon   2026-02-13  2616  int ntfs_attr_add(struct ntfs_inode *ni, __le32 type,
495e90fa334828 Namjae Jeon   2026-02-13  2617  		__le16 *name, u8 name_len, u8 *val, s64 size)
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2618  {
495e90fa334828 Namjae Jeon   2026-02-13  2619  	struct super_block *sb;
495e90fa334828 Namjae Jeon   2026-02-13  2620  	u32 attr_rec_size;
495e90fa334828 Namjae Jeon   2026-02-13  2621  	int err, i, offset;
495e90fa334828 Namjae Jeon   2026-02-13  2622  	bool is_resident;
495e90fa334828 Namjae Jeon   2026-02-13  2623  	bool can_be_non_resident = false;
495e90fa334828 Namjae Jeon   2026-02-13  2624  	struct ntfs_inode *attr_ni;
495e90fa334828 Namjae Jeon   2026-02-13  2625  	struct inode *attr_vi;
495e90fa334828 Namjae Jeon   2026-02-13  2626  	struct mft_record *ni_mrec;
495e90fa334828 Namjae Jeon   2026-02-13  2627  
ae00c45e40f1eb Namjae Jeon   2026-05-01 @2628  	ntfs_debug("Entering for inode 0x%llx, attr %x, size %lld.\n",
ae00c45e40f1eb Namjae Jeon   2026-05-01  2629  			ni->mft_no, type, size);
ae00c45e40f1eb Namjae Jeon   2026-05-01  2630  
495e90fa334828 Namjae Jeon   2026-02-13 @2631  	if (!ni || size < 0 || type == AT_ATTRIBUTE_LIST)
495e90fa334828 Namjae Jeon   2026-02-13  2632  		return -EINVAL;
495e90fa334828 Namjae Jeon   2026-02-13  2633  
495e90fa334828 Namjae Jeon   2026-02-13  2634  	if (ni->nr_extents == -1)
495e90fa334828 Namjae Jeon   2026-02-13  2635  		ni = ni->ext.base_ntfs_ino;
495e90fa334828 Namjae Jeon   2026-02-13  2636  
495e90fa334828 Namjae Jeon   2026-02-13  2637  	/* Check the attribute type and the size. */
495e90fa334828 Namjae Jeon   2026-02-13  2638  	err = ntfs_attr_size_bounds_check(ni->vol, type, size);
495e90fa334828 Namjae Jeon   2026-02-13  2639  	if (err) {
495e90fa334828 Namjae Jeon   2026-02-13  2640  		if (err == -ENOENT)
495e90fa334828 Namjae Jeon   2026-02-13  2641  			err = -EIO;
495e90fa334828 Namjae Jeon   2026-02-13  2642  		return err;
495e90fa334828 Namjae Jeon   2026-02-13  2643  	}
495e90fa334828 Namjae Jeon   2026-02-13  2644  
495e90fa334828 Namjae Jeon   2026-02-13  2645  	sb = ni->vol->sb;
495e90fa334828 Namjae Jeon   2026-02-13  2646  	/* Sanity checks for always resident attributes. */
495e90fa334828 Namjae Jeon   2026-02-13  2647  	err = ntfs_attr_can_be_non_resident(ni->vol, type);
495e90fa334828 Namjae Jeon   2026-02-13  2648  	if (err) {
495e90fa334828 Namjae Jeon   2026-02-13  2649  		if (err != -EPERM) {
495e90fa334828 Namjae Jeon   2026-02-13  2650  			ntfs_error(sb, "ntfs_attr_can_be_non_resident failed");
495e90fa334828 Namjae Jeon   2026-02-13  2651  			goto err_out;
495e90fa334828 Namjae Jeon   2026-02-13  2652  		}
495e90fa334828 Namjae Jeon   2026-02-13  2653  		/* @val is mandatory. */
495e90fa334828 Namjae Jeon   2026-02-13  2654  		if (!val) {
495e90fa334828 Namjae Jeon   2026-02-13  2655  			ntfs_error(sb,
495e90fa334828 Namjae Jeon   2026-02-13  2656  				"val is mandatory for always resident attributes");
495e90fa334828 Namjae Jeon   2026-02-13  2657  			return -EINVAL;
495e90fa334828 Namjae Jeon   2026-02-13  2658  		}
495e90fa334828 Namjae Jeon   2026-02-13  2659  		if (size > ni->vol->mft_record_size) {
495e90fa334828 Namjae Jeon   2026-02-13  2660  			ntfs_error(sb, "Attribute is too big");
495e90fa334828 Namjae Jeon   2026-02-13  2661  			return -ERANGE;
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2662  		}
495e90fa334828 Namjae Jeon   2026-02-13  2663  	} else
495e90fa334828 Namjae Jeon   2026-02-13  2664  		can_be_non_resident = true;
495e90fa334828 Namjae Jeon   2026-02-13  2665  
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2666  	/*
495e90fa334828 Namjae Jeon   2026-02-13  2667  	 * Determine resident or not will be new attribute. We add 8 to size in
495e90fa334828 Namjae Jeon   2026-02-13  2668  	 * non resident case for mapping pairs.
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2669  	 */
495e90fa334828 Namjae Jeon   2026-02-13  2670  	err = ntfs_attr_can_be_resident(ni->vol, type);
495e90fa334828 Namjae Jeon   2026-02-13  2671  	if (!err) {
495e90fa334828 Namjae Jeon   2026-02-13  2672  		is_resident = true;
495e90fa334828 Namjae Jeon   2026-02-13  2673  	} else {
495e90fa334828 Namjae Jeon   2026-02-13  2674  		if (err != -EPERM) {
495e90fa334828 Namjae Jeon   2026-02-13  2675  			ntfs_error(sb, "ntfs_attr_can_be_resident failed");
495e90fa334828 Namjae Jeon   2026-02-13  2676  			goto err_out;
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2677  		}
495e90fa334828 Namjae Jeon   2026-02-13  2678  		is_resident = false;
495e90fa334828 Namjae Jeon   2026-02-13  2679  	}
495e90fa334828 Namjae Jeon   2026-02-13  2680  
495e90fa334828 Namjae Jeon   2026-02-13  2681  	/* Calculate attribute record size. */
495e90fa334828 Namjae Jeon   2026-02-13  2682  	if (is_resident)
495e90fa334828 Namjae Jeon   2026-02-13  2683  		attr_rec_size = offsetof(struct attr_record, data.resident.reserved) +
495e90fa334828 Namjae Jeon   2026-02-13  2684  			1 +
495e90fa334828 Namjae Jeon   2026-02-13  2685  			((name_len * sizeof(__le16) + 7) & ~7) +
495e90fa334828 Namjae Jeon   2026-02-13  2686  			((size + 7) & ~7);
495e90fa334828 Namjae Jeon   2026-02-13  2687  	else
495e90fa334828 Namjae Jeon   2026-02-13  2688  		attr_rec_size = offsetof(struct attr_record, data.non_resident.compressed_size) +
495e90fa334828 Namjae Jeon   2026-02-13  2689  			((name_len * sizeof(__le16) + 7) & ~7) + 8;
495e90fa334828 Namjae Jeon   2026-02-13  2690  
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2691  	/*
495e90fa334828 Namjae Jeon   2026-02-13  2692  	 * If we have enough free space for the new attribute in the base MFT
495e90fa334828 Namjae Jeon   2026-02-13  2693  	 * record, then add attribute to it.
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2694  	 */
495e90fa334828 Namjae Jeon   2026-02-13  2695  retry:
495e90fa334828 Namjae Jeon   2026-02-13  2696  	ni_mrec = map_mft_record(ni);
495e90fa334828 Namjae Jeon   2026-02-13  2697  	if (IS_ERR(ni_mrec)) {
495e90fa334828 Namjae Jeon   2026-02-13  2698  		err = -EIO;
495e90fa334828 Namjae Jeon   2026-02-13  2699  		goto err_out;
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2700  	}
495e90fa334828 Namjae Jeon   2026-02-13  2701  
495e90fa334828 Namjae Jeon   2026-02-13  2702  	if (le32_to_cpu(ni_mrec->bytes_allocated) -
495e90fa334828 Namjae Jeon   2026-02-13  2703  			le32_to_cpu(ni_mrec->bytes_in_use) >= attr_rec_size) {
495e90fa334828 Namjae Jeon   2026-02-13  2704  		attr_ni = ni;
495e90fa334828 Namjae Jeon   2026-02-13  2705  		unmap_mft_record(ni);
495e90fa334828 Namjae Jeon   2026-02-13  2706  		goto add_attr_record;
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2707  	}
495e90fa334828 Namjae Jeon   2026-02-13  2708  	unmap_mft_record(ni);
495e90fa334828 Namjae Jeon   2026-02-13  2709  
495e90fa334828 Namjae Jeon   2026-02-13  2710  	/* Try to add to extent inodes. */
495e90fa334828 Namjae Jeon   2026-02-13  2711  	err = ntfs_inode_attach_all_extents(ni);
495e90fa334828 Namjae Jeon   2026-02-13  2712  	if (err) {
495e90fa334828 Namjae Jeon   2026-02-13  2713  		ntfs_error(sb, "Failed to attach all extents to inode");
495e90fa334828 Namjae Jeon   2026-02-13  2714  		goto err_out;
495e90fa334828 Namjae Jeon   2026-02-13  2715  	}
495e90fa334828 Namjae Jeon   2026-02-13  2716  
495e90fa334828 Namjae Jeon   2026-02-13  2717  	for (i = 0; i < ni->nr_extents; i++) {
495e90fa334828 Namjae Jeon   2026-02-13  2718  		attr_ni = ni->ext.extent_ntfs_inos[i];
495e90fa334828 Namjae Jeon   2026-02-13  2719  		ni_mrec = map_mft_record(attr_ni);
495e90fa334828 Namjae Jeon   2026-02-13  2720  		if (IS_ERR(ni_mrec)) {
495e90fa334828 Namjae Jeon   2026-02-13  2721  			err = -EIO;
495e90fa334828 Namjae Jeon   2026-02-13  2722  			goto err_out;
495e90fa334828 Namjae Jeon   2026-02-13  2723  		}
495e90fa334828 Namjae Jeon   2026-02-13  2724  
495e90fa334828 Namjae Jeon   2026-02-13  2725  		if (le32_to_cpu(ni_mrec->bytes_allocated) -
495e90fa334828 Namjae Jeon   2026-02-13  2726  				le32_to_cpu(ni_mrec->bytes_in_use) >=
495e90fa334828 Namjae Jeon   2026-02-13  2727  				attr_rec_size) {
495e90fa334828 Namjae Jeon   2026-02-13  2728  			unmap_mft_record(attr_ni);
495e90fa334828 Namjae Jeon   2026-02-13  2729  			goto add_attr_record;
495e90fa334828 Namjae Jeon   2026-02-13  2730  		}
495e90fa334828 Namjae Jeon   2026-02-13  2731  		unmap_mft_record(attr_ni);
495e90fa334828 Namjae Jeon   2026-02-13  2732  	}
495e90fa334828 Namjae Jeon   2026-02-13  2733  
495e90fa334828 Namjae Jeon   2026-02-13  2734  	/* There is no extent that contain enough space for new attribute. */
495e90fa334828 Namjae Jeon   2026-02-13  2735  	if (!NInoAttrList(ni)) {
495e90fa334828 Namjae Jeon   2026-02-13  2736  		/* Add attribute list not present, add it and retry. */
495e90fa334828 Namjae Jeon   2026-02-13  2737  		err = ntfs_inode_add_attrlist(ni);
495e90fa334828 Namjae Jeon   2026-02-13  2738  		if (err) {
495e90fa334828 Namjae Jeon   2026-02-13  2739  			ntfs_error(sb, "Failed to add attribute list");
495e90fa334828 Namjae Jeon   2026-02-13  2740  			goto err_out;
495e90fa334828 Namjae Jeon   2026-02-13  2741  		}
495e90fa334828 Namjae Jeon   2026-02-13  2742  		goto retry;
495e90fa334828 Namjae Jeon   2026-02-13  2743  	}
495e90fa334828 Namjae Jeon   2026-02-13  2744  
495e90fa334828 Namjae Jeon   2026-02-13  2745  	attr_ni = NULL;
495e90fa334828 Namjae Jeon   2026-02-13  2746  	/* Allocate new extent. */
495e90fa334828 Namjae Jeon   2026-02-13  2747  	err = ntfs_mft_record_alloc(ni->vol, 0, &attr_ni, ni, NULL);
495e90fa334828 Namjae Jeon   2026-02-13  2748  	if (err) {
495e90fa334828 Namjae Jeon   2026-02-13  2749  		ntfs_error(sb, "Failed to allocate extent record");
495e90fa334828 Namjae Jeon   2026-02-13  2750  		goto err_out;
495e90fa334828 Namjae Jeon   2026-02-13  2751  	}
495e90fa334828 Namjae Jeon   2026-02-13  2752  	unmap_mft_record(attr_ni);
495e90fa334828 Namjae Jeon   2026-02-13  2753  
495e90fa334828 Namjae Jeon   2026-02-13  2754  add_attr_record:
495e90fa334828 Namjae Jeon   2026-02-13  2755  	if (is_resident) {
495e90fa334828 Namjae Jeon   2026-02-13  2756  		/* Add resident attribute. */
495e90fa334828 Namjae Jeon   2026-02-13  2757  		offset = ntfs_resident_attr_record_add(attr_ni, type, name,
495e90fa334828 Namjae Jeon   2026-02-13  2758  				name_len, val, size, 0);
495e90fa334828 Namjae Jeon   2026-02-13  2759  		if (offset < 0) {
495e90fa334828 Namjae Jeon   2026-02-13  2760  			if (offset == -ENOSPC && can_be_non_resident)
495e90fa334828 Namjae Jeon   2026-02-13  2761  				goto add_non_resident;
495e90fa334828 Namjae Jeon   2026-02-13  2762  			err = offset;
495e90fa334828 Namjae Jeon   2026-02-13  2763  			ntfs_error(sb, "Failed to add resident attribute");
495e90fa334828 Namjae Jeon   2026-02-13  2764  			goto free_err_out;
495e90fa334828 Namjae Jeon   2026-02-13  2765  		}
495e90fa334828 Namjae Jeon   2026-02-13  2766  		return 0;
495e90fa334828 Namjae Jeon   2026-02-13  2767  	}
495e90fa334828 Namjae Jeon   2026-02-13  2768  
495e90fa334828 Namjae Jeon   2026-02-13  2769  add_non_resident:
495e90fa334828 Namjae Jeon   2026-02-13  2770  	/* Add non resident attribute. */
495e90fa334828 Namjae Jeon   2026-02-13  2771  	offset = ntfs_non_resident_attr_record_add(attr_ni, type, name,
495e90fa334828 Namjae Jeon   2026-02-13  2772  			name_len, 0, 8, 0);
495e90fa334828 Namjae Jeon   2026-02-13  2773  	if (offset < 0) {
495e90fa334828 Namjae Jeon   2026-02-13  2774  		err = offset;
495e90fa334828 Namjae Jeon   2026-02-13  2775  		ntfs_error(sb, "Failed to add non resident attribute");
495e90fa334828 Namjae Jeon   2026-02-13  2776  		goto free_err_out;
495e90fa334828 Namjae Jeon   2026-02-13  2777  	}
495e90fa334828 Namjae Jeon   2026-02-13  2778  
495e90fa334828 Namjae Jeon   2026-02-13  2779  	/* If @size == 0, we are done. */
495e90fa334828 Namjae Jeon   2026-02-13  2780  	if (!size)
495e90fa334828 Namjae Jeon   2026-02-13  2781  		return 0;
495e90fa334828 Namjae Jeon   2026-02-13  2782  
495e90fa334828 Namjae Jeon   2026-02-13  2783  	/* Open new attribute and resize it. */
495e90fa334828 Namjae Jeon   2026-02-13  2784  	attr_vi = ntfs_attr_iget(VFS_I(ni), type, name, name_len);
495e90fa334828 Namjae Jeon   2026-02-13  2785  	if (IS_ERR(attr_vi)) {
1c85157ea88e87 Ethan Tidmore 2026-02-26  2786  		err = PTR_ERR(attr_vi);
495e90fa334828 Namjae Jeon   2026-02-13  2787  		ntfs_error(sb, "Failed to open just added attribute");
495e90fa334828 Namjae Jeon   2026-02-13  2788  		goto rm_attr_err_out;
495e90fa334828 Namjae Jeon   2026-02-13  2789  	}
495e90fa334828 Namjae Jeon   2026-02-13  2790  	attr_ni = NTFS_I(attr_vi);
495e90fa334828 Namjae Jeon   2026-02-13  2791  
495e90fa334828 Namjae Jeon   2026-02-13  2792  	/* Resize and set attribute value. */
495e90fa334828 Namjae Jeon   2026-02-13  2793  	if (ntfs_attr_truncate(attr_ni, size) ||
495e90fa334828 Namjae Jeon   2026-02-13  2794  		(val && (ntfs_inode_attr_pwrite(attr_vi, 0, size, val, false) != size))) {
495e90fa334828 Namjae Jeon   2026-02-13  2795  		err = -EIO;
495e90fa334828 Namjae Jeon   2026-02-13  2796  		ntfs_error(sb, "Failed to initialize just added attribute");
495e90fa334828 Namjae Jeon   2026-02-13  2797  		if (ntfs_attr_rm(attr_ni))
495e90fa334828 Namjae Jeon   2026-02-13  2798  			ntfs_error(sb, "Failed to remove just added attribute");
495e90fa334828 Namjae Jeon   2026-02-13  2799  		iput(attr_vi);
495e90fa334828 Namjae Jeon   2026-02-13  2800  		goto err_out;
495e90fa334828 Namjae Jeon   2026-02-13  2801  	}
495e90fa334828 Namjae Jeon   2026-02-13  2802  	iput(attr_vi);
1e9ea7e04472d4 Namjae Jeon   2025-12-30  2803  	return 0;
495e90fa334828 Namjae Jeon   2026-02-13  2804  
495e90fa334828 Namjae Jeon   2026-02-13  2805  rm_attr_err_out:
495e90fa334828 Namjae Jeon   2026-02-13  2806  	/* Remove just added attribute. */
495e90fa334828 Namjae Jeon   2026-02-13  2807  	ni_mrec = map_mft_record(attr_ni);
495e90fa334828 Namjae Jeon   2026-02-13  2808  	if (!IS_ERR(ni_mrec)) {
495e90fa334828 Namjae Jeon   2026-02-13  2809  		if (ntfs_attr_record_resize(ni_mrec,
495e90fa334828 Namjae Jeon   2026-02-13  2810  					(struct attr_record *)((u8 *)ni_mrec + offset), 0))
495e90fa334828 Namjae Jeon   2026-02-13  2811  			ntfs_error(sb, "Failed to remove just added attribute #2");
495e90fa334828 Namjae Jeon   2026-02-13  2812  		unmap_mft_record(attr_ni);
495e90fa334828 Namjae Jeon   2026-02-13  2813  	} else
495e90fa334828 Namjae Jeon   2026-02-13  2814  		pr_err("EIO when try to remove new added attr\n");
495e90fa334828 Namjae Jeon   2026-02-13  2815  
495e90fa334828 Namjae Jeon   2026-02-13  2816  free_err_out:
495e90fa334828 Namjae Jeon   2026-02-13  2817  	/* Free MFT record, if it doesn't contain attributes. */
495e90fa334828 Namjae Jeon   2026-02-13  2818  	ni_mrec = map_mft_record(attr_ni);
495e90fa334828 Namjae Jeon   2026-02-13  2819  	if (!IS_ERR(ni_mrec)) {
495e90fa334828 Namjae Jeon   2026-02-13  2820  		int attr_size;
495e90fa334828 Namjae Jeon   2026-02-13  2821  
495e90fa334828 Namjae Jeon   2026-02-13  2822  		attr_size = le32_to_cpu(ni_mrec->bytes_in_use) -
495e90fa334828 Namjae Jeon   2026-02-13  2823  			le16_to_cpu(ni_mrec->attrs_offset);
495e90fa334828 Namjae Jeon   2026-02-13  2824  		unmap_mft_record(attr_ni);
495e90fa334828 Namjae Jeon   2026-02-13  2825  		if (attr_size == 8) {
495e90fa334828 Namjae Jeon   2026-02-13  2826  			if (ntfs_mft_record_free(attr_ni->vol, attr_ni))
495e90fa334828 Namjae Jeon   2026-02-13  2827  				ntfs_error(sb, "Failed to free MFT record");
495e90fa334828 Namjae Jeon   2026-02-13  2828  			if (attr_ni->nr_extents < 0)
495e90fa334828 Namjae Jeon   2026-02-13  2829  				ntfs_inode_close(attr_ni);
495e90fa334828 Namjae Jeon   2026-02-13  2830  		}
495e90fa334828 Namjae Jeon   2026-02-13  2831  	} else
495e90fa334828 Namjae Jeon   2026-02-13  2832  		pr_err("EIO when testing mft record is free-able\n");
495e90fa334828 Namjae Jeon   2026-02-13  2833  
495e90fa334828 Namjae Jeon   2026-02-13  2834  err_out:
495e90fa334828 Namjae Jeon   2026-02-13  2835  	return err;
495e90fa334828 Namjae Jeon   2026-02-13  2836  }
495e90fa334828 Namjae Jeon   2026-02-13  2837  

:::::: The code at line 2631 was first introduced by commit
:::::: 495e90fa334828d4119061e2726af51d0a0fb4ed ntfs: update attrib operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE266F2F2
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 00:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768178125; cv=none; b=k11TvEJ5PKjqPl59VyIsCECOjaQ3qW2v3EVP/0TxgyoKf6SyyBJC+SdPQdbeZXJlypzslpr24Cq4BUxHqHijGndT1CDMKOA1M7Eub2J0HuS933kckCgXNy3ZzEQFvaQgcPZCqfi9dUXl4eBPYOOgoCacdBkbswGlAhi5eA9jZWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768178125; c=relaxed/simple;
	bh=F2Y/tuIwg5a1p+I37KbajXptcfwwQRhMK58OT1seVrA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dDRnNNAN9ILKRAsEFN7hJ1fuKz3LRhApXff7accHxixL12ZBPAT0Q7hvg4oeEvb7Ti4ojStVYLauqy+i9ud/P1KDJQwQrJnAI9HqEnK0ShaN35x51MF4Yn4PvjaT7DUc6vg58O9xtUbMA+DeKCboYzkmr76cHSPnAw1dpjf79HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUbOvsbo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUbOvsbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768178123; x=1799714123;
  h=date:from:to:cc:subject:message-id;
  bh=F2Y/tuIwg5a1p+I37KbajXptcfwwQRhMK58OT1seVrA=;
  b=MUbOvsboiD7HKAyT5ukpmqfhOkc8AmgEtOPuSI335BT6xUX84b6whdZS
   9/pUxPNyn6y7s322WTA748P7ZE2/LTustbbZr2IFgGMwoO95XXYt3HnUC
   0BJG85WP7fuAGf7ImRwRAhCIh/6UXv1GB9443eqb7QrALRWv9IHuPNbHn
   T2vwW7S6Mh/DtOk6RjzWD6JYhzUinxCLZFKiFJnjsVoXuoFdX0CpnadxT
   oC4v9gD7NQiNejGVrcwNw0OgXTGqnJNSecvitnVtHoj4jAMluc9G/NzB7
   46F1B/g0fwybB6+6v4ulrSlZmFT5Y7NSHrUejcyfRKfRJrAFZLs640XrW
   Q==;
X-CSE-ConnectionGUID: 9jOnjNUmQU6Lutx0Ew5jew==
X-CSE-MsgGUID: QS100icUSbGh9+apimHsaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69440164"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69440164"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 16:35:23 -0800
X-CSE-ConnectionGUID: 8fY5q+cqRAeO5LCk3nOOmg==
X-CSE-MsgGUID: Qbx32JiLSGCKXjxB7Ydzbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="241488260"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2026 16:35:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf5tu-00000000Cno-404l;
	Mon, 12 Jan 2026 00:35:18 +0000
Date: Mon, 12 Jan 2026 08:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linkinjeon-ntfs:ntfs-next 13/14] fs/ntfs/runlist.c:692:63:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202601120819.3498fuXs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/ntfs/runlist.c:692:63: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   7a305a47bcefc8d9f628f92a700c741fa16e65a0
commit: d37f41f3e1352e866f9538ec5fcac9b44eae728f [13/14] ntfs: add Kconfig and Makefile
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: microblaze-randconfig-r134-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120819.3498fuXs-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120819.3498fuXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120819.3498fuXs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/ntfs/runlist.c: note: in included file (through fs/ntfs/volume.h, fs/ntfs/ntfs.h):
   fs/ntfs/layout.h:271:43: sparse: sparse: mixed bitwiseness
>> fs/ntfs/runlist.c:692:63: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/ntfs/runlist.c:692:13: sparse: signed value source

vim +692 fs/ntfs/runlist.c

2e08584e63de4ca Namjae Jeon 2025-12-30  660  
2e08584e63de4ca Namjae Jeon 2025-12-30  661  /**
2e08584e63de4ca Namjae Jeon 2025-12-30  662   * ntfs_mapping_pairs_decompress - convert mapping pairs array to runlist
2e08584e63de4ca Namjae Jeon 2025-12-30  663   *
2e08584e63de4ca Namjae Jeon 2025-12-30  664   * It is up to the caller to serialize access to the runlist @old_rl.
2e08584e63de4ca Namjae Jeon 2025-12-30  665   *
2e08584e63de4ca Namjae Jeon 2025-12-30  666   * Decompress the attribute @attr's mapping pairs array into a runlist. On
2e08584e63de4ca Namjae Jeon 2025-12-30  667   * success, return the decompressed runlist.
2e08584e63de4ca Namjae Jeon 2025-12-30  668   *
2e08584e63de4ca Namjae Jeon 2025-12-30  669   * If @old_rl is not NULL, decompressed runlist is inserted into the
2e08584e63de4ca Namjae Jeon 2025-12-30  670   * appropriate place in @old_rl and the resultant, combined runlist is
2e08584e63de4ca Namjae Jeon 2025-12-30  671   * returned. The original @old_rl is deallocated.
2e08584e63de4ca Namjae Jeon 2025-12-30  672   *
2e08584e63de4ca Namjae Jeon 2025-12-30  673   * On error, return -errno. @old_rl is left unmodified in that case.
2e08584e63de4ca Namjae Jeon 2025-12-30  674   */
d2efeba97f1c277 Namjae Jeon 2026-01-09  675  struct runlist_element *ntfs_mapping_pairs_decompress(const struct ntfs_volume *vol,
d2efeba97f1c277 Namjae Jeon 2026-01-09  676  		const struct attr_record *attr, struct runlist *old_runlist,
d2efeba97f1c277 Namjae Jeon 2026-01-09  677  		size_t *new_rl_count)
2e08584e63de4ca Namjae Jeon 2025-12-30  678  {
d2efeba97f1c277 Namjae Jeon 2026-01-09  679  	s64 vcn;		/* Current vcn. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  680  	s64 lcn;		/* Current lcn. */
2e08584e63de4ca Namjae Jeon 2025-12-30  681  	s64 deltaxcn;		/* Change in [vl]cn. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  682  	struct runlist_element *rl, *new_rl;	/* The output runlist. */
2e08584e63de4ca Namjae Jeon 2025-12-30  683  	u8 *buf;		/* Current position in mapping pairs array. */
2e08584e63de4ca Namjae Jeon 2025-12-30  684  	u8 *attr_end;		/* End of attribute. */
2e08584e63de4ca Namjae Jeon 2025-12-30  685  	int rlsize;		/* Size of runlist buffer. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  686  	u16 rlpos;		/* Current runlist position in units of struct runlist_elements. */
2e08584e63de4ca Namjae Jeon 2025-12-30  687  	u8 b;			/* Current byte offset in buf. */
2e08584e63de4ca Namjae Jeon 2025-12-30  688  
2e08584e63de4ca Namjae Jeon 2025-12-30  689  #ifdef DEBUG
2e08584e63de4ca Namjae Jeon 2025-12-30  690  	/* Make sure attr exists and is non-resident. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  691  	if (!attr || !attr->non_resident ||
d2efeba97f1c277 Namjae Jeon 2026-01-09 @692  	    le64_to_cpu(attr->data.non_resident.lowest_vcn) < 0) {
2e08584e63de4ca Namjae Jeon 2025-12-30  693  		ntfs_error(vol->sb, "Invalid arguments.");
2e08584e63de4ca Namjae Jeon 2025-12-30  694  		return ERR_PTR(-EINVAL);
2e08584e63de4ca Namjae Jeon 2025-12-30  695  	}
2e08584e63de4ca Namjae Jeon 2025-12-30  696  #endif
2e08584e63de4ca Namjae Jeon 2025-12-30  697  	/* Start at vcn = lowest_vcn and lcn 0. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  698  	vcn = le64_to_cpu(attr->data.non_resident.lowest_vcn);
2e08584e63de4ca Namjae Jeon 2025-12-30  699  	lcn = 0;
2e08584e63de4ca Namjae Jeon 2025-12-30  700  	/* Get start of the mapping pairs array. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  701  	buf = (u8 *)attr +
d2efeba97f1c277 Namjae Jeon 2026-01-09  702  		le16_to_cpu(attr->data.non_resident.mapping_pairs_offset);
2e08584e63de4ca Namjae Jeon 2025-12-30  703  	attr_end = (u8 *)attr + le32_to_cpu(attr->length);
2e08584e63de4ca Namjae Jeon 2025-12-30  704  	if (unlikely(buf < (u8 *)attr || buf > attr_end)) {
2e08584e63de4ca Namjae Jeon 2025-12-30  705  		ntfs_error(vol->sb, "Corrupt attribute.");
2e08584e63de4ca Namjae Jeon 2025-12-30  706  		return ERR_PTR(-EIO);
2e08584e63de4ca Namjae Jeon 2025-12-30  707  	}
d2efeba97f1c277 Namjae Jeon 2026-01-09  708  
2e08584e63de4ca Namjae Jeon 2025-12-30  709  	/* Current position in runlist array. */
2e08584e63de4ca Namjae Jeon 2025-12-30  710  	rlpos = 0;
2e08584e63de4ca Namjae Jeon 2025-12-30  711  	/* Allocate first page and set current runlist size to one page. */
2e08584e63de4ca Namjae Jeon 2025-12-30  712  	rl = ntfs_malloc_nofs(rlsize = PAGE_SIZE);
2e08584e63de4ca Namjae Jeon 2025-12-30  713  	if (unlikely(!rl))
2e08584e63de4ca Namjae Jeon 2025-12-30  714  		return ERR_PTR(-ENOMEM);
2e08584e63de4ca Namjae Jeon 2025-12-30  715  	/* Insert unmapped starting element if necessary. */
2e08584e63de4ca Namjae Jeon 2025-12-30  716  	if (vcn) {
2e08584e63de4ca Namjae Jeon 2025-12-30  717  		rl->vcn = 0;
2e08584e63de4ca Namjae Jeon 2025-12-30  718  		rl->lcn = LCN_RL_NOT_MAPPED;
2e08584e63de4ca Namjae Jeon 2025-12-30  719  		rl->length = vcn;
2e08584e63de4ca Namjae Jeon 2025-12-30  720  		rlpos++;
2e08584e63de4ca Namjae Jeon 2025-12-30  721  	}
2e08584e63de4ca Namjae Jeon 2025-12-30  722  	while (buf < attr_end && *buf) {
2e08584e63de4ca Namjae Jeon 2025-12-30  723  		/*
2e08584e63de4ca Namjae Jeon 2025-12-30  724  		 * Allocate more memory if needed, including space for the
2e08584e63de4ca Namjae Jeon 2025-12-30  725  		 * not-mapped and terminator elements. ntfs_malloc_nofs()
2e08584e63de4ca Namjae Jeon 2025-12-30  726  		 * operates on whole pages only.
2e08584e63de4ca Namjae Jeon 2025-12-30  727  		 */
d2efeba97f1c277 Namjae Jeon 2026-01-09  728  		if (((rlpos + 3) * sizeof(*rl)) > rlsize) {
d2efeba97f1c277 Namjae Jeon 2026-01-09  729  			struct runlist_element *rl2;
2e08584e63de4ca Namjae Jeon 2025-12-30  730  
2e08584e63de4ca Namjae Jeon 2025-12-30  731  			rl2 = ntfs_malloc_nofs(rlsize + (int)PAGE_SIZE);
2e08584e63de4ca Namjae Jeon 2025-12-30  732  			if (unlikely(!rl2)) {
2e08584e63de4ca Namjae Jeon 2025-12-30  733  				ntfs_free(rl);
2e08584e63de4ca Namjae Jeon 2025-12-30  734  				return ERR_PTR(-ENOMEM);
2e08584e63de4ca Namjae Jeon 2025-12-30  735  			}
2e08584e63de4ca Namjae Jeon 2025-12-30  736  			memcpy(rl2, rl, rlsize);
2e08584e63de4ca Namjae Jeon 2025-12-30  737  			ntfs_free(rl);
2e08584e63de4ca Namjae Jeon 2025-12-30  738  			rl = rl2;
2e08584e63de4ca Namjae Jeon 2025-12-30  739  			rlsize += PAGE_SIZE;
2e08584e63de4ca Namjae Jeon 2025-12-30  740  		}
2e08584e63de4ca Namjae Jeon 2025-12-30  741  		/* Enter the current vcn into the current runlist element. */
2e08584e63de4ca Namjae Jeon 2025-12-30  742  		rl[rlpos].vcn = vcn;
2e08584e63de4ca Namjae Jeon 2025-12-30  743  		/*
2e08584e63de4ca Namjae Jeon 2025-12-30  744  		 * Get the change in vcn, i.e. the run length in clusters.
2e08584e63de4ca Namjae Jeon 2025-12-30  745  		 * Doing it this way ensures that we signextend negative values.
2e08584e63de4ca Namjae Jeon 2025-12-30  746  		 * A negative run length doesn't make any sense, but hey, I
2e08584e63de4ca Namjae Jeon 2025-12-30  747  		 * didn't make up the NTFS specs and Windows NT4 treats the run
2e08584e63de4ca Namjae Jeon 2025-12-30  748  		 * length as a signed value so that's how it is...
2e08584e63de4ca Namjae Jeon 2025-12-30  749  		 */
2e08584e63de4ca Namjae Jeon 2025-12-30  750  		b = *buf & 0xf;
2e08584e63de4ca Namjae Jeon 2025-12-30  751  		if (b) {
2e08584e63de4ca Namjae Jeon 2025-12-30  752  			if (unlikely(buf + b > attr_end))
2e08584e63de4ca Namjae Jeon 2025-12-30  753  				goto io_error;
2e08584e63de4ca Namjae Jeon 2025-12-30  754  			for (deltaxcn = (s8)buf[b--]; b; b--)
2e08584e63de4ca Namjae Jeon 2025-12-30  755  				deltaxcn = (deltaxcn << 8) + buf[b];
2e08584e63de4ca Namjae Jeon 2025-12-30  756  		} else { /* The length entry is compulsory. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  757  			ntfs_error(vol->sb, "Missing length entry in mapping pairs array.");
2e08584e63de4ca Namjae Jeon 2025-12-30  758  			deltaxcn = (s64)-1;
2e08584e63de4ca Namjae Jeon 2025-12-30  759  		}
2e08584e63de4ca Namjae Jeon 2025-12-30  760  		/*
2e08584e63de4ca Namjae Jeon 2025-12-30  761  		 * Assume a negative length to indicate data corruption and
2e08584e63de4ca Namjae Jeon 2025-12-30  762  		 * hence clean-up and return NULL.
2e08584e63de4ca Namjae Jeon 2025-12-30  763  		 */
2e08584e63de4ca Namjae Jeon 2025-12-30  764  		if (unlikely(deltaxcn < 0)) {
d2efeba97f1c277 Namjae Jeon 2026-01-09  765  			ntfs_error(vol->sb, "Invalid length in mapping pairs array.");
2e08584e63de4ca Namjae Jeon 2025-12-30  766  			goto err_out;
2e08584e63de4ca Namjae Jeon 2025-12-30  767  		}
2e08584e63de4ca Namjae Jeon 2025-12-30  768  		/*
2e08584e63de4ca Namjae Jeon 2025-12-30  769  		 * Enter the current run length into the current runlist
2e08584e63de4ca Namjae Jeon 2025-12-30  770  		 * element.
2e08584e63de4ca Namjae Jeon 2025-12-30  771  		 */
2e08584e63de4ca Namjae Jeon 2025-12-30  772  		rl[rlpos].length = deltaxcn;
2e08584e63de4ca Namjae Jeon 2025-12-30  773  		/* Increment the current vcn by the current run length. */
2e08584e63de4ca Namjae Jeon 2025-12-30  774  		vcn += deltaxcn;
2e08584e63de4ca Namjae Jeon 2025-12-30  775  		/*
2e08584e63de4ca Namjae Jeon 2025-12-30  776  		 * There might be no lcn change at all, as is the case for
2e08584e63de4ca Namjae Jeon 2025-12-30  777  		 * sparse clusters on NTFS 3.0+, in which case we set the lcn
2e08584e63de4ca Namjae Jeon 2025-12-30  778  		 * to LCN_HOLE.
2e08584e63de4ca Namjae Jeon 2025-12-30  779  		 */
2e08584e63de4ca Namjae Jeon 2025-12-30  780  		if (!(*buf & 0xf0))
2e08584e63de4ca Namjae Jeon 2025-12-30  781  			rl[rlpos].lcn = LCN_HOLE;
2e08584e63de4ca Namjae Jeon 2025-12-30  782  		else {
2e08584e63de4ca Namjae Jeon 2025-12-30  783  			/* Get the lcn change which really can be negative. */
2e08584e63de4ca Namjae Jeon 2025-12-30  784  			u8 b2 = *buf & 0xf;
d2efeba97f1c277 Namjae Jeon 2026-01-09  785  
2e08584e63de4ca Namjae Jeon 2025-12-30  786  			b = b2 + ((*buf >> 4) & 0xf);
2e08584e63de4ca Namjae Jeon 2025-12-30  787  			if (buf + b > attr_end)
2e08584e63de4ca Namjae Jeon 2025-12-30  788  				goto io_error;
2e08584e63de4ca Namjae Jeon 2025-12-30  789  			for (deltaxcn = (s8)buf[b--]; b > b2; b--)
2e08584e63de4ca Namjae Jeon 2025-12-30  790  				deltaxcn = (deltaxcn << 8) + buf[b];
2e08584e63de4ca Namjae Jeon 2025-12-30  791  			/* Change the current lcn to its new value. */
2e08584e63de4ca Namjae Jeon 2025-12-30  792  			lcn += deltaxcn;
2e08584e63de4ca Namjae Jeon 2025-12-30  793  #ifdef DEBUG
2e08584e63de4ca Namjae Jeon 2025-12-30  794  			/*
2e08584e63de4ca Namjae Jeon 2025-12-30  795  			 * On NTFS 1.2-, apparently can have lcn == -1 to
2e08584e63de4ca Namjae Jeon 2025-12-30  796  			 * indicate a hole. But we haven't verified ourselves
2e08584e63de4ca Namjae Jeon 2025-12-30  797  			 * whether it is really the lcn or the deltaxcn that is
2e08584e63de4ca Namjae Jeon 2025-12-30  798  			 * -1. So if either is found give us a message so we
2e08584e63de4ca Namjae Jeon 2025-12-30  799  			 * can investigate it further!
2e08584e63de4ca Namjae Jeon 2025-12-30  800  			 */
2e08584e63de4ca Namjae Jeon 2025-12-30  801  			if (vol->major_ver < 3) {
d2efeba97f1c277 Namjae Jeon 2026-01-09  802  				if (unlikely(deltaxcn == -1))
2e08584e63de4ca Namjae Jeon 2025-12-30  803  					ntfs_error(vol->sb, "lcn delta == -1");
d2efeba97f1c277 Namjae Jeon 2026-01-09  804  				if (unlikely(lcn == -1))
2e08584e63de4ca Namjae Jeon 2025-12-30  805  					ntfs_error(vol->sb, "lcn == -1");
2e08584e63de4ca Namjae Jeon 2025-12-30  806  			}
2e08584e63de4ca Namjae Jeon 2025-12-30  807  #endif
2e08584e63de4ca Namjae Jeon 2025-12-30  808  			/* Check lcn is not below -1. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  809  			if (unlikely(lcn < -1)) {
d2efeba97f1c277 Namjae Jeon 2026-01-09  810  				ntfs_error(vol->sb, "Invalid s64 < -1 in mapping pairs array.");
2e08584e63de4ca Namjae Jeon 2025-12-30  811  				goto err_out;
2e08584e63de4ca Namjae Jeon 2025-12-30  812  			}
d2efeba97f1c277 Namjae Jeon 2026-01-09  813  
d2efeba97f1c277 Namjae Jeon 2026-01-09  814  			/* chkdsk accepts zero-sized runs only for holes */
d2efeba97f1c277 Namjae Jeon 2026-01-09  815  			if ((lcn != -1) && !rl[rlpos].length) {
d2efeba97f1c277 Namjae Jeon 2026-01-09  816  				ntfs_error(vol->sb, "Invalid zero-sized data run.\n");
d2efeba97f1c277 Namjae Jeon 2026-01-09  817  				goto err_out;
d2efeba97f1c277 Namjae Jeon 2026-01-09  818  			}
d2efeba97f1c277 Namjae Jeon 2026-01-09  819  
2e08584e63de4ca Namjae Jeon 2025-12-30  820  			/* Enter the current lcn into the runlist element. */
2e08584e63de4ca Namjae Jeon 2025-12-30  821  			rl[rlpos].lcn = lcn;
2e08584e63de4ca Namjae Jeon 2025-12-30  822  		}
d2efeba97f1c277 Namjae Jeon 2026-01-09  823  		/* Get to the next runlist element, skipping zero-sized holes */
d2efeba97f1c277 Namjae Jeon 2026-01-09  824  		if (rl[rlpos].length)
2e08584e63de4ca Namjae Jeon 2025-12-30  825  			rlpos++;
2e08584e63de4ca Namjae Jeon 2025-12-30  826  		/* Increment the buffer position to the next mapping pair. */
2e08584e63de4ca Namjae Jeon 2025-12-30  827  		buf += (*buf & 0xf) + ((*buf >> 4) & 0xf) + 1;
2e08584e63de4ca Namjae Jeon 2025-12-30  828  	}
2e08584e63de4ca Namjae Jeon 2025-12-30  829  	if (unlikely(buf >= attr_end))
2e08584e63de4ca Namjae Jeon 2025-12-30  830  		goto io_error;
2e08584e63de4ca Namjae Jeon 2025-12-30  831  	/*
2e08584e63de4ca Namjae Jeon 2025-12-30  832  	 * If there is a highest_vcn specified, it must be equal to the final
2e08584e63de4ca Namjae Jeon 2025-12-30  833  	 * vcn in the runlist - 1, or something has gone badly wrong.
2e08584e63de4ca Namjae Jeon 2025-12-30  834  	 */
d2efeba97f1c277 Namjae Jeon 2026-01-09  835  	deltaxcn = le64_to_cpu(attr->data.non_resident.highest_vcn);
2e08584e63de4ca Namjae Jeon 2025-12-30  836  	if (unlikely(deltaxcn && vcn - 1 != deltaxcn)) {
2e08584e63de4ca Namjae Jeon 2025-12-30  837  mpa_err:
d2efeba97f1c277 Namjae Jeon 2026-01-09  838  		ntfs_error(vol->sb, "Corrupt mapping pairs array in non-resident attribute.");
2e08584e63de4ca Namjae Jeon 2025-12-30  839  		goto err_out;
2e08584e63de4ca Namjae Jeon 2025-12-30  840  	}
2e08584e63de4ca Namjae Jeon 2025-12-30  841  	/* Setup not mapped runlist element if this is the base extent. */
2e08584e63de4ca Namjae Jeon 2025-12-30  842  	if (!attr->data.non_resident.lowest_vcn) {
d2efeba97f1c277 Namjae Jeon 2026-01-09  843  		s64 max_cluster;
2e08584e63de4ca Namjae Jeon 2025-12-30  844  
d2efeba97f1c277 Namjae Jeon 2026-01-09  845  		max_cluster = ((le64_to_cpu(attr->data.non_resident.allocated_size) +
2e08584e63de4ca Namjae Jeon 2025-12-30  846  				vol->cluster_size - 1) >>
2e08584e63de4ca Namjae Jeon 2025-12-30  847  				vol->cluster_size_bits) - 1;
2e08584e63de4ca Namjae Jeon 2025-12-30  848  		/*
2e08584e63de4ca Namjae Jeon 2025-12-30  849  		 * A highest_vcn of zero means this is a single extent
2e08584e63de4ca Namjae Jeon 2025-12-30  850  		 * attribute so simply terminate the runlist with LCN_ENOENT).
2e08584e63de4ca Namjae Jeon 2025-12-30  851  		 */
2e08584e63de4ca Namjae Jeon 2025-12-30  852  		if (deltaxcn) {
2e08584e63de4ca Namjae Jeon 2025-12-30  853  			/*
2e08584e63de4ca Namjae Jeon 2025-12-30  854  			 * If there is a difference between the highest_vcn and
2e08584e63de4ca Namjae Jeon 2025-12-30  855  			 * the highest cluster, the runlist is either corrupt
2e08584e63de4ca Namjae Jeon 2025-12-30  856  			 * or, more likely, there are more extents following
2e08584e63de4ca Namjae Jeon 2025-12-30  857  			 * this one.
2e08584e63de4ca Namjae Jeon 2025-12-30  858  			 */
2e08584e63de4ca Namjae Jeon 2025-12-30  859  			if (deltaxcn < max_cluster) {
d2efeba97f1c277 Namjae Jeon 2026-01-09  860  				ntfs_debug("More extents to follow; deltaxcn = 0x%llx, max_cluster = 0x%llx",
d2efeba97f1c277 Namjae Jeon 2026-01-09  861  						deltaxcn, max_cluster);
2e08584e63de4ca Namjae Jeon 2025-12-30  862  				rl[rlpos].vcn = vcn;
2e08584e63de4ca Namjae Jeon 2025-12-30  863  				vcn += rl[rlpos].length = max_cluster -
2e08584e63de4ca Namjae Jeon 2025-12-30  864  						deltaxcn;
2e08584e63de4ca Namjae Jeon 2025-12-30  865  				rl[rlpos].lcn = LCN_RL_NOT_MAPPED;
2e08584e63de4ca Namjae Jeon 2025-12-30  866  				rlpos++;
2e08584e63de4ca Namjae Jeon 2025-12-30  867  			} else if (unlikely(deltaxcn > max_cluster)) {
d2efeba97f1c277 Namjae Jeon 2026-01-09  868  				ntfs_error(vol->sb,
d2efeba97f1c277 Namjae Jeon 2026-01-09  869  					   "Corrupt attribute. deltaxcn = 0x%llx, max_cluster = 0x%llx",
d2efeba97f1c277 Namjae Jeon 2026-01-09  870  					   deltaxcn, max_cluster);
2e08584e63de4ca Namjae Jeon 2025-12-30  871  				goto mpa_err;
2e08584e63de4ca Namjae Jeon 2025-12-30  872  			}
2e08584e63de4ca Namjae Jeon 2025-12-30  873  		}
2e08584e63de4ca Namjae Jeon 2025-12-30  874  		rl[rlpos].lcn = LCN_ENOENT;
2e08584e63de4ca Namjae Jeon 2025-12-30  875  	} else /* Not the base extent. There may be more extents to follow. */
2e08584e63de4ca Namjae Jeon 2025-12-30  876  		rl[rlpos].lcn = LCN_RL_NOT_MAPPED;
2e08584e63de4ca Namjae Jeon 2025-12-30  877  
2e08584e63de4ca Namjae Jeon 2025-12-30  878  	/* Setup terminating runlist element. */
2e08584e63de4ca Namjae Jeon 2025-12-30  879  	rl[rlpos].vcn = vcn;
2e08584e63de4ca Namjae Jeon 2025-12-30  880  	rl[rlpos].length = (s64)0;
2e08584e63de4ca Namjae Jeon 2025-12-30  881  	/* If no existing runlist was specified, we are done. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  882  	if (!old_runlist || !old_runlist->rl) {
d2efeba97f1c277 Namjae Jeon 2026-01-09  883  		*new_rl_count = rlpos + 1;
2e08584e63de4ca Namjae Jeon 2025-12-30  884  		ntfs_debug("Mapping pairs array successfully decompressed:");
2e08584e63de4ca Namjae Jeon 2025-12-30  885  		ntfs_debug_dump_runlist(rl);
2e08584e63de4ca Namjae Jeon 2025-12-30  886  		return rl;
2e08584e63de4ca Namjae Jeon 2025-12-30  887  	}
2e08584e63de4ca Namjae Jeon 2025-12-30  888  	/* Now combine the new and old runlists checking for overlaps. */
d2efeba97f1c277 Namjae Jeon 2026-01-09  889  	new_rl = ntfs_runlists_merge(old_runlist, rl, rlpos + 1, new_rl_count);
d2efeba97f1c277 Namjae Jeon 2026-01-09  890  	if (!IS_ERR(new_rl))
d2efeba97f1c277 Namjae Jeon 2026-01-09  891  		return new_rl;
2e08584e63de4ca Namjae Jeon 2025-12-30  892  	ntfs_free(rl);
2e08584e63de4ca Namjae Jeon 2025-12-30  893  	ntfs_error(vol->sb, "Failed to merge runlists.");
d2efeba97f1c277 Namjae Jeon 2026-01-09  894  	return new_rl;
2e08584e63de4ca Namjae Jeon 2025-12-30  895  io_error:
2e08584e63de4ca Namjae Jeon 2025-12-30  896  	ntfs_error(vol->sb, "Corrupt attribute.");
2e08584e63de4ca Namjae Jeon 2025-12-30  897  err_out:
2e08584e63de4ca Namjae Jeon 2025-12-30  898  	ntfs_free(rl);
2e08584e63de4ca Namjae Jeon 2025-12-30  899  	return ERR_PTR(-EIO);
2e08584e63de4ca Namjae Jeon 2025-12-30  900  }
2e08584e63de4ca Namjae Jeon 2025-12-30  901  

:::::: The code at line 692 was first introduced by commit
:::::: d2efeba97f1c27703b980b028ed23d7bbd480aab ntfs: update runlist handling and cluster allocator

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA873161A6
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014472; cv=none; b=k1GDBrxPZsC7xvwH1rCIKC0mr/pAUSMakb70AZDhyaqaSUiIebsMVYYNkJ0aUKu01q9msMLNjVc4kCXrYzjlelYbwLmUhBXDuoMcsIMuNm/Q+iqJw1d9sZG/IHeXHTpDRQZxGmi0eGFW0U5sBmkh44fMj5BMTeoYNj114kcmLlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014472; c=relaxed/simple;
	bh=uMzocuZv959Yz9XoOsaIXRKU2vXe9WOnPR+R4sYcRj0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KcfqH7kobOm8NmILL8Wa5rNN3l/p2y6ygohp2isByTxh3qbKr+lfvtk26xkV1VNNERetto9n85jBhKkiOkpIdGxaXVkqKRe8J+snFfZxAeFUwS1rN73KF9m+8CUMHCMe3ccWtB1zS1wi0Ma0wBtwZ5oDsYyKDoAjKH5W3gyBG6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFx/510R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFx/510R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767014468; x=1798550468;
  h=date:from:to:subject:message-id:mime-version;
  bh=uMzocuZv959Yz9XoOsaIXRKU2vXe9WOnPR+R4sYcRj0=;
  b=YFx/510R1AXS6aqiJDPWeRRG5lqMou+Kyiy1CtahTyFyuK+avJkfQrPj
   1zUv9dLpMeLHGBO2V9am9KoZmMIL4Br2XRwpLlLJYgkvw3tTKYIv0/p8H
   cG+mf6wUBrYCckRG/cEo19YCwdH4zNtWUEm5jLdep8ofKRnf1oFXtaV8y
   tCuffmVwMpobJMlEDXKLW3iLRjbRX7l3l7rEmC6hMZqoRVnqgjwpmkLQf
   QdW6acw24RiZFKIAeXUMm1/JzVVuUeOkC5Z32WqrLywXNdx2zgq7gMNMm
   327htAzh1yFZdI/KH3T6U+g/hktyF7ByxiDX6mSZCWrpTyF+XaNmDJOGy
   g==;
X-CSE-ConnectionGUID: JATT9+mQSNuH0ZjT3X0qog==
X-CSE-MsgGUID: zhLbTFaSRpWxiqnY7rWyHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68559540"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68559540"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 05:21:06 -0800
X-CSE-ConnectionGUID: vrs2cKCZRSuLyVrQeozsmg==
X-CSE-MsgGUID: sd+xgeWPRWGLtC3CtspKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="201192397"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 29 Dec 2025 05:21:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaDBG-000000007l3-3Epu
	for oe-kbuild@lists.linux.dev;
	Mon, 29 Dec 2025 13:21:02 +0000
Date: Mon, 29 Dec 2025 14:20:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 1/14] checkpatch: ERROR:POINTER_LOCATION:
 "(foo*)" should be "(foo *)"
Message-ID: <202512291423.6afXaBc3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   2913105c43c8f2704877c39b1ed5d688daf2f4f3
commit: 9099d47575938cceeae6ac5de7c0404b0da3a86d [1/14] Revert "fs: Remove NTFS classic"
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512291423.6afXaBc3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#232: FILE: fs/ntfs/aops.c:133:
+			post_read_mst_fixup((NTFS_RECORD*)(kaddr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#582: FILE: fs/ntfs/aops.c:483:
+	memcpy(addr, (u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1208: FILE: fs/ntfs/aops.c:1109:
+					(MFT_RECORD*)(kaddr + ofs), &tni)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1233: FILE: fs/ntfs/aops.c:1134:
+		err2 = pre_write_mst_fixup((NTFS_RECORD*)(kaddr + ofs),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1323: FILE: fs/ntfs/aops.c:1224:
+						(MFT_RECORD*)(kaddr + ofs),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1335: FILE: fs/ntfs/aops.c:1236:
+			post_write_mst_fixup((NTFS_RECORD*)(kaddr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1567: FILE: fs/ntfs/aops.c:1468:
+	memcpy((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2065: FILE: fs/ntfs/attrib.c:122:
+				!memcmp((u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2186: FILE: fs/ntfs/attrib.c:243:
+					old_ctx.attr = (ATTR_RECORD*)(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2187: FILE: fs/ntfs/attrib.c:244:
+							(u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2188: FILE: fs/ntfs/attrib.c:245:
+							((u8*)old_ctx.attr -

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2189: FILE: fs/ntfs/attrib.c:246:
+							(u8*)old_ctx.mrec));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2535: FILE: fs/ntfs/attrib.c:592:
+		a = (ATTR_RECORD*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2535: FILE: fs/ntfs/attrib.c:592:
+		a = (ATTR_RECORD*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2537: FILE: fs/ntfs/attrib.c:594:
+	for (;;	a = (ATTR_RECORD*)((u8*)a + le32_to_cpu(a->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2537: FILE: fs/ntfs/attrib.c:594:
+	for (;;	a = (ATTR_RECORD*)((u8*)a + le32_to_cpu(a->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2582: FILE: fs/ntfs/attrib.c:639:
+			    (ntfschar*)((u8*)a + le16_to_cpu(a->name_offset)),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2582: FILE: fs/ntfs/attrib.c:639:
+			    (ntfschar*)((u8*)a + le16_to_cpu(a->name_offset)),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2587: FILE: fs/ntfs/attrib.c:644:
+					(ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2587: FILE: fs/ntfs/attrib.c:644:
+					(ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2601: FILE: fs/ntfs/attrib.c:658:
+					(ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2601: FILE: fs/ntfs/attrib.c:658:
+					(ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2621: FILE: fs/ntfs/attrib.c:678:
+			rc = memcmp(val, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2841: FILE: fs/ntfs/attrib.c:898:
+		ctx->al_entry = (ATTR_LIST_ENTRY*)al_start;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2850: FILE: fs/ntfs/attrib.c:907:
+		al_entry = (ATTR_LIST_ENTRY*)((u8*)ctx->al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2850: FILE: fs/ntfs/attrib.c:907:
+		al_entry = (ATTR_LIST_ENTRY*)((u8*)ctx->al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2854: FILE: fs/ntfs/attrib.c:911:
+		if ((u8*)al_entry < base_ni->attr_list ||

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2855: FILE: fs/ntfs/attrib.c:912:
+				(u8*)al_entry > al_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2859: FILE: fs/ntfs/attrib.c:916:
+		if ((u8*)al_entry == al_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2863: FILE: fs/ntfs/attrib.c:920:
+		if ((u8*)al_entry + 6 > al_end || (u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2863: FILE: fs/ntfs/attrib.c:920:
+		if ((u8*)al_entry + 6 > al_end || (u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2866: FILE: fs/ntfs/attrib.c:923:
+		next_al_entry = (ATTR_LIST_ENTRY*)((u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2866: FILE: fs/ntfs/attrib.c:923:
+		next_al_entry = (ATTR_LIST_ENTRY*)((u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2877: FILE: fs/ntfs/attrib.c:934:
+		al_name = (ntfschar*)((u8*)al_entry + al_entry->name_offset);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2877: FILE: fs/ntfs/attrib.c:934:
+		al_name = (ntfschar*)((u8*)al_entry + al_entry->name_offset);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2919: FILE: fs/ntfs/attrib.c:976:
+		if (lowest_vcn && (u8*)next_al_entry >= al_start	    &&

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2920: FILE: fs/ntfs/attrib.c:977:
+				(u8*)next_al_entry + 6 < al_end		    &&

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2921: FILE: fs/ntfs/attrib.c:978:
+				(u8*)next_al_entry + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2927: FILE: fs/ntfs/attrib.c:984:
+				ntfs_are_names_equal((ntfschar*)((u8*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2927: FILE: fs/ntfs/attrib.c:984:
+				ntfs_are_names_equal((ntfschar*)((u8*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2974: FILE: fs/ntfs/attrib.c:1031:
+			ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2974: FILE: fs/ntfs/attrib.c:1031:
+			ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2998: FILE: fs/ntfs/attrib.c:1055:
+		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2998: FILE: fs/ntfs/attrib.c:1055:
+		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2998: FILE: fs/ntfs/attrib.c:1055:
+		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2998: FILE: fs/ntfs/attrib.c:1055:
+		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3014: FILE: fs/ntfs/attrib.c:1071:
+		if (!ntfs_are_names_equal((ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3014: FILE: fs/ntfs/attrib.c:1071:
+		if (!ntfs_are_names_equal((ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3026: FILE: fs/ntfs/attrib.c:1083:
+				!memcmp((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3034: FILE: fs/ntfs/attrib.c:1091:
+		a = (ATTR_RECORD*)((u8*)a + le32_to_cpu(a->length));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3034: FILE: fs/ntfs/attrib.c:1091:
+		a = (ATTR_RECORD*)((u8*)a + le32_to_cpu(a->length));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3079: FILE: fs/ntfs/attrib.c:1136:
+	ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3079: FILE: fs/ntfs/attrib.c:1136:
+	ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3176: FILE: fs/ntfs/attrib.c:1233:
+		.attr = (ATTR_RECORD*)((u8*)mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3176: FILE: fs/ntfs/attrib.c:1233:
+		.attr = (ATTR_RECORD*)((u8*)mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3199: FILE: fs/ntfs/attrib.c:1256:
+		ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3199: FILE: fs/ntfs/attrib.c:1256:
+		ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3266: FILE: fs/ntfs/attrib.c:1323:
+	for (ad = vol->attrdef; (u8*)ad - (u8*)vol->attrdef <

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3266: FILE: fs/ntfs/attrib.c:1323:
+	for (ad = vol->attrdef; (u8*)ad - (u8*)vol->attrdef <

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3402: FILE: fs/ntfs/attrib.c:1459:
+		memmove((u8*)a + new_size, (u8*)a + le32_to_cpu(a->length),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3402: FILE: fs/ntfs/attrib.c:1459:
+		memmove((u8*)a + new_size, (u8*)a + le32_to_cpu(a->length),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3403: FILE: fs/ntfs/attrib.c:1460:
+				le32_to_cpu(m->bytes_in_use) - ((u8*)a -

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3404: FILE: fs/ntfs/attrib.c:1461:
+				(u8*)m) - le32_to_cpu(a->length));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3447: FILE: fs/ntfs/attrib.c:1504:
+		memset((u8*)a + le16_to_cpu(a->data.resident.value_offset) +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3613: FILE: fs/ntfs/attrib.c:1670:
+		memcpy(kaddr, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3634: FILE: fs/ntfs/attrib.c:1691:
+		memmove((u8*)a + name_ofs, (u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3634: FILE: fs/ntfs/attrib.c:1691:
+		memmove((u8*)a + name_ofs, (u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3657: FILE: fs/ntfs/attrib.c:1714:
+	err = ntfs_mapping_pairs_build(vol, (u8*)a + mp_ofs,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3715: FILE: fs/ntfs/attrib.c:1772:
+		memmove((u8*)a + name_ofs, (u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3715: FILE: fs/ntfs/attrib.c:1772:
+		memmove((u8*)a + name_ofs, (u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3762: FILE: fs/ntfs/attrib.c:1819:
+		memcpy((u8*)a + mp_ofs, kaddr, attr_size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4255: FILE: fs/ntfs/attrib.c:2312:
+	err = ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4399: FILE: fs/ntfs/attrib.c:2456:
+			if (ntfs_mapping_pairs_build(vol, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5329: FILE: fs/ntfs/compress.c:195:
+	if (cb == cb_end || !le16_to_cpup((le16*)cb) ||

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5379: FILE: fs/ntfs/compress.c:245:
+	cb_sb_end = cb_sb_start + (le16_to_cpup((le16*)cb) & NTFS_SB_SIZE_MASK)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5398: FILE: fs/ntfs/compress.c:264:
+	dp_addr = (u8*)page_address(dp) + do_sb_start;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5401: FILE: fs/ntfs/compress.c:267:
+	if (!(le16_to_cpup((le16*)cb) & NTFS_SB_IS_COMPRESSED)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5506: FILE: fs/ntfs/compress.c:372:
+		pt = le16_to_cpup((le16*)cb);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5847: FILE: fs/ntfs/compress.c:713:
+		*(u16*)cb_pos = 0;

ERROR:GLOBAL_INITIALISERS: do not initialise globals to 0
#6189: FILE: fs/ntfs/debug.c:99:
+int debug_msgs = 0;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6431: FILE: fs/ntfs/dir.c:113:
+	ir = (INDEX_ROOT*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6431: FILE: fs/ntfs/dir.c:113:
+	ir = (INDEX_ROOT*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6433: FILE: fs/ntfs/dir.c:115:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6435: FILE: fs/ntfs/dir.c:117:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6435: FILE: fs/ntfs/dir.c:117:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6441: FILE: fs/ntfs/dir.c:123:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6441: FILE: fs/ntfs/dir.c:123:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6443: FILE: fs/ntfs/dir.c:125:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6443: FILE: fs/ntfs/dir.c:125:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6443: FILE: fs/ntfs/dir.c:125:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6445: FILE: fs/ntfs/dir.c:127:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6462: FILE: fs/ntfs/dir.c:144:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6512: FILE: fs/ntfs/dir.c:194:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6553: FILE: fs/ntfs/dir.c:235:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6572: FILE: fs/ntfs/dir.c:254:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6610: FILE: fs/ntfs/dir.c:292:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6610: FILE: fs/ntfs/dir.c:292:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6635: FILE: fs/ntfs/dir.c:317:
+	kaddr = (u8*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6638: FILE: fs/ntfs/dir.c:320:
+	ia = (INDEX_ALLOCATION*)(kaddr + ((vcn <<

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6641: FILE: fs/ntfs/dir.c:323:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6641: FILE: fs/ntfs/dir.c:323:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6673: FILE: fs/ntfs/dir.c:355:
+	index_end = (u8*)ia + dir_ni->itype.index.block_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6682: FILE: fs/ntfs/dir.c:364:
+	index_end = (u8*)&ia->index + le32_to_cpu(ia->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6683: FILE: fs/ntfs/dir.c:365:
+	if (index_end > (u8*)ia + dir_ni->itype.index.block_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6690: FILE: fs/ntfs/dir.c:372:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6690: FILE: fs/ntfs/dir.c:372:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6697: FILE: fs/ntfs/dir.c:379:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6697: FILE: fs/ntfs/dir.c:379:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6699: FILE: fs/ntfs/dir.c:381:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6699: FILE: fs/ntfs/dir.c:381:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6699: FILE: fs/ntfs/dir.c:381:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6701: FILE: fs/ntfs/dir.c:383:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6722: FILE: fs/ntfs/dir.c:404:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6772: FILE: fs/ntfs/dir.c:454:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6815: FILE: fs/ntfs/dir.c:497:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6834: FILE: fs/ntfs/dir.c:516:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6861: FILE: fs/ntfs/dir.c:543:
+		vcn = sle64_to_cpup((sle64*)((u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6861: FILE: fs/ntfs/dir.c:543:
+		vcn = sle64_to_cpup((sle64*)((u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6982: FILE: fs/ntfs/dir.c:664:
+	ir = (INDEX_ROOT*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6982: FILE: fs/ntfs/dir.c:664:
+	ir = (INDEX_ROOT*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6984: FILE: fs/ntfs/dir.c:666:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6986: FILE: fs/ntfs/dir.c:668:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6986: FILE: fs/ntfs/dir.c:668:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6992: FILE: fs/ntfs/dir.c:674:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6992: FILE: fs/ntfs/dir.c:674:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6994: FILE: fs/ntfs/dir.c:676:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6994: FILE: fs/ntfs/dir.c:676:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6994: FILE: fs/ntfs/dir.c:676:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6996: FILE: fs/ntfs/dir.c:678:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7024: FILE: fs/ntfs/dir.c:706:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7038: FILE: fs/ntfs/dir.c:720:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7057: FILE: fs/ntfs/dir.c:739:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7088: FILE: fs/ntfs/dir.c:770:
+	vcn = sle64_to_cpup((u8*)ie + le16_to_cpu(ie->length) - 8);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7113: FILE: fs/ntfs/dir.c:795:
+	kaddr = (u8*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7116: FILE: fs/ntfs/dir.c:798:
+	ia = (INDEX_ALLOCATION*)(kaddr + ((vcn <<

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7119: FILE: fs/ntfs/dir.c:801:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7119: FILE: fs/ntfs/dir.c:801:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7151: FILE: fs/ntfs/dir.c:833:
+	index_end = (u8*)ia + dir_ni->itype.index.block_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7160: FILE: fs/ntfs/dir.c:842:
+	index_end = (u8*)&ia->index + le32_to_cpu(ia->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7161: FILE: fs/ntfs/dir.c:843:
+	if (index_end > (u8*)ia + dir_ni->itype.index.block_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7168: FILE: fs/ntfs/dir.c:850:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7168: FILE: fs/ntfs/dir.c:850:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7175: FILE: fs/ntfs/dir.c:857:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7175: FILE: fs/ntfs/dir.c:857:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7177: FILE: fs/ntfs/dir.c:859:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7177: FILE: fs/ntfs/dir.c:859:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7177: FILE: fs/ntfs/dir.c:859:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7179: FILE: fs/ntfs/dir.c:861:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7211: FILE: fs/ntfs/dir.c:893:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7225: FILE: fs/ntfs/dir.c:907:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7244: FILE: fs/ntfs/dir.c:926:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7271: FILE: fs/ntfs/dir.c:953:
+		vcn = sle64_to_cpup((u8*)ie + le16_to_cpu(ie->length) - 8);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7353: FILE: fs/ntfs/dir.c:1035:
+	name_len = ntfs_ucstonls(vol, (ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7486: FILE: fs/ntfs/dir.c:1168:
+	memcpy(ir, (u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7492: FILE: fs/ntfs/dir.c:1174:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7494: FILE: fs/ntfs/dir.c:1176:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7494: FILE: fs/ntfs/dir.c:1176:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7501: FILE: fs/ntfs/dir.c:1183:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7501: FILE: fs/ntfs/dir.c:1183:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7502: FILE: fs/ntfs/dir.c:1184:
+		ntfs_debug("In index root, offset 0x%zx.", (u8*)ie - (u8*)ir);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7502: FILE: fs/ntfs/dir.c:1184:
+		ntfs_debug("In index root, offset 0x%zx.", (u8*)ie - (u8*)ir);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7504: FILE: fs/ntfs/dir.c:1186:
+		if (unlikely((u8*)ie < (u8*)ir || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7504: FILE: fs/ntfs/dir.c:1186:
+		if (unlikely((u8*)ie < (u8*)ir || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7504: FILE: fs/ntfs/dir.c:1186:
+		if (unlikely((u8*)ie < (u8*)ir || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7506: FILE: fs/ntfs/dir.c:1188:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7513: FILE: fs/ntfs/dir.c:1195:
+		if (ir_pos > (u8*)ie - (u8*)ir)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7513: FILE: fs/ntfs/dir.c:1195:
+		if (ir_pos > (u8*)ie - (u8*)ir)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7516: FILE: fs/ntfs/dir.c:1198:
+		actor->pos = (u8*)ie - (u8*)ir;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7516: FILE: fs/ntfs/dir.c:1198:
+		actor->pos = (u8*)ie - (u8*)ir;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7569: FILE: fs/ntfs/dir.c:1251:
+	bmp = (u8*)page_address(bmp_page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7612: FILE: fs/ntfs/dir.c:1294:
+		kaddr = (u8*)page_address(ia_page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7615: FILE: fs/ntfs/dir.c:1297:
+	ia = (INDEX_ALLOCATION*)(kaddr + (ia_pos & ~PAGE_MASK &

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7618: FILE: fs/ntfs/dir.c:1300:
+	if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7618: FILE: fs/ntfs/dir.c:1300:
+	if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7655: FILE: fs/ntfs/dir.c:1337:
+	index_end = (u8*)ia + ndir->itype.index.block_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7665: FILE: fs/ntfs/dir.c:1347:
+	index_end = (u8*)&ia->index + le32_to_cpu(ia->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7666: FILE: fs/ntfs/dir.c:1348:
+	if (unlikely(index_end > (u8*)ia + ndir->itype.index.block_size)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7674: FILE: fs/ntfs/dir.c:1356:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7674: FILE: fs/ntfs/dir.c:1356:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7681: FILE: fs/ntfs/dir.c:1363:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7681: FILE: fs/ntfs/dir.c:1363:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7684: FILE: fs/ntfs/dir.c:1366:
+				(unsigned long long)((u8*)ie - (u8*)ia));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7684: FILE: fs/ntfs/dir.c:1366:
+				(unsigned long long)((u8*)ie - (u8*)ia));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7686: FILE: fs/ntfs/dir.c:1368:
+		if (unlikely((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7686: FILE: fs/ntfs/dir.c:1368:
+		if (unlikely((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7686: FILE: fs/ntfs/dir.c:1368:
+		if (unlikely((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7688: FILE: fs/ntfs/dir.c:1370:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7695: FILE: fs/ntfs/dir.c:1377:
+		if (ia_pos - ia_start > (u8*)ie - (u8*)ia)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7695: FILE: fs/ntfs/dir.c:1377:
+		if (ia_pos - ia_start > (u8*)ie - (u8*)ia)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7698: FILE: fs/ntfs/dir.c:1380:
+		actor->pos = (u8*)ie - (u8*)ia +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7698: FILE: fs/ntfs/dir.c:1380:
+		actor->pos = (u8*)ie - (u8*)ia +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7940: FILE: fs/ntfs/endian.h:36:
+	return le16_to_cpu(*(__force le16*)x);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7945: FILE: fs/ntfs/endian.h:41:
+	return le32_to_cpu(*(__force le32*)x);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7950: FILE: fs/ntfs/endian.h:46:
+	return le64_to_cpu(*(__force le64*)x);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8149: FILE: fs/ntfs/file.c:160:
+	kattr = (u8*)a + le16_to_cpu(a->data.resident.value_offset);

WARNING:SPACING: space prohibited before semicolon
#9072: FILE: fs/ntfs/file.c:1083:
+			break ;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#9079: FILE: fs/ntfs/file.c:1090:
+		err = ntfs_mapping_pairs_build(vol, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#9275: FILE: fs/ntfs/file.c:1286:
+			if (ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#9583: FILE: fs/ntfs/file.c:1594:
+	kattr = (u8*)a + le16_to_cpu(a->data.resident.value_offset);

WARNING:REPEATED_WORD: Possible repeated word: 'up'
#9884: FILE: fs/ntfs/file.c:1895:
+ * Basically the same as generic_file_write_iter() except that it ends up
+ * up calling ntfs_perform_write() instead of generic_perform_write() and that

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10153: FILE: fs/ntfs/index.c:161:
+	ir = (INDEX_ROOT*)((u8*)actx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10153: FILE: fs/ntfs/index.c:161:
+	ir = (INDEX_ROOT*)((u8*)actx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10155: FILE: fs/ntfs/index.c:163:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10157: FILE: fs/ntfs/index.c:165:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10157: FILE: fs/ntfs/index.c:165:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10163: FILE: fs/ntfs/index.c:171:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10163: FILE: fs/ntfs/index.c:171:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10165: FILE: fs/ntfs/index.c:173:
+		if ((u8*)ie < (u8*)actx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10165: FILE: fs/ntfs/index.c:173:
+		if ((u8*)ie < (u8*)actx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10165: FILE: fs/ntfs/index.c:173:
+		if ((u8*)ie < (u8*)actx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10167: FILE: fs/ntfs/index.c:175:
+				(u8*)ie + le16_to_cpu(ie->length) > index_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10195: FILE: fs/ntfs/index.c:203:
+			ictx->data = (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10240: FILE: fs/ntfs/index.c:248:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10240: FILE: fs/ntfs/index.c:248:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10265: FILE: fs/ntfs/index.c:273:
+	kaddr = (u8*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10268: FILE: fs/ntfs/index.c:276:
+	ia = (INDEX_ALLOCATION*)(kaddr + ((vcn <<

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10271: FILE: fs/ntfs/index.c:279:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10271: FILE: fs/ntfs/index.c:279:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10303: FILE: fs/ntfs/index.c:311:
+	index_end = (u8*)ia + idx_ni->itype.index.block_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10312: FILE: fs/ntfs/index.c:320:
+	index_end = (u8*)&ia->index + le32_to_cpu(ia->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10313: FILE: fs/ntfs/index.c:321:
+	if (index_end > (u8*)ia + idx_ni->itype.index.block_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10320: FILE: fs/ntfs/index.c:328:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10320: FILE: fs/ntfs/index.c:328:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10327: FILE: fs/ntfs/index.c:335:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10327: FILE: fs/ntfs/index.c:335:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10329: FILE: fs/ntfs/index.c:337:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10329: FILE: fs/ntfs/index.c:337:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10329: FILE: fs/ntfs/index.c:337:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10331: FILE: fs/ntfs/index.c:339:
+				(u8*)ie + le16_to_cpu(ie->length) > index_end) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10401: FILE: fs/ntfs/index.c:409:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10401: FILE: fs/ntfs/index.c:409:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10567: FILE: fs/ntfs/index.h:129:
+				(u8*)ictx->ia - (u8*)page_address(ictx->page));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10567: FILE: fs/ntfs/index.h:129:
+				(u8*)ictx->ia - (u8*)page_address(ictx->page));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11032: FILE: fs/ntfs/inode.c:454:
+		p = (u8*)attr + le32_to_cpu(attr->length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11033: FILE: fs/ntfs/inode.c:455:
+		if (p < (u8*)ctx->mrec || (u8*)p > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11033: FILE: fs/ntfs/inode.c:455:
+		if (p < (u8*)ctx->mrec || (u8*)p > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11033: FILE: fs/ntfs/inode.c:455:
+		if (p < (u8*)ctx->mrec || (u8*)p > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11056: FILE: fs/ntfs/inode.c:478:
+		file_name_attr = (FILE_NAME_ATTR*)((u8*)attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11056: FILE: fs/ntfs/inode.c:478:
+		file_name_attr = (FILE_NAME_ATTR*)((u8*)attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11059: FILE: fs/ntfs/inode.c:481:
+		if (p2 < (u8*)attr || p2 > p)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11216: FILE: fs/ntfs/inode.c:638:
+	si = (STANDARD_INFORMATION*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11216: FILE: fs/ntfs/inode.c:638:
+	si = (STANDARD_INFORMATION*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11318: FILE: fs/ntfs/inode.c:740:
+			if ((u8*)a + le16_to_cpu(a->data.resident.value_offset)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11321: FILE: fs/ntfs/inode.c:743:
+					(u8*)ctx->mrec + vol->mft_record_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11327: FILE: fs/ntfs/inode.c:749:
+			memcpy(ni->attr_list, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11390: FILE: fs/ntfs/inode.c:812:
+		ir = (INDEX_ROOT*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11390: FILE: fs/ntfs/inode.c:812:
+		ir = (INDEX_ROOT*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11392: FILE: fs/ntfs/inode.c:814:
+		ir_end = (u8*)ir + le32_to_cpu(a->data.resident.value_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11393: FILE: fs/ntfs/inode.c:815:
+		if (ir_end > (u8*)ctx->mrec + vol->mft_record_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11398: FILE: fs/ntfs/inode.c:820:
+		index_end = (u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12113: FILE: fs/ntfs/inode.c:1535:
+	ir = (INDEX_ROOT*)((u8*)a + le16_to_cpu(a->data.resident.value_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12113: FILE: fs/ntfs/inode.c:1535:
+	ir = (INDEX_ROOT*)((u8*)a + le16_to_cpu(a->data.resident.value_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12114: FILE: fs/ntfs/inode.c:1536:
+	ir_end = (u8*)ir + le32_to_cpu(a->data.resident.value_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12115: FILE: fs/ntfs/inode.c:1537:
+	if (ir_end > (u8*)ctx->mrec + vol->mft_record_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12119: FILE: fs/ntfs/inode.c:1541:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12372: FILE: fs/ntfs/inode.c:1794:
+	m = (MFT_RECORD*)ntfs_malloc_nofs(i);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12392: FILE: fs/ntfs/inode.c:1814:
+		memcpy((char*)m + (i << sb->s_blocksize_bits), bh->b_data,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12404: FILE: fs/ntfs/inode.c:1826:
+	if (post_read_mst_fixup((NTFS_RECORD*)m, vol->mft_record_size)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12509: FILE: fs/ntfs/inode.c:1931:
+			if ((u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12513: FILE: fs/ntfs/inode.c:1935:
+					(u8*)ctx->mrec + vol->mft_record_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12519: FILE: fs/ntfs/inode.c:1941:
+			memcpy(ni->attr_list, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12536: FILE: fs/ntfs/inode.c:1958:
+		al_entry = (ATTR_LIST_ENTRY*)ni->attr_list;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12537: FILE: fs/ntfs/inode.c:1959:
+		al_end = (u8*)al_entry + ni->attr_list_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12540: FILE: fs/ntfs/inode.c:1962:
+			if ((u8*)al_entry < ni->attr_list ||

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12541: FILE: fs/ntfs/inode.c:1963:
+					(u8*)al_entry > al_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12544: FILE: fs/ntfs/inode.c:1966:
+			if ((u8*)al_entry == al_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12548: FILE: fs/ntfs/inode.c:1970:
+			if ((u8*)al_entry + 6 > al_end || (u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12548: FILE: fs/ntfs/inode.c:1970:
+			if ((u8*)al_entry + 6 > al_end || (u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12551: FILE: fs/ntfs/inode.c:1973:
+			next_al_entry = (ATTR_LIST_ENTRY*)((u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12551: FILE: fs/ntfs/inode.c:1973:
+			next_al_entry = (ATTR_LIST_ENTRY*)((u8*)al_entry +

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#12897: FILE: fs/ntfs/inode.c:2319:
+		seq_printf(sf, ",case_sensitive");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#12899: FILE: fs/ntfs/inode.c:2321:
+		seq_printf(sf, ",show_sys_files");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#12901: FILE: fs/ntfs/inode.c:2323:
+		seq_printf(sf, ",disable_sparse");

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13324: FILE: fs/ntfs/inode.c:2746:
+	err = ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13575: FILE: fs/ntfs/inode.c:2997:
+	si = (STANDARD_INFORMATION*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13575: FILE: fs/ntfs/inode.c:2997:
+	si = (STANDARD_INFORMATION*)((u8*)ctx->attr +

WARNING:REPEATED_WORD: Possible repeated word: 'runlist'
#13741: FILE: fs/ntfs/inode.h:55:
+	runlist runlist;	/* If state has the NI_NonResident bit set,

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#15144: FILE: fs/ntfs/layout.h:1142:
+	   meaning that that particular value(s) is(are) not defined. */

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17725: FILE: fs/ntfs/logfile.c:153:
+	ra = (RESTART_AREA*)((u8*)rp + ra_ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17725: FILE: fs/ntfs/logfile.c:153:
+	ra = (RESTART_AREA*)((u8*)rp + ra_ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17840: FILE: fs/ntfs/logfile.c:268:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17840: FILE: fs/ntfs/logfile.c:268:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17841: FILE: fs/ntfs/logfile.c:269:
+	ca = (LOG_CLIENT_RECORD*)((u8*)ra +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17841: FILE: fs/ntfs/logfile.c:269:
+	ca = (LOG_CLIENT_RECORD*)((u8*)ra +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17927: FILE: fs/ntfs/logfile.c:355:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17927: FILE: fs/ntfs/logfile.c:355:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17969: FILE: fs/ntfs/logfile.c:397:
+			memcpy((u8*)trp + have_read, page_address(page), size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#17981: FILE: fs/ntfs/logfile.c:409:
+			&& post_read_mst_fixup((NTFS_RECORD*)trp,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18111: FILE: fs/ntfs/logfile.c:539:
+		kaddr = (u8*)page_address(page) + (pos & ~PAGE_MASK);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18117: FILE: fs/ntfs/logfile.c:545:
+		if (!ntfs_is_empty_recordp((le32*)kaddr))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18125: FILE: fs/ntfs/logfile.c:553:
+		if (ntfs_is_rcrd_recordp((le32*)kaddr))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18128: FILE: fs/ntfs/logfile.c:556:
+		if (!ntfs_is_rstr_recordp((le32*)kaddr) &&

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18129: FILE: fs/ntfs/logfile.c:557:
+				!ntfs_is_chkd_recordp((le32*)kaddr)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18140: FILE: fs/ntfs/logfile.c:568:
+				(RESTART_PAGE_HEADER*)kaddr, pos,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18257: FILE: fs/ntfs/logfile.c:685:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18257: FILE: fs/ntfs/logfile.c:685:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18887: FILE: fs/ntfs/mft.c:76:
+		if (likely(ntfs_is_mft_recordp((le32*)(page_address(page) +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18902: FILE: fs/ntfs/mft.c:91:
+	return (void*)page;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#19325: FILE: fs/ntfs/mft.c:514:
+	m_start = kmirr - (u8*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#19420: FILE: fs/ntfs/mft.c:609:
+	post_write_mst_fixup((NTFS_RECORD*)kmirr);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#19578: FILE: fs/ntfs/mft.c:767:
+	err = pre_write_mst_fixup((NTFS_RECORD*)m, vol->mft_record_size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#19618: FILE: fs/ntfs/mft.c:807:
+	post_write_mst_fixup((NTFS_RECORD*)m);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20005: FILE: fs/ntfs/mft.c:1194:
+			buf = (u8*)page_address(page) + page_ofs;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20143: FILE: fs/ntfs/mft.c:1332:
+	b = (u8*)page_address(page) + (ll & ~PAGE_MASK);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20258: FILE: fs/ntfs/mft.c:1447:
+	ret = ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20344: FILE: fs/ntfs/mft.c:1533:
+		if (ntfs_mapping_pairs_build(vol, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20695: FILE: fs/ntfs/mft.c:1884:
+	ret = ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20860: FILE: fs/ntfs/mft.c:2049:
+	*(le16*)((u8*)m + le16_to_cpu(m->usa_ofs)) = cpu_to_le16(1);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20860: FILE: fs/ntfs/mft.c:2049:
+	*(le16*)((u8*)m + le16_to_cpu(m->usa_ofs)) = cpu_to_le16(1);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20881: FILE: fs/ntfs/mft.c:2070:
+	a = (ATTR_RECORD*)((u8*)m + le16_to_cpu(m->attrs_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20881: FILE: fs/ntfs/mft.c:2070:
+	a = (ATTR_RECORD*)((u8*)m + le16_to_cpu(m->attrs_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20937: FILE: fs/ntfs/mft.c:2126:
+	m = (MFT_RECORD*)((u8*)page_address(page) + ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20937: FILE: fs/ntfs/mft.c:2126:
+	m = (MFT_RECORD*)((u8*)page_address(page) + ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21339: FILE: fs/ntfs/mft.c:2528:
+	m = (MFT_RECORD*)((u8*)page_address(page) + ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21339: FILE: fs/ntfs/mft.c:2528:
+	m = (MFT_RECORD*)((u8*)page_address(page) + ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21365: FILE: fs/ntfs/mft.c:2554:
+		usn = *(le16*)((u8*)m + le16_to_cpu(m->usa_ofs));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21365: FILE: fs/ntfs/mft.c:2554:
+		usn = *(le16*)((u8*)m + le16_to_cpu(m->usa_ofs));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21378: FILE: fs/ntfs/mft.c:2567:
+			*(le16*)((u8*)m + le16_to_cpu(m->usa_ofs)) = usn;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21378: FILE: fs/ntfs/mft.c:2567:
+			*(le16*)((u8*)m + le16_to_cpu(m->usa_ofs)) = usn;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21626: FILE: fs/ntfs/mft.c:2815:
+				sizeof(ntfs_inode*));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21693: FILE: fs/ntfs/mft.c:2882:
+		int new_size = (base_ni->nr_extents + 4) * sizeof(ntfs_inode*);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21706: FILE: fs/ntfs/mft.c:2895:
+					new_size - 4 * sizeof(ntfs_inode*));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21884: FILE: fs/ntfs/mst.c:44:
+	usa_pos = (u16*)b + usa_ofs/sizeof(u16);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21896: FILE: fs/ntfs/mst.c:56:
+	data_pos = (u16*)b + NTFS_BLOCK_SIZE/sizeof(u16) - 1;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21914: FILE: fs/ntfs/mst.c:74:
+	data_pos = (u16*)b + NTFS_BLOCK_SIZE/sizeof(u16) - 1;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21970: FILE: fs/ntfs/mst.c:130:
+	usa_pos = (le16*)((u8*)b + usa_ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21970: FILE: fs/ntfs/mst.c:130:
+	usa_pos = (le16*)((u8*)b + usa_ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21981: FILE: fs/ntfs/mst.c:141:
+	data_pos = (le16*)b + NTFS_BLOCK_SIZE/sizeof(le16) - 1;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22013: FILE: fs/ntfs/mst.c:173:
+	usa_pos = (le16*)b + usa_ofs/sizeof(le16);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22016: FILE: fs/ntfs/mst.c:176:
+	data_pos = (le16*)b + NTFS_BLOCK_SIZE/sizeof(le16) - 1;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22209: FILE: fs/ntfs/namei.c:174:
+				(ntfschar*)&name->name, name->len,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22254: FILE: fs/ntfs/namei.c:219:
+			fn = (FILE_NAME_ATTR*)((u8*)ctx->attr + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22254: FILE: fs/ntfs/namei.c:219:
+			fn = (FILE_NAME_ATTR*)((u8*)ctx->attr + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22263: FILE: fs/ntfs/namei.c:228:
+				(ntfschar*)&fn->file_name, fn->file_name_length,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22361: FILE: fs/ntfs/namei.c:326:
+			(u8*)attr + le32_to_cpu(attr->length)))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22647: FILE: fs/ntfs/quota.c:58:
+	qce = (QUOTA_CONTROL_ENTRY*)ictx->data;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#23486: FILE: fs/ntfs/runlist.c:761:
+	buf = (u8*)attr + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#23488: FILE: fs/ntfs/runlist.c:763:
+	attr_end = (u8*)attr + le32_to_cpu(attr->length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#23489: FILE: fs/ntfs/runlist.c:764:
+	if (unlikely(buf < (u8*)attr || buf > attr_end)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25114: FILE: fs/ntfs/super.c:396:
+	vi = (VOLUME_INFORMATION*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25114: FILE: fs/ntfs/super.c:396:
+	vi = (VOLUME_INFORMATION*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25305: FILE: fs/ntfs/super.c:587:
+	if ((void*)b < (void*)&b->checksum && b->checksum && !silent) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25305: FILE: fs/ntfs/super.c:587:
+	if ((void*)b < (void*)&b->checksum && b->checksum && !silent) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25309: FILE: fs/ntfs/super.c:591:
+		for (i = 0, u = (le32*)b; u < (le32*)(&b->checksum); ++u)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25309: FILE: fs/ntfs/super.c:591:
+		for (i = 0, u = (le32*)b; u < (le32*)(&b->checksum); ++u)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25397: FILE: fs/ntfs/super.c:679:
+		if (is_boot_sector_ntfs(sb, (NTFS_BOOT_SECTOR*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25414: FILE: fs/ntfs/super.c:696:
+		if (is_boot_sector_ntfs(sb, (NTFS_BOOT_SECTOR*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25422: FILE: fs/ntfs/super.c:704:
+		if (is_boot_sector_ntfs(sb, (NTFS_BOOT_SECTOR*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25845: FILE: fs/ntfs/super.c:1127:
+		if (((MFT_RECORD*)kmft)->flags & MFT_RECORD_IN_USE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25847: FILE: fs/ntfs/super.c:1129:
+			if (ntfs_is_baad_recordp((le32*)kmft)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25859: FILE: fs/ntfs/super.c:1141:
+		if (((MFT_RECORD*)kmirr)->flags & MFT_RECORD_IN_USE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25860: FILE: fs/ntfs/super.c:1142:
+			if (ntfs_is_baad_recordp((le32*)kmirr)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25868: FILE: fs/ntfs/super.c:1150:
+		bytes = le32_to_cpu(((MFT_RECORD*)kmft)->bytes_in_use);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25871: FILE: fs/ntfs/super.c:1153:
+				ntfs_is_baad_recordp((le32*)kmft)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25872: FILE: fs/ntfs/super.c:1154:
+			bytes = le32_to_cpu(((MFT_RECORD*)kmirr)->bytes_in_use);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25875: FILE: fs/ntfs/super.c:1157:
+					ntfs_is_baad_recordp((le32*)kmirr))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26038: FILE: fs/ntfs/super.c:1320:
+	kaddr = (u32*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26039: FILE: fs/ntfs/super.c:1321:
+	if (*(le32*)kaddr == cpu_to_le32(0x72626968)/*'hibr'*/) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26258: FILE: fs/ntfs/super.c:1540:
+	uh = (USN_HEADER*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26326: FILE: fs/ntfs/super.c:1608:
+	vol->attrdef = (ATTR_DEF*)ntfs_malloc_nofs(i_size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26338: FILE: fs/ntfs/super.c:1620:
+		memcpy((u8*)vol->attrdef + (index++ << PAGE_SHIFT),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26395: FILE: fs/ntfs/super.c:1677:
+	vol->upcase = (ntfschar*)ntfs_malloc_nofs(i_size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26407: FILE: fs/ntfs/super.c:1689:
+		memcpy((char*)vol->upcase + (index++ << PAGE_SHIFT),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26599: FILE: fs/ntfs/super.c:1881:
+	vi = (VOLUME_INFORMATION*)((char*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26599: FILE: fs/ntfs/super.c:1881:
+	vi = (VOLUME_INFORMATION*)((char*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26602: FILE: fs/ntfs/super.c:1884:
+	if ((u8*)vi < (u8*)ctx->attr || (u8*)vi +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26602: FILE: fs/ntfs/super.c:1884:
+	if ((u8*)vi < (u8*)ctx->attr || (u8*)vi +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26602: FILE: fs/ntfs/super.c:1884:
+	if ((u8*)vi < (u8*)ctx->attr || (u8*)vi +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26604: FILE: fs/ntfs/super.c:1886:
+			(u8*)ctx->attr + le32_to_cpu(ctx->attr->length))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#27474: FILE: fs/ntfs/super.c:2756:
+	if (!parse_options(vol, (char*)opt))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#27518: FILE: fs/ntfs/super.c:2800:
+	result = parse_ntfs_boot_sector(vol, (NTFS_BOOT_SECTOR*)bh->b_data);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#28385: FILE: fs/ntfs/unistr.c:206:
+	ntfs_upcase_name((ntfschar*)&file_name_attr->file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#28394: FILE: fs/ntfs/unistr.c:215:
+	return ntfs_collate_names((ntfschar*)&file_name_attr1->file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#28396: FILE: fs/ntfs/unistr.c:217:
+			(ntfschar*)&file_name_attr2->file_name,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

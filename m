Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4920DD52
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 00:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767745795; cv=none; b=l+7Z6C+tvRu86ng4cJB29nm6ufa4hplTocDeE0CgYqfNfzZVSS43opmEZx5w6F+qbez661sri2oWdOT9SiAtJKCQ7cLUBxkST15xeUOfaNijwrtZoIAGTDb/bF1qTT46eiGQBoHmc9pBg7QIKBgrnKwVRmrw5O6QfCLRE+dLoMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767745795; c=relaxed/simple;
	bh=ygikp1yrjEGNkueygbYvvuTHSBV3d3P4vGPv/FCaE0M=;
	h=Date:From:To:Subject:Message-ID; b=GuLgd89UBo22lEckR/bL1Yfxjlhp2wN0U0cevO+ZUqVum0j01SFbfhZHno0sTD6VD8mj7UXMCqBGkKI6qb+PS1If6HwCJDJCiORb28MJbA5J2g6zB64WFcBIZ1IHIOgtKiiKsVbZNrx0+vZxLZWCdGphJDK94G6jM1QbBib6Bf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7DHmuZw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7DHmuZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767745793; x=1799281793;
  h=date:from:to:subject:message-id;
  bh=ygikp1yrjEGNkueygbYvvuTHSBV3d3P4vGPv/FCaE0M=;
  b=N7DHmuZwU1vhsloJdFLejtzIc+z8tsAaemp6XlYXSLtrm00QMr0RcPDW
   Vo/tBmMAmHoyrgY9GDqCBFbFgBx4JBTPJMQ8eN7f2dGtUJH/DdXrMyx7/
   LFq9fv0wAU0C/Tss9d091LnkaPkcQ1SewDCLOa3qdIEXG+Wl9d9KX8nGy
   lGEod+jqODyHQDq0oVx9rH0tfQGTE2l7h30Fnt7s788W9WEgQxoEJG9nw
   QWVlBPQTBubWcVybOVWJn+KpyWBJqZP99lAiDwQ0vdOXjWCRex+0LWFrA
   fbsGF7Xif0Gx54IdTex7dBxAkqVj55xlbm9eudj4VNmtRYHToJFkZDYeC
   w==;
X-CSE-ConnectionGUID: ZWwunrFaRi6DXLR8y+1mQQ==
X-CSE-MsgGUID: exTtDjc7SLyA1CcA6Bwc9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69017885"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69017885"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 16:29:52 -0800
X-CSE-ConnectionGUID: 8OCuZ7PgS26ajcCFBAe9DQ==
X-CSE-MsgGUID: mzjxReA8SKyavnvpGeR9RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="226307168"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2026 16:29:50 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdHQq-000000001PT-189U
	for oe-kbuild@lists.linux.dev;
	Wed, 07 Jan 2026 00:29:48 +0000
Date: Wed, 07 Jan 2026 01:29:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linkinjeon-ntfs:ntfs-next 1/14] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202601070136.9BA735ZZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.git ntfs-next
head:   c9fb91b2b8b4c46188b1a280187d41e9ebb93cb2
commit: 7bfba19057c055ab7f6b8c334ef4abf5bd610a32 [1/14] Revert "fs: Remove NTFS classic"
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260107/202601070136.9BA735ZZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#761: FILE: fs/ntfs/aops.c:133:
+			post_read_mst_fixup((NTFS_RECORD*)(kaddr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1111: FILE: fs/ntfs/aops.c:483:
+	memcpy(addr, (u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1737: FILE: fs/ntfs/aops.c:1109:
+					(MFT_RECORD*)(kaddr + ofs), &tni)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1762: FILE: fs/ntfs/aops.c:1134:
+		err2 = pre_write_mst_fixup((NTFS_RECORD*)(kaddr + ofs),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1852: FILE: fs/ntfs/aops.c:1224:
+						(MFT_RECORD*)(kaddr + ofs),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1864: FILE: fs/ntfs/aops.c:1236:
+			post_write_mst_fixup((NTFS_RECORD*)(kaddr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2096: FILE: fs/ntfs/aops.c:1468:
+	memcpy((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2594: FILE: fs/ntfs/attrib.c:122:
+				!memcmp((u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2715: FILE: fs/ntfs/attrib.c:243:
+					old_ctx.attr = (ATTR_RECORD*)(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2716: FILE: fs/ntfs/attrib.c:244:
+							(u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2717: FILE: fs/ntfs/attrib.c:245:
+							((u8*)old_ctx.attr -

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#2718: FILE: fs/ntfs/attrib.c:246:
+							(u8*)old_ctx.mrec));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3064: FILE: fs/ntfs/attrib.c:592:
+		a = (ATTR_RECORD*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3064: FILE: fs/ntfs/attrib.c:592:
+		a = (ATTR_RECORD*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3066: FILE: fs/ntfs/attrib.c:594:
+	for (;;	a = (ATTR_RECORD*)((u8*)a + le32_to_cpu(a->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3066: FILE: fs/ntfs/attrib.c:594:
+	for (;;	a = (ATTR_RECORD*)((u8*)a + le32_to_cpu(a->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3111: FILE: fs/ntfs/attrib.c:639:
+			    (ntfschar*)((u8*)a + le16_to_cpu(a->name_offset)),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3111: FILE: fs/ntfs/attrib.c:639:
+			    (ntfschar*)((u8*)a + le16_to_cpu(a->name_offset)),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3116: FILE: fs/ntfs/attrib.c:644:
+					(ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3116: FILE: fs/ntfs/attrib.c:644:
+					(ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3130: FILE: fs/ntfs/attrib.c:658:
+					(ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3130: FILE: fs/ntfs/attrib.c:658:
+					(ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3150: FILE: fs/ntfs/attrib.c:678:
+			rc = memcmp(val, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3370: FILE: fs/ntfs/attrib.c:898:
+		ctx->al_entry = (ATTR_LIST_ENTRY*)al_start;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3379: FILE: fs/ntfs/attrib.c:907:
+		al_entry = (ATTR_LIST_ENTRY*)((u8*)ctx->al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3379: FILE: fs/ntfs/attrib.c:907:
+		al_entry = (ATTR_LIST_ENTRY*)((u8*)ctx->al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3383: FILE: fs/ntfs/attrib.c:911:
+		if ((u8*)al_entry < base_ni->attr_list ||

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3384: FILE: fs/ntfs/attrib.c:912:
+				(u8*)al_entry > al_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3388: FILE: fs/ntfs/attrib.c:916:
+		if ((u8*)al_entry == al_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3392: FILE: fs/ntfs/attrib.c:920:
+		if ((u8*)al_entry + 6 > al_end || (u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3392: FILE: fs/ntfs/attrib.c:920:
+		if ((u8*)al_entry + 6 > al_end || (u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3395: FILE: fs/ntfs/attrib.c:923:
+		next_al_entry = (ATTR_LIST_ENTRY*)((u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3395: FILE: fs/ntfs/attrib.c:923:
+		next_al_entry = (ATTR_LIST_ENTRY*)((u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3406: FILE: fs/ntfs/attrib.c:934:
+		al_name = (ntfschar*)((u8*)al_entry + al_entry->name_offset);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3406: FILE: fs/ntfs/attrib.c:934:
+		al_name = (ntfschar*)((u8*)al_entry + al_entry->name_offset);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3448: FILE: fs/ntfs/attrib.c:976:
+		if (lowest_vcn && (u8*)next_al_entry >= al_start	    &&

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3449: FILE: fs/ntfs/attrib.c:977:
+				(u8*)next_al_entry + 6 < al_end		    &&

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3450: FILE: fs/ntfs/attrib.c:978:
+				(u8*)next_al_entry + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3456: FILE: fs/ntfs/attrib.c:984:
+				ntfs_are_names_equal((ntfschar*)((u8*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3456: FILE: fs/ntfs/attrib.c:984:
+				ntfs_are_names_equal((ntfschar*)((u8*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3503: FILE: fs/ntfs/attrib.c:1031:
+			ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3503: FILE: fs/ntfs/attrib.c:1031:
+			ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3527: FILE: fs/ntfs/attrib.c:1055:
+		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3527: FILE: fs/ntfs/attrib.c:1055:
+		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3527: FILE: fs/ntfs/attrib.c:1055:
+		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3527: FILE: fs/ntfs/attrib.c:1055:
+		if ((u8*)a < (u8*)ctx->mrec || (u8*)a > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3543: FILE: fs/ntfs/attrib.c:1071:
+		if (!ntfs_are_names_equal((ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3543: FILE: fs/ntfs/attrib.c:1071:
+		if (!ntfs_are_names_equal((ntfschar*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3555: FILE: fs/ntfs/attrib.c:1083:
+				!memcmp((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3563: FILE: fs/ntfs/attrib.c:1091:
+		a = (ATTR_RECORD*)((u8*)a + le32_to_cpu(a->length));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3563: FILE: fs/ntfs/attrib.c:1091:
+		a = (ATTR_RECORD*)((u8*)a + le32_to_cpu(a->length));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3608: FILE: fs/ntfs/attrib.c:1136:
+	ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3608: FILE: fs/ntfs/attrib.c:1136:
+	ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3705: FILE: fs/ntfs/attrib.c:1233:
+		.attr = (ATTR_RECORD*)((u8*)mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3705: FILE: fs/ntfs/attrib.c:1233:
+		.attr = (ATTR_RECORD*)((u8*)mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3728: FILE: fs/ntfs/attrib.c:1256:
+		ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3728: FILE: fs/ntfs/attrib.c:1256:
+		ctx->attr = (ATTR_RECORD*)((u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3795: FILE: fs/ntfs/attrib.c:1323:
+	for (ad = vol->attrdef; (u8*)ad - (u8*)vol->attrdef <

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3795: FILE: fs/ntfs/attrib.c:1323:
+	for (ad = vol->attrdef; (u8*)ad - (u8*)vol->attrdef <

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3931: FILE: fs/ntfs/attrib.c:1459:
+		memmove((u8*)a + new_size, (u8*)a + le32_to_cpu(a->length),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3931: FILE: fs/ntfs/attrib.c:1459:
+		memmove((u8*)a + new_size, (u8*)a + le32_to_cpu(a->length),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3932: FILE: fs/ntfs/attrib.c:1460:
+				le32_to_cpu(m->bytes_in_use) - ((u8*)a -

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3933: FILE: fs/ntfs/attrib.c:1461:
+				(u8*)m) - le32_to_cpu(a->length));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#3976: FILE: fs/ntfs/attrib.c:1504:
+		memset((u8*)a + le16_to_cpu(a->data.resident.value_offset) +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4142: FILE: fs/ntfs/attrib.c:1670:
+		memcpy(kaddr, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4163: FILE: fs/ntfs/attrib.c:1691:
+		memmove((u8*)a + name_ofs, (u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4163: FILE: fs/ntfs/attrib.c:1691:
+		memmove((u8*)a + name_ofs, (u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4186: FILE: fs/ntfs/attrib.c:1714:
+	err = ntfs_mapping_pairs_build(vol, (u8*)a + mp_ofs,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4244: FILE: fs/ntfs/attrib.c:1772:
+		memmove((u8*)a + name_ofs, (u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4244: FILE: fs/ntfs/attrib.c:1772:
+		memmove((u8*)a + name_ofs, (u8*)a + le16_to_cpu(a->name_offset),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4291: FILE: fs/ntfs/attrib.c:1819:
+		memcpy((u8*)a + mp_ofs, kaddr, attr_size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4784: FILE: fs/ntfs/attrib.c:2312:
+	err = ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#4928: FILE: fs/ntfs/attrib.c:2456:
+			if (ntfs_mapping_pairs_build(vol, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5858: FILE: fs/ntfs/compress.c:195:
+	if (cb == cb_end || !le16_to_cpup((le16*)cb) ||

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5908: FILE: fs/ntfs/compress.c:245:
+	cb_sb_end = cb_sb_start + (le16_to_cpup((le16*)cb) & NTFS_SB_SIZE_MASK)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5927: FILE: fs/ntfs/compress.c:264:
+	dp_addr = (u8*)page_address(dp) + do_sb_start;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#5930: FILE: fs/ntfs/compress.c:267:
+	if (!(le16_to_cpup((le16*)cb) & NTFS_SB_IS_COMPRESSED)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6035: FILE: fs/ntfs/compress.c:372:
+		pt = le16_to_cpup((le16*)cb);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6376: FILE: fs/ntfs/compress.c:713:
+		*(u16*)cb_pos = 0;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6960: FILE: fs/ntfs/dir.c:113:
+	ir = (INDEX_ROOT*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6960: FILE: fs/ntfs/dir.c:113:
+	ir = (INDEX_ROOT*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6962: FILE: fs/ntfs/dir.c:115:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6964: FILE: fs/ntfs/dir.c:117:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6964: FILE: fs/ntfs/dir.c:117:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6970: FILE: fs/ntfs/dir.c:123:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6970: FILE: fs/ntfs/dir.c:123:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6972: FILE: fs/ntfs/dir.c:125:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6972: FILE: fs/ntfs/dir.c:125:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6972: FILE: fs/ntfs/dir.c:125:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6974: FILE: fs/ntfs/dir.c:127:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#6991: FILE: fs/ntfs/dir.c:144:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7041: FILE: fs/ntfs/dir.c:194:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7082: FILE: fs/ntfs/dir.c:235:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7101: FILE: fs/ntfs/dir.c:254:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7139: FILE: fs/ntfs/dir.c:292:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7139: FILE: fs/ntfs/dir.c:292:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7164: FILE: fs/ntfs/dir.c:317:
+	kaddr = (u8*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7167: FILE: fs/ntfs/dir.c:320:
+	ia = (INDEX_ALLOCATION*)(kaddr + ((vcn <<

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7170: FILE: fs/ntfs/dir.c:323:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7170: FILE: fs/ntfs/dir.c:323:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7202: FILE: fs/ntfs/dir.c:355:
+	index_end = (u8*)ia + dir_ni->itype.index.block_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7211: FILE: fs/ntfs/dir.c:364:
+	index_end = (u8*)&ia->index + le32_to_cpu(ia->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7212: FILE: fs/ntfs/dir.c:365:
+	if (index_end > (u8*)ia + dir_ni->itype.index.block_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7219: FILE: fs/ntfs/dir.c:372:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7219: FILE: fs/ntfs/dir.c:372:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7226: FILE: fs/ntfs/dir.c:379:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7226: FILE: fs/ntfs/dir.c:379:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7228: FILE: fs/ntfs/dir.c:381:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7228: FILE: fs/ntfs/dir.c:381:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7228: FILE: fs/ntfs/dir.c:381:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7230: FILE: fs/ntfs/dir.c:383:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7251: FILE: fs/ntfs/dir.c:404:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7301: FILE: fs/ntfs/dir.c:454:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7344: FILE: fs/ntfs/dir.c:497:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7363: FILE: fs/ntfs/dir.c:516:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7390: FILE: fs/ntfs/dir.c:543:
+		vcn = sle64_to_cpup((sle64*)((u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7390: FILE: fs/ntfs/dir.c:543:
+		vcn = sle64_to_cpup((sle64*)((u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7511: FILE: fs/ntfs/dir.c:664:
+	ir = (INDEX_ROOT*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7511: FILE: fs/ntfs/dir.c:664:
+	ir = (INDEX_ROOT*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7513: FILE: fs/ntfs/dir.c:666:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7515: FILE: fs/ntfs/dir.c:668:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7515: FILE: fs/ntfs/dir.c:668:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7521: FILE: fs/ntfs/dir.c:674:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7521: FILE: fs/ntfs/dir.c:674:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7523: FILE: fs/ntfs/dir.c:676:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7523: FILE: fs/ntfs/dir.c:676:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7523: FILE: fs/ntfs/dir.c:676:
+		if ((u8*)ie < (u8*)ctx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7525: FILE: fs/ntfs/dir.c:678:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7553: FILE: fs/ntfs/dir.c:706:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7567: FILE: fs/ntfs/dir.c:720:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7586: FILE: fs/ntfs/dir.c:739:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7617: FILE: fs/ntfs/dir.c:770:
+	vcn = sle64_to_cpup((u8*)ie + le16_to_cpu(ie->length) - 8);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7642: FILE: fs/ntfs/dir.c:795:
+	kaddr = (u8*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7645: FILE: fs/ntfs/dir.c:798:
+	ia = (INDEX_ALLOCATION*)(kaddr + ((vcn <<

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7648: FILE: fs/ntfs/dir.c:801:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7648: FILE: fs/ntfs/dir.c:801:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7680: FILE: fs/ntfs/dir.c:833:
+	index_end = (u8*)ia + dir_ni->itype.index.block_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7689: FILE: fs/ntfs/dir.c:842:
+	index_end = (u8*)&ia->index + le32_to_cpu(ia->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7690: FILE: fs/ntfs/dir.c:843:
+	if (index_end > (u8*)ia + dir_ni->itype.index.block_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7697: FILE: fs/ntfs/dir.c:850:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7697: FILE: fs/ntfs/dir.c:850:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7704: FILE: fs/ntfs/dir.c:857:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7704: FILE: fs/ntfs/dir.c:857:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7706: FILE: fs/ntfs/dir.c:859:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7706: FILE: fs/ntfs/dir.c:859:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7706: FILE: fs/ntfs/dir.c:859:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7708: FILE: fs/ntfs/dir.c:861:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7740: FILE: fs/ntfs/dir.c:893:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7754: FILE: fs/ntfs/dir.c:907:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7773: FILE: fs/ntfs/dir.c:926:
+				(ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7800: FILE: fs/ntfs/dir.c:953:
+		vcn = sle64_to_cpup((u8*)ie + le16_to_cpu(ie->length) - 8);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#7882: FILE: fs/ntfs/dir.c:1035:
+	name_len = ntfs_ucstonls(vol, (ntfschar*)&ie->key.file_name.file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8015: FILE: fs/ntfs/dir.c:1168:
+	memcpy(ir, (u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8021: FILE: fs/ntfs/dir.c:1174:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8023: FILE: fs/ntfs/dir.c:1176:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8023: FILE: fs/ntfs/dir.c:1176:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8030: FILE: fs/ntfs/dir.c:1183:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8030: FILE: fs/ntfs/dir.c:1183:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8031: FILE: fs/ntfs/dir.c:1184:
+		ntfs_debug("In index root, offset 0x%zx.", (u8*)ie - (u8*)ir);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8031: FILE: fs/ntfs/dir.c:1184:
+		ntfs_debug("In index root, offset 0x%zx.", (u8*)ie - (u8*)ir);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8033: FILE: fs/ntfs/dir.c:1186:
+		if (unlikely((u8*)ie < (u8*)ir || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8033: FILE: fs/ntfs/dir.c:1186:
+		if (unlikely((u8*)ie < (u8*)ir || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8033: FILE: fs/ntfs/dir.c:1186:
+		if (unlikely((u8*)ie < (u8*)ir || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8035: FILE: fs/ntfs/dir.c:1188:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8042: FILE: fs/ntfs/dir.c:1195:
+		if (ir_pos > (u8*)ie - (u8*)ir)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8042: FILE: fs/ntfs/dir.c:1195:
+		if (ir_pos > (u8*)ie - (u8*)ir)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8045: FILE: fs/ntfs/dir.c:1198:
+		actor->pos = (u8*)ie - (u8*)ir;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8045: FILE: fs/ntfs/dir.c:1198:
+		actor->pos = (u8*)ie - (u8*)ir;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8098: FILE: fs/ntfs/dir.c:1251:
+	bmp = (u8*)page_address(bmp_page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8141: FILE: fs/ntfs/dir.c:1294:
+		kaddr = (u8*)page_address(ia_page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8144: FILE: fs/ntfs/dir.c:1297:
+	ia = (INDEX_ALLOCATION*)(kaddr + (ia_pos & ~PAGE_MASK &

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8147: FILE: fs/ntfs/dir.c:1300:
+	if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8147: FILE: fs/ntfs/dir.c:1300:
+	if (unlikely((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8184: FILE: fs/ntfs/dir.c:1337:
+	index_end = (u8*)ia + ndir->itype.index.block_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8194: FILE: fs/ntfs/dir.c:1347:
+	index_end = (u8*)&ia->index + le32_to_cpu(ia->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8195: FILE: fs/ntfs/dir.c:1348:
+	if (unlikely(index_end > (u8*)ia + ndir->itype.index.block_size)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8203: FILE: fs/ntfs/dir.c:1356:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8203: FILE: fs/ntfs/dir.c:1356:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8210: FILE: fs/ntfs/dir.c:1363:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8210: FILE: fs/ntfs/dir.c:1363:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8213: FILE: fs/ntfs/dir.c:1366:
+				(unsigned long long)((u8*)ie - (u8*)ia));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8213: FILE: fs/ntfs/dir.c:1366:
+				(unsigned long long)((u8*)ie - (u8*)ia));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8215: FILE: fs/ntfs/dir.c:1368:
+		if (unlikely((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8215: FILE: fs/ntfs/dir.c:1368:
+		if (unlikely((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8215: FILE: fs/ntfs/dir.c:1368:
+		if (unlikely((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8217: FILE: fs/ntfs/dir.c:1370:
+				(u8*)ie + le16_to_cpu(ie->key_length) >

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8224: FILE: fs/ntfs/dir.c:1377:
+		if (ia_pos - ia_start > (u8*)ie - (u8*)ia)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8224: FILE: fs/ntfs/dir.c:1377:
+		if (ia_pos - ia_start > (u8*)ie - (u8*)ia)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8227: FILE: fs/ntfs/dir.c:1380:
+		actor->pos = (u8*)ie - (u8*)ia +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8227: FILE: fs/ntfs/dir.c:1380:
+		actor->pos = (u8*)ie - (u8*)ia +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8469: FILE: fs/ntfs/endian.h:36:
+	return le16_to_cpu(*(__force le16*)x);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8474: FILE: fs/ntfs/endian.h:41:
+	return le32_to_cpu(*(__force le32*)x);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8479: FILE: fs/ntfs/endian.h:46:
+	return le64_to_cpu(*(__force le64*)x);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#8678: FILE: fs/ntfs/file.c:160:
+	kattr = (u8*)a + le16_to_cpu(a->data.resident.value_offset);

WARNING:SPACING: space prohibited before semicolon
#9601: FILE: fs/ntfs/file.c:1083:
+			break ;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#9608: FILE: fs/ntfs/file.c:1090:
+		err = ntfs_mapping_pairs_build(vol, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#9804: FILE: fs/ntfs/file.c:1286:
+			if (ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10112: FILE: fs/ntfs/file.c:1594:
+	kattr = (u8*)a + le16_to_cpu(a->data.resident.value_offset);

WARNING:REPEATED_WORD: Possible repeated word: 'up'
#10413: FILE: fs/ntfs/file.c:1895:
+ * Basically the same as generic_file_write_iter() except that it ends up
+ * up calling ntfs_perform_write() instead of generic_perform_write() and that

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10682: FILE: fs/ntfs/index.c:161:
+	ir = (INDEX_ROOT*)((u8*)actx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10682: FILE: fs/ntfs/index.c:161:
+	ir = (INDEX_ROOT*)((u8*)actx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10684: FILE: fs/ntfs/index.c:163:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10686: FILE: fs/ntfs/index.c:165:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10686: FILE: fs/ntfs/index.c:165:
+	ie = (INDEX_ENTRY*)((u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10692: FILE: fs/ntfs/index.c:171:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10692: FILE: fs/ntfs/index.c:171:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10694: FILE: fs/ntfs/index.c:173:
+		if ((u8*)ie < (u8*)actx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10694: FILE: fs/ntfs/index.c:173:
+		if ((u8*)ie < (u8*)actx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10694: FILE: fs/ntfs/index.c:173:
+		if ((u8*)ie < (u8*)actx->mrec || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10696: FILE: fs/ntfs/index.c:175:
+				(u8*)ie + le16_to_cpu(ie->length) > index_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10724: FILE: fs/ntfs/index.c:203:
+			ictx->data = (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10769: FILE: fs/ntfs/index.c:248:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10769: FILE: fs/ntfs/index.c:248:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10794: FILE: fs/ntfs/index.c:273:
+	kaddr = (u8*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10797: FILE: fs/ntfs/index.c:276:
+	ia = (INDEX_ALLOCATION*)(kaddr + ((vcn <<

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10800: FILE: fs/ntfs/index.c:279:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10800: FILE: fs/ntfs/index.c:279:
+	if ((u8*)ia < kaddr || (u8*)ia > kaddr + PAGE_SIZE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10832: FILE: fs/ntfs/index.c:311:
+	index_end = (u8*)ia + idx_ni->itype.index.block_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10841: FILE: fs/ntfs/index.c:320:
+	index_end = (u8*)&ia->index + le32_to_cpu(ia->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10842: FILE: fs/ntfs/index.c:321:
+	if (index_end > (u8*)ia + idx_ni->itype.index.block_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10849: FILE: fs/ntfs/index.c:328:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10849: FILE: fs/ntfs/index.c:328:
+	ie = (INDEX_ENTRY*)((u8*)&ia->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10856: FILE: fs/ntfs/index.c:335:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10856: FILE: fs/ntfs/index.c:335:
+	for (;; ie = (INDEX_ENTRY*)((u8*)ie + le16_to_cpu(ie->length))) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10858: FILE: fs/ntfs/index.c:337:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10858: FILE: fs/ntfs/index.c:337:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10858: FILE: fs/ntfs/index.c:337:
+		if ((u8*)ie < (u8*)ia || (u8*)ie +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10860: FILE: fs/ntfs/index.c:339:
+				(u8*)ie + le16_to_cpu(ie->length) > index_end) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10930: FILE: fs/ntfs/index.c:409:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#10930: FILE: fs/ntfs/index.c:409:
+	vcn = sle64_to_cpup((sle64*)((u8*)ie + le16_to_cpu(ie->length) - 8));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11096: FILE: fs/ntfs/index.h:129:
+				(u8*)ictx->ia - (u8*)page_address(ictx->page));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11096: FILE: fs/ntfs/index.h:129:
+				(u8*)ictx->ia - (u8*)page_address(ictx->page));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11561: FILE: fs/ntfs/inode.c:454:
+		p = (u8*)attr + le32_to_cpu(attr->length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11562: FILE: fs/ntfs/inode.c:455:
+		if (p < (u8*)ctx->mrec || (u8*)p > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11562: FILE: fs/ntfs/inode.c:455:
+		if (p < (u8*)ctx->mrec || (u8*)p > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11562: FILE: fs/ntfs/inode.c:455:
+		if (p < (u8*)ctx->mrec || (u8*)p > (u8*)ctx->mrec +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11585: FILE: fs/ntfs/inode.c:478:
+		file_name_attr = (FILE_NAME_ATTR*)((u8*)attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11585: FILE: fs/ntfs/inode.c:478:
+		file_name_attr = (FILE_NAME_ATTR*)((u8*)attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11588: FILE: fs/ntfs/inode.c:481:
+		if (p2 < (u8*)attr || p2 > p)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11745: FILE: fs/ntfs/inode.c:638:
+	si = (STANDARD_INFORMATION*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11745: FILE: fs/ntfs/inode.c:638:
+	si = (STANDARD_INFORMATION*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11847: FILE: fs/ntfs/inode.c:740:
+			if ((u8*)a + le16_to_cpu(a->data.resident.value_offset)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11850: FILE: fs/ntfs/inode.c:743:
+					(u8*)ctx->mrec + vol->mft_record_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11856: FILE: fs/ntfs/inode.c:749:
+			memcpy(ni->attr_list, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11919: FILE: fs/ntfs/inode.c:812:
+		ir = (INDEX_ROOT*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11919: FILE: fs/ntfs/inode.c:812:
+		ir = (INDEX_ROOT*)((u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11921: FILE: fs/ntfs/inode.c:814:
+		ir_end = (u8*)ir + le32_to_cpu(a->data.resident.value_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11922: FILE: fs/ntfs/inode.c:815:
+		if (ir_end > (u8*)ctx->mrec + vol->mft_record_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#11927: FILE: fs/ntfs/inode.c:820:
+		index_end = (u8*)&ir->index +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12642: FILE: fs/ntfs/inode.c:1535:
+	ir = (INDEX_ROOT*)((u8*)a + le16_to_cpu(a->data.resident.value_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12642: FILE: fs/ntfs/inode.c:1535:
+	ir = (INDEX_ROOT*)((u8*)a + le16_to_cpu(a->data.resident.value_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12643: FILE: fs/ntfs/inode.c:1536:
+	ir_end = (u8*)ir + le32_to_cpu(a->data.resident.value_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12644: FILE: fs/ntfs/inode.c:1537:
+	if (ir_end > (u8*)ctx->mrec + vol->mft_record_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12648: FILE: fs/ntfs/inode.c:1541:
+	index_end = (u8*)&ir->index + le32_to_cpu(ir->index.index_length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12901: FILE: fs/ntfs/inode.c:1794:
+	m = (MFT_RECORD*)ntfs_malloc_nofs(i);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12921: FILE: fs/ntfs/inode.c:1814:
+		memcpy((char*)m + (i << sb->s_blocksize_bits), bh->b_data,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#12933: FILE: fs/ntfs/inode.c:1826:
+	if (post_read_mst_fixup((NTFS_RECORD*)m, vol->mft_record_size)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13038: FILE: fs/ntfs/inode.c:1931:
+			if ((u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13042: FILE: fs/ntfs/inode.c:1935:
+					(u8*)ctx->mrec + vol->mft_record_size) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13048: FILE: fs/ntfs/inode.c:1941:
+			memcpy(ni->attr_list, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13065: FILE: fs/ntfs/inode.c:1958:
+		al_entry = (ATTR_LIST_ENTRY*)ni->attr_list;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13066: FILE: fs/ntfs/inode.c:1959:
+		al_end = (u8*)al_entry + ni->attr_list_size;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13069: FILE: fs/ntfs/inode.c:1962:
+			if ((u8*)al_entry < ni->attr_list ||

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13070: FILE: fs/ntfs/inode.c:1963:
+					(u8*)al_entry > al_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13073: FILE: fs/ntfs/inode.c:1966:
+			if ((u8*)al_entry == al_end)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13077: FILE: fs/ntfs/inode.c:1970:
+			if ((u8*)al_entry + 6 > al_end || (u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13077: FILE: fs/ntfs/inode.c:1970:
+			if ((u8*)al_entry + 6 > al_end || (u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13080: FILE: fs/ntfs/inode.c:1973:
+			next_al_entry = (ATTR_LIST_ENTRY*)((u8*)al_entry +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13080: FILE: fs/ntfs/inode.c:1973:
+			next_al_entry = (ATTR_LIST_ENTRY*)((u8*)al_entry +

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#13426: FILE: fs/ntfs/inode.c:2319:
+		seq_printf(sf, ",case_sensitive");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#13428: FILE: fs/ntfs/inode.c:2321:
+		seq_printf(sf, ",show_sys_files");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#13430: FILE: fs/ntfs/inode.c:2323:
+		seq_printf(sf, ",disable_sparse");

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#13853: FILE: fs/ntfs/inode.c:2746:
+	err = ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#14104: FILE: fs/ntfs/inode.c:2997:
+	si = (STANDARD_INFORMATION*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#14104: FILE: fs/ntfs/inode.c:2997:
+	si = (STANDARD_INFORMATION*)((u8*)ctx->attr +

WARNING:REPEATED_WORD: Possible repeated word: 'runlist'
#14270: FILE: fs/ntfs/inode.h:55:
+	runlist runlist;	/* If state has the NI_NonResident bit set,

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#15673: FILE: fs/ntfs/layout.h:1142:
+	   meaning that that particular value(s) is(are) not defined. */

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18254: FILE: fs/ntfs/logfile.c:153:
+	ra = (RESTART_AREA*)((u8*)rp + ra_ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18254: FILE: fs/ntfs/logfile.c:153:
+	ra = (RESTART_AREA*)((u8*)rp + ra_ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18369: FILE: fs/ntfs/logfile.c:268:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18369: FILE: fs/ntfs/logfile.c:268:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18370: FILE: fs/ntfs/logfile.c:269:
+	ca = (LOG_CLIENT_RECORD*)((u8*)ra +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18370: FILE: fs/ntfs/logfile.c:269:
+	ca = (LOG_CLIENT_RECORD*)((u8*)ra +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18456: FILE: fs/ntfs/logfile.c:355:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18456: FILE: fs/ntfs/logfile.c:355:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18498: FILE: fs/ntfs/logfile.c:397:
+			memcpy((u8*)trp + have_read, page_address(page), size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18510: FILE: fs/ntfs/logfile.c:409:
+			&& post_read_mst_fixup((NTFS_RECORD*)trp,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18640: FILE: fs/ntfs/logfile.c:539:
+		kaddr = (u8*)page_address(page) + (pos & ~PAGE_MASK);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18646: FILE: fs/ntfs/logfile.c:545:
+		if (!ntfs_is_empty_recordp((le32*)kaddr))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18654: FILE: fs/ntfs/logfile.c:553:
+		if (ntfs_is_rcrd_recordp((le32*)kaddr))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18657: FILE: fs/ntfs/logfile.c:556:
+		if (!ntfs_is_rstr_recordp((le32*)kaddr) &&

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18658: FILE: fs/ntfs/logfile.c:557:
+				!ntfs_is_chkd_recordp((le32*)kaddr)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18669: FILE: fs/ntfs/logfile.c:568:
+				(RESTART_PAGE_HEADER*)kaddr, pos,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18786: FILE: fs/ntfs/logfile.c:685:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#18786: FILE: fs/ntfs/logfile.c:685:
+	ra = (RESTART_AREA*)((u8*)rp + le16_to_cpu(rp->restart_area_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#19416: FILE: fs/ntfs/mft.c:76:
+		if (likely(ntfs_is_mft_recordp((le32*)(page_address(page) +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#19431: FILE: fs/ntfs/mft.c:91:
+	return (void*)page;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#19854: FILE: fs/ntfs/mft.c:514:
+	m_start = kmirr - (u8*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#19949: FILE: fs/ntfs/mft.c:609:
+	post_write_mst_fixup((NTFS_RECORD*)kmirr);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20107: FILE: fs/ntfs/mft.c:767:
+	err = pre_write_mst_fixup((NTFS_RECORD*)m, vol->mft_record_size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20147: FILE: fs/ntfs/mft.c:807:
+	post_write_mst_fixup((NTFS_RECORD*)m);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20534: FILE: fs/ntfs/mft.c:1194:
+			buf = (u8*)page_address(page) + page_ofs;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20672: FILE: fs/ntfs/mft.c:1332:
+	b = (u8*)page_address(page) + (ll & ~PAGE_MASK);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20787: FILE: fs/ntfs/mft.c:1447:
+	ret = ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#20873: FILE: fs/ntfs/mft.c:1533:
+		if (ntfs_mapping_pairs_build(vol, (u8*)a + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21224: FILE: fs/ntfs/mft.c:1884:
+	ret = ntfs_mapping_pairs_build(vol, (u8*)a +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21389: FILE: fs/ntfs/mft.c:2049:
+	*(le16*)((u8*)m + le16_to_cpu(m->usa_ofs)) = cpu_to_le16(1);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21389: FILE: fs/ntfs/mft.c:2049:
+	*(le16*)((u8*)m + le16_to_cpu(m->usa_ofs)) = cpu_to_le16(1);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21410: FILE: fs/ntfs/mft.c:2070:
+	a = (ATTR_RECORD*)((u8*)m + le16_to_cpu(m->attrs_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21410: FILE: fs/ntfs/mft.c:2070:
+	a = (ATTR_RECORD*)((u8*)m + le16_to_cpu(m->attrs_offset));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21466: FILE: fs/ntfs/mft.c:2126:
+	m = (MFT_RECORD*)((u8*)page_address(page) + ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21466: FILE: fs/ntfs/mft.c:2126:
+	m = (MFT_RECORD*)((u8*)page_address(page) + ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21868: FILE: fs/ntfs/mft.c:2528:
+	m = (MFT_RECORD*)((u8*)page_address(page) + ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21868: FILE: fs/ntfs/mft.c:2528:
+	m = (MFT_RECORD*)((u8*)page_address(page) + ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21894: FILE: fs/ntfs/mft.c:2554:
+		usn = *(le16*)((u8*)m + le16_to_cpu(m->usa_ofs));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21894: FILE: fs/ntfs/mft.c:2554:
+		usn = *(le16*)((u8*)m + le16_to_cpu(m->usa_ofs));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21907: FILE: fs/ntfs/mft.c:2567:
+			*(le16*)((u8*)m + le16_to_cpu(m->usa_ofs)) = usn;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#21907: FILE: fs/ntfs/mft.c:2567:
+			*(le16*)((u8*)m + le16_to_cpu(m->usa_ofs)) = usn;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22155: FILE: fs/ntfs/mft.c:2815:
+				sizeof(ntfs_inode*));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22222: FILE: fs/ntfs/mft.c:2882:
+		int new_size = (base_ni->nr_extents + 4) * sizeof(ntfs_inode*);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22235: FILE: fs/ntfs/mft.c:2895:
+					new_size - 4 * sizeof(ntfs_inode*));

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22413: FILE: fs/ntfs/mst.c:44:
+	usa_pos = (u16*)b + usa_ofs/sizeof(u16);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22425: FILE: fs/ntfs/mst.c:56:
+	data_pos = (u16*)b + NTFS_BLOCK_SIZE/sizeof(u16) - 1;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22443: FILE: fs/ntfs/mst.c:74:
+	data_pos = (u16*)b + NTFS_BLOCK_SIZE/sizeof(u16) - 1;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22499: FILE: fs/ntfs/mst.c:130:
+	usa_pos = (le16*)((u8*)b + usa_ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22499: FILE: fs/ntfs/mst.c:130:
+	usa_pos = (le16*)((u8*)b + usa_ofs);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22510: FILE: fs/ntfs/mst.c:141:
+	data_pos = (le16*)b + NTFS_BLOCK_SIZE/sizeof(le16) - 1;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22542: FILE: fs/ntfs/mst.c:173:
+	usa_pos = (le16*)b + usa_ofs/sizeof(le16);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22545: FILE: fs/ntfs/mst.c:176:
+	data_pos = (le16*)b + NTFS_BLOCK_SIZE/sizeof(le16) - 1;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22738: FILE: fs/ntfs/namei.c:174:
+				(ntfschar*)&name->name, name->len,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22783: FILE: fs/ntfs/namei.c:219:
+			fn = (FILE_NAME_ATTR*)((u8*)ctx->attr + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22783: FILE: fs/ntfs/namei.c:219:
+			fn = (FILE_NAME_ATTR*)((u8*)ctx->attr + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22792: FILE: fs/ntfs/namei.c:228:
+				(ntfschar*)&fn->file_name, fn->file_name_length,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#22890: FILE: fs/ntfs/namei.c:326:
+			(u8*)attr + le32_to_cpu(attr->length)))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#23176: FILE: fs/ntfs/quota.c:58:
+	qce = (QUOTA_CONTROL_ENTRY*)ictx->data;

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#24015: FILE: fs/ntfs/runlist.c:761:
+	buf = (u8*)attr + le16_to_cpu(

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#24017: FILE: fs/ntfs/runlist.c:763:
+	attr_end = (u8*)attr + le32_to_cpu(attr->length);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#24018: FILE: fs/ntfs/runlist.c:764:
+	if (unlikely(buf < (u8*)attr || buf > attr_end)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25643: FILE: fs/ntfs/super.c:396:
+	vi = (VOLUME_INFORMATION*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25643: FILE: fs/ntfs/super.c:396:
+	vi = (VOLUME_INFORMATION*)((u8*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25834: FILE: fs/ntfs/super.c:587:
+	if ((void*)b < (void*)&b->checksum && b->checksum && !silent) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25834: FILE: fs/ntfs/super.c:587:
+	if ((void*)b < (void*)&b->checksum && b->checksum && !silent) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25838: FILE: fs/ntfs/super.c:591:
+		for (i = 0, u = (le32*)b; u < (le32*)(&b->checksum); ++u)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25838: FILE: fs/ntfs/super.c:591:
+		for (i = 0, u = (le32*)b; u < (le32*)(&b->checksum); ++u)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25926: FILE: fs/ntfs/super.c:679:
+		if (is_boot_sector_ntfs(sb, (NTFS_BOOT_SECTOR*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25943: FILE: fs/ntfs/super.c:696:
+		if (is_boot_sector_ntfs(sb, (NTFS_BOOT_SECTOR*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#25951: FILE: fs/ntfs/super.c:704:
+		if (is_boot_sector_ntfs(sb, (NTFS_BOOT_SECTOR*)

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26374: FILE: fs/ntfs/super.c:1127:
+		if (((MFT_RECORD*)kmft)->flags & MFT_RECORD_IN_USE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26376: FILE: fs/ntfs/super.c:1129:
+			if (ntfs_is_baad_recordp((le32*)kmft)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26388: FILE: fs/ntfs/super.c:1141:
+		if (((MFT_RECORD*)kmirr)->flags & MFT_RECORD_IN_USE) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26389: FILE: fs/ntfs/super.c:1142:
+			if (ntfs_is_baad_recordp((le32*)kmirr)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26397: FILE: fs/ntfs/super.c:1150:
+		bytes = le32_to_cpu(((MFT_RECORD*)kmft)->bytes_in_use);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26400: FILE: fs/ntfs/super.c:1153:
+				ntfs_is_baad_recordp((le32*)kmft)) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26401: FILE: fs/ntfs/super.c:1154:
+			bytes = le32_to_cpu(((MFT_RECORD*)kmirr)->bytes_in_use);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26404: FILE: fs/ntfs/super.c:1157:
+					ntfs_is_baad_recordp((le32*)kmirr))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26567: FILE: fs/ntfs/super.c:1320:
+	kaddr = (u32*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26568: FILE: fs/ntfs/super.c:1321:
+	if (*(le32*)kaddr == cpu_to_le32(0x72626968)/*'hibr'*/) {

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26787: FILE: fs/ntfs/super.c:1540:
+	uh = (USN_HEADER*)page_address(page);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26855: FILE: fs/ntfs/super.c:1608:
+	vol->attrdef = (ATTR_DEF*)ntfs_malloc_nofs(i_size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26867: FILE: fs/ntfs/super.c:1620:
+		memcpy((u8*)vol->attrdef + (index++ << PAGE_SHIFT),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26924: FILE: fs/ntfs/super.c:1677:
+	vol->upcase = (ntfschar*)ntfs_malloc_nofs(i_size);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#26936: FILE: fs/ntfs/super.c:1689:
+		memcpy((char*)vol->upcase + (index++ << PAGE_SHIFT),

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#27128: FILE: fs/ntfs/super.c:1881:
+	vi = (VOLUME_INFORMATION*)((char*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#27128: FILE: fs/ntfs/super.c:1881:
+	vi = (VOLUME_INFORMATION*)((char*)ctx->attr +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#27131: FILE: fs/ntfs/super.c:1884:
+	if ((u8*)vi < (u8*)ctx->attr || (u8*)vi +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#27131: FILE: fs/ntfs/super.c:1884:
+	if ((u8*)vi < (u8*)ctx->attr || (u8*)vi +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#27131: FILE: fs/ntfs/super.c:1884:
+	if ((u8*)vi < (u8*)ctx->attr || (u8*)vi +

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#27133: FILE: fs/ntfs/super.c:1886:
+			(u8*)ctx->attr + le32_to_cpu(ctx->attr->length))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#28003: FILE: fs/ntfs/super.c:2756:
+	if (!parse_options(vol, (char*)opt))

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#28047: FILE: fs/ntfs/super.c:2800:
+	result = parse_ntfs_boot_sector(vol, (NTFS_BOOT_SECTOR*)bh->b_data);

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#28914: FILE: fs/ntfs/unistr.c:206:
+	ntfs_upcase_name((ntfschar*)&file_name_attr->file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#28923: FILE: fs/ntfs/unistr.c:215:
+	return ntfs_collate_names((ntfschar*)&file_name_attr1->file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#28925: FILE: fs/ntfs/unistr.c:217:
+			(ntfschar*)&file_name_attr2->file_name,

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#29224: FILE: fs/ntfs/usnjrnl.c:47:
+		uh = (USN_HEADER*)page_address(page);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

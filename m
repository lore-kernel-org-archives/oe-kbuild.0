Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3EE3AE6E7
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Apr 2026 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776415046; cv=none; b=AGLjePMXhONUCxnLbxLV6ufgFfC/s1+WAkzcyz57cXjZy3BOUz9qZxuF5rSk/cPjgvjuURmVsCBJQ6yy4syuaVPZ8iILYfIKnedL6fZaEHrkdiqF9H7S4FlSgXI7oQZ90j0U+29Hv8VfK7y9PA5oDymgJPG/5FgqM320xm9L7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776415046; c=relaxed/simple;
	bh=hEfUNFKol1X2qcZFxZbJ50tEXRwi5sG5o6QxWQJijVo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OJTKGh3whN1QrFCMiLJevMtFrBUKPGjVKa8tA1yjQqI4qUefDAovYbJeS0qOWTZ4CEoVqAjUIwBLw4gODlvLtSWQ6kGTcobUFomgAcXTwz/nJZK7AQqymrDfslYfXlDMxgOuU1lPoNz4Vn1nsq8lkaO7kuPSmsjHMZGQx/1P0Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsyn3sJm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsyn3sJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776415044; x=1807951044;
  h=date:from:to:cc:subject:message-id;
  bh=hEfUNFKol1X2qcZFxZbJ50tEXRwi5sG5o6QxWQJijVo=;
  b=hsyn3sJmy48edKpdu2yGsJwkM27agw7glkYuw5TZXZj7D3vu36FRPSVs
   OC2JddrbJ7Pbv/WGXBhRmsjx5H1+FX3rFGCtToP9svuMiZ4f4Vy3hr+yQ
   HmJ44sKp5btoMU10dR/tluikigzquej7GEYbyiLOjgkzFVG9wT8vVZtuf
   9IlOTSCcL+CElcXd4dPLGwXplC2wYa+gI03frRfMI7hvTJudT4AN9Qeyo
   hDrSqH2XvXeNhlkj+c2FBRMxZ5SVy9WLBcqnUWS8BXejXs4narltx1VSa
   PN0SuaKuStDAxtthetl1N+TucNrBgRjohES5O0rno1+5jbqwG69qR5RHM
   A==;
X-CSE-ConnectionGUID: /LXbQitMS2yHhhhSmAFg1A==
X-CSE-MsgGUID: JbremZSbSvCqQjyWlqtpVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="80016564"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="80016564"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:37:22 -0700
X-CSE-ConnectionGUID: FkYrluavSxSCgV6JpTbS1Q==
X-CSE-MsgGUID: F/RmXKZgTSekJ1pG9xr7ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="226629094"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2026 01:37:21 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDehS-0000000008J-2hTz;
	Fri, 17 Apr 2026 08:37:18 +0000
Date: Fri, 17 Apr 2026 16:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 433/14055] fs/ntfs/index.c:1266
 ntfs_ir_reparent() warn: variable dereferenced before check 'ctx' (see line
 1237)
Message-ID: <202604171659.ZaLsP7Hh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   452c3b1ea875276105ac90ba474f72b4cd9b77a2
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b [433/14055] ntfs: add Kconfig and Makefile
:::::: branch date: 19 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-141-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171659.ZaLsP7Hh-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604171659.ZaLsP7Hh-lkp@intel.com/

New smatch warnings:
fs/ntfs/index.c:1266 ntfs_ir_reparent() warn: variable dereferenced before check 'ctx' (see line 1237)
fs/ntfs/mft.c:1034 ntfs_mft_bitmap_find_and_alloc_free_rec_nolock() warn: mask and shift to zero: expr='bit >> 3'
fs/ntfs/mft.c:2532 ntfs_mft_record_alloc() error: we previously assumed '*ni' could be null (see line 2112)
fs/ntfs/namei.c:360 ntfs_sd_add_everyone() warn: assigning (-32764) to unsigned variable 'sd->control'
fs/ntfs/bitmap.c:268 __ntfs_bitmap_set_bits_in_run() warn: passing zero to 'PTR_ERR'
fs/ntfs/lcnalloc.c:350 ntfs_cluster_alloc() warn: mask and shift to zero: expr='lcn >> 3'

Old smatch warnings:
fs/ntfs/index.c:2041 ntfs_index_walk_up() warn: inconsistent indenting
fs/ntfs/mft.c:2465 ntfs_mft_record_alloc() warn: inconsistent indenting
fs/ntfs/namei.c:239 ntfs_lookup() warn: passing zero to 'ERR_PTR'
fs/ntfs/namei.c:1091 ntfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/ntfs/namei.c:1175 __ntfs_link() warn: impossible condition '(name_len > 255) => (0-255 > 255)'
fs/ntfs/bitmap.c:276 __ntfs_bitmap_set_bits_in_run() warn: passing zero to 'PTR_ERR'
fs/ntfs/bitmap.c:281 __ntfs_bitmap_set_bits_in_run() warn: passing zero to 'PTR_ERR'
fs/ntfs/bitmap.c:286 __ntfs_bitmap_set_bits_in_run() warn: passing zero to 'PTR_ERR'
fs/ntfs/lcnalloc.c:736 ntfs_cluster_alloc() error: we previously assumed 'rl' could be null (see line 719)

vim +/ctx +1266 fs/ntfs/index.c

0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1168  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1169  static int ntfs_ir_reparent(struct ntfs_index_context *icx)
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1170  {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1171  	struct ntfs_attr_search_ctx *ctx = NULL;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1172  	struct index_root *ir;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1173  	struct index_entry *ie;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1174  	struct index_block *ib = NULL;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1175  	s64 new_ib_vcn;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1176  	int ix_root_size;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1177  	int ret = 0;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1178  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1179  	ntfs_debug("Entering\n");
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1180  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1181  	ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1182  	if (!ir) {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1183  		ret = -ENOENT;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1184  		goto out;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1185  	}
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1186  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1187  	if ((ir->index.flags & NODE_MASK) == SMALL_INDEX) {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1188  		ret = ntfs_ia_add(icx);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1189  		if (ret)
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1190  			goto out;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1191  	}
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1192  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1193  	new_ib_vcn = ntfs_ibm_get_free(icx);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1194  	if (new_ib_vcn < 0) {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1195  		ret = -EINVAL;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1196  		goto out;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1197  	}
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1198  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1199  	ir = ntfs_ir_lookup2(icx->idx_ni, icx->name, icx->name_len);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1200  	if (!ir) {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1201  		ret = -ENOENT;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1202  		goto clear_bmp;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1203  	}
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1204  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1205  	ib = ntfs_ir_to_ib(ir, new_ib_vcn);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1206  	if (ib == NULL) {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1207  		ret = -EIO;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1208  		ntfs_error(icx->idx_ni->vol->sb, "Failed to move index root to index block");
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1209  		goto clear_bmp;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1210  	}
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1211  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1212  	ret = ntfs_ib_write(icx, ib);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1213  	if (ret)
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1214  		goto clear_bmp;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1215  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1216  retry:
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1217  	ir = ntfs_ir_lookup(icx->idx_ni, icx->name, icx->name_len, &ctx);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1218  	if (!ir) {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1219  		ret = -ENOENT;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1220  		goto clear_bmp;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1221  	}
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1222  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1223  	ntfs_ir_nill(ir);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1224  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1225  	ie = ntfs_ie_get_first(&ir->index);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1226  	ie->flags |= INDEX_ENTRY_NODE;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1227  	ie->length = cpu_to_le16(sizeof(struct index_entry_header) + sizeof(s64));
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1228  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1229  	ir->index.flags = LARGE_INDEX;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1230  	NInoSetIndexAllocPresent(icx->idx_ni);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1231  	ir->index.index_length = cpu_to_le32(le32_to_cpu(ir->index.entries_offset) +
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1232  			le16_to_cpu(ie->length));
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1233  	ir->index.allocated_size = ir->index.index_length;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1234  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1235  	ix_root_size = sizeof(struct index_root) - sizeof(struct index_header) +
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1236  		le32_to_cpu(ir->index.allocated_size);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13 @1237  	ret  = ntfs_resident_attr_value_resize(ctx->mrec, ctx->attr, ix_root_size);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1238  	if (ret) {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1239  		/*
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1240  		 * When there is no space to build a non-resident
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1241  		 * index, we may have to move the root to an extent
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1242  		 */
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1243  		if ((ret == -ENOSPC) && (ctx->al_entry || !ntfs_inode_add_attrlist(icx->idx_ni))) {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1244  			ntfs_attr_put_search_ctx(ctx);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1245  			ctx = NULL;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1246  			ir = ntfs_ir_lookup(icx->idx_ni, icx->name, icx->name_len, &ctx);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1247  			if (ir && !ntfs_attr_record_move_away(ctx, ix_root_size -
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1248  					le32_to_cpu(ctx->attr->data.resident.value_length))) {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1249  				if (ntfs_attrlist_update(ctx->base_ntfs_ino ?
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1250  							 ctx->base_ntfs_ino : ctx->ntfs_ino))
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1251  					goto clear_bmp;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1252  				ntfs_attr_put_search_ctx(ctx);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1253  				ctx = NULL;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1254  				goto retry;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1255  			}
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1256  		}
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1257  		goto clear_bmp;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1258  	} else {
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1259  		icx->idx_ni->data_size = icx->idx_ni->initialized_size = ix_root_size;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1260  		icx->idx_ni->allocated_size = (ix_root_size  + 7) & ~7;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1261  	}
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1262  	ntfs_ie_set_vcn(ie, new_ib_vcn);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1263  
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1264  err_out:
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1265  	kvfree(ib);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13 @1266  	if (ctx)
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1267  		ntfs_attr_put_search_ctx(ctx);
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1268  out:
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1269  	return ret;
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1270  clear_bmp:
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1271  	ntfs_ibm_clear(icx, new_ib_vcn);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1272  	goto err_out;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1273  }
0a8ac0c1fa0b99a Namjae Jeon 2026-02-13  1274  

:::::: The code at line 1266 was first introduced by commit
:::::: 0a8ac0c1fa0b99a5b29002bc7f232ed7eafddef0 ntfs: update directory operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

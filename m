Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F83747A
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676560835; x=1708096835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+2AiUHdWn2d/31VBC1a9s5XjiAFpKXPXmiwlMf3JO8=;
  b=HK1H1gv3BM0lIZHNz5Zjt/A94CckgdFZCwAenyF79nCqS7mlL7eCL9ko
   j9bkDFcoNVAGjNxY/1M+40VoNZVSfP3ATLG10u5OoB6DZ0kmqIS/Iyqn4
   Lv0aiWodeNdkn6+RNFD8yydU7IzkRUjR/3i4NW8k+GZwR4zfXXD4x2EFV
   WwbriAEze6EzUW9SHiF6zZe51FKlx8kExSJu3x5RJdnSCbUYkbYO3Zech
   VCuD33787A+ygoiNvkb5TXe6lXJUwV/xQm4TZXoK+WY2OoPXHVULLUDNX
   fv4Hhj/lCF9JEkaxpFjBBIIXnSjt9Z00IEwDApdxvjb4XP3EtdiZ02vTY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333069922"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="333069922"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 07:11:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="812989487"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="812989487"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2023 07:11:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSfuy-000AJJ-2D;
	Thu, 16 Feb 2023 15:11:28 +0000
Date: Thu, 16 Feb 2023 23:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12793/13217] fs/ntfs3/super.c:1351
 ntfs_fill_super() warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <202302162319.bDJOuyfy-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   509583475828c4fd86897113f78315c1431edcc3
commit: b268663f49c37ffeb3cf41a5716444295dc50c3a [12793/13217] fs/ntfs3: Print details about mount fails
:::::: branch date: 11 hours ago
:::::: commit date: 26 hours ago
config: loongarch-randconfig-m041-20230215 (https://download.01.org/0day-ci/archive/20230216/202302162319.bDJOuyfy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302162319.bDJOuyfy-lkp@intel.com/

smatch warnings:
fs/ntfs3/super.c:1351 ntfs_fill_super() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +1351 fs/ntfs3/super.c

82cae269cfa953 Konstantin Komarov 2021-08-13  1134  
e8b8e97f91b80f Kari Argillander   2021-08-03  1135  	/* Check bitmap boundary. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1136  	tt = sbi->used.bitmap.nbits;
82cae269cfa953 Konstantin Komarov 2021-08-13  1137  	if (inode->i_size < bitmap_size(tt)) {
b268663f49c37f Konstantin Komarov 2023-02-15  1138  		ntfs_err(sb, "$Bitmap is corrupted.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1139  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1140  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1141  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1142  
b4f110d65e21bf Kari Argillander   2021-09-09  1143  	err = wnd_init(&sbi->used.bitmap, sb, tt);
b268663f49c37f Konstantin Komarov 2023-02-15  1144  	if (err) {
b268663f49c37f Konstantin Komarov 2023-02-15  1145  		ntfs_err(sb, "Failed to initialize $Bitmap (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1146  		goto put_inode_out;
b268663f49c37f Konstantin Komarov 2023-02-15  1147  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1148  
82cae269cfa953 Konstantin Komarov 2021-08-13  1149  	iput(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1150  
e8b8e97f91b80f Kari Argillander   2021-08-03  1151  	/* Compute the MFT zone. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1152  	err = ntfs_refresh_zone(sbi);
b268663f49c37f Konstantin Komarov 2023-02-15  1153  	if (err) {
b268663f49c37f Konstantin Komarov 2023-02-15  1154  		ntfs_err(sb, "Failed to initialize MFT zone (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1155  		goto out;
b268663f49c37f Konstantin Komarov 2023-02-15  1156  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1157  
ec5fc720137625 Konstantin Komarov 2022-10-11  1158  	/* Load $BadClus. */
ec5fc720137625 Konstantin Komarov 2022-10-11  1159  	ref.low = cpu_to_le32(MFT_REC_BADCLUST);
ec5fc720137625 Konstantin Komarov 2022-10-11  1160  	ref.seq = cpu_to_le16(MFT_REC_BADCLUST);
ec5fc720137625 Konstantin Komarov 2022-10-11  1161  	inode = ntfs_iget5(sb, &ref, &NAME_BADCLUS);
ec5fc720137625 Konstantin Komarov 2022-10-11  1162  	if (IS_ERR(inode)) {
ec5fc720137625 Konstantin Komarov 2022-10-11  1163  		err = PTR_ERR(inode);
ec5fc720137625 Konstantin Komarov 2022-10-11  1164  		ntfs_err(sb, "Failed to load $BadClus (%d).", err);
ec5fc720137625 Konstantin Komarov 2022-10-11  1165  		goto out;
ec5fc720137625 Konstantin Komarov 2022-10-11  1166  	}
ec5fc720137625 Konstantin Komarov 2022-10-11  1167  
ec5fc720137625 Konstantin Komarov 2022-10-11  1168  	ni = ntfs_i(inode);
ec5fc720137625 Konstantin Komarov 2022-10-11  1169  	bad_len = bad_frags = 0;
ec5fc720137625 Konstantin Komarov 2022-10-11  1170  	for (i = 0; run_get_entry(&ni->file.run, i, &vcn, &lcn, &len); i++) {
ec5fc720137625 Konstantin Komarov 2022-10-11  1171  		if (lcn == SPARSE_LCN)
ec5fc720137625 Konstantin Komarov 2022-10-11  1172  			continue;
ec5fc720137625 Konstantin Komarov 2022-10-11  1173  
ec5fc720137625 Konstantin Komarov 2022-10-11  1174  		bad_len += len;
ec5fc720137625 Konstantin Komarov 2022-10-11  1175  		bad_frags += 1;
ec5fc720137625 Konstantin Komarov 2022-10-11  1176  		if (sb_rdonly(sb))
ec5fc720137625 Konstantin Komarov 2022-10-11  1177  			continue;
ec5fc720137625 Konstantin Komarov 2022-10-11  1178  
ec5fc720137625 Konstantin Komarov 2022-10-11  1179  		if (wnd_set_used_safe(&sbi->used.bitmap, lcn, len, &tt) || tt) {
ec5fc720137625 Konstantin Komarov 2022-10-11  1180  			/* Bad blocks marked as free in bitmap. */
ec5fc720137625 Konstantin Komarov 2022-10-11  1181  			ntfs_set_state(sbi, NTFS_DIRTY_ERROR);
ec5fc720137625 Konstantin Komarov 2022-10-11  1182  		}
ec5fc720137625 Konstantin Komarov 2022-10-11  1183  	}
ec5fc720137625 Konstantin Komarov 2022-10-11  1184  	if (bad_len) {
ec5fc720137625 Konstantin Komarov 2022-10-11  1185  		/*
ec5fc720137625 Konstantin Komarov 2022-10-11  1186  		 * Notice about bad blocks.
ec5fc720137625 Konstantin Komarov 2022-10-11  1187  		 * In normal cases these blocks are marked as used in bitmap.
ec5fc720137625 Konstantin Komarov 2022-10-11  1188  		 * And we never allocate space in it.
ec5fc720137625 Konstantin Komarov 2022-10-11  1189  		 */
ec5fc720137625 Konstantin Komarov 2022-10-11  1190  		ntfs_notice(sb,
ec5fc720137625 Konstantin Komarov 2022-10-11  1191  			    "Volume contains %zu bad blocks in %zu fragments.",
ec5fc720137625 Konstantin Komarov 2022-10-11  1192  			    bad_len, bad_frags);
ec5fc720137625 Konstantin Komarov 2022-10-11  1193  	}
ec5fc720137625 Konstantin Komarov 2022-10-11  1194  	iput(inode);
ec5fc720137625 Konstantin Komarov 2022-10-11  1195  
e8b8e97f91b80f Kari Argillander   2021-08-03  1196  	/* Load $AttrDef. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1197  	ref.low = cpu_to_le32(MFT_REC_ATTR);
82cae269cfa953 Konstantin Komarov 2021-08-13  1198  	ref.seq = cpu_to_le16(MFT_REC_ATTR);
b4f110d65e21bf Kari Argillander   2021-09-09  1199  	inode = ntfs_iget5(sb, &ref, &NAME_ATTRDEF);
82cae269cfa953 Konstantin Komarov 2021-08-13  1200  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1201  		err = PTR_ERR(inode);
b268663f49c37f Konstantin Komarov 2023-02-15  1202  		ntfs_err(sb, "Failed to load $AttrDef (%d)", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1203  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1204  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1205  
f22a324c819cac Konstantin Komarov 2022-12-29  1206  	/*
f22a324c819cac Konstantin Komarov 2022-12-29  1207  	 * Typical $AttrDef contains up to 20 entries.
0ddc118d5f04bc Konstantin Komarov 2022-12-30  1208  	 * Check for extremely large/small size.
f22a324c819cac Konstantin Komarov 2022-12-29  1209  	 */
f22a324c819cac Konstantin Komarov 2022-12-29  1210  	if (inode->i_size < sizeof(struct ATTR_DEF_ENTRY) ||
f22a324c819cac Konstantin Komarov 2022-12-29  1211  	    inode->i_size > 100 * sizeof(struct ATTR_DEF_ENTRY)) {
f22a324c819cac Konstantin Komarov 2022-12-29  1212  		ntfs_err(sb, "Looks like $AttrDef is corrupted (size=%llu).",
f22a324c819cac Konstantin Komarov 2022-12-29  1213  			 inode->i_size);
82cae269cfa953 Konstantin Komarov 2021-08-13  1214  		err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1215  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1216  	}
f22a324c819cac Konstantin Komarov 2022-12-29  1217  
82cae269cfa953 Konstantin Komarov 2021-08-13  1218  	bytes = inode->i_size;
59bfd7a483da36 Tetsuo Handa       2022-10-02  1219  	sbi->def_table = t = kmalloc(bytes, GFP_NOFS | __GFP_NOWARN);
82cae269cfa953 Konstantin Komarov 2021-08-13  1220  	if (!t) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1221  		err = -ENOMEM;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1222  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1223  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1224  
82cae269cfa953 Konstantin Komarov 2021-08-13  1225  	for (done = idx = 0; done < bytes; done += PAGE_SIZE, idx++) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1226  		unsigned long tail = bytes - done;
82cae269cfa953 Konstantin Komarov 2021-08-13  1227  		struct page *page = ntfs_map_page(inode->i_mapping, idx);
82cae269cfa953 Konstantin Komarov 2021-08-13  1228  
82cae269cfa953 Konstantin Komarov 2021-08-13  1229  		if (IS_ERR(page)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1230  			err = PTR_ERR(page);
b268663f49c37f Konstantin Komarov 2023-02-15  1231  			ntfs_err(sb, "Failed to read $AttrDef (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1232  			goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1233  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1234  		memcpy(Add2Ptr(t, done), page_address(page),
82cae269cfa953 Konstantin Komarov 2021-08-13  1235  		       min(PAGE_SIZE, tail));
82cae269cfa953 Konstantin Komarov 2021-08-13  1236  		ntfs_unmap_page(page);
82cae269cfa953 Konstantin Komarov 2021-08-13  1237  
82cae269cfa953 Konstantin Komarov 2021-08-13  1238  		if (!idx && ATTR_STD != t->type) {
b268663f49c37f Konstantin Komarov 2023-02-15  1239  			ntfs_err(sb, "$AttrDef is corrupted.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1240  			err = -EINVAL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1241  			goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1242  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1243  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1244  
82cae269cfa953 Konstantin Komarov 2021-08-13  1245  	t += 1;
82cae269cfa953 Konstantin Komarov 2021-08-13  1246  	sbi->def_entries = 1;
82cae269cfa953 Konstantin Komarov 2021-08-13  1247  	done = sizeof(struct ATTR_DEF_ENTRY);
82cae269cfa953 Konstantin Komarov 2021-08-13  1248  	sbi->reparse.max_size = MAXIMUM_REPARSE_DATA_BUFFER_SIZE;
f8d87ed9f0d546 Colin Ian King     2021-08-16  1249  	sbi->ea_max_size = 0x10000; /* default formatter value */
82cae269cfa953 Konstantin Komarov 2021-08-13  1250  
82cae269cfa953 Konstantin Komarov 2021-08-13  1251  	while (done + sizeof(struct ATTR_DEF_ENTRY) <= bytes) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1252  		u32 t32 = le32_to_cpu(t->type);
82cae269cfa953 Konstantin Komarov 2021-08-13  1253  		u64 sz = le64_to_cpu(t->max_sz);
82cae269cfa953 Konstantin Komarov 2021-08-13  1254  
82cae269cfa953 Konstantin Komarov 2021-08-13  1255  		if ((t32 & 0xF) || le32_to_cpu(t[-1].type) >= t32)
82cae269cfa953 Konstantin Komarov 2021-08-13  1256  			break;
82cae269cfa953 Konstantin Komarov 2021-08-13  1257  
82cae269cfa953 Konstantin Komarov 2021-08-13  1258  		if (t->type == ATTR_REPARSE)
82cae269cfa953 Konstantin Komarov 2021-08-13  1259  			sbi->reparse.max_size = sz;
82cae269cfa953 Konstantin Komarov 2021-08-13  1260  		else if (t->type == ATTR_EA)
82cae269cfa953 Konstantin Komarov 2021-08-13  1261  			sbi->ea_max_size = sz;
82cae269cfa953 Konstantin Komarov 2021-08-13  1262  
82cae269cfa953 Konstantin Komarov 2021-08-13  1263  		done += sizeof(struct ATTR_DEF_ENTRY);
82cae269cfa953 Konstantin Komarov 2021-08-13  1264  		t += 1;
82cae269cfa953 Konstantin Komarov 2021-08-13  1265  		sbi->def_entries += 1;
82cae269cfa953 Konstantin Komarov 2021-08-13  1266  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1267  	iput(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1268  
e8b8e97f91b80f Kari Argillander   2021-08-03  1269  	/* Load $UpCase. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1270  	ref.low = cpu_to_le32(MFT_REC_UPCASE);
82cae269cfa953 Konstantin Komarov 2021-08-13  1271  	ref.seq = cpu_to_le16(MFT_REC_UPCASE);
82cae269cfa953 Konstantin Komarov 2021-08-13  1272  	inode = ntfs_iget5(sb, &ref, &NAME_UPCASE);
82cae269cfa953 Konstantin Komarov 2021-08-13  1273  	if (IS_ERR(inode)) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1274  		err = PTR_ERR(inode);
b268663f49c37f Konstantin Komarov 2023-02-15  1275  		ntfs_err(sb, "Failed to load $UpCase (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1276  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1277  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1278  
82cae269cfa953 Konstantin Komarov 2021-08-13  1279  	if (inode->i_size != 0x10000 * sizeof(short)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1280  		err = -EINVAL;
b268663f49c37f Konstantin Komarov 2023-02-15  1281  		ntfs_err(sb, "$UpCase is corrupted.");
9b75450d6c5801 Konstantin Komarov 2021-09-28  1282  		goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1283  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1284  
82cae269cfa953 Konstantin Komarov 2021-08-13  1285  	for (idx = 0; idx < (0x10000 * sizeof(short) >> PAGE_SHIFT); idx++) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1286  		const __le16 *src;
0056b273757b30 Kari Argillander   2021-09-09  1287  		u16 *dst = Add2Ptr(sbi->upcase, idx << PAGE_SHIFT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1288  		struct page *page = ntfs_map_page(inode->i_mapping, idx);
82cae269cfa953 Konstantin Komarov 2021-08-13  1289  
82cae269cfa953 Konstantin Komarov 2021-08-13  1290  		if (IS_ERR(page)) {
82cae269cfa953 Konstantin Komarov 2021-08-13  1291  			err = PTR_ERR(page);
b268663f49c37f Konstantin Komarov 2023-02-15  1292  			ntfs_err(sb, "Failed to read $UpCase (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1293  			goto put_inode_out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1294  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1295  
82cae269cfa953 Konstantin Komarov 2021-08-13  1296  		src = page_address(page);
82cae269cfa953 Konstantin Komarov 2021-08-13  1297  
82cae269cfa953 Konstantin Komarov 2021-08-13  1298  #ifdef __BIG_ENDIAN
82cae269cfa953 Konstantin Komarov 2021-08-13  1299  		for (i = 0; i < PAGE_SIZE / sizeof(u16); i++)
82cae269cfa953 Konstantin Komarov 2021-08-13  1300  			*dst++ = le16_to_cpu(*src++);
82cae269cfa953 Konstantin Komarov 2021-08-13  1301  #else
82cae269cfa953 Konstantin Komarov 2021-08-13  1302  		memcpy(dst, src, PAGE_SIZE);
82cae269cfa953 Konstantin Komarov 2021-08-13  1303  #endif
82cae269cfa953 Konstantin Komarov 2021-08-13  1304  		ntfs_unmap_page(page);
82cae269cfa953 Konstantin Komarov 2021-08-13  1305  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1306  
0056b273757b30 Kari Argillander   2021-09-09  1307  	shared = ntfs_set_shared(sbi->upcase, 0x10000 * sizeof(short));
0056b273757b30 Kari Argillander   2021-09-09  1308  	if (shared && sbi->upcase != shared) {
0056b273757b30 Kari Argillander   2021-09-09  1309  		kvfree(sbi->upcase);
82cae269cfa953 Konstantin Komarov 2021-08-13  1310  		sbi->upcase = shared;
82cae269cfa953 Konstantin Komarov 2021-08-13  1311  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1312  
82cae269cfa953 Konstantin Komarov 2021-08-13  1313  	iput(inode);
82cae269cfa953 Konstantin Komarov 2021-08-13  1314  
82cae269cfa953 Konstantin Komarov 2021-08-13  1315  	if (is_ntfs3(sbi)) {
e8b8e97f91b80f Kari Argillander   2021-08-03  1316  		/* Load $Secure. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1317  		err = ntfs_security_init(sbi);
b268663f49c37f Konstantin Komarov 2023-02-15  1318  		if (err) {
b268663f49c37f Konstantin Komarov 2023-02-15  1319  			ntfs_err(sb, "Failed to initialize $Secure (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1320  			goto out;
b268663f49c37f Konstantin Komarov 2023-02-15  1321  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1322  
e8b8e97f91b80f Kari Argillander   2021-08-03  1323  		/* Load $Extend. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1324  		err = ntfs_extend_init(sbi);
b268663f49c37f Konstantin Komarov 2023-02-15  1325  		if (err) {
b268663f49c37f Konstantin Komarov 2023-02-15  1326  			ntfs_warn(sb, "Failed to initialize $Extend.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1327  			goto load_root;
b268663f49c37f Konstantin Komarov 2023-02-15  1328  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1329  
b268663f49c37f Konstantin Komarov 2023-02-15  1330  		/* Load $Extend/$Reparse. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1331  		err = ntfs_reparse_init(sbi);
b268663f49c37f Konstantin Komarov 2023-02-15  1332  		if (err) {
b268663f49c37f Konstantin Komarov 2023-02-15  1333  			ntfs_warn(sb, "Failed to initialize $Extend/$Reparse.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1334  			goto load_root;
b268663f49c37f Konstantin Komarov 2023-02-15  1335  		}
82cae269cfa953 Konstantin Komarov 2021-08-13  1336  
b268663f49c37f Konstantin Komarov 2023-02-15  1337  		/* Load $Extend/$ObjId. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1338  		err = ntfs_objid_init(sbi);
b268663f49c37f Konstantin Komarov 2023-02-15  1339  		if (err) {
b268663f49c37f Konstantin Komarov 2023-02-15  1340  			ntfs_warn(sb, "Failed to initialize $Extend/$ObjId.");
82cae269cfa953 Konstantin Komarov 2021-08-13  1341  			goto load_root;
82cae269cfa953 Konstantin Komarov 2021-08-13  1342  		}
b268663f49c37f Konstantin Komarov 2023-02-15  1343  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1344  
82cae269cfa953 Konstantin Komarov 2021-08-13  1345  load_root:
e8b8e97f91b80f Kari Argillander   2021-08-03  1346  	/* Load root. */
82cae269cfa953 Konstantin Komarov 2021-08-13  1347  	ref.low = cpu_to_le32(MFT_REC_ROOT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1348  	ref.seq = cpu_to_le16(MFT_REC_ROOT);
82cae269cfa953 Konstantin Komarov 2021-08-13  1349  	inode = ntfs_iget5(sb, &ref, &NAME_ROOT);
c1ca8ef0262b25 Edward Lo          2022-09-09  1350  	if (IS_ERR(inode) || !inode->i_op) {
b268663f49c37f Konstantin Komarov 2023-02-15 @1351  		err = PTR_ERR(inode);
b268663f49c37f Konstantin Komarov 2023-02-15  1352  		ntfs_err(sb, "Failed to load root (%d).", err);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1353  		goto out;
82cae269cfa953 Konstantin Komarov 2021-08-13  1354  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1355  
82cae269cfa953 Konstantin Komarov 2021-08-13  1356  	sb->s_root = d_make_root(inode);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1357  	if (!sb->s_root) {
9b75450d6c5801 Konstantin Komarov 2021-09-28  1358  		err = -ENOMEM;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1359  		goto put_inode_out;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1360  	}
82cae269cfa953 Konstantin Komarov 2021-08-13  1361  
82cae269cfa953 Konstantin Komarov 2021-08-13  1362  	return 0;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1363  
9b75450d6c5801 Konstantin Komarov 2021-09-28  1364  put_inode_out:
82cae269cfa953 Konstantin Komarov 2021-08-13  1365  	iput(inode);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1366  out:
9b75450d6c5801 Konstantin Komarov 2021-09-28  1367  	/*
9b75450d6c5801 Konstantin Komarov 2021-09-28  1368  	 * Free resources here.
9b75450d6c5801 Konstantin Komarov 2021-09-28  1369  	 * ntfs_fs_free will be called with fc->s_fs_info = NULL
9b75450d6c5801 Konstantin Komarov 2021-09-28  1370  	 */
51e76a232f8c03 Shigeru Yoshida    2022-08-23  1371  	put_mount_options(sbi->options);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1372  	put_ntfs(sbi);
9b75450d6c5801 Konstantin Komarov 2021-09-28  1373  	sb->s_fs_info = NULL;
9b75450d6c5801 Konstantin Komarov 2021-09-28  1374  
82cae269cfa953 Konstantin Komarov 2021-08-13  1375  	return err;
82cae269cfa953 Konstantin Komarov 2021-08-13  1376  }
82cae269cfa953 Konstantin Komarov 2021-08-13  1377  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

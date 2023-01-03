Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E67E625;
	Tue,  3 Jan 2023 08:03:58 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bs20so26529463wrb.3;
        Tue, 03 Jan 2023 00:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znFJdTv7I7iLn8Rr+3HWd6ymOSTUbKHdMLx0BmAIdlg=;
        b=mTRGraLErKX1dRbkQJlQ5jwofscpVRXx4eyNNN/S4NETkQEgvX1DX72uPL4VX+fUuo
         WqC9mfP9G4wvp4B+jB3dMi/GkOm+aCrUtCc5HltCXO4uRNAZIsCzKIOy5S3QH03Icyyn
         kUnka1P8pVDvsuwKhQszo4upTxkYXuIQgw0qFBj1sbDko2n3Fayk+mtnjeQczm5OAkTC
         g+XeZIQ+DyvghBDzWBZztjTrx325YRQSPVj2dFwVzgkneLeY0YPiFt9cGLNd3RUY6gSD
         CGF0CM5DhEq48tUsMnP83C8KqqHv0VXPjFEcyE3mSTznZj0Sq99tlAerOuqXLfHTOGvu
         XsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znFJdTv7I7iLn8Rr+3HWd6ymOSTUbKHdMLx0BmAIdlg=;
        b=oBwcLCxliQIasWP53GFhJBmNkpufVAlpm2BXoSNkb7hmev6KDe6BeTsb86WqcOyvcl
         HoZy6pdAjhtpBR54FNzQFHqGAGrj8OFi8sAKAMuaCPmEFTwR72xBGnsiFM5jYeyUkHVV
         g5vtVSHhQp0sNQJPnjBX5x86AD13X4Az33PjnvU8XO+3F9+nRn/295+XTD41Dbk+GRBL
         wgXhhf2e4fz22HpwQRf//byiwVC4nI+HzjrEoj4fZDtzQTY+2w5zCzCcyYgOp9ion1mg
         Dd0cn3PRHF6kNWDftuyJ6igAhl7y9tDLuM7s4QOMCp063mqfuV09R7WMSs5hfONDFgXn
         /YyQ==
X-Gm-Message-State: AFqh2krRIbXchj2z6J8VT+AmSpWC1ZyARUlNPNNKPVg/yDMmAMA6zORj
	xJBxHFjLmS4n4vEMDVlwcAYdhApDT4ZQuQ==
X-Google-Smtp-Source: AMrXdXvuHSIbf2j888rHb1GSR6wocxWp/1iaUcClL4ktO5C6yr9pxeLEW3wXu0xCAyVeAep0cJ4zRw==
X-Received: by 2002:a5d:58c5:0:b0:28f:c68f:f5ee with SMTP id o5-20020a5d58c5000000b0028fc68ff5eemr9981290wrf.28.1672733036041;
        Tue, 03 Jan 2023 00:03:56 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600001cc00b0027b35baf811sm24203913wrx.57.2023.01.03.00.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 00:03:55 -0800 (PST)
Date: Tue, 3 Jan 2023 11:03:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Huang Ying <ying.huang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [ammarfaizi2-block:akpm/mm/mm-unstable 139/146] mm/migrate.c:1254
 migrate_folio_unmap() warn: variable dereferenced before check 'dst' (see
 line 1128)
Message-ID: <202212300556.FgloYuxW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20230103080352.zY4Z16rn7hKyUvAVeMuN5pb_4AxUB4lAMVh6hWqJiF4@z>

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
head:   e1cea426ef35ef33737d45dfb0d863c7a93f5d1c
commit: 2db5be48ba87378da366e4c90a9a6193fea1a8dc [139/146] migrate_pages: share more code between _unmap and _move
config: i386-randconfig-m021-20221226
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
mm/migrate.c:1254 migrate_folio_unmap() warn: variable dereferenced before check 'dst' (see line 1128)

vim +/dst +1254 mm/migrate.c

2db5be48ba87378 Huang Ying              2022-12-27  1094  static int migrate_folio_unmap(new_page_t get_new_page, free_page_t put_new_page,
2db5be48ba87378 Huang Ying              2022-12-27  1095  			       unsigned long private, struct folio *src,
2db5be48ba87378 Huang Ying              2022-12-27  1096  			       struct folio **dstp, int force, bool force_lock,
2db5be48ba87378 Huang Ying              2022-12-27  1097  			       enum migrate_mode mode, enum migrate_reason reason,
2db5be48ba87378 Huang Ying              2022-12-27  1098  			       struct list_head *ret)
e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1099  {
2db5be48ba87378 Huang Ying              2022-12-27  1100  	struct folio *dst;
2db5be48ba87378 Huang Ying              2022-12-27  1101  	int rc = MIGRATEPAGE_UNMAP;
2db5be48ba87378 Huang Ying              2022-12-27  1102  	struct page *newpage = NULL;
2b44763e2f0ca52 Huang Ying              2022-12-27  1103  	int page_was_mapped = 0;
3f6c82728f4e31a Mel Gorman              2010-05-24  1104  	struct anon_vma *anon_vma = NULL;
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1105) 	bool is_lru = !__PageMovable(&src->page);
2db5be48ba87378 Huang Ying              2022-12-27  1106  	bool locked = false;
2db5be48ba87378 Huang Ying              2022-12-27  1107  	bool dst_locked = false;
2db5be48ba87378 Huang Ying              2022-12-27  1108  
2db5be48ba87378 Huang Ying              2022-12-27  1109  	if (!thp_migration_supported() && folio_test_transhuge(src))
2db5be48ba87378 Huang Ying              2022-12-27  1110  		return -ENOSYS;
2db5be48ba87378 Huang Ying              2022-12-27  1111  
2db5be48ba87378 Huang Ying              2022-12-27  1112  	if (folio_ref_count(src) == 1) {
2db5be48ba87378 Huang Ying              2022-12-27  1113  		/* Folio was freed from under us. So we are done. */
2db5be48ba87378 Huang Ying              2022-12-27  1114  		folio_clear_active(src);
2db5be48ba87378 Huang Ying              2022-12-27  1115  		folio_clear_unevictable(src);
2db5be48ba87378 Huang Ying              2022-12-27  1116  		/* free_pages_prepare() will clear PG_isolated. */
2db5be48ba87378 Huang Ying              2022-12-27  1117  		list_del(&src->lru);
2db5be48ba87378 Huang Ying              2022-12-27  1118  		migrate_folio_done(src, reason);
2db5be48ba87378 Huang Ying              2022-12-27  1119  		return MIGRATEPAGE_SUCCESS;
2db5be48ba87378 Huang Ying              2022-12-27  1120  	}
2db5be48ba87378 Huang Ying              2022-12-27  1121  
2db5be48ba87378 Huang Ying              2022-12-27  1122  	newpage = get_new_page(&src->page, private);
2db5be48ba87378 Huang Ying              2022-12-27  1123  	if (!newpage)
2db5be48ba87378 Huang Ying              2022-12-27  1124  		return -ENOMEM;
2db5be48ba87378 Huang Ying              2022-12-27  1125  	dst = page_folio(newpage);
2db5be48ba87378 Huang Ying              2022-12-27  1126  	*dstp = dst;
95a402c3847cc16 Christoph Lameter       2006-06-23  1127  
2db5be48ba87378 Huang Ying              2022-12-27 @1128  	dst->private = NULL;
                                                                ^^^^^^^^^^^^
"dst" is dereferenced.

2db5be48ba87378 Huang Ying              2022-12-27  1129  
2db5be48ba87378 Huang Ying              2022-12-27  1130  	rc = -EAGAIN;
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1131) 	if (!folio_trylock(src)) {
a6bc32b899223a8 Mel Gorman              2012-01-12  1132  		if (!force || mode == MIGRATE_ASYNC)
0dabec93de633a8 Minchan Kim             2011-10-31  1133  			goto out;
3e7d344970673c5 Mel Gorman              2011-01-13  1134  
3e7d344970673c5 Mel Gorman              2011-01-13  1135  		/*
3e7d344970673c5 Mel Gorman              2011-01-13  1136  		 * It's not safe for direct compaction to call lock_page.
3e7d344970673c5 Mel Gorman              2011-01-13  1137  		 * For example, during page readahead pages are added locked
3e7d344970673c5 Mel Gorman              2011-01-13  1138  		 * to the LRU. Later, when the IO completes the pages are
3e7d344970673c5 Mel Gorman              2011-01-13  1139  		 * marked uptodate and unlocked. However, the queueing
3e7d344970673c5 Mel Gorman              2011-01-13  1140  		 * could be merging multiple pages for one bio (e.g.
d4388340ae0bc83 Matthew Wilcox (Oracle  2020-06-01  1141) 		 * mpage_readahead). If an allocation happens for the
3e7d344970673c5 Mel Gorman              2011-01-13  1142  		 * second or third page, the process can end up locking
3e7d344970673c5 Mel Gorman              2011-01-13  1143  		 * the same page twice and deadlocking. Rather than
3e7d344970673c5 Mel Gorman              2011-01-13  1144  		 * trying to be clever about what pages can be locked,
3e7d344970673c5 Mel Gorman              2011-01-13  1145  		 * avoid the use of lock_page for direct compaction
3e7d344970673c5 Mel Gorman              2011-01-13  1146  		 * altogether.
3e7d344970673c5 Mel Gorman              2011-01-13  1147  		 */
3e7d344970673c5 Mel Gorman              2011-01-13  1148  		if (current->flags & PF_MEMALLOC)
0dabec93de633a8 Minchan Kim             2011-10-31  1149  			goto out;
3e7d344970673c5 Mel Gorman              2011-01-13  1150  
1548ab2c86db6ff Huang Ying              2022-12-27  1151  		if (!force_lock) {
1548ab2c86db6ff Huang Ying              2022-12-27  1152  			rc = -EDEADLOCK;
1548ab2c86db6ff Huang Ying              2022-12-27  1153  			goto out;
1548ab2c86db6ff Huang Ying              2022-12-27  1154  		}
1548ab2c86db6ff Huang Ying              2022-12-27  1155  
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1156) 		folio_lock(src);
e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1157  	}
2db5be48ba87378 Huang Ying              2022-12-27  1158  	locked = true;
e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1159  
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1160) 	if (folio_test_writeback(src)) {
11bc82d67d11507 Andrea Arcangeli        2011-03-22  1161  		/*
fed5b64a9532669 Jianguo Wu              2013-04-29  1162  		 * Only in the case of a full synchronous migration is it
a6bc32b899223a8 Mel Gorman              2012-01-12  1163  		 * necessary to wait for PageWriteback. In the async case,
a6bc32b899223a8 Mel Gorman              2012-01-12  1164  		 * the retry loop is too short and in the sync-light case,
a6bc32b899223a8 Mel Gorman              2012-01-12  1165  		 * the overhead of stalling is too much
11bc82d67d11507 Andrea Arcangeli        2011-03-22  1166  		 */
2916ecc0f9d435d Jérôme Glisse           2017-09-08  1167  		switch (mode) {
2916ecc0f9d435d Jérôme Glisse           2017-09-08  1168  		case MIGRATE_SYNC:
2916ecc0f9d435d Jérôme Glisse           2017-09-08  1169  		case MIGRATE_SYNC_NO_COPY:
2916ecc0f9d435d Jérôme Glisse           2017-09-08  1170  			break;
2916ecc0f9d435d Jérôme Glisse           2017-09-08  1171  		default:
11bc82d67d11507 Andrea Arcangeli        2011-03-22  1172  			rc = -EBUSY;
2db5be48ba87378 Huang Ying              2022-12-27  1173  			goto out;
11bc82d67d11507 Andrea Arcangeli        2011-03-22  1174  		}
11bc82d67d11507 Andrea Arcangeli        2011-03-22  1175  		if (!force)
2db5be48ba87378 Huang Ying              2022-12-27  1176  			goto out;
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1177) 		folio_wait_writeback(src);
e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1178  	}
03f15c86c8d1b9d Hugh Dickins            2015-11-05  1179  
e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1180  	/*
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1181) 	 * By try_to_migrate(), src->mapcount goes down to 0 here. In this case,
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1182) 	 * we cannot notice that anon_vma is freed while we migrate a page.
1ce82b69e96c838 Hugh Dickins            2011-01-13  1183  	 * This get_anon_vma() delays freeing anon_vma pointer until the end
dc386d4d1e98bb3 KAMEZAWA Hiroyuki       2007-07-26  1184  	 * of migration. File cache pages are no problem because of page_lock()
989f89c57e6361e KAMEZAWA Hiroyuki       2007-08-30  1185  	 * File Caches may use write_page() or lock_page() in migration, then,
989f89c57e6361e KAMEZAWA Hiroyuki       2007-08-30  1186  	 * just care Anon page here.
03f15c86c8d1b9d Hugh Dickins            2015-11-05  1187  	 *
29eea9b5a9c9ecf Matthew Wilcox (Oracle  2022-09-02  1188) 	 * Only folio_get_anon_vma() understands the subtleties of
1ce82b69e96c838 Hugh Dickins            2011-01-13  1189  	 * getting a hold on an anon_vma from outside one of its mms.
03f15c86c8d1b9d Hugh Dickins            2015-11-05  1190  	 * But if we cannot get anon_vma, then we won't need it anyway,
03f15c86c8d1b9d Hugh Dickins            2015-11-05  1191  	 * because that implies that the anon page is no longer mapped
03f15c86c8d1b9d Hugh Dickins            2015-11-05  1192  	 * (and cannot be remapped so long as we hold the page lock).
1ce82b69e96c838 Hugh Dickins            2011-01-13  1193  	 */
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1194) 	if (folio_test_anon(src) && !folio_test_ksm(src))
29eea9b5a9c9ecf Matthew Wilcox (Oracle  2022-09-02  1195) 		anon_vma = folio_get_anon_vma(src);
62e1c55300f306e Shaohua Li              2008-02-04  1196  
7db7671f835ccad Hugh Dickins            2015-11-05  1197  	/*
7db7671f835ccad Hugh Dickins            2015-11-05  1198  	 * Block others from accessing the new page when we get around to
7db7671f835ccad Hugh Dickins            2015-11-05  1199  	 * establishing additional references. We are usually the only one
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1200) 	 * holding a reference to dst at this point. We used to have a BUG
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1201) 	 * here if folio_trylock(dst) fails, but would like to allow for
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1202) 	 * cases where there might be a race with the previous use of dst.
7db7671f835ccad Hugh Dickins            2015-11-05  1203  	 * This is much like races on refcount of oldpage: just don't BUG().
7db7671f835ccad Hugh Dickins            2015-11-05  1204  	 */
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1205) 	if (unlikely(!folio_trylock(dst)))
2db5be48ba87378 Huang Ying              2022-12-27  1206  		goto out;
2db5be48ba87378 Huang Ying              2022-12-27  1207  	dst_locked = true;
7db7671f835ccad Hugh Dickins            2015-11-05  1208  
bda807d4445414e Minchan Kim             2016-07-26  1209  	if (unlikely(!is_lru)) {
2b44763e2f0ca52 Huang Ying              2022-12-27  1210  		__migrate_folio_record(dst, page_was_mapped, anon_vma);
2b44763e2f0ca52 Huang Ying              2022-12-27  1211  		return MIGRATEPAGE_UNMAP;
bda807d4445414e Minchan Kim             2016-07-26  1212  	}
bda807d4445414e Minchan Kim             2016-07-26  1213  
62e1c55300f306e Shaohua Li              2008-02-04  1214  	/*
62e1c55300f306e Shaohua Li              2008-02-04  1215  	 * Corner case handling:
62e1c55300f306e Shaohua Li              2008-02-04  1216  	 * 1. When a new swap-cache page is read into, it is added to the LRU
62e1c55300f306e Shaohua Li              2008-02-04  1217  	 * and treated as swapcache but it has no rmap yet.
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1218) 	 * Calling try_to_unmap() against a src->mapping==NULL page will
62e1c55300f306e Shaohua Li              2008-02-04  1219  	 * trigger a BUG.  So handle it here.
d12b8951ad17cd8 Yang Shi                2020-12-14  1220  	 * 2. An orphaned page (see truncate_cleanup_page) might have
62e1c55300f306e Shaohua Li              2008-02-04  1221  	 * fs-private metadata. The page can be picked up due to memory
62e1c55300f306e Shaohua Li              2008-02-04  1222  	 * offlining.  Everywhere else except page reclaim, the page is
62e1c55300f306e Shaohua Li              2008-02-04  1223  	 * invisible to the vm, so the page can not be migrated.  So try to
62e1c55300f306e Shaohua Li              2008-02-04  1224  	 * free the metadata, so the page can be freed.
62e1c55300f306e Shaohua Li              2008-02-04  1225  	 */
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1226) 	if (!src->mapping) {
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1227) 		if (folio_test_private(src)) {
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1228) 			try_to_free_buffers(src);
2db5be48ba87378 Huang Ying              2022-12-27  1229  			goto out;
abfc3488118d48a Shaohua Li              2009-09-21  1230  		}
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1231) 	} else if (folio_mapped(src)) {
7db7671f835ccad Hugh Dickins            2015-11-05  1232  		/* Establish migration ptes */
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1233) 		VM_BUG_ON_FOLIO(folio_test_anon(src) &&
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1234) 			       !folio_test_ksm(src) && !anon_vma, src);
682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1235) 		try_to_migrate(src, 0);
2b44763e2f0ca52 Huang Ying              2022-12-27  1236  		page_was_mapped = 1;
2ebba6b7e1d9872 Hugh Dickins            2014-12-12  1237  	}
dc386d4d1e98bb3 KAMEZAWA Hiroyuki       2007-07-26  1238  
2b44763e2f0ca52 Huang Ying              2022-12-27  1239  	if (!folio_mapped(src)) {
2b44763e2f0ca52 Huang Ying              2022-12-27  1240  		__migrate_folio_record(dst, page_was_mapped, anon_vma);
2b44763e2f0ca52 Huang Ying              2022-12-27  1241  		return MIGRATEPAGE_UNMAP;
2b44763e2f0ca52 Huang Ying              2022-12-27  1242  	}
2b44763e2f0ca52 Huang Ying              2022-12-27  1243  
2b44763e2f0ca52 Huang Ying              2022-12-27  1244  out:
06968ece4cd7f1e Huang Ying              2022-12-27  1245  	/*
06968ece4cd7f1e Huang Ying              2022-12-27  1246  	 * A page that has not been migrated will have kept its
06968ece4cd7f1e Huang Ying              2022-12-27  1247  	 * references and be restored.
06968ece4cd7f1e Huang Ying              2022-12-27  1248  	 */
06968ece4cd7f1e Huang Ying              2022-12-27  1249  	/* restore the folio to right list. */
2db5be48ba87378 Huang Ying              2022-12-27  1250  	if (rc == -EAGAIN || rc == -EDEADLOCK)
2db5be48ba87378 Huang Ying              2022-12-27  1251  		ret = NULL;
06968ece4cd7f1e Huang Ying              2022-12-27  1252  
2db5be48ba87378 Huang Ying              2022-12-27  1253  	migrate_folio_undo_src(src, page_was_mapped, anon_vma, locked, ret);
2db5be48ba87378 Huang Ying              2022-12-27 @1254  	if (dst)
                                                                    ^^^
Presumably this check can be deleted.  (pointless).

2db5be48ba87378 Huang Ying              2022-12-27  1255  		migrate_folio_undo_dst(dst, dst_locked, put_new_page, private);
06968ece4cd7f1e Huang Ying              2022-12-27  1256  
06968ece4cd7f1e Huang Ying              2022-12-27  1257  	return rc;
06968ece4cd7f1e Huang Ying              2022-12-27  1258  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



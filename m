Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BC5EC0;
	Mon, 21 Nov 2022 10:47:08 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5so8163454wmo.1;
        Mon, 21 Nov 2022 02:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsGRg8d9uN/3NzXR36oOukdXSWUiGi4UapisH6qXjmI=;
        b=VlmpCZSmz6pfcNI/v2LFpRCxJQNQNInZQMhm9lA4VyeZi35byDXlE1Hnp7GYsjtMZr
         /zeVTLg+b/NRcDir6BndkjMM7FCjFFM5sx/JXmWD0hC0P+z/isrDVuwkC9/Z6DQbanPz
         ivfryjnGaGjRe3zoBvgeKoX96CXNYossgUjMCewrZ1gU6wRIKW4V1lHqwANqxCDHZvg9
         paGXZyGQuogYGbwu1ZuLJzHj24gFb/xD2Tdgw4gDyvQAhONwbIOG8xgUDbiEHw+9Ufat
         4ooMnECuRfhS7ZxJzvoMyIYnPPuGMAuBZniRet+D/uirHohXWqKcGE6hYTVbj0iAGcN6
         4R0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsGRg8d9uN/3NzXR36oOukdXSWUiGi4UapisH6qXjmI=;
        b=FVXP2ognGMeqKk7lnSWxjeF92ikY4EzQeVSzxskfWLIQSkbeaLdgt3wkGRp4dJ2o6D
         mMpyKjtjTbq5fFCa0v/GbTUhERn/paDXHw8KvR78ye9lOJwV+03CDqMVvaLxXfhCvEw8
         mW37lFWloblyg2nR+jc8x3jxUelxkB9okJuuxlRGjcP0/ThU9R0nUIq+p394mDZ/TGY8
         ydUb+wl+gKHiNZDSPXsTReIQD/2pcyWku8yQ2cWkLvLjO+LVDykVqVBqzlTrUSnqYl0m
         qvBhib6C/xzqFwmxdV2r7fkO17oZvAl6cp2gakXlqn11hyeTZTxCFNIvmaPBFasenM5H
         Q1lQ==
X-Gm-Message-State: ANoB5pmW4uNajvL+5DPVOTzk9TJltcq5yI7rDr6/JzU+btAx3abaQ4Pq
	QVVJ49d5bNIVbaMkqi/FXVsEER+1MFlYxQ==
X-Google-Smtp-Source: AA0mqf41a5tc2MSdYiVViTsBd45HBSiTE7R7RPOP5YEG9TKAWhNNWpCyyRR7W0cbfieTyMYkxKuLBQ==
X-Received: by 2002:a05:600c:4e13:b0:3cf:86b8:71f7 with SMTP id b19-20020a05600c4e1300b003cf86b871f7mr16258275wmq.76.1669027626051;
        Mon, 21 Nov 2022 02:47:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb43000000b00225307f43fbsm10818856wrs.44.2022.11.21.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:47:05 -0800 (PST)
Date: Mon, 21 Nov 2022 13:47:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Hugh Dickins <hughd@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [ammarfaizi2-block:akpm/mm/mm-unstable 160/254] mm/rmap.c:1325
 page_add_anon_rmap() error: uninitialized symbol 'first'.
Message-ID: <202211200135.BVP3jPRS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221121104702.KJ02KwtfDlRznJPGqEwWNtrIHZCmk2JrVAvO5rhmKtM@z>

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
head:   a8da2493d983a10242e6c9d71c6e828aafa5baf8
commit: d68dde0dc6f8b8d09357a32473db8881173b10b0 [160/254] mm,thp,rmap: subpages_mapcount of PTE-mapped subpages
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
mm/rmap.c:1325 page_add_anon_rmap() error: uninitialized symbol 'first'.

vim +/first +1325 mm/rmap.c

9617d95e6e9ffd Nicholas Piggin    2006-01-06  1278  void page_add_anon_rmap(struct page *page,
14f9135d547060 David Hildenbrand  2022-05-09  1279  	struct vm_area_struct *vma, unsigned long address, rmap_t flags)
9617d95e6e9ffd Nicholas Piggin    2006-01-06  1280  {
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1281  	struct compound_mapcounts mapcounts;
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1282  	int nr = 0, nr_pmdmapped = 0;
d281ee61451835 Kirill A. Shutemov 2016-01-15  1283  	bool compound = flags & RMAP_COMPOUND;
53f9263baba69f Kirill A. Shutemov 2016-01-15  1284  	bool first;
                                                        ^^^^^^^^^^
53f9263baba69f Kirill A. Shutemov 2016-01-15  1285  
be5d0a74c62d8d Johannes Weiner    2020-06-03  1286  	if (unlikely(PageKsm(page)))
be5d0a74c62d8d Johannes Weiner    2020-06-03  1287  		lock_page_memcg(page);
be5d0a74c62d8d Johannes Weiner    2020-06-03  1288  
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1289  	if (likely(!compound /* page is mapped by PTE */)) {
84e6cb5a201a85 Hugh Dickins       2022-11-09  1290  		first = atomic_inc_and_test(&page->_mapcount);
84e6cb5a201a85 Hugh Dickins       2022-11-09  1291  		nr = first;
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1292  		if (first && PageCompound(page)) {
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1293  			struct page *head = compound_head(page);
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1294  
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1295  			lock_compound_mapcounts(head, &mapcounts);
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1296  			mapcounts.subpages_mapcount++;
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1297  			nr = !mapcounts.compound_mapcount;
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1298  			unlock_compound_mapcounts(head, &mapcounts);
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1299  		}
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1300  	} else if (PageTransHuge(page)) {
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1301  		/* That test is redundant: it's for safety or to optimize out */
84e6cb5a201a85 Hugh Dickins       2022-11-09  1302  
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1303  		lock_compound_mapcounts(page, &mapcounts);
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1304  		first = !mapcounts.compound_mapcount;
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1305  		mapcounts.compound_mapcount++;
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1306  		if (first) {
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1307  			nr_pmdmapped = thp_nr_pages(page);
d68dde0dc6f8b8 Hugh Dickins       2022-11-18  1308  			nr = nr_pmdmapped - mapcounts.subpages_mapcount;
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1309  		}
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1310  		unlock_compound_mapcounts(page, &mapcounts);
53f9263baba69f Kirill A. Shutemov 2016-01-15  1311  	}

No else path.

bde3d57e6cec9c Hugh Dickins       2022-11-02  1312  
6c287605fd5646 David Hildenbrand  2022-05-09  1313  	VM_BUG_ON_PAGE(!first && (flags & RMAP_EXCLUSIVE), page);
                                                                        ^^^^^
Uninitialized.


6c287605fd5646 David Hildenbrand  2022-05-09  1314  	VM_BUG_ON_PAGE(!first && PageAnonExclusive(page), page);
53f9263baba69f Kirill A. Shutemov 2016-01-15  1315  
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1316  	if (nr_pmdmapped)
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1317  		__mod_lruvec_page_state(page, NR_ANON_THPS, nr_pmdmapped);
5b3276bc4a2e01 Hugh Dickins       2022-11-02  1318  	if (nr)
be5d0a74c62d8d Johannes Weiner    2020-06-03  1319  		__mod_lruvec_page_state(page, NR_ANON_MAPPED, nr);
5ad6468801d28c Hugh Dickins       2009-12-14  1320  
cea86fe246b694 Hugh Dickins       2022-02-14  1321  	if (unlikely(PageKsm(page)))
be5d0a74c62d8d Johannes Weiner    2020-06-03  1322  		unlock_page_memcg(page);
53f9263baba69f Kirill A. Shutemov 2016-01-15  1323  
5dbe0af47f8a8f Hugh Dickins       2011-05-28  1324  	/* address might be in next vma when migration races vma_adjust */
cea86fe246b694 Hugh Dickins       2022-02-14 @1325  	else if (first)
d281ee61451835 Kirill A. Shutemov 2016-01-15  1326  		__page_set_anon_rmap(page, vma, address,
14f9135d547060 David Hildenbrand  2022-05-09  1327  				     !!(flags & RMAP_EXCLUSIVE));
69029cd550284e KAMEZAWA Hiroyuki  2008-07-25  1328  	else
c97a9e10eaee32 Nicholas Piggin    2007-05-16  1329  		__page_check_anon_rmap(page, vma, address);
cea86fe246b694 Hugh Dickins       2022-02-14  1330  
cea86fe246b694 Hugh Dickins       2022-02-14  1331  	mlock_vma_page(page, vma, compound);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1332  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


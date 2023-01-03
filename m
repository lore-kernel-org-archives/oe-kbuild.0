Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608AD20E4;
	Tue,  3 Jan 2023 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672734036; x=1704270036;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version:content-transfer-encoding;
  bh=Ew//jkNNm7e9SkV7fi9J6WW8NLfuz0c4mTGxZV5JvD8=;
  b=W47PrqB8zTQNM68bbZDjcWfUMbviwEElVTERcILhKskFTyH/1R9CcQTo
   Xz6haoOeF8LLIiDTa162asVRky4yZ+jMolYfxWnrZcU8nMSBCVXfxRbNO
   yAR5oJl/JC33PG6IPEiDI2dSUYABMFCFLi28XnkPGIGXizW/9GmN/FAh4
   /BeFzSLx/Q2v4J4U5h4agfqGJxRBJv+Y8i11Gw8q5zld0FI1vEq4y2YEn
   JLgs8ZCcsg1xVmphJUADEeeIciDvOnVgfd8npMckPDMVkeMftnD4W+7pq
   9eM86J57F/s5Xv0MZihbWNksXe8JXE2ruuT5v6QOSsukWltLklqr3QfTu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="322843292"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="322843292"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 00:20:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="797104677"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; 
   d="scan'208";a="797104677"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2023 00:20:31 -0800
From: "Huang, Ying" <ying.huang@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev,  lkp@intel.com,
  oe-kbuild-all@lists.linux.dev,  Ammar Faizi <ammarfaizi2@gnuweeb.org>,
  GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 139/146]
 mm/migrate.c:1254 migrate_folio_unmap() warn: variable dereferenced before
 check 'dst' (see line 1128)
References: <202212300556.FgloYuxW-lkp@intel.com>
Date: Tue, 03 Jan 2023 16:19:38 +0800
In-Reply-To: <202212300556.FgloYuxW-lkp@intel.com> (Dan Carpenter's message of
	"Tue, 3 Jan 2023 11:03:52 +0300")
Message-ID: <87tu18owrp.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, Dan,

Thank you very much for reporting this.

Dan Carpenter <error27@gmail.com> writes:

> tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> head:   e1cea426ef35ef33737d45dfb0d863c7a93f5d1c
> commit: 2db5be48ba87378da366e4c90a9a6193fea1a8dc [139/146] migrate_pages:=
 share more code between _unmap and _move
> config: i386-randconfig-m021-20221226
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
>
> smatch warnings:
> mm/migrate.c:1254 migrate_folio_unmap() warn: variable dereferenced befor=
e check 'dst' (see line 1128)
>
> vim +/dst +1254 mm/migrate.c
>
> 2db5be48ba87378 Huang Ying              2022-12-27  1094  static int migr=
ate_folio_unmap(new_page_t get_new_page, free_page_t put_new_page,
> 2db5be48ba87378 Huang Ying              2022-12-27  1095  			       unsig=
ned long private, struct folio *src,
> 2db5be48ba87378 Huang Ying              2022-12-27  1096  			       struc=
t folio **dstp, int force, bool force_lock,
> 2db5be48ba87378 Huang Ying              2022-12-27  1097  			       enum =
migrate_mode mode, enum migrate_reason reason,
> 2db5be48ba87378 Huang Ying              2022-12-27  1098  			       struc=
t list_head *ret)
> e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1099  {
> 2db5be48ba87378 Huang Ying              2022-12-27  1100  	struct folio *=
dst;
> 2db5be48ba87378 Huang Ying              2022-12-27  1101  	int rc =3D MIG=
RATEPAGE_UNMAP;
> 2db5be48ba87378 Huang Ying              2022-12-27  1102  	struct page *n=
ewpage =3D NULL;
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1103  	int page_was_m=
apped =3D 0;
> 3f6c82728f4e31a Mel Gorman              2010-05-24  1104  	struct anon_vm=
a *anon_vma =3D NULL;
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1105) 	bool is_lru =
=3D !__PageMovable(&src->page);
> 2db5be48ba87378 Huang Ying              2022-12-27  1106  	bool locked =
=3D false;
> 2db5be48ba87378 Huang Ying              2022-12-27  1107  	bool dst_locke=
d =3D false;
> 2db5be48ba87378 Huang Ying              2022-12-27  1108=20=20
> 2db5be48ba87378 Huang Ying              2022-12-27  1109  	if (!thp_migra=
tion_supported() && folio_test_transhuge(src))
> 2db5be48ba87378 Huang Ying              2022-12-27  1110  		return -ENOSY=
S;
> 2db5be48ba87378 Huang Ying              2022-12-27  1111=20=20
> 2db5be48ba87378 Huang Ying              2022-12-27  1112  	if (folio_ref_=
count(src) =3D=3D 1) {
> 2db5be48ba87378 Huang Ying              2022-12-27  1113  		/* Folio was =
freed from under us. So we are done. */
> 2db5be48ba87378 Huang Ying              2022-12-27  1114  		folio_clear_a=
ctive(src);
> 2db5be48ba87378 Huang Ying              2022-12-27  1115  		folio_clear_u=
nevictable(src);
> 2db5be48ba87378 Huang Ying              2022-12-27  1116  		/* free_pages=
_prepare() will clear PG_isolated. */
> 2db5be48ba87378 Huang Ying              2022-12-27  1117  		list_del(&src=
->lru);
> 2db5be48ba87378 Huang Ying              2022-12-27  1118  		migrate_folio=
_done(src, reason);
> 2db5be48ba87378 Huang Ying              2022-12-27  1119  		return MIGRAT=
EPAGE_SUCCESS;
> 2db5be48ba87378 Huang Ying              2022-12-27  1120  	}
> 2db5be48ba87378 Huang Ying              2022-12-27  1121=20=20
> 2db5be48ba87378 Huang Ying              2022-12-27  1122  	newpage =3D ge=
t_new_page(&src->page, private);
> 2db5be48ba87378 Huang Ying              2022-12-27  1123  	if (!newpage)
> 2db5be48ba87378 Huang Ying              2022-12-27  1124  		return -ENOME=
M;
> 2db5be48ba87378 Huang Ying              2022-12-27  1125  	dst =3D page_f=
olio(newpage);
> 2db5be48ba87378 Huang Ying              2022-12-27  1126  	*dstp =3D dst;
> 95a402c3847cc16 Christoph Lameter       2006-06-23  1127=20=20
> 2db5be48ba87378 Huang Ying              2022-12-27 @1128  	dst->private =
=3D NULL;
>                                                                 ^^^^^^^^^=
^^^
> "dst" is dereferenced.

IIUC, dst can be dereferenced safely here.  Because we have checked
"newpage" already, and page_folio() will not return NULL for non-NULL
newpage.  In the future, we will change the code to be,

        dst =3D get_new_folio(src, private);

Then the code will be easier to be understood.

> 2db5be48ba87378 Huang Ying              2022-12-27  1129=20=20
> 2db5be48ba87378 Huang Ying              2022-12-27  1130  	rc =3D -EAGAIN;
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1131) 	if (!folio_try=
lock(src)) {
> a6bc32b899223a8 Mel Gorman              2012-01-12  1132  		if (!force ||=
 mode =3D=3D MIGRATE_ASYNC)
> 0dabec93de633a8 Minchan Kim             2011-10-31  1133  			goto out;
> 3e7d344970673c5 Mel Gorman              2011-01-13  1134=20=20
> 3e7d344970673c5 Mel Gorman              2011-01-13  1135  		/*
> 3e7d344970673c5 Mel Gorman              2011-01-13  1136  		 * It's not s=
afe for direct compaction to call lock_page.
> 3e7d344970673c5 Mel Gorman              2011-01-13  1137  		 * For exampl=
e, during page readahead pages are added locked
> 3e7d344970673c5 Mel Gorman              2011-01-13  1138  		 * to the LRU=
. Later, when the IO completes the pages are
> 3e7d344970673c5 Mel Gorman              2011-01-13  1139  		 * marked upt=
odate and unlocked. However, the queueing
> 3e7d344970673c5 Mel Gorman              2011-01-13  1140  		 * could be m=
erging multiple pages for one bio (e.g.
> d4388340ae0bc83 Matthew Wilcox (Oracle  2020-06-01  1141) 		 * mpage_read=
ahead). If an allocation happens for the
> 3e7d344970673c5 Mel Gorman              2011-01-13  1142  		 * second or =
third page, the process can end up locking
> 3e7d344970673c5 Mel Gorman              2011-01-13  1143  		 * the same p=
age twice and deadlocking. Rather than
> 3e7d344970673c5 Mel Gorman              2011-01-13  1144  		 * trying to =
be clever about what pages can be locked,
> 3e7d344970673c5 Mel Gorman              2011-01-13  1145  		 * avoid the =
use of lock_page for direct compaction
> 3e7d344970673c5 Mel Gorman              2011-01-13  1146  		 * altogether.
> 3e7d344970673c5 Mel Gorman              2011-01-13  1147  		 */
> 3e7d344970673c5 Mel Gorman              2011-01-13  1148  		if (current->=
flags & PF_MEMALLOC)
> 0dabec93de633a8 Minchan Kim             2011-10-31  1149  			goto out;
> 3e7d344970673c5 Mel Gorman              2011-01-13  1150=20=20
> 1548ab2c86db6ff Huang Ying              2022-12-27  1151  		if (!force_lo=
ck) {
> 1548ab2c86db6ff Huang Ying              2022-12-27  1152  			rc =3D -EDEA=
DLOCK;
> 1548ab2c86db6ff Huang Ying              2022-12-27  1153  			goto out;
> 1548ab2c86db6ff Huang Ying              2022-12-27  1154  		}
> 1548ab2c86db6ff Huang Ying              2022-12-27  1155=20=20
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1156) 		folio_lock(sr=
c);
> e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1157  	}
> 2db5be48ba87378 Huang Ying              2022-12-27  1158  	locked =3D tru=
e;
> e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1159=20=20
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1160) 	if (folio_test=
_writeback(src)) {
> 11bc82d67d11507 Andrea Arcangeli        2011-03-22  1161  		/*
> fed5b64a9532669 Jianguo Wu              2013-04-29  1162  		 * Only in th=
e case of a full synchronous migration is it
> a6bc32b899223a8 Mel Gorman              2012-01-12  1163  		 * necessary =
to wait for PageWriteback. In the async case,
> a6bc32b899223a8 Mel Gorman              2012-01-12  1164  		 * the retry =
loop is too short and in the sync-light case,
> a6bc32b899223a8 Mel Gorman              2012-01-12  1165  		 * the overhe=
ad of stalling is too much
> 11bc82d67d11507 Andrea Arcangeli        2011-03-22  1166  		 */
> 2916ecc0f9d435d J=C3=A9r=C3=B4me Glisse           2017-09-08  1167  		swi=
tch (mode) {
> 2916ecc0f9d435d J=C3=A9r=C3=B4me Glisse           2017-09-08  1168  		cas=
e MIGRATE_SYNC:
> 2916ecc0f9d435d J=C3=A9r=C3=B4me Glisse           2017-09-08  1169  		cas=
e MIGRATE_SYNC_NO_COPY:
> 2916ecc0f9d435d J=C3=A9r=C3=B4me Glisse           2017-09-08  1170  			br=
eak;
> 2916ecc0f9d435d J=C3=A9r=C3=B4me Glisse           2017-09-08  1171  		def=
ault:
> 11bc82d67d11507 Andrea Arcangeli        2011-03-22  1172  			rc =3D -EBUS=
Y;
> 2db5be48ba87378 Huang Ying              2022-12-27  1173  			goto out;
> 11bc82d67d11507 Andrea Arcangeli        2011-03-22  1174  		}
> 11bc82d67d11507 Andrea Arcangeli        2011-03-22  1175  		if (!force)
> 2db5be48ba87378 Huang Ying              2022-12-27  1176  			goto out;
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1177) 		folio_wait_wr=
iteback(src);
> e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1178  	}
> 03f15c86c8d1b9d Hugh Dickins            2015-11-05  1179=20=20
> e24f0b8f76cc3dd Christoph Lameter       2006-06-23  1180  	/*
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1181) 	 * By try_to_m=
igrate(), src->mapcount goes down to 0 here. In this case,
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1182) 	 * we cannot n=
otice that anon_vma is freed while we migrate a page.
> 1ce82b69e96c838 Hugh Dickins            2011-01-13  1183  	 * This get_an=
on_vma() delays freeing anon_vma pointer until the end
> dc386d4d1e98bb3 KAMEZAWA Hiroyuki       2007-07-26  1184  	 * of migratio=
n. File cache pages are no problem because of page_lock()
> 989f89c57e6361e KAMEZAWA Hiroyuki       2007-08-30  1185  	 * File Caches=
 may use write_page() or lock_page() in migration, then,
> 989f89c57e6361e KAMEZAWA Hiroyuki       2007-08-30  1186  	 * just care A=
non page here.
> 03f15c86c8d1b9d Hugh Dickins            2015-11-05  1187  	 *
> 29eea9b5a9c9ecf Matthew Wilcox (Oracle  2022-09-02  1188) 	 * Only folio_=
get_anon_vma() understands the subtleties of
> 1ce82b69e96c838 Hugh Dickins            2011-01-13  1189  	 * getting a h=
old on an anon_vma from outside one of its mms.
> 03f15c86c8d1b9d Hugh Dickins            2015-11-05  1190  	 * But if we c=
annot get anon_vma, then we won't need it anyway,
> 03f15c86c8d1b9d Hugh Dickins            2015-11-05  1191  	 * because tha=
t implies that the anon page is no longer mapped
> 03f15c86c8d1b9d Hugh Dickins            2015-11-05  1192  	 * (and cannot=
 be remapped so long as we hold the page lock).
> 1ce82b69e96c838 Hugh Dickins            2011-01-13  1193  	 */
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1194) 	if (folio_test=
_anon(src) && !folio_test_ksm(src))
> 29eea9b5a9c9ecf Matthew Wilcox (Oracle  2022-09-02  1195) 		anon_vma =3D =
folio_get_anon_vma(src);
> 62e1c55300f306e Shaohua Li              2008-02-04  1196=20=20
> 7db7671f835ccad Hugh Dickins            2015-11-05  1197  	/*
> 7db7671f835ccad Hugh Dickins            2015-11-05  1198  	 * Block other=
s from accessing the new page when we get around to
> 7db7671f835ccad Hugh Dickins            2015-11-05  1199  	 * establishin=
g additional references. We are usually the only one
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1200) 	 * holding a r=
eference to dst at this point. We used to have a BUG
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1201) 	 * here if fol=
io_trylock(dst) fails, but would like to allow for
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1202) 	 * cases where=
 there might be a race with the previous use of dst.
> 7db7671f835ccad Hugh Dickins            2015-11-05  1203  	 * This is muc=
h like races on refcount of oldpage: just don't BUG().
> 7db7671f835ccad Hugh Dickins            2015-11-05  1204  	 */
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1205) 	if (unlikely(!=
folio_trylock(dst)))
> 2db5be48ba87378 Huang Ying              2022-12-27  1206  		goto out;
> 2db5be48ba87378 Huang Ying              2022-12-27  1207  	dst_locked =3D=
 true;
> 7db7671f835ccad Hugh Dickins            2015-11-05  1208=20=20
> bda807d4445414e Minchan Kim             2016-07-26  1209  	if (unlikely(!=
is_lru)) {
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1210  		__migrate_fol=
io_record(dst, page_was_mapped, anon_vma);
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1211  		return MIGRAT=
EPAGE_UNMAP;
> bda807d4445414e Minchan Kim             2016-07-26  1212  	}
> bda807d4445414e Minchan Kim             2016-07-26  1213=20=20
> 62e1c55300f306e Shaohua Li              2008-02-04  1214  	/*
> 62e1c55300f306e Shaohua Li              2008-02-04  1215  	 * Corner case=
 handling:
> 62e1c55300f306e Shaohua Li              2008-02-04  1216  	 * 1. When a n=
ew swap-cache page is read into, it is added to the LRU
> 62e1c55300f306e Shaohua Li              2008-02-04  1217  	 * and treated=
 as swapcache but it has no rmap yet.
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1218) 	 * Calling try=
_to_unmap() against a src->mapping=3D=3DNULL page will
> 62e1c55300f306e Shaohua Li              2008-02-04  1219  	 * trigger a B=
UG.  So handle it here.
> d12b8951ad17cd8 Yang Shi                2020-12-14  1220  	 * 2. An orpha=
ned page (see truncate_cleanup_page) might have
> 62e1c55300f306e Shaohua Li              2008-02-04  1221  	 * fs-private =
metadata. The page can be picked up due to memory
> 62e1c55300f306e Shaohua Li              2008-02-04  1222  	 * offlining. =
 Everywhere else except page reclaim, the page is
> 62e1c55300f306e Shaohua Li              2008-02-04  1223  	 * invisible t=
o the vm, so the page can not be migrated.  So try to
> 62e1c55300f306e Shaohua Li              2008-02-04  1224  	 * free the me=
tadata, so the page can be freed.
> 62e1c55300f306e Shaohua Li              2008-02-04  1225  	 */
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1226) 	if (!src->mapp=
ing) {
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1227) 		if (folio_tes=
t_private(src)) {
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1228) 			try_to_free_=
buffers(src);
> 2db5be48ba87378 Huang Ying              2022-12-27  1229  			goto out;
> abfc3488118d48a Shaohua Li              2009-09-21  1230  		}
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1231) 	} else if (fol=
io_mapped(src)) {
> 7db7671f835ccad Hugh Dickins            2015-11-05  1232  		/* Establish =
migration ptes */
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1233) 		VM_BUG_ON_FOL=
IO(folio_test_anon(src) &&
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1234) 			       !foli=
o_test_ksm(src) && !anon_vma, src);
> 682a71a1b6b363b Matthew Wilcox (Oracle  2022-09-02  1235) 		try_to_migrat=
e(src, 0);
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1236  		page_was_mapp=
ed =3D 1;
> 2ebba6b7e1d9872 Hugh Dickins            2014-12-12  1237  	}
> dc386d4d1e98bb3 KAMEZAWA Hiroyuki       2007-07-26  1238=20=20
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1239  	if (!folio_map=
ped(src)) {
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1240  		__migrate_fol=
io_record(dst, page_was_mapped, anon_vma);
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1241  		return MIGRAT=
EPAGE_UNMAP;
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1242  	}
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1243=20=20
> 2b44763e2f0ca52 Huang Ying              2022-12-27  1244  out:
> 06968ece4cd7f1e Huang Ying              2022-12-27  1245  	/*
> 06968ece4cd7f1e Huang Ying              2022-12-27  1246  	 * A page that=
 has not been migrated will have kept its
> 06968ece4cd7f1e Huang Ying              2022-12-27  1247  	 * references =
and be restored.
> 06968ece4cd7f1e Huang Ying              2022-12-27  1248  	 */
> 06968ece4cd7f1e Huang Ying              2022-12-27  1249  	/* restore the=
 folio to right list. */
> 2db5be48ba87378 Huang Ying              2022-12-27  1250  	if (rc =3D=3D =
-EAGAIN || rc =3D=3D -EDEADLOCK)
> 2db5be48ba87378 Huang Ying              2022-12-27  1251  		ret =3D NULL;
> 06968ece4cd7f1e Huang Ying              2022-12-27  1252=20=20
> 2db5be48ba87378 Huang Ying              2022-12-27  1253  	migrate_folio_=
undo_src(src, page_was_mapped, anon_vma, locked, ret);
> 2db5be48ba87378 Huang Ying              2022-12-27 @1254  	if (dst)
>                                                                     ^^^
> Presumably this check can be deleted.  (pointless).

Yes.  The check here is redundant.  Thanks!  I will change this in the next=
 version.

> 2db5be48ba87378 Huang Ying              2022-12-27  1255  		migrate_folio=
_undo_dst(dst, dst_locked, put_new_page, private);
> 06968ece4cd7f1e Huang Ying              2022-12-27  1256=20=20
> 06968ece4cd7f1e Huang Ying              2022-12-27  1257  	return rc;
> 06968ece4cd7f1e Huang Ying              2022-12-27  1258  }

Best Regards,
Huang, Ying

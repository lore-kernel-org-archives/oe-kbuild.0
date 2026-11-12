Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523995;
	b=gip6Y/HFfKqiCGQ3gcRArBkU7TQB5UvjmJ5hXOqxPEJKlGx4zNr19UecK3l2iMzV/tG6
	 wsHdM935XC55Y+KmJcxCpDh8cMJ8l2KoH5ayYcpE61HNgc+Iy582DEFJYCdZwAT0dpI+1
	 zaGv+MvjAo5MqchbABEgP2YoBwpxiNNIZPtjN9eQYd4MpDG6rd3iD2fkR7GXjBXwoqkhO
	 6dITp6aXPsPuPwqDcqwAz1iSgZqjXv0P4c51CnGiuaPi41wPOnhOXqymMhSirXNOr3/zU
	 GtAMj25KUwsgQvqIXVaN7f/q6TtVBHSP1aPx46uGdgFMhZyKdUjrWb5Rk7VP0blAgZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523995;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AcJXBO7fYi5fF/6tDtlFvhV5IVTAocyti3yJ5VTAq+I=;
	b=2pQRMC4zVwpWXhnPoQ7WW/8d/kPH6KQQIrAy6xSZKG27KQVlm/1y4WeLudWV92gHeDPv
	 lw+FQsFLhW2Gxt2FV1aci7kVtkG1/eOd+M9R5g1EhqsAXR4qbhgKGLwuYPh9+LuiH2/wM
	 W4y5Dpz4oTQ7mKmZcvwiP6FinRf5Ey1jmHUCyXVmLrYjSmVN7UUn9b8lClmKbTFo/+d+R
	 6pIOa50E6gLHXkeEljf9qzALeDcC9MuJ37HRFFlwa5o8Gq79o9lOduc2aBr5f9cpFXUag
	 sXtLk23mMiTVGKNqrq1HxUX0bAnOc7CodpBT7WAXojGIaGSe3MK6hFvUVOEknVwbx0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hWrmMUgy;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF24606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 22:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAF24606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hWrmMUgy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794523994; x=1826059994;
  h=date:from:to:cc:subject:message-id;
  bh=jxbH5gdr7K0I8vICib7j2wueRaKrX68fJCQR533WsEM=;
  b=hWrmMUgyJU/aL98hPEITCNiXX64cbahTgtrlvlff3dkokkb1jIlnQ3Dz
   +f6SNz+XKadSjV//sZH/Izqgi2O5o324XF3jxSnM09mqbRC+VbWAvlkC3
   zE6dHJhwIaOwyy5ENQ3AVBCm63I+mf/3LU5ErPS58k1d9FdcbWHueaLA0
   YKsIvYvaEAsj3YJPzancdg4wVOFNf8J0PlP+h1rL7PuMQY1T+D089Mqb1
   x17TBGuhpxo7w9gUrbLQUIH3zi7u4QeUtKcGrnLdISyuFD2HASnWAm2K/
   B2vRVPgcDN7Aoj+TDg0nisU7qq0JyG99MsO66iQegu+AAHy6UzOf8tGJk
   Q==;
X-CSE-ConnectionGUID: T1cCjto/S++YZPbf0Ofn/w==
X-CSE-MsgGUID: QJlPCF89TQi9/jjOdW7NXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3218967"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3218967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 14:53:14 -0800
X-CSE-ConnectionGUID: ZfqQTY5FSBq6hq4sixjNVA==
X-CSE-MsgGUID: NcskPlscQO6e+eGXDDBv3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9330808"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2026 14:53:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRdfJ-000000000z5-3U22;
	Thu, 12 Nov 2026 22:53:09 +0000
Date: Thu, 12 Nov 2026 23:52:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ceph-client:testing 3/4] fs/ceph/addr.c:1304
 writepages_finish() error: 'folio' dereferencing possible ERR_PTR()
Message-ID: <202611122322.gfcaK7tl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: ceph-devel@vger.kernel.org
TO: Xiubo Li <xiubo.li@clyso.com>
CC: Alex Markuze <amarkuze@redhat.com>

tree:   https://github.com/ceph/ceph-client.git testing
head:   6a9830a8f414d3830c584782568d0233be969d09
commit: 7530f81a50bb9749539257fbeccdf037e0ca5fca [3/4] ceph: don't read a folio in for a partial lazy I/O write
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611122322.gfcaK7tl-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611122322.gfcaK7tl-lkp@intel.com/

New smatch warnings:
fs/ceph/addr.c:1304 writepages_finish() error: 'folio' dereferencing possible ERR_PTR()

Old smatch warnings:
arch/powerpc/include/asm/cpu_has_feature.h:38 cpu_has_feature() warn: bitwise AND condition is false here
arch/powerpc/include/asm/cpu_has_feature.h:12 early_cpu_has_feature() warn: bitwise AND condition is false here

vim +/folio +1304 fs/ceph/addr.c

1d3576fd10f0d7 Sage Weil               2009-10-06  1234  
1d3576fd10f0d7 Sage Weil               2009-10-06  1235  /*
1d3576fd10f0d7 Sage Weil               2009-10-06  1236   * async writeback completion handler.
1d3576fd10f0d7 Sage Weil               2009-10-06  1237   *
1d3576fd10f0d7 Sage Weil               2009-10-06  1238   * If we get an error, set the mapping error bit, but not the individual
1d3576fd10f0d7 Sage Weil               2009-10-06  1239   * page error bits.
1d3576fd10f0d7 Sage Weil               2009-10-06  1240   */
85e084feb47349 Ilya Dryomov            2016-04-28  1241  static void writepages_finish(struct ceph_osd_request *req)
1d3576fd10f0d7 Sage Weil               2009-10-06  1242  {
1d3576fd10f0d7 Sage Weil               2009-10-06  1243  	struct inode *inode = req->r_inode;
1d3576fd10f0d7 Sage Weil               2009-10-06  1244  	struct ceph_inode_info *ci = ceph_inode(inode);
38d46409c4639a Xiubo Li                2023-06-12  1245  	struct ceph_client *cl = ceph_inode_to_client(inode);
87060c1089a94f Alex Elder              2013-04-03  1246  	struct ceph_osd_data *osd_data;
5b64640cf65be4 Yan, Zheng              2016-01-07  1247  	int num_pages, total_pages = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07  1248  	int i, j;
5b64640cf65be4 Yan, Zheng              2016-01-07  1249  	int rc = req->r_result;
1d3576fd10f0d7 Sage Weil               2009-10-06  1250  	struct ceph_snap_context *snapc = req->r_snapc;
1d3576fd10f0d7 Sage Weil               2009-10-06  1251  	struct address_space *mapping = inode->i_mapping;
5995d90d2d19f3 Xiubo Li                2023-06-12  1252  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
fd7449d937e7fb Viacheslav Dubeyko      2025-02-04  1253  	struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(inode->i_sb);
903f4fec78dd05 Xiubo Li                2021-05-13  1254  	unsigned int len = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07  1255  	bool remove_page;
4ab4c720c9bad1 Alex Markuze            2026-08-20  1256  	struct ceph_journal_info __ji;
5b64640cf65be4 Yan, Zheng              2016-01-07  1257  
4ab4c720c9bad1 Alex Markuze            2026-08-20  1258  	/* OSD callback: reuse existing ctx only. */
4ab4c720c9bad1 Alex Markuze            2026-08-20  1259  	ceph_blog_enter_gfp(fsc, &__ji, GFP_ATOMIC);
4ab4c720c9bad1 Alex Markuze            2026-08-20  1260  
4ab4c720c9bad1 Alex Markuze            2026-08-20  1261  	boutc(cl, "%llx.%llx rc %d\n", ceph_vinop(inode), rc);
26544c623e741a Jeff Layton             2017-04-04  1262  	if (rc < 0) {
5b64640cf65be4 Yan, Zheng              2016-01-07  1263  		mapping_set_error(mapping, rc);
26544c623e741a Jeff Layton             2017-04-04  1264  		ceph_set_error_write(ci);
0b98acd6188309 Ilya Dryomov            2020-09-14  1265  		if (rc == -EBLOCKLISTED)
0b98acd6188309 Ilya Dryomov            2020-09-14  1266  			fsc->blocklisted = true;
26544c623e741a Jeff Layton             2017-04-04  1267  	} else {
26544c623e741a Jeff Layton             2017-04-04  1268  		ceph_clear_error_write(ci);
26544c623e741a Jeff Layton             2017-04-04  1269  	}
1d3576fd10f0d7 Sage Weil               2009-10-06  1270  
79788c698b2904 Sage Weil               2010-02-02  1271  	/*
5b64640cf65be4 Yan, Zheng              2016-01-07  1272  	 * We lost the cache cap, need to truncate the page before
5b64640cf65be4 Yan, Zheng              2016-01-07  1273  	 * it is unlocked, otherwise we'd truncate it later in the
5b64640cf65be4 Yan, Zheng              2016-01-07  1274  	 * page truncation thread, possibly losing some data that
5b64640cf65be4 Yan, Zheng              2016-01-07  1275  	 * raced its way in
79788c698b2904 Sage Weil               2010-02-02  1276  	 */
5b64640cf65be4 Yan, Zheng              2016-01-07  1277  	remove_page = !(ceph_caps_issued(ci) &
5b64640cf65be4 Yan, Zheng              2016-01-07  1278  			(CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO));
1d3576fd10f0d7 Sage Weil               2009-10-06  1279  
1d3576fd10f0d7 Sage Weil               2009-10-06  1280  	/* clean all pages */
5b64640cf65be4 Yan, Zheng              2016-01-07  1281  	for (i = 0; i < req->r_num_ops; i++) {
642d51fb0775a4 Xiubo Li                2022-05-05  1282  		if (req->r_ops[i].op != CEPH_OSD_OP_WRITE) {
38d46409c4639a Xiubo Li                2023-06-12  1283  			pr_warn_client(cl,
38d46409c4639a Xiubo Li                2023-06-12  1284  				"%llx.%llx incorrect op %d req %p index %d tid %llu\n",
38d46409c4639a Xiubo Li                2023-06-12  1285  				ceph_vinop(inode), req->r_ops[i].op, req, i,
38d46409c4639a Xiubo Li                2023-06-12  1286  				req->r_tid);
5b64640cf65be4 Yan, Zheng              2016-01-07  1287  			break;
642d51fb0775a4 Xiubo Li                2022-05-05  1288  		}
5b64640cf65be4 Yan, Zheng              2016-01-07  1289  
5b64640cf65be4 Yan, Zheng              2016-01-07  1290  		osd_data = osd_req_op_extent_osd_data(req, i);
5b64640cf65be4 Yan, Zheng              2016-01-07  1291  		BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
903f4fec78dd05 Xiubo Li                2021-05-13  1292  		len += osd_data->length;
5b64640cf65be4 Yan, Zheng              2016-01-07  1293  		num_pages = calc_pages_for((u64)osd_data->alignment,
5b64640cf65be4 Yan, Zheng              2016-01-07  1294  					   (u64)osd_data->length);
5b64640cf65be4 Yan, Zheng              2016-01-07  1295  		total_pages += num_pages;
5b64640cf65be4 Yan, Zheng              2016-01-07  1296  		for (j = 0; j < num_pages; j++) {
0917a0848325cb Tal Zussman             2026-09-02  1297  			struct folio *folio = page_folio(osd_data->pages[j]);
0917a0848325cb Tal Zussman             2026-09-02  1298  
0917a0848325cb Tal Zussman             2026-09-02  1299  			if (fscrypt_is_bounce_folio(folio)) {
0917a0848325cb Tal Zussman             2026-09-02  1300  				folio = fscrypt_pagecache_folio(folio);
d55207717ded95 Jeff Layton             2022-08-25  1301  				fscrypt_free_bounce_page(osd_data->pages[j]);
0917a0848325cb Tal Zussman             2026-09-02  1302  				osd_data->pages[j] = &folio->page;
d55207717ded95 Jeff Layton             2022-08-25  1303  			}
7530f81a50bb97 Xiubo Li                2026-11-10 @1304  			WARN_ON(!folio_test_uptodate(folio) &&
7530f81a50bb97 Xiubo Li                2026-11-10  1305  				!__ceph_dirty_range(folio->private));
1d3576fd10f0d7 Sage Weil               2009-10-06  1306  
5b64640cf65be4 Yan, Zheng              2016-01-07  1307  			if (atomic_long_dec_return(&fsc->writeback_count) <
5b64640cf65be4 Yan, Zheng              2016-01-07  1308  			     CONGESTION_OFF_THRESH(
5b64640cf65be4 Yan, Zheng              2016-01-07  1309  					fsc->mount_options->congestion_kb))
503d4fa6ee28e8 NeilBrown               2022-03-22  1310  				fsc->write_congested = false;
2baba25019ec56 Yehuda Sadeh            2009-12-18  1311  
471aec0b2849a0 Xiubo Li                2026-10-30  1312  			ceph_put_snap_context(ceph_folio_detach_snapc(folio));
0917a0848325cb Tal Zussman             2026-09-02  1313  			folio_end_writeback(folio);
fd7449d937e7fb Viacheslav Dubeyko      2025-02-04  1314  
fd7449d937e7fb Viacheslav Dubeyko      2025-02-04  1315  			if (atomic64_dec_return(&mdsc->dirty_folios) <= 0) {
fd7449d937e7fb Viacheslav Dubeyko      2025-02-04  1316  				wake_up_all(&mdsc->flush_end_wq);
fd7449d937e7fb Viacheslav Dubeyko      2025-02-04  1317  				WARN_ON(atomic64_read(&mdsc->dirty_folios) < 0);
fd7449d937e7fb Viacheslav Dubeyko      2025-02-04  1318  			}
fd7449d937e7fb Viacheslav Dubeyko      2025-02-04  1319  
4ab4c720c9bad1 Alex Markuze            2026-08-20  1320  			boutc(cl, "unlocking %p\n", folio);
e63dc5c780ba32 Yehuda Sadeh            2010-02-19  1321  
5b64640cf65be4 Yan, Zheng              2016-01-07  1322  			if (remove_page)
af7628d6ec1969 Matthew Wilcox (Oracle  2023-11-17  1323) 				generic_error_remove_folio(inode->i_mapping,
0917a0848325cb Tal Zussman             2026-09-02  1324  							  folio);
e63dc5c780ba32 Yehuda Sadeh            2010-02-19  1325  
0917a0848325cb Tal Zussman             2026-09-02  1326  			folio_unlock(folio);
1d3576fd10f0d7 Sage Weil               2009-10-06  1327  		}
4ab4c720c9bad1 Alex Markuze            2026-08-20  1328  		boutc(cl, "%llx.%llx wrote %llu bytes cleaned %d pages\n",
38d46409c4639a Xiubo Li                2023-06-12  1329  		      ceph_vinop(inode), osd_data->length,
38d46409c4639a Xiubo Li                2023-06-12  1330  		      rc >= 0 ? num_pages : 0);
1d3576fd10f0d7 Sage Weil               2009-10-06  1331  
96ac9158a230e4 John Hubbard            2019-08-08  1332  		release_pages(osd_data->pages, num_pages);
5b64640cf65be4 Yan, Zheng              2016-01-07  1333  	}
5b64640cf65be4 Yan, Zheng              2016-01-07  1334  
903f4fec78dd05 Xiubo Li                2021-05-13  1335  	ceph_update_write_metrics(&fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05 Xiubo Li                2021-05-13  1336  				  req->r_end_latency, len, rc);
903f4fec78dd05 Xiubo Li                2021-05-13  1337  
b1137e0b3d4bad Alex Markuze            2026-02-10  1338  	if (rc >= 0 && len > 0)
b1137e0b3d4bad Alex Markuze            2026-02-10  1339  		ceph_subvolume_metrics_record_io(mdsc, ci, true, len,
b1137e0b3d4bad Alex Markuze            2026-02-10  1340  						 req->r_start_latency,
b1137e0b3d4bad Alex Markuze            2026-02-10  1341  						 req->r_end_latency);
b1137e0b3d4bad Alex Markuze            2026-02-10  1342  
5b64640cf65be4 Yan, Zheng              2016-01-07  1343  	ceph_put_wrbuffer_cap_refs(ci, total_pages, snapc);
5b64640cf65be4 Yan, Zheng              2016-01-07  1344  
5b64640cf65be4 Yan, Zheng              2016-01-07  1345  	osd_data = osd_req_op_extent_osd_data(req, 0);
87060c1089a94f Alex Elder              2013-04-03  1346  	if (osd_data->pages_from_pool)
a0102bda5bc099 Jeff Layton             2020-07-30  1347  		mempool_free(osd_data->pages, ceph_wb_pagevec_pool);
1d3576fd10f0d7 Sage Weil               2009-10-06  1348  	else
87060c1089a94f Alex Elder              2013-04-03  1349  		kfree(osd_data->pages);
1d3576fd10f0d7 Sage Weil               2009-10-06  1350  	ceph_osdc_put_request(req);
1464de9f813e35 Xiubo Li                2023-05-09  1351  	ceph_dec_osd_stopping_blocker(fsc->mdsc);
4ab4c720c9bad1 Alex Markuze            2026-08-20  1352  	ceph_blog_exit(&__ji);
1d3576fd10f0d7 Sage Weil               2009-10-06  1353  }
1d3576fd10f0d7 Sage Weil               2009-10-06  1354  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

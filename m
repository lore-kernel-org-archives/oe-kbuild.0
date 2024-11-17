Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5622158222
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731839364; cv=none; b=h+tjOX1iGuRTIyTtCcB4SqLnuGFz/DPwnA3d+y6sFkQZ8f0jfJ9ngPlZw6VwMUlpfsyQ7OirhK/0QfwWh367FGA49cDAl+g2cfcplPHDknr0UNCsQhxC8CiKinbC+q8tPD5fLUSg0FB9vAcaM/bOnGtNz1y7vYaT2/wyhLUHfMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731839364; c=relaxed/simple;
	bh=xYqdIfVw0xgEj1+2cIm5ltU5jPBuh1pdB/l4cAG5pyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKSXKCjcxE7gckpertTeto9oVe9DmoKDxM0zCiB9Vkd0HgvhLeIhc8Ehfsj/KDxUGU/NP/QyA1RfIhlDX84XXsmXETY+L/tcei81IKTuFG8I6yZpKsDJO2i/LM0HWULXyb5BMYWu/Hdxjfw0Q/O/e/xKiDuOQCnnU6YIfoXqrjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSEAs6IC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSEAs6IC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731839362; x=1763375362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xYqdIfVw0xgEj1+2cIm5ltU5jPBuh1pdB/l4cAG5pyo=;
  b=FSEAs6ICj79+u5fpQ+M7+5EYmvv63iqwEwoztMP97u1nvbVgF5m6wHsR
   JtxneinBYighYOXsBOC6UOqj1/BtSyY4nU9BOxhe8YXxKZ8niJ2xuAouN
   p16TSnt7nbXVAxkUtc/w8v19Nmv1GIqkCr6g/+NV2G6rO8GMxaOCQss3T
   RcVyfbi/kvxtWawZHXhLpqaEKhD3k/Do/K2WrykZ8DGohT2A0MYhjPnKN
   g+x2TVyhQ9060VyIcByZv9K96wjye3jd3plyPxtyGpWgMeeD9Tg4JllkP
   oGNnctHYeB1YhfBHGZqm9+D9SFh+Ge10fDbKP8GkBV62xMxA8DhvA1+jA
   g==;
X-CSE-ConnectionGUID: 17MmP2i9QdaHbbvI3fuDMA==
X-CSE-MsgGUID: wW2F6jiNQ0SOC5vnakm89A==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42432541"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="42432541"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 02:29:21 -0800
X-CSE-ConnectionGUID: KZHG3woFRweK0om0m+pWCA==
X-CSE-MsgGUID: mXQJRc9vSk+1roXyhxsVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="94054854"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Nov 2024 02:29:20 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCcWr-0001gb-2G;
	Sun, 17 Nov 2024 10:29:17 +0000
Date: Sun, 17 Nov 2024 18:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ceph/addr.c:911 writepages_finish() error: 'page' dereferencing
 possible ERR_PTR()
Message-ID: <202411171812.OPCM60Nr-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a5df37964673effcd9f84041f7423206a5ae5f2
commit: af7628d6ec196999175ecb3fdb38336489b0f88a fs: convert error_remove_page to error_remove_folio
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171812.OPCM60Nr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411171812.OPCM60Nr-lkp@intel.com/

New smatch warnings:
fs/ceph/addr.c:911 writepages_finish() error: 'page' dereferencing possible ERR_PTR()

Old smatch warnings:
fs/ceph/addr.c:1171 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'
fs/ceph/addr.c:1171 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'
fs/ceph/addr.c:1175 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'
fs/ceph/addr.c:1175 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'
fs/ceph/addr.c:1176 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'
fs/ceph/addr.c:1176 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'
fs/ceph/addr.c:1182 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'
fs/ceph/addr.c:1182 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'
fs/ceph/addr.c:1189 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'
fs/ceph/addr.c:1189 ceph_writepages_start() warn: potentially one past the end of array 'pages[locked_pages]'

vim +/page +911 fs/ceph/addr.c

1d3576fd10f0d7 Sage Weil               2009-10-06  832  
1d3576fd10f0d7 Sage Weil               2009-10-06  833  /*
1d3576fd10f0d7 Sage Weil               2009-10-06  834   * async writeback completion handler.
1d3576fd10f0d7 Sage Weil               2009-10-06  835   *
1d3576fd10f0d7 Sage Weil               2009-10-06  836   * If we get an error, set the mapping error bit, but not the individual
1d3576fd10f0d7 Sage Weil               2009-10-06  837   * page error bits.
1d3576fd10f0d7 Sage Weil               2009-10-06  838   */
85e084feb47349 Ilya Dryomov            2016-04-28  839  static void writepages_finish(struct ceph_osd_request *req)
1d3576fd10f0d7 Sage Weil               2009-10-06  840  {
1d3576fd10f0d7 Sage Weil               2009-10-06  841  	struct inode *inode = req->r_inode;
1d3576fd10f0d7 Sage Weil               2009-10-06  842  	struct ceph_inode_info *ci = ceph_inode(inode);
38d46409c4639a Xiubo Li                2023-06-12  843  	struct ceph_client *cl = ceph_inode_to_client(inode);
87060c1089a94f Alex Elder              2013-04-03  844  	struct ceph_osd_data *osd_data;
1d3576fd10f0d7 Sage Weil               2009-10-06  845  	struct page *page;
5b64640cf65be4 Yan, Zheng              2016-01-07  846  	int num_pages, total_pages = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07  847  	int i, j;
5b64640cf65be4 Yan, Zheng              2016-01-07  848  	int rc = req->r_result;
1d3576fd10f0d7 Sage Weil               2009-10-06  849  	struct ceph_snap_context *snapc = req->r_snapc;
1d3576fd10f0d7 Sage Weil               2009-10-06  850  	struct address_space *mapping = inode->i_mapping;
5995d90d2d19f3 Xiubo Li                2023-06-12  851  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
903f4fec78dd05 Xiubo Li                2021-05-13  852  	unsigned int len = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07  853  	bool remove_page;
5b64640cf65be4 Yan, Zheng              2016-01-07  854  
38d46409c4639a Xiubo Li                2023-06-12  855  	doutc(cl, "%llx.%llx rc %d\n", ceph_vinop(inode), rc);
26544c623e741a Jeff Layton             2017-04-04  856  	if (rc < 0) {
5b64640cf65be4 Yan, Zheng              2016-01-07  857  		mapping_set_error(mapping, rc);
26544c623e741a Jeff Layton             2017-04-04  858  		ceph_set_error_write(ci);
0b98acd6188309 Ilya Dryomov            2020-09-14  859  		if (rc == -EBLOCKLISTED)
0b98acd6188309 Ilya Dryomov            2020-09-14  860  			fsc->blocklisted = true;
26544c623e741a Jeff Layton             2017-04-04  861  	} else {
26544c623e741a Jeff Layton             2017-04-04  862  		ceph_clear_error_write(ci);
26544c623e741a Jeff Layton             2017-04-04  863  	}
1d3576fd10f0d7 Sage Weil               2009-10-06  864  
79788c698b2904 Sage Weil               2010-02-02  865  	/*
5b64640cf65be4 Yan, Zheng              2016-01-07  866  	 * We lost the cache cap, need to truncate the page before
5b64640cf65be4 Yan, Zheng              2016-01-07  867  	 * it is unlocked, otherwise we'd truncate it later in the
5b64640cf65be4 Yan, Zheng              2016-01-07  868  	 * page truncation thread, possibly losing some data that
5b64640cf65be4 Yan, Zheng              2016-01-07  869  	 * raced its way in
79788c698b2904 Sage Weil               2010-02-02  870  	 */
5b64640cf65be4 Yan, Zheng              2016-01-07  871  	remove_page = !(ceph_caps_issued(ci) &
5b64640cf65be4 Yan, Zheng              2016-01-07  872  			(CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO));
1d3576fd10f0d7 Sage Weil               2009-10-06  873  
1d3576fd10f0d7 Sage Weil               2009-10-06  874  	/* clean all pages */
5b64640cf65be4 Yan, Zheng              2016-01-07  875  	for (i = 0; i < req->r_num_ops; i++) {
642d51fb0775a4 Xiubo Li                2022-05-05  876  		if (req->r_ops[i].op != CEPH_OSD_OP_WRITE) {
38d46409c4639a Xiubo Li                2023-06-12  877  			pr_warn_client(cl,
38d46409c4639a Xiubo Li                2023-06-12  878  				"%llx.%llx incorrect op %d req %p index %d tid %llu\n",
38d46409c4639a Xiubo Li                2023-06-12  879  				ceph_vinop(inode), req->r_ops[i].op, req, i,
38d46409c4639a Xiubo Li                2023-06-12  880  				req->r_tid);
5b64640cf65be4 Yan, Zheng              2016-01-07  881  			break;
642d51fb0775a4 Xiubo Li                2022-05-05  882  		}
5b64640cf65be4 Yan, Zheng              2016-01-07  883  
5b64640cf65be4 Yan, Zheng              2016-01-07  884  		osd_data = osd_req_op_extent_osd_data(req, i);
5b64640cf65be4 Yan, Zheng              2016-01-07  885  		BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
903f4fec78dd05 Xiubo Li                2021-05-13  886  		len += osd_data->length;
5b64640cf65be4 Yan, Zheng              2016-01-07  887  		num_pages = calc_pages_for((u64)osd_data->alignment,
5b64640cf65be4 Yan, Zheng              2016-01-07  888  					   (u64)osd_data->length);
5b64640cf65be4 Yan, Zheng              2016-01-07  889  		total_pages += num_pages;
5b64640cf65be4 Yan, Zheng              2016-01-07  890  		for (j = 0; j < num_pages; j++) {
5b64640cf65be4 Yan, Zheng              2016-01-07  891  			page = osd_data->pages[j];
d55207717ded95 Jeff Layton             2022-08-25  892  			if (fscrypt_is_bounce_page(page)) {
d55207717ded95 Jeff Layton             2022-08-25  893  				page = fscrypt_pagecache_page(page);
d55207717ded95 Jeff Layton             2022-08-25  894  				fscrypt_free_bounce_page(osd_data->pages[j]);
d55207717ded95 Jeff Layton             2022-08-25  895  				osd_data->pages[j] = page;
d55207717ded95 Jeff Layton             2022-08-25  896  			}
1d3576fd10f0d7 Sage Weil               2009-10-06  897  			BUG_ON(!page);
1d3576fd10f0d7 Sage Weil               2009-10-06  898  			WARN_ON(!PageUptodate(page));
1d3576fd10f0d7 Sage Weil               2009-10-06  899  
5b64640cf65be4 Yan, Zheng              2016-01-07  900  			if (atomic_long_dec_return(&fsc->writeback_count) <
5b64640cf65be4 Yan, Zheng              2016-01-07  901  			     CONGESTION_OFF_THRESH(
5b64640cf65be4 Yan, Zheng              2016-01-07  902  					fsc->mount_options->congestion_kb))
503d4fa6ee28e8 NeilBrown               2022-03-22  903  				fsc->write_congested = false;
2baba25019ec56 Yehuda Sadeh            2009-12-18  904  
379fc7fad0ae6e Jeff Layton             2021-03-23  905  			ceph_put_snap_context(detach_page_private(page));
1d3576fd10f0d7 Sage Weil               2009-10-06  906  			end_page_writeback(page);
38d46409c4639a Xiubo Li                2023-06-12  907  			doutc(cl, "unlocking %p\n", page);
e63dc5c780ba32 Yehuda Sadeh            2010-02-19  908  
5b64640cf65be4 Yan, Zheng              2016-01-07  909  			if (remove_page)
af7628d6ec1969 Matthew Wilcox (Oracle  2023-11-17  910) 				generic_error_remove_folio(inode->i_mapping,
af7628d6ec1969 Matthew Wilcox (Oracle  2023-11-17 @911) 							  page_folio(page));
e63dc5c780ba32 Yehuda Sadeh            2010-02-19  912  
1d3576fd10f0d7 Sage Weil               2009-10-06  913  			unlock_page(page);
1d3576fd10f0d7 Sage Weil               2009-10-06  914  		}
38d46409c4639a Xiubo Li                2023-06-12  915  		doutc(cl, "%llx.%llx wrote %llu bytes cleaned %d pages\n",
38d46409c4639a Xiubo Li                2023-06-12  916  		      ceph_vinop(inode), osd_data->length,
38d46409c4639a Xiubo Li                2023-06-12  917  		      rc >= 0 ? num_pages : 0);
1d3576fd10f0d7 Sage Weil               2009-10-06  918  
96ac9158a230e4 John Hubbard            2019-08-08  919  		release_pages(osd_data->pages, num_pages);
5b64640cf65be4 Yan, Zheng              2016-01-07  920  	}
5b64640cf65be4 Yan, Zheng              2016-01-07  921  
903f4fec78dd05 Xiubo Li                2021-05-13  922  	ceph_update_write_metrics(&fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05 Xiubo Li                2021-05-13  923  				  req->r_end_latency, len, rc);
903f4fec78dd05 Xiubo Li                2021-05-13  924  
5b64640cf65be4 Yan, Zheng              2016-01-07  925  	ceph_put_wrbuffer_cap_refs(ci, total_pages, snapc);
5b64640cf65be4 Yan, Zheng              2016-01-07  926  
5b64640cf65be4 Yan, Zheng              2016-01-07  927  	osd_data = osd_req_op_extent_osd_data(req, 0);
87060c1089a94f Alex Elder              2013-04-03  928  	if (osd_data->pages_from_pool)
a0102bda5bc099 Jeff Layton             2020-07-30  929  		mempool_free(osd_data->pages, ceph_wb_pagevec_pool);
1d3576fd10f0d7 Sage Weil               2009-10-06  930  	else
87060c1089a94f Alex Elder              2013-04-03  931  		kfree(osd_data->pages);
1d3576fd10f0d7 Sage Weil               2009-10-06  932  	ceph_osdc_put_request(req);
1464de9f813e35 Xiubo Li                2023-05-09  933  	ceph_dec_osd_stopping_blocker(fsc->mdsc);
1d3576fd10f0d7 Sage Weil               2009-10-06  934  }
1d3576fd10f0d7 Sage Weil               2009-10-06  935  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1698483
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Feb 2023 20:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676060690; x=1707596690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHTHEyrnDoU+WCf/WZuYNrkxjhX/xQgTL/NNJkD/RGg=;
  b=oIUpcZUZpXJ5TMU9l65p0cVAAGy/11eUDhAyX1jtq26jJHt0O2Q+OBzQ
   6McZNK2p7OXPATczQPbvzh2V5IjpprqlP6aRfUHiDIpAkMVd8A+McJGGV
   kZFJbcZ+93pC4u2T6tCNjbJy+XMgSmst0jU6A4o7YIYOiJ+1/oIaxxtd0
   m2bsv2B+MQcLrVlvgmxpHBh9PrEqpNsIchW4Ni4WNVL9rUMMrcswx4ZRc
   W+QMoDAfbu0UKVV93EjIqfw/BJtLOobxgSOQ0xoD67YmmaEafnS9Ccfbd
   eKTmzcf4INlocXHJXktcq/4ADs+Hsz+XRkeqjMOSYHWv4X3a4+CJegUpe
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="331822946"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="331822946"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 12:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="777061311"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="777061311"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2023 12:24:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQZwr-00062T-29;
	Fri, 10 Feb 2023 20:24:45 +0000
Date: Sat, 11 Feb 2023 04:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/iommufd/pages.c:1318 iopt_area_fill_domain() error:
 uninitialized symbol 'done_end_index'.
Message-ID: <202302110422.GTkRjGCQ-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4f72a263e162938de26866b862ed6015f5725946
commit: 8d160cd4d5066f864ec0f2c981470e55ac03ac27 iommufd: Algorithms for PFN storage
date:   2 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 months ago
config: i386-randconfig-m021-20221226 (https://download.01.org/0day-ci/archive/20230211/202302110422.GTkRjGCQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302110422.GTkRjGCQ-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/pages.c:1318 iopt_area_fill_domain() error: uninitialized symbol 'done_end_index'.
drivers/iommu/iommufd/pages.c:1387 iopt_area_fill_domains() error: uninitialized symbol 'done_all_end_index'.

Old smatch warnings:
drivers/iommu/iommufd/pages.c:1384 iopt_area_fill_domains() error: uninitialized symbol 'index'.

vim +/done_end_index +1318 drivers/iommu/iommufd/pages.c

8d160cd4d5066f Jason Gunthorpe 2022-11-29  1275  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1276  /**
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1277   * iopt_area_fill_domain() - Map PFNs from the area into a domain
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1278   * @area: IOVA area to use
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1279   * @domain: Domain to load PFNs into
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1280   *
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1281   * Read the pfns from the area's underlying iopt_pages and map them into the
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1282   * given domain. Called when attaching a new domain to an io_pagetable.
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1283   */
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1284  int iopt_area_fill_domain(struct iopt_area *area, struct iommu_domain *domain)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1285  {
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1286  	unsigned long done_end_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1287  	struct pfn_reader pfns;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1288  	int rc;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1289  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1290  	lockdep_assert_held(&area->pages->mutex);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1291  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1292  	rc = pfn_reader_first(&pfns, area->pages, iopt_area_index(area),
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1293  			      iopt_area_last_index(area));
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1294  	if (rc)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1295  		return rc;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1296  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1297  	while (!pfn_reader_done(&pfns)) {
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1298  		done_end_index = pfns.batch_start_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1299  		rc = batch_to_domain(&pfns.batch, domain, area,
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1300  				     pfns.batch_start_index);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1301  		if (rc)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1302  			goto out_unmap;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1303  		done_end_index = pfns.batch_end_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1304  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1305  		rc = pfn_reader_next(&pfns);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1306  		if (rc)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1307  			goto out_unmap;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1308  	}
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1309  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1310  	rc = pfn_reader_update_pinned(&pfns);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1311  	if (rc)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1312  		goto out_unmap;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1313  	goto out_destroy;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1314  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1315  out_unmap:
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1316  	pfn_reader_release_pins(&pfns);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1317  	iopt_area_unfill_partial_domain(area, area->pages, domain,
8d160cd4d5066f Jason Gunthorpe 2022-11-29 @1318  					done_end_index);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1319  out_destroy:
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1320  	pfn_reader_destroy(&pfns);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1321  	return rc;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1322  }
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1323  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1324  /**
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1325   * iopt_area_fill_domains() - Install PFNs into the area's domains
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1326   * @area: The area to act on
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1327   * @pages: The pages associated with the area (area->pages is NULL)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1328   *
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1329   * Called during area creation. The area is freshly created and not inserted in
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1330   * the domains_itree yet. PFNs are read and loaded into every domain held in the
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1331   * area's io_pagetable and the area is installed in the domains_itree.
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1332   *
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1333   * On failure all domains are left unchanged.
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1334   */
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1335  int iopt_area_fill_domains(struct iopt_area *area, struct iopt_pages *pages)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1336  {
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1337  	unsigned long done_first_end_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1338  	unsigned long done_all_end_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1339  	struct iommu_domain *domain;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1340  	unsigned long unmap_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1341  	struct pfn_reader pfns;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1342  	unsigned long index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1343  	int rc;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1344  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1345  	lockdep_assert_held(&area->iopt->domains_rwsem);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1346  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1347  	if (xa_empty(&area->iopt->domains))
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1348  		return 0;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1349  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1350  	mutex_lock(&pages->mutex);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1351  	rc = pfn_reader_first(&pfns, pages, iopt_area_index(area),
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1352  			      iopt_area_last_index(area));
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1353  	if (rc)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1354  		goto out_unlock;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1355  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1356  	while (!pfn_reader_done(&pfns)) {
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1357  		done_first_end_index = pfns.batch_end_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1358  		done_all_end_index = pfns.batch_start_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1359  		xa_for_each(&area->iopt->domains, index, domain) {
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1360  			rc = batch_to_domain(&pfns.batch, domain, area,
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1361  					     pfns.batch_start_index);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1362  			if (rc)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1363  				goto out_unmap;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1364  		}
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1365  		done_all_end_index = done_first_end_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1366  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1367  		rc = pfn_reader_next(&pfns);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1368  		if (rc)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1369  			goto out_unmap;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1370  	}
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1371  	rc = pfn_reader_update_pinned(&pfns);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1372  	if (rc)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1373  		goto out_unmap;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1374  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1375  	area->storage_domain = xa_load(&area->iopt->domains, 0);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1376  	interval_tree_insert(&area->pages_node, &pages->domains_itree);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1377  	goto out_destroy;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1378  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1379  out_unmap:
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1380  	pfn_reader_release_pins(&pfns);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1381  	xa_for_each(&area->iopt->domains, unmap_index, domain) {
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1382  		unsigned long end_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1383  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1384  		if (unmap_index < index)
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1385  			end_index = done_first_end_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1386  		else
8d160cd4d5066f Jason Gunthorpe 2022-11-29 @1387  			end_index = done_all_end_index;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1388  
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1389  		/*
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1390  		 * The area is not yet part of the domains_itree so we have to
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1391  		 * manage the unpinning specially. The last domain does the
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1392  		 * unpin, every other domain is just unmapped.
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1393  		 */
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1394  		if (unmap_index != area->iopt->next_domain_id - 1) {
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1395  			if (end_index != iopt_area_index(area))
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1396  				iopt_area_unmap_domain_range(
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1397  					area, domain, iopt_area_index(area),
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1398  					end_index - 1);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1399  		} else {
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1400  			iopt_area_unfill_partial_domain(area, pages, domain,
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1401  							end_index);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1402  		}
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1403  	}
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1404  out_destroy:
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1405  	pfn_reader_destroy(&pfns);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1406  out_unlock:
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1407  	mutex_unlock(&pages->mutex);
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1408  	return rc;
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1409  }
8d160cd4d5066f Jason Gunthorpe 2022-11-29  1410  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

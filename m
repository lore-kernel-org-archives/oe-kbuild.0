Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2CF37B
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Feb 2023 01:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675819785; x=1707355785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J0SAZGbZx2fvSpdJszioDMQjoWBzjuFBWHqyqG8LbHc=;
  b=IVy3BrmSaOWOk5gROvqO2UwhH+/g3PNEHbkmdRuFgNZmTlYC4Xudpgt1
   uZ4K9z2XgO19B++mOdxQ9QHLDpoaceKeo78+nncibmmqgvvSNEGoZVs3C
   h4X6bHZd+qtEY8yGTAgMFeMcN6O/m15obcUoqHDnS3fWCjZRHxApocMxq
   uheYJLN/RihuQjooABZvwEPuMJtEH7oaYvrcXvowGos/rkQcsiKeOZUbp
   7Jl5fOcDVCixRxfOAAlR3GwR/DFu6BdCLzrGt6TVhnoWbQiaHj/8rb9cK
   C2oJOetwI5SVowvhOD9aPBxZdfU/9k2EyCFSZTsp1QAOlzgKgvPrOxZTN
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="327373410"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="327373410"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 17:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="735751809"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="735751809"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Feb 2023 17:29:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPZHK-00042m-31;
	Wed, 08 Feb 2023 01:29:42 +0000
Date: Wed, 8 Feb 2023 09:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cxl:pending 31/46] drivers/cxl/core/region.c:1357:5: warning:
 Redundant initialization for 'rc'. The initialized value is overwritten
 before it is read. [redundantInitialization]
Message-ID: <202302080914.YYsW8TtY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/cxl/core/region.c:1357:5: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-cxl@vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git pending
head:   3ad0b8d3a98e8c657ad713eca5f4efbb569fc4fd
commit: bd181ecc6b36043a246f812b4190ccc5b175babc [31/46] cxl/region: Move region-position validation to a helper
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout bd181ecc6b36043a246f812b4190ccc5b175babc
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/cxl/core/region.c:1357:5: warning: Redundant initialization for 'rc'. The initialized value is overwritten before it is read. [redundantInitialization]
    rc = cxl_region_validate_position(cxlr, cxled, pos);
       ^
   drivers/cxl/core/region.c:1302:9: note: rc is initialized
    int rc = -ENXIO;
           ^
   drivers/cxl/core/region.c:1357:5: note: rc is overwritten
    rc = cxl_region_validate_position(cxlr, cxled, pos);
       ^

vim +/rc +1357 drivers/cxl/core/region.c

bd181ecc6b36043 Dan Williams  2023-02-05  1293  
bd181ecc6b36043 Dan Williams  2023-02-05  1294  static int cxl_region_attach(struct cxl_region *cxlr,
bd181ecc6b36043 Dan Williams  2023-02-05  1295  			     struct cxl_endpoint_decoder *cxled, int pos)
bd181ecc6b36043 Dan Williams  2023-02-05  1296  {
bd181ecc6b36043 Dan Williams  2023-02-05  1297  	struct cxl_root_decoder *cxlrd = to_cxl_root_decoder(cxlr->dev.parent);
bd181ecc6b36043 Dan Williams  2023-02-05  1298  	struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
bd181ecc6b36043 Dan Williams  2023-02-05  1299  	struct cxl_region_params *p = &cxlr->params;
bd181ecc6b36043 Dan Williams  2023-02-05  1300  	struct cxl_port *ep_port, *root_port;
bd181ecc6b36043 Dan Williams  2023-02-05  1301  	struct cxl_dport *dport;
bd181ecc6b36043 Dan Williams  2023-02-05  1302  	int rc = -ENXIO;
bd181ecc6b36043 Dan Williams  2023-02-05  1303  
bd181ecc6b36043 Dan Williams  2023-02-05  1304  	if (cxled->mode != cxlr->mode) {
bd181ecc6b36043 Dan Williams  2023-02-05  1305  		dev_dbg(&cxlr->dev, "%s region mode: %d mismatch: %d\n",
bd181ecc6b36043 Dan Williams  2023-02-05  1306  			dev_name(&cxled->cxld.dev), cxlr->mode, cxled->mode);
bd181ecc6b36043 Dan Williams  2023-02-05  1307  		return -EINVAL;
bd181ecc6b36043 Dan Williams  2023-02-05  1308  	}
bd181ecc6b36043 Dan Williams  2023-02-05  1309  
bd181ecc6b36043 Dan Williams  2023-02-05  1310  	if (cxled->mode == CXL_DECODER_DEAD) {
bd181ecc6b36043 Dan Williams  2023-02-05  1311  		dev_dbg(&cxlr->dev, "%s dead\n", dev_name(&cxled->cxld.dev));
bd181ecc6b36043 Dan Williams  2023-02-05  1312  		return -ENODEV;
bd181ecc6b36043 Dan Williams  2023-02-05  1313  	}
bd181ecc6b36043 Dan Williams  2023-02-05  1314  
bd181ecc6b36043 Dan Williams  2023-02-05  1315  	/* all full of members, or interleave config not established? */
bd181ecc6b36043 Dan Williams  2023-02-05  1316  	if (p->state > CXL_CONFIG_INTERLEAVE_ACTIVE) {
bd181ecc6b36043 Dan Williams  2023-02-05  1317  		dev_dbg(&cxlr->dev, "region already active\n");
bd181ecc6b36043 Dan Williams  2023-02-05  1318  		return -EBUSY;
bd181ecc6b36043 Dan Williams  2023-02-05  1319  	} else if (p->state < CXL_CONFIG_INTERLEAVE_ACTIVE) {
bd181ecc6b36043 Dan Williams  2023-02-05  1320  		dev_dbg(&cxlr->dev, "interleave config missing\n");
bd181ecc6b36043 Dan Williams  2023-02-05  1321  		return -ENXIO;
bd181ecc6b36043 Dan Williams  2023-02-05  1322  	}
bd181ecc6b36043 Dan Williams  2023-02-05  1323  
384e624bb211b40 Dan Williams  2022-06-07  1324  	ep_port = cxled_to_port(cxled);
384e624bb211b40 Dan Williams  2022-06-07  1325  	root_port = cxlrd_to_port(cxlrd);
384e624bb211b40 Dan Williams  2022-06-07  1326  	dport = cxl_find_dport_by_dev(root_port, ep_port->host_bridge);
384e624bb211b40 Dan Williams  2022-06-07  1327  	if (!dport) {
384e624bb211b40 Dan Williams  2022-06-07  1328  		dev_dbg(&cxlr->dev, "%s:%s invalid target for %s\n",
384e624bb211b40 Dan Williams  2022-06-07  1329  			dev_name(&cxlmd->dev), dev_name(&cxled->cxld.dev),
384e624bb211b40 Dan Williams  2022-06-07  1330  			dev_name(cxlr->dev.parent));
384e624bb211b40 Dan Williams  2022-06-07  1331  		return -ENXIO;
384e624bb211b40 Dan Williams  2022-06-07  1332  	}
384e624bb211b40 Dan Williams  2022-06-07  1333  
384e624bb211b40 Dan Williams  2022-06-07  1334  	if (cxled->cxld.target_type != cxlr->type) {
384e624bb211b40 Dan Williams  2022-06-07  1335  		dev_dbg(&cxlr->dev, "%s:%s type mismatch: %d vs %d\n",
384e624bb211b40 Dan Williams  2022-06-07  1336  			dev_name(&cxlmd->dev), dev_name(&cxled->cxld.dev),
384e624bb211b40 Dan Williams  2022-06-07  1337  			cxled->cxld.target_type, cxlr->type);
384e624bb211b40 Dan Williams  2022-06-07  1338  		return -ENXIO;
384e624bb211b40 Dan Williams  2022-06-07  1339  	}
384e624bb211b40 Dan Williams  2022-06-07  1340  
384e624bb211b40 Dan Williams  2022-06-07  1341  	if (!cxled->dpa_res) {
384e624bb211b40 Dan Williams  2022-06-07  1342  		dev_dbg(&cxlr->dev, "%s:%s: missing DPA allocation.\n",
384e624bb211b40 Dan Williams  2022-06-07  1343  			dev_name(&cxlmd->dev), dev_name(&cxled->cxld.dev));
384e624bb211b40 Dan Williams  2022-06-07  1344  		return -ENXIO;
384e624bb211b40 Dan Williams  2022-06-07  1345  	}
384e624bb211b40 Dan Williams  2022-06-07  1346  
384e624bb211b40 Dan Williams  2022-06-07  1347  	if (resource_size(cxled->dpa_res) * p->interleave_ways !=
384e624bb211b40 Dan Williams  2022-06-07  1348  	    resource_size(p->res)) {
384e624bb211b40 Dan Williams  2022-06-07  1349  		dev_dbg(&cxlr->dev,
384e624bb211b40 Dan Williams  2022-06-07  1350  			"%s:%s: decoder-size-%#llx * ways-%d != region-size-%#llx\n",
384e624bb211b40 Dan Williams  2022-06-07  1351  			dev_name(&cxlmd->dev), dev_name(&cxled->cxld.dev),
384e624bb211b40 Dan Williams  2022-06-07  1352  			(u64)resource_size(cxled->dpa_res), p->interleave_ways,
384e624bb211b40 Dan Williams  2022-06-07  1353  			(u64)resource_size(p->res));
384e624bb211b40 Dan Williams  2022-06-07  1354  		return -EINVAL;
384e624bb211b40 Dan Williams  2022-06-07  1355  	}
384e624bb211b40 Dan Williams  2022-06-07  1356  
bd181ecc6b36043 Dan Williams  2023-02-05 @1357  	rc = cxl_region_validate_position(cxlr, cxled, pos);
384e624bb211b40 Dan Williams  2022-06-07  1358  	if (rc)
bd181ecc6b36043 Dan Williams  2023-02-05  1359  		return rc;
bd181ecc6b36043 Dan Williams  2023-02-05  1360  
bd181ecc6b36043 Dan Williams  2023-02-05  1361  	rc = cxl_region_attach_position(cxlr, cxlrd, cxled, dport, pos);
bd181ecc6b36043 Dan Williams  2023-02-05  1362  	if (rc)
bd181ecc6b36043 Dan Williams  2023-02-05  1363  		return rc;
384e624bb211b40 Dan Williams  2022-06-07  1364  
b9686e8c8e39d40 Dan Williams  2022-06-04  1365  	p->targets[pos] = cxled;
b9686e8c8e39d40 Dan Williams  2022-06-04  1366  	cxled->pos = pos;
b9686e8c8e39d40 Dan Williams  2022-06-04  1367  	p->nr_targets++;
b9686e8c8e39d40 Dan Williams  2022-06-04  1368  
27b3f8d13830cdb Dan Williams  2022-06-06  1369  	if (p->nr_targets == p->interleave_ways) {
27b3f8d13830cdb Dan Williams  2022-06-06  1370  		rc = cxl_region_setup_targets(cxlr);
27b3f8d13830cdb Dan Williams  2022-06-06  1371  		if (rc)
5e42bcbc3fef6e7 Dan Carpenter 2022-08-01  1372  			goto err_decrement;
384e624bb211b40 Dan Williams  2022-06-07  1373  		p->state = CXL_CONFIG_ACTIVE;
27b3f8d13830cdb Dan Williams  2022-06-06  1374  	}
384e624bb211b40 Dan Williams  2022-06-07  1375  
2901c8bdedca19e Dan Williams  2022-08-02  1376  	cxled->cxld.interleave_ways = p->interleave_ways;
2901c8bdedca19e Dan Williams  2022-08-02  1377  	cxled->cxld.interleave_granularity = p->interleave_granularity;
910bc55da828560 Dan Williams  2022-08-05  1378  	cxled->cxld.hpa_range = (struct range) {
910bc55da828560 Dan Williams  2022-08-05  1379  		.start = p->res->start,
910bc55da828560 Dan Williams  2022-08-05  1380  		.end = p->res->end,
910bc55da828560 Dan Williams  2022-08-05  1381  	};
2901c8bdedca19e Dan Williams  2022-08-02  1382  
b9686e8c8e39d40 Dan Williams  2022-06-04  1383  	return 0;
384e624bb211b40 Dan Williams  2022-06-07  1384  
5e42bcbc3fef6e7 Dan Carpenter 2022-08-01  1385  err_decrement:
5e42bcbc3fef6e7 Dan Carpenter 2022-08-01  1386  	p->nr_targets--;
384e624bb211b40 Dan Williams  2022-06-07  1387  	return rc;
b9686e8c8e39d40 Dan Williams  2022-06-04  1388  }
b9686e8c8e39d40 Dan Williams  2022-06-04  1389  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CED8BF1
	for <oe-kbuild@lists.linux.dev>; Fri,  5 May 2023 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683312507; x=1714848507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJJ5IExUpqcGlF0HMU2CmNFEP/qleeWIR7XVWnvtcvc=;
  b=FhAEBL58e4I78bOQWU4GM7GoKHHMuN50PY1GYTfeLgXduSRsqkZDiAj8
   YYcK2S2QzpQCIvt7RGRe7YgMJuyLKOCwjdKL5QNRVqm6U8LcRHx23OZEn
   nQJ5aDqMwHK7jqlNlzg+IlEmM6LETtGBI34ka/KRvgNIoqAUrjVPtM5ye
   lDND5U80Uwn6Dg9AuWVebicJpX2Z7CSzFBxy7bV1nJ96S4c4GkP7NUo9f
   lcr1roK781XEw6iZ+xSyE7xhFln9IZONedXqul3840/uogsZ4Aom7QmcY
   NCWHJD1QIX5y1tUisnRrMVs8ckkkDbzUJk1L8UyLSOruIR7pXyAZjDEY4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="412515536"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="412515536"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 11:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="730465742"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="730465742"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 May 2023 11:48:25 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv0Th-0000oP-0U;
	Fri, 05 May 2023 18:48:25 +0000
Date: Sat, 6 May 2023 02:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djiang:cxl-qtg 22/28] drivers/cxl/port.c:88
 cxl_port_perf_data_calculate() error: we previously assumed 'cxl_root->ops'
 could be null (see line 88)
Message-ID: <202305060238.eVFtMQO6-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   4cc79fc6093484664713b47ccd4b4cff326bca86
commit: 90a255f34829f50adb9fbfcd8e32444b188074e3 [22/28] cxl: Compute the entire CXL path latency and bandwidth data
:::::: branch date: 2 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230506/202305060238.eVFtMQO6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305060238.eVFtMQO6-lkp@intel.com/

smatch warnings:
drivers/cxl/port.c:88 cxl_port_perf_data_calculate() error: we previously assumed 'cxl_root->ops' could be null (see line 88)

vim +88 drivers/cxl/port.c

f249841f3973f0 Dave Jiang 2023-04-24   69  
90a255f34829f5 Dave Jiang 2022-12-05   70  static int cxl_port_perf_data_calculate(struct cxl_port *port,
90a255f34829f5 Dave Jiang 2022-12-05   71  					struct list_head *dsmas_list)
90a255f34829f5 Dave Jiang 2022-12-05   72  {
90a255f34829f5 Dave Jiang 2022-12-05   73  	struct access_coordinate c;
90a255f34829f5 Dave Jiang 2022-12-05   74  	struct qtg_dsm_input input;
90a255f34829f5 Dave Jiang 2022-12-05   75  	struct cxl_port *root_port;
90a255f34829f5 Dave Jiang 2022-12-05   76  	struct cxl_root *cxl_root;
90a255f34829f5 Dave Jiang 2022-12-05   77  	struct dsmas_entry *dent;
90a255f34829f5 Dave Jiang 2022-12-05   78  	int rc, qos_class;
90a255f34829f5 Dave Jiang 2022-12-05   79  
90a255f34829f5 Dave Jiang 2022-12-05   80  	rc = cxl_endpoint_get_perf_coordinates(port, &c);
90a255f34829f5 Dave Jiang 2022-12-05   81  	if (rc) {
90a255f34829f5 Dave Jiang 2022-12-05   82  		dev_dbg(&port->dev, "Failed to retrieve perf coordinates.\n");
90a255f34829f5 Dave Jiang 2022-12-05   83  		return rc;
90a255f34829f5 Dave Jiang 2022-12-05   84  	}
90a255f34829f5 Dave Jiang 2022-12-05   85  
90a255f34829f5 Dave Jiang 2022-12-05   86  	root_port = find_cxl_root(port);
90a255f34829f5 Dave Jiang 2022-12-05   87  	cxl_root = to_cxl_root(root_port);
90a255f34829f5 Dave Jiang 2022-12-05  @88  	if (!cxl_root->ops && !cxl_root->ops->get_qos_class)
90a255f34829f5 Dave Jiang 2022-12-05   89  		return -EOPNOTSUPP;
90a255f34829f5 Dave Jiang 2022-12-05   90  
90a255f34829f5 Dave Jiang 2022-12-05   91  	list_for_each_entry(dent, dsmas_list, list) {
90a255f34829f5 Dave Jiang 2022-12-05   92  		dent->coord.read_latency = dent->coord.read_latency +
90a255f34829f5 Dave Jiang 2022-12-05   93  					   c.read_latency;
90a255f34829f5 Dave Jiang 2022-12-05   94  		dent->coord.write_latency = dent->coord.write_latency +
90a255f34829f5 Dave Jiang 2022-12-05   95  					    c.write_latency;
90a255f34829f5 Dave Jiang 2022-12-05   96  		dent->coord.read_bandwidth = min_t(int, c.read_bandwidth,
90a255f34829f5 Dave Jiang 2022-12-05   97  						   dent->coord.read_bandwidth);
90a255f34829f5 Dave Jiang 2022-12-05   98  		dent->coord.write_bandwidth = min_t(int, c.write_bandwidth,
90a255f34829f5 Dave Jiang 2022-12-05   99  						    dent->coord.write_bandwidth);
90a255f34829f5 Dave Jiang 2022-12-05  100  
90a255f34829f5 Dave Jiang 2022-12-05  101  		input.rd_lat = cpu_to_le32(dent->coord.read_latency);
90a255f34829f5 Dave Jiang 2022-12-05  102  		input.wr_lat = cpu_to_le32(dent->coord.write_latency);
90a255f34829f5 Dave Jiang 2022-12-05  103  		input.rd_bw = cpu_to_le32(dent->coord.read_bandwidth);
90a255f34829f5 Dave Jiang 2022-12-05  104  		input.wr_bw = cpu_to_le32(dent->coord.write_bandwidth);
90a255f34829f5 Dave Jiang 2022-12-05  105  
90a255f34829f5 Dave Jiang 2022-12-05  106  		qos_class = cxl_root->ops->get_qos_class(root_port, &input);
90a255f34829f5 Dave Jiang 2022-12-05  107  		if (qos_class < 0)
90a255f34829f5 Dave Jiang 2022-12-05  108  			continue;
90a255f34829f5 Dave Jiang 2022-12-05  109  
90a255f34829f5 Dave Jiang 2022-12-05  110  		dent->qos_class = qos_class;
90a255f34829f5 Dave Jiang 2022-12-05  111  	}
90a255f34829f5 Dave Jiang 2022-12-05  112  
90a255f34829f5 Dave Jiang 2022-12-05  113  	return 0;
90a255f34829f5 Dave Jiang 2022-12-05  114  }
90a255f34829f5 Dave Jiang 2022-12-05  115  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

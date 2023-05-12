Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789AE818
	for <oe-kbuild@lists.linux.dev>; Fri, 12 May 2023 05:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683870520; x=1715406520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/V/G67m775PmXIpj3s+sDarJIf6Hp73VDufiDJsCefg=;
  b=EOPvTxKwVAwyKWM36gUSgbSViG+bOTQgU4FIJNozYrB0XD2JyBEndoox
   lUMRmByCa7iEf0fWcdtNvrgpAuI8QX12mVWsYPbxTUNLg2J4jseRzrsok
   AO90onetkH3NP0lJ0LY43x6N1J61rhLbIjdM1s6q7utPzGfReG0aac6tk
   sEZMhBukvBmPlBPemgXdBWFErRV+JrEBXCRhG9JS8uyDvDdgglVop/rFc
   aKzMjWmxC3s7ePVVUMqmSAiCYAD/O0hJ8n0ic8ax4z6ZWArVP3g0vDOyI
   6XnrHQRLMVS0Ykw/l7vHW2V1jWpA487ZA31uLcMvy+HX/TokKudwpuySw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378844739"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="378844739"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 22:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789667559"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="789667559"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 22:48:38 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxLdt-0004ZP-2R;
	Fri, 12 May 2023 05:48:37 +0000
Date: Fri, 12 May 2023 13:47:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djiang:cxl-qtg 24/30] drivers/cxl/port.c:88
 cxl_port_perf_data_calculate() error: we previously assumed 'cxl_root->ops'
 could be null (see line 88)
Message-ID: <202305121309.xPoqnmIY-lkp@intel.com>
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
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: 6f49d1fab777d2585dae7c6ab7e228f540f190d4 [24/30] cxl: Compute the entire CXL path latency and bandwidth data
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230512/202305121309.xPoqnmIY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305121309.xPoqnmIY-lkp@intel.com/

smatch warnings:
drivers/cxl/port.c:88 cxl_port_perf_data_calculate() error: we previously assumed 'cxl_root->ops' could be null (see line 88)

vim +88 drivers/cxl/port.c

65164ecadb8fb6 Dave Jiang 2023-04-24   69  
6f49d1fab777d2 Dave Jiang 2022-12-05   70  static int cxl_port_perf_data_calculate(struct cxl_port *port,
6f49d1fab777d2 Dave Jiang 2022-12-05   71  					struct list_head *dsmas_list)
6f49d1fab777d2 Dave Jiang 2022-12-05   72  {
6f49d1fab777d2 Dave Jiang 2022-12-05   73  	struct access_coordinate c;
6f49d1fab777d2 Dave Jiang 2022-12-05   74  	struct qtg_dsm_input input;
6f49d1fab777d2 Dave Jiang 2022-12-05   75  	struct cxl_port *root_port;
6f49d1fab777d2 Dave Jiang 2022-12-05   76  	struct cxl_root *cxl_root;
6f49d1fab777d2 Dave Jiang 2022-12-05   77  	struct dsmas_entry *dent;
6f49d1fab777d2 Dave Jiang 2022-12-05   78  	int rc, qos_class;
6f49d1fab777d2 Dave Jiang 2022-12-05   79  
6f49d1fab777d2 Dave Jiang 2022-12-05   80  	rc = cxl_endpoint_get_perf_coordinates(port, &c);
6f49d1fab777d2 Dave Jiang 2022-12-05   81  	if (rc) {
6f49d1fab777d2 Dave Jiang 2022-12-05   82  		dev_dbg(&port->dev, "Failed to retrieve perf coordinates.\n");
6f49d1fab777d2 Dave Jiang 2022-12-05   83  		return rc;
6f49d1fab777d2 Dave Jiang 2022-12-05   84  	}
6f49d1fab777d2 Dave Jiang 2022-12-05   85  
6f49d1fab777d2 Dave Jiang 2022-12-05   86  	root_port = find_cxl_root(port);
6f49d1fab777d2 Dave Jiang 2022-12-05   87  	cxl_root = to_cxl_root(root_port);
6f49d1fab777d2 Dave Jiang 2022-12-05  @88  	if (!cxl_root->ops && !cxl_root->ops->get_qos_class)
6f49d1fab777d2 Dave Jiang 2022-12-05   89  		return -EOPNOTSUPP;
6f49d1fab777d2 Dave Jiang 2022-12-05   90  
6f49d1fab777d2 Dave Jiang 2022-12-05   91  	list_for_each_entry(dent, dsmas_list, list) {
6f49d1fab777d2 Dave Jiang 2022-12-05   92  		dent->coord.read_latency = dent->coord.read_latency +
6f49d1fab777d2 Dave Jiang 2022-12-05   93  					   c.read_latency;
6f49d1fab777d2 Dave Jiang 2022-12-05   94  		dent->coord.write_latency = dent->coord.write_latency +
6f49d1fab777d2 Dave Jiang 2022-12-05   95  					    c.write_latency;
6f49d1fab777d2 Dave Jiang 2022-12-05   96  		dent->coord.read_bandwidth = min_t(int, c.read_bandwidth,
6f49d1fab777d2 Dave Jiang 2022-12-05   97  						   dent->coord.read_bandwidth);
6f49d1fab777d2 Dave Jiang 2022-12-05   98  		dent->coord.write_bandwidth = min_t(int, c.write_bandwidth,
6f49d1fab777d2 Dave Jiang 2022-12-05   99  						    dent->coord.write_bandwidth);
6f49d1fab777d2 Dave Jiang 2022-12-05  100  
6f49d1fab777d2 Dave Jiang 2022-12-05  101  		input.rd_lat = cpu_to_le32(dent->coord.read_latency);
6f49d1fab777d2 Dave Jiang 2022-12-05  102  		input.wr_lat = cpu_to_le32(dent->coord.write_latency);
6f49d1fab777d2 Dave Jiang 2022-12-05  103  		input.rd_bw = cpu_to_le32(dent->coord.read_bandwidth);
6f49d1fab777d2 Dave Jiang 2022-12-05  104  		input.wr_bw = cpu_to_le32(dent->coord.write_bandwidth);
6f49d1fab777d2 Dave Jiang 2022-12-05  105  
6f49d1fab777d2 Dave Jiang 2022-12-05  106  		qos_class = cxl_root->ops->get_qos_class(root_port, &input);
6f49d1fab777d2 Dave Jiang 2022-12-05  107  		if (qos_class < 0)
6f49d1fab777d2 Dave Jiang 2022-12-05  108  			continue;
6f49d1fab777d2 Dave Jiang 2022-12-05  109  
6f49d1fab777d2 Dave Jiang 2022-12-05  110  		dent->qos_class = qos_class;
6f49d1fab777d2 Dave Jiang 2022-12-05  111  	}
6f49d1fab777d2 Dave Jiang 2022-12-05  112  
6f49d1fab777d2 Dave Jiang 2022-12-05  113  	return 0;
6f49d1fab777d2 Dave Jiang 2022-12-05  114  }
6f49d1fab777d2 Dave Jiang 2022-12-05  115  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

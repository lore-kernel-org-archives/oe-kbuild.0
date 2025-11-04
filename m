Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A88630F808
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Nov 2025 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762242456; cv=none; b=ULR2eGPpwC+uk/kdkb0lCiC/Rye0n+ntheQHqOtjAgoJHio9saPeV/ki1AwxoSpcChmGbvBGzd5kQm0NcSG5L8VrHzDYLTLjtkPShyY2UnQGgIX2tsTV09kkn2TQP0tiOrn5q2sdS3+3Vl9RHg6yngHxcS6oIJwIie0B746Aeh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762242456; c=relaxed/simple;
	bh=UUIMqNkx2g13KdUrroWMffiRWx380/VXncGALBENg1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXfB7pHt7/whxBnRbm7y428KN3VsfdRif0ByC4OgDNdqpPqFvyZ+VcSd6OwQKETsO5Yy3bMaFmOK15xGz++Y9DQS1DBDnDeyQlLhUdLvizQWn2aT+4ozVci82Ihr/KHf/sWcATTUGD3mijEfMmFc6iloMQiYTS4KaSGCa1jMcoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+GLaruB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+GLaruB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762242455; x=1793778455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UUIMqNkx2g13KdUrroWMffiRWx380/VXncGALBENg1o=;
  b=M+GLaruBVEjxHjh7GrdyIB+0JZ4JDWkUqOFwJUaHtCwIjRkf442z28d/
   /E576vTLva8GP7/oVbm8DMnJ8Cd/2XhNlPPMSve8HHxoDMDp3dY1h/Vnl
   ET05t0H02y8pgGvAqU1l8d9RgcVyRnMfDwD62sVe6jlieWdFRF2Aj03Zf
   1zKA6EwqvkbbXEYg2jXMqpg5OhWSf5UhP/ZcUMfNWVYcvhRViTepzQgrF
   EaP6fWjfVxutxJxnxY+SKUoS6pubreiGBQnG9a6K+g3AHOVKBuNsfocoh
   liXQPLkMWUJz5I1T0stfIqcmyUJPOmwWkOEWOJUVp2w9CcpfflUVsAGPq
   Q==;
X-CSE-ConnectionGUID: vpuH/9GnQQ2zR2yR3cJeog==
X-CSE-MsgGUID: rx92Vl3QRQSU4q2+t4l6DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75778922"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="75778922"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 23:47:34 -0800
X-CSE-ConnectionGUID: 8R6qds6ZRAGqMzqYCCMakw==
X-CSE-MsgGUID: GaCtcJbSRS6tGFIz7BPRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="210593760"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Nov 2025 23:47:31 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGBlJ-000R48-2H;
	Tue, 04 Nov 2025 07:47:29 +0000
Date: Tue, 4 Nov 2025 15:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_trace_support_v2 48/58]
 drivers/hwtracing/rvtrace/rvtrace-platform.c:83 rvtrace_of_parse_outconns()
 error: we previously assumed 'pdata->outconns' could be null (see line 29)
Message-ID: <202511041509.Nqw6F4Fn-lkp@intel.com>
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
TO: Anup Patel <apatel@ventanamicro.com>
CC: Mayuresh Chitale <mchitale@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v2
head:   41e2962102e2318916f87f0ed7eb297a6b3224d3
commit: 23eb544f3ac1c85fd63c43865b4429cbcfd35e63 [48/58] rvtrace: Initial implementation of driver framework
:::::: branch date: 25 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r071-20251103 (https://download.01.org/0day-ci/archive/20251104/202511041509.Nqw6F4Fn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511041509.Nqw6F4Fn-lkp@intel.com/

smatch warnings:
drivers/hwtracing/rvtrace/rvtrace-platform.c:83 rvtrace_of_parse_outconns() error: we previously assumed 'pdata->outconns' could be null (see line 29)

vim +83 drivers/hwtracing/rvtrace/rvtrace-platform.c

23eb544f3ac1c8 Anup Patel 2025-07-10  14  
23eb544f3ac1c8 Anup Patel 2025-07-10  15  static int rvtrace_of_parse_outconns(struct rvtrace_platform_data *pdata)
23eb544f3ac1c8 Anup Patel 2025-07-10  16  {
23eb544f3ac1c8 Anup Patel 2025-07-10  17  	struct device_node *parent, *ep_node, *rep_node, *rdev_node;
23eb544f3ac1c8 Anup Patel 2025-07-10  18  	struct rvtrace_connection *conn;
23eb544f3ac1c8 Anup Patel 2025-07-10  19  	struct of_endpoint ep, rep;
23eb544f3ac1c8 Anup Patel 2025-07-10  20  	int ret = 0, i = 0;
23eb544f3ac1c8 Anup Patel 2025-07-10  21  
23eb544f3ac1c8 Anup Patel 2025-07-10  22  	parent = of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
23eb544f3ac1c8 Anup Patel 2025-07-10  23  	if (!parent)
23eb544f3ac1c8 Anup Patel 2025-07-10  24  		return 0;
23eb544f3ac1c8 Anup Patel 2025-07-10  25  
23eb544f3ac1c8 Anup Patel 2025-07-10  26  	pdata->nr_outconns = of_graph_get_endpoint_count(parent);
23eb544f3ac1c8 Anup Patel 2025-07-10  27  	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
23eb544f3ac1c8 Anup Patel 2025-07-10  28  				       sizeof(*pdata->outconns), GFP_KERNEL);
23eb544f3ac1c8 Anup Patel 2025-07-10 @29  	if (!pdata->outconns) {
23eb544f3ac1c8 Anup Patel 2025-07-10  30  		ret = -ENOMEM;
23eb544f3ac1c8 Anup Patel 2025-07-10  31  		goto done;
23eb544f3ac1c8 Anup Patel 2025-07-10  32  	}
23eb544f3ac1c8 Anup Patel 2025-07-10  33  
23eb544f3ac1c8 Anup Patel 2025-07-10  34  	for_each_endpoint_of_node(parent, ep_node) {
23eb544f3ac1c8 Anup Patel 2025-07-10  35  		conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
23eb544f3ac1c8 Anup Patel 2025-07-10  36  		if (!conn) {
23eb544f3ac1c8 Anup Patel 2025-07-10  37  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  38  			ret = -ENOMEM;
23eb544f3ac1c8 Anup Patel 2025-07-10  39  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  40  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  41  
23eb544f3ac1c8 Anup Patel 2025-07-10  42  		ret = of_graph_parse_endpoint(ep_node, &ep);
23eb544f3ac1c8 Anup Patel 2025-07-10  43  		if (ret) {
23eb544f3ac1c8 Anup Patel 2025-07-10  44  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  45  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  46  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  47  
23eb544f3ac1c8 Anup Patel 2025-07-10  48  		rep_node = of_graph_get_remote_endpoint(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  49  		if (!rep_node) {
23eb544f3ac1c8 Anup Patel 2025-07-10  50  			ret = -ENODEV;
23eb544f3ac1c8 Anup Patel 2025-07-10  51  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  52  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  53  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  54  		rdev_node = of_graph_get_port_parent(rep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  55  
23eb544f3ac1c8 Anup Patel 2025-07-10  56  		ret = of_graph_parse_endpoint(rep_node, &rep);
23eb544f3ac1c8 Anup Patel 2025-07-10  57  		if (ret) {
23eb544f3ac1c8 Anup Patel 2025-07-10  58  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  59  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  60  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  61  
23eb544f3ac1c8 Anup Patel 2025-07-10  62  		conn->src_port = ep.port;
23eb544f3ac1c8 Anup Patel 2025-07-10  63  		conn->src_fwnode = dev_fwnode(pdata->dev);
23eb544f3ac1c8 Anup Patel 2025-07-10  64  		/* The 'src_comp' is set by rvtrace_register_component() */
23eb544f3ac1c8 Anup Patel 2025-07-10  65  		conn->src_comp = NULL;
23eb544f3ac1c8 Anup Patel 2025-07-10  66  		conn->dest_port = rep.port;
23eb544f3ac1c8 Anup Patel 2025-07-10  67  		conn->dest_fwnode = of_fwnode_handle(rdev_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  68  		fwnode_handle_get(conn->dest_fwnode);
23eb544f3ac1c8 Anup Patel 2025-07-10  69  		conn->dest_comp = rvtrace_find_by_fwnode(conn->dest_fwnode);
23eb544f3ac1c8 Anup Patel 2025-07-10  70  		if (!conn->dest_comp) {
23eb544f3ac1c8 Anup Patel 2025-07-10  71  			ret = -EPROBE_DEFER;
23eb544f3ac1c8 Anup Patel 2025-07-10  72  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  73  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  74  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  75  
23eb544f3ac1c8 Anup Patel 2025-07-10  76  		pdata->outconns[i] = conn;
23eb544f3ac1c8 Anup Patel 2025-07-10  77  		i++;
23eb544f3ac1c8 Anup Patel 2025-07-10  78  	}
23eb544f3ac1c8 Anup Patel 2025-07-10  79  
23eb544f3ac1c8 Anup Patel 2025-07-10  80  done:
23eb544f3ac1c8 Anup Patel 2025-07-10  81  	if (ret) {
23eb544f3ac1c8 Anup Patel 2025-07-10  82  		for (i = 0; i < pdata->nr_outconns; i++) {
23eb544f3ac1c8 Anup Patel 2025-07-10 @83  			conn = pdata->outconns[i];
23eb544f3ac1c8 Anup Patel 2025-07-10  84  			if (conn && conn->dest_fwnode)
23eb544f3ac1c8 Anup Patel 2025-07-10  85  				fwnode_handle_put(conn->dest_fwnode);
23eb544f3ac1c8 Anup Patel 2025-07-10  86  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  87  	}
23eb544f3ac1c8 Anup Patel 2025-07-10  88  	of_node_put(parent);
23eb544f3ac1c8 Anup Patel 2025-07-10  89  	return ret;
23eb544f3ac1c8 Anup Patel 2025-07-10  90  }
23eb544f3ac1c8 Anup Patel 2025-07-10  91  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

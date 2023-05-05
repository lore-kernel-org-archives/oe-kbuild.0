Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B321C8C1
	for <oe-kbuild@lists.linux.dev>; Fri,  5 May 2023 20:33:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso22467335e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 05 May 2023 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683318802; x=1685910802;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWqJ/3jY3+vrvCck23NKi+QppinQ/nAYGWrW2QXPiDw=;
        b=uOZ64c7vBkt7hssDX2u9n90ihUQpi7mkFY1A5EHSWtbLObdX2ArIYDeCRfkzrV63BI
         XPSBBLHONcmrVng9yLkw2DX51DQB1KhsaoZQCRs4/+CPdjtYuzlBHxqpfi9LZNzfQ55c
         AuZ66Zp8Nd+W0cLRbkJy3vglEp9guhVQIUg/2r7XJlFuqray6FEPeWQTjp2T5SYq/Rt8
         Q0FIvXW0AW12+1yARVLEoP/7RI5Dm47E7FiQuO9iXdWObX80nzSeZj9oCCpnfYUKgwk3
         j959LOZSm872NtwqpnMmj+pUlSpK+BOUweXW0+OOrUXsXT2jDmNIHIiGFJScaX1kcSYa
         Ps9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683318802; x=1685910802;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWqJ/3jY3+vrvCck23NKi+QppinQ/nAYGWrW2QXPiDw=;
        b=hfmPnwx23B+Plpk+y+rIxLs62ya1e6ktSsqLlyRFav7jT89o6SD95K2o+rAkbu1Wci
         wXuUzCBRPQTwXsIe/LAglyDJtTtyciLTLMXYukGrssiCglXvK0ipXbxuF4wwuQbQ/n5I
         7+Obbm80LxaShJChlX9CuzkiFPM2LuTwgsi++FwDXenRMLxXdW+EWkyGnwryP4GpQlv9
         ZhB6qCH+J0Y975zA8xHqNkBAPgZjb8FsEK3r4olQGD02y33lQBIW/QZvsci5v20kvhs2
         T5XiZ0OuId6oq9OFw9wAhCed6iRxF4iXPACcMPg88+aqv3GPwC8MU1jhLI0sjnOKnBCQ
         mkpw==
X-Gm-Message-State: AC+VfDwdgwt+LxFBoDVzd308swYQgnEZ40Nc9c8/YpCutQZeMoqCkqOm
	7JipKDGKXIJA349IH7969uCD85G4FHLmnEXjaMc=
X-Google-Smtp-Source: ACHHUZ7C83BK2/nLW3UUcxDKb9n1fouxz3rCVH+tUz9gMaA4ltRwZ7DnvoboQw6KrJkUclyxqxcBxg==
X-Received: by 2002:adf:e0ca:0:b0:306:3436:568a with SMTP id m10-20020adfe0ca000000b003063436568amr2282613wri.43.1683318802325;
        Fri, 05 May 2023 13:33:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q14-20020a7bce8e000000b003f182a10106sm8954461wmj.8.2023.05.05.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 13:33:20 -0700 (PDT)
Date: Fri, 5 May 2023 23:33:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 22/28] drivers/cxl/port.c:88
 cxl_port_perf_data_calculate() error: we previously assumed 'cxl_root->ops'
 could be null (see line 88)
Message-ID: <f813b363-1c1f-4d06-b8a1-fbba00b2d33b@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   4cc79fc6093484664713b47ccd4b4cff326bca86
commit: 90a255f34829f50adb9fbfcd8e32444b188074e3 [22/28] cxl: Compute the entire CXL path latency and bandwidth data
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230506/202305060238.eVFtMQO6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305060238.eVFtMQO6-lkp@intel.com/

smatch warnings:
drivers/cxl/port.c:88 cxl_port_perf_data_calculate() error: we previously assumed 'cxl_root->ops' could be null (see line 88)

vim +88 drivers/cxl/port.c

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
                                                     ^^^^^^^^^^^^^
Should this probably be || instead of &&.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B751F03C9
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 13:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736257379; cv=none; b=Bj2i1iZT3lEb+NJPLsxH8pAsMLf3AeN8xldcYZgvK9RBS1MxEfwoNqpeyJH+y2lRKNyRJiMTXuBUSTkeUIUZouZTU6JiY5uWEjRVprXCiDj3TacT4D7a+Cnn5l9aj8cPGYzkPui5gFKf5wFHf9sNt/jIABp10kj4A7kXzLi6K5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736257379; c=relaxed/simple;
	bh=QaUQtM9uMlBbOEmIXtazKMucNJl5HPdug4+cShH0spM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X2Jzkv/DNYLPzIJJ0WeedbDgbHW4XSty/muKo5tGSS0jyOCgr9p0eGCdiPWdsawkDoI8JHasLGKswE78H2CnHpcTl4SEAXBhCNWdZJaVSCKjCpD3mVM5gaXeJiOvZ47LzpkD3s11s7s1yWyeJZOEjee7Pi5eI83KMtbpAcsiTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gqr4tkBB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gqr4tkBB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361815b96cso103791305e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 07 Jan 2025 05:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736257373; x=1736862173; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=onAt8aOtkuJ26my0YZCApmlbSQQdFZZrSOGwxmvSexo=;
        b=gqr4tkBB/0zTPgE+lYUO7GE1cplpYSjBeD6KQNm8B0v2JcIHOCyVhp+r40sF8uqEVD
         f/ljoADD9dHRr/f/8ubyM5PTqbf0GQECRIbOJx+nxDV0MDVOWem56kxsuP7PUIyrDpEa
         0gd3dQ6SS4xn73H0JzvJgq9P0JtEiIQzBD6Jgnxwtv1PdPg0zf6PefrOI54yueKu2y3q
         My1FzFGlJx+d2K7WRJSxyzdnA8zE2DYCCNWj2IxyXn7JohD7VyTcMQOxzjYMLATSWzZ5
         g63n2pKOqhkwy1kp4ksgf2isNi/DTqa1H12IvLIkAYu6uzmGKJFtIMKz2KhOx69sTEcO
         N8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736257373; x=1736862173;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onAt8aOtkuJ26my0YZCApmlbSQQdFZZrSOGwxmvSexo=;
        b=gcZFxM7cyUMgjanf5agnxssGGeLokHMITsE4fOIZz18fJMn81OlzeCxQSNa6jRzgOM
         kzQfEhR8xUjeV+9i94rw5o+ulTOsSvQTW0QkgzSyOQOeT9xdTQxNKIfLb0kbonkycnhl
         tGd5n4xgJ6Hnv9sTDfGcrvvBQ3u6lgg2MsjxNaFvYOkqLH65J5j/IPgW04r3zFh37Xqm
         dToL/EpumDWerMyLrPXiuHpmyvE1vzxxf+meF1DHYMbKPp/a0EAPDj++ovQzmDRePJPQ
         Ty9FxO1qw9VyPU24TcndzvD8wv7dp+XLA10dWiYCwd2OlW2Ms0BFmvv5FugiqyZXPBSN
         dZNA==
X-Gm-Message-State: AOJu0YzmIJMzA8IhTIRcIJJ7TcqdgA0fN0DqpGzPYK31aWFcvZwGSEij
	d+vFxjhfjjs3DZ2Ac9Ynwi9og07UftRCFuduSD5hO5PSZ0hdEmrB73yBqypuApF+4WGh7x604K+
	k
X-Gm-Gg: ASbGncswZiJhU2OV0nnIAY84ML/mDXJtp5cTz7dzKQDiD5bwck/2l0SBc9DA2RC8Lo5
	MOBNWNtcLa9442BYokuXWSyVP12ScIZNn0JdL5itYUhwKLyx9USsVnWYhgsTRdeeTJ+QWPcVM99
	l5FwFWp/W5TkJzqa5wXyUcOylPxEfANI1qyDp31qBJz6Guu3EZXpzv/jHhrE2z4vdEWS7iqQFel
	ljXeWTRi2KcyqrHBSxtbFOogLYIZfMjGLsncuZJGzHoK5nG9p26RJ54ZvAQLA==
X-Google-Smtp-Source: AGHT+IFSPn9F9U7bd3AJmxaxMdIjOgIZgLhron0WQQStoOvcX/oiUOOF/9dvBO+9lEABkyHrUSKbzQ==
X-Received: by 2002:a05:600c:68d7:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-4366d357401mr497250675e9.29.1736257372976;
        Tue, 07 Jan 2025 05:42:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832ec4sm49809507f8f.26.2025.01.07.05.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:42:52 -0800 (PST)
Date: Tue, 7 Jan 2025 16:42:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 203/203]
 drivers/cxl/core/pci.c:381 __cxl_hdm_decode_init() warn: signedness bug
 returning '(-6)'
Message-ID: <c9541395-36f7-427c-9ff4-703738e0e9c8@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   fd2a406d90aed5daa59f286867063b9adba644cb
commit: 031217128990d7f0ab8c46db1afb3cf1e075fd29 [203/203] cxl/pci: Fix disabling memory if DVSEC CXL Range does not match a CFMWS window
config: i386-randconfig-141-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071833.U0ecCRi2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501071833.U0ecCRi2-lkp@intel.com/

smatch warnings:
drivers/cxl/core/pci.c:381 __cxl_hdm_decode_init() warn: signedness bug returning '(-6)'

vim +381 drivers/cxl/core/pci.c

a12562bb707760 Dan Williams   2022-05-18  333  static bool __cxl_hdm_decode_init(struct cxl_dev_state *cxlds,
fcfbc93cc33ec6 Dan Williams   2022-05-18  334  				  struct cxl_hdm *cxlhdm,
a12562bb707760 Dan Williams   2022-05-18  335  				  struct cxl_endpoint_dvsec_info *info)
a12562bb707760 Dan Williams   2022-05-18  336  {
fcfbc93cc33ec6 Dan Williams   2022-05-18  337  	void __iomem *hdm = cxlhdm->regs.hdm_decoder;
34e37b4c432cd0 Dan Williams   2022-05-20  338  	struct cxl_port *port = cxlhdm->port;
34e37b4c432cd0 Dan Williams   2022-05-20  339  	struct device *dev = cxlds->dev;
34e37b4c432cd0 Dan Williams   2022-05-20  340  	struct cxl_port *root;
34e37b4c432cd0 Dan Williams   2022-05-20  341  	int i, rc, allowed;
a12562bb707760 Dan Williams   2022-05-18  342  	u32 global_ctrl;
a12562bb707760 Dan Williams   2022-05-18  343  
fcfbc93cc33ec6 Dan Williams   2022-05-18  344  	global_ctrl = readl(hdm + CXL_HDM_DECODER_CTRL_OFFSET);
34e37b4c432cd0 Dan Williams   2022-05-20  345  
34e37b4c432cd0 Dan Williams   2022-05-20  346  	/*
34e37b4c432cd0 Dan Williams   2022-05-20  347  	 * If the HDM Decoder Capability is already enabled then assume
34e37b4c432cd0 Dan Williams   2022-05-20  348  	 * that some other agent like platform firmware set it up.
34e37b4c432cd0 Dan Williams   2022-05-20  349  	 */
34e37b4c432cd0 Dan Williams   2022-05-20  350  	if (global_ctrl & CXL_HDM_DECODER_ENABLE) {
34e37b4c432cd0 Dan Williams   2022-05-20  351  		rc = devm_cxl_enable_mem(&port->dev, cxlds);
34e37b4c432cd0 Dan Williams   2022-05-20  352  		if (rc)
34e37b4c432cd0 Dan Williams   2022-05-20  353  			return false;
34e37b4c432cd0 Dan Williams   2022-05-20  354  		return true;
34e37b4c432cd0 Dan Williams   2022-05-20  355  	}
34e37b4c432cd0 Dan Williams   2022-05-20  356  
34e37b4c432cd0 Dan Williams   2022-05-20  357  	root = to_cxl_port(port->dev.parent);
34e37b4c432cd0 Dan Williams   2022-05-20  358  	while (!is_cxl_root(root) && is_cxl_port(root->dev.parent))
34e37b4c432cd0 Dan Williams   2022-05-20  359  		root = to_cxl_port(root->dev.parent);
34e37b4c432cd0 Dan Williams   2022-05-20  360  	if (!is_cxl_root(root)) {
34e37b4c432cd0 Dan Williams   2022-05-20  361  		dev_err(dev, "Failed to acquire root port for HDM enable\n");
34e37b4c432cd0 Dan Williams   2022-05-20  362  		return false;
34e37b4c432cd0 Dan Williams   2022-05-20  363  	}
34e37b4c432cd0 Dan Williams   2022-05-20  364  
34e37b4c432cd0 Dan Williams   2022-05-20  365  	for (i = 0, allowed = 0; info->mem_enabled && i < info->ranges; i++) {
34e37b4c432cd0 Dan Williams   2022-05-20  366  		struct device *cxld_dev;
34e37b4c432cd0 Dan Williams   2022-05-20  367  
34e37b4c432cd0 Dan Williams   2022-05-20  368  		cxld_dev = device_find_child(&root->dev, &info->dvsec_range[i],
34e37b4c432cd0 Dan Williams   2022-05-20  369  					     dvsec_range_allowed);
34e37b4c432cd0 Dan Williams   2022-05-20  370  		if (!cxld_dev) {
34e37b4c432cd0 Dan Williams   2022-05-20  371  			dev_dbg(dev, "DVSEC Range%d denied by platform\n", i);
34e37b4c432cd0 Dan Williams   2022-05-20  372  			continue;
34e37b4c432cd0 Dan Williams   2022-05-20  373  		}
34e37b4c432cd0 Dan Williams   2022-05-20  374  		dev_dbg(dev, "DVSEC Range%d allowed by platform\n", i);
34e37b4c432cd0 Dan Williams   2022-05-20  375  		put_device(cxld_dev);
34e37b4c432cd0 Dan Williams   2022-05-20  376  		allowed++;
34e37b4c432cd0 Dan Williams   2022-05-20  377  	}
34e37b4c432cd0 Dan Williams   2022-05-20  378  
031217128990d7 Robert Richter 2024-02-16  379  	if (!allowed && info->mem_enabled) {
031217128990d7 Robert Richter 2024-02-16  380  		dev_err(dev, "Range register decodes outside platform defined CXL ranges.\n");
031217128990d7 Robert Richter 2024-02-16 @381  		return -ENXIO;

return false;

34e37b4c432cd0 Dan Williams   2022-05-20  382  	}
a12562bb707760 Dan Williams   2022-05-18  383  
a12562bb707760 Dan Williams   2022-05-18  384  	/*
a12562bb707760 Dan Williams   2022-05-18  385  	 * Per CXL 2.0 Section 8.1.3.8.3 and 8.1.3.8.4 DVSEC CXL Range 1 Base
a12562bb707760 Dan Williams   2022-05-18  386  	 * [High,Low] when HDM operation is enabled the range register values
a12562bb707760 Dan Williams   2022-05-18  387  	 * are ignored by the device, but the spec also recommends matching the
a12562bb707760 Dan Williams   2022-05-18  388  	 * DVSEC Range 1,2 to HDM Decoder Range 0,1. So, non-zero info->ranges
a12562bb707760 Dan Williams   2022-05-18  389  	 * are expected even though Linux does not require or maintain that
34e37b4c432cd0 Dan Williams   2022-05-20  390  	 * match. If at least one DVSEC range is enabled and allowed, skip HDM
34e37b4c432cd0 Dan Williams   2022-05-20  391  	 * Decoder Capability Enable.
a12562bb707760 Dan Williams   2022-05-18  392  	 */
34e37b4c432cd0 Dan Williams   2022-05-20  393  	if (info->mem_enabled)
fcfbc93cc33ec6 Dan Williams   2022-05-18  394  		return false;
a12562bb707760 Dan Williams   2022-05-18  395  
34e37b4c432cd0 Dan Williams   2022-05-20  396  	rc = devm_cxl_enable_hdm(&port->dev, cxlhdm);
34e37b4c432cd0 Dan Williams   2022-05-20  397  	if (rc)
34e37b4c432cd0 Dan Williams   2022-05-20  398  		return false;
34e37b4c432cd0 Dan Williams   2022-05-20  399  
34e37b4c432cd0 Dan Williams   2022-05-20  400  	rc = devm_cxl_enable_mem(&port->dev, cxlds);
34e37b4c432cd0 Dan Williams   2022-05-20  401  	if (rc)
34e37b4c432cd0 Dan Williams   2022-05-20  402  		return false;
a12562bb707760 Dan Williams   2022-05-18  403  
fcfbc93cc33ec6 Dan Williams   2022-05-18  404  	return true;
a12562bb707760 Dan Williams   2022-05-18  405  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ADE39CD00
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 08:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352242; cv=none; b=X0b1s995JcVNQuYdpba/AIEkjszWJZwWxmIgm65EYGTal6nfPkdLh0LBxZlVsCPgAOSMhXLk8hlZgGLwOI7s0R8a6ho4NPSTPtgM4PvXVoN/zuOolKcJ8dgr2pfsVj3+32In04urf3qC9AYBsR2ZMYxCHNRg6Uc6xDGqPK5yIqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352242; c=relaxed/simple;
	bh=rvDpV0nLPxj0eiudfzb4xmoiYPnvvVwSAPek9bEsBcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SE5JbqLTgjv0lHAOCyuljJhRaacmGxEGdeLjF2s4m3k3JMpSvbio96yvhld4l4yKAaA+dXTbVru2+Y9EOqhJHq1WYT8QnwwuUamh4raskscuoaiNKlysVnzdJpSctEXL2vGKVsbBmboSn+2QVWMaBI6V2vh7ipYzFMM5fj1ac/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKEWMCCH; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKEWMCCH"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6acc2a10023so459081eaf.0
        for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 01:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786352239; x=1786957039; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQIOq1+0qw6L2vE4HtRjuAmoJ3l55m0t8aWFGP9VehY=;
        b=QKEWMCCHeHYAcY2M35N/DeqWVdLZrp4J/hHHYDLPS3KnL4w/MFfaU2Yk+T7TBonU48
         nV4CTIX5nTUkCcGw2wZVp2SRfMifInVP7M5eZ8F5E3NHPfIefmToUqd2M7xggPQW1NUL
         ubfipl5Xhjbba11wMDY3IzF6HX+vaavmHTVKxBnC65jS1PSusYoo7WNsXbuNArjAUPHq
         HWkZu74ctzJT3VSixBuuxah4MDsXbEOGsdmDCwXELzFMATis7Ir9uGFf+0N8TIUO7a+M
         zt/spKx8690APFB9EgVY7gjiVicCUU/x7KhmZ6C8gn4P3jb7v7egeAvn5BkVq78zoNSt
         xSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352239; x=1786957039;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQIOq1+0qw6L2vE4HtRjuAmoJ3l55m0t8aWFGP9VehY=;
        b=p4Fvgr+h0wwU46+EKGJBTOyBalz5d2kGXiriQqS4Hn65UhM4O+/bzKmgbvl+eSb9Uy
         V73FyWxA55ErmN5N7XWyf4nKuvzNsH66u0vDJbPlLwdG17OKQkuMVNN0H4rtf5vifLeR
         S996vPB66p0rotkVq4ysVDLHvlOzHx02U4q72KrilMGH+B7LY4+AmEBNzI8cAVfobSDa
         Zc6bVXU2xZcQYKB0on3XCEtupLJNQXnw3LooHCqP3M6w1j8o69Lo1LE84BprCCK40ZDH
         FitM37nV3synYU0GKOpkhAizNe6BOYWiOLnjB2B9/FbYq5axZdl6ZpirAmUdyC9gHNz6
         FczQ==
X-Gm-Message-State: AOJu0Ywc/l4IaZG/3DoSfAP3BaxWLX6VqTtRn7zl6ogslq+hGbh1vhaM
	LevqpjZgr7tR9jgrdLSE1rhWTN7q4qh3u+QpPCcdSzPy0zPJLWoP44jPRN3QpKyZ+JM=
X-Gm-Gg: AR+sD10BW5/p39AVl1eiXwPqtVN8GOpljNmzb55fsrLz/gn2f0OFzg0eJ5FsqfGW/zA
	FVw4HqhkjafW4oErUUMAoxBhRIiRa/kTX6LDepbCWDG6lxLLDStoj3AbK1Yj0Ye1u1Uw7pj7JIv
	oITkwkOKKDIYVDD92PXQhZ3gY4sYJxgnyQ9X5CJZtrdhYtwTF+bCLETfR+Ckpq7mqlcS+SHMm6I
	/u31gpyyjcv9yI82Hs5iL5CEH1JuVNTAZ/fKnV2/F5tupd9pETM3JKk/ddhuJB/gX5mYDgz2G34
	6tlKdp+XB2TJFIH4MkVKHrVy/DlBK6/EGhncYHFEhXw8Wv1TaGeibPSLGhclS/DwNyE/2TE+imA
	5XAuKYqDpKo6pMBO0bTZ7hVph8yyc2fJor2BBL8BMJgnJ/VBollDdVuzf0e4nZfx2FBga0k/dh5
	2xjAlN+XxKlny34Rb3iPUr+aUPVwZWfw1A0jI3ZDVqJ3j0hMzyDM8=
X-Received: by 2002:a05:6820:4de7:b0:6a3:81a2:746f with SMTP id 006d021491bc7-6ae97084924mr21869081eaf.33.1786352239213;
        Mon, 10 Aug 2026 01:57:19 -0700 (PDT)
Received: from localhost ([45.86.208.9])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02be8ede0sm9233194eaf.12.2026.08.10.01.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:57:17 -0700 (PDT)
Date: Mon, 10 Aug 2026 11:57:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V8 22/30]
 drivers/firmware/arm_scmi/driver.c:2342 scmi_alloc_init_protocol_instance()
 error: we previously assumed 'pi' could be null (see line 2292)
Message-ID: <202608101250.FcZovEGe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260810085710.SY6oz2Dy9yD-fc7dlIhb0cYQ8VYN8oQI3aVJ4IQzG8I@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V8
head:   bc3b27dd68cfc244c1e7717b72f88b2dfcb28d2e
commit: 794ab60bbda9339aa782a6ce4a77e4e496538fb9 [22/30] firmware: arm_scmi: Add common per-protocol debugfs support
config: arm-randconfig-r071-20260809 (https://download.01.org/0day-ci/archive/20260810/202608101250.FcZovEGe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608101250.FcZovEGe-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/driver.c:2342 scmi_alloc_init_protocol_instance() error: we previously assumed 'pi' could be null (see line 2292)

vim +/pi +2342 drivers/firmware/arm_scmi/driver.c

48dc16e2e52ca38 Cristian Marussi 2021-03-16  2275  static struct scmi_protocol_instance *
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2276  scmi_alloc_init_protocol_instance(struct scmi_info *info,
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2277  				  const struct scmi_protocol *proto)
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2278  {
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2279  	int ret = -ENOMEM;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2280  	void *gid;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2281  	struct scmi_protocol_instance *pi;
f0e73cee26dd3ed Cristian Marussi 2021-03-16  2282  	const struct scmi_handle *handle = &info->handle;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2283  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2284  	/* Protocol specific devres group */
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2285  	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2286  	if (!gid) {
fc110108b98305e Cristian Marussi 2024-04-18  2287  		scmi_protocol_put(proto);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2288  		goto out;
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2289  	}
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2290  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2291  	pi = devm_kzalloc(handle->dev, sizeof(*pi), GFP_KERNEL);
48dc16e2e52ca38 Cristian Marussi 2021-03-16 @2292  	if (!pi)
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2293  		goto clean;

pi is NULL

48dc16e2e52ca38 Cristian Marussi 2021-03-16  2294  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2295  	pi->gid = gid;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2296  	pi->proto = proto;
d7b6cc563a60076 Cristian Marussi 2021-03-16  2297  	pi->handle = handle;
d7b6cc563a60076 Cristian Marussi 2021-03-16  2298  	pi->ph.dev = handle->dev;
a4a20b0975dc7b1 Cristian Marussi 2021-03-16  2299  	pi->ph.xops = &xfer_ops;
5c873d120d8676b Cristian Marussi 2022-03-30  2300  	pi->ph.hops = &helpers_ops;
d7b6cc563a60076 Cristian Marussi 2021-03-16  2301  	pi->ph.set_priv = scmi_set_protocol_priv;
d7b6cc563a60076 Cristian Marussi 2021-03-16  2302  	pi->ph.get_priv = scmi_get_protocol_priv;
07e4ec9fe678323 Cristian Marussi 2025-02-28  2303  	pi->ph.instance_notifier_register = scmi_register_instance_notifier;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2304  	refcount_set(&pi->users, 1);
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2305  
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2306  	/*
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2307  	 * Initialize effectively used protocol version performing any
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2308  	 * possibly needed negotiations.
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2309  	 */
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2310  	scmi_protocol_version_initialize(handle->dev, pi);
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2311  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2312  	/* proto->init is assured NON NULL by scmi_protocol_register */
a4a20b0975dc7b1 Cristian Marussi 2021-03-16  2313  	ret = pi->proto->instance_init(&pi->ph);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2314  	if (ret)
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2315  		goto clean;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2316  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2317  	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2318  			GFP_KERNEL);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2319  	if (ret != proto->id)
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2320  		goto clean;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2321  
533c7095b1ff927 Cristian Marussi 2021-03-16  2322  	/*
533c7095b1ff927 Cristian Marussi 2021-03-16  2323  	 * Warn but ignore events registration errors since we do not want
533c7095b1ff927 Cristian Marussi 2021-03-16  2324  	 * to skip whole protocols if their notifications are messed up.
533c7095b1ff927 Cristian Marussi 2021-03-16  2325  	 */
533c7095b1ff927 Cristian Marussi 2021-03-16  2326  	if (pi->proto->events) {
533c7095b1ff927 Cristian Marussi 2021-03-16  2327  		ret = scmi_register_protocol_events(handle, pi->proto->id,
b9f7fd907c38a38 Cristian Marussi 2021-03-16  2328  						    &pi->ph,
533c7095b1ff927 Cristian Marussi 2021-03-16  2329  						    pi->proto->events);
533c7095b1ff927 Cristian Marussi 2021-03-16  2330  		if (ret)
533c7095b1ff927 Cristian Marussi 2021-03-16  2331  			dev_warn(handle->dev,
533c7095b1ff927 Cristian Marussi 2021-03-16  2332  				 "Protocol:%X - Events Registration Failed - err:%d\n",
533c7095b1ff927 Cristian Marussi 2021-03-16  2333  				 pi->proto->id, ret);
533c7095b1ff927 Cristian Marussi 2021-03-16  2334  	}
533c7095b1ff927 Cristian Marussi 2021-03-16  2335  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2336  	devres_close_group(handle->dev, pi->gid);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2337  	dev_dbg(handle->dev, "Initialized protocol: 0x%X\n", pi->proto->id);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2338  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2339  	return pi;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2340  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2341  clean:
794ab60bbda9339 Cristian Marussi 2023-03-15 @2342  	debugfs_remove_recursive(pi->dbg);
                                                                                 ^^^^^^^
Dereferenced.

f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2343  	/* Take care to put the protocol module's owner before releasing all */
fc110108b98305e Cristian Marussi 2024-04-18  2344  	scmi_protocol_put(proto);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2345  	devres_release_group(handle->dev, gid);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2346  out:
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2347  	return ERR_PTR(ret);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2348  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


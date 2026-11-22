Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316172;
	b=zgpY6+m6cByyQx1RelmDjK76N4eUDX+fWc7DJGesIBV83f1/rQa8PpMKMwITol2GCm9x
	 98eeRPuRIzYQvtUOzOf+An/eQocHM3ketilo0agoF6XkEcv/0A6+jd5vG2t/TPbaB/rOw
	 GhLzzQSLZYSk4sGQ9Te1QSh4BDg60aRyU0m/BlRSql7Kx12UTzmPKBrCKjXkouaNu0MGk
	 NGN61KRQzTbeqaHZtzpwT7FeeAjr7UJX0WKEMuj3ErXnBs3A01oP9YIHwpUYaxzhuRc3u
	 8ItpSe4nfwDnsePy6rPtbrtKXF21qjO5Gxzpd/fBmZok6apC31+bOLz3ISaFONc6bJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316172;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AXf+cCARlw3nCoKcbkUxRA8xfyAJkp0olB3ZLDd6O8A=;
	b=OgNGAkYdFIvhMBvMLh0UHRLOLBjnr9+IBWu2Ee8GULbMW0zksRsVNIlyGt/n3KZykp55
	 Ea37iep7pbRXy1tBbAEQL0B9+4Q/imodM3vi4XxHW4ePTjLyXNxCiGmy/ACOdhfBHNxZL
	 pbS/cnkD+s4uWGAqwlznSPgnvcZfhOFvQSdKMsgc35Evd2vnZWh70WqYmmYygG6vq/rZz
	 8AnuBcHv+rPiGS5wDkKVa/73JWrQPbf2AqQr7jeF45xUg60aWNYVYXqNI33irKseF+Jc/
	 PBSzGq1L5i0oSpxptMuwtTdKwtqAZp3EOhGOIPR1eSl9Enlt61on5pB8V10K5s7CZ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0NPNKDN;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760A606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 02:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B760A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0NPNKDN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795316171; x=1826852171;
  h=date:from:to:cc:subject:message-id;
  bh=wrD3qy4PkUbx7hMH7OMhKhAX4PVCNhJQG+a8OnkYyLM=;
  b=M0NPNKDN6P0ft79XYHIsS5uuE/W2ESqU+DAhLMaijw5bvuEgm4wAU276
   omjZn0krvSl1Zm/UodmwZAOsMwby+SBGnyYysanHSWf1S7zR8cVyRW0ZH
   /KOOtuuTxXaNr2PjquJ+3I7bKx66xieZ7Z8l+xB583Q+3z6OIW1FPvwFD
   kQqmc4cFhyXPOwIgbDGLmuVbsxsUMejxfAGdETMM9YbWVb93sHOCZx5kF
   WccfIAUtwASZeHOcGb1mUJRMJfHLpQGoukoUrhkXr3z0D/EdCVlsT6ljl
   JLU6oMwa25aCKQARv/kqeP2+gHghIJ+CKnkVSXlIj9aLuKBeZinMhYGYb
   A==;
X-CSE-ConnectionGUID: yFMbEZylRoaGpwCZOPy1Rg==
X-CSE-MsgGUID: ohlpX/kgRrOobQwM9NEfjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4050237"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4050237"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 18:56:11 -0800
X-CSE-ConnectionGUID: WmkM9pCbRCirSh3UDYZqgw==
X-CSE-MsgGUID: pEt9o2tmSka8qogf5r303A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11090728"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2026 18:56:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUxkM-000000004Td-3s8e;
	Sun, 22 Nov 2026 02:56:06 +0000
Date: Sun, 22 Nov 2026 03:56:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cris:scmi_telemetry_ng_V16 21/31]
 drivers/firmware/arm_scmi/driver.c:2405 scmi_alloc_init_protocol_instance()
 error: we previously assumed 'pi' could be null (see line 2354)
Message-ID: <20261122034843.dsyXusbp-lkp@intel.com>
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
TO: Cristian Marussi <cristian.marussi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V16
head:   2583f5d73857467989b273f5a1a2f7bee48debd9
commit: 7364fc3b21577a5ff21f268186e0deefdae79d4c [21/31] firmware: arm_scmi: Add common per-protocol debugfs support
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: csky-randconfig-2200-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122034843.dsyXusbp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261122034843.dsyXusbp-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/driver.c:2405 scmi_alloc_init_protocol_instance() error: we previously assumed 'pi' could be null (see line 2354)

vim +/pi +2405 drivers/firmware/arm_scmi/driver.c

0fac05fdd9afff Cristian Marussi 2025-12-27  2319  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2320  /**
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2321   * scmi_alloc_init_protocol_instance  - Allocate and initialize a protocol
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2322   * instance descriptor.
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2323   * @info: The reference to the related SCMI instance.
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2324   * @proto: The protocol descriptor.
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2325   *
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2326   * Allocate a new protocol instance descriptor, using the provided @proto
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2327   * description, against the specified SCMI instance @info, and initialize it;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2328   * all resources management is handled via a dedicated per-protocol devres
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2329   * group.
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2330   *
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2331   * Context: Assumes to be called with @protocols_mtx already acquired.
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2332   * Return: A reference to a freshly allocated and initialized protocol instance
f5800e0bf6f9b7 Cristian Marussi 2021-03-16  2333   *	   or ERR_PTR on failure. On failure the @proto reference is at first
f5800e0bf6f9b7 Cristian Marussi 2021-03-16  2334   *	   put using @scmi_protocol_put() before releasing all the devres group.
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2335   */
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2336  static struct scmi_protocol_instance *
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2337  scmi_alloc_init_protocol_instance(struct scmi_info *info,
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2338  				  const struct scmi_protocol *proto)
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2339  {
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2340  	int ret = -ENOMEM;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2341  	void *gid;
7364fc3b21577a Cristian Marussi 2023-03-15  2342  	struct dentry *dbg;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2343  	struct scmi_protocol_instance *pi;
f0e73cee26dd3e Cristian Marussi 2021-03-16  2344  	const struct scmi_handle *handle = &info->handle;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2345  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2346  	/* Protocol specific devres group */
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2347  	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
f5800e0bf6f9b7 Cristian Marussi 2021-03-16  2348  	if (!gid) {
fc110108b98305 Cristian Marussi 2024-04-18  2349  		scmi_protocol_put(proto);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2350  		goto out;
f5800e0bf6f9b7 Cristian Marussi 2021-03-16  2351  	}
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2352  
4dd10fbbeb9c33 Kees Cook        2026-10-28  2353  	pi = devm_kzalloc_obj(handle->dev, *pi);
48dc16e2e52ca3 Cristian Marussi 2021-03-16 @2354  	if (!pi)
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2355  		goto clean;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2356  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2357  	pi->gid = gid;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2358  	pi->proto = proto;
d7b6cc563a6007 Cristian Marussi 2021-03-16  2359  	pi->handle = handle;
d7b6cc563a6007 Cristian Marussi 2021-03-16  2360  	pi->ph.dev = handle->dev;
a4a20b0975dc7b Cristian Marussi 2021-03-16  2361  	pi->ph.xops = &xfer_ops;
5c873d120d8676 Cristian Marussi 2022-03-30  2362  	pi->ph.hops = &helpers_ops;
d7b6cc563a6007 Cristian Marussi 2021-03-16  2363  	pi->ph.set_priv = scmi_set_protocol_priv;
d7b6cc563a6007 Cristian Marussi 2021-03-16  2364  	pi->ph.get_priv = scmi_get_protocol_priv;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2365  	refcount_set(&pi->users, 1);
0fac05fdd9afff Cristian Marussi 2025-12-27  2366  
0fac05fdd9afff Cristian Marussi 2025-12-27  2367  	/*
0fac05fdd9afff Cristian Marussi 2025-12-27  2368  	 * Initialize effectively used protocol version performing any
0fac05fdd9afff Cristian Marussi 2025-12-27  2369  	 * possibly needed negotiations.
0fac05fdd9afff Cristian Marussi 2025-12-27  2370  	 */
0fac05fdd9afff Cristian Marussi 2025-12-27  2371  	scmi_protocol_version_initialize(handle->dev, pi);
0fac05fdd9afff Cristian Marussi 2025-12-27  2372  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2373  	/* proto->init is assured NON NULL by scmi_protocol_register */
a4a20b0975dc7b Cristian Marussi 2021-03-16  2374  	ret = pi->proto->instance_init(&pi->ph);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2375  	if (ret)
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2376  		goto clean;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2377  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2378  	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2379  			GFP_KERNEL);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2380  	if (ret != proto->id)
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2381  		goto clean;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2382  
533c7095b1ff92 Cristian Marussi 2021-03-16  2383  	/*
533c7095b1ff92 Cristian Marussi 2021-03-16  2384  	 * Warn but ignore events registration errors since we do not want
533c7095b1ff92 Cristian Marussi 2021-03-16  2385  	 * to skip whole protocols if their notifications are messed up.
533c7095b1ff92 Cristian Marussi 2021-03-16  2386  	 */
533c7095b1ff92 Cristian Marussi 2021-03-16  2387  	if (pi->proto->events) {
533c7095b1ff92 Cristian Marussi 2021-03-16  2388  		ret = scmi_register_protocol_events(handle, pi->proto->id,
b9f7fd907c38a3 Cristian Marussi 2021-03-16  2389  						    &pi->ph,
533c7095b1ff92 Cristian Marussi 2021-03-16  2390  						    pi->proto->events);
533c7095b1ff92 Cristian Marussi 2021-03-16  2391  		if (ret)
533c7095b1ff92 Cristian Marussi 2021-03-16  2392  			dev_warn(handle->dev,
533c7095b1ff92 Cristian Marussi 2021-03-16  2393  				 "Protocol:%X - Events Registration Failed - err:%d\n",
533c7095b1ff92 Cristian Marussi 2021-03-16  2394  				 pi->proto->id, ret);
533c7095b1ff92 Cristian Marussi 2021-03-16  2395  	}
533c7095b1ff92 Cristian Marussi 2021-03-16  2396  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2397  	devres_close_group(handle->dev, pi->gid);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2398  	dev_dbg(handle->dev, "Initialized protocol: 0x%X\n", pi->proto->id);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2399  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2400  	return pi;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2401  
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2402  clean:
f5800e0bf6f9b7 Cristian Marussi 2021-03-16  2403  	/* Take care to put the protocol module's owner before releasing all */
fc110108b98305 Cristian Marussi 2024-04-18  2404  	scmi_protocol_put(proto);
7364fc3b21577a Cristian Marussi 2023-03-15 @2405  	dbg = pi->dbg;
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2406  	devres_release_group(handle->dev, gid);
7364fc3b21577a Cristian Marussi 2023-03-15  2407  	debugfs_remove_recursive(dbg);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2408  out:
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2409  	return ERR_PTR(ret);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2410  }
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343094;
	b=06XmD3+E2F2krCxRE/X+eVJgqn7kCsmfgUEXNr1XiNQRMml1Y7+iPFHcTI6lE3Gm9w3W
	 SGxpMFnQl0LP62psa70xjPTmJoCtFHwSO8WHFIRGSMUqfpx+Roxij04Q8dYiTXM4VUlGe
	 nlWg4lgrK94AGhZme+9rMeK2YeuUMq95JTHT36jSVoTFcGnaEX1osSAs2Mu3L+zIbAmlN
	 zsQhfRSOdFvocH+rw9J4/BRHLap46laCQomPit598L7rAisORr2XDmO8NkWvDX95KlKPS
	 NqdEdhEOPcTZiaVi7CY6gihQSjzqycHtAwO5Xqi07zzjmvRTAYn7yn0RS+6UZikpTSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343094;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=T9ts4N8bGLYn6kC9KRH72e1p4eXa5VfRLScG1eup7Vk=;
	b=TAgBXQ6mtZn85V2aBbS2NoI0ZvizBdOE232ZjcSy7FmOafdeuTZeo2KkBB63l5TGf+so
	 TqpGDfe4p2X6m6CBYK1KDluey3kwG/T+m1hjTX02M3CuZ6NpAVihGaRULj+05hq7Yciva
	 n6LtiK8QnwxgwsR+glBHgLcBjAV8MQb5TDnrMvj/+UvczNb6p1PdTMb4Dw3fK7VwRrz2p
	 HbQJY1NxUanLYNF5t1pbN0VDsWnZl9SCToz3Efy4wjTQlTrFv9Xm3by9ts+WkKBIk3rnU
	 1lRUq/rBjJhte2xI+IhEfdnHR4Z7RF/CB86R1m5ViAi5K/BOvjwQxgJ2XCQuqXpa1vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyfBFplI;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC4A606A32A
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 10:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EC4A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyfBFplI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795343094; x=1826879094;
  h=date:from:to:cc:subject:message-id;
  bh=JvB5JiGHvXVX7a7a4vTp+Vmg2jerarfF00YducwBFDw=;
  b=EyfBFplIH61lpDxL+32hCGynVjAHrpEEwUoddEsQckYUPUXOJd+jcdji
   mKXcKtQKY3G9opxyZi+3MojkjYtQ0yUyMjpAKw85jATSHzcO0T3LUOtbG
   y9f+Ssu9lxtFT8vFoixOOxkxHh/g14UBxsSyIlWySKwQ9PeYCjhX61qKP
   GFU2zgo+wOTdfpLwurb30/AuPmdmW5dw7g/rvDUHBJePgmZK2mhi24onx
   3oKoZ9FpIhUpTZHt4GRCzCe9fmchVdPN4AcCpem07D1HeTXLZmEDFsON2
   Empn5uCW8WzTISt1Fa2Ex9qjei8/wNFAlVJe25P88oVuGE4Xsk/LAYNow
   Q==;
X-CSE-ConnectionGUID: yLRT91EITA2t1ezTxQguOg==
X-CSE-MsgGUID: QAb5jsK6QHKPg61pU/9O3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4045904"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4045904"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 02:24:53 -0800
X-CSE-ConnectionGUID: s7hgu1ZgSTCfRpzT0BqQWA==
X-CSE-MsgGUID: EXY2gA4nS+WGa5Ny/GNzhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11401246"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2026 02:24:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV4kZ-000000004Xj-29oP;
	Sun, 22 Nov 2026 10:24:47 +0000
Date: Sun, 22 Nov 2026 11:24:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [cris:scmi_telemetry_ng_V16 21/31]
 drivers/firmware/arm_scmi/driver.c:2405:11-14: ERROR: pi is NULL but
 dereferenced.
Message-ID: <20261122112036.65rFERZY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Cristian Marussi <cristian.marussi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V16
head:   2583f5d73857467989b273f5a1a2f7bee48debd9
commit: 7364fc3b21577a5ff21f268186e0deefdae79d4c [21/31] firmware: arm_scmi: Add common per-protocol debugfs support
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm-randconfig-r2109-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122112036.65rFERZY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261122112036.65rFERZY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/driver.c:2405:11-14: ERROR: pi is NULL but dereferenced.

vim +2405 drivers/firmware/arm_scmi/driver.c

0fac05fdd9afff6 Cristian Marussi 2025-12-27  2319  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2320  /**
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2321   * scmi_alloc_init_protocol_instance  - Allocate and initialize a protocol
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2322   * instance descriptor.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2323   * @info: The reference to the related SCMI instance.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2324   * @proto: The protocol descriptor.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2325   *
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2326   * Allocate a new protocol instance descriptor, using the provided @proto
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2327   * description, against the specified SCMI instance @info, and initialize it;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2328   * all resources management is handled via a dedicated per-protocol devres
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2329   * group.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2330   *
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2331   * Context: Assumes to be called with @protocols_mtx already acquired.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2332   * Return: A reference to a freshly allocated and initialized protocol instance
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2333   *	   or ERR_PTR on failure. On failure the @proto reference is at first
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2334   *	   put using @scmi_protocol_put() before releasing all the devres group.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2335   */
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2336  static struct scmi_protocol_instance *
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2337  scmi_alloc_init_protocol_instance(struct scmi_info *info,
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2338  				  const struct scmi_protocol *proto)
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2339  {
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2340  	int ret = -ENOMEM;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2341  	void *gid;
7364fc3b21577a5 Cristian Marussi 2023-03-15  2342  	struct dentry *dbg;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2343  	struct scmi_protocol_instance *pi;
f0e73cee26dd3ed Cristian Marussi 2021-03-16  2344  	const struct scmi_handle *handle = &info->handle;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2345  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2346  	/* Protocol specific devres group */
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2347  	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2348  	if (!gid) {
fc110108b98305e Cristian Marussi 2024-04-18  2349  		scmi_protocol_put(proto);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2350  		goto out;
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2351  	}
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2352  
4dd10fbbeb9c337 Kees Cook        2026-10-28  2353  	pi = devm_kzalloc_obj(handle->dev, *pi);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2354  	if (!pi)
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2355  		goto clean;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2356  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2357  	pi->gid = gid;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2358  	pi->proto = proto;
d7b6cc563a60076 Cristian Marussi 2021-03-16  2359  	pi->handle = handle;
d7b6cc563a60076 Cristian Marussi 2021-03-16  2360  	pi->ph.dev = handle->dev;
a4a20b0975dc7b1 Cristian Marussi 2021-03-16  2361  	pi->ph.xops = &xfer_ops;
5c873d120d8676b Cristian Marussi 2022-03-30  2362  	pi->ph.hops = &helpers_ops;
d7b6cc563a60076 Cristian Marussi 2021-03-16  2363  	pi->ph.set_priv = scmi_set_protocol_priv;
d7b6cc563a60076 Cristian Marussi 2021-03-16  2364  	pi->ph.get_priv = scmi_get_protocol_priv;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2365  	refcount_set(&pi->users, 1);
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2366  
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2367  	/*
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2368  	 * Initialize effectively used protocol version performing any
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2369  	 * possibly needed negotiations.
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2370  	 */
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2371  	scmi_protocol_version_initialize(handle->dev, pi);
0fac05fdd9afff6 Cristian Marussi 2025-12-27  2372  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2373  	/* proto->init is assured NON NULL by scmi_protocol_register */
a4a20b0975dc7b1 Cristian Marussi 2021-03-16  2374  	ret = pi->proto->instance_init(&pi->ph);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2375  	if (ret)
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2376  		goto clean;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2377  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2378  	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2379  			GFP_KERNEL);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2380  	if (ret != proto->id)
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2381  		goto clean;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2382  
533c7095b1ff927 Cristian Marussi 2021-03-16  2383  	/*
533c7095b1ff927 Cristian Marussi 2021-03-16  2384  	 * Warn but ignore events registration errors since we do not want
533c7095b1ff927 Cristian Marussi 2021-03-16  2385  	 * to skip whole protocols if their notifications are messed up.
533c7095b1ff927 Cristian Marussi 2021-03-16  2386  	 */
533c7095b1ff927 Cristian Marussi 2021-03-16  2387  	if (pi->proto->events) {
533c7095b1ff927 Cristian Marussi 2021-03-16  2388  		ret = scmi_register_protocol_events(handle, pi->proto->id,
b9f7fd907c38a38 Cristian Marussi 2021-03-16  2389  						    &pi->ph,
533c7095b1ff927 Cristian Marussi 2021-03-16  2390  						    pi->proto->events);
533c7095b1ff927 Cristian Marussi 2021-03-16  2391  		if (ret)
533c7095b1ff927 Cristian Marussi 2021-03-16  2392  			dev_warn(handle->dev,
533c7095b1ff927 Cristian Marussi 2021-03-16  2393  				 "Protocol:%X - Events Registration Failed - err:%d\n",
533c7095b1ff927 Cristian Marussi 2021-03-16  2394  				 pi->proto->id, ret);
533c7095b1ff927 Cristian Marussi 2021-03-16  2395  	}
533c7095b1ff927 Cristian Marussi 2021-03-16  2396  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2397  	devres_close_group(handle->dev, pi->gid);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2398  	dev_dbg(handle->dev, "Initialized protocol: 0x%X\n", pi->proto->id);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2399  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2400  	return pi;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2401  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2402  clean:
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2403  	/* Take care to put the protocol module's owner before releasing all */
fc110108b98305e Cristian Marussi 2024-04-18  2404  	scmi_protocol_put(proto);
7364fc3b21577a5 Cristian Marussi 2023-03-15 @2405  	dbg = pi->dbg;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2406  	devres_release_group(handle->dev, gid);
7364fc3b21577a5 Cristian Marussi 2023-03-15  2407  	debugfs_remove_recursive(dbg);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2408  out:
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2409  	return ERR_PTR(ret);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2410  }
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B513E25B0A3
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 05:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786340062; cv=none; b=NgGkjSg7/ZcQS1itYHPuLk8u3a9ifdTc62fRAYhuJOPH1s5gHoCTmQpS0M2Jtk120w0sZHX/6aXM9DXshIiVgH+B4jehRHzIfJabOIfgnhaJeTqvSTcCXlfKrk6lLDkMbVx98+Q2+2sjvgYVOQJ/42IpEXudNt9FbDkOFPXWiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786340062; c=relaxed/simple;
	bh=L7VpZFEA34LgeHO0l9/0tf3l9ufTLXY/2ioTmDxshtQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VJEKMik7PYtbaRhuCYD5/lEnJ3Cwkf5ms16xoYRhZ5BxPBU/SE0+T2HYQqGSghLOYbQQGOmQqSh2AufdlR26PIAmlY87dCu/ISCc2D89NeXxj4DAzqdcy096n3mbJzvMpssyKA6ATpWGSC3+gRnNcKJRMmA21dVvR5RSUWKNMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gc4q5DQ6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gc4q5DQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786340061; x=1817876061;
  h=date:from:to:cc:subject:message-id;
  bh=L7VpZFEA34LgeHO0l9/0tf3l9ufTLXY/2ioTmDxshtQ=;
  b=gc4q5DQ6PBRYmKCI0UWtGD/pjRKNbcub3daKmItVwEjUhuF9L8s9nUiQ
   A+HJ9R0OW8ijKymVsVytTNMA9hbTByuKu0BUPbOthPeUZE2plMVlT0TDi
   eHky+kKV22srjPhirfGpYeOHYoJCE45yNM7THQaPIPJnxgO6X7tZYh18j
   AX349t5D5O2s+Y/FXf9weKBDETfCDHi9h3DWNQQM0vVf/Hy55+MOYGUOQ
   yRtreVCLx0/H3pVFEcopFU5Tn5hFTItTXSAbbHvz2EtsU5wwGv3o5K1t7
   zRlt4800+uiU4kPDpNCn+fIXNC4QU8QXXJSw3+yDgmCUBrW4pEkDIiVy+
   Q==;
X-CSE-ConnectionGUID: qiz8jEShSpKPBASQhbH5IA==
X-CSE-MsgGUID: TeWGqy9hSvqG5CljsZ5hqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97500140"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="97500140"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 22:34:20 -0700
X-CSE-ConnectionGUID: s/Fqm25uQVGggY2pLJ+3Fw==
X-CSE-MsgGUID: teQS2zdnR+qr2hGWATmrrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="261200780"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2026 22:34:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtIeO-00000000Mtq-1LKX;
	Mon, 10 Aug 2026 05:34:16 +0000
Date: Mon, 10 Aug 2026 13:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cris:scmi_telemetry_ng_V8 22/30]
 drivers/firmware/arm_scmi/driver.c:2342 scmi_alloc_init_protocol_instance()
 error: we previously assumed 'pi' could be null (see line 2292)
Message-ID: <202608101250.FcZovEGe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Cristian Marussi <cristian.marussi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V8
head:   bc3b27dd68cfc244c1e7717b72f88b2dfcb28d2e
commit: 794ab60bbda9339aa782a6ce4a77e4e496538fb9 [22/30] firmware: arm_scmi: Add common per-protocol debugfs support
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
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

0fac05fdd9afff6 Cristian Marussi 2025-12-27  2258  
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2259  /**
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2260   * scmi_alloc_init_protocol_instance  - Allocate and initialize a protocol
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2261   * instance descriptor.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2262   * @info: The reference to the related SCMI instance.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2263   * @proto: The protocol descriptor.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2264   *
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2265   * Allocate a new protocol instance descriptor, using the provided @proto
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2266   * description, against the specified SCMI instance @info, and initialize it;
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2267   * all resources management is handled via a dedicated per-protocol devres
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2268   * group.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2269   *
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2270   * Context: Assumes to be called with @protocols_mtx already acquired.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2271   * Return: A reference to a freshly allocated and initialized protocol instance
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2272   *	   or ERR_PTR on failure. On failure the @proto reference is at first
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2273   *	   put using @scmi_protocol_put() before releasing all the devres group.
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2274   */
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
f5800e0bf6f9b7f Cristian Marussi 2021-03-16  2343  	/* Take care to put the protocol module's owner before releasing all */
fc110108b98305e Cristian Marussi 2024-04-18  2344  	scmi_protocol_put(proto);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2345  	devres_release_group(handle->dev, gid);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2346  out:
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2347  	return ERR_PTR(ret);
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2348  }
48dc16e2e52ca38 Cristian Marussi 2021-03-16  2349  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

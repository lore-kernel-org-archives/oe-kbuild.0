Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420200;
	b=z05KhWMXsgP+dEMxND5eSicg8RI1D6OBZHjZnjoRMy8Wyr3FFZoaVnMq3PGa29Lu6JQ/
	 4aKY3Nw8mbV6jbLnG666ZlloHEE1CssienAZgy+uY84e5cHG0Be4k13PEczKZGwCCZVzX
	 MRdQRotb03zLllBKpmKBdHaWLhUfQnK+k3DeOiW+4B3FdJmvMrgIUTySCbg2xZal4Ldyr
	 YGe7Kd3R4Y3qd2xSP7gLp32MoLCi1L1+zVu5VYFYRtdlUFSJS781VrthP5Kpr3tcwUlJM
	 xpFgng3Wb9gbEeWVU6VsQoKPfKNfjCNhyQfnY6i7Lt1FqkjhLuKOfe1Ih5O/d8G/CYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=OA9zh2lc5i9Juo9pvjEdxXmn7HYwHhrvqPl17zykFvc=;
	b=vthgwYa9bffIjGaK7kGpn1JSCHP1kQbV8AHUwpz2JVx+a2UO6gIRUfDgAf/WTD+r9jd5
	 YgxYypOsSn7NvIOB6jdPEdmINDnlgSUx8zvLX7b3uX2DJTfSBnRyLU0iwlXfiiRHb6JTp
	 xT8gYf/+B2peeLxup0zIYefC7G19FyhGA+3uauCKEGvu8eQTvQT7gDuztAES/bcDGmjJF
	 rX942IukNeMGeDQ9G0e08ATTU2PKA1GK/ixNUq/GZwySZJdiL0PYn9Tazk9CHnZHoYZyb
	 0EbB6keuvS2n6JUKP0q4Lc3zRPXgYSaLCKsNJWrrqwTxydw9RSG62IjxZpUBFLofo1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxB5lOPA;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C974D606A31E
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Nov 2026 07:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C974D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxB5lOPA
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso26472065e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 23:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795420198; x=1796024998; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OA9zh2lc5i9Juo9pvjEdxXmn7HYwHhrvqPl17zykFvc=;
        b=nxB5lOPAidXDpfg5G9W/mwJq2zNMZ/1fTOt0E1U8Kk6HTnHzkPxupqJICvlTW/dwDo
         v7ciLV1Pv7cHF/GVCJ9rZQvdxhblVCdQi73Teb0RWGsm95UFcukme6UekDuhHuOPcXQo
         cxQe5canrs5xbcWd+evXmjV6umNGD/XIJLE1fl2Y/9HevE7MRkAfCxOA74d580yC0Yk1
         yYcSWSBcg8z6EK/eaVBcDXwspCd9kK8kWJfR9sljJuEmboaetFBLRWTPRtva2/4dzv6f
         WtO2ARwr1UUblI5YhPFq1J/vgzi6h+VqC6P/qsJMu16b3Je74mEXy8G7Vs7VWOjSaATB
         LAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420198; x=1796024998;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OA9zh2lc5i9Juo9pvjEdxXmn7HYwHhrvqPl17zykFvc=;
        b=L3j+IwQgpOSmOIU/y4WN73vqG2dmAM7AL9vgweWQrOsGgXA4HQCtbgIDlFIpJYlpmd
         gwwHRms2iOYHmUnITRu1Llp8n5UK6u7dpU/FkQbZB1m03yPwUj304yribqh2428n92bd
         U9358/Eo7BE1NpmK420HG/PLs39+dXPPzAp/C7dd+T7FiUl1BOLkHsvCGBbOnOJ0WujS
         BZrmt21FHLGf7fzQdZ7ByJtOq4iY2az22Q1/5T7hlDOV+TUomrTX+U5bQfhUxHdELDbP
         eRWE7GAjqVSa7p2bbB/dz5B3MZ31i9Q6z5pk3KQGmqGAbO+rxm487UUxFeFDFNHb8L6H
         3+zA==
X-Gm-Message-State: APuU4Z/0kxl+41QaCHeCprwKEtnyXqBoHuf/eu6tiJtLrFjJgCtCeKx8
	vu0gG7BO/X53qdpqRJc685EydHsu/Ml7DQnsMJs1La7mAdU0ccXOBHnnobQVALc3fRNMsLn2
X-Gm-Gg: AZFdTZc4YCKOf8h7ndayg8d9egHP24D+JgTkCaLqPqmttDRHkyaIlpxwOip/7ej17GA
	q5gRP6hfPuCqYKzZCMp7AAt8XHFiuW+BxwUYFainyfUvjyPU2o1GOcTFsMLRgEpm+khjykyK8Px
	Ufp4uobi7fIOVTat/e0Sa7s52VqiQG49LScZsCsthjJwxeh7B9ulohRD06bMA+jrVb/aNEIn2Ox
	OjOgeyss4Wf5U35LRuYBkpKBXbmLsV7yx4IOKUHKSW5iPrSmABPdZ3PDg6tm5UwuifnmLSJSyWx
	pUHsRnjjn79+d+hCXeZDNAVM/wLZLQpUD7AZrC4Npy9Ao4N5qQwgqyj++49QPXiXJ74W4qh5RYE
	60g24DrkEgJqmQfA0exsrk6aoD89Lri8W/URsPUnSS86s1y4eS4DbCKZzu95mIoNgNlzwy5WtE8
	XZFCpfsmO+KR5exE5f+l4uDiRSkJHyuVgcEZHIKLgAHqxgWgPLMwj79OrsLXkwS12Xu2MkjH8Fq
	TC3SXGOkDRSLrd8wE51hoxdvjMTh6nDOuljC27sVg2XcUmi0V1z50A9kfxBY49DYMMpBx39+WZp
	LAfFmqctAVNIMVBBNXLfScrLym1vKWDMYHQKdKyIBDezWM9vFKcSQNYT04h6QLZaFyd4bf5c4M2
	knxtcaNJNyQdgD9fi5Of7umf3twA7I+r20uXkrqWJO7k46jl+HRvxbFDeuchrf6TrroQ=
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr256838175e9.27.1795420197917;
        Sun, 22 Nov 2026 23:49:57 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm178782895e9.4.2026.11.22.23.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:49:57 -0800 (PST)
Date: Mon, 23 Nov 2026 10:49:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V16 21/31]
 drivers/firmware/arm_scmi/driver.c:2405 scmi_alloc_init_protocol_instance()
 error: we previously assumed 'pi' could be null (see line 2354)
Message-ID: <20261122034843.dsyXusbp-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261123074953.LDM7AvDCKHry2cVyX7xzq9F2GYpFgpxZY75gZ9n3tc4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V16
head:   2583f5d73857467989b273f5a1a2f7bee48debd9
commit: 7364fc3b21577a5ff21f268186e0deefdae79d4c [21/31] firmware: arm_scmi: Add common per-protocol debugfs support
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

pi is NULL

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

Dereferenced

48dc16e2e52ca3 Cristian Marussi 2021-03-16  2406  	devres_release_group(handle->dev, gid);
7364fc3b21577a Cristian Marussi 2023-03-15  2407  	debugfs_remove_recursive(dbg);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2408  out:
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2409  	return ERR_PTR(ret);
48dc16e2e52ca3 Cristian Marussi 2021-03-16  2410  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


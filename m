Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA92727381E
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314316; cv=none; b=AxzYauKs2M7VA0RftDDjezb/N8Z2/F9PwnXAHA6Dt2Am9rauDOCC0cT6m58MOkXp9XRPBgowtr9EiXMWQ23ljWqbizHw3i17+EMtWHMPGA2zRLrAezSC0ceLf8qDX0eOBExhwtZM1BAtpEzdGolefWtl4SAUP6XydsFbrgSmTC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314316; c=relaxed/simple;
	bh=p26hhn9zjLIl6ZrDTgrYRESbHv31exw/3C5HWAR4dpU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kKsGi0UERq8D0gRhtr3lbhk+FmLZLDuiuy2oDX1j3n/Zwmz+aYLskfQHnZZkLB173G7bICsbXvBrQ92EMd5+zhnO+zrL+qtaaLIny79n7t4QJZJjy4MxT2DhgYxX8KlVXVb4Pc3EFR+DeVzf0LsKuCfoysrvUnFIgG12azut5Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdFHTY4/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdFHTY4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768314314; x=1799850314;
  h=date:from:to:cc:subject:message-id;
  bh=p26hhn9zjLIl6ZrDTgrYRESbHv31exw/3C5HWAR4dpU=;
  b=AdFHTY4/kAd1kBvXT4JwvlqCQwqa98tOyedhhhxNCHcl1YsNCcJNglZ7
   mK5W4TD86Iych2nwYgtWjNepfPfzqgZNIbpExfdw5PX7FhWdqvTfsQ9wT
   sEfQIsPu+H6LKWX3ld4lktqFgWLQMrpWb+/5Vy2+UWVzvugEtZjGTKfYV
   y55rGQMcSj+SPvdfSRZVsWemfDHPn3cWNnXxPdX9jlDD3AX0Gilff+GL0
   4xDVsrGFNc6BmYJt3p91u8IoJvNZYT0d4gFyRwX+R/MV813v2QaRBoY49
   XZN9sbyjenlFhgWRCbK/T6vqYe0y0FpRrm9qksVJ54zZLwYiG81Qo4lgC
   g==;
X-CSE-ConnectionGUID: G3o4KvwgQo2Q/8MuyD4vaA==
X-CSE-MsgGUID: 0Zp/KeNxRBOdGHsjsjAtWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="57154113"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="57154113"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:25:13 -0800
X-CSE-ConnectionGUID: Jwgd6eEiRDe8vOjuObA6jg==
X-CSE-MsgGUID: N1MoQzWdSG2bkcOg7aLucA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203612480"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2026 06:25:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vffKX-00000000EuW-3hWo;
	Tue, 13 Jan 2026 14:25:09 +0000
Date: Tue, 13 Jan 2026 22:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/perf/arm-cmn.c:2248:35: sparse: sparse: duplicate
 [noderef]
Message-ID: <202601132255.ykD6i1gw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/perf/arm-cmn.c:2248:35: sparse: sparse: duplicate [noderef]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Robin Murphy <robin.murphy@arm.com>
CC: Will Deacon <will@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: a7bfae21457c3e46d16868c0bc923e509b4a83e2 perf/arm-cmn: Reduce stack usage during discovery
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r121-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132255.ykD6i1gw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132255.ykD6i1gw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601132255.ykD6i1gw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm-cmn.c:2248:35: sparse: sparse: duplicate [noderef]
>> drivers/perf/arm-cmn.c:2248:35: sparse: sparse: multiple address spaces given: __iomem & __iomem

vim +2248 drivers/perf/arm-cmn.c

8e504d93acb647 Robin Murphy   2022-04-18  2245  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2246  static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
0ba64770a2f2e5 Robin Murphy   2020-09-18  2247  {
a7bfae21457c3e Robin Murphy   2025-06-27 @2248  	void __iomem *cfg_region, __iomem *xp_region;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2249  	struct arm_cmn_node cfg, *dn;
0947c80aba2397 Robin Murphy   2021-12-03  2250  	struct arm_cmn_dtm *dtm;
7819e05a0dceac Robin Murphy   2023-06-12  2251  	enum cmn_part part;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2252  	u16 child_count, child_poff;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2253  	u64 reg;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2254  	int i, j;
da5f7d2c8019c9 Robin Murphy   2021-12-03  2255  	size_t sz;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2256  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2257  	arm_cmn_init_node_info(cmn, rgn_offset, &cfg);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2258  	if (cfg.type != CMN_TYPE_CFG)
0ba64770a2f2e5 Robin Murphy   2020-09-18  2259  		return -ENODEV;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2260  
61ec1d87581204 Robin Murphy   2021-12-03  2261  	cfg_region = cmn->base + rgn_offset;
7819e05a0dceac Robin Murphy   2023-06-12  2262  
7819e05a0dceac Robin Murphy   2023-06-12  2263  	reg = readq_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_01);
7819e05a0dceac Robin Murphy   2023-06-12  2264  	part = FIELD_GET(CMN_CFGM_PID0_PART_0, reg);
7819e05a0dceac Robin Murphy   2023-06-12  2265  	part |= FIELD_GET(CMN_CFGM_PID1_PART_1, reg) << 8;
7819e05a0dceac Robin Murphy   2023-06-12  2266  	if (cmn->part && cmn->part != part)
7819e05a0dceac Robin Murphy   2023-06-12  2267  		dev_warn(cmn->dev,
7819e05a0dceac Robin Murphy   2023-06-12  2268  			 "Firmware binding mismatch: expected part number 0x%x, found 0x%x\n",
7819e05a0dceac Robin Murphy   2023-06-12  2269  			 cmn->part, part);
7819e05a0dceac Robin Murphy   2023-06-12  2270  	cmn->part = part;
7819e05a0dceac Robin Murphy   2023-06-12  2271  	if (!arm_cmn_model(cmn))
7819e05a0dceac Robin Murphy   2023-06-12  2272  		dev_warn(cmn->dev, "Unknown part number: 0x%x\n", part);
7819e05a0dceac Robin Murphy   2023-06-12  2273  
7819e05a0dceac Robin Murphy   2023-06-12  2274  	reg = readl_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_23);
61ec1d87581204 Robin Murphy   2021-12-03  2275  	cmn->rev = FIELD_GET(CMN_CFGM_PID2_REVISION, reg);
61ec1d87581204 Robin Murphy   2021-12-03  2276  
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2277  	/*
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2278  	 * With the device isolation feature, if firmware has neglected to enable
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2279  	 * an XP port then we risk locking up if we try to access anything behind
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2280  	 * it; however we also have no way to tell from Non-Secure whether any
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2281  	 * given port is disabled or not, so the only way to win is not to play...
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2282  	 */
60d1504070c22c Robin Murphy   2021-12-03  2283  	reg = readq_relaxed(cfg_region + CMN_CFGM_INFO_GLOBAL);
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2284  	if (reg & CMN_INFO_DEVICE_ISO_ENABLE) {
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2285  		dev_err(cmn->dev, "Device isolation enabled, not continuing due to risk of lockup\n");
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2286  		return -ENODEV;
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2287  	}
60d1504070c22c Robin Murphy   2021-12-03  2288  	cmn->multi_dtm = reg & CMN_INFO_MULTIPLE_DTM_EN;
60d1504070c22c Robin Murphy   2021-12-03  2289  	cmn->rsp_vc_num = FIELD_GET(CMN_INFO_RSP_VC_NUM, reg);
60d1504070c22c Robin Murphy   2021-12-03  2290  	cmn->dat_vc_num = FIELD_GET(CMN_INFO_DAT_VC_NUM, reg);
60d1504070c22c Robin Murphy   2021-12-03  2291  
23760a0144173e Robin Murphy   2022-04-18  2292  	reg = readq_relaxed(cfg_region + CMN_CFGM_INFO_GLOBAL_1);
23760a0144173e Robin Murphy   2022-04-18  2293  	cmn->snp_vc_num = FIELD_GET(CMN_INFO_SNP_VC_NUM, reg);
23760a0144173e Robin Murphy   2022-04-18  2294  	cmn->req_vc_num = FIELD_GET(CMN_INFO_REQ_VC_NUM, reg);
23760a0144173e Robin Murphy   2022-04-18  2295  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2296  	reg = readq_relaxed(cfg_region + CMN_CHILD_INFO);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2297  	child_count = FIELD_GET(CMN_CI_CHILD_COUNT, reg);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2298  	child_poff = FIELD_GET(CMN_CI_CHILD_PTR_OFFSET, reg);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2299  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2300  	cmn->num_xps = child_count;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2301  	cmn->num_dns = cmn->num_xps;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2302  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2303  	/* Pass 1: visit the XPs, enumerate their children */
a7bfae21457c3e Robin Murphy   2025-06-27  2304  	cfg_region += child_poff;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2305  	for (i = 0; i < cmn->num_xps; i++) {
a7bfae21457c3e Robin Murphy   2025-06-27  2306  		reg = readq_relaxed(cfg_region + i * 8);
a7bfae21457c3e Robin Murphy   2025-06-27  2307  		xp_region = cmn->base + (reg & CMN_CHILD_NODE_ADDR);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2308  
a7bfae21457c3e Robin Murphy   2025-06-27  2309  		reg = readq_relaxed(xp_region + CMN_CHILD_INFO);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2310  		cmn->num_dns += FIELD_GET(CMN_CI_CHILD_COUNT, reg);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2311  	}
0ba64770a2f2e5 Robin Murphy   2020-09-18  2312  
8e504d93acb647 Robin Murphy   2022-04-18  2313  	/*
8e504d93acb647 Robin Murphy   2022-04-18  2314  	 * Some nodes effectively have two separate types, which we'll handle
8e504d93acb647 Robin Murphy   2022-04-18  2315  	 * by creating one of each internally. For a (very) safe initial upper
8e504d93acb647 Robin Murphy   2022-04-18  2316  	 * bound, account for double the number of non-XP nodes.
8e504d93acb647 Robin Murphy   2022-04-18  2317  	 */
8e504d93acb647 Robin Murphy   2022-04-18  2318  	dn = devm_kcalloc(cmn->dev, cmn->num_dns * 2 - cmn->num_xps,
8e504d93acb647 Robin Murphy   2022-04-18  2319  			  sizeof(*dn), GFP_KERNEL);
da5f7d2c8019c9 Robin Murphy   2021-12-03  2320  	if (!dn)
0ba64770a2f2e5 Robin Murphy   2020-09-18  2321  		return -ENOMEM;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2322  
60d1504070c22c Robin Murphy   2021-12-03  2323  	/* Initial safe upper bound on DTMs for any possible mesh layout */
60d1504070c22c Robin Murphy   2021-12-03  2324  	i = cmn->num_xps;
60d1504070c22c Robin Murphy   2021-12-03  2325  	if (cmn->multi_dtm)
60d1504070c22c Robin Murphy   2021-12-03  2326  		i += cmn->num_xps + 1;
60d1504070c22c Robin Murphy   2021-12-03  2327  	dtm = devm_kcalloc(cmn->dev, i, sizeof(*dtm), GFP_KERNEL);
0947c80aba2397 Robin Murphy   2021-12-03  2328  	if (!dtm)
0947c80aba2397 Robin Murphy   2021-12-03  2329  		return -ENOMEM;
0947c80aba2397 Robin Murphy   2021-12-03  2330  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2331  	/* Pass 2: now we can actually populate the nodes */
da5f7d2c8019c9 Robin Murphy   2021-12-03  2332  	cmn->dns = dn;
0947c80aba2397 Robin Murphy   2021-12-03  2333  	cmn->dtms = dtm;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2334  	for (i = 0; i < cmn->num_xps; i++) {
0ba64770a2f2e5 Robin Murphy   2020-09-18  2335  		struct arm_cmn_node *xp = dn++;
60d1504070c22c Robin Murphy   2021-12-03  2336  		unsigned int xp_ports = 0;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2337  
a7bfae21457c3e Robin Murphy   2025-06-27  2338  		reg = readq_relaxed(cfg_region + i * 8);
a7bfae21457c3e Robin Murphy   2025-06-27  2339  		xp_region = cmn->base + (reg & CMN_CHILD_NODE_ADDR);
a7bfae21457c3e Robin Murphy   2025-06-27  2340  		arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, xp);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2341  		/*
0ba64770a2f2e5 Robin Murphy   2020-09-18  2342  		 * Thanks to the order in which XP logical IDs seem to be
0ba64770a2f2e5 Robin Murphy   2020-09-18  2343  		 * assigned, we can handily infer the mesh X dimension by
0ba64770a2f2e5 Robin Murphy   2020-09-18  2344  		 * looking out for the XP at (0,1) without needing to know
0ba64770a2f2e5 Robin Murphy   2020-09-18  2345  		 * the exact node ID format, which we can later derive.
0ba64770a2f2e5 Robin Murphy   2020-09-18  2346  		 */
0ba64770a2f2e5 Robin Murphy   2020-09-18  2347  		if (xp->id == (1 << 3))
0ba64770a2f2e5 Robin Murphy   2020-09-18  2348  			cmn->mesh_x = xp->logid;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2349  
7819e05a0dceac Robin Murphy   2023-06-12  2350  		if (cmn->part == PART_CMN600)
7633ec2c262fab Robin Murphy   2023-10-20  2351  			xp->dtc = -1;
60d1504070c22c Robin Murphy   2021-12-03  2352  		else
7633ec2c262fab Robin Murphy   2023-10-20  2353  			xp->dtc = arm_cmn_dtc_domain(cmn, xp_region);
60d1504070c22c Robin Murphy   2021-12-03  2354  
0947c80aba2397 Robin Murphy   2021-12-03  2355  		xp->dtm = dtm - cmn->dtms;
60d1504070c22c Robin Murphy   2021-12-03  2356  		arm_cmn_init_dtm(dtm++, xp, 0);
60d1504070c22c Robin Murphy   2021-12-03  2357  		/*
60d1504070c22c Robin Murphy   2021-12-03  2358  		 * Keeping track of connected ports will let us filter out
e79634b53e3989 Robin Murphy   2024-09-02  2359  		 * unnecessary XP events easily, and also infer the per-XP
e79634b53e3989 Robin Murphy   2024-09-02  2360  		 * part of the node ID format.
60d1504070c22c Robin Murphy   2021-12-03  2361  		 */
2ad91e44e6b0c7 Robin Murphy   2023-04-12  2362  		for (int p = 0; p < CMN_MAX_PORTS; p++)
2ad91e44e6b0c7 Robin Murphy   2023-04-12  2363  			if (arm_cmn_device_connect_info(cmn, xp, p))
2ad91e44e6b0c7 Robin Murphy   2023-04-12  2364  				xp_ports |= BIT(p);
60d1504070c22c Robin Murphy   2021-12-03  2365  
e79634b53e3989 Robin Murphy   2024-09-02  2366  		if (cmn->num_xps == 1) {
e79634b53e3989 Robin Murphy   2024-09-02  2367  			xp->portid_bits = 3;
e79634b53e3989 Robin Murphy   2024-09-02  2368  			xp->deviceid_bits = 2;
e79634b53e3989 Robin Murphy   2024-09-02  2369  		} else if (xp_ports > 0x3) {
e79634b53e3989 Robin Murphy   2024-09-02  2370  			xp->portid_bits = 2;
e79634b53e3989 Robin Murphy   2024-09-02  2371  			xp->deviceid_bits = 1;
e79634b53e3989 Robin Murphy   2024-09-02  2372  		} else {
e79634b53e3989 Robin Murphy   2024-09-02  2373  			xp->portid_bits = 1;
e79634b53e3989 Robin Murphy   2024-09-02  2374  			xp->deviceid_bits = 2;
e79634b53e3989 Robin Murphy   2024-09-02  2375  		}
e79634b53e3989 Robin Murphy   2024-09-02  2376  
e79634b53e3989 Robin Murphy   2024-09-02  2377  		if (cmn->multi_dtm && (xp_ports > 0x3))
60d1504070c22c Robin Murphy   2021-12-03  2378  			arm_cmn_init_dtm(dtm++, xp, 1);
e79634b53e3989 Robin Murphy   2024-09-02  2379  		if (cmn->multi_dtm && (xp_ports > 0xf))
60d1504070c22c Robin Murphy   2021-12-03  2380  			arm_cmn_init_dtm(dtm++, xp, 2);
60d1504070c22c Robin Murphy   2021-12-03  2381  
60d1504070c22c Robin Murphy   2021-12-03  2382  		cmn->ports_used |= xp_ports;
0947c80aba2397 Robin Murphy   2021-12-03  2383  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2384  		reg = readq_relaxed(xp_region + CMN_CHILD_INFO);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2385  		child_count = FIELD_GET(CMN_CI_CHILD_COUNT, reg);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2386  		child_poff = FIELD_GET(CMN_CI_CHILD_PTR_OFFSET, reg);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2387  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2388  		for (j = 0; j < child_count; j++) {
0ba64770a2f2e5 Robin Murphy   2020-09-18  2389  			reg = readq_relaxed(xp_region + child_poff + j * 8);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2390  			/*
0ba64770a2f2e5 Robin Murphy   2020-09-18  2391  			 * Don't even try to touch anything external, since in general
0ba64770a2f2e5 Robin Murphy   2020-09-18  2392  			 * we haven't a clue how to power up arbitrary CHI requesters.
0ba64770a2f2e5 Robin Murphy   2020-09-18  2393  			 * As of CMN-600r1 these could only be RN-SAMs or CXLAs,
0ba64770a2f2e5 Robin Murphy   2020-09-18  2394  			 * neither of which have any PMU events anyway.
0ba64770a2f2e5 Robin Murphy   2020-09-18  2395  			 * (Actually, CXLAs do seem to have grown some events in r1p2,
0ba64770a2f2e5 Robin Murphy   2020-09-18  2396  			 * but they don't go to regular XP DTMs, and they depend on
0ba64770a2f2e5 Robin Murphy   2020-09-18  2397  			 * secure configuration which we can't easily deal with)
0ba64770a2f2e5 Robin Murphy   2020-09-18  2398  			 */
0ba64770a2f2e5 Robin Murphy   2020-09-18  2399  			if (reg & CMN_CHILD_NODE_EXTERNAL) {
0ba64770a2f2e5 Robin Murphy   2020-09-18  2400  				dev_dbg(cmn->dev, "ignoring external node %llx\n", reg);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2401  				continue;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2402  			}
50572064ec7109 Ilkka Koskinen 2024-02-09  2403  			/*
50572064ec7109 Ilkka Koskinen 2024-02-09  2404  			 * AmpereOneX erratum AC04_MESH_1 makes some XPs report a bogus
50572064ec7109 Ilkka Koskinen 2024-02-09  2405  			 * child count larger than the number of valid child pointers.
50572064ec7109 Ilkka Koskinen 2024-02-09  2406  			 * A child offset of 0 can only occur on CMN-600; otherwise it
50572064ec7109 Ilkka Koskinen 2024-02-09  2407  			 * would imply the root node being its own grandchild, which
50572064ec7109 Ilkka Koskinen 2024-02-09  2408  			 * we can safely dismiss in general.
50572064ec7109 Ilkka Koskinen 2024-02-09  2409  			 */
50572064ec7109 Ilkka Koskinen 2024-02-09  2410  			if (reg == 0 && cmn->part != PART_CMN600) {
50572064ec7109 Ilkka Koskinen 2024-02-09  2411  				dev_dbg(cmn->dev, "bogus child pointer?\n");
50572064ec7109 Ilkka Koskinen 2024-02-09  2412  				continue;
50572064ec7109 Ilkka Koskinen 2024-02-09  2413  			}
0ba64770a2f2e5 Robin Murphy   2020-09-18  2414  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2415  			arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, dn);
dfdf714fed559c Namhyung Kim   2024-11-20  2416  			dn->portid_bits = xp->portid_bits;
dfdf714fed559c Namhyung Kim   2024-11-20  2417  			dn->deviceid_bits = xp->deviceid_bits;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2418  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2419  			switch (dn->type) {
0ba64770a2f2e5 Robin Murphy   2020-09-18  2420  			case CMN_TYPE_DTC:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2421  				cmn->num_dtcs++;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2422  				dn++;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2423  				break;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2424  			/* These guys have PMU events */
0ba64770a2f2e5 Robin Murphy   2020-09-18  2425  			case CMN_TYPE_DVM:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2426  			case CMN_TYPE_HNI:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2427  			case CMN_TYPE_HNF:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2428  			case CMN_TYPE_SBSX:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2429  			case CMN_TYPE_RNI:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2430  			case CMN_TYPE_RND:
60d1504070c22c Robin Murphy   2021-12-03  2431  			case CMN_TYPE_MTSX:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2432  			case CMN_TYPE_CXRA:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2433  			case CMN_TYPE_CXHA:
23760a0144173e Robin Murphy   2022-04-18  2434  			case CMN_TYPE_CCRA:
23760a0144173e Robin Murphy   2022-04-18  2435  			case CMN_TYPE_CCHA:
ac18ea1a893592 Robin Murphy   2023-07-07  2436  			case CMN_TYPE_HNS:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2437  				dn++;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2438  				break;
88b63a82c84ed9 Robin Murphy   2024-09-02  2439  			case CMN_TYPE_CCLA:
88b63a82c84ed9 Robin Murphy   2024-09-02  2440  				dn->pmu_base += CMN_CCLA_PMU_EVENT_SEL;
88b63a82c84ed9 Robin Murphy   2024-09-02  2441  				dn++;
88b63a82c84ed9 Robin Murphy   2024-09-02  2442  				break;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2443  			/* Nothing to see here */
60d1504070c22c Robin Murphy   2021-12-03  2444  			case CMN_TYPE_MPAM_S:
60d1504070c22c Robin Murphy   2021-12-03  2445  			case CMN_TYPE_MPAM_NS:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2446  			case CMN_TYPE_RNSAM:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2447  			case CMN_TYPE_CXLA:
ac18ea1a893592 Robin Murphy   2023-07-07  2448  			case CMN_TYPE_HNS_MPAM_S:
ac18ea1a893592 Robin Murphy   2023-07-07  2449  			case CMN_TYPE_HNS_MPAM_NS:
0dc2f4963f7ef1 Robin Murphy   2024-09-02  2450  			case CMN_TYPE_APB:
0ba64770a2f2e5 Robin Murphy   2020-09-18  2451  				break;
8e504d93acb647 Robin Murphy   2022-04-18  2452  			/*
8e504d93acb647 Robin Murphy   2022-04-18  2453  			 * Split "optimised" combination nodes into separate
8e504d93acb647 Robin Murphy   2022-04-18  2454  			 * types for the different event sets. Offsetting the
8e504d93acb647 Robin Murphy   2022-04-18  2455  			 * base address lets us handle the second pmu_event_sel
8e504d93acb647 Robin Murphy   2022-04-18  2456  			 * register via the normal mechanism later.
8e504d93acb647 Robin Murphy   2022-04-18  2457  			 */
8e504d93acb647 Robin Murphy   2022-04-18  2458  			case CMN_TYPE_HNP:
23760a0144173e Robin Murphy   2022-04-18  2459  			case CMN_TYPE_CCLA_RNI:
8e504d93acb647 Robin Murphy   2022-04-18  2460  				dn[1] = dn[0];
88b63a82c84ed9 Robin Murphy   2024-09-02  2461  				dn[0].pmu_base += CMN_CCLA_PMU_EVENT_SEL;
8e504d93acb647 Robin Murphy   2022-04-18  2462  				dn[1].type = arm_cmn_subtype(dn->type);
8e504d93acb647 Robin Murphy   2022-04-18  2463  				dn += 2;
8e504d93acb647 Robin Murphy   2022-04-18  2464  				break;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2465  			/* Something has gone horribly wrong */
0ba64770a2f2e5 Robin Murphy   2020-09-18  2466  			default:
887e2cff0f8dc4 Will Deacon    2020-10-01  2467  				dev_err(cmn->dev, "invalid device node type: 0x%x\n", dn->type);
0ba64770a2f2e5 Robin Murphy   2020-09-18  2468  				return -ENODEV;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2469  			}
0ba64770a2f2e5 Robin Murphy   2020-09-18  2470  		}
0ba64770a2f2e5 Robin Murphy   2020-09-18  2471  	}
0ba64770a2f2e5 Robin Murphy   2020-09-18  2472  
8e504d93acb647 Robin Murphy   2022-04-18  2473  	/* Correct for any nodes we added or skipped */
0ba64770a2f2e5 Robin Murphy   2020-09-18  2474  	cmn->num_dns = dn - cmn->dns;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2475  
8e504d93acb647 Robin Murphy   2022-04-18  2476  	/* Cheeky +1 to help terminate pointer-based iteration later */
da5f7d2c8019c9 Robin Murphy   2021-12-03  2477  	sz = (void *)(dn + 1) - (void *)cmn->dns;
da5f7d2c8019c9 Robin Murphy   2021-12-03  2478  	dn = devm_krealloc(cmn->dev, cmn->dns, sz, GFP_KERNEL);
da5f7d2c8019c9 Robin Murphy   2021-12-03  2479  	if (dn)
da5f7d2c8019c9 Robin Murphy   2021-12-03  2480  		cmn->dns = dn;
da5f7d2c8019c9 Robin Murphy   2021-12-03  2481  
60d1504070c22c Robin Murphy   2021-12-03  2482  	sz = (void *)dtm - (void *)cmn->dtms;
60d1504070c22c Robin Murphy   2021-12-03  2483  	dtm = devm_krealloc(cmn->dev, cmn->dtms, sz, GFP_KERNEL);
60d1504070c22c Robin Murphy   2021-12-03  2484  	if (dtm)
60d1504070c22c Robin Murphy   2021-12-03  2485  		cmn->dtms = dtm;
60d1504070c22c Robin Murphy   2021-12-03  2486  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2487  	/*
0ba64770a2f2e5 Robin Murphy   2020-09-18  2488  	 * If mesh_x wasn't set during discovery then we never saw
0ba64770a2f2e5 Robin Murphy   2020-09-18  2489  	 * an XP at (0,1), thus we must have an Nx1 configuration.
0ba64770a2f2e5 Robin Murphy   2020-09-18  2490  	 */
0ba64770a2f2e5 Robin Murphy   2020-09-18  2491  	if (!cmn->mesh_x)
0ba64770a2f2e5 Robin Murphy   2020-09-18  2492  		cmn->mesh_x = cmn->num_xps;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2493  	cmn->mesh_y = cmn->num_xps / cmn->mesh_x;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2494  
60d1504070c22c Robin Murphy   2021-12-03  2495  	/* 1x1 config plays havoc with XP event encodings */
60d1504070c22c Robin Murphy   2021-12-03  2496  	if (cmn->num_xps == 1)
60d1504070c22c Robin Murphy   2021-12-03  2497  		dev_warn(cmn->dev, "1x1 config not fully supported, translate XP events manually\n");
60d1504070c22c Robin Murphy   2021-12-03  2498  
7819e05a0dceac Robin Murphy   2023-06-12  2499  	dev_dbg(cmn->dev, "periph_id part 0x%03x revision %d\n", cmn->part, cmn->rev);
60d1504070c22c Robin Murphy   2021-12-03  2500  	reg = cmn->ports_used;
60d1504070c22c Robin Murphy   2021-12-03  2501  	dev_dbg(cmn->dev, "mesh %dx%d, ID width %d, ports %6pbl%s\n",
60d1504070c22c Robin Murphy   2021-12-03  2502  		cmn->mesh_x, cmn->mesh_y, arm_cmn_xyidbits(cmn), &reg,
60d1504070c22c Robin Murphy   2021-12-03  2503  		cmn->multi_dtm ? ", multi-DTM" : "");
0ba64770a2f2e5 Robin Murphy   2020-09-18  2504  
0ba64770a2f2e5 Robin Murphy   2020-09-18  2505  	return 0;
0ba64770a2f2e5 Robin Murphy   2020-09-18  2506  }
0ba64770a2f2e5 Robin Murphy   2020-09-18  2507  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

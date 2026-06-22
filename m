Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E735AC13
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136448; cv=none; b=LPrrX1Nvr1u0RnHdC/1yxjK7T1dgcStt7tU6ZIupW2HKPF6aWdtSDeqLlgLaKH6+WvWEjhfFBW2uu7jpxP1F0F3seFqIF61xJ+55RWRkN4EFNpIZKosRaVsE74ynjxGrHZG4rGvmFDd5VsWAzwoYJSgLjU8sUTnS7pLXYU6wy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136448; c=relaxed/simple;
	bh=BiAqo8b9dORVdxLjgbiJh3qCFfjbt9uRhV7kej60DJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=og/jf30algBnC8KlJaO47E9nGz82n9hfCtM63WEQrcUJq3LxR9odtRSliNyG65R8xqU5jo124Xq3r2zVXvhk0ebVsPtEMSnm2u0DN/0G9/hNPJ22YMMmgBkWvPM8pwHAdhcFAdj3H50J2ybG7cXTS6OPqjOoQwZP6KzaE6KKrp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQcE0DT1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQcE0DT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782136447; x=1813672447;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BiAqo8b9dORVdxLjgbiJh3qCFfjbt9uRhV7kej60DJo=;
  b=OQcE0DT1e2AdG4KkfsCBONVEeyFVyfPLGJBwn2r+TH/JGgB3MWF9Vflr
   6zjFTs/wJ46omIYT1xC9gB9vwZGhsV/9PyEmPzvRUfE89NhMsN3TzmC3z
   KOjkzzDtYAJmLMfvg89IHQh9JD3zJD5zFAihDxFZYLxH2JYk/5n0xGm7h
   tcV70qOXSsXZiYcJ6A1CbaJWpk59JYaQTDy/6ZVl7kZOBdpY8hHXewkph
   m+IR8wmrpXjFyajthydbY6Q1mTeUC7qYSPJ8rny4AdGTnkZAqMRGt+vsv
   oRVcPUAkVKET9Rg1OgDhIAi+tNMHOFyYQi9gWhU77B0x/tXYp5Md21Mww
   w==;
X-CSE-ConnectionGUID: fQgCJ8cvT7Gaf+cLWbo89Q==
X-CSE-MsgGUID: 28FIgGLdTo+fAUbF68nVLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="100417090"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="100417090"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 06:54:06 -0700
X-CSE-ConnectionGUID: bsW4Yv0RQH+0brpSgWbDnQ==
X-CSE-MsgGUID: lhU1dtN7T7ytZPjdxnqHAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="249344679"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Jun 2026 06:54:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbf6A-000000001Gc-03jv;
	Mon, 22 Jun 2026 13:54:02 +0000
Date: Mon, 22 Jun 2026 21:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/nvme/host/core.c:2411:13: sparse: sparse: unsigned
 value that used to be signed checked against zero?
Message-ID: <202606222138.OKwmfFNN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check warning: drivers/n=
vme/host/core.c:2411:13: sparse: sparse: unsigned value that used to be sig=
ned checked against zero?"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chao Shi <coshi036@gmail.com>
CC: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: c8cdecdb47d3191146ab6a90b422d3271bc1ef89 nvme: core: reject invalid=
 LBA data size from Identify Namespace
date:   5 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: microblaze-randconfig-r122-20260618 (https://download.01.org/0day-c=
i/archive/20260622/202606222138.OKwmfFNN-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260622/202606222138.OKwmfFNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: c8cdecdb47d3 ("nvme: core: reject invalid LBA data size from Ident=
ify Namespace")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606222138.OKwmfFNN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/core.c:2411:13: sparse: sparse: unsigned value that us=
ed to be signed checked against zero?
   drivers/nvme/host/core.c:2411:13: sparse: signed value source

vim +2411 drivers/nvme/host/core.c

30b5f20bb2ddab0 Keith Busch         2025-05-06  2366 =20
1a893c2bfef46ac Christoph Hellwig   2022-07-22  2367  static int nvme_updat=
e_ns_info_block(struct nvme_ns *ns,
1a893c2bfef46ac Christoph Hellwig   2022-07-22  2368  		struct nvme_ns_info=
 *info)
ac81bfa9867103c Matias Bj=C3=B8rling     2016-09-16  2369  {
e6c9b130d681443 Christoph Hellwig   2024-03-04  2370  	struct queue_limits =
lim;
e5ea00a510c61e9 Christoph Hellwig   2024-03-04  2371  	struct nvme_id_ns_nv=
m *nvm =3D NULL;
c85c9ab926a592e Christoph Hellwig   2024-04-02  2372  	struct nvme_zone_inf=
o zi =3D {};
1a893c2bfef46ac Christoph Hellwig   2022-07-22  2373  	struct nvme_id_ns *i=
d;
1e1a9cecfab3f22 Christoph Hellwig   2025-01-31  2374  	unsigned int memflag=
s;
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2375  	sector_t capacity;
1a893c2bfef46ac Christoph Hellwig   2022-07-22  2376  	unsigned lbaf;
240e6ee272c07a2 Keith Busch         2020-06-29  2377  	int ret;
1673f1f08c8876f Christoph Hellwig   2015-11-26  2378 =20
1a893c2bfef46ac Christoph Hellwig   2022-07-22  2379  	ret =3D nvme_identif=
y_ns(ns->ctrl, info->nsid, &id);
1a893c2bfef46ac Christoph Hellwig   2022-07-22  2380  	if (ret)
1a893c2bfef46ac Christoph Hellwig   2022-07-22  2381  		return ret;
1a893c2bfef46ac Christoph Hellwig   2022-07-22  2382 =20
d8b90d600aff181 Ewan D. Milne       2023-11-27  2383  	if (id->ncap =3D=3D =
0) {
d8b90d600aff181 Ewan D. Milne       2023-11-27  2384  		/* namespace not al=
located or attached */
d8b90d600aff181 Ewan D. Milne       2023-11-27  2385  		info->is_removed =
=3D true;
0551ec93a00d935 Christoph Hellwig   2024-04-03  2386  		ret =3D -ENXIO;
46e7422cda8482a Christoph Hellwig   2024-03-04  2387  		goto out;
d8b90d600aff181 Ewan D. Milne       2023-11-27  2388  	}
c85c9ab926a592e Christoph Hellwig   2024-04-02  2389  	lbaf =3D nvme_lbaf_i=
ndex(id->flbas);
d8b90d600aff181 Ewan D. Milne       2023-11-27  2390 =20
823340b7e877b41 Caleb Sander Mateos 2026-02-27  2391  	if (nvme_id_cns_ok(n=
s->ctrl, NVME_ID_CNS_CS_NS)) {
e5ea00a510c61e9 Christoph Hellwig   2024-03-04  2392  		ret =3D nvme_identi=
fy_ns_nvm(ns->ctrl, info->nsid, &nvm);
e5ea00a510c61e9 Christoph Hellwig   2024-03-04  2393  		if (ret < 0)
e5ea00a510c61e9 Christoph Hellwig   2024-03-04  2394  			goto out;
d8b90d600aff181 Ewan D. Milne       2023-11-27  2395  	}
d8b90d600aff181 Ewan D. Milne       2023-11-27  2396 =20
c85c9ab926a592e Christoph Hellwig   2024-04-02  2397  	if (IS_ENABLED(CONFI=
G_BLK_DEV_ZONED) &&
c85c9ab926a592e Christoph Hellwig   2024-04-02  2398  	    ns->head->ids.cs=
i =3D=3D NVME_CSI_ZNS) {
c85c9ab926a592e Christoph Hellwig   2024-04-02  2399  		ret =3D nvme_query_=
zone_info(ns, lbaf, &zi);
c85c9ab926a592e Christoph Hellwig   2024-04-02  2400  		if (ret < 0)
c85c9ab926a592e Christoph Hellwig   2024-04-02  2401  			goto out;
c85c9ab926a592e Christoph Hellwig   2024-04-02  2402  	}
c85c9ab926a592e Christoph Hellwig   2024-04-02  2403 =20
30b5f20bb2ddab0 Keith Busch         2025-05-06  2404  	if (ns->ctrl->ctratt=
 & NVME_CTRL_ATTR_FDPS) {
30b5f20bb2ddab0 Keith Busch         2025-05-06  2405  		ret =3D nvme_query_=
fdp_info(ns, info);
30b5f20bb2ddab0 Keith Busch         2025-05-06  2406  		if (ret < 0)
30b5f20bb2ddab0 Keith Busch         2025-05-06  2407  			goto out;
30b5f20bb2ddab0 Keith Busch         2025-05-06  2408  	}
30b5f20bb2ddab0 Keith Busch         2025-05-06  2409 =20
c8cdecdb47d3191 Chao Shi            2026-05-15  2410  	if (id->lbaf[lbaf].d=
s < SECTOR_SHIFT ||
c8cdecdb47d3191 Chao Shi            2026-05-15 @2411  	    check_shl_overfl=
ow(le64_to_cpu(id->nsze),
c8cdecdb47d3191 Chao Shi            2026-05-15  2412  			       id->lbaf[lb=
af].ds - SECTOR_SHIFT,
c8cdecdb47d3191 Chao Shi            2026-05-15  2413  			       &capacity))=
 {
c8cdecdb47d3191 Chao Shi            2026-05-15  2414  		dev_warn_once(ns->c=
trl->device,
c8cdecdb47d3191 Chao Shi            2026-05-15  2415  			"invalid LBA data =
size %u, skipping namespace\n",
c8cdecdb47d3191 Chao Shi            2026-05-15  2416  			id->lbaf[lbaf].ds);
c8cdecdb47d3191 Chao Shi            2026-05-15  2417  		ret =3D -ENODEV;
c8cdecdb47d3191 Chao Shi            2026-05-15  2418  		goto out;
c8cdecdb47d3191 Chao Shi            2026-05-15  2419  	}
c8cdecdb47d3191 Chao Shi            2026-05-15  2420 =20
473106dd3aa964a Christoph Hellwig   2025-01-10  2421  	lim =3D queue_limits=
_start_update(ns->disk->queue);
473106dd3aa964a Christoph Hellwig   2025-01-10  2422 =20
1e1a9cecfab3f22 Christoph Hellwig   2025-01-31  2423  	memflags =3D blk_mq_=
freeze_queue(ns->disk->queue);
9419e71b8d67312 Daniel Wagner       2023-12-18  2424  	ns->head->lba_shift =
=3D id->lbaf[lbaf].ds;
a1a825ab6a60380 Daniel Wagner       2023-12-18  2425  	ns->head->nuse =3D l=
e64_to_cpu(id->nuse);
bc840b21a25a50f Keith Busch         2025-10-14  2426  	nvme_set_ctrl_limits=
(ns->ctrl, &lim, false);
6339b7edada2d0c Kanchan Joshi       2024-07-30  2427  	nvme_configure_metad=
ata(ns->ctrl, ns->head, id, nvm, info);
e6c9b130d681443 Christoph Hellwig   2024-03-04  2428  	nvme_set_chunk_secto=
rs(ns, id, &lim);
1029298da365598 Caleb Sander Mateos 2026-02-27  2429  	if (!nvme_update_dis=
k_info(ns, id, nvm, &lim))
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2430  		capacity =3D 0;
8695f060a02953b Alan Adamson        2025-05-08  2431 =20
e6c9b130d681443 Christoph Hellwig   2024-03-04  2432  	if (IS_ENABLED(CONFI=
G_BLK_DEV_ZONED) &&
c85c9ab926a592e Christoph Hellwig   2024-04-02  2433  	    ns->head->ids.cs=
i =3D=3D NVME_CSI_ZNS)
c85c9ab926a592e Christoph Hellwig   2024-04-02  2434  		nvme_update_zone_in=
fo(ns, &lim, &zi);
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2435 =20
8a825d22a70915b Guixin Liu          2024-11-04  2436  	if ((ns->ctrl->vwc &=
 NVME_CTRL_VWC_PRESENT) && !info->no_vwc)
1122c0c1cc71f74 Christoph Hellwig   2024-06-17  2437  		lim.features |=3D B=
LK_FEAT_WRITE_CACHE | BLK_FEAT_FUA;
1122c0c1cc71f74 Christoph Hellwig   2024-06-17  2438  	else
1122c0c1cc71f74 Christoph Hellwig   2024-06-17  2439  		lim.features &=3D ~=
(BLK_FEAT_WRITE_CACHE | BLK_FEAT_FUA);
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2440 =20
1d811438851bae0 Wang Yugui          2024-10-10  2441  	if (info->is_rotatio=
nal)
1d811438851bae0 Wang Yugui          2024-10-10  2442  		lim.features |=3D B=
LK_FEAT_ROTATIONAL;
1d811438851bae0 Wang Yugui          2024-10-10  2443 =20
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2444  	/*
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2445  	 * Register a metada=
ta profile for PI, or the plain non-integrity NVMe
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2446  	 * metadata masquera=
ding as Type 0 if supported, otherwise reject block
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2447  	 * I/O to namespaces=
 with metadata except when the namespace supports
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2448  	 * PI, as it can str=
ip/insert in that case.
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2449  	 */
6339b7edada2d0c Kanchan Joshi       2024-07-30  2450  	if (!nvme_init_integ=
rity(ns->head, &lim, info))
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2451  		capacity =3D 0;
a5b1cd61820e88d Christoph Hellwig   2024-03-04  2452 =20
30b5f20bb2ddab0 Keith Busch         2025-05-06  2453  	lim.max_write_stream=
s =3D ns->head->nr_plids;
30b5f20bb2ddab0 Keith Busch         2025-05-06  2454  	if (lim.max_write_st=
reams)
86b6e0bd1a69efd Caleb Sander Mateos 2025-05-06  2455  		lim.write_stream_gr=
anularity =3D min(info->runs, U32_MAX);
30b5f20bb2ddab0 Keith Busch         2025-05-06  2456  	else
30b5f20bb2ddab0 Keith Busch         2025-05-06  2457  		lim.write_stream_gr=
anularity =3D 0;
30b5f20bb2ddab0 Keith Busch         2025-05-06  2458 =20
1b96f862ecccb3e Christoph Hellwig   2022-10-30  2459  	/*
1b96f862ecccb3e Christoph Hellwig   2022-10-30  2460  	 * Only set the DEAC=
 bit if the device guarantees that reads from
1b96f862ecccb3e Christoph Hellwig   2022-10-30  2461  	 * deallocated data =
return zeroes.  While the DEAC bit does not
1b96f862ecccb3e Christoph Hellwig   2022-10-30  2462  	 * require that, it =
must be a no-op if reads from deallocated data
1b96f862ecccb3e Christoph Hellwig   2022-10-30  2463  	 * do not return zer=
oes.
1b96f862ecccb3e Christoph Hellwig   2022-10-30  2464  	 */
545fb46e5bc6ffa Zhang Yi            2025-06-19  2465  	if ((id->dlfeat & 0x=
7) =3D=3D 0x1 && (id->dlfeat & (1 << 3))) {
9419e71b8d67312 Daniel Wagner       2023-12-18  2466  		ns->head->features =
|=3D NVME_NS_DEAC;
545fb46e5bc6ffa Zhang Yi            2025-06-19  2467  		lim.max_hw_wzeroes_=
unmap_sectors =3D lim.max_write_zeroes_sectors;
545fb46e5bc6ffa Zhang Yi            2025-06-19  2468  	}
545fb46e5bc6ffa Zhang Yi            2025-06-19  2469 =20
545fb46e5bc6ffa Zhang Yi            2025-06-19  2470  	ret =3D queue_limits=
_commit_update(ns->disk->queue, &lim);
545fb46e5bc6ffa Zhang Yi            2025-06-19  2471  	if (ret) {
545fb46e5bc6ffa Zhang Yi            2025-06-19  2472  		blk_mq_unfreeze_que=
ue(ns->disk->queue, memflags);
545fb46e5bc6ffa Zhang Yi            2025-06-19  2473  		goto out;
545fb46e5bc6ffa Zhang Yi            2025-06-19  2474  	}
545fb46e5bc6ffa Zhang Yi            2025-06-19  2475 =20
545fb46e5bc6ffa Zhang Yi            2025-06-19  2476  	set_capacity_and_not=
ify(ns->disk, capacity);
1e4ea66af1db4fd Christoph Hellwig   2022-07-13  2477  	set_disk_ro(ns->disk=
, nvme_ns_is_readonly(ns, info));
e7d65803e2bb5bc Hannes Reinecke     2021-08-24  2478  	set_bit(NVME_NS_READ=
Y, &ns->flags);
1e1a9cecfab3f22 Christoph Hellwig   2025-01-31  2479  	blk_mq_unfreeze_queu=
e(ns->disk->queue, memflags);
1673f1f08c8876f Christoph Hellwig   2015-11-26  2480 =20
3a9967ba7ace911 Christoph Hellwig   2020-09-28  2481  	if (blk_queue_is_zon=
ed(ns->queue)) {
9b3c08b90fc212d Damien Le Moal      2024-04-08  2482  		ret =3D blk_revalid=
ate_disk_zones(ns->disk);
8685699c28d7452 Keith Busch         2020-10-23  2483  		if (ret && !nvme_fi=
rst_scan(ns->disk))
e06b425bc835ead Christoph Hellwig   2022-07-21  2484  			goto out;
b29f84857a0f1cb Max Gurtovoy        2020-05-19  2485  	}
b29f84857a0f1cb Max Gurtovoy        2020-05-19  2486 =20
e06b425bc835ead Christoph Hellwig   2022-07-21  2487  	ret =3D 0;
e06b425bc835ead Christoph Hellwig   2022-07-21  2488  out:
e5ea00a510c61e9 Christoph Hellwig   2024-03-04  2489  	kfree(nvm);
1a893c2bfef46ac Christoph Hellwig   2022-07-22  2490  	kfree(id);
240e6ee272c07a2 Keith Busch         2020-06-29  2491  	return ret;
240e6ee272c07a2 Keith Busch         2020-06-29  2492  }
240e6ee272c07a2 Keith Busch         2020-06-29  2493 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

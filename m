Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926056;
	b=fPUGB4t0aE12UZ61cSYJRABOd3oX61peDYfboFGbiZY8IgtSb0GVoE478dbizRRaL2cl
	 FtzUt7MJhGAB2OWqxSAN80jr8WQRiMuJN2CrNFZ31ulghzuZFOMO43DmUIJiSd8QZ+NOj
	 FA2DxNcDBFIe0+u5U6E2sYFj6Mo1AiESgFpQx9Nc2bue8yGz79rrEA0aOu3Ctbqh+EoGF
	 v5zA/4uamvUPNQPYEQzBxNAOFUCbmuVu75UUbsz87ezhRl7DOiaTvfxUfGHv1XdrJtcH7
	 hX8KlPraVYmznAahXrh9i0Z0d8FfHzD1j26cyOau2U8NDsTcev1AYKxkqXo+WVkI/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926056;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/45SiLZHJ80Wx9TfVBqpgnyUMelLbKCZnpjyIXNlw4k=;
	b=gLUdqOJc0rAVFLB7eiSSDCtTUlKRgakhsnLQqcFQLAgs489a6nrzJ0MXmCMjT8nO8jmo
	 CaU7vLofetE0uFXRJxBJWBwivAI0LIJyPIht/lJZ5B2qkApIfrT8rCX9X86LegMyW/F9F
	 qgQDlZM2D2Lbll/53ql3nXF8BWmVmOjOph5VN/o+msCxbVa1wjk/esE2UdodgD/IxAXyI
	 VcfDC1H+mjR94EI1WPALm3pygSy3+I+IFVf0e0rF2N3V+WDAjg6s959jc0yhgswPJkGUa
	 9eYKEp1/9qs0BTY03bgY0RcCd3JJqMU7EMsqWI3FFGEOuhZZ0tjAnhaDNRSblUZRTVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C5ju5qgZ;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A1A606A32E
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 00:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A1A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C5ju5qgZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793926055; x=1825462055;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OmScrtXFNExaTms3eQa0wdS1ToSx52eleQQNi9XOyb8=;
  b=C5ju5qgZk9HFzhRfr7IpG4fELFvUcKitoR9FUCElz2gToSr1CgubId9P
   KAv+0mPKVYytEsaZrcctavfKJD/0n69s7LPcF6+O3T1rPSleVvRrtLu4g
   cBUKI45/4kw16rc2fGA6f99zuiggYvdiYM9tM5rafME5AAw/IHs6gI5VV
   AvcSnAFq3aQZmwFwV1RIWbggdQgVUMjmgP+weEZ8ZE5kftQnEtVTrLG7t
   IuVQ7hWIcTKAEta4ToQbXcHH3b2KjZcgXmwevoovuvXK8WFrnE8lTvPym
   TmQh5MJ3HyYXYm18bqQQiYSzRCXP/iIJP119NaFwJfO0F4ltxUDYBdZJH
   A==;
X-CSE-ConnectionGUID: Ocg40jUYT5elDBIdKg9aZg==
X-CSE-MsgGUID: c3UmQrosTDiIfJjho2VxrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2650287"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2650287"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:47:35 -0800
X-CSE-ConnectionGUID: VnUpdQApRV6NPsiWs+EdVA==
X-CSE-MsgGUID: X3W2Qfd/SFCv766LZOqXeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7708814"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Nov 2026 16:47:34 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP879-000000009wJ-3PDv;
	Fri, 06 Nov 2026 00:47:31 +0000
Date: Fri, 06 Nov 2026 01:47:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18-p3s 58/58]
 drivers/pci/setup-bus.c:2565 pbus_reassign_bridge_resources() warn: missing
 unwind goto?
Message-ID: <202611060128.RCBrSzaY-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   72e5254c5ad31e326d43225a62f3d7253c51c9d2
commit: 3ab10f83e277ba9640742cbba67b8df369591450 [58/58] PCI: Fix finding b=
ridge window in pci_reassign_bridge_resources()
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 2 months ago
config: i386-randconfig-2200-20261105 (https://download.01.org/0day-ci/arch=
ive/20261106/202611060128.RCBrSzaY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 3ab10f83e277 ("PCI: Fix finding bridge window in pci_reassign_brid=
ge_resources()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060128.RCBrSzaY-lkp@intel.com/

smatch warnings:
drivers/pci/setup-bus.c:2565 pbus_reassign_bridge_resources() warn: missing=
 unwind goto?

vim +2565 drivers/pci/setup-bus.c

9b03088f955552 Yinghai Lu             2012-01-21  2524 =20
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2525  /*
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2526   * Walk to the=
 root bus, find the bridge window relevant for @res and
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2527   * release it =
when possible. If the bridge window contains assigned
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2528   * resources, =
it cannot be released.
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2529   */
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2530  int pbus_reass=
ign_bridge_resources(struct pci_bus *bus, struct resource *res)
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2531  {
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2532  	unsigned long=
 type =3D res->flags;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2533  	struct pci_de=
v_resource *dev_res;
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2534  	struct pci_de=
v *bridge;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2535  	LIST_HEAD(sav=
ed);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2536  	LIST_HEAD(add=
ed);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2537  	LIST_HEAD(fai=
led);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2538  	unsigned int =
i;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2539  	int ret;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2540 =20
fb794a708a71d7 Benjamin Herrenschmidt 2019-09-25  2541  	down_read(&pci_bus=
_sem);
fb794a708a71d7 Benjamin Herrenschmidt 2019-09-25  2542 =20
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2543  	while (!pci_i=
s_root_bus(bus)) {
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2544  		bridge =3D b=
us->self;
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2545  		res =3D pbus=
_select_window(bus, res);
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2546  		if (!res)
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2547  			break;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2548 =20
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2549  		i =3D pci_re=
source_num(bridge, res);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2550 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2551  		/* Ignore BA=
Rs which are still in use */
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2552  		if (!res->ch=
ild) {
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2553  			ret =3D add=
_to_list(&saved, bridge, res, 0, 0);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2554  			if (ret)
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2555  				goto clean=
up;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2556 =20
3baeae36039afc Ilpo J=C3=A4rvinen          2025-08-29  2557  			pci_release=
_resource(bridge, i);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2558  		}
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2559 =20
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2560  		bus =3D bus-=
>parent;
3ab10f83e277ba Ilpo J=C3=A4rvinen          2025-08-29  2561  	}
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2562 =20
fb794a708a71d7 Benjamin Herrenschmidt 2019-09-25  2563  	if (list_empty(&sa=
ved)) {
fb794a708a71d7 Benjamin Herrenschmidt 2019-09-25  2564  		up_read(&pci_bus_=
sem);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24 @2565  		return -ENOE=
NT;
fb794a708a71d7 Benjamin Herrenschmidt 2019-09-25  2566  	}
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2567 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2568  	__pci_bus_siz=
e_bridges(bridge->subordinate, &added);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2569  	__pci_bridge_=
assign_resources(bridge, &added, &failed);
af6e3defb11a1c Ilpo J=C3=A4rvinen          2025-05-12  2570  	if (WARN_ON_O=
NCE(!list_empty(&added)))
af6e3defb11a1c Ilpo J=C3=A4rvinen          2025-05-12  2571  		free_list(&a=
dded);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2572 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2573  	if (!list_emp=
ty(&failed)) {
31af09b3eaf360 Ilpo J=C3=A4rvinen          2025-06-30  2574  		if (pci_requ=
ired_resource_failed(&failed, type)) {
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2575  			ret =3D -EN=
OSPC;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2576  			goto cleanu=
p;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2577  		}
31af09b3eaf360 Ilpo J=C3=A4rvinen          2025-06-30  2578  		/* Only reso=
urces with unrelated types failed (again) */
31af09b3eaf360 Ilpo J=C3=A4rvinen          2025-06-30  2579  		free_list(&f=
ailed);
31af09b3eaf360 Ilpo J=C3=A4rvinen          2025-06-30  2580  	}
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2581 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2582  	list_for_each=
_entry(dev_res, &saved, list) {
0d6076184aecb9 Nicholas Johnson       2019-05-07  2583  		/* Skip the bridg=
e we just assigned resources for */
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2584  		if (bridge =
=3D=3D dev_res->dev)
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2585  			continue;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2586 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2587  		bridge =3D d=
ev_res->dev;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2588  		pci_setup_br=
idge(bridge->subordinate);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2589  	}
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2590 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2591  	free_list(&sa=
ved);
fb794a708a71d7 Benjamin Herrenschmidt 2019-09-25  2592  	up_read(&pci_bus_s=
em);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2593  	return 0;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2594 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2595  cleanup:
0d6076184aecb9 Nicholas Johnson       2019-05-07  2596  	/* Restore size an=
d flags */
4e362abe482def Ilpo J=C3=A4rvinen          2024-12-16  2597  	list_for_each=
_entry(dev_res, &failed, list)
4e362abe482def Ilpo J=C3=A4rvinen          2024-12-16  2598  		restore_dev_=
resource(dev_res);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2599  	free_list(&fa=
iled);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2600 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2601  	/* Revert to =
the old configuration */
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2602  	list_for_each=
_entry(dev_res, &saved, list) {
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2603  		struct resou=
rce *res =3D dev_res->res;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2604 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2605  		bridge =3D d=
ev_res->dev;
e4728eed24a32f Ilpo J=C3=A4rvinen          2024-12-16  2606  		i =3D pci_re=
source_num(bridge, res);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2607 =20
4e362abe482def Ilpo J=C3=A4rvinen          2024-12-16  2608  		restore_dev_=
resource(dev_res);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2609 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2610  		pci_claim_re=
source(bridge, i);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2611  		pci_setup_br=
idge(bridge->subordinate);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2612  	}
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2613  	free_list(&sa=
ved);
fb794a708a71d7 Benjamin Herrenschmidt 2019-09-25  2614  	up_read(&pci_bus_s=
em);
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2615 =20
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2616  	return ret;
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2617  }
8bb705e3e79d84 Christian K=C3=B6nig        2017-10-24  2618 =20

:::::: The code at line 2565 was first introduced by commit
:::::: 8bb705e3e79d84e77edd4499e74483dd96a4626c PCI: Add pci_resize_resourc=
e() for resizing BARs

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

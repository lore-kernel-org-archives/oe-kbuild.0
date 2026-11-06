Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793928344;
	b=By9bAbjyCqBL4Wm1gpvFhjmtWZ6rXrPZgQCST4QnCZVNqr1QfJ409mL970tstbzysopu
	 +imJstQHNGeuMpevzEiVwRSLQgCWDJx/LM/QEb1y1M2hnt85s+Gg8Y/OmRvTB7B3mJJQ0
	 Jm4Qz1+uxs1EjLkqM7JKc4gcR0qn/IYeTm28Mksmh5uugVXum+Oxr08DhSHCslukS7Dky
	 5EQh1B1PRaFkqCKeNVBovVBhuXVxwEeOwZoMCzrBCkRytJBtGGziTfznm0JDKXHbevNa2
	 c8qjX6xvdrUjiYGiv1DN8tNDcV8nvCXsQ5coSqOjr95zvDpCeHG/FTUQyHZlIxrNQTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928344;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YZtj49pJeN87GOgHFL+uEWVwwqEbBjpNu8x7aGusvjU=;
	b=hiwWLLW2MPikOh1FxZwrH0k4v4dP/AV6G6XY8QeV9BX4rRz/TFKVhBhmm+4us80hPyUj
	 kpP6vTusFlro4zQc9K2PY3w5s12EBbatnXZ75BlEJWjdc6zvpX1eD3TL5vuLwuMCIu7uf
	 3ONYD06hsKKn4I2rBoQzpi1+yBbPzKm89VpPbP/tByqqg/9hFKItQ+EuvBXqsYTCe/Xc9
	 9uS+3K3GBg6W0wl+HgOZaqpw200OKjs8wMoTCSovI6QYa2kQ9gskd8qw/43gVVOV8PEM3
	 +ulZvDtfeLBjvNnpWfnVCp/fd/RFVuUEMSjQvpvURYFJ/Q/iX4fhwPQUuZNJGevwdVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HaAvd25p;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAB4606A31B
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 01:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEAB4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HaAvd25p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793928342; x=1825464342;
  h=date:from:to:cc:subject:message-id;
  bh=yg78Grqzx0aVKBXgTnwUhU55ec32793YcZUOnJOvIZg=;
  b=HaAvd25p1fBSEZQtTTX6JBUU2ESg9ZIwQreoLD8K/W0JLXsGgPJHGRca
   /saRHulrldinFNqN/HVtRmJckoLPhwGH5TDysiQnkT+4SSFwQJpO0RZKk
   2h2YDkC5lvKyijRo6OL7Oq784C3XstDO7V8w2WqH04hoZuCwlAi4VBAhl
   wwNi8qGDsTh0GE7QIGP1U1gwNrxG1Iumls79aYpswddQGf4oyYHhxVTpa
   hjGXdv0d6HERgBeiMtSXHqPp2vbJ9R6sTGfG2I/83IIUMD4D2aanxwiuS
   P45PKC0M7q3Uo+IwW5sv4IvJpVMpjpwnmMd/8YOudd8trQkOq3NzN4DjQ
   g==;
X-CSE-ConnectionGUID: az54qTXYQtiNpzyrXR/uFg==
X-CSE-MsgGUID: 0JQqZ/G9QKGOCMQOFRzEnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2760278"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2760278"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:25:41 -0800
X-CSE-ConnectionGUID: a96WvSkXQMycrJv4io7X5g==
X-CSE-MsgGUID: LKM56i2CTzORxff6Ni+4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7145729"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2026 17:25:40 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP8hx-000000009x9-3zyZ;
	Fri, 06 Nov 2026 01:25:33 +0000
Date: Fri, 06 Nov 2026 02:24:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:573:3-9:
 ERROR: missing put_device; call of_find_device_by_node on line 566, but
 without a corresponding object release within this function.
Message-ID: <202611060214.kz391Sve-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Johan Hovold <johan@kernel.org>
CC: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d68ce4e71248e1ff5af9654b407541d9260b3ba5
commit: e0f44f74ed6313e50b38eb39a2c7f210ae208db2 drm/mediatek: ovl_adaptor: Fix probe device leaks
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day-ci/archive/20261106/202611060214.kz391Sve-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e0f44f74ed63 ("drm/mediatek: ovl_adaptor: Fix probe device leaks")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611060214.kz391Sve-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:573:3-9: ERROR: missing put_device; call of_find_device_by_node on line 566, but without a corresponding object release within this function.

vim +573 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c

e0f44f74ed6313e Johan Hovold               2025-09-23  536  
453c3364632a1f3 Nancy.Lin                  2023-03-21  537  static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
453c3364632a1f3 Nancy.Lin                  2023-03-21  538  {
453c3364632a1f3 Nancy.Lin                  2023-03-21  539  	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
6a4ae7f095aae36 Javier Carrasco            2024-06-24  540  	struct device_node *parent;
453c3364632a1f3 Nancy.Lin                  2023-03-21  541  	struct platform_device *comp_pdev;
453c3364632a1f3 Nancy.Lin                  2023-03-21  542  
453c3364632a1f3 Nancy.Lin                  2023-03-21  543  	parent = dev->parent->parent->of_node->parent;
453c3364632a1f3 Nancy.Lin                  2023-03-21  544  
6a4ae7f095aae36 Javier Carrasco            2024-06-24  545  	for_each_child_of_node_scoped(parent, node) {
453c3364632a1f3 Nancy.Lin                  2023-03-21  546  		enum mtk_ovl_adaptor_comp_type type;
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  547  		int id, ret;
453c3364632a1f3 Nancy.Lin                  2023-03-21  548  
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  549  		ret = ovl_adaptor_of_get_ddp_comp_type(node, &type);
4c932840db1de4e AngeloGioacchino Del Regno 2024-10-17  550  		if (ret)
453c3364632a1f3 Nancy.Lin                  2023-03-21  551  			continue;
453c3364632a1f3 Nancy.Lin                  2023-03-21  552  
453c3364632a1f3 Nancy.Lin                  2023-03-21  553  		if (!of_device_is_available(node)) {
453c3364632a1f3 Nancy.Lin                  2023-03-21  554  			dev_dbg(dev, "Skipping disabled component %pOF\n",
453c3364632a1f3 Nancy.Lin                  2023-03-21  555  				node);
453c3364632a1f3 Nancy.Lin                  2023-03-21  556  			continue;
453c3364632a1f3 Nancy.Lin                  2023-03-21  557  		}
453c3364632a1f3 Nancy.Lin                  2023-03-21  558  
453c3364632a1f3 Nancy.Lin                  2023-03-21  559  		id = ovl_adaptor_comp_get_id(dev, node, type);
453c3364632a1f3 Nancy.Lin                  2023-03-21  560  		if (id < 0) {
453c3364632a1f3 Nancy.Lin                  2023-03-21  561  			dev_warn(dev, "Skipping unknown component %pOF\n",
453c3364632a1f3 Nancy.Lin                  2023-03-21  562  				 node);
453c3364632a1f3 Nancy.Lin                  2023-03-21  563  			continue;
453c3364632a1f3 Nancy.Lin                  2023-03-21  564  		}
453c3364632a1f3 Nancy.Lin                  2023-03-21  565  
453c3364632a1f3 Nancy.Lin                  2023-03-21 @566  		comp_pdev = of_find_device_by_node(node);
6a4ae7f095aae36 Javier Carrasco            2024-06-24  567  		if (!comp_pdev)
453c3364632a1f3 Nancy.Lin                  2023-03-21  568  			return -EPROBE_DEFER;
453c3364632a1f3 Nancy.Lin                  2023-03-21  569  
e0f44f74ed6313e Johan Hovold               2025-09-23  570  		ret = devm_add_action_or_reset(dev, ovl_adaptor_put_device,
e0f44f74ed6313e Johan Hovold               2025-09-23  571  					       &comp_pdev->dev);
e0f44f74ed6313e Johan Hovold               2025-09-23  572  		if (ret)
e0f44f74ed6313e Johan Hovold               2025-09-23 @573  			return ret;
e0f44f74ed6313e Johan Hovold               2025-09-23  574  
453c3364632a1f3 Nancy.Lin                  2023-03-21  575  		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
453c3364632a1f3 Nancy.Lin                  2023-03-21  576  
07c39476a75bf25 Tang Dongxing              2025-04-03  577  		drm_of_component_match_add(dev, match, component_compare_of, node);
453c3364632a1f3 Nancy.Lin                  2023-03-21  578  		dev_dbg(dev, "Adding component match for %pOF\n", node);
453c3364632a1f3 Nancy.Lin                  2023-03-21  579  	}
453c3364632a1f3 Nancy.Lin                  2023-03-21  580  
453c3364632a1f3 Nancy.Lin                  2023-03-21  581  	if (!*match) {
453c3364632a1f3 Nancy.Lin                  2023-03-21  582  		dev_err(dev, "No match device for ovl_adaptor\n");
453c3364632a1f3 Nancy.Lin                  2023-03-21  583  		return -ENODEV;
453c3364632a1f3 Nancy.Lin                  2023-03-21  584  	}
453c3364632a1f3 Nancy.Lin                  2023-03-21  585  
453c3364632a1f3 Nancy.Lin                  2023-03-21  586  	return 0;
453c3364632a1f3 Nancy.Lin                  2023-03-21  587  }
453c3364632a1f3 Nancy.Lin                  2023-03-21  588  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162014;
	b=g/kgsjscphQnH3XQFEdeWoydIDEAtKJlAeZzfecCgaFik+iuDVJBhSyBOzNJ51XsKKk+
	 yIy9r5l/m3r69KYqWqmjOxk5HbFQnsdxeK6VY35R8jIKHQRlB94a/kMACiA/d5bRu+8n1
	 F7D60XIJJu/Snud5NLx4UgVv5IQ4mlJE0+/JHc00TKVcaf4zQ3Uh6T6oGg/YshlkXBIEo
	 EiTgO/d7AYEnmv3WVhAx22Vlta1b6yfDF2AMdhuNPONbDeu6O31t2in6DyLQ2aXuh8IQ0
	 3+9lH30Jh7j0npixiJkA8DAF1mtsshyYUaCQpN6x3UgWwZtheF3C5rio9q2lUr1LZwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162014;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8tEaVEPU5ZPVAoCRunt3A9FXqf7E93Jamrbxmzguf60=;
	b=jC9IS6hKNXiaIGZ9oUp6I+NnoAS8BDCOVYTfsJLPsHoEyS/wfe5XyaAKwR39J5rWUDrV
	 Cmg6o7IvJb133Ob3cPcpebMvCZv6VOIxEsruuQzF9nFvcqTVYKn/2K/kM2aq2RWzX0h48
	 dt4LncHtZOj+8VAdj5/9x0uKy9fiNAuCVUJxpuBP0owDijORw1tpnPGX6CgJISbIYpDhT
	 IltjK64bggbda+yKiSdVsxwIuPhHxA8l3Nm0zuYdIefEDwFhziF0gr3B+PmN6yzLp7gPv
	 FKOEnwJJR+CZ7ex1oMXVPS9YoJgCk7aYfHT62ABn8tCShS0qrEc89eGQ8gPJpg//1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NVTHn8HC;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB0606A326
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 18:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AB0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NVTHn8HC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794162013; x=1825698013;
  h=date:from:to:cc:subject:message-id;
  bh=EN5q0L3DCzOkiGA9I6wCWYW3u3V48FoR8x8NbwVwOB4=;
  b=NVTHn8HCo35USHjt+f+g6aQRpkllnGsjrNZXEvXRemI/qRdv9W5PoFvD
   f8EvrY4j1i/DTdjqN+nvOWbB9pLvfjYi8UifWEuuZN0mijSVbHlJMvz8Q
   cMXcNXId5940ShMmMJKLa1zVWfEu8zrUoPX86CfYF5A9fbydZfYNSpMfp
   ePqcszMsD1ZYgbDBGdiKz0QyFbkSVQniQvSGM28pyvelCk78ksP2jMfSQ
   zgG0DFt2BmrdAK7vT7yxAx3rMR11XshGpQhyKB0XLaGCBlig9RbSRqtBk
   vUD2/ssgDPqAUzkkr+6lw5YZWSYdlTlPxxI98OAJ/BeGdshzIjv4SIbl7
   g==;
X-CSE-ConnectionGUID: bGEIJA58QSqKZ/kYqj66nQ==
X-CSE-MsgGUID: yZfFHnJYQc+zIp+G8AtTeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2902998"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2902998"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 10:20:13 -0800
X-CSE-ConnectionGUID: xZRMeIwqRA+8Z11+NjNgfw==
X-CSE-MsgGUID: EUvC/v9GQLW/jH0crFZDHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7521039"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Nov 2026 10:20:12 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ7Uv-00000000Bef-2xOC;
	Sun, 08 Nov 2026 18:20:09 +0000
Date: Sun, 08 Nov 2026 19:19:33 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.5-armsoc/dts64 44/44]
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dtb: vop@fdd90000
 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611081936.VJPnnHx8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Joachim Eastwood <joachim.eastwood@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.5-armsoc/dts64
head:   37145821846cb01e1da93753d928e77c42b6bb59
commit: 37145821846cb01e1da93753d928e77c42b6bb59 [44/44] arm64: dts: rockchip: add support for NanoPi M6V2 board
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261108/202611081936.VJPnnHx8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081936.VJPnnHx8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611081936.VJPnnHx8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

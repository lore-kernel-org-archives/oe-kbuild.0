Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF580B
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734855643; cv=none; b=oripbw2btlUlsZ9FtTSm1JXGiFJeCmbc/eXsQ+flNjSQSciE4bbcvUzqHMidHchr3svIpbtAUrtn4wck8Sef1tsXM2GcVykvDGFUrgw+S3p9CNU/1DSV4bKDEUkrtHo1rGSfcZxCt0RQftPFmG21tkmAgVb6yl3kKO9TNN9/d1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734855643; c=relaxed/simple;
	bh=V1+NbgE4I6rgL98t/AliV7JMsjk+tKxvgxeKO4Z9xUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZJJNYWjA0jw7L4kYn8br3YP94WwrseqgLvonF1SX1HnTH7QrIKowMpSbY0FuolkSv5FuJnXy5pBdPk5T9+KMfbPGaJYKVqrmtjfaI2vmsCOjT5uzaCtjUPJFlqwkta7tKFhAbl9EHOOZlF2//AZ1Cm1TPU9Y6SdjerIW5up7K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbhdHuyw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbhdHuyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734855641; x=1766391641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V1+NbgE4I6rgL98t/AliV7JMsjk+tKxvgxeKO4Z9xUY=;
  b=lbhdHuywZulGoZA1B87Obj9jFLeQexp0Jamdz+ZShwwxII+OY2MBE0du
   fMxt+Y9WfN7fAjgB9RHzNvyz5JdorAzTarKmzEM03+28hYrR0T308BBnq
   saqyQl3vhwj2k96tZyOy2j42hWzWGcyF590JzwLkQuiL1SytSymQXfZiX
   5JiBb32gt+n6AYrL50lD238Mgxjyy5TZlaFIsSrEHhYPkg1GYo2ANm3+1
   PaEjhDvSzZV5GtJkHzKpjrOrc/+80BFbbBl3dNf94SzsQMoGHuPmdZP+O
   eC7uz+vPiP094aDAYBvGso4zX+9o9l79kY4I9sVBWs9Mak1NO+xC9x28/
   Q==;
X-CSE-ConnectionGUID: qKB+6Y9BS1OTQfWw/c0nIw==
X-CSE-MsgGUID: ePlimo9nTFSkDDXz/ZRfaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46729384"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="46729384"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 00:20:41 -0800
X-CSE-ConnectionGUID: iz8s0Uy8SfCFktgOZOefJw==
X-CSE-MsgGUID: Dnpz9b4YR8WDI1ChWGQ2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99144461"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2024 00:20:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPHCX-0002o0-1F;
	Sun, 22 Dec 2024 08:20:37 +0000
Date: Sun, 22 Dec 2024 16:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 3/9]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb:
 /soc/usb@c800b000: failed to match any schema with compatible:
 ['intel,ixp4xx-udc']
Message-ID: <202412221642.kWX4t1JB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-netgear-wgr826v
head:   417131a0c509bba7b4db3f1301a0205ebb4ab0d6
commit: 6eb7bf44970b29ea5202340d81c9af406f0cf7c9 [3/9] ARM: dts: Add Netgear WGR826V Device Tree
:::::: branch date: 33 hours ago
:::::: commit date: 13 days ago
config: arm-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241222/202412221642.kWX4t1JB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221642.kWX4t1JB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412221642.kWX4t1JB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: ethernet@c800c000: 'intel,npe' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml#
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /spi/switch@0: failed to match any schema with compatible: ['micrel,ks8995']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

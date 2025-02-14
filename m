Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F33263C61
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 11:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739533150; cv=none; b=USsJLc5rZ+43Ufyfzb9N2NKJ5XKHO8IQyXbA8Dex5P/IHwmPkzIYAwIQvNtfXFFVTEc60iShUta/CwbRfnE7irF5Fi0EBPKsoTFUcAP9FoKnwr0HHUO5sEBfz9H4YiMVZPqPUKyEvxeiWw7CrY9D5hnv9SWnr6sEiucB8isCXdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739533150; c=relaxed/simple;
	bh=NnmU+YTYAAQ8mAElfWRVJTgcEgR0mbB8g3BsFa/Al1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cvtO80iIJ3ZPGS1AjRjZcWn0AesIkCWRY+3l2hdNE6g2tw7j0mjNpgJVxsz1mTIpZ65AZ6WRyPx3Wpc/SRgIyqUUfpiLlhdRZcyIMPcfSwkODbfckBHZCdc5DQ/x6HqAkJGXnP0KrjHYfYTxqQNU/mBaWQTbzaCO8Qjusy7MHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZP2y5rO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZP2y5rO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739533148; x=1771069148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NnmU+YTYAAQ8mAElfWRVJTgcEgR0mbB8g3BsFa/Al1I=;
  b=jZP2y5rOAzuwF7P1nmNo/4OPJ85nY+NkcF6MPpEAWa4ZOHX9WrLNP9hd
   KfOV8/+GCJNA/3Kij9CKjn1n/blUuudYIhgIhaWH5PP/RV4YycmriqvJb
   bVSgedZploKRM86XnX/J16tnRW6f1UYy0lLeRSzVo3/BDy8HevpjqT9LP
   +2C0pgyhq+3AzsdyZI5VH6oKLzzOHATQ/ydi/5REUCKoy+N0TXuIRNqEB
   HBGTqnCGTF4zzmabPU826TfnQQ9YQwGinupMm3MI4wLwUj4hRDzL/NJ6M
   Pi8kbyWxhOlTpTsqGA2SsTa0tzA4UOwnvfU1Iqdd+2JBd8kt5iY1muzER
   A==;
X-CSE-ConnectionGUID: v2mArub0RZKkff5MnQjr8Q==
X-CSE-MsgGUID: b+aVakTyRpCnPO6BVQasIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="27878529"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="27878529"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 03:39:07 -0800
X-CSE-ConnectionGUID: Pig6zkbsQ1SNrVN9k1Av3g==
X-CSE-MsgGUID: sADD05fYSLqpw0roRpnu/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113305516"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2025 03:39:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiu28-0019SZ-21;
	Fri, 14 Feb 2025 11:39:00 +0000
Date: Fri, 14 Feb 2025 19:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 12/12]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000:
 'clock-hog', 'power-hog' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502141915.ojkbmhxl-lkp@intel.com>
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
head:   69438607ffaf6053586e2c7ccda52ac07050a35b
commit: 69438607ffaf6053586e2c7ccda52ac07050a35b [12/12] ks8995 hacks
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20250213 (https://download.01.org/0day-ci/archive/20250214/202502141915.ojkbmhxl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141915.ojkbmhxl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502141915.ojkbmhxl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000: 'clock-hog', 'power-hog' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/intel,ixp4xx-gpio.yaml#
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /spi/switch@0: failed to match any schema with compatible: ['micrel,ks8995']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

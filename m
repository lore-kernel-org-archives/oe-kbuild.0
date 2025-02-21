Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE935979
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Feb 2025 05:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740115071; cv=none; b=QWXmvtXfIVzhq3PookkMCtgaCoMBs7uQBlxzS2EYS/sJ+LzQv+kMFIsId22bGCfHMmnsXz1MeDj1bc0gtTsJHjxfFZ5WaYxlJ4hVcojTtdfXwephMGxklEv8c5/ggf/6Vp7sU9GSfx0dKKhuc9X5awylTm+v0en21Cj08r9JH1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740115071; c=relaxed/simple;
	bh=778whPBc8mOxr3tGfmG7b9pq/FU99muWEuIxB47ugKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbJFH5oNlZ2da7FXOmbmaGwI9FNqbvVSfEI7rNC4KyU2ngaR6o4qR9HsyKbvozdyaTz4ru0nY614PGCXRFvQsJkDhMfGSTLxuOdGCaPKum9ayK+iYMK/FZUSPqmj7AKUe0qXFOrSuQWrm3vR4jAlFjUc9yQ307pnyi48YpRdBA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nl5Q3yK2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nl5Q3yK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740115069; x=1771651069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=778whPBc8mOxr3tGfmG7b9pq/FU99muWEuIxB47ugKc=;
  b=nl5Q3yK2eeQo4JKcbbT0ADgnmiTQ65eI3xLj1qUKiOaAMwKHH44XTyQj
   5OAxaW6+OuTfIlvlZWAe5+xQhp7LKRBZ3cajQfXa8FF9dDA9PF4L3RtoU
   +I5QAZXXs472O5odZFcbZ9H5KNJYwTOFyC/PUSmtB+eQoavPPHkFf7vVI
   7/8iYU/FJI1zfC3vfcGYaybtYpRMhn3moHJhBQfy11D4LBmW1gcjC0mre
   isT0/RnYEQ3JCmnGoKnovdCmuZsenBQfR7+lAyIJBHcE/0DYaj4YYvMMD
   NzWL/F/+tN7wkFSmgHg5Uh/RrLvRJzwHBNT/ykAbPo+8muY04UzC/XE7w
   A==;
X-CSE-ConnectionGUID: eu6oukZUQhay97hFlN1sLw==
X-CSE-MsgGUID: sdl9wtOeSTGEmFIPB5pang==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="66281234"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="66281234"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 21:17:48 -0800
X-CSE-ConnectionGUID: ZxCk8rbdR5a4poIsISYBVw==
X-CSE-MsgGUID: zk4qaGb+RWCu8mhJ8KLqTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="115096560"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Feb 2025 21:17:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlLQ1-00059D-1G;
	Fri, 21 Feb 2025 05:17:45 +0000
Date: Fri, 21 Feb 2025 13:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 6/12]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000:
 'clock-hog', 'unknown-hog' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502211347.ct4iHnqu-lkp@intel.com>
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
head:   1aa107a4403018f9ce863ef2bc8f5d904a84d266
commit: cca1aa4e6168ee29d80327fa2160c085bdcbe2d0 [6/12] ARM: dts: Add Netgear WGR826V Device Tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250220 (https://download.01.org/0day-ci/archive/20250221/202502211347.ct4iHnqu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.2
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211347.ct4iHnqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502211347.ct4iHnqu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000: 'clock-hog', 'unknown-hog' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/intel,ixp4xx-gpio.yaml#
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: /spi/switch@0: failed to match any schema with compatible: ['micrel,ks8995']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

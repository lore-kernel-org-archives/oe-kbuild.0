Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA354078D3
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147231; cv=none; b=qMT08xcYPaH3aOFF2zSlGefjxz4tMAMesIEuiv0mdbjOSIJdqNE4JHjigcIHjnj0w0gUOMyu3ZrS3G6bZoPxIyquSMImGKkg+PNc54elQ8UxkvBjbcvVgZO8zjCf6//WaDXjOihr/YI7ztMBmrVmC123jg9n3JEblYTGtzRAh20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147231; c=relaxed/simple;
	bh=frBhW8yf3U5ZCnZVcs1pX52P3AnU5G2GeoIdNX19sos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t3bJJyj+8lOSsj8MI8cldAZYhqAmW+5CFjJKKIMLIeyjVxXFygqpuovW6N2MpMYcQXeRoHfEGOdpZhgLAB2EToppQhUiO5Oqwj3ecNxgOoBUbgX8siYrLoBqRRFtZWr3SzQqmwJJf0TwAbtPVKHSffuImv0T5wiqfKi7bpyO9Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hp8oZ48r; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hp8oZ48r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790147229; x=1821683229;
  h=date:from:to:cc:subject:message-id;
  bh=frBhW8yf3U5ZCnZVcs1pX52P3AnU5G2GeoIdNX19sos=;
  b=Hp8oZ48ryORfhiZv6Mr9ABseMHQjmZ981nA6SIyJK4/dE3Bd5ReanI+p
   bTjmcsZYL7z65HdqQ40SEX7HLaKxZYm/T8bO5YF8g7+LuXpbjL/5od/Zd
   A31pReOmoGUVK4SpK6dz6RIvyIjLDnXoEZFX76ciYP0H8Y5gVPSS3CoA7
   72UYjc2S0aUtm3zdi1Hv3+ypquLOd9tO1E2MokHV9CcVQz3Inwf7vNN77
   i2HdpOhM/nQfFMhlFCILs3yw6iba8w/080L1cKHOzHZBOJVWZ15/8EA7K
   REbyKFmS2MMQrIMCPTRa3JOXBYQaICoDFdFwvJ4IpBXJBNEtk8SJBv7VR
   w==;
X-CSE-ConnectionGUID: qgqUMkVwSvuZTbIF/eBOEw==
X-CSE-MsgGUID: +0ewcUl+QICgxolMWERbzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78366164"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78366164"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 00:07:09 -0700
X-CSE-ConnectionGUID: BTaMqAq8QTGX5DzBmEMDmQ==
X-CSE-MsgGUID: hP2lb+bmTy+EYChbmGnV/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4552987"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 00:07:08 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9H4L-000000000Yt-3cwZ;
	Wed, 23 Sep 2026 07:07:05 +0000
Date: Wed, 23 Sep 2026 09:06:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml:
 properties:syscon:items:0: {'minItems': 1, 'maxItems': 2, 'items':
 [{'description': 'Phandle to the device containing the EMAC or GMAC clock
 register'}, {'description': 'Register index ...
Message-ID: <202609230808.fwV0NuXk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Alastair D'Silva" <alastair@d-silva.org>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Alastair-D-Silva/dt-bindings-net-phy-Add-Allwinner-AC300-EPHY-binding/20260916-144116
head:   6d0087c5c37fcf119011a936fef3fa18ce5d7686
commit: 9a364178672ef94f751952ce6024a599b6638cdd dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1 and syscon index
date:   7 days ago
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: powerpc-randconfig-2401-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230808.fwV0NuXk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 4b99afb361a8cfd45fc17aebc637688661e9e472)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230808.fwV0NuXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609230808.fwV0NuXk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml: properties:syscon:items:0: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'Phandle to the device containing the EMAC or GMAC clock register'}, {'description': 'Register index offset (0 for EMAC0, 1 for EMAC1)'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

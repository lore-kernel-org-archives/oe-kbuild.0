Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17134179BF
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Jan 2025 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737973488; cv=none; b=QvOwCu4FVce0ri2b1y8O8HnZTkYUvTzRXMkwqN6M5AXD7usmdSxSDvkKZgi/ZlyqCrLQd0OkulUblYIwaSgsULa9tKMFlZ5ERUSZkpHPunOPiUxJcXXH/uiItt85x15djJoK4bogLuRC8fl5qkRQ6yFnk12+pxjPg8USfdYfJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737973488; c=relaxed/simple;
	bh=OwSRFzmAtevrLTcIOipVbEYb532XwM8RnkCl4QNa17E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lqouB5y7jk+r3nomm+CIyHQT1qBsQp45hWL+dR5971Z21HvSP43Ny/djeiiRIlEy/Eos49EGJNmnH2Xin6n5cg1xQo0XjFTKZDjrtdg2/beZaek+rRNMt92NguULJi3W8p2gvqgY3fONM5XiYm3nd9h6U7NrXVU4j/hcihxcXEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwcABIcf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwcABIcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737973487; x=1769509487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OwSRFzmAtevrLTcIOipVbEYb532XwM8RnkCl4QNa17E=;
  b=gwcABIcf8hJUmiFljKRAbK5A4HMwxa9yrnBwR2901iXAqCiPL5JIfDCz
   fUWNkER/WWRylnaHYDF79XFD4r/k14RwUV1Xymoo12Wgs8l1NDOhH+JTx
   0jYI4U9Z8YJroh7ugxumLtnK7/F+oS3U8e3z5UuFqyb9z0qdNwQim47vY
   I0K75rkC0fpncChwXiOI+iYMCWygxenrjDPJlH55TfKHn1BgmrvBIiOhh
   7399ONRR+6HqORvetQ0MPzUllI5VvpzVXrAUTV+yEgWhEdhGajF/DHpIQ
   3ZDK/tnxNcy80d1qp0BVLUrLarA1RsQuVhJoFl6SGbst0G56xhwQI2yzA
   w==;
X-CSE-ConnectionGUID: lR1/4rTVS42S6GlrY6gspA==
X-CSE-MsgGUID: Rn/FyTMhTG+6bjYVShYMIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38337171"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38337171"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 02:24:46 -0800
X-CSE-ConnectionGUID: bCaKkQsSRaC+y1aFP2XVKw==
X-CSE-MsgGUID: Gvua0Lr/SZKjW5O4C8Oo7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131688399"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2025 02:24:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcMIN-000geb-1f;
	Mon, 27 Jan 2025 10:24:43 +0000
Date: Mon, 27 Jan 2025 18:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-linux-6.13.y 45/83]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb:
 video-codec@aa00000: 'video-decoder' is a required property
Message-ID: <202501271815.XuoRFFf6-lkp@intel.com>
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
TO: Steev Klimaszewski <steev@kali.org>

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: f3853dc2937e775c9183b04db71a3e36be9e5814 [45/83] arm64: dts: qcom: sc8280xp: Drop unneeded venus nodes
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-052-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271815.XuoRFFf6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271815.XuoRFFf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501271815.XuoRFFf6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4146.12-4150.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000: 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000: 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

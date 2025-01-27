Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CC625A638
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Jan 2025 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737956118; cv=none; b=kfO7FI/twLwrlzYcXm5a2HWh5D+nTjOLocYbTpKWUeifPn0fI2PAKNXQJULBrh8Sy0B2wcnW55jD6FVsuLyQ29fK7eXsDSyAE9Y8YEXcGhOw0pM55BuZJoKNmWKWA94etPDsV6HmQnD221/C/X4navv51pbCprNUkg4IuGBoXIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737956118; c=relaxed/simple;
	bh=rxg5FnflkCyhB+CCXTKJ7zc4D7kNKnDuEDJzifilD7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mw+FO1cwUNeShdhNbDfe86OIpOTe1eZ17RIfOsSfwH7JCz7BlXmCLTM6Ved/GZxLMQRtokYn/4pX3VpEDv+kC5ILj9INgFhe3k89JRz50E7q8QwQM0ZVQlze8c1pyRgVCVw4SWlSFxv3MW0Hj8GBfEIx99Bd21WNz6voVvZR9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvQN9v6x; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvQN9v6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737956117; x=1769492117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rxg5FnflkCyhB+CCXTKJ7zc4D7kNKnDuEDJzifilD7A=;
  b=WvQN9v6xHxrTOMxt2DB7VxZt/0H3WHQiD6r+tpZ7zK5UKnuGvCtpLg+A
   Rlsg/CCp60iB9ZI72spsNNI53Wf4n+L/qgFhjwrHTcq0TRwLqOa1Wr0Lj
   aVK6IMRTLqZf/VOscXhyQZhBUZ24QPYRK1OFvFFtf/3OamwHsobwfOQiX
   rNLA4i4R6O1M8rmfFccJEJ0fI1NvfeLm02o8DhQdHRRniyhmCbS+AOm8m
   pGFH3NkABvTeIH5euuIfl8j40gzQrh9+/RMop9NtsYcatcu0HTsT8IS7p
   Y1CdvCKybGW0nfkMYku0rit/HM9M1QeqrwlvbqVHzD4QQkQvU7ZsaMWhy
   A==;
X-CSE-ConnectionGUID: 25Ase3X9SqyUNujkR9u9kg==
X-CSE-MsgGUID: 5Brqjxq4RKCmUEIjSl6iUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38290269"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="38290269"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 21:35:16 -0800
X-CSE-ConnectionGUID: ajoIq3fcSP2/Zp86/RXiJg==
X-CSE-MsgGUID: rsVUcgGOSWS579byZjPnyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112950509"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2025 21:35:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcHmD-000gRv-19;
	Mon, 27 Jan 2025 05:35:13 +0000
Date: Mon, 27 Jan 2025 13:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-linux-6.13.y 45/83]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb:
 video-codec@aa00000: 'video-encoder' is a required property
Message-ID: <202501271324.qzFeUbgo-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271324.qzFeUbgo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271324.qzFeUbgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501271324.qzFeUbgo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4146.12-4150.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000: 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000: 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53922CA8
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 05:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752297905; cv=none; b=c2X1P6+xjK5O4ZqAfpUMIjvaFKGwfQg3zke3Wgmhqn4xfD+qa2SIJoVChItd+cHZgwb5w0Z3xH6+i3y//a0bg6c2KVHdjx65Y32CoOpZYa2/JiK+7E674pNqIlRKrB1xaCwFjhWJT0jFqut24PtcwlEpFI2Rnds+rgUkAqqBu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752297905; c=relaxed/simple;
	bh=orr3wkOHQp2halcECn4hWfTh2AqqW79Z8P5pQmqVDMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KMuTvHno/dkdlodCOAaOJ8qJ62yka7QDIi7t9E7k86gn7r68FYpkBS1yQ2q1550JbLoI9nsnpXHzaG+jp0EN12/gzYlzNGQ0+FgEK4XkIJyncfbghiMvtH+k8U9k/4aIjxT64WAjVLa1MdtllE9sIDdK6n1qm5B2gfJ1aAj9EHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FU5VmJCm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FU5VmJCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752297903; x=1783833903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=orr3wkOHQp2halcECn4hWfTh2AqqW79Z8P5pQmqVDMQ=;
  b=FU5VmJCmhz5+Nd7SS2gHPKAGlaINLMRfMKChgNB2IcYbj+eVbBn9yygB
   CdaxBgbdyuMK5wrFcQOURRhwrFc3/F0WCmvFy+CpVyUG712dIUFl48PSo
   3gWxCwaG6L3Hp1Hl64+OhKm9R2PtvB+MnwFuK/Z56gFaaIFsSm5ukBVwd
   RZRnHfcaEGCCu+20mGUS4yE1QllUZwCIFf0lmitgqLDhSEjTYvsBYxZXZ
   c4rmijDazI2DtGoMS2oubB11Ji8fYAfuANV7232XDNckPhlLgGEH7blEd
   Tvvx6r0pkhTN/H5/E31YpyZ3UdwbkHAZ4T3HUdhVOt8xI8JSzQvWwZXQ7
   A==;
X-CSE-ConnectionGUID: m7Xt4JpFR8mRgALd6ace3g==
X-CSE-MsgGUID: G1GXQNpnSluRVpNoKZ8o2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="42219898"
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="42219898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 22:25:02 -0700
X-CSE-ConnectionGUID: kVRnhyuQRt2XX7k1HEaXvQ==
X-CSE-MsgGUID: cxSN5zwJRqKTNVx/rXIGpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; 
   d="scan'208";a="193717928"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jul 2025 22:25:01 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaSjK-00075D-1c;
	Sat, 12 Jul 2025 05:24:58 +0000
Date: Sat, 12 Jul 2025 13:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-6.16.0-rc5 58/77]
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb:
 video-codec@aa00000 (qcom,sm8350-venus): 'video-decoder' is a required
 property
Message-ID: <202507121336.uw6lOK9N-lkp@intel.com>
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

tree:   https://github.com/steev/linux lenovo-x13s-6.16.0-rc5
head:   8a7f181d5501fa73b17dcb76340908f033b61b88
commit: b93b4fea83ec35e5d021e1ef849b6ee8cf01719e [58/77] arm64: dts: qcom: sc8280xp: Drop unneeded venus nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250712 (https://download.01.org/0day-ci/archive/20250712/202507121336.uw6lOK9N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507121336.uw6lOK9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507121336.uw6lOK9N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4251.12-4255.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-decoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: video-codec@aa00000 (qcom,sm8350-venus): 'video-encoder' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

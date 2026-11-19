Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097320;
	b=3Q7W8e2BZxzn0+lLVGwA95ROaw11LTmUgvEi2gcLagqvOk2V57d/+iTh6RRcsNBu82Iv
	 oYe5CZ2PxOTE5ShpnhB8pst79CXuteVuhUtpBQFbwcOWA0u/XuGhaYLQ4PjH6ZYMSa43c
	 nhkdxrFjTQ+puH9igR+sIgJDAGUj0R6jXFqTM++oabSiys1yx4mB1KpMt7zQkF5YOyVik
	 hqklNcRzbHKjgC/z+w8JID40Yo4lVBagtqv8F9Rzzwdcxng4PttYaWfm4ChMGa5Ozll6y
	 duSb7y3hKcB32OmfJIZBytDLOBJBzZBvjz4BvOfw1ZdtpY98TPcBye+CM8NmcICi2+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097320;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6pFGI6xrEgeDPk65cgxqlgZWKiaxMPl4FtbUfQ//yVI=;
	b=BoLyL4TQnoW5QTbihjrWHE+m9FfIJzV0Pwci6FSdBn30D/u599LGDo8QsxeiImkSgife
	 DHrVgoySLLKmxJ5l3k5401ySg5BNV1GsdF4SQrsTQRg2os7v+SdPKXPX03IbwZ/78Zvsn
	 RqIFfTDVkuZTcgkRLnli6hEBc4FwoBXq+kl4PzIXcPZAdJZip6Li5RW0vg2k0EmSztepg
	 t8RxYhL0qhL7Ts4M/zjfCO8ZpKc9u2Bdh+Pfd4OTD5R2l0HkLMi1LAaSA3WzaqZ6PZTFt
	 BdNXNPKOASF+EpX5yZyvLpZU4tVpa95Eq2NQFFBtLP2GqyACUJdC+35R1NIq2U2SDKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5EbnQMJ;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C280C606A324
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 14:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C280C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5EbnQMJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795097319; x=1826633319;
  h=date:from:to:cc:subject:message-id;
  bh=eklvrrrY9MzrZe8FMlpq1ZAbIS41QbcUmnTVLefExEw=;
  b=h5EbnQMJd19nw0+iF0GlyjrfZ4jS6+8DmUjpWXlu9JeYwpDQ+ugp/jxK
   HGfOjKu5k764dVxrPJGL8aGufTSUmSjyvdsuQd5mvnwIWhYeZjVTXRivG
   TwnXkM3dn2QPYepOqG0Xf9yqKvurLzv6JwES+EJ8pms2Y04g+k0t+gr49
   /jfhswbrhzDzNEufL3Z5ltbNvq5i3jynhPm3uFzwssl9nEPN2XCRIsJX8
   lgX6hNlb4CLJXpXulw1enoRI02PhajceP3ve/T7Je6+/4pTvlanW4CUwz
   VjVuQDK3UwNz0RbgIw8etp+yDGQiL/Ms6nQOLngCNQoDFI3/0WQBey40J
   g==;
X-CSE-ConnectionGUID: YfSUpgYuQn6OhkVxBDbCpQ==
X-CSE-MsgGUID: cAvnmKJNRXyUf2EvZ9wX2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3975019"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3975019"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:04:31 -0800
X-CSE-ConnectionGUID: 62jmZwDHQjGVFvS/YCHD1A==
X-CSE-MsgGUID: QpTOKZz+Qrej4mOoKCmsug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10824825"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2026 06:04:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU2kV-000000003n9-2i7z;
	Thu, 19 Nov 2026 14:04:27 +0000
Date: Thu, 19 Nov 2026 15:04:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [superna9999:topic/sm8650/el2-iris 4/5]
 arch/arm64/boot/dts/qcom/sm8650-hdk-el2.dtb: video-codec@aa00000
 (qcom,sm8650-iris): Unevaluated properties are not allowed ('video-firmware'
 was unexpected)
Message-ID: <20261119150201.kOJI09dL-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/superna9999/linux topic/sm8650/el2-iris
head:   294c0e3876ea82d61bf7c0d64d2615ef4e2a5a58
commit: 29ccaccecf9f5338cd7bd7f7ac73bed34a685dd8 [4/5] wip: hdk-el2: enable iris
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261119/20261119150201.kOJI09dL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119150201.kOJI09dL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119150201.kOJI09dL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5208.27-5283.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5305.27-5361.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-hdk-el2.dtb: video-codec@aa00000 (qcom,sm8650-iris): Unevaluated properties are not allowed ('video-firmware' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

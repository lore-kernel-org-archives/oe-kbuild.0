Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECC5332EC1
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 05:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790400521; cv=none; b=bXvUSPBxKLx3DyLb+0qs8rGcIBvxhVsbMf2ZInOj81HqSyELWiCO30oLnF+vvijDKMloNlzESBWE/Z7NnlaCgsWFEAC6wRjbPpbDr31RJnkJxcMqeVk9NvOscuhYdU+3YjefJblnx9pK8EWkvz+WFGEuwHCprYQ8ieM/aqUAyBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790400521; c=relaxed/simple;
	bh=/fErAcdAYvNVabUf4HGzANqjShLsRhAHkcN3ywQilNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aimZb4lqdw3KMV1EGWPBmFSgbUVMT0lSrdvh/zKn2DHzADgGXwA8geknAL68LNZP7Pj74cAEgUX+GCAfbsQtYr/U0+IGC2WgVphm4eCMqWn8kseObHOjJGIY8NlcE7Ls3RcdXlOG1NUqSiE45+bQiVVUXik9gbxMkKqsmO62YO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cWMmpp53; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWMmpp53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790400520; x=1821936520;
  h=date:from:to:cc:subject:message-id;
  bh=/fErAcdAYvNVabUf4HGzANqjShLsRhAHkcN3ywQilNM=;
  b=cWMmpp53rWXyR+cQipm/eqEy8RqtJU7+S3NB0E1oy+rh79PbAqYlwqih
   Z7yVC/JgjWRJSxYviT8vg6TRW/9284c3/CMUhy6bsYJDFnm9JVbosiM/F
   BmmsRP/wN6PDivQ4GCqLd+KCCkXS9xPdHeIEaz8PDN1AOTGxQmYQUMOMD
   YvazJlo3znmvOPefCpWQ7WkTiZ/jTGZRbaFruRHfu7ayAjpJTEgoworNY
   oxsfpea4lf6xpG/0a9h9n9LSHPO+MjUCyedvJ+l3SbutBU+gDmH+NXt7p
   C8+fNkY20v5hfstf/0v0TVJeWqBDfSVJtlp9Ae6w4Mo1ouJkwcpCc0OWx
   Q==;
X-CSE-ConnectionGUID: greCasUfS2yuWOpsc3Wh7w==
X-CSE-MsgGUID: ZMSnjoO5TRObVWdbpcLzmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91043609"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="91043609"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 22:28:39 -0700
X-CSE-ConnectionGUID: W2Gxtm1AR8ivF/K0zDlFJw==
X-CSE-MsgGUID: 6ITJDuurS2iinp1d0ow0Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="274648109"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Sep 2026 22:28:38 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAKxg-000000000I4-1ZK7;
	Sat, 26 Sep 2026 05:28:36 +0000
Date: Sat, 26 Sep 2026 07:28:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [superna9999:topic/sm8650/deckard-chassis-type 5/5]
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: / (valve,deckard):
 chassis-type:0: 'headset' is not one of ['desktop', 'laptop', 'convertible',
 'server', 'all-in-one', 'tablet', 'handheld', 'handset', 'watch', 'embedded',
 'television', 'spectacles']
Message-ID: <202609260721.bTdhaGef-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/superna9999/linux topic/sm8650/deckard-chassis-type
head:   786e9657689a513f9d3a25287abf80c70233bd31
commit: 786e9657689a513f9d3a25287abf80c70233bd31 [5/5] arm64: dts: qcom: sm8650-valve-deckard: add chassis-type property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2402-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260721.bTdhaGef-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260721.bTdhaGef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609260721.bTdhaGef-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5763.27-5838.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5860.27-5916.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: / (valve,deckard): chassis-type:0: 'headset' is not one of ['desktop', 'laptop', 'convertible', 'server', 'all-in-one', 'tablet', 'handheld', 'handset', 'watch', 'embedded', 'television', 'spectacles']
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
   arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: aop-cmd-db-region@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: lpm-region@6000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

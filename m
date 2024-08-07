Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0B81C8FAF
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723028002; cv=none; b=Hj3TmEdPB/Xhl35rVlf2pIie3KDsuya8bc7I2OFwP60Jz1lnECLciRiU+Bjbw/p0CtBLIdRuaBgnKfWll7rN+YoakvZcT+aZFvdqqe50onVkQ5VBNpXjrIGPFzXiA1Lioe7pevljCb5ZurA6S08GXQ2qcpbJB6IwedruncmhCng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723028002; c=relaxed/simple;
	bh=6R80V4mYH1tQNyBpAqLkeX1BtsF9hSGTULiKsH/0FFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBsYjvL3MG4nHvClhTfZPSYCIoCJEQXOkN2fJUPPZ6ckEDTJk9RamsAbky+g/65ZjEnN16ZDagUiUJDAzMcarbFZ4qrlFjtTnbdI3HZLXcN50XlLMN6xOamvrJq7Ias6IQBMOQCV7QD5TYGng0oVgCFd9BeN+cp2zBtcUxDuP6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWzHaOQs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWzHaOQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723028000; x=1754564000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6R80V4mYH1tQNyBpAqLkeX1BtsF9hSGTULiKsH/0FFo=;
  b=PWzHaOQsqkSx6Z4xVW+e+YjxGWJF8IoMl4BxdSkedl4g57rZUxQntRLs
   Rrx90ozDoLrFzIbJK3INrGcnE6PgzfoQOO0NspQJwx8Act5NRvISi5zg7
   eetvOZIAYhpG/pPm4Wq3olos+HsnaeK48QpAq7bD2CjDxu/Uuk03lHY8U
   CZYE/hBmnxxrpOwRm91NepiXx322o8Kh3+/j0G2ZU7zYo92YdH3T4O5P1
   TmBxx08JJ8IrLLeH5IU4Lp6OgCsYToPtgd2BFLsW/W44LHQ7C2IGKCWGN
   U0OZaLXNm5VZsA1Z17j8Aif0pux2qU5xginkmPqvNvqPAiN6yp+WvbSGY
   w==;
X-CSE-ConnectionGUID: X4WBNqG2TMW+xBwlOfxabQ==
X-CSE-MsgGUID: LO+TTYeQRKC+xvhngFFl1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31719719"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="31719719"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 03:52:41 -0700
X-CSE-ConnectionGUID: oxB5V+QeTya4NOjqdiqxnA==
X-CSE-MsgGUID: 4EzlZtrITzyXVf1OT8U+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="57365135"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2024 03:52:40 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbeHV-0005Iy-20;
	Wed, 07 Aug 2024 10:52:37 +0000
Date: Wed, 7 Aug 2024 18:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm670: add camss and cci
Message-ID: <202408071831.yZQeDjRA-lkp@intel.com>
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
In-Reply-To: <20240806224219.71623-11-mailingradian@gmail.com>
References: <20240806224219.71623-11-mailingradian@gmail.com>
TO: Richard Acayan <mailingradian@gmail.com>
TO: Loic Poulain <loic.poulain@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Todor Tomov <todor.too@gmail.com>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: linux-i2c@vger.kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Richard Acayan <mailingradian@gmail.com>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on media-tree/master robh/for-next linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Acayan/dt-bindings-i2c-qcom-cci-Document-SDM670-compatible/20240807-070044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240806224219.71623-11-mailingradian%40gmail.com
patch subject: [PATCH 4/4] arm64: dts: qcom: sdm670: add camss and cci
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071831.yZQeDjRA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071831.yZQeDjRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408071831.yZQeDjRA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:1792.27-1844.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: camera-controller@ac65000: reg-names:0: 'csid0' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: camera-controller@ac65000: reg-names:1: 'csid1' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: camera-controller@ac65000: reg-names:2: 'csid2' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: camera-controller@ac65000: reg-names:4: 'csiphy0' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: camera-controller@ac65000: reg-names:6: 'csiphy1' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: camera-controller@ac65000: reg-names:8: 'csiphy2' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

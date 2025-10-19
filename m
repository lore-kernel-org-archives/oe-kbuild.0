Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E64F1DEFF5
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 05:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760851957; cv=none; b=LmX1pHGGIIBDEYRyHmppss7wYCDKtdkhyZUWgKTcf5GZQDgral91Lsd+gkINklpLiQacoQLnBp/XrH+bTQCqQETvxCX+4uNC/QXoyZ/LEyYrAX2paTySr45hsceNTSWO6fJYqKhNOo71wcEv7LJplIguAHoE6xvYKaTu9/QoTmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760851957; c=relaxed/simple;
	bh=V8FAY8TVpTJFvVI+D4njBGVJXZiRKiOxoK4+I1xZGco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TfTipUwygu5Ome4gx4qkCHCpAPaj/cMcVidvCP/tiqeOPU5x4KzdCGw0yrzGymGiJTGya6VCDtIXwy30yWL8XaqcvJAZ5RRovnd5bQIv9QmaYFH6H/2lxjW4RvXDuaG9xs7a46YdumOaU5Tvh/mu4mcwebJjvldz3PkJhM+HKzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQanI51w; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQanI51w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760851956; x=1792387956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V8FAY8TVpTJFvVI+D4njBGVJXZiRKiOxoK4+I1xZGco=;
  b=dQanI51wv/zuH6I7WkdMP7GIl6XK0e0/dopr4EI3EYveIRU1ARjN1a3K
   7KjWDWIc6oEWB+4fyg/qmO756qwKzLep7oVn6nAynsf203n+D3X04b75E
   ykDk4JYnVWNArjZxcM4dCJDhUdMeKZ8QT+UKa5ZiYfY+A2wuFvxmehVHO
   EW9HRSOy8Kdna88NBN8EGBhrmJG31zghnrjzepYR25P00AKIcdBj4j065
   0M0053c7lJJnRpBrrPMtBnD6PWwf90wBFYRulCeqNNHjKcKIz/V+RF2rE
   j8ZBomeMDbvphpDB3h1cV9ckPbAKDS6S7jJYRZznAv6Ubk5Hbj0lS6Vse
   g==;
X-CSE-ConnectionGUID: 9rREF48HRx6f/geXyX0hEg==
X-CSE-MsgGUID: 5bMdEaoSQnSkuZvObbEHIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63158810"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="63158810"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 22:32:35 -0700
X-CSE-ConnectionGUID: 0bNLccHITPWXMnZnOXMG8w==
X-CSE-MsgGUID: GAMgmvvkS/2hX+yxCwa7lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182893354"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Oct 2025 22:32:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAM1r-0008sH-1X;
	Sun, 19 Oct 2025 05:32:28 +0000
Date: Sun, 19 Oct 2025 13:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 88/127]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fdf000
 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated
 properties are not allowed ('data-lanes' was unexpected)
Message-ID: <202510191327.67osYVFp-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   737e48844988f2167f895fb3fe7a2e14a8211186
commit: 667b8404b48382f3ed610806eb0d21fede29eb21 [88/127] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-052-20251018 (https://download.01.org/0day-ci/archive/20251019/202510191327.67osYVFp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191327.67osYVFp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510191327.67osYVFp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3012.12-3017.7: Warning (graph_child_address): /soc@0/phy@fdf000/ports/port@0: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4884.11-4894.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3012.12-3017.7: Warning (graph_child_address): /soc@0/phy@fdf000/ports/port@0: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4884.11-4894.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): ports:port@0:endpoint@0: Unevaluated properties are not allowed ('data-lanes' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

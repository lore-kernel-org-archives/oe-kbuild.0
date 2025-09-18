Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D82629D
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Sep 2025 04:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758170767; cv=none; b=PIJX2fHzQEc/nkA8Z+Cn7urKG4L8Ix/nVImZ+hV1N6xG9buHcYEm/McE1Z4WoL3xvnaYT1oCRf7qT/JLPGnSxwLXruH4uCr9LpXusyyrLHe6SMLddIOO1crZh2NLWTK2upm69KfNvPyNYBPDmqm5n0wmSdItz0D+ENS4/zBWsn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758170767; c=relaxed/simple;
	bh=HIHqJQiwe+1vZQ5geQ4+3npPnLnjNxbgNdG9IiVRUIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MjNl8zm56uvOtiX3VeNFeBF3+27XHRba7VJfiTKM2aO1KLN/+GPTjtl7rUJEegG1UXS9pqHBeBYgS6IJAOEuREg01Od3yoJsNQWGmBJGI0VndVCRZKAzyrfceSTNHYNn9EKDitPc4hbzCfXQNnweuTh6CuVZEOOQGtHApewuIaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjzagY9F; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjzagY9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758170765; x=1789706765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HIHqJQiwe+1vZQ5geQ4+3npPnLnjNxbgNdG9IiVRUIg=;
  b=bjzagY9FX97M3YEMKO6YQ24EYPGqMLX38Kmt4LPQ9YoHnTTmfiaqpRpu
   Ky8D+aLmrjDkG9L7Jc6a+KLF8X8mfJ/SwR3cuj4GoJhzPSbr+eG4XaVzh
   60w3S5WRgLOBXm/OU3CHOK9/gLh+yPOLrOXYdKYnHQsb2OcZsNvS+Dn0S
   MqJSrzh477dltTon5pdueWvXkQ8UiDq83eJslaLN0/Tp31Z/AgHibkrJl
   cd3M9gQWvLPedQGxJzubbwBuQOlO8wwMEL+lSPsx5kXh/2ppkBnyM/CRQ
   E2PtyIe6kZ/TIGrwh/8C+vWE1tcAjtSyui5fRnWB4f1N7Fxx3gW/87v8V
   A==;
X-CSE-ConnectionGUID: DbOSH0CGTLOffFLx7Zn0Xw==
X-CSE-MsgGUID: y5Q7tRXQSVCZgIQmOFnLZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="83085886"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="83085886"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 21:46:04 -0700
X-CSE-ConnectionGUID: h6tAF45XQYKqRMhIMwoNnA==
X-CSE-MsgGUID: 92V5jxpNQFuB4HXJLjc7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="180712432"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2025 21:46:03 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz6Wu-0002lb-1m;
	Thu, 18 Sep 2025 04:46:00 +0000
Date: Thu, 18 Sep 2025 12:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 171/256]
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fd5000
 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509181238.5g1vXdIU-lkp@intel.com>
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
TO: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   141714e163bbb7620d538af48fce4024a4f239e1
commit: d3f600dc452df45f0f404eba65a88f4aecc48b43 [171/256] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree
:::::: branch date: 9 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-054-20250912 (https://download.01.org/0day-ci/archive/20250918/202509181238.5g1vXdIU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181238.5g1vXdIU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509181238.5g1vXdIU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

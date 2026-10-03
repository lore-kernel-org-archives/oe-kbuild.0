Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047113A4F32
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019092; cv=none; b=B9Ahd5K2nnE92TmCeaMShfKyNvwXWzGIQsLcxrBg8dGgF09czCq9SyMZlndZGn4wLGvv0J03tvtEcvxgybAyirqFiFFiXyEydyN+rbXbfLVwBXNixPMoxy7JfT9T6Mo0wlShRrhnPFFpvjqNjMuxy0sjceU3msGM6dWCani1VKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019092; c=relaxed/simple;
	bh=TPi0vd4nyTAkG3/XMY/wAfPFuE+NVRvDKhNiIM48GGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DNhKvlunZ0TzNSR6cDadbKChDM0HpaO07AQYYZLL6gniD4n0qZm/eMtZtXNExMzniNFt/nql64Nw26eoFdn6WHvOjTIJPA2w3Lqx+z7/wgV/ajTMWgBnHzBEktZabEepJGnYw3X9VmvJ8rGXrR4uwNYyf/qnfC41cFwSqzlMGZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWg63EmW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWg63EmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791019091; x=1822555091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPi0vd4nyTAkG3/XMY/wAfPFuE+NVRvDKhNiIM48GGE=;
  b=bWg63EmWeqeEsVIE04YyC85e/Opmj+l9YJYGOp+RFP2eys1SjmhH3d9R
   4hNFwTHtQsvO5fQ1gqUj2ptLYDwimI8ZxT6cTfnmQKh9ImeU6r5XN5nXQ
   tEU65LrYapj22lhlkaS53B3Pcb5bsF/m3IIUqp11RHZ3TKaRq7ISI+2m3
   jpiTk2K4WgQCpH9/HQTwIMFRceE3T5oqs5XXswQ0dCzST2h+nh5ZQd2/E
   EVlMM+v9hSE1/sR04d70Q0VvctUD0hP2rdLGgNlCtLzm1cnJrWBWvC34f
   Z8q7er/PWa3bdQqoSMwOU+Iv+kU14YWdJpDVHAHkDGlZTTKGzNCM0X2dD
   Q==;
X-CSE-ConnectionGUID: 1I7NPzMnS7WNPXZ+6oQMGw==
X-CSE-MsgGUID: +BxFIyUMSHqzP43u44G2pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="102347696"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="102347696"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 02:18:10 -0700
X-CSE-ConnectionGUID: Sla0pAfORqm8WpTMLD9fXw==
X-CSE-MsgGUID: R7zYuimLRyG64eWOeJVSmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276560142"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 03 Oct 2026 02:18:09 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCvsb-0000000010Z-0c0G;
	Sat, 03 Oct 2026 09:18:05 +0000
Date: Sat, 03 Oct 2026 11:17:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 9/75]
 =?us-ascii?Q?arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-p?=
 =?us-ascii?Q?anel-dsi-WJ70N3TYJHMNG0.dtb:?= hub@1 (usb4b4,6502):
 'peer-hub' is a required property
Message-ID: <202610031146.wgcpEZWp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: Josua Mayer <josua@solid-run.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   1320b9000130f6240b4f713b0948dcab4dfd95fa
commit: 1b16a69bb19bdfafc41fc4bf5ef3059c9511fa13 [9/75] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: Add dsi panel dt overlay
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261003/202610031146.wgcpEZWp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031146.wgcpEZWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610031146.wgcpEZWp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B615F45BF1
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Jun 2024 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717942094; cv=none; b=nt7vXEFd4GNwPKGyhX+nogfBoAmKjPmH3GUOIG3koOKubLONiVwXlHLJuCodpvN3Ys0CJiEreukhs9j++Qns6ExcrJu1Bp4yPpApCGBOjK72PZOSd/3m29TLp6PZEDUEd2w5dd261s0x9rz3o1WkAfP/HsMqyfU25AOQ1P43nII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717942094; c=relaxed/simple;
	bh=JRdhBicyP1Fs+tCE6J43WzeAuiOCaa4rAed8XjpGHEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzXUzmruCvS/8sFiv2pC6NlXPwoWL1gS+Q8BIEQmBxQNCvwsxAgNmR4fp6Dnm2SpG/toTiu+/cPvxy29TUY9W2TGx8V8xRo3UQM5GCwT4oyi2Jp0SyiBOK58R7N7jTYIj2ww5zv0tv1hKmAmEgFaTczYTXdqSkJlVMJ1YUDMAFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUYaS+7z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUYaS+7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717942093; x=1749478093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JRdhBicyP1Fs+tCE6J43WzeAuiOCaa4rAed8XjpGHEw=;
  b=iUYaS+7zObtAwGJrBx9UH4XQeVXeDNhKevAKA/rs8D7mlIQZFG6mabNs
   XKDYzsr2n+ekIm0vmNPjBNeIaxXz8iLiXj2UR6lZ324Itq87SVRrdOCDJ
   sjZ9mldalzUe5eSMdMBxGJxQ60ssdLUtnAHlBdTtrN6Tpf3+sfoklF1mk
   pl+t0UbhTI73KU1hyK08HF3pgEgkQJ/TjTpTQ5Pm6OqwbVATz95LpcFFi
   vfuK2dBz9CEc1uR3ApobIM9indufqk2JdaVRDjit8ExDd25YZm8ppaeyW
   4bGrN2uPcHt/NIHuaCzpG+ycPt/b5iGuFfZC/XI6/mBDuBLVmL14GaMzL
   w==;
X-CSE-ConnectionGUID: jisjyydGSnWzK/X7T8sONg==
X-CSE-MsgGUID: XZMBg7lTQoimEao3+wJu4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25265975"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="25265975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 07:08:12 -0700
X-CSE-ConnectionGUID: g08Z/HmxSzSArcJZqnlvMg==
X-CSE-MsgGUID: JXfD5YLWQ1mGWqu5rHUpcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="69594901"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jun 2024 07:08:12 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGJDM-0001H6-39;
	Sun, 09 Jun 2024 14:08:08 +0000
Date: Sun, 9 Jun 2024 22:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-5.10.y-cip-rt-rebase 753/979] dtbs_check:
 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml:
Message-ID: <202406092201.QhhOk7ep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rt-rebase
head:   9de69a0c701bb413c105caf0be1dd5cf574866f9
commit: 6d7b69cdeab3b333960221144c9fbd067d4401ad [753/979] dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092201.QhhOk7ep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406092201.QhhOk7ep-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/dma/dma-router.yaml: title: 'DMA Router Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/ingenic,codec.yaml: properties:compatible:oneOf: [{'const': 'ingenic,jz4770-codec'}, {'const': 'ingenic,jz4725b-codec'}, {'const': 'ingenic,jz4740-codec'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
   hint: Use 'enum' rather than 'oneOf' + 'const' entries
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/sound/ingenic,codec.yaml: title: 'Ingenic JZ47xx internal codec DT bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/media/video-interfaces.yaml
   Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml: allOf:0:$ref: '/spi/spi-controller.yaml#' does not match '^(/schemas/|\.\./|#(/|$)|[a-zA-Z0-9]+)'
   hint: References must start with '/schemas' or be relative to current schema's path.
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/trivial-devices.yaml: title: 'Trivial I2C and SPI devices that have simple device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml: title: 'Allwinner A64 DMA Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

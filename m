Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EC98120F
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 21:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720646210; cv=none; b=uCqa5PnZHM17OMI9nNvuLFVEr7G1RsFU4xmL2Qm/KV0Yp1Fjyw142JOO2neXE9zIzCQZV+jzWvRsdbuQy39sSVW44/WHlMyN0G9TivfHYtln9X2f+wTPLXQdo+iRWuk6WK3MSygg0CZXSX64o/Xr92L8pCCkNn/A6OYQvvzOe7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720646210; c=relaxed/simple;
	bh=Kxq5l+DHWpa3r5L1ZhM7/CqkwgsAdx6MtLiWlOcm2Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMIlMAWMvv1h+uZzPI2EAubgpgylKusS7HmqZ0xgsBvjFNczcVUfeV9SCGX0CccbCozjEAjcFTRMsKNhWIqhdIerUyTQ4DeNKh0JNvLa8kX4hWAplNneu/MSBGkWpovsRnYKG6Y43Mr+WKcRgNHdLeUa3Z8XnPmFbv+uT05+4Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlHpnkH6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlHpnkH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720646209; x=1752182209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kxq5l+DHWpa3r5L1ZhM7/CqkwgsAdx6MtLiWlOcm2Lc=;
  b=OlHpnkH68lTA3PXtUfPFe25cE/LFE99mMrwigdDi7Z/062VJipl1Dtn8
   BY4iv5uIs8CfnO4+OSzb65ZWzTJPmUcRuumbrdLehgD2XMCkavS+KHv1I
   pGuaLz9RyRHq82IAT06HIPY1+4xhFh9aGy3hncS+N4fmIxl7OBQWtp3Ey
   KNDN3i/4kg+6oc1DODt0UJ/3EYeTa8p8iNspHPuuY2X58c09xn+gDIY1G
   Mjnns4d7fCxi/RiMEolaquS0qp1oU6cUxHx7eTJcxPyfiBL/jCogk0IuY
   4gpWN8IRmjJvard1Er0NpTbWsIfiSdlYoFKzZR0c/mEW8jFx/1poJ8QA7
   A==;
X-CSE-ConnectionGUID: BGCcNEtAQlmDE5pzoVOf8Q==
X-CSE-MsgGUID: Hp6MEK2qSUeuPZXMBrq59Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29398364"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="29398364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 14:16:48 -0700
X-CSE-ConnectionGUID: MKb4onP5SkenHfwJGX/Wyg==
X-CSE-MsgGUID: o5MMmQSgSneMQXEyVXQvRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48095921"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jul 2024 14:16:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sReg8-000YJ0-2v;
	Wed, 10 Jul 2024 21:16:44 +0000
Date: Thu, 11 Jul 2024 05:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-2.0.x-imx 10984/11381]
 Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml:55:7:
 [error] no new line character at the end of file (new-line-at-end-of-file)
Message-ID: <202407110546.mYeeQTYf-lkp@intel.com>
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
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ee366aa641d84d61e265cd4f571394aa4e7d4e6d
commit: 97c48f97ddd6c52c9b348f183171c51c1f8caa60 [10984/11381] LF-11524-4: dt-bindings: touchscreen: Convert FTS touchscreen to json-schema
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110546.mYeeQTYf-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110546.mYeeQTYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110546.mYeeQTYf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:21:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:22:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:23:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:24:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:67:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:75:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:83:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:127:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:76:14: [warning] wrong indentation: expected 14 but found 13 (indentation)
>> Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml:55:7: [error] no new line character at the end of file (new-line-at-end-of-file)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:18: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:20: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:22: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:18: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:20: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:22: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:24: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:26: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:28: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:30: [warning] too few spaces after comma (commas)

vim +55 Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml

97c48f97ddd6c5 Carlos Song 2024-03-11  31  
97c48f97ddd6c5 Carlos Song 2024-03-11  32  required:
97c48f97ddd6c5 Carlos Song 2024-03-11  33    - compatible
97c48f97ddd6c5 Carlos Song 2024-03-11  34    - reg
97c48f97ddd6c5 Carlos Song 2024-03-11  35    - irq-gpio
97c48f97ddd6c5 Carlos Song 2024-03-11  36    - max-touch-number
97c48f97ddd6c5 Carlos Song 2024-03-11  37    - touchscreen-size-x
97c48f97ddd6c5 Carlos Song 2024-03-11  38    - touchscreen-size-y
97c48f97ddd6c5 Carlos Song 2024-03-11  39  
97c48f97ddd6c5 Carlos Song 2024-03-11  40  examples:
97c48f97ddd6c5 Carlos Song 2024-03-11  41    - |
97c48f97ddd6c5 Carlos Song 2024-03-11  42      &i2c {
97c48f97ddd6c5 Carlos Song 2024-03-11  43        #address-cells = <1>;
97c48f97ddd6c5 Carlos Song 2024-03-11  44        #size-cells = <0>;
97c48f97ddd6c5 Carlos Song 2024-03-11  45        clock-frequency = <400000>;
97c48f97ddd6c5 Carlos Song 2024-03-11  46  
97c48f97ddd6c5 Carlos Song 2024-03-11  47        focaltech_touch: focaltech@38 {
97c48f97ddd6c5 Carlos Song 2024-03-11  48          compatible = "focaltech,fts";
97c48f97ddd6c5 Carlos Song 2024-03-11  49          reg = <0x38>;
97c48f97ddd6c5 Carlos Song 2024-03-11  50          irq-gpio = <&gpio3 27 GPIO_ACTIVE_HIGH>;
97c48f97ddd6c5 Carlos Song 2024-03-11  51          touchscreen-size-x = <1080>;
97c48f97ddd6c5 Carlos Song 2024-03-11  52          touchscreen-size-y = <1920>;
97c48f97ddd6c5 Carlos Song 2024-03-11  53          max-touch-number = <10>;
97c48f97ddd6c5 Carlos Song 2024-03-11  54        };
97c48f97ddd6c5 Carlos Song 2024-03-11 @55      };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

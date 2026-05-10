Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2F81732
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 19:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442531; cv=none; b=HdEhBqVdk7GD4znWlu6Fpp6WHCs9GsAcjk99f9R7MIOe691Y7b3arzMVh2yQnBXnlns6y/WI7Vdi19HbRODlLUKB4gcYkA3s0++DUdwJ0+3YD/oTLp7kbOLc1gjsCVEhd2VjgHYy6mllYPtZ0ChyVv7UOzMywnAywIXRIBYw5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442531; c=relaxed/simple;
	bh=Q7zMICQEifssonbhNJ6lTxutD+dvfj+8zbMfX79STrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CczX54jsxeXqTtc4R06XTHQ9Pl+E7yuqoCv+t2HqIYqqovdHkrxTRaThkw4kS8QKSQVs+mt+CxbKtBFsl2vcD1Fk5iO7/gIpc5zX0I0FG2vnbggGug3oieuO1NlTKYKkO5wwlMGKv9ZdlPN2FGIQ2u2WYHcaN2Ya9PBtlQ399SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckjXqJOB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckjXqJOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778442530; x=1809978530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7zMICQEifssonbhNJ6lTxutD+dvfj+8zbMfX79STrQ=;
  b=ckjXqJOB5Vyou45PuRT+/etP+9dDO66sr/tt08/UXCOBUuoptbxzqp3e
   oTUHUHUbnY+TyNM1QI9dQdqT3JeXS/mix7SEpKNBT8OtjdfK+R8/+ju3U
   WKwkXRpY3EfIXikXDPloUztl4/++RcLvnMxA1wSOZPrS44BbNBQWAb/XW
   CheIk0OFL+n3mXBCm9bfiJm+EhkPL1M68U7X+lu4POvkt+vNBpjRpA1/1
   bhzDK2sca74XBxu4QSJ0PmOHLFHxgijToabT6p/ajANDLiGPI4ao6RPTZ
   xWd2bT+WfmXHPnD9GQYTnNsLuYXJ1NRxXQe6a5v9n6tLTzNOaC/lb/Xga
   A==;
X-CSE-ConnectionGUID: lRonkvggShaa4ZAZf2UU5w==
X-CSE-MsgGUID: 1uZvwYouRI+NViWgc5FB5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79323776"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79323776"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 12:48:49 -0700
X-CSE-ConnectionGUID: jBtoQ0g1SJiaDfmifPvqrw==
X-CSE-MsgGUID: dXEQsQI+QW+RCUJhv8c50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="242261831"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 10 May 2026 12:48:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMA8r-000000007lx-2KMr;
	Sun, 10 May 2026 19:48:45 +0000
Date: Sun, 10 May 2026 21:48:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Dell Inspiron 14 Plus 5441
Message-ID: <202605102148.vt5pS8HQ-lkp@intel.com>
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
In-Reply-To: <20260508050828.7442-1-adamszyma@wp.pl>
References: <20260508050828.7442-1-adamszyma@wp.pl>
TO: Adam Szyma <adamszyma@wp.pl>
TO: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: robh@kernel.org
CC: conor+dt@kernel.org
CC: andersson@kernel.org
CC: quic_bjorande@quicinc.com
CC: val@packett.cool
CC: Adam Szyma <adamszyma@wp.pl>

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.1-rc2 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Szyma/arm64-dts-qcom-Add-Dell-Inspiron-14-Plus-5441/20260510-084815
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260508050828.7442-1-adamszyma%40wp.pl
patch subject: [PATCH v2] arm64: dts: qcom: Add Dell Inspiron 14 Plus 5441
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-2055-20260510 (https://download.01.org/0day-ci/archive/20260510/202605102148.vt5pS8HQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102148.vt5pS8HQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605102148.vt5pS8HQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dtb: / (dell,inspiron-14-plus-5441): compatible: 'oneOf' conditional failed, one must be fixed:
   	['dell,inspiron-14-plus-5441', 'qcom,x1p64100', 'qcom,x1e80100'] is too long
   	['dell,inspiron-14-plus-5441', 'qcom,x1p64100', 'qcom,x1e80100'] is too short
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'dell,inspiron-14-plus-5441' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'dell,inspiron-14-plus-5441' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,apq8074-dragonboard']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,eliza-mtp']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,glymur-crd']
--
   	'google,lazor-rev5-sku0' was expected
   	'google,lazor-rev6-sku4' was expected
   	'google,lazor-rev6-sku6' was expected
   	'google,hoglin-rev4' was expected
   	'google,zombie-sku515' was expected
   	'qcom,qcs404' was expected
   	'qcom,sm6150' was expected
   	'qcom,qcs8550' was expected
   	'qcom,x1p64100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dtb: /: failed to match any schema with compatible: ['dell,inspiron-14-plus-5441', 'qcom,x1p64100', 'qcom,x1e80100']
--
>> arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441-el2.dtb: / (dell,inspiron-14-plus-5441): compatible: 'oneOf' conditional failed, one must be fixed:
   	['dell,inspiron-14-plus-5441', 'qcom,x1p64100', 'qcom,x1e80100'] is too long
   	['dell,inspiron-14-plus-5441', 'qcom,x1p64100', 'qcom,x1e80100'] is too short
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,apq8016-sbc', 'schneider,apq8016-hmibsc']
   	'dell,inspiron-14-plus-5441' is not one of ['asus,sparrow', 'huawei,sturgeon', 'lg,lenok', 'samsung,matisse-wifi', 'samsung,milletwifi']
   	'dell,inspiron-14-plus-5441' is not one of ['asus,nexus7-flo', 'lg,nexus4-mako', 'sony,xperia-yuga', 'qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,apq8074-dragonboard']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,eliza-mtp']
   	'dell,inspiron-14-plus-5441' is not one of ['qcom,glymur-crd']
--
   	'google,lazor-rev5-sku0' was expected
   	'google,lazor-rev6-sku4' was expected
   	'google,lazor-rev6-sku6' was expected
   	'google,hoglin-rev4' was expected
   	'google,zombie-sku515' was expected
   	'qcom,qcs404' was expected
   	'qcom,sm6150' was expected
   	'qcom,qcs8550' was expected
   	'qcom,x1p64100' was expected
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441-el2.dtb: /: failed to match any schema with compatible: ['dell,inspiron-14-plus-5441', 'qcom,x1p64100', 'qcom,x1e80100']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

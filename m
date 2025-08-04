Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB44922259E
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754299189; cv=none; b=uNYYM5lsOj5/FK6stBfuUIN36dPPzXdWcd6/GZae26+GyIyi4KbumpXMk2QtFcdlWZEkdI24ablBzYAOAspyb0W4slkIJOz1nKMa2QQCwAdDOBODuq5iKSG7pUCzeD7gG50dphqAH7xbvbOpilw5KfeAOF80OytLfDVzirpfuw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754299189; c=relaxed/simple;
	bh=xKI1Qj+xaETyPAgD0zGLjcbXsx3c/Glj6hUbdW398QE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNpd+16WFCARWWubPiZfC6EkSFZ21RH0nnr7Z6BLli04k8PGnNGqZlVbo28p8WMxcIXIjuAEbMk8WjIcM8WROOB+e1pRbkzJh5/SP2A2AgSGjsInfHgun6v1B6DJh6f601Ig9mEwFVEbbN14jsMQgBFygS5ardl85nGwGXzblDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENLa/TP3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENLa/TP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754299188; x=1785835188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xKI1Qj+xaETyPAgD0zGLjcbXsx3c/Glj6hUbdW398QE=;
  b=ENLa/TP3UJrAQ4LbHrI/kYmiPBRkxoZPohlzZ3i46iyBPmbNDgFaSqoD
   VajQ0DuiwnBVxzKUPfJOANlii033q1L7NXHVvY6X+7f+FncKsmZdFiWqC
   ZS2NlYDLWj9byPnqAmH2471v3hEU7T2FioWROEKFNa6IaL9U2ZtRU2KD3
   rZqH4UdC5+Zy51JCTqWZiAI3T7w+joX/6TnzJT2T8mD3kGOjVgWLK/WPS
   uJuXwxHp+yXTu/VdgRkKQiQmYiZHxS5vYTt7NRDJM9zbaGE6beuwNfxQ5
   JWjt6ecN2Wtlf56KnSBJa6DRuj4Bya9+g9OJMXr0IR3uqvB+e1LudH9BV
   Q==;
X-CSE-ConnectionGUID: J3KxtO2vTseBGSDizSdrtg==
X-CSE-MsgGUID: 06s1MbLRS3O3RXG134+i7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="59172902"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59172902"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 02:19:47 -0700
X-CSE-ConnectionGUID: aMwhenVnQsGtiOLT0bQ2AA==
X-CSE-MsgGUID: fBTpcWlnQXmQ4SfPKyfOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168296667"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Aug 2025 02:19:46 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uirM8-0006vI-05;
	Mon, 04 Aug 2025 09:19:44 +0000
Date: Mon, 4 Aug 2025 17:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 12/60]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd
 (lincolntech,lcd185-101ct): Unevaluated properties are not allowed
 ('compatible' was unexpected)
Message-ID: <202508041738.2c5fuN6v-lkp@intel.com>
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
TO: Aradhya Bhatia <a-bhatia1@ti.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: 0a3beea5c650fcd3363683e7c5b7008de0a0bcbe [12/60] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
:::::: branch date: 5 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-052-20250802 (https://download.01.org/0day-ci/archive/20250804/202508041738.2c5fuN6v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041738.2c5fuN6v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508041738.2c5fuN6v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): compatible: ['lincolntech,lcd185-101ct', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: /lcd: failed to match any schema with compatible: ['lincolntech,lcd185-101ct', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

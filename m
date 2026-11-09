Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254546;
	b=H26PGHmgfUSM6CWucwaveVKeCxqj/YSvtAabT37P7AMskTKboZ0p8CauF2MhGcblNEKM
	 Y5PfXD4kGr8Lu+QqO4JMhJ5qUStEIpjbx0Mtp/7/WY72INXRoD7dIHtpSUM0senJbRkF+
	 QDJDNeiqLPFq94/iMfATGfx/WWljH7V9kjqd2glf0V3U54wj71K6PPdP8nauO8dI6nusa
	 NnE0TrennpCNpW2DzYReojU16D3+erJUBOX7QpI+vLK3nmIPQObbWN21DwxnwraGsZNcK
	 mGbAl79ItaNFJDVFmKpG4GiO5oWlg//Dqni01yS9mcgesM46HcwlknPdCCx59994T2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254546;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tAxMyUMYdoHl4DSeuK/fVP0RFN6L7QGeeoFHWm2uuLk=;
	b=F9uC4BDRc1GNKklI9YXZinFV4SAa6CYfW7rEj9zsSMJZJ1yFptzGpJu1Cjh/Lmzvb86c
	 DGOScm13wTCyAccR5iPSNncGD6HL0hAEyQYANJd881FHAgErDXubBnWN7QLARKX/GlUz9
	 LbZT+MN6wsbbSIJq1REP6L9rnPUXZhtZ00jAUSRdYlaU8R5uzuj8tFTQ3E9qkym/ZEHMc
	 cGmyGYwRWJPCFUQ5XWfAr/T5l88OYLR6sEO2lZRDfTXXCNGWumy7Amoz11lz6mGdFmbJC
	 KRLkYGqRDAbqpMsTaEBsOtwk0KPWuslfPoa/M/gT9QLiPwrt7ySEuYzVR/wTaWgd34g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ni6v1H+o;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E8D606A339
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 20:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E8D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ni6v1H+o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794254545; x=1825790545;
  h=date:from:to:cc:subject:message-id;
  bh=0sVgRXNWM4jdY9KqbtWjQukDlAudC1VcJCvNTC3cp4c=;
  b=Ni6v1H+o1XDVbS1tuFPC5aR06ruSd2g4dwzjmi0a0rpPQJ9EMZrP8PoJ
   BwR4IQOD0yxt2Aes4JQJW5iJLmLxx6fw4yh+WR3LpSg53HVEuQLm1SDBN
   ztknudyZnwdF86H3EVshab6+n7ILKzejN+kP4qhcy4nfuAoEPTUQcJZSj
   qDMWbdX0z3RGN2kI/DHc7mP6pPFy2jGJ+RDX7Junbnk9Ybjt2Ef1bKYnS
   bx9buR4YAiwtw4KDCb2mMQSn9aZYSHnszhr92F/d3selroC2sh+tHx1SZ
   gIFuJJWEzJGKLg88dUabkX7RhquhFjDmZYEAKVJAXERUYt4Prxywvkyj/
   A==;
X-CSE-ConnectionGUID: aDStGlieSX+ABGHypZh3Vw==
X-CSE-MsgGUID: OerAG4kfQCm1jgrCgjHm6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3017014"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3017014"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 12:02:15 -0800
X-CSE-ConnectionGUID: 5O5UEm+gTW2uN5K8K/NupA==
X-CSE-MsgGUID: F8atUsfET6qP99zfN+knqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7826697"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 Nov 2026 12:02:13 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQVZD-000000000St-1RID;
	Mon, 09 Nov 2026 20:02:11 +0000
Date: Mon, 09 Nov 2026 21:01:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gerg-m68knommu:dt 3/21]
 Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml: 'allof' is not
 one of ['$id', '$schema', 'title', 'description', 'examples', 'required',
 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties',
 'dependencies', 'dependentRequi...
Message-ID: <202611092032.Dz76oRZ0-lkp@intel.com>
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
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@linux-m68k.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   d9ec793883ff32888adda6af2346c96ddebaacce
commit: 7af6b47e3c1ebd8a90ec515e82bee9500ff92fcf [3/21] dt-bindings: serial: create binding for mcf-uart
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611092032.Dz76oRZ0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092032.Dz76oRZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611092032.Dz76oRZ0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml: 'allof' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

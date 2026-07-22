Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCBC41A519
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737213; cv=none; b=IvQwXphOCHbluWVWnrrsPhR+aHYD0bmyi+NKtjAskBS06TyXohJXzfHSagtINJ2TpY4LzbgAJWtCOMKBgL6hgdJzyI5LhfrxRzOaZ0/0hqTdn63TdBIeuc8WXLYymqBmwLGQjgT4bEvBXj2gSILik9c6AFnQJI6gaZAHzPB0SDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737213; c=relaxed/simple;
	bh=9P/gZ02g0FjwMqrnlxsLZewSUCq0GsZckvpqQShhAvU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RigKywz7j0Rt6gGjQN2EBOGLjviDcYKFRL4dfYhqT6InwmNKbaPmsNDV2nk3gvVfrgahlm84Ka18KGbNjLQcavbtWuaSGUZMvN14RLRMk2dVlyVPwricS27XgSoLlzjG+Ynfni2XfrqMYkqA8iZ90Koe4YwZ/7eer4TF9IXlvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S82eN0b3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S82eN0b3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784737211; x=1816273211;
  h=date:from:to:cc:subject:message-id;
  bh=9P/gZ02g0FjwMqrnlxsLZewSUCq0GsZckvpqQShhAvU=;
  b=S82eN0b3SemTuBXlLUieEHUdoWFad1uZ/GrPzaTFhtg2pABG/mzPOw8T
   9q2GyXeAaAcL10dFLznPnWuagtyUA0BJnRwcPoz7DE86vhaBLuUc9do9Z
   hdC/qmxiyFENVNRhtL7swdLUr7WXyrLe1/t9PaZUjJYqbXp9so5diWqMQ
   IEZvIYNA6Je7i5Edu152jcnwDHbeFbedXUCUudoj0lyBXVCKkViQTUBui
   GmjWtFnBY0aZZbJzvvnsYRdTPiYeZpFRBgDQFNhW7vMltKolRkEleQBOL
   MMhBzHYblFwiVSef112OG3Jsn89kWWtSoorDSL8Kn51xRv5kg1Lw19fOf
   w==;
X-CSE-ConnectionGUID: 4L8FDBfsSBC0Ra4QnikT7A==
X-CSE-MsgGUID: G3L0G5BrRPyJs/QjuuE1vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85232847"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="85232847"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 09:20:11 -0700
X-CSE-ConnectionGUID: gBNf2SN/RRyopSRstSeS/g==
X-CSE-MsgGUID: 4w5nkKw1RBitjGB25d+PvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="262440914"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2026 09:20:10 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmZfz-000000000Vu-49sq;
	Wed, 22 Jul 2026 16:20:07 +0000
Date: Wed, 22 Jul 2026 18:19:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Documentation/devicetree/bindings/regmap/common.yaml:
 maintainers:0: 'TBD' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
Message-ID: <202607221844.slsRRwHo-lkp@intel.com>
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
TO: Richard Leitner <richard.leitner@linux.dev>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Richard-Leitner/dt-bindings-regmap-add-common-schema-for-no-sequential-read/20260722-170713
head:   b0e0ce6d34cace8f7bced9b315dec7495fed319f
commit: 8d0f252f38f9630ce5615083f3319e400752b2ab dt-bindings: regmap: add common schema for no-sequential-read
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arc-randconfig-2052-20260722 (https://download.01.org/0day-ci/archive/20260722/202607221844.slsRRwHo-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607221844.slsRRwHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607221844.slsRRwHo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/regmap/common.yaml: maintainers:0: 'TBD' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

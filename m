Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76982AE78
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 01:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783561865; cv=none; b=S2yDmWGUH9PEG29TVrb3A25qr8GSLrDLurJjbXpx9gncOuR6IPpU7ABU/Xx07Ca0M1Q0bzbeHt3ICmpZptfWR9av/qBbfOFGMO5DzdVigsTH08nUOUfz/WusZoNhO1+Cw0h/GDxLlSZMsVdajM7PGnCDi7YVb2fxeykx1t8hCpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783561865; c=relaxed/simple;
	bh=nAgwbJD2tODbhY4iwuH8pQeNDhl295bWUibdOY5eOXw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NU6abmsXvQLTHkGRc/wckM2eU56zTL1wP7GvSmNlC7NoALdGh8JXdqcRnI9Wmhox3fMG+WMWInJWvahv3uqsiu7YMhEDAtllC6VwU3bsnPqnyaxoSspp9Oivha4Uz2RhQ4O49m5d+cGFHFEOgxGS7FLmVYEYP+fsRzqyhU5UIIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R04hR2vR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R04hR2vR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783561864; x=1815097864;
  h=date:from:to:cc:subject:message-id;
  bh=nAgwbJD2tODbhY4iwuH8pQeNDhl295bWUibdOY5eOXw=;
  b=R04hR2vRTfdbtw4CPtmqHVLqd21/3AJ8gYUqHYLbvuL9P0KSDk/JlvHo
   m8xMUm2FjdF+YBCPCt8EN0MEhLnRTrPLYZEqkLZz6zUD2DEfEr3jmEyeE
   JgRk7CML2VGfDEWTD8Izu2JW7e/sfq/4h7J/fTMysQEmk95KQV+fReWY/
   TQyNuLtPoFdJZ/bqoUTR+aqoQ0sZtfdsHtyFFiykFKk8XjbmQSSgfyp6H
   yb0v3PfiOpB34IQbttmX7/Ez5nEODM4J5trmSAqpFreNCH7SnXN67rKg9
   ppNSP3ZpkT2y5lAnH7Wv/F03FtLPuMlEBWW5g0qUW20ueO3lES18lrfdh
   A==;
X-CSE-ConnectionGUID: U3xBNdJ4RrCi5eVl52oegw==
X-CSE-MsgGUID: 3gmfKN1fRdmu7XpXn2+ztg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84255806"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84255806"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:51:04 -0700
X-CSE-ConnectionGUID: MqVG7JDjQ+eMCRmPGlQbUg==
X-CSE-MsgGUID: y08088fLQMCOd3EEHg6XXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250026956"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 Jul 2026 18:51:02 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whdul-000000002s5-3d1N;
	Thu, 09 Jul 2026 01:50:59 +0000
Date: Thu, 09 Jul 2026 03:50:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gerg-m68knommu:cf-serial 4/5]
 Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml: 'allof' is not
 one of ['$id', '$schema', 'title', 'description', 'examples', 'required',
 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties',
 'dependencies', 'dependentRequi...
Message-ID: <202607090314.w1OrAnmX-lkp@intel.com>
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
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@linux-m68k.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cf-serial
head:   d0516cb09590a77813f1c41189bc6196d49c74cf
commit: 08d65cd03a4f6e0042a8ca07cabbfb6e8e22d1ef [4/5] dt-bindings: serial: create binding for mcf-uart
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-2051-20260709 (https://download.01.org/0day-ci/archive/20260709/202607090314.w1OrAnmX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090314.w1OrAnmX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607090314.w1OrAnmX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/serial/fsl,mcf-uart.yaml: 'allof' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C56838839F
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Sep 2026 04:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411270; cv=none; b=tMI71H52MAUaeN2/61E6CYtyOast4+drPHH7txbe2u7Jjh7sd5GDsIrB6FEz8v7+KyeTnEhVn+CDL3ZCh2swx5W2U+aLuOeZZF83me2d8KaZbRiNqdiWvEp8LOhy8WENkX5pDBvQ+5gO6XHIKWBbqZTvU2AhZqrhQ17HPkXxUOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411270; c=relaxed/simple;
	bh=WiLOQj8BZQ99xQV+F6rAUpS27g+SkwSGoLddOsCzqSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gImTndxlpZ0LprnflV8ZE3og21+aHYgCRUQ138kZYogqzkJomNHjIJ9VOXruQUKLJAR7sFmYeIYOyCoH2sW1IEzoZgVxPTq6S3Zrl9/M/iZX/bnWIKOMOlJnDQlgzH80gEQlR+o2fQAZO8MaquMwb/QjsO4jrgyls1FjA+nv7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXppEIj1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXppEIj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788411269; x=1819947269;
  h=date:from:to:cc:subject:message-id;
  bh=WiLOQj8BZQ99xQV+F6rAUpS27g+SkwSGoLddOsCzqSk=;
  b=YXppEIj1TUVjuVaUxJkMYe5BZ5A+CpcQ7XEvmJr1sYHwQXI3VAnaXoQO
   1zu8BTwkPBo6lhKsyNq8gOqAC8pkZB4PDEwQOnA064a9QJ+cEQdYy2OWT
   jRsuNW/FqTuK2rGxFEvolrtKieYUrWOi4sQRRDIcNHT3m4S6rjOcR1QN6
   A7lS9u17SkTK+uBRCz4g2BK0hrkS48G0Uud6cig59HWJIOoXLJsHhxCly
   7sZD+1zhYQuNXwLm1cYwsU2+b3PfNqdiA9KSMwYvBaFtCCS3NxUs6CsEM
   ROQkpdzk+qq5Jl9CravMz7C+bvHqGKBOaD4+4ISHDBTnfcij0roGWqfH1
   A==;
X-CSE-ConnectionGUID: avMXcZKFQYq2MT6cTVgdjA==
X-CSE-MsgGUID: 31yhwi4PRau3OnwPBVajYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88644834"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88644834"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:54:28 -0700
X-CSE-ConnectionGUID: etBZYbzdQ5al1yqsndpw6Q==
X-CSE-MsgGUID: AeFKgvU8TTGhiO9WbNplpA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 02 Sep 2026 21:54:27 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1zSy-000000000kV-3Qiw;
	Thu, 03 Sep 2026 04:54:24 +0000
Date: Thu, 03 Sep 2026 06:54:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1933/3131]
 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml:56: example 0
 [redundant-whitespace] extra whitespace before {
Message-ID: <202609030635.eSuyzFSp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml:56: example 0 [redundant-whitespace] extra whitespace before {"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
commit: ed47943d94f18bb2ca2995936ae8c06f65fa720e [1933/3131] dtc: dt-check-style: Add warning for redundant white-spaces
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: arc-randconfig-2051-20260902 (https://download.01.org/0day-ci/archive/20260903/202609030635.eSuyzFSp-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030635.eSuyzFSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609030635.eSuyzFSp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml:56: example 0 [redundant-whitespace] extra whitespace before {

vim +56 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml

cbc775e060cecb Jacopo Mondi 2024-06-26  47  
cbc775e060cecb Jacopo Mondi 2024-06-26  48  examples:
cbc775e060cecb Jacopo Mondi 2024-06-26  49    - |
cbc775e060cecb Jacopo Mondi 2024-06-26  50      #include <dt-bindings/interrupt-controller/arm-gic.h>
cbc775e060cecb Jacopo Mondi 2024-06-26  51  
cbc775e060cecb Jacopo Mondi 2024-06-26  52      soc {
cbc775e060cecb Jacopo Mondi 2024-06-26  53          #address-cells = <2>;
cbc775e060cecb Jacopo Mondi 2024-06-26  54          #size-cells = <2>;
cbc775e060cecb Jacopo Mondi 2024-06-26  55  
cbc775e060cecb Jacopo Mondi 2024-06-26 @56          isp@880000  {

:::::: The code at line 56 was first introduced by commit
:::::: cbc775e060cecbdb7210f46d8e7a65df2a865ee7 media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End

:::::: TO: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
:::::: CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

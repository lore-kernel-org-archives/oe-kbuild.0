Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC5929B8EF
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764747684; cv=none; b=S+B9a6oNjlFaobYTZRspqE+Z8ZkmwsS/zSWn76nxZ+JPKvIyFPsjqe+mr0vQfppxTTOhulF/7s0G0JHwKrC5+t6j3s1etNeJ0b03BkJH8BcfM1l1ms7qjnB20SsxkhpjswW5qXvWn4cMiLnJBF3UVQHluw42hmyFP2b5IjnUVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764747684; c=relaxed/simple;
	bh=NQbe8DZiv10yu1+elzvglKbiYxieoUqnRQfcISpspZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K59MEUtFtkw7DkpSeph9A9Q04BTcPYZ/fuqFBdnKzmcbzFrorWKQDlTLWcBCYZXkr7Gr2s6G2PkLsfcFxv3MxXoMKop9lyWcgt4sfmnCHk8Um5H+EI1siEIj9cX6Rrcaybl4+pbQ32B9bk/5lvS/J1ELiG/VrT7M5pShfPrcfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxRbIMCJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxRbIMCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764747684; x=1796283684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQbe8DZiv10yu1+elzvglKbiYxieoUqnRQfcISpspZY=;
  b=OxRbIMCJaMAzbYwCrz3ZM/blKJZF/RaiLJsDH6iSwmmeUPuqJqtwHhfg
   BQ9vQGbN90BohwDu7MIeb4Po3v+tXS7t0ORNWsLi8LjPzIEFr0WZKkYyZ
   KRTu9d3Vx8+MQDDE/0VmgmKX68fkqGqGkro2ctIOd8wPT3fIAaiLcpLp9
   2NNA1yvayUatps/AbMJi60nbGwvmYMzKaN4U5fW+8cJu9Yki/K3MAEoae
   9/EykyeXK9pIowcQXXld01Dg7XOKhhPhsxzx15zEHQ2k7w8ZMSt3vp9Mr
   eMQNDH1Bvn+4xaV791qkoDCzx5AQx7g5HahwjiFCt5B98ZUBOAzg1O9E5
   g==;
X-CSE-ConnectionGUID: 9eW66BsNSRa1GIyELVOcGA==
X-CSE-MsgGUID: EChZygIvRvmfrJrFtD9wvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84132145"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="84132145"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 23:41:23 -0800
X-CSE-ConnectionGUID: tFIixQfgTkW3JSd/VI6/HA==
X-CSE-MsgGUID: K8txmM3gRfWTi+wuIFMf7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="225547087"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Dec 2025 23:41:22 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQhUF-00000000AiH-2Toi;
	Wed, 03 Dec 2025 07:41:19 +0000
Date: Wed, 3 Dec 2025 15:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-sigsegv 7/7] drivers/scsi/qla2xxx/qla2xxx.o:
 error: SIGSEGV: objtool stack overflow!
Message-ID: <202512031510.8BRITf5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-sigsegv
head:   b93620bd56cefffb0b9f47233e00d9655613cc55
commit: b93620bd56cefffb0b9f47233e00d9655613cc55 [7/7] objtool: Add signal error handling
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251203/202512031510.8BRITf5g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031510.8BRITf5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512031510.8BRITf5g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla2xxx.o: error: SIGSEGV: objtool stack overflow!
   /bin/bash: line 1: 1602464 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --link --module drivers/scsi/qla2xxx/qla2xxx.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

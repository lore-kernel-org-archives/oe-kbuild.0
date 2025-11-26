Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7478533BBBB
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172809; cv=none; b=WGJsD2zTuGmCa0A5VWnhZfg1gUgrb2L/2DE4yRT3QNMYqWYQpEjffEI+NdSoszleXSHFKN61iNbr/Yt/4kSBWAJPQ/930VbDM7B+bbdFrmNFs7eMGfYn0Ezb8RR3f2NycAgP21aoXRkTe5oU5A0B0hrhpmKNf9mtslCSLEyRJOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172809; c=relaxed/simple;
	bh=tkXS6l3xB50nUkDUnCj97YfJ3cOrEe5yNhxy/8IDWms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkQpHbR9pTIHO8OqJ5AN+DLTvy7s/dhMVxE2+rJrYGEuboIdCqH6WK6lV1rpAy75l08C3urG10mmUyEwyCVnZ7VWk+JSypcMndwKpYRiYVDMyHKb++/hApfz7q9Ww3DKEn0B9ArjukRjd2YyjwYFCj6eXm7YDsvz6Gp4e9XTY6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qj63gO8u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj63gO8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764172807; x=1795708807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tkXS6l3xB50nUkDUnCj97YfJ3cOrEe5yNhxy/8IDWms=;
  b=Qj63gO8u2UUFkW74S2K9XdDl1+k5XsWEkGBhVXsopzZnKRTKf7fJsFX+
   jmBx4rolcQF7K0KTJWtyxfFyBz5+nnJWvhEX0BIRu+orFkX5MWWY/VHGG
   Fpwynad2Qo785nC232dxaPmlL92diQluUMKNrTtVAHmdPHbaUzeGPqynO
   G7qz1d1KuP8sBPH84Hmg8fueBPw1y2rIm9A4bVH0uk8rzJZEwON9Te2Mn
   vPAryEg8VE+gXwYiuI3iTfeq0cEGuoLkSRghiyq7UtRFuA7oGtCffqKeR
   ODHWKIby6ENzSR+58WayQR2TuDQWavQTL+2rKWBXYFNBSMjqO+YzkZp2i
   Q==;
X-CSE-ConnectionGUID: r3jY55RCRRmCB47+ifYcMw==
X-CSE-MsgGUID: s2CXs46hSE624d5vrdCjWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76899067"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76899067"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 08:00:05 -0800
X-CSE-ConnectionGUID: ZK7tyy4/RlSI1veeRPPE3g==
X-CSE-MsgGUID: 2HFYQWOrSnyTYYf2Z8pVUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192608238"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 08:00:04 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOHw2-0000000034D-0EUs;
	Wed, 26 Nov 2025 16:00:02 +0000
Date: Wed, 26 Nov 2025 23:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:objtool/core 25/44] /bin/bash: line 1: 360969 Segmentation
 fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr
 --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk
 --sls --static-call --uaccess --no-unreachable --link --module
 drivers/scs...
Message-ID: <202511262309.Bpk0oo8j-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Alexandre Chartre <alexandre.chartre@oracle.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/core
head:   c0a67900dc129825c48d3638480297aa00f39c00
commit: fcb268b47a2f4a497fdb40ef24bb9e06488b7213 [25/44] objtool: Trace instruction state changes during function validation
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251126/202511262309.Bpk0oo8j-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511262309.Bpk0oo8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511262309.Bpk0oo8j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: 360969 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --cfi --mcount --mnop --orc --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --link --module drivers/scsi/qla2xxx/qla2xxx.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

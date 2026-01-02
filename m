Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CDC4A3E
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 00:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767312425; cv=none; b=NBZXRng5tbYj2QFLBVVKdjR11vr64z/1u29VXU4iXCWSgMf9ZQOe8lm2tDFR4fQyeLV5nj5T9U8UKfzkebTiuBMe2545jqJMwH9+PfUxM749gafNurPJvr9CnC9y2mbUWKjCRXTlE66fpJ5x/DMhZUq5YeiA0SeJN1wiwDim5Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767312425; c=relaxed/simple;
	bh=2Aq0aIkjn0jTS3AR/P22xE4XZDCoeeih5hKMkvRQPEM=;
	h=Date:From:To:Subject:Message-ID; b=rrpLv1UoYySEeJ1j1XLj3UUPH+md6wYGQHAEYXjdMOn+i3xOIpMIk7OrcmaX/2TZ8HYTco9JS1CMUUztmrRtE2XoxCZjqOPtNhF8Okml/F6PaOYt3Ya9NH9E0YhtCaoeivJtUrJhWvMw32eToPawEA/jXXRENsRidoUezcUxiMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gf2S72mK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gf2S72mK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767312423; x=1798848423;
  h=date:from:to:subject:message-id;
  bh=2Aq0aIkjn0jTS3AR/P22xE4XZDCoeeih5hKMkvRQPEM=;
  b=gf2S72mKMyWK10fHXemRYdvCwhHASX0/46EFlsSrWsG+gmo04YWBAIud
   Nhab8iJ22pdLynTxYwXvyhVcPig+hARwv1Y8soAr5FbqPoKtfBB+kfmah
   rODS+yts1jd1E7p9EOjtHBTi03Qc2ywyY7vGG32LYWHQGDFM3an/4GbMv
   JEGEJ2PGfjc9kiFc4zAJIW6ePM3er0cDg2KkAjpmq+X+1IYiQ8jS/CD9/
   esL6elRbQnous2PgYkdJh+IksxUPihVOrtd/YozmNyUvWZNjBSTA9fmYf
   w+Yvbkc1XYLlcRfkZQfud7kftJMqfzcJMTGpEZMx9Hz7LWs+6Zhcnb0vM
   Q==;
X-CSE-ConnectionGUID: xboCVpltSDC9KOgOO7gtxg==
X-CSE-MsgGUID: hCiix7lRTJiEJdU/tch2rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72674636"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="72674636"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 16:07:02 -0800
X-CSE-ConnectionGUID: kVgOcMQOTpSfbiLgh8HQBw==
X-CSE-MsgGUID: WcIBi32CQSSAvsi9ZvlzTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="202672919"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jan 2026 16:07:01 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbSh1-000000000Kk-26Cw
	for oe-kbuild@lists.linux.dev;
	Fri, 02 Jan 2026 00:06:59 +0000
Date: Fri, 02 Jan 2026 01:06:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-github:work.immutable.rootfs 5/5] checkpatch:
 ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
Message-ID: <202601020126.nUIL95Ea-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.immutable.rootfs
head:   e0044601c488efead3bb41d06658dc471ec69850
commit: e0044601c488efead3bb41d06658dc471ec69850 [5/5] fs: add immutable rootfs
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260102/202601020126.nUIL95Ea-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:GLOBAL_INITIALISERS: do not initialise globals to false
#79: FILE: fs/namespace.c:78:
+bool immutable_rootfs = false;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

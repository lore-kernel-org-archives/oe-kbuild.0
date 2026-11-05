Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912750;
	b=Ud4yOiqckb63l9geoe/JhII3obyvcjSCc7tbRU3bpdvN+b4g4tcIUcxOvIakZL/3Lgi1
	 VPSqV3SnQWv8DexkUApIsIQDZEixJuvO6zZO5OGsjtwmSZdxJ3y3MpQ5GmhrFHVn3w7/F
	 2bUfTF+hT80rU70/V6MdQ1KvOZxwoZhRZtYJOOnA/M37u0dvKR97zcd1vWNurEsw1sgOQ
	 0O9x8vW1VDq7N2+dYE8ZYHycwm7vECiGvRogPfH1ZeokA/99dhn5zocwBiaewlppv1fVs
	 CDbAeqblAWt2ieY/hflYyUmrbW3z53RVd73dhzGk40u5Zu+23i9lXirCuO5JmgxImCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912750;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=oLmYpp08OwOgmuwMtCYdv8c6eDIDYjaSURGf7IhTHKg=;
	b=PNNSspMHZt24KDV8CBDCg1051FFJTdgvhe0z7nyl1geBGYV6UM28g5PCL4M+pJ+er1MQ
	 Jx1+DYs2xkMIGv8q3MOB1v+HsPG6rOqE6Qhhrk069Mxj28ztZsD4tmMxr43G74OlTAGIH
	 ogMDK3RxQfDx+ygICLU9HDdjwpVJwXCAGx+ddgTqufcxrmtYpJALpSi5YnrHiqE3fq+r+
	 NoY1EStapAyGn6k1sLNWplgsrvaKkq9yXimKAeqTWNdtdajOj2aYn6uhajw8MjjYeWhV9
	 sHbClV6ZpcDIQvax/YWM0fHb0CdC39Cns0YZz/kux9+nY/fIdEi+OHJfYFbBU0PFCxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WklObvi2;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FAA606A31B
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 21:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62FAA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WklObvi2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793912749; x=1825448749;
  h=date:from:to:cc:subject:message-id;
  bh=UmpHKHimnbAc6bAVBoFgaNpKuJHvSZntgUtoFbexpyo=;
  b=WklObvi2K1T3A6kLqwJqjsvcGawrowAAxB7Lj1rfsEkLhyTlxf1fFyG2
   7gBhJ0ujQtIsPaCQ6w5k8+itUatbr6KEo7dtufuU+a6YrcbgjfYuErE9U
   Ce5FxLnNdQg6gxwYPVAA6rInhCTPMwopZiE21oxYTtPHu3mqX3y5kYzY/
   EWo1KpESqxVHQjEk7/tu9IehcTOJxymQ2SPGbImFEXgfdd48rwQE6WphV
   DWxFDNicnGn1hU/hVFu3IdmsZTU4mtooVWKPtYAa/pfZ4gGsesM0jdlBR
   hDD/JxmB0tovprwQ37htQWFQAj2s009JH5djOR0e9unq5CmYxOs1qpvEa
   w==;
X-CSE-ConnectionGUID: 3A6asn8yTaSD3WDtMQswBw==
X-CSE-MsgGUID: NGqcguRQSCiiPYipVuWOTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2721145"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2721145"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:05:48 -0800
X-CSE-ConnectionGUID: w1ZXR+CnSAaSNJZGUacDcg==
X-CSE-MsgGUID: nudM7cBKS1SRt8EPornsSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7279396"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2026 13:05:46 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP4eV-000000009nn-04TI;
	Thu, 05 Nov 2026 21:05:43 +0000
Date: Thu, 05 Nov 2026 22:04:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [snitzer:kernel-7.3/jflynn-io500-canary 1339/1462]
 powerpc64-linux-gnu-ld: fs/nfs/super.o:(__param+0x138): undefined reference
 to `nfs_idmap_cache_timeout'
Message-ID: <202611052124.EcUajHP1-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Flynn <david.flynn@hammerspace.com>
CC: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/jflynn-io500-canary
head:   a0f5f04a3920835767e24c944e54a676d5aa32b8
commit: 1bb07fd5eb81675b74c94d750b57d01f34768f8c [1339/1462] hammerspace: private extensions (O_NOMODE, mkdirat2, NFS client/server)
:::::: branch date: 22 hours ago
:::::: commit date: 25 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261105/202611052124.EcUajHP1-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052124.EcUajHP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611052124.EcUajHP1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> <stdin>:1633:2: warning: #warning syscall mkdirat2 not implemented [-Wcpp]
--
>> powerpc64-linux-gnu-ld: fs/nfs/super.o:(__param+0x138): undefined reference to `nfs_idmap_cache_timeout'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

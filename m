Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714174A340F
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Sep 2026 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867583; cv=none; b=tV2R5e9XzhtkYo+xpvXmoXNEIO40+0CQrjMxBRyPC4tvcoPGPW6fV0ZE9pxlBc7s/vIZI2qqzDupZSIE0Gl5bpSrlQZlRd5aCFc5G3uyXWFWRyjEme4h6yLW/wZIm6VqlnbuwLanqnngH6R6s8bMpco9wNny/G1yjL+blaVlVso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867583; c=relaxed/simple;
	bh=fFMV8LwFkFyhGz0Zk3ro13suLOkaNmvSXFV1twtiVYY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YLrUFKlztwgRLQY1xkuSPz7s9htacRE1gC29Xn+hk7VWAXS0sqPTnkPfzuOHGaFBulfdJMzlR1yUX35LuTut2M9WjZr+eHvjJBghViHMZvUKJrg7gD/OqlJMb+0dTjeufdrNesoI1dd9rekD5+7W7AvQ6UmwUYFLIfWWJ+V2PKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pys0jwL+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pys0jwL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788867577; x=1820403577;
  h=date:from:to:cc:subject:message-id;
  bh=fFMV8LwFkFyhGz0Zk3ro13suLOkaNmvSXFV1twtiVYY=;
  b=Pys0jwL+cYa2IUhB/lizDB+GbKnB3gra+fFUGqCl+hYg2OMz24UdFmYP
   qOqQP6RzQb3HRfbQgIedckYW5ePYBPPRYJW1YPvlJ9l0MgEC/TBX277/F
   9hqM1u3catzlgXxN8FXpBFlpzyWTnou7zYYpuyBaiaetTXSpOeyahQGAj
   u2W6wnmhTek701rCz1qSIv1oyhllbzaeeSc30AXRg3O8gn4uinFYkxJHC
   IdzMhNKYJmnoYKPoRe++WY/tHDDnMF8Bdg1EwZVrHWTONCBSug5jkUp/V
   GZkTH5HusBn3ePErICLzwoWbUlCKY6VRDw3vkCj2yX0XAhK5NDrHndbse
   w==;
X-CSE-ConnectionGUID: ZZ+yqsl3R0yLMkxsAyLnQg==
X-CSE-MsgGUID: LKvUZEv/R26BR8ehF1eJuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="76826750"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="76826750"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 04:39:33 -0700
X-CSE-ConnectionGUID: W+Mw1llHRwuI3CTqOLQbtA==
X-CSE-MsgGUID: bMgqvumuSkKRsFvrDYCrWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267721675"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Sep 2026 04:39:31 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3uAj-0000000003L-11Pu;
	Tue, 08 Sep 2026 11:39:29 +0000
Date: Tue, 08 Sep 2026 19:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ceph-client:testing 30/33] fs/ceph/file.c:3195:33: sparse:
 sparse: invalid initializer
Message-ID: <202609081951.CasBVCLQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/ceph/file.c:3195:33: sparse: sparse: invalid initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: ceph-devel@vger.kernel.org
TO: Alex Markuze <amarkuze@redhat.com>
CC: Xiubo Li <xiubo.li@clyso.com>

tree:   https://github.com/ceph/ceph-client.git testing
head:   190736464f4572bfb360fd3747fb827493e02e09
commit: 010045293af61944ede36c1626164c0c9cbf52d3 [30/33] ceph: convert VFS data I/O paths to bout
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: nios2-randconfig-r133-20260908 (https://download.01.org/0day-ci/archive/20260908/202609081951.CasBVCLQ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081951.CasBVCLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609081951.CasBVCLQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ceph/file.c:3195:33: sparse: sparse: invalid initializer
>> fs/ceph/file.c:3195:33: sparse: sparse: invalid initializer
>> fs/ceph/file.c:229:9: sparse: sparse: non size-preserving pointer to integer cast
>> fs/ceph/file.c:229:9: sparse: sparse: non size-preserving integer to pointer cast
>> fs/ceph/file.c:229:9: sparse: sparse: non size-preserving integer to pointer cast
>> fs/ceph/file.c:229:9: sparse: sparse: non size-preserving pointer to integer cast
>> fs/ceph/file.c:229:9: sparse: sparse: non size-preserving integer to pointer cast
>> fs/ceph/file.c:229:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:297:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:297:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:297:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:297:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:297:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:302:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:302:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:302:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:302:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:302:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:335:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:335:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:335:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:335:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:335:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:368:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:368:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:368:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:398:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:415:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:415:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:415:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:415:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:470:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:470:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:470:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:494:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:508:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:508:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:772:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:772:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:772:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:827:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:827:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:827:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:827:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:827:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:827:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:827:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1006:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1017:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1052:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1052:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1052:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1052:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1065:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1065:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1065:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1065:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1112:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1112:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1112:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1112:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1112:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1148:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1148:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1148:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1148:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1212:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1212:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1212:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1212:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1259:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1259:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1316:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1316:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1316:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1360:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1360:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1360:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1404:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1404:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1404:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1404:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1576:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1576:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1576:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1576:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1576:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1812:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1812:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1812:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:1812:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1857:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1857:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1857:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1857:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1857:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:1857:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:2101:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:2101:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:2216:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:2216:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:2216:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:2216:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:2250:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/file.c:2250:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:2250:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:2250:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/file.c:2250:17: sparse: sparse: non size-preserving pointer to integer cast
--
>> fs/ceph/addr.c:1797:17: sparse: sparse: cast from restricted xa_mark_t
>> fs/ceph/addr.c:1797:17: sparse: sparse: cast from restricted xa_mark_t
>> fs/ceph/addr.c:1797:17: sparse: sparse: cast from restricted xa_mark_t
>> fs/ceph/addr.c:2125:17: sparse: sparse: cast from restricted vm_fault_t
>> fs/ceph/addr.c:2125:17: sparse: sparse: cast from restricted vm_fault_t
>> fs/ceph/addr.c:2125:17: sparse: sparse: cast from restricted vm_fault_t
   fs/ceph/addr.c:2168:17: sparse: sparse: cast from restricted vm_fault_t
   fs/ceph/addr.c:2168:17: sparse: sparse: cast from restricted vm_fault_t
   fs/ceph/addr.c:2168:17: sparse: sparse: cast from restricted vm_fault_t
   fs/ceph/addr.c:2275:9: sparse: sparse: cast from restricted vm_fault_t
   fs/ceph/addr.c:2275:9: sparse: sparse: cast from restricted vm_fault_t
   fs/ceph/addr.c:2275:9: sparse: sparse: cast from restricted vm_fault_t
>> fs/ceph/addr.c:95:17: sparse: sparse: non size-preserving integer to pointer cast
>> fs/ceph/addr.c:95:17: sparse: sparse: non size-preserving integer to pointer cast
>> fs/ceph/addr.c:95:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:123:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:123:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:123:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:123:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:123:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:161:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:161:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:169:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:169:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:241:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:428:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:428:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:428:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:428:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:453:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:453:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:496:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:496:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:542:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:542:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:548:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:548:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:567:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:567:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:703:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:703:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:736:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:807:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:807:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:807:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:816:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:816:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:816:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:822:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:822:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:822:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:822:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:834:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:834:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:834:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:844:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:844:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:844:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:844:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:844:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:844:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:844:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:895:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:895:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:895:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:895:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:895:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:895:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:920:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:920:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:920:25: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:931:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:931:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:931:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:936:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:936:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:936:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:979:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:979:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1037:25: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1045:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1045:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1045:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1241:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1248:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1248:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1248:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1248:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1260:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1273:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1397:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1397:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1397:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1397:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1405:25: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1429:25: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1457:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1457:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1457:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1616:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1616:25: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1657:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1657:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1755:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1755:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1755:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1176:9: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1176:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1845:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1874:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1874:9: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1913:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1913:17: sparse: sparse: non size-preserving integer to pointer cast
   fs/ceph/addr.c:1913:17: sparse: sparse: non size-preserving pointer to integer cast
   fs/ceph/addr.c:1935:25: sparse: sparse: non size-preserving integer to pointer cast

vim +3195 fs/ceph/file.c

1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3165  
64bf5ff58dff757 Dave Chinner   2019-06-05  3166  static ssize_t __ceph_copy_file_range(struct file *src_file, loff_t src_off,
503f82a9932d311 Luis Henriques 2018-10-15  3167  				      struct file *dst_file, loff_t dst_off,
503f82a9932d311 Luis Henriques 2018-10-15  3168  				      size_t len, unsigned int flags)
503f82a9932d311 Luis Henriques 2018-10-15  3169  {
503f82a9932d311 Luis Henriques 2018-10-15  3170  	struct inode *src_inode = file_inode(src_file);
503f82a9932d311 Luis Henriques 2018-10-15  3171  	struct inode *dst_inode = file_inode(dst_file);
503f82a9932d311 Luis Henriques 2018-10-15  3172  	struct ceph_inode_info *src_ci = ceph_inode(src_inode);
503f82a9932d311 Luis Henriques 2018-10-15  3173  	struct ceph_inode_info *dst_ci = ceph_inode(dst_inode);
503f82a9932d311 Luis Henriques 2018-10-15  3174  	struct ceph_cap_flush *prealloc_cf;
5995d90d2d19f33 Xiubo Li       2023-06-12  3175  	struct ceph_fs_client *src_fsc = ceph_inode_to_fs_client(src_inode);
38d46409c4639a1 Xiubo Li       2023-06-12  3176  	struct ceph_client *cl = src_fsc->client;
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3177  	loff_t size;
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3178  	ssize_t ret = -EIO, bytes;
503f82a9932d311 Luis Henriques 2018-10-15  3179  	u64 src_objnum, dst_objnum, src_objoff, dst_objoff;
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3180  	u32 src_objlen, dst_objlen;
503f82a9932d311 Luis Henriques 2018-10-15  3181  	int src_got = 0, dst_got = 0, err, dirty;
503f82a9932d311 Luis Henriques 2018-10-15  3182  
6fd4e634835208d Luis Henriques 2019-09-09  3183  	if (src_inode->i_sb != dst_inode->i_sb) {
5995d90d2d19f33 Xiubo Li       2023-06-12  3184  		struct ceph_fs_client *dst_fsc = ceph_inode_to_fs_client(dst_inode);
6fd4e634835208d Luis Henriques 2019-09-09  3185  
6fd4e634835208d Luis Henriques 2019-09-09  3186  		if (ceph_fsid_compare(&src_fsc->client->fsid,
6fd4e634835208d Luis Henriques 2019-09-09  3187  				      &dst_fsc->client->fsid)) {
010045293af6194 Alex Markuze   2026-08-20  3188  			{
010045293af6194 Alex Markuze   2026-08-20  3189  				char src_uuid[40], dst_uuid[40];
010045293af6194 Alex Markuze   2026-08-20  3190  
010045293af6194 Alex Markuze   2026-08-20  3191  				snprintf(src_uuid, sizeof(src_uuid), "%pU",
010045293af6194 Alex Markuze   2026-08-20  3192  					 &src_fsc->client->fsid);
010045293af6194 Alex Markuze   2026-08-20  3193  				snprintf(dst_uuid, sizeof(dst_uuid), "%pU",
010045293af6194 Alex Markuze   2026-08-20  3194  					 &dst_fsc->client->fsid);
010045293af6194 Alex Markuze   2026-08-20 @3195  				boutc(cl, "Copying files across clusters: src: %s dst: %s\n",
010045293af6194 Alex Markuze   2026-08-20  3196  				     src_uuid, dst_uuid);
010045293af6194 Alex Markuze   2026-08-20  3197  			}
5dae222a5ff0c26 Amir Goldstein 2019-06-05  3198  			return -EXDEV;
6fd4e634835208d Luis Henriques 2019-09-09  3199  		}
6fd4e634835208d Luis Henriques 2019-09-09  3200  	}
ccb36aa1b703696 Max Kellermann 2026-08-24  3201  	if (ceph_in_snap(dst_inode))
503f82a9932d311 Luis Henriques 2018-10-15  3202  		return -EROFS;
503f82a9932d311 Luis Henriques 2018-10-15  3203  
503f82a9932d311 Luis Henriques 2018-10-15  3204  	/*
503f82a9932d311 Luis Henriques 2018-10-15  3205  	 * Some of the checks below will return -EOPNOTSUPP, which will force a
503f82a9932d311 Luis Henriques 2018-10-15  3206  	 * fallback to the default VFS copy_file_range implementation.  This is
503f82a9932d311 Luis Henriques 2018-10-15  3207  	 * desirable in several cases (for ex, the 'len' is smaller than the
503f82a9932d311 Luis Henriques 2018-10-15  3208  	 * size of the objects, or in cases where that would be more
503f82a9932d311 Luis Henriques 2018-10-15  3209  	 * efficient).
503f82a9932d311 Luis Henriques 2018-10-15  3210  	 */
503f82a9932d311 Luis Henriques 2018-10-15  3211  
6fd4e634835208d Luis Henriques 2019-09-09  3212  	if (ceph_test_mount_opt(src_fsc, NOCOPYFROM))
ea4cdc548e5e74a Luis Henriques 2018-10-15  3213  		return -EOPNOTSUPP;
ea4cdc548e5e74a Luis Henriques 2018-10-15  3214  
78beb0ff2feceb1 Luis Henriques 2020-01-08  3215  	if (!src_fsc->have_copy_from2)
78beb0ff2feceb1 Luis Henriques 2020-01-08  3216  		return -EOPNOTSUPP;
78beb0ff2feceb1 Luis Henriques 2020-01-08  3217  
a3a0819388b2bf1 Luis Henriques 2019-10-31  3218  	/*
a3a0819388b2bf1 Luis Henriques 2019-10-31  3219  	 * Striped file layouts require that we copy partial objects, but the
a3a0819388b2bf1 Luis Henriques 2019-10-31  3220  	 * OSD copy-from operation only supports full-object copies.  Limit
a3a0819388b2bf1 Luis Henriques 2019-10-31  3221  	 * this to non-striped file layouts for now.
a3a0819388b2bf1 Luis Henriques 2019-10-31  3222  	 */
503f82a9932d311 Luis Henriques 2018-10-15  3223  	if ((src_ci->i_layout.stripe_unit != dst_ci->i_layout.stripe_unit) ||
a3a0819388b2bf1 Luis Henriques 2019-10-31  3224  	    (src_ci->i_layout.stripe_count != 1) ||
a3a0819388b2bf1 Luis Henriques 2019-10-31  3225  	    (dst_ci->i_layout.stripe_count != 1) ||
a3a0819388b2bf1 Luis Henriques 2019-10-31  3226  	    (src_ci->i_layout.object_size != dst_ci->i_layout.object_size)) {
010045293af6194 Alex Markuze   2026-08-20  3227  		boutc(cl, "Invalid src/dst files layout\n");
503f82a9932d311 Luis Henriques 2018-10-15  3228  		return -EOPNOTSUPP;
a3a0819388b2bf1 Luis Henriques 2019-10-31  3229  	}
503f82a9932d311 Luis Henriques 2018-10-15  3230  
94af0470924c636 Jeff Layton    2021-07-01  3231  	/* Every encrypted inode gets its own key, so we can't offload them */
94af0470924c636 Jeff Layton    2021-07-01  3232  	if (IS_ENCRYPTED(src_inode) || IS_ENCRYPTED(dst_inode))
94af0470924c636 Jeff Layton    2021-07-01  3233  		return -EOPNOTSUPP;
94af0470924c636 Jeff Layton    2021-07-01  3234  
503f82a9932d311 Luis Henriques 2018-10-15  3235  	if (len < src_ci->i_layout.object_size)
503f82a9932d311 Luis Henriques 2018-10-15  3236  		return -EOPNOTSUPP; /* no remote copy will be done */
503f82a9932d311 Luis Henriques 2018-10-15  3237  
503f82a9932d311 Luis Henriques 2018-10-15  3238  	prealloc_cf = ceph_alloc_cap_flush();
503f82a9932d311 Luis Henriques 2018-10-15  3239  	if (!prealloc_cf)
503f82a9932d311 Luis Henriques 2018-10-15  3240  		return -ENOMEM;
503f82a9932d311 Luis Henriques 2018-10-15  3241  
c2c6d3ce0d9a1fa Luis Henriques 2018-10-23  3242  	/* Start by sync'ing the source and destination files */
503f82a9932d311 Luis Henriques 2018-10-15  3243  	ret = file_write_and_wait_range(src_file, src_off, (src_off + len));
c2c6d3ce0d9a1fa Luis Henriques 2018-10-23  3244  	if (ret < 0) {
010045293af6194 Alex Markuze   2026-08-20  3245  		boutc(cl, "failed to write src file (%zd)\n", ret);
c2c6d3ce0d9a1fa Luis Henriques 2018-10-23  3246  		goto out;
c2c6d3ce0d9a1fa Luis Henriques 2018-10-23  3247  	}
c2c6d3ce0d9a1fa Luis Henriques 2018-10-23  3248  	ret = file_write_and_wait_range(dst_file, dst_off, (dst_off + len));
c2c6d3ce0d9a1fa Luis Henriques 2018-10-23  3249  	if (ret < 0) {
010045293af6194 Alex Markuze   2026-08-20  3250  		boutc(cl, "failed to write dst file (%zd)\n", ret);
503f82a9932d311 Luis Henriques 2018-10-15  3251  		goto out;
c2c6d3ce0d9a1fa Luis Henriques 2018-10-23  3252  	}
503f82a9932d311 Luis Henriques 2018-10-15  3253  
503f82a9932d311 Luis Henriques 2018-10-15  3254  	/*
503f82a9932d311 Luis Henriques 2018-10-15  3255  	 * We need FILE_WR caps for dst_ci and FILE_RD for src_ci as other
503f82a9932d311 Luis Henriques 2018-10-15  3256  	 * clients may have dirty data in their caches.  And OSDs know nothing
503f82a9932d311 Luis Henriques 2018-10-15  3257  	 * about caps, so they can't safely do the remote object copies.
503f82a9932d311 Luis Henriques 2018-10-15  3258  	 */
5e3ded1bb642f2d Yan, Zheng     2019-07-25  3259  	err = get_rd_wr_caps(src_file, &src_got,
5e3ded1bb642f2d Yan, Zheng     2019-07-25  3260  			     dst_file, (dst_off + len), &dst_got);
503f82a9932d311 Luis Henriques 2018-10-15  3261  	if (err < 0) {
010045293af6194 Alex Markuze   2026-08-20  3262  		boutc(cl, "get_rd_wr_caps returned %d\n", err);
503f82a9932d311 Luis Henriques 2018-10-15  3263  		ret = -EOPNOTSUPP;
503f82a9932d311 Luis Henriques 2018-10-15  3264  		goto out;
503f82a9932d311 Luis Henriques 2018-10-15  3265  	}
503f82a9932d311 Luis Henriques 2018-10-15  3266  
503f82a9932d311 Luis Henriques 2018-10-15  3267  	ret = is_file_size_ok(src_inode, dst_inode, src_off, dst_off, len);
503f82a9932d311 Luis Henriques 2018-10-15  3268  	if (ret < 0)
503f82a9932d311 Luis Henriques 2018-10-15  3269  		goto out_caps;
503f82a9932d311 Luis Henriques 2018-10-15  3270  
503f82a9932d311 Luis Henriques 2018-10-15  3271  	/* Drop dst file cached pages */
400e1286c0ec3fd Jeff Layton    2021-12-07  3272  	ceph_fscache_invalidate(dst_inode, false);
503f82a9932d311 Luis Henriques 2018-10-15  3273  	ret = invalidate_inode_pages2_range(dst_inode->i_mapping,
503f82a9932d311 Luis Henriques 2018-10-15  3274  					    dst_off >> PAGE_SHIFT,
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3275  					    (dst_off + len) >> PAGE_SHIFT);
503f82a9932d311 Luis Henriques 2018-10-15  3276  	if (ret < 0) {
010045293af6194 Alex Markuze   2026-08-20  3277  		boutc(cl, "Failed to invalidate inode pages (%zd)\n",
38d46409c4639a1 Xiubo Li       2023-06-12  3278  			    ret);
503f82a9932d311 Luis Henriques 2018-10-15  3279  		ret = 0; /* XXX */
503f82a9932d311 Luis Henriques 2018-10-15  3280  	}
503f82a9932d311 Luis Henriques 2018-10-15  3281  	ceph_calc_file_object_mapping(&src_ci->i_layout, src_off,
503f82a9932d311 Luis Henriques 2018-10-15  3282  				      src_ci->i_layout.object_size,
503f82a9932d311 Luis Henriques 2018-10-15  3283  				      &src_objnum, &src_objoff, &src_objlen);
503f82a9932d311 Luis Henriques 2018-10-15  3284  	ceph_calc_file_object_mapping(&dst_ci->i_layout, dst_off,
503f82a9932d311 Luis Henriques 2018-10-15  3285  				      dst_ci->i_layout.object_size,
503f82a9932d311 Luis Henriques 2018-10-15  3286  				      &dst_objnum, &dst_objoff, &dst_objlen);
503f82a9932d311 Luis Henriques 2018-10-15  3287  	/* object-level offsets need to the same */
503f82a9932d311 Luis Henriques 2018-10-15  3288  	if (src_objoff != dst_objoff) {
503f82a9932d311 Luis Henriques 2018-10-15  3289  		ret = -EOPNOTSUPP;
503f82a9932d311 Luis Henriques 2018-10-15  3290  		goto out_caps;
503f82a9932d311 Luis Henriques 2018-10-15  3291  	}
503f82a9932d311 Luis Henriques 2018-10-15  3292  
503f82a9932d311 Luis Henriques 2018-10-15  3293  	/*
503f82a9932d311 Luis Henriques 2018-10-15  3294  	 * Do a manual copy if the object offset isn't object aligned.
503f82a9932d311 Luis Henriques 2018-10-15  3295  	 * 'src_objlen' contains the bytes left until the end of the object,
503f82a9932d311 Luis Henriques 2018-10-15  3296  	 * starting at the src_off
503f82a9932d311 Luis Henriques 2018-10-15  3297  	 */
503f82a9932d311 Luis Henriques 2018-10-15  3298  	if (src_objoff) {
010045293af6194 Alex Markuze   2026-08-20  3299  		boutc(cl, "Initial partial copy of %u bytes\n", src_objlen);
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3300  
503f82a9932d311 Luis Henriques 2018-10-15  3301  		/*
503f82a9932d311 Luis Henriques 2018-10-15  3302  		 * we need to temporarily drop all caps as we'll be calling
503f82a9932d311 Luis Henriques 2018-10-15  3303  		 * {read,write}_iter, which will get caps again.
503f82a9932d311 Luis Henriques 2018-10-15  3304  		 */
503f82a9932d311 Luis Henriques 2018-10-15  3305  		put_rd_wr_caps(src_ci, src_got, dst_ci, dst_got);
488e8f685207e07 Amir Goldstein 2023-11-30  3306  		ret = splice_file_range(src_file, &src_off, dst_file, &dst_off,
488e8f685207e07 Amir Goldstein 2023-11-30  3307  					src_objlen);
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3308  		/* Abort on short copies or on error */
07bb00ef00ace88 Dan Carpenter  2023-10-07  3309  		if (ret < (long)src_objlen) {
010045293af6194 Alex Markuze   2026-08-20  3310  			boutc(cl, "Failed partial copy (%zd)\n", ret);
503f82a9932d311 Luis Henriques 2018-10-15  3311  			goto out;
503f82a9932d311 Luis Henriques 2018-10-15  3312  		}
503f82a9932d311 Luis Henriques 2018-10-15  3313  		len -= ret;
5e3ded1bb642f2d Yan, Zheng     2019-07-25  3314  		err = get_rd_wr_caps(src_file, &src_got,
5e3ded1bb642f2d Yan, Zheng     2019-07-25  3315  				     dst_file, (dst_off + len), &dst_got);
503f82a9932d311 Luis Henriques 2018-10-15  3316  		if (err < 0)
503f82a9932d311 Luis Henriques 2018-10-15  3317  			goto out;
503f82a9932d311 Luis Henriques 2018-10-15  3318  		err = is_file_size_ok(src_inode, dst_inode,
503f82a9932d311 Luis Henriques 2018-10-15  3319  				      src_off, dst_off, len);
503f82a9932d311 Luis Henriques 2018-10-15  3320  		if (err < 0)
503f82a9932d311 Luis Henriques 2018-10-15  3321  			goto out_caps;
503f82a9932d311 Luis Henriques 2018-10-15  3322  	}
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3323  
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3324  	size = i_size_read(dst_inode);
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3325  	bytes = ceph_do_objects_copy(src_ci, &src_off, dst_ci, &dst_off,
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3326  				     src_fsc, len, flags);
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3327  	if (bytes <= 0) {
503f82a9932d311 Luis Henriques 2018-10-15  3328  		if (!ret)
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3329  			ret = bytes;
503f82a9932d311 Luis Henriques 2018-10-15  3330  		goto out_caps;
503f82a9932d311 Luis Henriques 2018-10-15  3331  	}
010045293af6194 Alex Markuze   2026-08-20  3332  	boutc(cl, "Copied %zu bytes out of %zu\n", bytes, len);
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3333  	len -= bytes;
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3334  	ret += bytes;
503f82a9932d311 Luis Henriques 2018-10-15  3335  
503f82a9932d311 Luis Henriques 2018-10-15  3336  	file_update_time(dst_file);
5c30835690f12e1 Jeff Layton    2019-06-06  3337  	inode_inc_iversion_raw(dst_inode);
5c30835690f12e1 Jeff Layton    2019-06-06  3338  
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3339  	if (dst_off > size) {
503f82a9932d311 Luis Henriques 2018-10-15  3340  		/* Let the MDS know about dst file size change */
a0d93e327fc424b Yan, Zheng     2020-03-05  3341  		if (ceph_inode_set_size(dst_inode, dst_off) ||
a0d93e327fc424b Yan, Zheng     2020-03-05  3342  		    ceph_quota_is_max_bytes_approaching(dst_inode, dst_off))
e4b731ccb0975fd Xiubo Li       2022-10-18  3343  			ceph_check_caps(dst_ci, CHECK_CAPS_AUTHONLY | CHECK_CAPS_FLUSH);
503f82a9932d311 Luis Henriques 2018-10-15  3344  	}
503f82a9932d311 Luis Henriques 2018-10-15  3345  	/* Mark Fw dirty */
503f82a9932d311 Luis Henriques 2018-10-15  3346  	spin_lock(&dst_ci->i_ceph_lock);
503f82a9932d311 Luis Henriques 2018-10-15  3347  	dirty = __ceph_mark_dirty_caps(dst_ci, CEPH_CAP_FILE_WR, &prealloc_cf);
503f82a9932d311 Luis Henriques 2018-10-15  3348  	spin_unlock(&dst_ci->i_ceph_lock);
503f82a9932d311 Luis Henriques 2018-10-15  3349  	if (dirty)
503f82a9932d311 Luis Henriques 2018-10-15  3350  		__mark_inode_dirty(dst_inode, dirty);
503f82a9932d311 Luis Henriques 2018-10-15  3351  
503f82a9932d311 Luis Henriques 2018-10-15  3352  out_caps:
503f82a9932d311 Luis Henriques 2018-10-15  3353  	put_rd_wr_caps(src_ci, src_got, dst_ci, dst_got);
503f82a9932d311 Luis Henriques 2018-10-15  3354  
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3355  	/*
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3356  	 * Do the final manual copy if we still have some bytes left, unless
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3357  	 * there were errors in remote object copies (len >= object_size).
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3358  	 */
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3359  	if (len && (len < src_ci->i_layout.object_size)) {
010045293af6194 Alex Markuze   2026-08-20  3360  		boutc(cl, "Final partial copy of %zu bytes\n", len);
488e8f685207e07 Amir Goldstein 2023-11-30  3361  		bytes = splice_file_range(src_file, &src_off, dst_file,
488e8f685207e07 Amir Goldstein 2023-11-30  3362  					  &dst_off, len);
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3363  		if (bytes > 0)
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3364  			ret += bytes;
1b0c3b9f91f0df0 Luis Henriques 2020-02-24  3365  		else
010045293af6194 Alex Markuze   2026-08-20  3366  			boutc(cl, "Failed partial copy (%zd)\n", bytes);
503f82a9932d311 Luis Henriques 2018-10-15  3367  	}
503f82a9932d311 Luis Henriques 2018-10-15  3368  
503f82a9932d311 Luis Henriques 2018-10-15  3369  out:
503f82a9932d311 Luis Henriques 2018-10-15  3370  	ceph_free_cap_flush(prealloc_cf);
503f82a9932d311 Luis Henriques 2018-10-15  3371  
503f82a9932d311 Luis Henriques 2018-10-15  3372  	return ret;
503f82a9932d311 Luis Henriques 2018-10-15  3373  }
503f82a9932d311 Luis Henriques 2018-10-15  3374  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

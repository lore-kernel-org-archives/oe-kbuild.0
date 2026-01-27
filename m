Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A6625CC6C
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769497832; cv=none; b=XesocPjjhl8sRg9RZl0WkoEy8y9FlEfGE+x8xza89bk2JhpabmXUMhnjT9tMAxw9HlxURW4SISgT9tvjAfHwXzZt6qLbEARFZoPFwbRIQgsJ6tKERifWkNkQ2Mo5f2lYPPmxvdivQXFoyabzBEjRtIIrggRtEkvCWe+EPOU//+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769497832; c=relaxed/simple;
	bh=OYLvW8KsTqTl3fls7Tgg/x2HVBeby8p7bTPTQI/YPEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+9eU9+bIsGANVpkYZby6fzI+d48W7vjInZVeZ3Uqkr5m7kQ/Tv3WB9BQ2G19DrY1imWNyOdlf2Pk1KrT6bFEx9lFDz3GE2AB9BlY2KVMrC68bLZy+S6jPCocb5xMXxL7KBoyXR71sZ+wgj6xzRUC1tC9qgfsrJUxDj1Q/fR/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mczlAvsE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mczlAvsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769497832; x=1801033832;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OYLvW8KsTqTl3fls7Tgg/x2HVBeby8p7bTPTQI/YPEo=;
  b=mczlAvsET1AuXbFxQ5ej+lVCnfSLTjPfO8rl7opZu7JvmhMpQ1BUF/lB
   ++6lP1Z5kiMcn2V/Q/3cy951JPEnn6A3DRj1oasP6yS+6FDOXXkeYa+YY
   BQDzV+QC1DMiw951JH51qvgeTju5pSSd1TZNnI3glZvmlf9YcjJb3i5Ia
   9n5z4TSZ+cLxjL9+okeMCF6OdvIIu3+K4o1KNKjpGx37ZOThrh/K4Jn7G
   G+FbxeuHMRnRPl5V2lgHDCI+/3feD3TwpcBeiOD4j6kLPKckO9mWbwbeD
   lpS3GtouW8+79wHatlN7+WoMkjqUSlo25mmqCi87A//b4Q8ytV33i6Mds
   g==;
X-CSE-ConnectionGUID: 5kPZ1IAxTmCsIx7w+KeEFw==
X-CSE-MsgGUID: GgxVoEd4Qr2WYyzM3e4pkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="58259674"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="58259674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 23:10:31 -0800
X-CSE-ConnectionGUID: 85+1tGJ5QmqBiKGEMikt7A==
X-CSE-MsgGUID: xOmiTB5FRaqQOPQmQ2pFdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212363950"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2026 23:10:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkdDY-000000001jl-0R3n;
	Tue, 27 Jan 2026 07:10:28 +0000
Date: Tue, 27 Jan 2026 08:09:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net v2 2/4] selftests/net: add no ARP b/mcast,null poison
 test
Message-ID: <202601270826.cDxyK4zG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <713d6f1ca57b402be420ade1331acee4898675c4.1769464405.git.marcdevel@gmail.com>
References: <713d6f1ca57b402be420ade1331acee4898675c4.1769464405.git.marcdevel@gmail.com>
TO: "Marc Suñé" <marcdevel@gmail.com>
TO: kuba@kernel.org
TO: willemdebruijn.kernel@gmail.com
TO: pabeni@redhat.com
CC: netdev@vger.kernel.org
CC: dborkman@kernel.org
CC: vadim.fedorenko@linux.dev
CC: "Marc Suñé" <marcdevel@gmail.com>

Hi Marc,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Su/arp-discard-invalid-sha-addr-b-mcast-ARP-poison/20260127-075649
base:   net/main
patch link:    https://lore.kernel.org/r/713d6f1ca57b402be420ade1331acee4898675c4.1769464405.git.marcdevel%40gmail.com
patch subject: [PATCH net v2 2/4] selftests/net: add no ARP b/mcast,null poison test
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260127/202601270826.cDxyK4zG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270826.cDxyK4zG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601270826.cDxyK4zG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arp_send.c:4:10: fatal error: stdio.h: No such file or directory
       4 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

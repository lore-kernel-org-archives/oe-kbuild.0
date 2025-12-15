Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714483321C5
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788598; cv=none; b=QvLthl2XpOA89bntpoM5ckWJr+8/Hj6uN54IRH0LDwQqZqDyRg3Ii0pQ6SE0bvWDnxIAZE03AfpMID6XAXL5alQlTsZyG4MGHzziQudftc8nNSrc0XpFHC0OH9a3wnSDbkQGTYAQ69OYXSmP5RcNw2DvFgi+E3HvhoUAHu2n3Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788598; c=relaxed/simple;
	bh=vPWoClbU7hk5UfyZLrCkVpQpCegop44ju2EkUmcJeqM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMF5elpkv5A+QTiw47vRc5NcmDebsqFEuT12F9M/GM/U53t9Zvt/rsm0D0JvlRDWXfJ5oRyoQV2ZArJekgmmaIQ9ITF2ZI7TKYkw9l9PBHIfNR8euWwR0tc/M/yWoaXiIrG2lN2iad6Cle+HMsbZ2XhQYyFByUz/JXkviJQYxRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzgZ/b4/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzgZ/b4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765788597; x=1797324597;
  h=date:from:to:subject:message-id:mime-version;
  bh=vPWoClbU7hk5UfyZLrCkVpQpCegop44ju2EkUmcJeqM=;
  b=RzgZ/b4/gByc8F1Gva4/gfehBmgn8TcTZacJaeNyveh8xTdUgbjJrsUz
   AVp1gGvueW7/yC1InBvlRI2teLGFFd8qmd8ZKsy01cqWUxdFKlsgsxSe6
   BE4en/wo2G4tQmf+BQH2YTql1StbtkkcCN7zVRD4GO6rUeuAS0pTAlknl
   5L+OcnUcHqg/pxcOwmpDzbKg8pnvoh3eP9N2xRi9k2DmICU5CEPdejdWc
   u2dR6JRFrRSNwjEXrQ2JVYae8RWjVnIjyL3iRpYReulCpwCshwGDEifWx
   OAy9YVwlxYmLmS7HxDBUNsV/9f9WwCBjx7kS5TAr1ca7fpoZYKX2PZt2r
   A==;
X-CSE-ConnectionGUID: sY9dwyazSo2H8ixEdcBz1A==
X-CSE-MsgGUID: RTrT7IHlS8OEkUlTbptL/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67561950"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67561950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 00:49:56 -0800
X-CSE-ConnectionGUID: 1b8QtQ7OTo+SKYPEE7+m5w==
X-CSE-MsgGUID: ckbswgDFS/mkZvpDu9grWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197563093"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 00:49:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV4HB-000000002by-1H5C
	for oe-kbuild@lists.linux.dev;
	Mon, 15 Dec 2025 08:49:53 +0000
Date: Mon, 15 Dec 2025 09:49:00 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [xinli-intel-fred-public:fred-kvm-v10 4/22] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202512150934.duXchW9Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/xinli-intel/linux-fred-public.git fred-kvm-v10
head:   b3461667abc83db70fb32a34e66aa61060198665
commit: 77adc0d44a439b713588e471aa19eb4ce1306901 [4/22] x86/cea: Prefix event stack names with ESTACK_
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512150934.duXchW9Q-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#222: FILE: arch/x86/mm/fault.c:674:
+		call_on_stack(__this_cpu_ist_top_va(ESTACK_DF) - sizeof(void*),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

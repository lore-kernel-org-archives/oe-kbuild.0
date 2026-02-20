Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F32C21F4
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 02:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771556160; cv=none; b=THgY2GB0c1VpgzgTwuu8x+hz3QxrAHW2J5c9Z0tAEtT5ifvzQT4fPAKaEKHSVKpjOKcl12WUXbXpTCV8nCtpQq8hC+gets2Aaal4yTj6kmGglUfBCOGl1ekvfycaNjUWvVIQcanLrfi96cjoEzMWD8c/AabSmxS2rH7DICgER40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771556160; c=relaxed/simple;
	bh=cZuMN9sPRfbP6XRdvLtblxKQlkY3eKqqnNQgrLodngc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cKTq31srsILB8Kbsu7UmyYypAA7m/ltOeQvNn8ftwaTy1+aBFT4B8cS43NNS+4h4PGPG1/EVEeyZ6Ut3Y+aBJWa6hcJA4GMkyY/NXy+yCFPS5Z9KH/NYbiDNYIPgHbQqc7dc1lHkJRYed/yxeTW/d63Bh5nzj1IbozKNxEzX5nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TftxRokU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TftxRokU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771556159; x=1803092159;
  h=date:from:to:subject:message-id:mime-version;
  bh=cZuMN9sPRfbP6XRdvLtblxKQlkY3eKqqnNQgrLodngc=;
  b=TftxRokUi9gmKYeOyUSV1X6dihTjUi03cJmpOmUJb8zYNTz7IUiwPl4A
   t1UhSTIPi2RXQUXDrIBeL0egQQsbRUcjv4jPUiFsPZ1JNGMVZmYg3h5ZZ
   e1oHrmAdImylV4rWY9bCy3XEl4eiYD9yIvFvfqvYcnG/qsVmpLGrvsKVF
   fM19Uj6+T64wO+AVNT+AFGSzB1IJKw0JXLdet+c/lX2W/WBEvOvR63k22
   tFgXe3Q9BMxGfk4dKwCIS0+8+Kda+InPTlGpjt/MPdjb3lxyTbEBpyBdp
   VPHmQaAHiRSc2MEhDub2aKjI5dPbKM0r0DSxu7JcWn49aNhoJeUq4vG2I
   g==;
X-CSE-ConnectionGUID: GafyKn7CTGOqfGXgklt2iA==
X-CSE-MsgGUID: PiID1ScXT4eGC9zalXng9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72714138"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72714138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 18:55:57 -0800
X-CSE-ConnectionGUID: 2W8Dql3YRrS4k2csfz6f3g==
X-CSE-MsgGUID: bn7mD/bKQX+5QTAyiRCEUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="212895182"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2026 18:55:46 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtGgC-0000000047p-1mWA
	for oe-kbuild@lists.linux.dev;
	Fri, 20 Feb 2026 02:55:44 +0000
Date: Fri, 20 Feb 2026 03:55:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH mptcp-net 1/2] mptcp: pm: avoid sending RM_ADDR over same
 subflow
Message-ID: <202602200336.7pvCQUOH-lkp@intel.com>
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
In-Reply-To: <20260219-mptcp-issue-612-v1-1-839e20d96fe7@kernel.org>
References: <20260219-mptcp-issue-612-v1-1-839e20d96fe7@kernel.org>
TO: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
TO: MPTCP Upstream <mptcp@lists.linux.dev>

Hi Matthieu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9bf535999bf8e23b5f38fffb1a7ae7ee73115e98]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthieu-Baerts-NGI0/mptcp-pm-avoid-sending-RM_ADDR-over-same-subflow/20260220-030340
base:   9bf535999bf8e23b5f38fffb1a7ae7ee73115e98
patch link:    https://lore.kernel.org/r/20260219-mptcp-issue-612-v1-1-839e20d96fe7%40kernel.org
patch subject: [PATCH mptcp-net 1/2] mptcp: pm: avoid sending RM_ADDR over same subflow
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260220/202602200336.7pvCQUOH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Frank Lorenz'
#22: 
Reported-by: Frank Lorenz

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

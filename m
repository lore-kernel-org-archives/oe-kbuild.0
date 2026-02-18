Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB47730CDA4
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771414765; cv=none; b=J61biWeDB9KMS9pXCKUPhCQXZqbLYXrU/awkbrIQK1zrlMTZvRzwDaHjimqjyZXssdTNlQnu+eNtFWE6cGMmX5GNU73pSAf609auHXEO8N2O3EW+XZXRdmWfykMhQ2P73Atsi5+aVFW5JUty82L05eOdnbLpUHRI8k4wejujF74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771414765; c=relaxed/simple;
	bh=hMOn/2d3k6PXjJUTlel1BZCbPWntpBuRyPNENO6CsTg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fMqauxpPf0Vta44YuIbTMnMF0JrFYSJPeSubT5ryQ5lg7L0pu0N6/xN/2xWIIlDo7JYoog10tkgtx2MDntj+aBOqszL/tT0nQJ+9ne8IgN7leLyRUgDWSwT/TDCbNQIcoc2CaV4hTmCxfeMKlwyvOFPLU4eqSmQN3ePq6qk6ens=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vme5HWwy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vme5HWwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771414763; x=1802950763;
  h=date:from:to:subject:message-id:mime-version;
  bh=hMOn/2d3k6PXjJUTlel1BZCbPWntpBuRyPNENO6CsTg=;
  b=Vme5HWwyL1PJc+04TkUsycqne9FCNsHEwEyXCbvhnTxSvlcTGHnCd8D2
   Svpc+bM68PEqS81kj6UFOOrW29Why3a91pNySkLG1b/OOg0ZGKTaSPPX0
   WEW/rYKZokNZLoU4zZ0Mi9TQtqt8dY4/QiXxw94/i0mCBzftpgTY/2wG1
   H8bA+JJebU72l1Bp306yx0HAfyhrH9a9curd/1H8CKvz1AQPmqC1OylxU
   qGBpS54tsWb9N15qRMWCNjveDXivpK2/vOdZSdrcUhRwtYyPuYKrVIU7m
   hOMHEcm250ZlnRx8B5KbYn2uGbQnBWZ6M8U7uhkf39RUZTTLpSP+O+FSB
   A==;
X-CSE-ConnectionGUID: UH1Y40PlTw+vbI/TrbADRw==
X-CSE-MsgGUID: l4ICNc8nQ5K5XGxI3dZ9hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72200200"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72200200"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 03:39:22 -0800
X-CSE-ConnectionGUID: TeZQwNLWSaiB6Ynw0wwk7g==
X-CSE-MsgGUID: HUW4uNsxSLihAqNqbQx+Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218704644"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2026 03:39:21 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsftn-000000003cj-1L2I
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 11:39:19 +0000
Date: Wed, 18 Feb 2026 12:38:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] mshv: Use try_cmpxchg() instead of cmpxchg()
Message-ID: <202602181254.ktX2zxK2-lkp@intel.com>
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
In-Reply-To: <20260218102604.178561-1-ubizjak@gmail.com>
References: <20260218102604.178561-1-ubizjak@gmail.com>
TO: Uros Bizjak <ubizjak@gmail.com>
TO: linux-hyperv@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Uros,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/mshv-Use-try_cmpxchg-instead-of-cmpxchg/20260218-183016
base:   linus/master
patch link:    https://lore.kernel.org/r/20260218102604.178561-1-ubizjak%40gmail.com
patch subject: [PATCH] mshv: Use try_cmpxchg() instead of cmpxchg()
:::::: branch date: 67 minutes ago
:::::: commit date: 67 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602181254.ktX2zxK2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#19: 
to:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

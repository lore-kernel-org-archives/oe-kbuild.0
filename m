Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A3231AF07
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771589813; cv=none; b=qUDGEPd2R6rl15tNtD82f0SCDMFAlN+UnM3LaXtZrHetFbvO9y9RJo2X/NKIzG2UD+F92kOXlgy7fMljC3s4CiEarWgNJhyPW3MV3/gq5a8Vb0a7AlrICVyO46nnzDieQYaK0bXHO9R1l11+YjgkkqeiM7LCYYZbgctc9OEQyFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771589813; c=relaxed/simple;
	bh=UNgX0tdWa2aLGeyOW0xfv1WjqqcJM/eRKr54mi+5f+I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pf7+Qg4PIUBLXMnn2nE/IZd9PgO7AZkBM3jrdiJgPTwAP3i85aOtvYSdOjDBP3Vab1ITNWeKBU322wqvy1cG3zE/eM6JpXwfCyYGovam9aTyGylElp/UHwzvyHo/vJoZWxxd8GaWAi4hh8m+cQzPo8zMnO3tQ7QkFvGrN7YDWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPXDKf4+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPXDKf4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771589811; x=1803125811;
  h=date:from:to:subject:message-id:mime-version;
  bh=UNgX0tdWa2aLGeyOW0xfv1WjqqcJM/eRKr54mi+5f+I=;
  b=EPXDKf4+AnvUbrBnpq7kv9RhCqfo6jHfjUjkbdqjE8jtb+MFWbqVsM1q
   FjltBy3MfJJ8Pl5kDkHDB3vLOZI7+I9eppgPpJdhU1XnB1qhsvg4EKWvO
   /lLR0wA0pQHj/BbhBS7lMDlCBuXZQ9K/gp74vjry0F9ERDQX8AIp0JWr9
   apTV7SzOudix8PuNA6kWNKc4GX0fnISdCreiF40Oxfk10ApaMpsGWfSZZ
   sCWjKzRGeyOFV+/3z0segdBDOddtGCu4q4Q6xlDrxgKzQfFVSx+/sM7ZY
   lABkBZzGao2ozEQkR4eczbOLy43I3JHMKIeHA7weN6Ln6nj0FBBATS9Dz
   g==;
X-CSE-ConnectionGUID: l6TlRj0GTpK3vIv5dyqZjw==
X-CSE-MsgGUID: ucATC8h4QqeTm/iGbpR9/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90092506"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="90092506"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 04:16:50 -0800
X-CSE-ConnectionGUID: SyhEDW9ITxKlDF+1ThEKNA==
X-CSE-MsgGUID: dp0hiXplTRG/kjqtz5MD7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="213940926"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Feb 2026 04:16:50 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtPR9-000000004Bt-2xXc
	for oe-kbuild@lists.linux.dev;
	Fri, 20 Feb 2026 12:16:47 +0000
Date: Fri, 20 Feb 2026 13:15:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH mptcp-net v2 1/2] mptcp: pm: avoid sending RM_ADDR over
 same subflow
Message-ID: <202602201326.iQ069tJB-lkp@intel.com>
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
In-Reply-To: <20260220-mptcp-issue-612-v2-1-089684a6edcb@kernel.org>
References: <20260220-mptcp-issue-612-v2-1-089684a6edcb@kernel.org>
TO: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
TO: MPTCP Upstream <mptcp@lists.linux.dev>

Hi Matthieu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d81a02a671623999f5ec963b73181d845c665747]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthieu-Baerts-NGI0/mptcp-pm-avoid-sending-RM_ADDR-over-same-subflow/20260220-192900
base:   d81a02a671623999f5ec963b73181d845c665747
patch link:    https://lore.kernel.org/r/20260220-mptcp-issue-612-v2-1-089684a6edcb%40kernel.org
patch subject: [PATCH mptcp-net v2 1/2] mptcp: pm: avoid sending RM_ADDR over same subflow
:::::: branch date: 47 minutes ago
:::::: commit date: 47 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260220/202602201326.iQ069tJB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Frank Lorenz'
#22: 
Reported-by: Frank Lorenz

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

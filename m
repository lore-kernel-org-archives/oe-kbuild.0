Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE31F5435
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754730027; cv=none; b=d3BrFhJtzmC9RPSWPJVy8TAt6zQuS09LkVSol8E8H0dB/8IGPnC3mBFBx4Z8GU7/sCFZ39zX9ehcsXz9MVhFFIS9j5bnl3KCZx77sVrIta6pruP8wZafMiHKyubcjkFvk+Ht4o0A06mr4jpIPqdJs4dWTH+2mICtG3FvdCKzx7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754730027; c=relaxed/simple;
	bh=Q7Korg3jtQfF2yTOKrm7spkAM4Tka0WhYzfSjRRCLNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bNWo70QzS9tASnzBvsH6iCEQkj5h8jhmKP9NRvJxmyC9v4sFGYr99MEJ80H1OacTlXiefS0rfIW3c8gZBMK1J6NmfltNe7p5oi1u73aRNrbMDQPfPdlahNkesOvj2SErokqBWKg4rPfcG2iK0t4iIuC7MJCTkvQkLacyhlv8iww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=getH/WGw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="getH/WGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754730026; x=1786266026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7Korg3jtQfF2yTOKrm7spkAM4Tka0WhYzfSjRRCLNY=;
  b=getH/WGwLPKMawTPQF5HPT1X2jjqZirVE4cYde8mTXbIZJZtvPwcFUgV
   BZ+V955xeU9S48bxQeToy/CAMTv8bpT4aXsE+JrG7LB8M2XZLJ4qGA4F1
   pBvwQ74qK2fDlzbeYpTnq6vFOZCQR364tyuOjiJ9rDZ1F6a7ipHIWXxZE
   xP8Bi8+WYq+kV8QzE5CdrZkQifyC2n/oIEa7Wn548AiaMEbGyvYcc40rh
   NVin6NHZS/o28evT7FrxWrnQRB7iT/dQluRrt0Kb7KyEr8LZvJAQrfbls
   gI1cpVD3tCx2GXFzE2As+utvEWP3qUxk5ynP6IyQWZeNNFstuzpyDvlXI
   Q==;
X-CSE-ConnectionGUID: y7kCqNNsSzSMfJymSieDvg==
X-CSE-MsgGUID: dXQgLxBER8aaQaIFWtvlsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57210163"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57210163"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 02:00:26 -0700
X-CSE-ConnectionGUID: aYR+wTK9T0q9WfKn7RDPIg==
X-CSE-MsgGUID: 2HbDa09ATbmsEm0Srjj7rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169621500"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 09 Aug 2025 02:00:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukfQe-0004iC-1D;
	Sat, 09 Aug 2025 09:00:01 +0000
Date: Sat, 9 Aug 2025 16:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] rtc: pcf85363: add support for timestamp and watchdog
Message-ID: <202508091608.EsTWdAA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250808112246.4169280-1-lakshay.piplani@nxp.com>
References: <20250808112246.4169280-1-lakshay.piplani@nxp.com>
TO: Lakshay Piplani <lakshay.piplani@nxp.com>
TO: alexandre.belloni@bootlin.com
TO: linux-rtc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: devicetree@vger.kernel.org
CC: vikash.bansal@nxp.com
CC: priyanka.jain@nxp.com
CC: shashank.rebbapragada@nxp.com
CC: Lakshay Piplani <lakshay.piplani@nxp.com>

Hi Lakshay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/rtc-pcf85363-add-support-for-additional-features/20250808-192449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20250808112246.4169280-1-lakshay.piplani%40nxp.com
patch subject: [PATCH 1/2] rtc: pcf85363: add support for timestamp and watchdog
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: csky-randconfig-052-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091608.EsTWdAA7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091608.EsTWdAA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508091608.EsTWdAA7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/rtc/nxp,pcf85363.yaml: nxp,timestamp-mode: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

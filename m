Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F013211A
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Aug 2024 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724085690; cv=none; b=exfaMdKeN/JCaLsZIUMPu6cH9LB+A/NrpE5JkqP1NcjlpgMvFAOacf3joO2tUpExaRN4f6oYbj/PHKZNve0fNgw8i2Vy/7zFVBgqRSfZRrucOdCQyB1EAnlEe6OG868EUy0swZfGUzAvCsh3Zw6Mi3ea+491JwTyrdgpn8DXYNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724085690; c=relaxed/simple;
	bh=f2ayvwqfql1gEuJGRrdMdSVFv9QZE6imc+Y4HH+dGDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLYc/B1szWoHv5kaCPcnKOALupOFC20B3UHnsKvbJsXqAGD2ceT6P1qN8jxpJDpw2Yhxvnat/LhRCV46+uePXaiROJ+n83jevc781LB/9gvQQlP9N+820XRYFQnoQiPYsZognfgoZ9qTz3A0a2N1mzX1hjPit71nJ4RO8nrBaLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GS/xfAaA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GS/xfAaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724085686; x=1755621686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f2ayvwqfql1gEuJGRrdMdSVFv9QZE6imc+Y4HH+dGDY=;
  b=GS/xfAaAsxXAkzNl8T5arVTxipyiFzBk9TZbEIQ6oVoPPiQbnXO1mZ2u
   C40909yOAvdWqnkhMUO2z+SyXPyhaG9HJV5bwWQ8JSPMTFgoJgtaSzc3H
   gdXRC5igpBkP6BIGVpQ5pH/xzRHSqIcS3LPqdY5ou4yedFVyVnTwPM02h
   5jHEuDa8xS6IMqkJud2Lf79epEJY9srGjL8FBiblttdUAsdEXqGfdQKto
   4z/ZSEwZdVOiJEWWrCaLAVzXqH1O64rIyA7q+km/oTB8zMgEmf2AqIh3V
   hmGB4hp7e6BwXGgqee3WoxjjIsPZq2g9CUj/oKUC6joFgWN79py9tAWXl
   Q==;
X-CSE-ConnectionGUID: r5wSMbOVTs2BmzSpifGm+w==
X-CSE-MsgGUID: Do+oWjJeSzKBDEUZJftEPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="39805620"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="39805620"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 09:40:52 -0700
X-CSE-ConnectionGUID: VZ5pXf27QAOhSHXetEoudQ==
X-CSE-MsgGUID: 68RvTwuGRHGfJ7d64NEtVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="61002041"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Aug 2024 09:40:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg5R4-0009CW-12;
	Mon, 19 Aug 2024 16:40:50 +0000
Date: Tue, 20 Aug 2024 00:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] wifi: cfg80211: check radio iface combination for
 multi radio per wiphy
Message-ID: <202408200004.5sqDWe4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240813055917.2320582-1-quic_periyasa@quicinc.com>
References: <20240813055917.2320582-1-quic_periyasa@quicinc.com>
TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
TO: johannes@sipsolutions.net
CC: linux-wireless@vger.kernel.org
CC: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Hi Karthikeyan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cc32e9fb380d8afdbf3486d7063d5520bfb0f071]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikeyan-Periyasamy/wifi-cfg80211-check-radio-iface-combination-for-multi-radio-per-wiphy/20240815-005751
base:   cc32e9fb380d8afdbf3486d7063d5520bfb0f071
patch link:    https://lore.kernel.org/r/20240813055917.2320582-1-quic_periyasa%40quicinc.com
patch subject: [PATCH v2] wifi: cfg80211: check radio iface combination for multi radio per wiphy
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: csky-randconfig-r072-20240819 (https://download.01.org/0day-ci/archive/20240820/202408200004.5sqDWe4e-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408200004.5sqDWe4e-lkp@intel.com/

smatch warnings:
net/wireless/core.c:719 wiphy_verify_combinations() error: uninitialized symbol 'ret'.

vim +/ret +719 net/wireless/core.c

7527a782e187d1 Johannes Berg          2011-05-13  698  
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  699  static int wiphy_verify_combinations(struct wiphy *wiphy)
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  700  {
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  701  	int i, ret;
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  702  
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  703  	if (wiphy->n_radio) {
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  704  		for (i = 0; i < wiphy->n_radio; i++) {
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  705  			const struct wiphy_radio *radio = &wiphy->radio[i];
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  706  
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  707  			ret = wiphy_verify_iface_combinations(wiphy,
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  708  							      radio->iface_combinations,
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  709  							      radio->n_iface_combinations);
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  710  			if (ret)
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  711  				return ret;
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  712  		}
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  713  	} else {
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  714  		ret = wiphy_verify_iface_combinations(wiphy,
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  715  						      wiphy->iface_combinations,
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  716  						      wiphy->n_iface_combinations);
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  717  	}
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  718  
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13 @719  	return ret;
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  720  }
acac11b3dc4e4f Karthikeyan Periyasamy 2024-08-13  721  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D2045037
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Apr 2024 22:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712443675; cv=none; b=Nc3S1FttVEneUNPCdJ5y16FSVXI7FLeihuxmN6m8p4qQ1MPT+4DdpqdfJoS27LajxHMaYdd+4hRAUH9LypuYlOY6yOvmx+wRbmY+zwO3Be74Hn38NNkofZd6XU3vc9gWRmHeIpFhHn3wrajZxcW5DBmwCjtQF/pTY6rA4cPnAUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712443675; c=relaxed/simple;
	bh=OazOD2CZrWjvKnr4cOhsC/ouKMs4W/reXf+unJNsvt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+EOJ2/wKHlCnr1DiQI4rvMaOgiGjy+1frC1uGm4mw3+ggAF0bpWSkDm+QX6WUJsuD53qJttxtthH/L4BzbFuZjxzQc8vhwe+3TIh7VZaR2ASiBxYqpUn0KXKteSGmCN5qtM/hMWJWhDVMxT58N4j1DkoDVDMETTOkHGZtfviVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJXJmkHx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJXJmkHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712443673; x=1743979673;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OazOD2CZrWjvKnr4cOhsC/ouKMs4W/reXf+unJNsvt0=;
  b=ZJXJmkHxZfj0512EhkBfd8sHMYsnmrkHxlVZ3SfWXcZ8cOEur9NoiS3Z
   f4mN5noKYyy91MSyzQXW6pJG1a3GcA9AUTZlD8wvi9S4vf2SJbRyXP2yh
   4Fp13VoBhgPnJkSCEkIevludanKf2jDYy3VTaaa4wPXj7tlsd58f8Eguo
   vfvmn264iwNrA5Inz+xd12/FFyzJpq7KQvUqDS8zt82FSVWRDtnvID2XX
   SEPoXlpjGMpgKG7lGKFVMTln5pgKvIJWZAxvoCnfMpjW9niZFUFJCVQnA
   3P6niQc+otlDA0rfI4G/d9sX9EJ+aQ4Q9cg/mMuQZzOVgkJcQya/rzATe
   Q==;
X-CSE-ConnectionGUID: BpXBaT1hQLKiup9xMix0kg==
X-CSE-MsgGUID: cRAKQgIhQeijrN+XfQmkjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="19182721"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="19182721"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:47:53 -0700
X-CSE-ConnectionGUID: 4i5G5Qa+R0aGymvVfsMiTA==
X-CSE-MsgGUID: pcE1NMJiSdO1BL14+M9bUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="24175514"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Apr 2024 15:47:51 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEpB-0003vK-1W;
	Sat, 06 Apr 2024 22:47:49 +0000
Date: Sun, 7 Apr 2024 06:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next v3 6/9] net: dsa: microchip: dcb: add special
 handling for KSZ88X3 family
Message-ID: <202404070608.U0LIXb0K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240405095216.353829-7-o.rempel@pengutronix.de>
References: <20240405095216.353829-7-o.rempel@pengutronix.de>
TO: Oleksij Rempel <o.rempel@pengutronix.de>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Andrew Lunn <andrew@lunn.ch>
TO: Eric Dumazet <edumazet@google.com>
TO: Florian Fainelli <f.fainelli@gmail.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: Woojung Huh <woojung.huh@microchip.com>
TO: Arun Ramadoss <arun.ramadoss@microchip.com>
CC: Oleksij Rempel <o.rempel@pengutronix.de>
CC: kernel@pengutronix.de
CC: linux-kernel@vger.kernel.org
CC: UNGLinuxDriver@microchip.com
CC: David Ahern <dsahern@kernel.org>
CC: Simon Horman <horms@kernel.org>
CC: Willem de Bruijn <willemb@google.com>
CC: "Søren Andersen" <san@skov.dk>

Hi Oleksij,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-dsa-add-support-for-DCB-get-set-apptrust-configuration/20240405-175505
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240405095216.353829-7-o.rempel%40pengutronix.de
patch subject: [PATCH net-next v3 6/9] net: dsa: microchip: dcb: add special handling for KSZ88X3 family
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-randconfig-r081-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070608.U0LIXb0K-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404070608.U0LIXb0K-lkp@intel.com/

smatch warnings:
drivers/net/dsa/microchip/ksz8795.c:194 ksz8_all_queues_split() error: uninitialized symbol 'ret'.

vim +/ret +194 drivers/net/dsa/microchip/ksz8795.c

e66f840c08a237 Tristram Ha    2019-07-29  181  
d9c072a3456921 Oleksij Rempel 2024-04-05  182  int ksz8_all_queues_split(struct ksz_device *dev, int queues)
d9c072a3456921 Oleksij Rempel 2024-04-05  183  {
d9c072a3456921 Oleksij Rempel 2024-04-05  184  	struct dsa_switch *ds = dev->ds;
d9c072a3456921 Oleksij Rempel 2024-04-05  185  	const struct dsa_port *dp;
d9c072a3456921 Oleksij Rempel 2024-04-05  186  	int ret;
d9c072a3456921 Oleksij Rempel 2024-04-05  187  
d9c072a3456921 Oleksij Rempel 2024-04-05  188  	dsa_switch_for_each_port(dp, ds) {
d9c072a3456921 Oleksij Rempel 2024-04-05  189  		ret = ksz8_port_queue_split(dev, dp->index, queues);
d9c072a3456921 Oleksij Rempel 2024-04-05  190  		if (ret)
d9c072a3456921 Oleksij Rempel 2024-04-05  191  			return ret;
d9c072a3456921 Oleksij Rempel 2024-04-05  192  	}
d9c072a3456921 Oleksij Rempel 2024-04-05  193  
d9c072a3456921 Oleksij Rempel 2024-04-05 @194  	return ret;
d9c072a3456921 Oleksij Rempel 2024-04-05  195  }
d9c072a3456921 Oleksij Rempel 2024-04-05  196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

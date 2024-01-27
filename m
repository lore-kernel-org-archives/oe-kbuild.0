Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BABF23754
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Jan 2024 23:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706398330; cv=none; b=MIQELxYFMLG+0o5567aanaRZKEsXIr8nvznEGgtpiegGU5bDqPTX1+ScUt3q66OzFO4l471lA1qWRO4tRS9ztPsbXtGBHteWoXZy3bskA/KOs6nLEgKklSM2REhWIuQwzTIBjjFYTJySDiQVrO7FuhZfEVlR0KuMcXyjKsVbmMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706398330; c=relaxed/simple;
	bh=tW87A7LmiSDY9/t7fEqLH5LvbyXTo+dB4AHeHVp8Awo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j/xjHU5CUOEixUUWE+/3xIaFChQyQcUstVTXhgVn8URGyB+gOIfDXsL3j018g5zL6ykcFP+m3/7uMguC4PxE523a3i5RaVKegRgGYJp2kZmhPy7gGKUYGYDTxPEOzBzUs1772BAlVZNwOKdr71g96Cl+8iWmIZF/7EssvCdXEU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m761EWlJ; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m761EWlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706398328; x=1737934328;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tW87A7LmiSDY9/t7fEqLH5LvbyXTo+dB4AHeHVp8Awo=;
  b=m761EWlJNc9kKJrCzsAPN0iv6fmjK6dBT66ICcBhlsHjD7wX5jnpZWkc
   mjmF7lFUUO6CdNtwXpcx24jMY9qgC7mhNPD2Wmf1LKzqo8bLU1+fwRQ6Q
   UNKJH8w3EWJpsAlNpECRm0kryRJ+ULnhVvetjG4DkBVStpK1UPcuxCUv0
   Kd6rdCpDfIdS8DQ23dGEO/KP4mrjJ9K7vGnZynVtwDnriH48Vc3K+QE/D
   4vNnhG+m+ImOJRpTFUnJyFbOdhfWgIKp1zmdGseO6aeuHYsW/AuPeEw+B
   kPtixnu915X6dP7+A3WwI1Z+xwQ9tVvkun8/WfH1/mp1MQiRL3kFtsoi9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="433880469"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="433880469"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 15:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="910680858"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="910680858"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jan 2024 15:32:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTs9b-0002rS-0Q;
	Sat, 27 Jan 2024 23:32:03 +0000
Date: Sun, 28 Jan 2024 07:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/8] power: reset: Introduce PSCR Recording Framework
 for Non-Volatile Storage
Message-ID: <202401280712.O6FEvsAC-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/power/reset/pscrr.c:132:9: sparse: sparse: statement expected after case label"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240124122204.730370-4-o.rempel@pengutronix.de>
References: <20240124122204.730370-4-o.rempel@pengutronix.de>
TO: Oleksij Rempel <o.rempel@pengutronix.de>
TO: Sebastian Reichel <sre@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Oleksij Rempel <o.rempel@pengutronix.de>
CC: kernel@pengutronix.de
CC: linux-kernel@vger.kernel.org
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Zhang Rui <rui.zhang@intel.com>
CC: Lukasz Luba <lukasz.luba@arm.com>
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: "Søren Andersen" <san@skov.dk>

Hi Oleksij,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on broonie-regulator/for-next rafael-pm/thermal linus/master v6.8-rc1 next-20240125]
[cannot apply to sre-power-supply/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/power-Extend-power_on_reason-h-for-upcoming-PSCRR-framework/20240124-202833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240124122204.730370-4-o.rempel%40pengutronix.de
patch subject: [PATCH v2 3/8] power: reset: Introduce PSCR Recording Framework for Non-Volatile Storage
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-062-20240128 (https://download.01.org/0day-ci/archive/20240128/202401280712.O6FEvsAC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280712.O6FEvsAC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401280712.O6FEvsAC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/power/reset/pscrr.c:132:9: sparse: sparse: statement expected after case label
>> drivers/power/reset/pscrr.c:20:11: sparse: sparse: symbol 'system_pscr' was not declared. Should it be static?
>> drivers/power/reset/pscrr.c:57:17: sparse: sparse: symbol 'pscr_map_table' was not declared. Should it be static?
   drivers/power/reset/pscrr.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +132 drivers/power/reset/pscrr.c

3f484eec6730bd Oleksij Rempel 2024-01-24   19  
3f484eec6730bd Oleksij Rempel 2024-01-24  @20  enum pscr system_pscr;
3f484eec6730bd Oleksij Rempel 2024-01-24   21  
3f484eec6730bd Oleksij Rempel 2024-01-24   22  /*
3f484eec6730bd Oleksij Rempel 2024-01-24   23   * struct pscr_to_magic_entry - Entry for mapping PSCR to magic values.
3f484eec6730bd Oleksij Rempel 2024-01-24   24   *
3f484eec6730bd Oleksij Rempel 2024-01-24   25   * This structure represents a single entry in a list that maps Power State
3f484eec6730bd Oleksij Rempel 2024-01-24   26   * Change Reason (PSCR) values to corresponding magic values. Each entry
3f484eec6730bd Oleksij Rempel 2024-01-24   27   * associates a specific PSCR with a unique magic value, facilitating easy
3f484eec6730bd Oleksij Rempel 2024-01-24   28   * translation between the two.
3f484eec6730bd Oleksij Rempel 2024-01-24   29   *
3f484eec6730bd Oleksij Rempel 2024-01-24   30   * @pscr: The PSCR value.
3f484eec6730bd Oleksij Rempel 2024-01-24   31   * @magic: The corresponding magic value.
3f484eec6730bd Oleksij Rempel 2024-01-24   32   * @list: List head for chaining multiple such entries.
3f484eec6730bd Oleksij Rempel 2024-01-24   33   */
3f484eec6730bd Oleksij Rempel 2024-01-24   34  struct pscr_to_magic_entry {
3f484eec6730bd Oleksij Rempel 2024-01-24   35  	enum pscr pscr;
3f484eec6730bd Oleksij Rempel 2024-01-24   36  	u32 magic;
3f484eec6730bd Oleksij Rempel 2024-01-24   37  	struct list_head list;
3f484eec6730bd Oleksij Rempel 2024-01-24   38  };
3f484eec6730bd Oleksij Rempel 2024-01-24   39  
3f484eec6730bd Oleksij Rempel 2024-01-24   40  /*
3f484eec6730bd Oleksij Rempel 2024-01-24   41   * struct pscr_map - Maps device tree property names to PSCR values.
3f484eec6730bd Oleksij Rempel 2024-01-24   42   *
3f484eec6730bd Oleksij Rempel 2024-01-24   43   * @dt_prop_name: Device tree property name without the "pscr-" prefix.
3f484eec6730bd Oleksij Rempel 2024-01-24   44   * @pscr: The corresponding PSCR enum value for the given property name.
3f484eec6730bd Oleksij Rempel 2024-01-24   45   */
3f484eec6730bd Oleksij Rempel 2024-01-24   46  struct pscr_map {
3f484eec6730bd Oleksij Rempel 2024-01-24   47  	const char *dt_prop_name;
3f484eec6730bd Oleksij Rempel 2024-01-24   48  	enum pscr pscr;
3f484eec6730bd Oleksij Rempel 2024-01-24   49  };
3f484eec6730bd Oleksij Rempel 2024-01-24   50  
3f484eec6730bd Oleksij Rempel 2024-01-24   51  /*
3f484eec6730bd Oleksij Rempel 2024-01-24   52   * struct pscr_map - Maps shortened DT property names to PSCR values.
3f484eec6730bd Oleksij Rempel 2024-01-24   53   *
3f484eec6730bd Oleksij Rempel 2024-01-24   54   * This structure maps device tree property names, with the "pscr-" prefix
3f484eec6730bd Oleksij Rempel 2024-01-24   55   * omitted, to their corresponding Power State Change Reason (PSCR) values.
3f484eec6730bd Oleksij Rempel 2024-01-24   56   */
3f484eec6730bd Oleksij Rempel 2024-01-24  @57  struct pscr_map pscr_map_table[] = {
3f484eec6730bd Oleksij Rempel 2024-01-24   58  	{ "under-voltage", PSCR_UNDER_VOLTAGE },
3f484eec6730bd Oleksij Rempel 2024-01-24   59  	{ "over-current", PSCR_OVER_CURRENT },
3f484eec6730bd Oleksij Rempel 2024-01-24   60  	{ "regulator-failure", PSCR_REGULATOR_FAILURE },
3f484eec6730bd Oleksij Rempel 2024-01-24   61  	{ "over-temperature", PSCR_OVERTEMPERATURE },
3f484eec6730bd Oleksij Rempel 2024-01-24   62  };
3f484eec6730bd Oleksij Rempel 2024-01-24   63  
3f484eec6730bd Oleksij Rempel 2024-01-24   64  /*
3f484eec6730bd Oleksij Rempel 2024-01-24   65   * pscr_find_from_dt_name - Finds the PSCR value for a given DT property name.
3f484eec6730bd Oleksij Rempel 2024-01-24   66   *
3f484eec6730bd Oleksij Rempel 2024-01-24   67   * @dt_prop_name: The device tree property name, without the "pscr-" prefix, to
3f484eec6730bd Oleksij Rempel 2024-01-24   68   * look up.
3f484eec6730bd Oleksij Rempel 2024-01-24   69   * Returns the corresponding PSCR value or -ENOENT if not found.
3f484eec6730bd Oleksij Rempel 2024-01-24   70   */
3f484eec6730bd Oleksij Rempel 2024-01-24   71  static int find_pscr_by_string(const char *dt_prop_name)
3f484eec6730bd Oleksij Rempel 2024-01-24   72  {
3f484eec6730bd Oleksij Rempel 2024-01-24   73  	int i;
3f484eec6730bd Oleksij Rempel 2024-01-24   74  
3f484eec6730bd Oleksij Rempel 2024-01-24   75  	for (i = 0; i < ARRAY_SIZE(pscr_map_table); i++) {
3f484eec6730bd Oleksij Rempel 2024-01-24   76  		if (!strcmp(dt_prop_name, pscr_map_table[i].dt_prop_name))
3f484eec6730bd Oleksij Rempel 2024-01-24   77  			return pscr_map_table[i].pscr;
3f484eec6730bd Oleksij Rempel 2024-01-24   78  	}
3f484eec6730bd Oleksij Rempel 2024-01-24   79  
3f484eec6730bd Oleksij Rempel 2024-01-24   80  	return -ENOENT;
3f484eec6730bd Oleksij Rempel 2024-01-24   81  }
3f484eec6730bd Oleksij Rempel 2024-01-24   82  
3f484eec6730bd Oleksij Rempel 2024-01-24   83  static enum pscr get_pscr_by_magic(struct pscrr_device *pscrr_dev, u32 magic)
3f484eec6730bd Oleksij Rempel 2024-01-24   84  {
3f484eec6730bd Oleksij Rempel 2024-01-24   85  	struct pscr_to_magic_entry *map_entry;
3f484eec6730bd Oleksij Rempel 2024-01-24   86  
3f484eec6730bd Oleksij Rempel 2024-01-24   87  	list_for_each_entry(map_entry, &pscrr_dev->pscr_map_list, list) {
3f484eec6730bd Oleksij Rempel 2024-01-24   88  		if (map_entry->magic == magic)
3f484eec6730bd Oleksij Rempel 2024-01-24   89  			return map_entry->pscr;
3f484eec6730bd Oleksij Rempel 2024-01-24   90  	}
3f484eec6730bd Oleksij Rempel 2024-01-24   91  
3f484eec6730bd Oleksij Rempel 2024-01-24   92  	return 0;
3f484eec6730bd Oleksij Rempel 2024-01-24   93  }
3f484eec6730bd Oleksij Rempel 2024-01-24   94  
3f484eec6730bd Oleksij Rempel 2024-01-24   95  static u32 get_magic_by_pscr(struct pscrr_device *pscrr_dev, enum pscr pscr)
3f484eec6730bd Oleksij Rempel 2024-01-24   96  {
3f484eec6730bd Oleksij Rempel 2024-01-24   97  	struct pscr_to_magic_entry *map_entry;
3f484eec6730bd Oleksij Rempel 2024-01-24   98  
3f484eec6730bd Oleksij Rempel 2024-01-24   99  	list_for_each_entry(map_entry, &pscrr_dev->pscr_map_list, list) {
3f484eec6730bd Oleksij Rempel 2024-01-24  100  		if (map_entry->pscr == pscr)
3f484eec6730bd Oleksij Rempel 2024-01-24  101  			return map_entry->magic;
3f484eec6730bd Oleksij Rempel 2024-01-24  102  	}
3f484eec6730bd Oleksij Rempel 2024-01-24  103  
3f484eec6730bd Oleksij Rempel 2024-01-24  104  	return 0;
3f484eec6730bd Oleksij Rempel 2024-01-24  105  }
3f484eec6730bd Oleksij Rempel 2024-01-24  106  
3f484eec6730bd Oleksij Rempel 2024-01-24  107  /**
3f484eec6730bd Oleksij Rempel 2024-01-24  108   * set_power_state_change_reason() - Set the system's power state change reason
3f484eec6730bd Oleksij Rempel 2024-01-24  109   * @pscr: The enum value representing the power state change reason
3f484eec6730bd Oleksij Rempel 2024-01-24  110   *
3f484eec6730bd Oleksij Rempel 2024-01-24  111   * This function sets the system's power state change reason based on the
3f484eec6730bd Oleksij Rempel 2024-01-24  112   * provided enum value.
3f484eec6730bd Oleksij Rempel 2024-01-24  113   */
3f484eec6730bd Oleksij Rempel 2024-01-24  114  void set_power_state_change_reason(enum pscr pscr)
3f484eec6730bd Oleksij Rempel 2024-01-24  115  {
3f484eec6730bd Oleksij Rempel 2024-01-24  116  	system_pscr = pscr;
3f484eec6730bd Oleksij Rempel 2024-01-24  117  }
3f484eec6730bd Oleksij Rempel 2024-01-24  118  EXPORT_SYMBOL_GPL(set_power_state_change_reason);
3f484eec6730bd Oleksij Rempel 2024-01-24  119  
3f484eec6730bd Oleksij Rempel 2024-01-24  120  static const char *pscr_to_por_string(enum pscr pscr)
3f484eec6730bd Oleksij Rempel 2024-01-24  121  {
3f484eec6730bd Oleksij Rempel 2024-01-24  122  	switch (pscr) {
3f484eec6730bd Oleksij Rempel 2024-01-24  123  	case PSCR_UNDER_VOLTAGE:
3f484eec6730bd Oleksij Rempel 2024-01-24  124  		return POWER_ON_REASON_BROWN_OUT;
3f484eec6730bd Oleksij Rempel 2024-01-24  125  	case PSCR_OVER_CURRENT:
3f484eec6730bd Oleksij Rempel 2024-01-24  126  		return POWER_ON_REASON_OVER_CURRENT;
3f484eec6730bd Oleksij Rempel 2024-01-24  127  	case PSCR_REGULATOR_FAILURE:
3f484eec6730bd Oleksij Rempel 2024-01-24  128  		return POWER_ON_REASON_REGULATOR_FAILURE;
3f484eec6730bd Oleksij Rempel 2024-01-24  129  	case PSCR_OVERTEMPERATURE:
3f484eec6730bd Oleksij Rempel 2024-01-24  130  		return POWER_ON_REASON_OVERTEMPERATURE;
3f484eec6730bd Oleksij Rempel 2024-01-24  131  	default:
3f484eec6730bd Oleksij Rempel 2024-01-24 @132  	}
3f484eec6730bd Oleksij Rempel 2024-01-24  133  
3f484eec6730bd Oleksij Rempel 2024-01-24  134  	return POWER_ON_REASON_UNKNOWN;
3f484eec6730bd Oleksij Rempel 2024-01-24  135  }
3f484eec6730bd Oleksij Rempel 2024-01-24  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

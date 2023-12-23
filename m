Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2215E81
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Dec 2023 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y70mCTvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703354815; x=1734890815;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1/U+M1mmpHXs1oamuluajGX1X8nb0wGCyBBERXFKLSM=;
  b=Y70mCTvKC3wepYibLYMUw2rg42wU1cPBau2V6FWr2le+gYqr+jU7Phca
   zkSQ53nYHBXqe+vRhmaJwMsglzdPQaWqQkyVJOtaoxZVT9S9w96OnAXLA
   MC4MuomqwTRf/i5JaV9jOtrciiWBruEVMsnInJvSswxFd2O2r4/gPYbTc
   z5CPRgdyJLfYHVPnp6MLtH6gHqw19S+H9lZocC3Hj7i/9tatq6QQA6GLq
   wqORxSsWw8pi82CB54a2NjDJw9FlR/kNL0OFzbDNQjeUGNibz3tYp2yiC
   z8iuwuzehPwq4HmGUkoDOasrx9ZYz1IJ0OX0C93UJ9q12OzAeWYECJ4yC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="9602274"
X-IronPort-AV: E=Sophos;i="6.04,299,1695711600"; 
   d="scan'208";a="9602274"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2023 10:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="1024552937"
X-IronPort-AV: E=Sophos;i="6.04,299,1695711600"; 
   d="scan'208";a="1024552937"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Dec 2023 10:06:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rH6Od-000BIZ-0t;
	Sat, 23 Dec 2023 18:06:48 +0000
Date: Sun, 24 Dec 2023 02:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/2] thermal/debugfs: Add thermal debugfs information
 for mitigation episodes
Message-ID: <202312240142.RgAg0VLT-lkp@intel.com>
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
In-Reply-To: <20231219092539.3655172-2-daniel.lezcano@linaro.org>
References: <20231219092539.3655172-2-daniel.lezcano@linaro.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: rjw@rjwysocki.net
TO: daniel.lezcano@linaro.org
TO: lukasz.luba@arm.com
CC: rui.zhang@intel.com
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: "Rafael J. Wysocki" <rafael@kernel.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on next-20231222]
[cannot apply to linus/master v6.7-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/thermal-debugfs-Add-thermal-debugfs-information-for-mitigation-episodes/20231219-172732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal
patch link:    https://lore.kernel.org/r/20231219092539.3655172-2-daniel.lezcano%40linaro.org
patch subject: [PATCH v3 2/2] thermal/debugfs: Add thermal debugfs information for mitigation episodes
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231222 (https://download.01.org/0day-ci/archive/20231224/202312240142.RgAg0VLT-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312240142.RgAg0VLT-lkp@intel.com/

smatch warnings:
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xc2'
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xb0'
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xc2'
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xb0'
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xc2'
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xb0'
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xc2'
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xb0'
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xc2'
drivers/thermal/thermal_debugfs.c:700 tze_seq_show() warn: format string contains non-ascii character '\xb0'

vim +700 drivers/thermal/thermal_debugfs.c

7fb73c6c804962 Daniel Lezcano 2023-12-19  687  
7fb73c6c804962 Daniel Lezcano 2023-12-19  688  static int tze_seq_show(struct seq_file *s, void *v)
7fb73c6c804962 Daniel Lezcano 2023-12-19  689  {
7fb73c6c804962 Daniel Lezcano 2023-12-19  690  	struct thermal_zone_device *tz = s->private;
7fb73c6c804962 Daniel Lezcano 2023-12-19  691  	struct tz_events *tze;
7fb73c6c804962 Daniel Lezcano 2023-12-19  692  	int i;
7fb73c6c804962 Daniel Lezcano 2023-12-19  693  
7fb73c6c804962 Daniel Lezcano 2023-12-19  694  	tze = list_entry((struct list_head *)v, struct tz_events, node);
7fb73c6c804962 Daniel Lezcano 2023-12-19  695  
7fb73c6c804962 Daniel Lezcano 2023-12-19  696  	seq_printf(s, ",-Mitigation at %lluus, duration=%llums\n",
7fb73c6c804962 Daniel Lezcano 2023-12-19  697  		   ktime_to_us(tze->timestamp),
7fb73c6c804962 Daniel Lezcano 2023-12-19  698  		   ktime_to_ms(tze->duration));
7fb73c6c804962 Daniel Lezcano 2023-12-19  699  
7fb73c6c804962 Daniel Lezcano 2023-12-19 @700  	seq_printf(s, "| trip |     type | temp(°mC) | hyst(°mC) |  duration  |  avg(°mC) |  min(°mC) |  max(°mC) |\n");
7fb73c6c804962 Daniel Lezcano 2023-12-19  701  	
7fb73c6c804962 Daniel Lezcano 2023-12-19  702  	for (i = 0; i < tz->num_trips; i++) {
7fb73c6c804962 Daniel Lezcano 2023-12-19  703  
7fb73c6c804962 Daniel Lezcano 2023-12-19  704  		struct thermal_trip trip;
7fb73c6c804962 Daniel Lezcano 2023-12-19  705  		const char *type;
7fb73c6c804962 Daniel Lezcano 2023-12-19  706  		
7fb73c6c804962 Daniel Lezcano 2023-12-19  707  		if (__thermal_zone_get_trip(tz, i, &trip))
7fb73c6c804962 Daniel Lezcano 2023-12-19  708  			continue;
7fb73c6c804962 Daniel Lezcano 2023-12-19  709  
7fb73c6c804962 Daniel Lezcano 2023-12-19  710  		/*
7fb73c6c804962 Daniel Lezcano 2023-12-19  711  		 * There is no possible mitigation happening at the
7fb73c6c804962 Daniel Lezcano 2023-12-19  712  		 * critical trip point, so the stats will be always
7fb73c6c804962 Daniel Lezcano 2023-12-19  713  		 * zero, skip this trip point
7fb73c6c804962 Daniel Lezcano 2023-12-19  714  		 */
7fb73c6c804962 Daniel Lezcano 2023-12-19  715  		if (trip.type == THERMAL_TRIP_CRITICAL)
7fb73c6c804962 Daniel Lezcano 2023-12-19  716  			continue;
7fb73c6c804962 Daniel Lezcano 2023-12-19  717  
7fb73c6c804962 Daniel Lezcano 2023-12-19  718  		if (trip.type == THERMAL_TRIP_PASSIVE)
7fb73c6c804962 Daniel Lezcano 2023-12-19  719  			type = "passive";
7fb73c6c804962 Daniel Lezcano 2023-12-19  720  		else if (trip.type == THERMAL_TRIP_ACTIVE)
7fb73c6c804962 Daniel Lezcano 2023-12-19  721  			type = "active";
7fb73c6c804962 Daniel Lezcano 2023-12-19  722  		else
7fb73c6c804962 Daniel Lezcano 2023-12-19  723  			type = "hot";
7fb73c6c804962 Daniel Lezcano 2023-12-19  724  
7fb73c6c804962 Daniel Lezcano 2023-12-19  725  		seq_printf(s, "| %*d | %*s | %*d | %*d | %*lld | %*d | %*d | %*d |\n",
7fb73c6c804962 Daniel Lezcano 2023-12-19  726  			   4 , i,
7fb73c6c804962 Daniel Lezcano 2023-12-19  727  			   8, type,
7fb73c6c804962 Daniel Lezcano 2023-12-19  728  			   9, trip.temperature,
7fb73c6c804962 Daniel Lezcano 2023-12-19  729  			   9, trip.hysteresis,
7fb73c6c804962 Daniel Lezcano 2023-12-19  730  			   10, ktime_to_ms(tze->trip_stats[i].duration),
7fb73c6c804962 Daniel Lezcano 2023-12-19  731  			   9, tze->trip_stats[i].avg,
7fb73c6c804962 Daniel Lezcano 2023-12-19  732  			   9, tze->trip_stats[i].min,
7fb73c6c804962 Daniel Lezcano 2023-12-19  733  			   9, tze->trip_stats[i].max);
7fb73c6c804962 Daniel Lezcano 2023-12-19  734  	}
7fb73c6c804962 Daniel Lezcano 2023-12-19  735  
7fb73c6c804962 Daniel Lezcano 2023-12-19  736  	return 0;
7fb73c6c804962 Daniel Lezcano 2023-12-19  737  }
7fb73c6c804962 Daniel Lezcano 2023-12-19  738  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

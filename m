Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B929A0
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 04:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732942530; cv=none; b=fm8U3LoZ5vMUbzfph9HV8iGcIjDmvZ9Il4negLgkwp4s/G/WKPL90Ondu5v+olAEFfCJME7dRBw6IY30nwgZU0zp41U5w2rNpftGKwytG3wMXNo4zDrZQhi3paZWAXFySbJtoFsNcWRqWhHgzAQ7o7BTLdQDXx/iDBMznk6KSKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732942530; c=relaxed/simple;
	bh=gVBMqcvt39Zw0+s6CE7i5AvGM9/jGy3KO+wdxGdZ9sk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TWfaaqBOpJTEXzqFQzp54YeMl6safBG4Pdq8l2VnQB5ks8fu8CHWiEd1uuRiG512QihutV+VgUMyBMRV6yFQ7oIHBGjmro3uyNCZqFnMGA01S4N++VCGlSpW2XIvS5Y+uxa1P91EAn4JiuQyWpXOwmKZaHKmM2hMfvX7d07Rr+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OicNp2Qa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OicNp2Qa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732942528; x=1764478528;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gVBMqcvt39Zw0+s6CE7i5AvGM9/jGy3KO+wdxGdZ9sk=;
  b=OicNp2QauaBS21Lhaf997snaf8avurMMNN1+XJXhxn2ViFzjio7/bFQX
   Hbocp+jZCwd/YImQZxYMnSRZV8H/mPplIQznOriPA6jfZUcwucRIiXJN2
   eqAGHCga4lpTYnR6Jv7QKARAqYH4QPHdunx8dEgtLPnqAElXvLp6Kgl7u
   YjpmI3s93fERmf7QZenqKVrf5021GbsfjdRy7NdkTbWGrgH9g6tZbPQ5W
   Tg7EurCRiN8odgJ5zj3CWz7u0AjjUl92a16A5ZXPSZol7xbJB+jJUxDlt
   qTVaz8QjHS/UsqtrIOh1Pih4thlVR4bjLtw7uYP9kTTxC42v6sevu2TEl
   Q==;
X-CSE-ConnectionGUID: ULpMhhR5SAqFHAxlSwpLlQ==
X-CSE-MsgGUID: kXowP1hzTGWUOWJY7wh8WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44549244"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="44549244"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 20:55:24 -0800
X-CSE-ConnectionGUID: 5Bk43nrqQk+a/TkZ6Lp65g==
X-CSE-MsgGUID: nRzC84IrSsOlpcXqfhWtmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92723825"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Nov 2024 20:55:23 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHFVo-00005Y-2v;
	Sat, 30 Nov 2024 04:55:20 +0000
Date: Sat, 30 Nov 2024 12:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/scsi/sd.c:2183:7-17: WARNING: Unsigned expression compared
 with zero: the_result > 0
Message-ID: <202411301200.Egg0Y6Cx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mike Christie <michael.christie@oracle.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Christoph Hellwig <hch@lst.de>
CC: John Garry <john.g.garry@oracle.com>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Martin Wilck <mwilck@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: b4d0c33a32c3c59217ec449de3892b1a6d68cbc1 scsi: sd: Fix sshdr use in sd_spinup_disk
date:   1 year, 2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 2 months ago
config: hexagon-randconfig-r051-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301200.Egg0Y6Cx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411301200.Egg0Y6Cx-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/sd.c:2183:7-17: WARNING: Unsigned expression compared with zero: the_result > 0

vim +2183 drivers/scsi/sd.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  2147  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2148  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  2149   * spinup disk - called only in sd_revalidate_disk()
^1da177e4c3f41 Linus Torvalds      2005-04-16  2150   */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2151  static void
e73aec8247032e Martin K. Petersen  2007-02-27  2152  sd_spinup_disk(struct scsi_disk *sdkp)
ea73a9f23906c3 James Bottomley     2005-08-28  2153  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2154  	unsigned char cmd[10];
4451e472627881 Alan Stern          2005-07-12  2155  	unsigned long spintime_expire = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2156  	int retries, spintime;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2157  	unsigned int the_result;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2158  	struct scsi_sense_hdr sshdr;
af16cd63d9d3b7 Mike Christie       2022-12-29  2159  	const struct scsi_exec_args exec_args = {
af16cd63d9d3b7 Mike Christie       2022-12-29  2160  		.sshdr = &sshdr,
af16cd63d9d3b7 Mike Christie       2022-12-29  2161  	};
^1da177e4c3f41 Linus Torvalds      2005-04-16  2162  	int sense_valid = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2163  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2164  	spintime = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2165  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2166  	/* Spin up drives, as required.  Only do this at boot time */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2167  	/* Spinup needs to be done for module loads too. */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2168  	do {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2169  		retries = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2170  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2171  		do {
4521428c48118b Heiner Kallweit     2021-09-11  2172  			bool media_was_present = sdkp->media_present;
4521428c48118b Heiner Kallweit     2021-09-11  2173  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2174  			cmd[0] = TEST_UNIT_READY;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2175  			memset((void *) &cmd[1], 0, 9);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2176  
af16cd63d9d3b7 Mike Christie       2022-12-29  2177  			the_result = scsi_execute_cmd(sdkp->device, cmd,
af16cd63d9d3b7 Mike Christie       2022-12-29  2178  						      REQ_OP_DRV_IN, NULL, 0,
af16cd63d9d3b7 Mike Christie       2022-12-29  2179  						      SD_TIMEOUT,
af16cd63d9d3b7 Mike Christie       2022-12-29  2180  						      sdkp->max_retries,
af16cd63d9d3b7 Mike Christie       2022-12-29  2181  						      &exec_args);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2182  
b4d0c33a32c3c5 Mike Christie       2023-10-04 @2183  			if (the_result > 0) {
b4d38e38e66f8e Alan Stern          2006-10-11  2184  				/*
b4d38e38e66f8e Alan Stern          2006-10-11  2185  				 * If the drive has indicated to us that it
b4d38e38e66f8e Alan Stern          2006-10-11  2186  				 * doesn't have any media in it, don't bother
b4d38e38e66f8e Alan Stern          2006-10-11  2187  				 * with any more polling.
b4d38e38e66f8e Alan Stern          2006-10-11  2188  				 */
848ade90ba9c1e Christian Loehle    2021-08-16  2189  				if (media_not_present(sdkp, &sshdr)) {
4521428c48118b Heiner Kallweit     2021-09-11  2190  					if (media_was_present)
b4d0c33a32c3c5 Mike Christie       2023-10-04  2191  						sd_printk(KERN_NOTICE, sdkp,
b4d0c33a32c3c5 Mike Christie       2023-10-04  2192  							  "Media removed, stopped polling\n");
b4d38e38e66f8e Alan Stern          2006-10-11  2193  					return;
848ade90ba9c1e Christian Loehle    2021-08-16  2194  				}
b4d38e38e66f8e Alan Stern          2006-10-11  2195  
ea73a9f23906c3 James Bottomley     2005-08-28  2196  				sense_valid = scsi_sense_valid(&sshdr);
b4d0c33a32c3c5 Mike Christie       2023-10-04  2197  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2198  			retries++;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2199  		} while (retries < 3 &&
^1da177e4c3f41 Linus Torvalds      2005-04-16  2200  			 (!scsi_status_is_good(the_result) ||
464a00c9e0ad45 Hannes Reinecke     2021-04-27  2201  			  (scsi_status_is_check_condition(the_result) &&
^1da177e4c3f41 Linus Torvalds      2005-04-16  2202  			  sense_valid && sshdr.sense_key == UNIT_ATTENTION)));
^1da177e4c3f41 Linus Torvalds      2005-04-16  2203  
464a00c9e0ad45 Hannes Reinecke     2021-04-27  2204  		if (!scsi_status_is_check_condition(the_result)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2205  			/* no sense, TUR either succeeded or failed
^1da177e4c3f41 Linus Torvalds      2005-04-16  2206  			 * with a status error */
e73aec8247032e Martin K. Petersen  2007-02-27  2207  			if(!spintime && !scsi_status_is_good(the_result)) {
ef61329db7b8b4 Hannes Reinecke     2014-10-24  2208  				sd_print_result(sdkp, "Test Unit Ready failed",
ef61329db7b8b4 Hannes Reinecke     2014-10-24  2209  						the_result);
e73aec8247032e Martin K. Petersen  2007-02-27  2210  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2211  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2212  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2213  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2214  		/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  2215  		 * The device does not want the automatic start to be issued.
^1da177e4c3f41 Linus Torvalds      2005-04-16  2216  		 */
33dd6f92a1a7ad Matthew Wilcox      2009-02-20  2217  		if (sdkp->device->no_start_on_add)
^1da177e4c3f41 Linus Torvalds      2005-04-16  2218  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2219  
33dd6f92a1a7ad Matthew Wilcox      2009-02-20  2220  		if (sense_valid && sshdr.sense_key == NOT_READY) {
33dd6f92a1a7ad Matthew Wilcox      2009-02-20  2221  			if (sshdr.asc == 4 && sshdr.ascq == 3)
^1da177e4c3f41 Linus Torvalds      2005-04-16  2222  				break;	/* manual intervention required */
33dd6f92a1a7ad Matthew Wilcox      2009-02-20  2223  			if (sshdr.asc == 4 && sshdr.ascq == 0xb)
33dd6f92a1a7ad Matthew Wilcox      2009-02-20  2224  				break;	/* standby */
33dd6f92a1a7ad Matthew Wilcox      2009-02-20  2225  			if (sshdr.asc == 4 && sshdr.ascq == 0xc)
33dd6f92a1a7ad Matthew Wilcox      2009-02-20  2226  				break;	/* unavailable */
505aa4b6a8834a Mahesh Rajashekhara 2018-04-17  2227  			if (sshdr.asc == 4 && sshdr.ascq == 0x1b)
505aa4b6a8834a Mahesh Rajashekhara 2018-04-17  2228  				break;	/* sanitize in progress */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2229  			/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  2230  			 * Issue command to spin up drive when not ready
^1da177e4c3f41 Linus Torvalds      2005-04-16  2231  			 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2232  			if (!spintime) {
e73aec8247032e Martin K. Petersen  2007-02-27  2233  				sd_printk(KERN_NOTICE, sdkp, "Spinning up disk...");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2234  				cmd[0] = START_STOP;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2235  				cmd[1] = 1;	/* Return immediately */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2236  				memset((void *) &cmd[2], 0, 8);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2237  				cmd[4] = 1;	/* Start spin cycle */
d2886ea368a677 Stefan Richter      2008-05-11  2238  				if (sdkp->device->start_stop_pwr_cond)
d2886ea368a677 Stefan Richter      2008-05-11  2239  					cmd[4] |= 1 << 4;
af16cd63d9d3b7 Mike Christie       2022-12-29  2240  				scsi_execute_cmd(sdkp->device, cmd,
af16cd63d9d3b7 Mike Christie       2022-12-29  2241  						 REQ_OP_DRV_IN, NULL, 0,
0610959fbbca62 Mike Christie       2020-10-01  2242  						 SD_TIMEOUT, sdkp->max_retries,
af16cd63d9d3b7 Mike Christie       2022-12-29  2243  						 &exec_args);
4451e472627881 Alan Stern          2005-07-12  2244  				spintime_expire = jiffies + 100 * HZ;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2245  				spintime = 1;
4451e472627881 Alan Stern          2005-07-12  2246  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2247  			/* Wait 1 second for next try */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2248  			msleep(1000);
3a1d0783ac2750 Michał Mirosław     2017-11-24  2249  			printk(KERN_CONT ".");
4451e472627881 Alan Stern          2005-07-12  2250  
4451e472627881 Alan Stern          2005-07-12  2251  		/*
4451e472627881 Alan Stern          2005-07-12  2252  		 * Wait for USB flash devices with slow firmware.
4451e472627881 Alan Stern          2005-07-12  2253  		 * Yes, this sense key/ASC combination shouldn't
4451e472627881 Alan Stern          2005-07-12  2254  		 * occur here.  It's characteristic of these devices.
4451e472627881 Alan Stern          2005-07-12  2255  		 */
4451e472627881 Alan Stern          2005-07-12  2256  		} else if (sense_valid &&
4451e472627881 Alan Stern          2005-07-12  2257  				sshdr.sense_key == UNIT_ATTENTION &&
4451e472627881 Alan Stern          2005-07-12  2258  				sshdr.asc == 0x28) {
4451e472627881 Alan Stern          2005-07-12  2259  			if (!spintime) {
4451e472627881 Alan Stern          2005-07-12  2260  				spintime_expire = jiffies + 5 * HZ;
4451e472627881 Alan Stern          2005-07-12  2261  				spintime = 1;
4451e472627881 Alan Stern          2005-07-12  2262  			}
4451e472627881 Alan Stern          2005-07-12  2263  			/* Wait 1 second for next try */
4451e472627881 Alan Stern          2005-07-12  2264  			msleep(1000);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2265  		} else {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2266  			/* we don't understand the sense code, so it's
^1da177e4c3f41 Linus Torvalds      2005-04-16  2267  			 * probably pointless to loop */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2268  			if(!spintime) {
e73aec8247032e Martin K. Petersen  2007-02-27  2269  				sd_printk(KERN_NOTICE, sdkp, "Unit Not Ready\n");
e73aec8247032e Martin K. Petersen  2007-02-27  2270  				sd_print_sense_hdr(sdkp, &sshdr);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2271  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2272  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2273  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2274  				
4451e472627881 Alan Stern          2005-07-12  2275  	} while (spintime && time_before_eq(jiffies, spintime_expire));
^1da177e4c3f41 Linus Torvalds      2005-04-16  2276  
^1da177e4c3f41 Linus Torvalds      2005-04-16  2277  	if (spintime) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2278  		if (scsi_status_is_good(the_result))
3a1d0783ac2750 Michał Mirosław     2017-11-24  2279  			printk(KERN_CONT "ready\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2280  		else
3a1d0783ac2750 Michał Mirosław     2017-11-24  2281  			printk(KERN_CONT "not responding...\n");
^1da177e4c3f41 Linus Torvalds      2005-04-16  2282  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2283  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  2284  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

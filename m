Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8BC44A3FB
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106145; cv=none; b=JvBSCHnK7wwKjv0kTW3dzkuF6ehtgB/KiaQAY9ZdEJwXUGScAQL9B8ZnXZSJR53y8uQ9Jt9J6KWrfQUsxbL/xocjpOImduxWT8scClqjbTg/7HXEMworld6DHRT+ujiT3Bj9uAALoQmwMbQTPmzQ51tbNHEy8EvaEexEjVOhqME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106145; c=relaxed/simple;
	bh=TQaOULpTNQ7QoAU5JNWIUCrnKCPShx2dFT8teLK72gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dLmbXuczHE7O9BRsKhWfHyPFSaLexZE5Ig/ebju/NXVNBPevHX0nbPBh0Hi+n0pvXvyj2xL+c0vTmmBWyqlIfSNsQukYWiitzO3iH1U4vDNngvRjC9WlCbw7HhDLllTrZxPS49R98Oag44Yr7tBlRgypeyyOK8JRUDa3B0omjyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dag72ION; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dag72ION"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786106130; x=1817642130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQaOULpTNQ7QoAU5JNWIUCrnKCPShx2dFT8teLK72gc=;
  b=dag72IONMI9WcmZlLeljCFZAEr9zX5QHibgR+awEJOZ6LafugGHw5n3T
   rDi088Dpgp3NKPH40buK99DHxjfXaXdaqqYHEbiAuq+ifIOj0YoH20gg/
   5WThuecxD4wmyQ+5NEwKxxhFVP7O0dPF9/c54ECIDeSNPPZWw/Y2qbxYy
   A42uR1ol03nyAgyblT5BDllFbMi8WqkBV+phMjwfRuU/WZf+SGJYE1iro
   U5wquv8zclZzeQQZOF9fwerlhjYr01/awm83R2qDvDj6jbY5qONyBjj2H
   HgedTK590ewOpgiH8bZ9MPp8s01PDyQBo1y+9yqoVqzjtJz0T20LgslHv
   A==;
X-CSE-ConnectionGUID: oMIQSGXXRZq2JVAFlPASAQ==
X-CSE-MsgGUID: 3LSkmROQQwm2sCdtJKquOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86824057"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86824057"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:35:22 -0700
X-CSE-ConnectionGUID: 1th1vdsrQOGoATDQ0zL+ng==
X-CSE-MsgGUID: WMFYHe4LSsCqJJdcIuv86Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2026 05:35:21 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsJnC-00000000IA9-45XI;
	Fri, 07 Aug 2026 12:35:18 +0000
Date: Fri, 7 Aug 2026 20:35:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drivers: rtc: handle OTF clock changes
Message-ID: <202608072059.hZ2oY5u0-lkp@intel.com>
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
In-Reply-To: <20260624123103.3523728-1-enachman@marvell.com>
References: <20260624123103.3523728-1-enachman@marvell.com>
TO: Elad Nachman <enachman@marvell.com>
TO: alexandre.belloni@bootlin.com
TO: linux-rtc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: enachman@marvell.com

Hi Elad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v7.2-rc6 next-20260806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elad-Nachman/drivers-rtc-handle-OTF-clock-changes/20260806-231215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20260624123103.3523728-1-enachman%40marvell.com
patch subject: [PATCH] drivers: rtc: handle OTF clock changes
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260807/202608072059.hZ2oY5u0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608072059.hZ2oY5u0-lkp@intel.com/

smatch warnings:
drivers/rtc/interface.c:163 rtc_set_time() warn: variable dereferenced before check 'rtc' (see line 135)

vim +/rtc +163 drivers/rtc/interface.c

0c86edc0d49706 Alessandro Zummo  2006-03-27  125  
ab6a2d70d18edc David Brownell    2007-05-08  126  int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
0c86edc0d49706 Alessandro Zummo  2006-03-27  127  {
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  128  	int err, uie;
37b82b16c5f104 Elad Nachman      2026-06-24  129  	struct rtc_time new_tm;
0c86edc0d49706 Alessandro Zummo  2006-03-27  130  
0c86edc0d49706 Alessandro Zummo  2006-03-27  131  	err = rtc_valid_tm(tm);
0c86edc0d49706 Alessandro Zummo  2006-03-27  132  	if (err != 0)
0c86edc0d49706 Alessandro Zummo  2006-03-27  133  		return err;
0c86edc0d49706 Alessandro Zummo  2006-03-27  134  
4c4e5df1f346f7 Baolin Wang       2018-01-08 @135  	err = rtc_valid_range(rtc, tm);
4c4e5df1f346f7 Baolin Wang       2018-01-08  136  	if (err)
4c4e5df1f346f7 Baolin Wang       2018-01-08  137  		return err;
71db049e7355f3 Alexandre Belloni 2018-02-17  138  
989515647e7832 Baolin Wang       2018-01-08  139  	rtc_subtract_offset(rtc, tm);
989515647e7832 Baolin Wang       2018-01-08  140  
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  141  #ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  142  	uie = rtc->uie_rtctimer.enabled || rtc->uie_irq_active;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  143  #else
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  144  	uie = rtc->uie_rtctimer.enabled;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  145  #endif
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  146  	if (uie) {
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  147  		err = rtc_update_irq_enable(rtc, 0);
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  148  		if (err)
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  149  			return err;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  150  	}
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  151  
0c86edc0d49706 Alessandro Zummo  2006-03-27  152  	err = mutex_lock_interruptible(&rtc->ops_lock);
0c86edc0d49706 Alessandro Zummo  2006-03-27  153  	if (err)
b68bb2632453a9 David Brownell    2008-07-29  154  		return err;
0c86edc0d49706 Alessandro Zummo  2006-03-27  155  
0c86edc0d49706 Alessandro Zummo  2006-03-27  156  	if (!rtc->ops)
0c86edc0d49706 Alessandro Zummo  2006-03-27  157  		err = -ENODEV;
bbccf83f6c4e1a Alessandro Zummo  2009-01-06  158  	else if (rtc->ops->set_time)
cd9662094edf41 David Brownell    2007-05-08  159  		err = rtc->ops->set_time(rtc->dev.parent, tm);
606cc43c720bde Alexandre Belloni 2019-03-20  160  	else
bbccf83f6c4e1a Alessandro Zummo  2009-01-06  161  		err = -EINVAL;
0c86edc0d49706 Alessandro Zummo  2006-03-27  162  
37b82b16c5f104 Elad Nachman      2026-06-24 @163  	if (rtc && rtc->ops && rtc->ops->read_time) {
37b82b16c5f104 Elad Nachman      2026-06-24  164  		if (!rtc->ops->read_time(rtc->dev.parent, &new_tm)) {
37b82b16c5f104 Elad Nachman      2026-06-24  165  			pr_debug("new rtc time secs %d mins %d hours %d mday %d mon %d year %d way %d yday %d dst %d\n",
37b82b16c5f104 Elad Nachman      2026-06-24  166  					new_tm.tm_sec, new_tm.tm_min,
37b82b16c5f104 Elad Nachman      2026-06-24  167  					new_tm.tm_hour, new_tm.tm_mday,
37b82b16c5f104 Elad Nachman      2026-06-24  168  					new_tm.tm_mon, new_tm.tm_year,
37b82b16c5f104 Elad Nachman      2026-06-24  169  					new_tm.tm_wday, new_tm.tm_yday,
37b82b16c5f104 Elad Nachman      2026-06-24  170  					new_tm.tm_isdst);
37b82b16c5f104 Elad Nachman      2026-06-24  171  		}
37b82b16c5f104 Elad Nachman      2026-06-24  172  	}
37b82b16c5f104 Elad Nachman      2026-06-24  173  
14d0e347ea2db5 Zoran Markovic    2013-06-26  174  	pm_stay_awake(rtc->dev.parent);
0c86edc0d49706 Alessandro Zummo  2006-03-27  175  	mutex_unlock(&rtc->ops_lock);
5f9679d29c7959 NeilBrown         2011-12-09  176  	/* A timer might have just expired */
5f9679d29c7959 NeilBrown         2011-12-09  177  	schedule_work(&rtc->irqwork);
29a1f599c0cc37 Baolin Wang       2017-12-14  178  
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  179  	if (uie) {
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  180  		err = rtc_update_irq_enable(rtc, 1);
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  181  		if (err)
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  182  			return err;
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  183  	}
7e7c005b4b1f1f Alexandre Belloni 2019-10-21  184  
29a1f599c0cc37 Baolin Wang       2017-12-14  185  	trace_rtc_set_time(rtc_tm_to_time64(tm), err);
0c86edc0d49706 Alessandro Zummo  2006-03-27  186  	return err;
0c86edc0d49706 Alessandro Zummo  2006-03-27  187  }
0c86edc0d49706 Alessandro Zummo  2006-03-27  188  EXPORT_SYMBOL_GPL(rtc_set_time);
0c86edc0d49706 Alessandro Zummo  2006-03-27  189  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

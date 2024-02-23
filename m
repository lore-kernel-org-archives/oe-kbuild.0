Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2275D73E
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Feb 2024 20:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708720405; cv=none; b=JuUJ1hFDgqOZKakhqntntnReea2JiAwFSZ7kpyjdfMUacWK/6CdRWtU/s/NqEjiBaEK3vGYJiAHWa9QYMfIIEn+Ge0LxHhLRK9ZfohzuVXxgdmRKWZ2jp460wTBvqIzV2IJUkxQxKVn8ZlqsU+FdwpUghlGOLUYx5U99oiMbMEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708720405; c=relaxed/simple;
	bh=lVdTkf/q8RBq0uJf4E82cwODHHwCgqHZoSPGHPl7XyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7D6e78ulDGNQhQ76Nwf8gUg0cl2ZecD6PoeC85tPWKBpwbj9cMocJr2E7wqH7av1hBuQYUmbIA775czB0Us90uQo+oJGmK6Z5bNV3WyI4GRNGqm5L5yg8itG0Qncd3vwkxrBXqCH6UgFRX9tZPvx0PHBtyBNwRX205EclnklV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eh8gdi1v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eh8gdi1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708720401; x=1740256401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lVdTkf/q8RBq0uJf4E82cwODHHwCgqHZoSPGHPl7XyY=;
  b=Eh8gdi1v6KZIWgK4L+sp8hUa64YBvZKDRVEQnUtJ2aQbVwDjy3g8rqXP
   BJZjlT3OiAgOQsOn1do7CRUuvY9KwH/JfrYvxDDkFZMPJvo8dUmtDRD/t
   F0ulOJeByII/BHuSInbXmsRBRP8wt6DKfnTudVe1gZQfMO480/Z/mJB0/
   0ZEY2JafBU85hxFmMO8xRe1RMYB7zGfJlp6k2XgQQK5CCidZkR7aCK6/v
   ZXwMo5HIn0uokGHExe597VHjv/yhBIblWKj0424l+/y9hDmNrFtJhTzTc
   k0Ob3xeX5Z+HnV5nHamVRni6/P4NdsVT7u8nJujxFzXu0FYDfRatZlULV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2940069"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2940069"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 12:33:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6167887"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Feb 2024 12:33:19 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdcE1-0007se-2e;
	Fri, 23 Feb 2024 20:32:58 +0000
Date: Sat, 24 Feb 2024 04:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:test/guard 64/68] sound/hda/hdac_controller.c:278
 snd_hdac_bus_get_response() warn: sleeping in atomic context
Message-ID: <202402240456.ka0BfKSR-lkp@intel.com>
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
CC: alsa-devel@alsa-project.org
TO: Takashi Iwai <tiwai@suse.de>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/guard
head:   5f5281ed5d5acd8ff5bc742a3dee0d6905173187
commit: 9f5fc53595280ef21415b3931321c51d4d2b0e44 [64/68] ALSA: hda: core: Use guard() for locking
:::::: branch date: 11 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-r081-20240223 (https://download.01.org/0day-ci/archive/20240224/202402240456.ka0BfKSR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402240456.ka0BfKSR-lkp@intel.com/

smatch warnings:
sound/hda/hdac_controller.c:278 snd_hdac_bus_get_response() warn: sleeping in atomic context

vim +278 sound/hda/hdac_controller.c

14752412721c61 Takashi Iwai 2015-04-14  230  
14752412721c61 Takashi Iwai 2015-04-14  231  /**
14752412721c61 Takashi Iwai 2015-04-14  232   * snd_hdac_bus_get_response - receive a response via RIRB
14752412721c61 Takashi Iwai 2015-04-14  233   * @bus: HD-audio core bus
14752412721c61 Takashi Iwai 2015-04-14  234   * @addr: codec address
14752412721c61 Takashi Iwai 2015-04-14  235   * @res: pointer to store the value, NULL when not needed
14752412721c61 Takashi Iwai 2015-04-14  236   *
14752412721c61 Takashi Iwai 2015-04-14  237   * Returns zero if a value is read, or a negative error code.
14752412721c61 Takashi Iwai 2015-04-14  238   */
14752412721c61 Takashi Iwai 2015-04-14  239  int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
14752412721c61 Takashi Iwai 2015-04-14  240  			      unsigned int *res)
14752412721c61 Takashi Iwai 2015-04-14  241  {
14752412721c61 Takashi Iwai 2015-04-14  242  	unsigned long timeout;
14752412721c61 Takashi Iwai 2015-04-14  243  	unsigned long loopcounter;
89698ed5cc76d8 Takashi Iwai 2019-12-12  244  	wait_queue_entry_t wait;
5f2cb361d798fb Takashi Iwai 2019-12-12  245  	bool warned = false;
14752412721c61 Takashi Iwai 2015-04-14  246  
89698ed5cc76d8 Takashi Iwai 2019-12-12  247  	init_wait_entry(&wait, 0);
14752412721c61 Takashi Iwai 2015-04-14  248  	timeout = jiffies + msecs_to_jiffies(1000);
14752412721c61 Takashi Iwai 2015-04-14  249  
14752412721c61 Takashi Iwai 2015-04-14  250  	for (loopcounter = 0;; loopcounter++) {
9f5fc53595280e Takashi Iwai 2024-02-22  251  		scoped_guard(spinlock_irq, &bus->reg_lock) {
89698ed5cc76d8 Takashi Iwai 2019-12-12  252  			if (!bus->polling_mode)
89698ed5cc76d8 Takashi Iwai 2019-12-12  253  				prepare_to_wait(&bus->rirb_wq, &wait,
89698ed5cc76d8 Takashi Iwai 2019-12-12  254  						TASK_UNINTERRUPTIBLE);
5e13cf6cd64c6a Bard Liao    2019-05-27  255  			if (bus->polling_mode)
5e13cf6cd64c6a Bard Liao    2019-05-27  256  				snd_hdac_bus_update_rirb(bus);
14752412721c61 Takashi Iwai 2015-04-14  257  			if (!bus->rirb.cmds[addr]) {
14752412721c61 Takashi Iwai 2015-04-14  258  				if (res)
14752412721c61 Takashi Iwai 2015-04-14  259  					*res = bus->rirb.res[addr]; /* the last value */
89698ed5cc76d8 Takashi Iwai 2019-12-12  260  				if (!bus->polling_mode)
89698ed5cc76d8 Takashi Iwai 2019-12-12  261  					finish_wait(&bus->rirb_wq, &wait);
14752412721c61 Takashi Iwai 2015-04-14  262  				return 0;
14752412721c61 Takashi Iwai 2015-04-14  263  			}
9f5fc53595280e Takashi Iwai 2024-02-22  264  		}
14752412721c61 Takashi Iwai 2015-04-14  265  		if (time_after(jiffies, timeout))
14752412721c61 Takashi Iwai 2015-04-14  266  			break;
5f2cb361d798fb Takashi Iwai 2019-12-12  267  #define LOOP_COUNT_MAX	3000
89698ed5cc76d8 Takashi Iwai 2019-12-12  268  		if (!bus->polling_mode) {
89698ed5cc76d8 Takashi Iwai 2019-12-12  269  			schedule_timeout(msecs_to_jiffies(2));
5f2cb361d798fb Takashi Iwai 2019-12-12  270  		} else if (bus->needs_damn_long_delay ||
5f2cb361d798fb Takashi Iwai 2019-12-12  271  			   loopcounter > LOOP_COUNT_MAX) {
5f2cb361d798fb Takashi Iwai 2019-12-12  272  			if (loopcounter > LOOP_COUNT_MAX && !warned) {
5f2cb361d798fb Takashi Iwai 2019-12-12  273  				dev_dbg_ratelimited(bus->dev,
5f2cb361d798fb Takashi Iwai 2019-12-12  274  						    "too slow response, last cmd=%#08x\n",
5f2cb361d798fb Takashi Iwai 2019-12-12  275  						    bus->last_cmd[addr]);
5f2cb361d798fb Takashi Iwai 2019-12-12  276  				warned = true;
5f2cb361d798fb Takashi Iwai 2019-12-12  277  			}
14752412721c61 Takashi Iwai 2015-04-14 @278  			msleep(2); /* temporary workaround */
89698ed5cc76d8 Takashi Iwai 2019-12-12  279  		} else {
14752412721c61 Takashi Iwai 2015-04-14  280  			udelay(10);
14752412721c61 Takashi Iwai 2015-04-14  281  			cond_resched();
14752412721c61 Takashi Iwai 2015-04-14  282  		}
14752412721c61 Takashi Iwai 2015-04-14  283  	}
14752412721c61 Takashi Iwai 2015-04-14  284  
89698ed5cc76d8 Takashi Iwai 2019-12-12  285  	if (!bus->polling_mode)
89698ed5cc76d8 Takashi Iwai 2019-12-12  286  		finish_wait(&bus->rirb_wq, &wait);
89698ed5cc76d8 Takashi Iwai 2019-12-12  287  
14752412721c61 Takashi Iwai 2015-04-14  288  	return -EIO;
14752412721c61 Takashi Iwai 2015-04-14  289  }
14752412721c61 Takashi Iwai 2015-04-14  290  EXPORT_SYMBOL_GPL(snd_hdac_bus_get_response);
14752412721c61 Takashi Iwai 2015-04-14  291  

:::::: The code at line 278 was first introduced by commit
:::::: 14752412721c61d9ac1e8d8fb51d7148cb15f85b ALSA: hda - Add the controller helper codes to hda-core module

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

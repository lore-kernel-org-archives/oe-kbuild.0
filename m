Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054F63D62
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jul 2024 05:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722145257; cv=none; b=ZzYHVUbuJETJi//5UEXq33uXajSxqttAL42k5sfOqCpr0FcaiQHEbRymEBc3yzKADHHLR6XXwgZK5N2Qcfjh7T7tDmoviTKgoiJqHJDKRHtfxK6veERBmNe/4XXfelh83SEmeLBPGU2hT0pWP/WTn67hq81tukneWcN0abUZ68o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722145257; c=relaxed/simple;
	bh=3MhteQZVJJFGWmGtgMMGHImRj2ugXa2IUiPAXICLoNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fKAxE4AShKrcFLpCtA3PXUCwmeo33BaiIlRFOmvhAbrgWTx43N/GNxvgKGs+kwXBwlgLXhWx3XzYxX0kD00dCsCKuzVlVUoGLCKtD0WN0q8PYK50AowL1NeX3DrxMAtmfWf905fng6ztcu8yOTYzKOO5Q+shWdQIfjMK7StyEdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4tKiFID; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4tKiFID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722145255; x=1753681255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3MhteQZVJJFGWmGtgMMGHImRj2ugXa2IUiPAXICLoNI=;
  b=X4tKiFID6Jg3E8gsXTXiVM8F+wb4sS0Gcj7TQv0M5bc749ZoSaSvd1KN
   kz0a5uNUL8V27s5eQr60nnVq6zvjoFln/AFm2PczFfe7Fs0JZr+E9ZWSX
   SV/nO1+hLoEd1XwMnxfgitaNZaA8kqjHpeGznmGVU33uWg5akmh/2Rlrt
   XD3OBaoMG1q5nnJbK6hK2NmlTjHUq5XSc1tgucVUyALY05jQ1MJxDHF+F
   Y7QLQgc2+7tGZ3aHDuCCS6escwUBA188FgvAbEG4lN/B75nVOMII4pUcZ
   SIZ5+bBpx39fqlj9hKZN4kMk24KNLLpIMkOwDpkSY2tCGr9DKMabYFrzS
   g==;
X-CSE-ConnectionGUID: nonlZZySTEuziXtKzdZIJg==
X-CSE-MsgGUID: YcesBN27Sd6pf+ljK9yQpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="30489993"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="30489993"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 22:40:54 -0700
X-CSE-ConnectionGUID: PeE2nE5iQWmrrmoFsvOmkQ==
X-CSE-MsgGUID: NOPV45H2RE+sqUTffK4Amg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="58224285"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2024 22:40:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXweI-000qYg-3B;
	Sun, 28 Jul 2024 05:40:50 +0000
Date: Sun, 28 Jul 2024 13:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] selftests: ALSA: Cover userspace-driven timers with
 test
Message-ID: <202407281359.vMYdESrT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240726074750.626671-5-ivan.orlov0322@gmail.com>
References: <20240726074750.626671-5-ivan.orlov0322@gmail.com>
TO: Ivan Orlov <ivan.orlov0322@gmail.com>
TO: perex@perex.cz
TO: tiwai@suse.com
TO: corbet@lwn.net
TO: broonie@kernel.org
TO: shuah@kernel.org
CC: Ivan Orlov <ivan.orlov0322@gmail.com>
CC: linux-kselftest@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: aholzinger@gmx.de

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.10 next-20240726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Orlov/ALSA-aloop-Allow-using-global-timers/20240726-155158
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20240726074750.626671-5-ivan.orlov0322%40gmail.com
patch subject: [PATCH 4/4] selftests: ALSA: Cover userspace-driven timers with test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407281359.vMYdESrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407281359.vMYdESrT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> utimer-test.c:73:1: warning: non-void function does not return a value [-Wreturn-type]
      73 | }
         | ^
>> utimer-test.c:117:11: warning: enumeration value 'TIMER_NO_EVENT' not handled in switch [-Wswitch]
     117 |                 switch (parse_timer_output(buf)) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +73 tools/testing/selftests/alsa/utimer-test.c

5cf58530fa628b Ivan Orlov 2024-07-26  62  
5cf58530fa628b Ivan Orlov 2024-07-26  63  static void *ticking_func(void *data)
5cf58530fa628b Ivan Orlov 2024-07-26  64  {
5cf58530fa628b Ivan Orlov 2024-07-26  65  	int i;
5cf58530fa628b Ivan Orlov 2024-07-26  66  	int *fd = (int *)data;
5cf58530fa628b Ivan Orlov 2024-07-26  67  
5cf58530fa628b Ivan Orlov 2024-07-26  68  	for (i = 0; i < TICKS_COUNT; i++) {
5cf58530fa628b Ivan Orlov 2024-07-26  69  		/* Well, trigger the timer! */
5cf58530fa628b Ivan Orlov 2024-07-26  70  		ioctl(*fd, SNDRV_TIMER_IOCTL_TRIGGER, NULL);
5cf58530fa628b Ivan Orlov 2024-07-26  71  		sleep(TIMER_FREQ_SEC);
5cf58530fa628b Ivan Orlov 2024-07-26  72  	}
5cf58530fa628b Ivan Orlov 2024-07-26 @73  }
5cf58530fa628b Ivan Orlov 2024-07-26  74  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

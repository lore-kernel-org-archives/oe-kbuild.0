Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F221CC5D
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 00:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699261; cv=none; b=tKtAYgJcb81rtjiMFUOx65t9hvUrjfqE29xdN2pV8T12r24Coy/cwzSsfE8F6XvminCNsT+xQfCHgIhc3aHYwKBGkbjq1xMDFVOc51RegvmFVel/4etLDeZJm2i3n8ZS8mh7FxUugQH3idyNMJxxw6Xd8bD0Ke50m0cGLskrB60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699261; c=relaxed/simple;
	bh=xCX5ovczwixd8RbrbR+pGH79KAQeCGwm5X4pm5neqFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+dCNqnZsPQ4QwhuDuuvukLS8OgMiPOdPUctnHJN+ZJZgQVjkDat1KxxN86K9ijbl0aPGk7r3zleP3IemyDOESdM+/VubUIe6HsXOW8MdoTq2FdFIF1SV7bOH2sYeycPgmwaQjt+JG47NgM+W3TyhO0O+1y0mfOHM9DatnDdvKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3rimR1u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3rimR1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754699260; x=1786235260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xCX5ovczwixd8RbrbR+pGH79KAQeCGwm5X4pm5neqFc=;
  b=S3rimR1u/gKVGnZN3i67U2Q6nEoHph6pCxxZnNVNtvXZt5gSZAVrTgkN
   NsZGYRifBqCvdGhwDTHCvFXIbRZVojhXQet3zpcVNqnIrWNv7NEPJei72
   UL+2m8FhCq1PKPjCJebcW4gcGsIjSKS2eoR87fYDVjVG7hfmaq8R8OrwJ
   vhdWv4KPSOr2tWYLT6MlYOh8EZY72RWZYVqf4rBoGE4rOOTzVelFn/KSx
   ivuqAbc2Ji5zFGBGW2HZJnV9Nv6jKw3Z8VTmj9eQLx2aoYiO4LMnPYqg+
   N9rx4EO5v6ZjLrBdS0lx9Op6iMHk73F9Iys4QcDZDsjMgu2au6bkZ1V8w
   Q==;
X-CSE-ConnectionGUID: CFjFO1PySjmPMSHN9DnpHw==
X-CSE-MsgGUID: gZV/qW2vT/OZ2EO9Bx0U9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57129014"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57129014"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 17:27:39 -0700
X-CSE-ConnectionGUID: jsYi3/o9QRu1Uf0evvsQRA==
X-CSE-MsgGUID: iCEB5tKlT+mG7gHbrOEyuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165770022"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Aug 2025 17:27:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukXQs-0004QO-0s;
	Sat, 09 Aug 2025 00:27:34 +0000
Date: Sat, 9 Aug 2025 08:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] media: xc2028: hold the device if firmware loading
 is in progress
Message-ID: <202508090831.5eRXcWv2-lkp@intel.com>
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
In-Reply-To: <20250806075409.210489-2-dmantipov@yandex.ru>
References: <20250806075409.210489-2-dmantipov@yandex.ru>
TO: Dmitry Antipov <dmantipov@yandex.ru>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Chi Zhiling <chizhiling@kylinos.cn>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Dmitry Antipov <dmantipov@yandex.ru>
CC: syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/media-xc2028-hold-the-device-if-firmware-loading-is-in-progress/20250806-160542
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250806075409.210489-2-dmantipov%40yandex.ru
patch subject: [PATCH 2/2] media: xc2028: hold the device if firmware loading is in progress
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r073-20250809 (https://download.01.org/0day-ci/archive/20250809/202508090831.5eRXcWv2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508090831.5eRXcWv2-lkp@intel.com/

smatch warnings:
drivers/media/tuners/xc2028.c:1342 xc2028_dvb_release() warn: variable dereferenced before check 'priv' (see line 1335)

vim +/priv +1342 drivers/media/tuners/xc2028.c

45819c381fc4fb3 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1325  
194ced7a5a99b30 drivers/media/tuners/tuner-xc2028.c        Max Kellermann        2016-08-09  1326  static void xc2028_dvb_release(struct dvb_frontend *fe)
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1327  {
215b95baf969c6f drivers/media/video/tuner-xc2028.c         Mauro Carvalho Chehab 2007-10-23  1328  	struct xc2028_data *priv = fe->tuner_priv;
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1329  
7e28adb2497f6b8 drivers/media/video/tuner-xc2028.c         Harvey Harrison       2008-04-08  1330  	tuner_dbg("%s called\n", __func__);
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1331  
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1332  	mutex_lock(&xc2028_list_mutex);
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1333  
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06  1334  	/* wait for request_firmware_nowait() if scheduled */
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06 @1335  	if (priv->state == XC2028_WAITING_FIRMWARE)
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06  1336  		wait_for_completion(&priv->fwload);
01c647c99112a50 drivers/media/tuners/xc2028.c              Dmitry Antipov        2025-08-06  1337  
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1338  	/* only perform final cleanup if this is the last instance */
22a1e7783e173ab drivers/media/tuners/tuner-xc2028.c        Takashi Iwai          2016-11-17  1339  	if (hybrid_tuner_report_instance_count(priv) == 1)
de3fe21ba2fdc07 drivers/media/video/tuner-xc2028.c         Mauro Carvalho Chehab 2007-10-24  1340  		free_firmware(priv);
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1341  
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18 @1342  	if (priv)
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1343  		hybrid_tuner_release_state(priv);
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1344  
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1345  	mutex_unlock(&xc2028_list_mutex);
aa501be989f5df5 drivers/media/video/tuner-xc2028.c         Chris Pascoe          2007-11-19  1346  
c663d03590a882f drivers/media/common/tuners/tuner-xc2028.c Michael Krufky        2008-04-18  1347  	fe->tuner_priv = NULL;
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1348  }
701672eb7387390 drivers/media/video/tuner-xc2028.c         Michel Ludwig         2007-07-18  1349  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5D81AA83
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Aug 2023 18:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691605183; x=1723141183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SNdwcIjV6/nrtkwZKLBy8aPYKlUHy+6dedl/eVGbkIE=;
  b=gchpqMkMMV2sV72gsRogl2qIUyzR/p+rJV/93Txx2NCKCghRNeAEzu3k
   0mbeYdpTHlOaSoP4U//ymUIBnuy53GI19dev8/xMqRBD+o/SXunUK+ZJc
   w/ZbRe5p+vp4l5E4FMUQVZOVVwzvqqtVEO72Hnf5YOtgOenAAkQTMLgfY
   M0muwvHD8Rtn6yQGtdN0W6t8jnA3tznzxPNduMTM6naNOg4KhLWvVEz+a
   GBRL+WRJPE4mdRAQ62qYecqdGk9bUWgfCs+/u1jGeza0RRm0jL/fMu0Ih
   KDtWOBfl9rSKigFZ2jN544ownmSbE954sc/SumpBPaZIMzmY8jjaNwY/s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350774567"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="350774567"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 11:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905755320"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="905755320"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Aug 2023 11:19:41 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTnmW-0006Jk-36;
	Wed, 09 Aug 2023 18:19:40 +0000
Date: Thu, 10 Aug 2023 02:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2314/8441] drivers/soundwire/qcom.c:905:22-23:
 WARNING opportunity for min()
Message-ID: <202308100211.ySb0G3Wp-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mark Brown <broonie@kernel.org>
CC: Takashi Iwai <tiwai@suse.de>

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: 512d092d78823f9813f4af38090b33c454137a4c [2314/8441] ALSA: Enable build with UML
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
config: um-randconfig-r051-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100211.ySb0G3Wp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100211.ySb0G3Wp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308100211.ySb0G3Wp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soundwire/qcom.c:905:22-23: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

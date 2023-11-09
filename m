Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB9E360
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Nov 2023 00:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ik3gM2O5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699490039; x=1731026039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/pgyOJLESHAUq5VT0RjPHk8rcLUeCioTBjIT9LavKU=;
  b=ik3gM2O5Qo1XGVVALHZh1pSJuzeNCgIPEAzM3cbBFHoMFduKU2thNDgC
   V1YuQvbwzIab9WK8XvnrUki3NdO105fYY5/9O0WLkxDmGppi9AxNjCB/I
   uELtpmENmRWpVozmX1H+gD1Q2U8yd3XjQrE6gbYiokgwagYD9eJCemHl2
   CcG+FnzgdhlDGbLm4S+G4mZ6PLXoAhB8u7ZZ513pBr7nBRsvjklclvALo
   usLGe8JarTBjvMpR+DNHEvwkl85QJnWiS1tA3nR0PZH6nKLI5+31hzYjk
   FsgY7edfUeQ7D5Ze4UOOryaV5FY3cDbg7MCX/87UlSuYMGrsAROxlEA/P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="389694459"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="389694459"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 16:33:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="798177832"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="798177832"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Nov 2023 16:33:56 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0sza-0008L2-1m;
	Thu, 09 Nov 2023 00:33:54 +0000
Date: Thu, 9 Nov 2023 08:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] media: dvb-core: Fix a possible null-pointer dereference
 due to data race in dvbdmx_write()
Message-ID: <202311090845.BlIvG8kE-lkp@intel.com>
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
In-Reply-To: <20231108091300.3124649-1-islituo@gmail.com>
References: <20231108091300.3124649-1-islituo@gmail.com>
TO: Tuo Li <islituo@gmail.com>
TO: mchehab@kernel.org
TO: yongsuyoo0215@gmail.com
CC: linux-media@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: baijiaju1990@outlook.com
CC: Tuo Li <islituo@gmail.com>
CC: BassCheck <bass@buaa.edu.cn>

Hi Tuo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master sailus-media-tree/streams linus/master v6.6 next-20231108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tuo-Li/media-dvb-core-Fix-a-possible-null-pointer-dereference-due-to-data-race-in-dvbdmx_write/20231108-200849
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231108091300.3124649-1-islituo%40gmail.com
patch subject: [PATCH] media: dvb-core: Fix a possible null-pointer dereference due to data race in dvbdmx_write()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-161-20231108 (https://download.01.org/0day-ci/archive/20231109/202311090845.BlIvG8kE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311090845.BlIvG8kE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311090845.BlIvG8kE-lkp@intel.com/

smatch warnings:
drivers/media/dvb-core/dvb_demux.c:1163 dvbdmx_write() warn: inconsistent returns '&dvbdemux->mutex'.

vim +1163 drivers/media/dvb-core/dvb_demux.c

^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1138  
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1139  static int dvbdmx_write(struct dmx_demux *demux, const char __user *buf, size_t count)
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1140  {
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1141  	struct dvb_demux *dvbdemux = (struct dvb_demux *)demux;
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1142  	void *p;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1143  
eebefd4eafaa5d drivers/media/dvb-core/dvb_demux.c     Tuo Li         2023-11-08  1144  	mutex_lock(&dvbdemux->mutex);
eebefd4eafaa5d drivers/media/dvb-core/dvb_demux.c     Tuo Li         2023-11-08  1145  	if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE)) {
eebefd4eafaa5d drivers/media/dvb-core/dvb_demux.c     Tuo Li         2023-11-08  1146  		mutex_unlock(&dvbdemux->mutex);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1147  		return -EINVAL;
eebefd4eafaa5d drivers/media/dvb-core/dvb_demux.c     Tuo Li         2023-11-08  1148  	}
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1149  
c6cfe05532cf6e drivers/media/dvb/dvb-core/dvb_demux.c Julia Lawall   2010-05-22  1150  	p = memdup_user(buf, count);
c6cfe05532cf6e drivers/media/dvb/dvb-core/dvb_demux.c Julia Lawall   2010-05-22  1151  	if (IS_ERR(p))
c6cfe05532cf6e drivers/media/dvb/dvb-core/dvb_demux.c Julia Lawall   2010-05-22  1152  		return PTR_ERR(p);
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1153  	if (mutex_lock_interruptible(&dvbdemux->mutex)) {
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1154  		kfree(p);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1155  		return -ERESTARTSYS;
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1156  	}
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1157  	dvb_dmx_swfilter(dvbdemux, p, count);
947a080037c6ae drivers/media/dvb/dvb-core/dvb_demux.c Al Viro        2008-06-22  1158  	kfree(p);
3593cab5d62c4c drivers/media/dvb/dvb-core/dvb_demux.c Ingo Molnar    2006-02-07  1159  	mutex_unlock(&dvbdemux->mutex);
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1160  
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1161  	if (signal_pending(current))
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1162  		return -EINTR;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16 @1163  	return count;
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1164  }
^1da177e4c3f41 drivers/media/dvb/dvb-core/dvb_demux.c Linus Torvalds 2005-04-16  1165  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

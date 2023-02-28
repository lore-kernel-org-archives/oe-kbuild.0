Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D86A623
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677552978; x=1709088978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FjBket49ptTkrePvysJCq3QAAVGjWDVz5UqQk9VFSdQ=;
  b=hx/KYbUMEao9pKhOHTXX/vRFGIWGHnhca2MSxbw5LsOAd5Q6v/2/2bNC
   M/tY1V5MLOfqN3zH77YRfe4tRzB0XyFpkGNRMfwot0QBQ1jdm9hQ1xaZq
   AY1yeiM43IV/KMKtxlrDA39FPgBPB25lbe2P7o0rhcHk4XvyyxrtIFEak
   y1r4j6HQhXOTTmQTAsYdZEVEyyZkDEotdXii5AFdK2Jl27H3uZvzIh9fQ
   x7ui8hipC0DxxummCnj4kD0/++rGjcZflBO3ynZnk9nxY4PxdTIpIMlcj
   CZUZDZEpRCJ3Sz9JQigRHEE0UG3ux4+Yiv4nIoE2QotEZtoIlEcgKJVuA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313706576"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="313706576"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 18:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1003066795"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="1003066795"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Feb 2023 18:56:14 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWqA1-00051f-1r;
	Tue, 28 Feb 2023 02:56:13 +0000
Date: Tue, 28 Feb 2023 10:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/platform/renesas/rcar_fdp1.c:691:9: warning: use of
 NULL 'job' where non-null expected [CWE-476]
Message-ID: <202302281018.Qsmf87sd-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/media/platform/renesas/rcar_fdp1.c:691:9: warning: use of NULL 'job' where non-null expected [CWE-476] [-Wanalyzer-null-argument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Mauro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   32ff6831cdecd828bd8be9cdfb6c4a3d1feb8f8a
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Renesas drivers on a separate dir
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20230226 (https://download.01.org/0day-ci/archive/20230228/202302281018.Qsmf87sd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302281018.Qsmf87sd-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/media/platform/renesas/rcar_fdp1.c: In function 'fdp1_job_free':
>> drivers/media/platform/renesas/rcar_fdp1.c:691:9: warning: use of NULL 'job' where non-null expected [CWE-476] [-Wanalyzer-null-argument]
     691 |         memset(job, 0, sizeof(struct fdp1_job));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'fdp1_irq_handler': events 1-2
       |
       | 2205 | static irqreturn_t fdp1_irq_handler(int irq, void *dev_id)
       |      |                    ^~~~~~~~~~~~~~~~
       |      |                    |
       |      |                    (1) entry to 'fdp1_irq_handler'
       |......
       | 2242 |         if (!(FD1_CTL_IRQ_MASK & int_status))
       |      |            ~        
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'fdp1_irq_handler': events 3-6
       |
       | 2246 |         if (FD1_CTL_IRQ_VERE & int_status)
       |      |            ~                  
       |      |            |
       |      |            (4) following 'true' branch...
       | 2247 |                 device_frame_end(fdp1, VB2_BUF_STATE_ERROR);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (5) ...to here
       |      |                 (6) calling 'device_frame_end' from 'fdp1_irq_handler'
       |
       +--> 'device_frame_end': events 7-9
              |
              | 1305 | static void device_frame_end(struct fdp1_dev *fdp1,
              |      |             ^~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'device_frame_end'
              |......
              | 1316 |         if (ctx == NULL) {
              |      |            ~ 
              |      |            |
              |      |            (8) following 'false' branch (when 'ctx' is non-NULL)...
              |......
              | 1322 |         ctx->num_processed++;
              |      |         ~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (9) ...to here
              |
            'device_frame_end': event 10
              |
              |include/linux/irqflags.h:163:20:
              |  163 |                 if (unlikely(!arch_irqs_disabled()))    \
              |      |                    ^
              |      |                    |
              |      |                    (10) following 'false' branch...
   include/linux/irqflags.h:183:17: note: in expansion of macro 'raw_check_bogus_irq_restore'
              |  183 |                 raw_check_bogus_irq_restore();          \
              |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:245:39: note: in expansion of macro 'raw_local_irq_restore'
              |  245 | #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } while (0)
              |      |                                       ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:56:8: note: in expansion of macro 'local_irq_restore'
              |   56 |   do { local_irq_restore(flags); __UNLOCK(lock); } while (0)
              |      |        ^~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:86:41: note: in expansion of macro '__UNLOCK_IRQRESTORE'
              |   86 |                                         __UNLOCK_IRQRESTORE(lock, flags)
              |      |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:280:17: note: in expansion of macro '_raw_spin_unlock_irqrestore'
              |  280 |                 _raw_spin_unlock_irqrestore(lock, flags);       \
              |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:404:9: note: in expansion of macro 'raw_spin_unlock_irqrestore'
              |  404 |         raw_spin_unlock_irqrestore(&lock->rlock, flags);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            'device_frame_end': event 11
              |
              |arch/arm/include/asm/irqflags.h:171:9:
              |  171 |         asm volatile(
              |      |         ^~~
              |      |         |
              |      |         (11) ...to here
              |
            'device_frame_end': event 12
              |
              |drivers/media/platform/renesas/rcar_fdp1.c:1339:9:
              | 1339 |         fdp1_job_free(fdp1, job);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (12) calling 'fdp1_job_free' from 'device_frame_end'
              |
              +--> 'fdp1_job_free': events 13-14
                     |
                     |  688 | static void fdp1_job_free(struct fdp1_dev *fdp1, struct fdp1_job *job)
                     |      |             ^~~~~~~~~~~~~
                     |      |             |
                     |      |             (13) entry to 'fdp1_job_free'
                     |......
                     |  691 |         memset(job, 0, sizeof(struct fdp1_job));
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (14) argument 1 ('job') NULL where non-null expected
                     |
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,

vim +/job +691 drivers/media/platform/renesas/rcar_fdp1.c

4710b752e029f3 drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-30  687  
4710b752e029f3 drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-30  688  static void fdp1_job_free(struct fdp1_dev *fdp1, struct fdp1_job *job)
4710b752e029f3 drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-30  689  {
4710b752e029f3 drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-30  690  	/* Ensure that all residue from previous jobs is gone */
4710b752e029f3 drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-30 @691  	memset(job, 0, sizeof(struct fdp1_job));
4710b752e029f3 drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-30  692  
4710b752e029f3 drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-30  693  	list_add_job(fdp1, &fdp1->free_job_list, job);
4710b752e029f3 drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-30  694  }
4710b752e029f3 drivers/media/platform/rcar_fdp1.c Kieran Bingham 2016-06-30  695  

:::::: The code at line 691 was first introduced by commit
:::::: 4710b752e029f3f82dd4a84d9dc61fe72c97bf82 [media] v4l: Add Renesas R-Car FDP1 Driver

:::::: TO: Kieran Bingham <kieran+renesas@bingham.xyz>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88EE640
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Feb 2023 05:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677474743; x=1709010743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/wKz7McwC5dS94zRshz7EyxX7s/q1V5Ol/3COXoFOts=;
  b=At2m9IQALm3xAVX6m1Uetqw5zDzUMiCZAFrwNGKspMKrPQg7XaxjiWX0
   G3rjT1Y3F4k0sUX1bAAM2CmVudgM5U5bKcqlFWQ+OnXotqFJVQ5i/nCue
   zUtpEC8c9TPjCF8jX6r9Kfk3x+ao+X53ESPJdTyFZ2EEVvMQj2+7RlG2I
   Twgf13m6k8Q579o0xCTaZ0CdRv58SMmKTpF6pG12GRZD26jh7gYl2ZAPi
   lgFBC+1kr/u0QJV8ezG33woDx54QxDKMpJkb1RnmC4+VDwnA5t9Z0goXU
   I7WV06mNBs3Qo8YHvhsWKfmhGERI9dWOf6vX3J1e2hO8UHn/+arGs+jGa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="313450944"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="313450944"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 21:12:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="919167038"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="919167038"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Feb 2023 21:12:22 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWVoD-00046h-1s;
	Mon, 27 Feb 2023 05:12:21 +0000
Date: Mon, 27 Feb 2023 13:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/platform/renesas/rcar_fdp1.c:691:9: warning: use of
 NULL 'job' where non-null expected [CWE-476]
Message-ID: <202302271358.rA61yRj9-lkp@intel.com>
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
head:   f3a2439f20d918930cc4ae8f76fe1c1afd26958f
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Renesas drivers on a separate dir
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20230226 (https://download.01.org/0day-ci/archive/20230227/202302271358.rA61yRj9-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202302271358.rA61yRj9-lkp@intel.com/

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

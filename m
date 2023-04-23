Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E13365
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Apr 2023 00:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682209919; x=1713745919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4UrYIOqcjs/A1MAXLdX+2dknRvbe6p4EMtPa7Tz7Jd8=;
  b=nHA/lxwQvJU7l4fM1sWOV5DUM2SFYj8/nZqFNAT3zaiTssfiPS9d8ZRK
   Z6c21NT21s4pZ9hXc5U8BJgYkgHkmHvMV/s1t6B+35YchK+R2ydmDI6w0
   2/beU73xNz1LDcSlVh9euiMIizrdcGII+YwzXpkksjvQCPBryStarGgx5
   19mnoVkZkx9VYqrOZlOkTIc7eYOh/60IveEHvw+vecyfwWy8DoIFKe6Pk
   7juug6LUNrZhZjxa61dXyH/hdQpwAWcbKL/RGYqfHdAAREtXg91jSa6GT
   ifCkCvO+yFU75jSyT5iJtqet+BqjxzLYRGW8eh3jXRi2SnzwnVIUmz3Ji
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="374163482"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="374163482"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 17:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="867063777"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="867063777"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Apr 2023 17:31:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqNe0-000hak-0m;
	Sun, 23 Apr 2023 00:31:56 +0000
Date: Sun, 23 Apr 2023 08:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/udl/udl_main.c:259 udl_get_urb_locked() warn: can
 'unode' even be NULL?
Message-ID: <202304230801.ncoG1XDr-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>
CC: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2caeeb9d4a1bccd923b7918427f9e9ef7151ddd8
commit: c5c354a3a4728045e1342166394c615d75d45377 drm/udl: Fix inconsistent urbs.count value during udl_free_urb_list()
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: parisc-randconfig-m031-20230421 (https://download.01.org/0day-ci/archive/20230423/202304230801.ncoG1XDr-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304230801.ncoG1XDr-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/udl/udl_main.c:259 udl_get_urb_locked() warn: can 'unode' even be NULL?

vim +/unode +259 drivers/gpu/drm/udl/udl_main.c

5320918b9a8786 Dave Airlie  2010-12-15  235  
c5c354a3a47280 Takashi Iwai 2022-09-08  236  static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
5320918b9a8786 Dave Airlie  2010-12-15  237  {
c5c354a3a47280 Takashi Iwai 2022-09-08  238  	struct urb_node *unode;
5320918b9a8786 Dave Airlie  2010-12-15  239  
c5c354a3a47280 Takashi Iwai 2022-09-08  240  	assert_spin_locked(&udl->urbs.lock);
5320918b9a8786 Dave Airlie  2010-12-15  241  
acd45c56790a3b Takashi Iwai 2022-08-04  242  	/* Wait for an in-flight buffer to complete and get re-queued */
acd45c56790a3b Takashi Iwai 2022-08-04  243  	if (!wait_event_lock_irq_timeout(udl->urbs.sleep,
c5c354a3a47280 Takashi Iwai 2022-09-08  244  					 !udl->urbs.count ||
acd45c56790a3b Takashi Iwai 2022-08-04  245  					 !list_empty(&udl->urbs.list),
acd45c56790a3b Takashi Iwai 2022-08-04  246  					 udl->urbs.lock, timeout)) {
acd45c56790a3b Takashi Iwai 2022-08-04  247  		DRM_INFO("wait for urb interrupted: available: %d\n",
acd45c56790a3b Takashi Iwai 2022-08-04  248  			 udl->urbs.available);
c5c354a3a47280 Takashi Iwai 2022-09-08  249  		return NULL;
acd45c56790a3b Takashi Iwai 2022-08-04  250  	}
5320918b9a8786 Dave Airlie  2010-12-15  251  
c5c354a3a47280 Takashi Iwai 2022-09-08  252  	if (!udl->urbs.count)
c5c354a3a47280 Takashi Iwai 2022-09-08  253  		return NULL;
c5c354a3a47280 Takashi Iwai 2022-09-08  254  
acd45c56790a3b Takashi Iwai 2022-08-04  255  	unode = list_first_entry(&udl->urbs.list, struct urb_node, entry);
ed9605a66b62f2 Takashi Iwai 2022-09-08  256  	list_del_init(&unode->entry);
5320918b9a8786 Dave Airlie  2010-12-15  257  	udl->urbs.available--;
5320918b9a8786 Dave Airlie  2010-12-15  258  
acd45c56790a3b Takashi Iwai 2022-08-04 @259  	return unode ? unode->urb : NULL;
5320918b9a8786 Dave Airlie  2010-12-15  260  }
5320918b9a8786 Dave Airlie  2010-12-15  261  

:::::: The code at line 259 was first introduced by commit
:::::: acd45c56790a3b558b0b0081678a20b0a0d89b0f drm/udl: Replace semaphore with a simple wait queue

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB719F
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 11:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679569944; x=1711105944;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0XspN6jdYxGKw49Hw6RA9iM8CvCJDJHLQcrkTinaiSk=;
  b=i5sQOEJs+VIYKeI9fjFtdR+YIY96tXVyqyd3+bRJHhqEGRWDWbFQttYM
   WatLRB7Aa4sgIfRwonKj+ZfE8dpp7T4ZA9u3ugExx3PbK84BiuPdYk6aF
   jJXw0Xp/rnZVNUtvU73WHGelK2eNastc3eOyG4WcxZmzx8/q6V7f1gpFk
   4gVLPK6UW9ClFewFbDsTKME/C3M3WWEkJzc8S6FuXi7QaFpwZviQ8Q3sk
   m5z2BSwSwNnxYV0/gI2QWiCQ0SmgpxpMb6xEaLYNwrnrjqk6sZ5uP0EOQ
   iHmzlFl01gcEBod2EsjMDGlvJb+tB1zK0M2U5KG08rD/qzE4wiRiew52S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323305279"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="323305279"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 04:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632357552"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="632357552"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Mar 2023 04:12:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfIrm-000EH2-1u;
	Thu, 23 Mar 2023 11:12:22 +0000
Date: Thu, 23 Mar 2023 19:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
Message-ID: <202303231841.Yu8ZOXjb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/tty/serial/serial_core.c:3284:25: warning: Parameter 'phys_dev' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230323071051.2184-1-tony@atomide.com>
References: <20230323071051.2184-1-tony@atomide.com>
TO: Tony Lindgren <tony@atomide.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Johan Hovold <johan@kernel.org>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: linux-omap@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org

Hi Tony,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.3-rc3 next-20230323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/serial-core-Start-managing-serial-controllers-to-enable-runtime-PM/20230323-151208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230323071051.2184-1-tony%40atomide.com
patch subject: [PATCH v9 1/1] serial: core: Start managing serial controllers to enable runtime PM
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 3e8323d9a4876c21297e3fe4268d98078fec4065
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303231841.Yu8ZOXjb-lkp@intel.com/

cppcheck warnings: (new ones prefixed by >>)
   drivers/tty/serial/serial_core.c:2574:17: warning: Local variable 'flags' shadows outer variable [shadowVariable]
     unsigned long flags;
                   ^
   drivers/tty/serial/serial_core.c:2550:15: note: Shadowed declaration
    unsigned int flags;
                 ^
   drivers/tty/serial/serial_core.c:2574:17: note: Shadow variable
     unsigned long flags;
                   ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/tty/serial/serial_core.c:3284:25: warning: Parameter 'phys_dev' can be declared as pointer to const [constParameter]
            struct device *phys_dev,
                           ^

vim +/phys_dev +3284 drivers/tty/serial/serial_core.c

^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  3278  
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3279  /*
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3280   * Find a registered serial core controller device if one exists. Returns
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3281   * the first device matching the ctrl_id. Caller must hold port_mutex.
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3282   */
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3283  static struct device *serial_core_ctrl_find(struct uart_driver *drv,
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23 @3284  					    struct device *phys_dev,
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3285  					    int ctrl_id)
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3286  {
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3287  	struct uart_state *state;
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3288  	int i;
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3289  
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3290  	if (ctrl_id < 0)
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3291  		return NULL;
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3292  
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3293  	lockdep_assert_held(&port_mutex);
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3294  
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3295  	for (i = 0; i < drv->nr; i++) {
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3296  		state = drv->state + i;
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3297  		if (!state->uart_port || !state->uart_port->port_dev)
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3298  			continue;
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3299  
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3300  		if (state->uart_port->dev == phys_dev &&
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3301  		    state->uart_port->ctrl_id == ctrl_id)
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3302  			return state->uart_port->port_dev->parent;
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3303  	}
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3304  
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3305  	return NULL;
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3306  }
3e8323d9a4876c drivers/tty/serial/serial_core.c Tony Lindgren  2023-03-23  3307  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

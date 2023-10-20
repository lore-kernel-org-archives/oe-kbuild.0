Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8FF179A2
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Oct 2023 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3MavxWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697798225; x=1729334225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=phfkrV+AL+Ga2aZhf+mE3IZTnimnCFmqb08Uml51hiE=;
  b=k3MavxWz4W+psbLi1d2zXV/OnR01SFw7SeAircJqod7OMrErO7Apar2E
   pqzUBVFMZs8VyNTl6qUy9DM+mHcOV0OZG0Glt8rn4KbmLota1yGQX+zlW
   DBTtekojNqiqiWfcc8XmdEMANyAPAXthzqIGXZiR55V1IxRZtfvVS5jj+
   hUW/eaUt+RTmvZghNNdvaeN4wClDNE4TiMNhtP9PT3tZpzbcK884bNpFR
   uRjbIG/5VpD7fdL4rR4nogVBVuTZTVR9FjoKceUnMuAbe1yIgVHC5HR0+
   2Afv9E8YKCDOmAdvqVrOPIiFM0Uk5X28Eej22uXtXV23CY0owIp32noWK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385349886"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="385349886"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 03:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="901111489"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="901111489"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2023 03:34:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtmsH-0003OW-1x;
	Fri, 20 Oct 2023 10:37:01 +0000
Date: Fri, 20 Oct 2023 18:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/5] i3c: add slave mode support
Message-ID: <202310201829.Hgq2x9nm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231018215809.3477437-2-Frank.Li@nxp.com>
References: <20231018215809.3477437-2-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: miquel.raynal@bootlin.com
TO: conor.culhane@silvaco.com
TO: alexandre.belloni@bootlin.com
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: corbet@lwn.net
TO: joe@perches.com
TO: Frank.Li@nxp.com
TO: linux-i3c@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: gregkh@linuxfoundation.org
CC: imx@lists.linux.dev
CC: jirislaby@kernel.org
CC: linux-serial@vger.kernel.org

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-slave-mode-support/20231019-055940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231018215809.3477437-2-Frank.Li%40nxp.com
patch subject: [PATCH 1/5] i3c: add slave mode support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310201829.Hgq2x9nm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201829.Hgq2x9nm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310201829.Hgq2x9nm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/slave.c:166: warning: Function parameter or member 'ctrl' not described in 'devm_i3c_slave_ctrl_destroy'
>> drivers/i3c/slave.c:166: warning: Excess function parameter 'ops' description in 'devm_i3c_slave_ctrl_destroy'
>> drivers/i3c/slave.c:166: warning: Excess function parameter 'owner' description in 'devm_i3c_slave_ctrl_destroy'
>> drivers/i3c/slave.c:228: warning: expecting prototype for i3c_slave_ctrl(). Prototype was for i3c_slave_ctrl_get() instead
>> drivers/i3c/slave.c:420: warning: Function parameter or member 'fd' not described in 'i3c_slave_func_unregister_driver'
>> drivers/i3c/slave.c:420: warning: Excess function parameter 'driver' description in 'i3c_slave_func_unregister_driver'


vim +166 drivers/i3c/slave.c

a63b2858bd837d Frank Li 2023-10-18  154  
a63b2858bd837d Frank Li 2023-10-18  155  /**
a63b2858bd837d Frank Li 2023-10-18  156   * devm_i3c_slave_ctrl_destroy() - destroy the slave controller device
a63b2858bd837d Frank Li 2023-10-18  157   * @dev: device that is creating the new slave controller device
a63b2858bd837d Frank Li 2023-10-18  158   * @ops: function pointers for performing slave controller operations
a63b2858bd837d Frank Li 2023-10-18  159   * @owner: the owner of the module that creates the slave controller device
a63b2858bd837d Frank Li 2023-10-18  160   *
a63b2858bd837d Frank Li 2023-10-18  161   * Invoke to create a new slave controller device and add it to i3c_slave class. While at that, it
a63b2858bd837d Frank Li 2023-10-18  162   * also associates the device with the i3c_slave using devres. On driver detach, release function is
a63b2858bd837d Frank Li 2023-10-18  163   * invoked on the devres data, then devres data is freed.
a63b2858bd837d Frank Li 2023-10-18  164   */
a63b2858bd837d Frank Li 2023-10-18  165  void devm_i3c_slave_ctrl_destroy(struct device *dev, struct i3c_slave_ctrl *ctrl)
a63b2858bd837d Frank Li 2023-10-18 @166  {
a63b2858bd837d Frank Li 2023-10-18  167  	int r;
a63b2858bd837d Frank Li 2023-10-18  168  
a63b2858bd837d Frank Li 2023-10-18  169  	r = devres_destroy(dev, devm_i3c_slave_ctrl_release, devm_i3c_slave_ctrl_match,
a63b2858bd837d Frank Li 2023-10-18  170  			   ctrl);
a63b2858bd837d Frank Li 2023-10-18  171  	dev_WARN_ONCE(dev, r, "couldn't find I3C controller resource\n");
a63b2858bd837d Frank Li 2023-10-18  172  }
a63b2858bd837d Frank Li 2023-10-18  173  EXPORT_SYMBOL_GPL(devm_i3c_slave_ctrl_destroy);
a63b2858bd837d Frank Li 2023-10-18  174  
a63b2858bd837d Frank Li 2023-10-18  175  /**
a63b2858bd837d Frank Li 2023-10-18  176   * i3c_slave_ctrl_destroy() - destroy the slave controller device
a63b2858bd837d Frank Li 2023-10-18  177   * @ctrl: the slave controller device that has to be destroyed
a63b2858bd837d Frank Li 2023-10-18  178   *
a63b2858bd837d Frank Li 2023-10-18  179   * Invoke to destroy the I3C slave device
a63b2858bd837d Frank Li 2023-10-18  180   */
a63b2858bd837d Frank Li 2023-10-18  181  void i3c_slave_ctrl_destroy(struct i3c_slave_ctrl *ctrl)
a63b2858bd837d Frank Li 2023-10-18  182  {
a63b2858bd837d Frank Li 2023-10-18  183  	i3c_slave_cfs_remove_ctrl_group(ctrl->group);
a63b2858bd837d Frank Li 2023-10-18  184  	device_unregister(&ctrl->dev);
a63b2858bd837d Frank Li 2023-10-18  185  }
a63b2858bd837d Frank Li 2023-10-18  186  EXPORT_SYMBOL_GPL(i3c_slave_ctrl_destroy);
a63b2858bd837d Frank Li 2023-10-18  187  
a63b2858bd837d Frank Li 2023-10-18  188  /**
a63b2858bd837d Frank Li 2023-10-18  189   * i3c_slave_ctrl_add_func() - bind I3C slave function to an slave controller
a63b2858bd837d Frank Li 2023-10-18  190   * @ctrl: the controller device to which the slave function should be added
a63b2858bd837d Frank Li 2023-10-18  191   * @func: the slave function to be added
a63b2858bd837d Frank Li 2023-10-18  192   *
a63b2858bd837d Frank Li 2023-10-18  193   * An I3C slave device can have only one functions.
a63b2858bd837d Frank Li 2023-10-18  194   */
a63b2858bd837d Frank Li 2023-10-18  195  int i3c_slave_ctrl_add_func(struct i3c_slave_ctrl *ctrl, struct i3c_slave_func *func)
a63b2858bd837d Frank Li 2023-10-18  196  {
a63b2858bd837d Frank Li 2023-10-18  197  	if (ctrl->func)
a63b2858bd837d Frank Li 2023-10-18  198  		return -EBUSY;
a63b2858bd837d Frank Li 2023-10-18  199  
a63b2858bd837d Frank Li 2023-10-18  200  	ctrl->func = func;
a63b2858bd837d Frank Li 2023-10-18  201  	func->ctrl = ctrl;
a63b2858bd837d Frank Li 2023-10-18  202  
a63b2858bd837d Frank Li 2023-10-18  203  	return 0;
a63b2858bd837d Frank Li 2023-10-18  204  }
a63b2858bd837d Frank Li 2023-10-18  205  EXPORT_SYMBOL_GPL(i3c_slave_ctrl_add_func);
a63b2858bd837d Frank Li 2023-10-18  206  
a63b2858bd837d Frank Li 2023-10-18  207  /**
a63b2858bd837d Frank Li 2023-10-18  208   * i3c_slave_ctrl_remove_func() - unbind I3C slave function to an slave controller
a63b2858bd837d Frank Li 2023-10-18  209   * @ctrl: the controller device to which the slave function should be removed
a63b2858bd837d Frank Li 2023-10-18  210   * @func: the slave function to be removed
a63b2858bd837d Frank Li 2023-10-18  211   *
a63b2858bd837d Frank Li 2023-10-18  212   * An I3C slave device can have only one functions.
a63b2858bd837d Frank Li 2023-10-18  213   */
a63b2858bd837d Frank Li 2023-10-18  214  void i3c_slave_ctrl_remove_func(struct i3c_slave_ctrl *ctrl, struct i3c_slave_func *func)
a63b2858bd837d Frank Li 2023-10-18  215  {
a63b2858bd837d Frank Li 2023-10-18  216  	ctrl->func = NULL;
a63b2858bd837d Frank Li 2023-10-18  217  }
a63b2858bd837d Frank Li 2023-10-18  218  EXPORT_SYMBOL_GPL(i3c_slave_ctrl_remove_func);
a63b2858bd837d Frank Li 2023-10-18  219  
a63b2858bd837d Frank Li 2023-10-18  220  /**
a63b2858bd837d Frank Li 2023-10-18  221   * i3c_slave_ctrl() - get the I3C slave controller
a63b2858bd837d Frank Li 2023-10-18  222   * @name: device name of the slave controller
a63b2858bd837d Frank Li 2023-10-18  223   *
a63b2858bd837d Frank Li 2023-10-18  224   * Invoke to get struct i3c_slave_ctrl * corresponding to the device name of the
a63b2858bd837d Frank Li 2023-10-18  225   * slave controller
a63b2858bd837d Frank Li 2023-10-18  226   */
a63b2858bd837d Frank Li 2023-10-18  227  struct i3c_slave_ctrl *i3c_slave_ctrl_get(const char *name)
a63b2858bd837d Frank Li 2023-10-18 @228  {
a63b2858bd837d Frank Li 2023-10-18  229  	int ret = -EINVAL;
a63b2858bd837d Frank Li 2023-10-18  230  	struct i3c_slave_ctrl *ctrl;
a63b2858bd837d Frank Li 2023-10-18  231  	struct device *dev;
a63b2858bd837d Frank Li 2023-10-18  232  	struct class_dev_iter iter;
a63b2858bd837d Frank Li 2023-10-18  233  
a63b2858bd837d Frank Li 2023-10-18  234  	class_dev_iter_init(&iter, i3c_slave_ctrl_class, NULL, NULL);
a63b2858bd837d Frank Li 2023-10-18  235  	while ((dev = class_dev_iter_next(&iter))) {
a63b2858bd837d Frank Li 2023-10-18  236  		if (strcmp(name, dev_name(dev)))
a63b2858bd837d Frank Li 2023-10-18  237  			continue;
a63b2858bd837d Frank Li 2023-10-18  238  
a63b2858bd837d Frank Li 2023-10-18  239  		ctrl = to_i3c_slave_ctrl(dev);
a63b2858bd837d Frank Li 2023-10-18  240  		if (!try_module_get(ctrl->ops->owner)) {
a63b2858bd837d Frank Li 2023-10-18  241  			ret = -EINVAL;
a63b2858bd837d Frank Li 2023-10-18  242  			goto err;
a63b2858bd837d Frank Li 2023-10-18  243  		}
a63b2858bd837d Frank Li 2023-10-18  244  
a63b2858bd837d Frank Li 2023-10-18  245  		class_dev_iter_exit(&iter);
a63b2858bd837d Frank Li 2023-10-18  246  		get_device(&ctrl->dev);
a63b2858bd837d Frank Li 2023-10-18  247  		return ctrl;
a63b2858bd837d Frank Li 2023-10-18  248  	}
a63b2858bd837d Frank Li 2023-10-18  249  
a63b2858bd837d Frank Li 2023-10-18  250  err:
a63b2858bd837d Frank Li 2023-10-18  251  	class_dev_iter_exit(&iter);
a63b2858bd837d Frank Li 2023-10-18  252  	return ERR_PTR(ret);
a63b2858bd837d Frank Li 2023-10-18  253  }
a63b2858bd837d Frank Li 2023-10-18  254  EXPORT_SYMBOL_GPL(i3c_slave_ctrl_get);
a63b2858bd837d Frank Li 2023-10-18  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

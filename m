Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E2225779
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 05:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496492; cv=none; b=jR/HDpyfc2TTXWl4noWQHuYxgFuqmEMF852qHrcxCqQKpkb6VifHgwoj+ZbAvYArRtbtWZ/RexPEHQrIqTOMfw9cLkXR8MlMub3wz4P7Il4a7YowraoR2k7iFt/M6/IejHwYkyz498K7mxKUaQE3cVRAZms7XaHtWqufTeGjlGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496492; c=relaxed/simple;
	bh=6lRGrLxKG22LvrDzn/SxfZolye6KlNSraDigG+KXb+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9I+srv+Szmuw8iZgMTnd/WAmqMTwm8BbESRbwNy94h6aBOEICx4IDxgSp/WwxLQ93PaGCFbjFEo0dIOlidNan8gQZuZ6MV3NE8fzwgwmpj8JA1ty/gqFQwThRbWXO4XMERALLpyPOLcfT78kdOxo2EeJtesgGxDYxvz4EoqA8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INv3vKvj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INv3vKvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755496491; x=1787032491;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6lRGrLxKG22LvrDzn/SxfZolye6KlNSraDigG+KXb+Q=;
  b=INv3vKvjhp36PKpSHLLCAUlsJVa8w5eSPzLD8O2s0+HAoQeYzv2Zrmus
   HTVHnUUODrgNbs7M/mVLHaOSpNBiqOkFxfCu33IBa5/uFF3Fs6QVxMbhI
   f3HexKYGCd2xytTX3kUki4Mv6MvcHaYg7+cVrs0Gw8eNZ79IURwTkGbqj
   CeVjwbmDnYYAGWJA3rNmWQm6BTLu+lKtE0bWhaRKPzUUbdZcmcuZnPKLW
   BF5bYUu0lW9VttRH7E1NjXqLYM0Go9L6bQG1JvBrwNjfIigkKZA8n/MX8
   2SOyMw4ucS8Kv9LXYlxsytNy6IFH4E3k0k0ChrSrNE2ZtlFErMHttvJ48
   g==;
X-CSE-ConnectionGUID: 5XWiazXAR66ikiDkIxxWSQ==
X-CSE-MsgGUID: /9K3EFSuR+60YBG2gdxlqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="75165903"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="75165903"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 22:54:50 -0700
X-CSE-ConnectionGUID: 5hE0J/hFSPyMo77l4f6mIQ==
X-CSE-MsgGUID: 1Qegs6GcTlqOC98sfRF5wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171923014"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Aug 2025 22:54:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unsng-000DxP-0B;
	Mon, 18 Aug 2025 05:53:17 +0000
Date: Mon, 18 Aug 2025 13:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH WIP v2] i2c: add tracepoints to aid debugging in
 i2c-core-base
Message-ID: <202508181525.GKAXMVYv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>
References: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>
TO: Mohammad Gomaa <midomaxgomaa@gmail.com>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
TO: Steven Rostedt <rostedt@goodmis.org>
TO: Masami Hiramatsu <mhiramat@kernel.org>
TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-trace-kernel@vger.kernel.org
CC: kenalba@google.com
CC: hbarnor@chromium.org
CC: rayxu@google.com
CC: Mohammad Gomaa <midomaxgomaa@gmail.com>

Hi Mohammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7e161a991ea71e6ec526abc8f40c6852ebe3d946]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammad-Gomaa/i2c-add-tracepoints-to-aid-debugging-in-i2c-core-base/20250817-155936
base:   7e161a991ea71e6ec526abc8f40c6852ebe3d946
patch link:    https://lore.kernel.org/r/20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e%40gmail.com
patch subject: [PATCH WIP v2] i2c: add tracepoints to aid debugging in i2c-core-base
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-161-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181525.GKAXMVYv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508181525.GKAXMVYv-lkp@intel.com/

smatch warnings:
drivers/i2c/i2c-core-base.c:535 i2c_device_probe() error: uninitialized symbol 'err_reason'.

vim +/err_reason +535 drivers/i2c/i2c-core-base.c

4d5538f5882a6b6 drivers/i2c/i2c-core.c      Benjamin Tissoires       2016-10-13  490  
f37dd80ac2a67e4 drivers/i2c/i2c-core.c      David Brownell           2007-02-13  491  static int i2c_device_probe(struct device *dev)
^1da177e4c3f415 drivers/i2c/i2c-core.c      Linus Torvalds           2005-04-16  492  {
5763a474c887d4a drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  493  	struct fwnode_handle	*fwnode = dev_fwnode(dev);
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  494  	struct i2c_client	*client = i2c_verify_client(dev);
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  495  	struct i2c_driver	*driver;
79ece9b292af6b0 drivers/i2c/i2c-core-base.c Ricardo Ribalda          2022-11-14  496  	bool do_power_on;
50c3304a5e1e521 drivers/i2c/i2c-core.c      Hans Verkuil             2008-03-12  497  	int status;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  498  	int err_reason;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  499  	bool has_id_table, has_acpi_match, has_of_match;
7b4fbc50fabb810 drivers/i2c/i2c-core.c      David Brownell           2007-05-01  500  
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  501  	if (!client)
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  502  		return 0;
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  503  
6e76cb7dfd34a2e drivers/i2c/i2c-core-base.c Charles Keepax           2019-06-27  504  	client->irq = client->init_irq;
6e76cb7dfd34a2e drivers/i2c/i2c-core-base.c Charles Keepax           2019-06-27  505  
0c2a34937f7e4c4 drivers/i2c/i2c-core-base.c Wolfram Sang             2020-06-30  506  	if (!client->irq) {
845c877009cf014 drivers/i2c/i2c-core.c      Mika Westerberg          2015-05-06  507  		int irq = -ENOENT;
845c877009cf014 drivers/i2c/i2c-core.c      Mika Westerberg          2015-05-06  508  
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  509  		if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  510  			dev_dbg(dev, "Using Host Notify IRQ\n");
72bfcee11cf8950 drivers/i2c/i2c-core-base.c Jarkko Nikula            2019-04-30  511  			/* Keep adapter active when Host Notify is required */
72bfcee11cf8950 drivers/i2c/i2c-core-base.c Jarkko Nikula            2019-04-30  512  			pm_runtime_get_sync(&client->adapter->dev);
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  513  			irq = i2c_smbus_host_notify_to_irq(client);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  514  			err_reason = I2C_TRACE_REASON_HOST_NOTIFY;
5763a474c887d4a drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  515  		} else if (is_of_node(fwnode)) {
5d9424b00b577b6 drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  516  			irq = fwnode_irq_get_byname(fwnode, "irq");
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  517  			if (irq == -EINVAL || irq == -ENODATA)
5d9424b00b577b6 drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  518  				irq = fwnode_irq_get(fwnode, 0);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  519  			err_reason = I2C_TRACE_REASON_FROM_OF;
5763a474c887d4a drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  520  		} else if (is_acpi_device_node(fwnode)) {
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  521  			bool wake_capable;
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  522  
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  523  			irq = i2c_acpi_get_irq(client, &wake_capable);
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  524  			if (irq > 0 && wake_capable)
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  525  				client->flags |= I2C_CLIENT_WAKE;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  526  			err_reason = I2C_TRACE_REASON_FROM_ACPI;
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  527  		}
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  528  		if (irq == -EPROBE_DEFER) {
5c52473b4496b35 drivers/i2c/i2c-core-base.c Xu Yang                  2025-05-07  529  			status = dev_err_probe(dev, irq, "can't get irq\n");
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  530  			err_reason = I2C_TRACE_REASON_EPROBE_DEFER_IRQ;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  531  			goto put_sync_adapter;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  532  		}
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  533  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  534  		if (irq < 0) {
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17 @535  			trace_i2c_device_probe_debug(dev, err_reason);
6f34be7400c68d3 drivers/i2c/i2c-core.c      Geert Uytterhoeven       2014-11-17  536  			irq = 0;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  537  		}
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  538  
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  539  		client->irq = irq;
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  540  	}
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  541  
0c2a34937f7e4c4 drivers/i2c/i2c-core-base.c Wolfram Sang             2020-06-30  542  	driver = to_i2c_driver(dev->driver);
0c2a34937f7e4c4 drivers/i2c/i2c-core-base.c Wolfram Sang             2020-06-30  543  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  544  	has_id_table = driver->id_table;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  545  	has_acpi_match = acpi_driver_match_device(dev, dev->driver);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  546  	has_of_match = i2c_of_match_device(dev->driver->of_match_table, client);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  547  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  548  	if (!has_id_table)
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  549  		trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_NO_I2C_ID_TABLE);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  550  	if (!has_acpi_match)
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  551  		trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_ACPI_ID_MISMATCH);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  552  	if (!has_of_match)
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  553  		trace_i2c_device_probe_debug(dev, I2C_TRACE_REASON_OF_ID_MISMATCH);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  554  
da10c06a044b375 drivers/i2c/i2c-core.c      Lee Jones                2016-11-07  555  	/*
f4b17a14faeec41 drivers/i2c/i2c-core-base.c Javier Martinez Canillas 2017-08-09  556  	 * An I2C ID table is not mandatory, if and only if, a suitable OF
f4b17a14faeec41 drivers/i2c/i2c-core-base.c Javier Martinez Canillas 2017-08-09  557  	 * or ACPI ID table is supplied for the probing device.
da10c06a044b375 drivers/i2c/i2c-core.c      Lee Jones                2016-11-07  558  	 */
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  559  	if (!has_id_table && !has_acpi_match && !has_of_match) {
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  560  		status = -ENODEV;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  561  		err_reason = I2C_TRACE_REASON_NO_ID_MATCH;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  562  		goto put_sync_adapter;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  563  	}
0acc2b321342aa8 drivers/i2c/i2c-core.c      Lars-Peter Clausen       2013-09-29  564  
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  565  	if (client->flags & I2C_CLIENT_WAKE) {
3e99834cc0c7f06 drivers/i2c/i2c-core-base.c Andy Shevchenko          2019-07-26  566  		int wakeirq;
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  567  
5d9424b00b577b6 drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  568  		wakeirq = fwnode_irq_get_byname(fwnode, "wakeup");
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  569  		if (wakeirq == -EPROBE_DEFER) {
5c52473b4496b35 drivers/i2c/i2c-core-base.c Xu Yang                  2025-05-07  570  			status = dev_err_probe(dev, wakeirq, "can't get wakeirq\n");
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  571  			err_reason = I2C_TRACE_REASON_EPROBE_DEFER_WAKEIRQ;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  572  			goto put_sync_adapter;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  573  		}
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  574  
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  575  		device_init_wakeup(&client->dev, true);
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  576  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  577  		if (wakeirq > 0 && wakeirq != client->irq) {
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  578  			status = dev_pm_set_dedicated_wake_irq(dev, wakeirq);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  579  			err_reason = I2C_TRACE_REASON_SET_DED_WAKE_FAILED;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  580  		} else if (client->irq > 0) {
c18fba23061f16d drivers/i2c/i2c-core.c      Grygorii Strashko        2015-11-12  581  			status = dev_pm_set_wake_irq(dev, client->irq);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  582  			err_reason = I2C_TRACE_REASON_SET_WAKE_FAILED;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  583  		} else {
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  584  			status = 0;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  585  			err_reason = I2C_TRACE_REASON_NO_IRQ;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  586  		}
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  587  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  588  		if (status) {
b93d3d373924670 drivers/i2c/i2c-core.c      Andy Shevchenko          2016-08-25  589  			dev_warn(&client->dev, "failed to set up wakeup irq\n");
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  590  			trace_i2c_device_probe_debug(&client->dev, err_reason);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  591  		}
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  592  	}
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  593  
7b4fbc50fabb810 drivers/i2c/i2c-core.c      David Brownell           2007-05-01  594  	dev_dbg(dev, "probe\n");
d2653e92732bd39 drivers/i2c/i2c-core.c      Jean Delvare             2008-04-29  595  
3435b7f0fd28b9c drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  596  	status = of_clk_set_defaults(to_of_node(fwnode), false);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  597  	if (status < 0) {
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  598  		err_reason = I2C_TRACE_REASON_SET_DEF_CLOCKS;
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  599  		goto err_clear_wakeup_irq;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  600  	}
79ece9b292af6b0 drivers/i2c/i2c-core-base.c Ricardo Ribalda          2022-11-14  601  	do_power_on = !i2c_acpi_waive_d0_probe(dev);
d42c7c6fd66a6e2 drivers/i2c/i2c-core-base.c Claudiu Beznea           2025-07-03  602  	status = dev_pm_domain_attach(&client->dev, do_power_on ? PD_FLAG_ATTACH_POWER_ON : 0);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  603  	if (status) {
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  604  		err_reason = I2C_TRACE_REASON_ATTACH_PM_DOMAIN;
74cedd30522819d drivers/i2c/i2c-core.c      Kieran Bingham           2015-10-12  605  		goto err_clear_wakeup_irq;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  606  	}
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  607  	client->devres_group_id = devres_open_group(&client->dev, NULL,
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  608  						    GFP_KERNEL);
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  609  	if (!client->devres_group_id) {
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  610  		status = -ENOMEM;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  611  		err_reason = I2C_TRACE_REASON_OPEN_DEVRES_GROUP;
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  612  		goto err_detach_pm_domain;
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  613  	}
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  614  
6250ebe666e425e drivers/i2c/i2c-core-base.c Guenter Roeck            2025-01-25  615  	client->debugfs = debugfs_create_dir(dev_name(&client->dev),
6250ebe666e425e drivers/i2c/i2c-core-base.c Guenter Roeck            2025-01-25  616  					     client->adapter->debugfs);
6250ebe666e425e drivers/i2c/i2c-core-base.c Guenter Roeck            2025-01-25  617  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  618  	if (driver->probe) {
03c835f498b5400 drivers/i2c/i2c-core-base.c Uwe Kleine-König         2023-02-26  619  		status = driver->probe(client);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  620  		err_reason = I2C_TRACE_REASON_PROBE_FAILED;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  621  	} else {
b8a1a4cd5a98a2a drivers/i2c/i2c-core.c      Lee Jones                2016-11-07  622  		status = -EINVAL;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  623  		err_reason = I2C_TRACE_REASON_NO_PROBE;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  624  	}
b8a1a4cd5a98a2a drivers/i2c/i2c-core.c      Lee Jones                2016-11-07  625  
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  626  	/*
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  627  	 * Note that we are not closing the devres group opened above so
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  628  	 * even resources that were attached to the device after probe is
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  629  	 * run are released when i2c_device_remove() is executed. This is
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  630  	 * needed as some drivers would allocate additional resources,
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  631  	 * for example when updating firmware.
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  632  	 */
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  633  
72fa818e8a3145a drivers/i2c/i2c-core.c      Wolfram Sang             2014-01-21  634  	if (status)
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  635  		goto err_release_driver_resources;
72fa818e8a3145a drivers/i2c/i2c-core.c      Wolfram Sang             2014-01-21  636  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  637  	trace_i2c_device_probe_complete(&client->dev, status, err_reason);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  638  
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  639  	return 0;
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  640  
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  641  err_release_driver_resources:
6250ebe666e425e drivers/i2c/i2c-core-base.c Guenter Roeck            2025-01-25  642  	debugfs_remove_recursive(client->debugfs);
5b5475826c5265c drivers/i2c/i2c-core-base.c Dmitry Torokhov          2021-03-21  643  	devres_release_group(&client->dev, client->devres_group_id);
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  644  err_detach_pm_domain:
79ece9b292af6b0 drivers/i2c/i2c-core-base.c Ricardo Ribalda          2022-11-14  645  	dev_pm_domain_detach(&client->dev, do_power_on);
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  646  err_clear_wakeup_irq:
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  647  	dev_pm_clear_wake_irq(&client->dev);
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  648  	device_init_wakeup(&client->dev, false);
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  649  put_sync_adapter:
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  650  	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  651  		pm_runtime_put_sync(&client->adapter->dev);
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  652  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  653  	trace_i2c_device_probe_complete(&client->dev, status, err_reason);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  654  
50c3304a5e1e521 drivers/i2c/i2c-core.c      Hans Verkuil             2008-03-12  655  	return status;
f37dd80ac2a67e4 drivers/i2c/i2c-core.c      David Brownell           2007-02-13  656  }
^1da177e4c3f415 drivers/i2c/i2c-core.c      Linus Torvalds           2005-04-16  657  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

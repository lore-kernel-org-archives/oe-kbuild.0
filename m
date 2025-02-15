Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092F21624F8
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Feb 2025 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739581422; cv=none; b=k5vlHWFEVnFvPyDqzusP7G99F1bIAbXcs4lvgeZoNLwuYBwGXiuNWX73KnXRtfT8vbYzU7YDUXLQeb0Rq62568dDIwvoGOskz8cCY+39sCIhrguR9UCyJWOWCPJUiWY9nZPFfxSISY6QDwuBaCyCjpEjbCsG6wp74kaf7zsIkNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739581422; c=relaxed/simple;
	bh=ha1i/qPi7VFVc5pp1miB5euYzi2uJAm7/7558HoCyLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PrpdvbNscJ9syIzY0Fm+/4Esa5TjNkaBYlsE0TD2fIy4rsxbcNE8OhtIdXTTjVYIhg36WCwXjRHWpSo+m2jgxpdNjmg0EHvZbt5mOpXzkrlHrPwJ9gc5oJm9nfMBtqIdhMtfqGeZSzWLOfr7tRVRLnVTV7zGSoTcx9XReHQKPHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+EgJS/y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+EgJS/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739581420; x=1771117420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ha1i/qPi7VFVc5pp1miB5euYzi2uJAm7/7558HoCyLQ=;
  b=B+EgJS/y0X1lzMGxFUx/YvEtVBTO3AX2KhzcnhbQ8MowSrU5T2oSwiom
   WOzeGwqLiTBz9bWl+lJ1rlAgd7fKczGXe794yy6zq/bfEbC21HWPg4Z3V
   NmpFCsAExt/L2yL+67qNh/QYQ9ZvkQcjh1k2H5eUl6WBbpOC4Hie3vo8j
   Mcwz3UpH07KizFLISRIF/MKnAOdPQUGoI6j8H7KpqHYypZMOrZGbUaLjy
   P2dKuIqtIL6xPothDVhhIU/MnhKPdVbMIWnFSNEKFJi0SCptPjTPfjETB
   p2nLNdhaZDSGdIdeNsGScnt7DNGg4jnapJNPiaklN15dfWd/o33iNE1GW
   g==;
X-CSE-ConnectionGUID: eDU4oSM1SMWM8gDGSQRgQw==
X-CSE-MsgGUID: cY4I+gE/Sy+nxSjYGXqjSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39574707"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="39574707"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 17:03:39 -0800
X-CSE-ConnectionGUID: vIQpx38oR2muaRgT+F438g==
X-CSE-MsgGUID: QNpIPv/+RcaNwpj+MFQkpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="113460864"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2025 17:03:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj6am-001ALz-0L;
	Sat, 15 Feb 2025 01:03:36 +0000
Date: Sat, 15 Feb 2025 09:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub
 device
Message-ID: <202502150815.xfIJk1kS-lkp@intel.com>
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
In-Reply-To: <20250212132227.1348374-2-aman.kumarpandey@nxp.com>
References: <20250212132227.1348374-2-aman.kumarpandey@nxp.com>
TO: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
TO: linux-kernel@vger.kernel.org
TO: linux-i3c@lists.infradead.org
TO: alexandre.belloni@bootlin.com
TO: krzk+dt@kernel.org
TO: robh@kernel.org
TO: conor+dt@kernel.org
TO: devicetree@vger.kernel.org
CC: vikash.bansal@nxp.com
CC: priyanka.jain@nxp.com
CC: shashank.rebbapragada@nxp.com
CC: Frank.Li@nxp.com
CC: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Hi Aman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250212-213659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250212132227.1348374-2-aman.kumarpandey%40nxp.com
patch subject: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub device
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r073-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150815.xfIJk1kS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502150815.xfIJk1kS-lkp@intel.com/

smatch warnings:
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:370 p3h2x4x_of_get_tp_dt_conf() warn: potential spectre issue 'priv->tp_bus' [w] (local cap)
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:410 p3h2x4x_read_backend_from_p3h2x4x_dts() warn: potential spectre issue 'priv->tp_bus' [w] (local cap)
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:412 p3h2x4x_read_backend_from_p3h2x4x_dts() error: buffer overflow 'priv->settings.tp' 8 <= 8 user_rl='0-8'
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:510 p3h2x4x_get_tp_of_get_setting() warn: potential spectre issue 'tp_setting' [w] (local cap)
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:572 p3h2x4x_of_get_p3h2x4x_conf() warn: inconsistent indenting
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:771 p3h2x4x_device_remove_i3c() error: dereferencing freed memory 'backend' (line 775)
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c:902 p3h2x4x_device_remove_i2c() error: dereferencing freed memory 'backend' (line 904)
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:80 p3h2x4x_read_smbus_agent_rx_buf() error: uninitialized symbol 'flag_clear'.
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:460 p3h2x4x_tp_smbus_xfer_msg() error: uninitialized symbol 'write_length'.
drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:461 p3h2x4x_tp_smbus_xfer_msg() error: uninitialized symbol 'read_length'.

vim +370 drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_common.c

5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  356  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  357  static void p3h2x4x_of_get_tp_dt_conf(struct device *dev,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  358  					const struct device_node *node)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  359  {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  360  	struct p3h2x4x *priv = dev_get_drvdata(dev);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  361  	struct device_node *dev_node;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  362  	int tp_port;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  363  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  364  	for_each_available_child_of_node(node, dev_node) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  365  		if (!dev_node->full_name ||
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  366  			(sscanf(dev_node->full_name, "target-port@%d", &tp_port) != 1))
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  367  			continue;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  368  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  369  		if (tp_port < P3H2x4x_TP_MAX_COUNT) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12 @370  			priv->tp_bus[tp_port].dt_available = true;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  371  			priv->tp_bus[tp_port].of_node = dev_node;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  372  			priv->tp_bus[tp_port].tp_mask = BIT(tp_port);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  373  			priv->tp_bus[tp_port].priv = priv;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  374  			priv->tp_bus[tp_port].tp_port = tp_port;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  375  		}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  376  	}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  377  }
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  378  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  379  /* return true when backend node exist */
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  380  static bool p3h2x4x_is_backend_node_exist(int port, struct p3h2x4x *priv, u32 addr)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  381  {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  382  	struct smbus_device *backend = NULL;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  383  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  384  	list_for_each_entry(backend,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  385  			&priv->tp_bus[port].tp_device_entry, list) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  386  		if (backend->addr == addr)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  387  			return true;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  388  	}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  389  	return false;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  390  }
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  391  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  392  static int p3h2x4x_read_backend_from_p3h2x4x_dts(struct device_node *i3c_node_target,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  393  					struct p3h2x4x *priv)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  394  {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  395  	struct device_node *i3c_node_tp;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  396  	const char *compatible;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  397  	int tp_port, ret;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  398  	u32 addr_dts;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  399  	struct smbus_device *backend;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  400  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  401  	if (sscanf(i3c_node_target->full_name, "target-port@%d", &tp_port) == 0)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  402  		return -EINVAL;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  403  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  404  	if (tp_port > P3H2x4x_TP_MAX_COUNT)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  405  		return -ERANGE;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  406  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  407  	if (tp_port < 0)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  408  		return -EINVAL;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  409  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12 @410  	INIT_LIST_HEAD(&priv->tp_bus[tp_port].tp_device_entry);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  411  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12 @412  	if (priv->settings.tp[tp_port].mode == P3H2x4x_TP_MODE_I3C)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  413  		return 0;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  414  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  415  	for_each_available_child_of_node(i3c_node_target, i3c_node_tp) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  416  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  417  		ret = of_property_read_u32(i3c_node_tp, "reg", &addr_dts);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  418  		if (ret)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  419  			return ret;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  420  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  421  		if (p3h2x4x_is_backend_node_exist(tp_port, priv, addr_dts))
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  422  			continue;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  423  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  424  		ret = of_property_read_string(i3c_node_tp, "compatible", &compatible);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  425  		if (ret)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  426  			return ret;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  427  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  428  		backend = kzalloc(sizeof(*backend), GFP_KERNEL);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  429  		if (!backend)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  430  			return -ENOMEM;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  431  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  432  		backend->addr = addr_dts;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  433  		backend->compatible = compatible;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  434  		backend->tp_device_dt_node = i3c_node_tp;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  435  		backend->client = NULL;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  436  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  437  		list_add(&backend->list,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  438  			&priv->tp_bus[tp_port].tp_device_entry);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  439  	}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  440  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  441  	return 0;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  442  }
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  443  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  444  static void p3h2x4x_parse_dt_tp(struct device *dev,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  445  				const struct device_node *i3c_node_hub,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  446  				struct p3h2x4x *priv)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  447  {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  448  	struct device_node *i3c_node_target;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  449  	int ret;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  450  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  451  	for_each_available_child_of_node(i3c_node_hub, i3c_node_target) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  452  		if (!strcmp(i3c_node_target->name, "target-port")) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  453  			ret = p3h2x4x_read_backend_from_p3h2x4x_dts(i3c_node_target, priv);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  454  			if (ret)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  455  				dev_err(dev, "DTS entry invalid - error %d", ret);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  456  		}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  457  	}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  458  }
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  459  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  460  static int p3h2x4x_get_tp_local_device_dt_setting(struct device *dev,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  461  					const struct device_node *node, u32 id)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  462  {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  463  	u8 i;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  464  	u32 local_dev_count, local_dev;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  465  	struct p3h2x4x *priv = dev_get_drvdata(dev);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  466  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  467  	if (!of_get_property(node, "local_dev", &local_dev_count))
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  468  		return -EINVAL;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  469  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  470  	local_dev_count = local_dev_count / (sizeof(u32));
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  471  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  472  	if (local_dev_count > P3H2x4x_TP_LOCAL_DEV)
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  473  		return -ERANGE;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  474  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  475  	for (i = 0; i < local_dev_count; i++) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  476  		if (of_property_read_u32_index(node, "local_dev", i, &local_dev)) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  477  			priv->tp_bus[id].local_dev_count = 0;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  478  			return -EINVAL;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  479  		}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  480  		priv->tp_bus[id].local_dev_list[i] = (u8)(local_dev*2);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  481  	}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  482  	priv->tp_bus[id].local_dev_count = local_dev_count;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  483  	return 0;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  484  }
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  485  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  486  static void p3h2x4x_get_tp_of_get_setting(struct device *dev,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  487  					const struct device_node *node,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  488  					struct tp_setting tp_setting[])
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  489  {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  490  	struct device_node *tp_node;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  491  	u32 id;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  492  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  493  	for_each_available_child_of_node(node, tp_node) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  494  		if (!tp_node->name || of_node_cmp(tp_node->name, "target-port"))
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  495  			continue;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  496  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  497  		if (!tp_node->full_name ||
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  498  			(sscanf(tp_node->full_name, "target-port@%u", &id) != 1)) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  499  			dev_warn(dev, "Invalid target port node found in DT: %s\n",
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  500  				tp_node->full_name);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  501  			continue;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  502  		}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  503  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  504  		if (id >= P3H2x4x_TP_MAX_COUNT) {
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  505  			dev_warn(dev, "Invalid target port index found in DT: %i\n", id);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  506  			continue;
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  507  		}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  508  		p3h2x4x_of_get_dt_setting(dev, tp_node, "mode", tp_mode_settings,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  509  					ARRAY_SIZE(tp_mode_settings),
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12 @510  					&tp_setting[id].mode);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  511  		p3h2x4x_of_get_dt_setting(dev, tp_node, "pullup_en", tp_pullup_settings,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  512  					ARRAY_SIZE(tp_pullup_settings),
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  513  					&tp_setting[id].pullup_en);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  514  		p3h2x4x_of_get_dt_setting(dev, tp_node, "ibi_en", ibi_en_settings,
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  515  					ARRAY_SIZE(ibi_en_settings),
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  516  					&tp_setting[id].ibi_en);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  517  		tp_setting[id].always_enable =
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  518  					of_property_read_bool(tp_node, "always-enable");
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  519  
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  520  		p3h2x4x_get_tp_local_device_dt_setting(dev, tp_node, id);
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  521  	}
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  522  }
5185c1dfec77e7 Aman Kumar Pandey 2025-02-12  523  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

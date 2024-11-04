Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C420F1F949
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 03:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730690800; cv=none; b=MYGwxXbq5+uDHtQKoPRU8yLj09r8cyEXtgtJZQI1wd7bqzuQqkBwj2iO8NSFNhUcw+yvPUQ4Oclj+te5sOeRPzphtevutUi7PN3JUe8DKAX9fxFYo/5S61r8OOjLCRSsFSJDWxwNHuw62N5000KP6b5Hh0U86nsuyGhPeugmkbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730690800; c=relaxed/simple;
	bh=DvJTPdEjQvNlXExGQ6QXjk7SYm3ZQj7DGjKQPs1zmDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJXAvhcwo+7Mbg2JcsnHq5icUA9rb6ewdctsWvRX/eqeAscIBgJQB6xN5vuo1oT16dmXlHZjt/dQbjbWfO+LBm25rtrTbf9S2d8PqVAWgpPucg55PyusvtDFn5IAlOvWnHKK4oZBvEU2QG7acYXhgmqNL2xioIDjo0kj2qiqjek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHmZIBLd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHmZIBLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730690798; x=1762226798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DvJTPdEjQvNlXExGQ6QXjk7SYm3ZQj7DGjKQPs1zmDw=;
  b=ZHmZIBLdiY+TMiznv0p/yljMXz2HTAJYJ1FAc28YG4DG/IhhfwAEA8kI
   /xkPWa2KX5YeDh8NS+66vHVTLd6XNaCxhHz++A3EShenvHygvqB4zM6E6
   Sl8z/FH4FU6/XulWI5zVl1H67TR8F1v28Jj/t0jzAmvV9pSSH+3xXZvW2
   ALidI/0ffVqjCI7TR0xhX93T+WTFr6QofnnvUoXUT0zA9dqvd3T+d7FtX
   deElPQhqi6OrMskw60dzsDL7NC4OY4T1/jKtjRTJ5Bj9SuucMJI249sIo
   oIn6pLveuZ60MKeOGMGvWiuLfcY/Eb3z9BMYlAu6LmtoOhyz6K3HdPCiX
   w==;
X-CSE-ConnectionGUID: uiZZntFrQjORkR9D3ubheQ==
X-CSE-MsgGUID: jhxDHvv2TRaMoIvavvogvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41476659"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41476659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 19:26:38 -0800
X-CSE-ConnectionGUID: VHZt0oojQhuQXxSx1Mf4Mg==
X-CSE-MsgGUID: DK2vO8qbTy6EhfwfhWShZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83867947"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2024 19:26:36 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7njd-000kPz-2v;
	Mon, 04 Nov 2024 03:26:33 +0000
Date: Mon, 4 Nov 2024 11:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/counter/stm32-timer-cnt.c:437:39-56: opportunity for
 str_yes_no(priv -> has_encoder)
Message-ID: <202411041138.YLSwYYO3-lkp@intel.com>
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
TO: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: William Breathitt Gray <wbg@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   59b723cd2adbac2a34fc8e12c74ae26ae45bf230
commit: 29646ee33cc34b322578e923a121a3ba5eedc22b counter: stm32-timer-cnt: add checks on quadrature encoder capability
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arc-randconfig-r063-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041138.YLSwYYO3-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411041138.YLSwYYO3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/counter/stm32-timer-cnt.c:437:39-56: opportunity for str_yes_no(priv -> has_encoder)

vim +437 drivers/counter/stm32-timer-cnt.c

29646ee33cc34b Fabrice Gasnier 2024-03-07  406  
29646ee33cc34b Fabrice Gasnier 2024-03-07  407  static int stm32_timer_cnt_probe_encoder(struct device *dev,
29646ee33cc34b Fabrice Gasnier 2024-03-07  408  					 struct stm32_timer_cnt *priv)
29646ee33cc34b Fabrice Gasnier 2024-03-07  409  {
29646ee33cc34b Fabrice Gasnier 2024-03-07  410  	struct device *parent = dev->parent;
29646ee33cc34b Fabrice Gasnier 2024-03-07  411  	struct device_node *tnode = NULL, *pnode = parent->of_node;
29646ee33cc34b Fabrice Gasnier 2024-03-07  412  	int i, ret;
29646ee33cc34b Fabrice Gasnier 2024-03-07  413  	u32 idx;
29646ee33cc34b Fabrice Gasnier 2024-03-07  414  
29646ee33cc34b Fabrice Gasnier 2024-03-07  415  	/*
29646ee33cc34b Fabrice Gasnier 2024-03-07  416  	 * Need to retrieve the trigger node index from DT, to be able
29646ee33cc34b Fabrice Gasnier 2024-03-07  417  	 * to determine if the counter supports encoder mode. It also
29646ee33cc34b Fabrice Gasnier 2024-03-07  418  	 * enforce backward compatibility, and allow to support other
29646ee33cc34b Fabrice Gasnier 2024-03-07  419  	 * counter modes in this driver (when the timer doesn't support
29646ee33cc34b Fabrice Gasnier 2024-03-07  420  	 * encoder).
29646ee33cc34b Fabrice Gasnier 2024-03-07  421  	 */
29646ee33cc34b Fabrice Gasnier 2024-03-07  422  	for (i = 0; i < ARRAY_SIZE(stm32_timer_trigger_compat) && !tnode; i++)
29646ee33cc34b Fabrice Gasnier 2024-03-07  423  		tnode = of_get_compatible_child(pnode, stm32_timer_trigger_compat[i]);
29646ee33cc34b Fabrice Gasnier 2024-03-07  424  	if (!tnode) {
29646ee33cc34b Fabrice Gasnier 2024-03-07  425  		dev_err(dev, "Can't find trigger node\n");
29646ee33cc34b Fabrice Gasnier 2024-03-07  426  		return -ENODATA;
29646ee33cc34b Fabrice Gasnier 2024-03-07  427  	}
29646ee33cc34b Fabrice Gasnier 2024-03-07  428  
29646ee33cc34b Fabrice Gasnier 2024-03-07  429  	ret = of_property_read_u32(tnode, "reg", &idx);
29646ee33cc34b Fabrice Gasnier 2024-03-07  430  	if (ret) {
29646ee33cc34b Fabrice Gasnier 2024-03-07  431  		dev_err(dev, "Can't get index (%d)\n", ret);
29646ee33cc34b Fabrice Gasnier 2024-03-07  432  		return ret;
29646ee33cc34b Fabrice Gasnier 2024-03-07  433  	}
29646ee33cc34b Fabrice Gasnier 2024-03-07  434  
29646ee33cc34b Fabrice Gasnier 2024-03-07  435  	priv->has_encoder = !!(STM32_TIM_ENCODER_SUPPORTED & BIT(idx));
29646ee33cc34b Fabrice Gasnier 2024-03-07  436  
29646ee33cc34b Fabrice Gasnier 2024-03-07 @437  	dev_dbg(dev, "encoder support: %s\n", priv->has_encoder ? "yes" : "no");
29646ee33cc34b Fabrice Gasnier 2024-03-07  438  
29646ee33cc34b Fabrice Gasnier 2024-03-07  439  	return 0;
29646ee33cc34b Fabrice Gasnier 2024-03-07  440  }
29646ee33cc34b Fabrice Gasnier 2024-03-07  441  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

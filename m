Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D523FF8A6
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363466; cv=none; b=uFwzAv0CDpkCpy/26xTZqKA8QkdsOJRG6+5t85K40eL3W/5xvvBpLyVJLI995DXT0QPuDus55mNcrxtAwTDtz7NeetEZhqtS47amuXLwyxiJUOfNDE6OgW98tCl6dPSWbOVswgcQviRVcUXT4e8oVxrDfHz0GDLJwEyKunLFGag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363466; c=relaxed/simple;
	bh=HwQmyoYmAFHlI7N5OvBHsbR4tbw7CjIU9FAG1dFjDpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l1+ytXU9C/3zhT5mQ5qTQD9+1cNp/zg1d/RMbWHOb9QgXz4uF9EI3T8gPGzgJq0MtfjPq+95qCoLXXq0nZfhKyf123vkftLu0KBy+4GlJ1JBedhYgSF9lX1XjB0VviMwBJb+EhRqL+y7HPr705u87J0Hbf/F8qKhbV6iTfD1QmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxRyZv7B; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxRyZv7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774363463; x=1805899463;
  h=date:from:to:cc:subject:message-id;
  bh=HwQmyoYmAFHlI7N5OvBHsbR4tbw7CjIU9FAG1dFjDpc=;
  b=cxRyZv7Bu5w174a1wWzVdpMIVunRc1SEWQRJI7RsEJ5hi1eh8bBNPOOj
   4kuX0y02U2RghpwK9K9kKiJeCpoFV2HI2Kqxy7ugQPs/U7/nVtXHCOxmB
   yk3KOWWMtsDU3UHei1s9X5jwBF7uN57O2Q8bWFSbGY6sp6nMP3Dvzoj/H
   /50NpSHgGY5vl8gtbr6wq9h7zoUaXsG+TBFc7rEW2jsk+Txyu/dfv7F8A
   +xdS1Xtp0WrKNEUBY+u3RpwTFCbWT01AM6W8BAuWJL8E+3/quB9mrMifM
   sJRCl2EFAMmKYo+DOs/r6quuj4aY+vCqJ+xc2cHy9+0MBjU/pMQxvtoCZ
   Q==;
X-CSE-ConnectionGUID: TtzJkGzRRxKJClKSs6tIEw==
X-CSE-MsgGUID: VyKfZUk6RcK2DFuk7UMccQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62931677"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="62931677"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 07:44:22 -0700
X-CSE-ConnectionGUID: w8AamTwdTaaVUdLRBsTVRg==
X-CSE-MsgGUID: zpliqugGQFCmZHdX4ET/8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224615578"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Mar 2026 07:44:21 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w52zS-000000004iD-1eIO;
	Tue, 24 Mar 2026 14:44:18 +0000
Date: Tue, 24 Mar 2026 22:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-offload.c:181:15-22: ERROR: invalid
 reference to the index variable of the iterator on line 169
Message-ID: <202603242208.t9WC0vYe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Nuno Sa <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: cbc986cda57a0488069f7c6bda7e16cd592e8157 iio: adc: ad7944: add support for SPI offload
date:   1 year, 1 month ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 1 month ago
config: s390-randconfig-r052-20260323 (https://download.01.org/0day-ci/archive/20260324/202603242208.t9WC0vYe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c911b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603242208.t9WC0vYe-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-offload.c:181:15-22: ERROR: invalid reference to the index variable of the iterator on line 169

vim +181 drivers/spi/spi-offload.c

d7231be4b4657e David Lechner 2025-02-07  158  
d7231be4b4657e David Lechner 2025-02-07  159  static struct spi_offload_trigger
d7231be4b4657e David Lechner 2025-02-07  160  *spi_offload_trigger_get(enum spi_offload_trigger_type type,
d7231be4b4657e David Lechner 2025-02-07  161  			 struct fwnode_reference_args *args)
d7231be4b4657e David Lechner 2025-02-07  162  {
d7231be4b4657e David Lechner 2025-02-07  163  	struct spi_offload_trigger *trigger;
d7231be4b4657e David Lechner 2025-02-07  164  	bool match = false;
d7231be4b4657e David Lechner 2025-02-07  165  	int ret;
d7231be4b4657e David Lechner 2025-02-07  166  
d7231be4b4657e David Lechner 2025-02-07  167  	guard(mutex)(&spi_offload_triggers_lock);
d7231be4b4657e David Lechner 2025-02-07  168  
d7231be4b4657e David Lechner 2025-02-07 @169  	list_for_each_entry(trigger, &spi_offload_triggers, list) {
d7231be4b4657e David Lechner 2025-02-07  170  		if (trigger->fwnode != args->fwnode)
d7231be4b4657e David Lechner 2025-02-07  171  			continue;
d7231be4b4657e David Lechner 2025-02-07  172  
d7231be4b4657e David Lechner 2025-02-07  173  		match = trigger->ops->match(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  174  		if (match)
d7231be4b4657e David Lechner 2025-02-07  175  			break;
d7231be4b4657e David Lechner 2025-02-07  176  	}
d7231be4b4657e David Lechner 2025-02-07  177  
d7231be4b4657e David Lechner 2025-02-07  178  	if (!match)
d7231be4b4657e David Lechner 2025-02-07  179  		return ERR_PTR(-EPROBE_DEFER);
d7231be4b4657e David Lechner 2025-02-07  180  
d7231be4b4657e David Lechner 2025-02-07 @181  	guard(mutex)(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  182  
d7231be4b4657e David Lechner 2025-02-07  183  	if (!trigger->ops)
d7231be4b4657e David Lechner 2025-02-07  184  		return ERR_PTR(-ENODEV);
d7231be4b4657e David Lechner 2025-02-07  185  
d7231be4b4657e David Lechner 2025-02-07  186  	if (trigger->ops->request) {
d7231be4b4657e David Lechner 2025-02-07  187  		ret = trigger->ops->request(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  188  		if (ret)
d7231be4b4657e David Lechner 2025-02-07  189  			return ERR_PTR(ret);
d7231be4b4657e David Lechner 2025-02-07  190  	}
d7231be4b4657e David Lechner 2025-02-07  191  
d7231be4b4657e David Lechner 2025-02-07  192  	kref_get(&trigger->ref);
d7231be4b4657e David Lechner 2025-02-07  193  
d7231be4b4657e David Lechner 2025-02-07  194  	return trigger;
d7231be4b4657e David Lechner 2025-02-07  195  }
d7231be4b4657e David Lechner 2025-02-07  196  

:::::: The code at line 181 was first introduced by commit
:::::: d7231be4b4657e5f922a4c6dc11e8dffc71fee87 spi: offload: add support for hardware triggers

:::::: TO: David Lechner <dlechner@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

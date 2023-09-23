Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08311E51C
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695485808; x=1727021808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N9Z8+eWCVDvCpJEcKCrDeKH46sKO1E7V7WRKrd8F70o=;
  b=ks8QcGMwQ8b8LoH0bNNxCL5DLNlA7//vXJxPV29TePEkBLBd9seKAIn0
   FcpfjxQbgMOvCXi766vB85lFmwfHxpq6IG8QzpG17PhumsHlBZROsLX7C
   WyhV6hqftEgbyRdpHanYyFAPkVZ8R1rzfq38oia4U84GrSbsuDmoOIQdA
   pOQNeR2zgQb6tiNnPqnjs3Av1t46ygt1WQoY74/EFx/Kv/1yNZ72iMo/t
   mFRXujeAsIG4V3Yy0767OlgJ+ph/UwBgx64Wm31VgwZgTE25WVf/vGzFQ
   uyrI/oBvfFBbQUTMewOXpaN3K/ya4Sc+0A8550SqS6A0LxRzFfSkclC+R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="360419554"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="360419554"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 09:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="891179781"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="891179781"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2023 09:15:50 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk5JE-0002bJ-2x;
	Sat, 23 Sep 2023 16:16:44 +0000
Date: Sun, 24 Sep 2023 00:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] gpiolib: extend the critical sections of lookup tables
Message-ID: <202309232349.C07F1uVt-lkp@intel.com>
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
In-Reply-To: <20230920085639.152441-1-brgl@bgdev.pl>
References: <20230920085639.152441-1-brgl@bgdev.pl>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-extend-the-critical-sections-of-lookup-tables/20230920-165847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20230920085639.152441-1-brgl%40bgdev.pl
patch subject: [PATCH] gpiolib: extend the critical sections of lookup tables
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20230923 (https://download.01.org/0day-ci/archive/20230923/202309232349.C07F1uVt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309232349.C07F1uVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309232349.C07F1uVt-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib.c:3935 platform_gpio_count() warn: inconsistent returns 'scope'.

vim +/scope +3935 drivers/gpio/gpiolib.c

bae48da237fced Alexandre Courbot   2013-10-17  3913  
668585273246f6 Rojhalat Ibrahim    2015-02-11  3914  static int platform_gpio_count(struct device *dev, const char *con_id)
668585273246f6 Rojhalat Ibrahim    2015-02-11  3915  {
668585273246f6 Rojhalat Ibrahim    2015-02-11  3916  	struct gpiod_lookup_table *table;
668585273246f6 Rojhalat Ibrahim    2015-02-11  3917  	struct gpiod_lookup *p;
668585273246f6 Rojhalat Ibrahim    2015-02-11  3918  	unsigned int count = 0;
668585273246f6 Rojhalat Ibrahim    2015-02-11  3919  
65ff6426976bae Bartosz Golaszewski 2023-09-20  3920  	scoped_guard(mutex, &gpio_lookup_lock) {
668585273246f6 Rojhalat Ibrahim    2015-02-11  3921  		table = gpiod_find_lookup_table(dev);
668585273246f6 Rojhalat Ibrahim    2015-02-11  3922  		if (!table)
668585273246f6 Rojhalat Ibrahim    2015-02-11  3923  			return -ENOENT;
668585273246f6 Rojhalat Ibrahim    2015-02-11  3924  
4c033b549912bc Geert Uytterhoeven  2020-05-11  3925  		for (p = &table->table[0]; p->key; p++) {
668585273246f6 Rojhalat Ibrahim    2015-02-11  3926  			if ((con_id && p->con_id && !strcmp(con_id, p->con_id)) ||
668585273246f6 Rojhalat Ibrahim    2015-02-11  3927  			    (!con_id && !p->con_id))
668585273246f6 Rojhalat Ibrahim    2015-02-11  3928  				count++;
668585273246f6 Rojhalat Ibrahim    2015-02-11  3929  		}
65ff6426976bae Bartosz Golaszewski 2023-09-20  3930  	}
65ff6426976bae Bartosz Golaszewski 2023-09-20  3931  
668585273246f6 Rojhalat Ibrahim    2015-02-11  3932  	if (!count)
668585273246f6 Rojhalat Ibrahim    2015-02-11  3933  		return -ENOENT;
668585273246f6 Rojhalat Ibrahim    2015-02-11  3934  
668585273246f6 Rojhalat Ibrahim    2015-02-11 @3935  	return count;
668585273246f6 Rojhalat Ibrahim    2015-02-11  3936  }
668585273246f6 Rojhalat Ibrahim    2015-02-11  3937  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

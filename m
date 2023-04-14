Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9922115
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Apr 2023 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681482997; x=1713018997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxKu4wJwM6M7/R1TS+fH1P4hvB7X13BroOm85KrtH0I=;
  b=EhSHN/6dQX6JgYbfsNcUglE9H/sm6SvPh9HwXqC+sj9w0dVI4pYy+GsZ
   5s85llXhO4waFJHH0eD1VE2QfPpYbSUJvf/iiRLHFKXBbjrdVa6uGaXqP
   bDUtB1p5P0LhLSL2edoGTysl5gHHOXQL59OxyIORm/SkfH8q3EpZb+A3B
   Rw56nB4HsEbpk2pFzDYpQDaLrxLnLYDyIHBopG2xfeA/whRw/jQUYAYUA
   zvWkQC8DrA/YyLSyvo2UZv/j6y9TnPcwdDkec9+P+z1WkGmd1oIFjEzjd
   7TeSHjLSL33nA9A3BIO52QLXXWaDct+e29ZClIEr8SXT6k0uzLHzpaznf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324104989"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="324104989"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 07:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="936032169"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="936032169"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2023 07:35:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnKWT-000Zcn-38;
	Fri, 14 Apr 2023 14:35:33 +0000
Date: Fri, 14 Apr 2023 22:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: replace
 divide condition 'pin / 8' with 'pin >= 8'
Message-ID: <202304142200.J0o1tpYn-lkp@intel.com>
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
TO: Qingtao Cao <qingtao.cao.au@gmail.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44149752e9987a9eac5ad78e6d3a20934b5e018d
commit: 5134272f9f3f71d4e1f3aa15cb09321af49b3646 gpio: exar: access MPIO registers on cascaded chips
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: microblaze-randconfig-m041-20230413 (https://download.01.org/0day-ci/archive/20230414/202304142200.J0o1tpYn-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304142200.J0o1tpYn-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: replace divide condition 'pin / 8' with 'pin >= 8'
drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn: replace divide condition 'pin / 8' with 'pin >= 8'

vim +52 drivers/gpio/gpio-exar.c

6596e59e63cd4c Sudip Mukherjee     2017-01-19  46  
696868d0a79c21 Bartosz Golaszewski 2020-09-30  47  static unsigned int
696868d0a79c21 Bartosz Golaszewski 2020-09-30  48  exar_offset_to_sel_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
696868d0a79c21 Bartosz Golaszewski 2020-09-30  49  {
5134272f9f3f71 Qingtao Cao         2022-09-02  50  	unsigned int pin = exar_gpio->first_pin + (offset % 16);
5134272f9f3f71 Qingtao Cao         2022-09-02  51  	unsigned int cascaded = offset / 16;
5134272f9f3f71 Qingtao Cao         2022-09-02 @52  	unsigned int addr = pin / 8 ? EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
5134272f9f3f71 Qingtao Cao         2022-09-02  53  
5134272f9f3f71 Qingtao Cao         2022-09-02  54  	return addr + (cascaded ? exar_gpio->cascaded_offset : 0);
696868d0a79c21 Bartosz Golaszewski 2020-09-30  55  }
696868d0a79c21 Bartosz Golaszewski 2020-09-30  56  
696868d0a79c21 Bartosz Golaszewski 2020-09-30  57  static unsigned int
696868d0a79c21 Bartosz Golaszewski 2020-09-30  58  exar_offset_to_lvl_addr(struct exar_gpio_chip *exar_gpio, unsigned int offset)
696868d0a79c21 Bartosz Golaszewski 2020-09-30  59  {
5134272f9f3f71 Qingtao Cao         2022-09-02  60  	unsigned int pin = exar_gpio->first_pin + (offset % 16);
5134272f9f3f71 Qingtao Cao         2022-09-02  61  	unsigned int cascaded = offset / 16;
5134272f9f3f71 Qingtao Cao         2022-09-02 @62  	unsigned int addr = pin / 8 ? EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
5134272f9f3f71 Qingtao Cao         2022-09-02  63  
5134272f9f3f71 Qingtao Cao         2022-09-02  64  	return addr + (cascaded ? exar_gpio->cascaded_offset : 0);
696868d0a79c21 Bartosz Golaszewski 2020-09-30  65  }
696868d0a79c21 Bartosz Golaszewski 2020-09-30  66  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

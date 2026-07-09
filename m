Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD383AC0E4
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 21:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631674; cv=none; b=SiUYVytxCKXEq1djAdBpYFdeY0J/x/qF6tjtxbzy/T4n2HfBXIB5PrXGgsGmKQ9gCl3SGvPIymY5Jg4HAv5BjUxNSjOxZ5o+rPperecl7Q/XWII/wrbBnCqveJPctUB7+bCHelUuhV7ZzlmLE/Tu+w6ui+lyiSQZKLDvEe3Lpa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631674; c=relaxed/simple;
	bh=lKe81jDYygxVW5qofziFQkGM1eUBUqV7yXyPVOOi3xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AF32tYBJQ7L1ToKKq2oQg0+6bR9wVSjvr4cxczRAbf/YgzLBwWw1SSULM7dmjiH29gGAeN1s4ay984pWlmvtYboqAFVYP+CgryGg4bAZJ4VHBn9+zcY2Y2rbHAfQ1fKBEHcg/hJKTeEi2OOENIvHcsUCH2CXHiBJF32kje1lYio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXZDVqRy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXZDVqRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783631672; x=1815167672;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lKe81jDYygxVW5qofziFQkGM1eUBUqV7yXyPVOOi3xw=;
  b=lXZDVqRyltCgJHn6od/UK0r7bbhpjuEhZro6LUIya5aPDUM59Bo9Faac
   ZQHq52NgwU+61jex7Bw5hdI6z1FqXaxpCwZez7PIcJbSLHfuPi+4IcnSC
   sc2FT+GAfraPkpiyGI6W/xRQVrv9dkRWfJNrUVxtA0QlbsqeWSnZ9rEmk
   Ui3aXh5yjTzopkGIDVSCTsfOfDLq0XIiZE/ab4ppAsy+MgkY828NFVLdw
   KLu34fitx2oFvj1uKE2KUqqpa0m0fJu6d0oI8JruzOYJrgCNc/q1YtDcp
   YYenRJQnZ5KF6qwO5PiWEv2dXw4eWYf5ZCAbe11QZWRaXCfHKoF8gffM6
   Q==;
X-CSE-ConnectionGUID: hnqa/TXWR7yZ3mPAPypsXA==
X-CSE-MsgGUID: xrrMdh77SbmxBZKh4RjdGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101757480"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101757480"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 14:14:32 -0700
X-CSE-ConnectionGUID: WYetNOnJTpqaV8yWYqpKVg==
X-CSE-MsgGUID: /ZBd5YqBQyWOFPIuA3vmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292894628"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Jul 2026 14:14:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whw4h-00000000I9b-2pkS;
	Thu, 09 Jul 2026 21:14:27 +0000
Date: Fri, 10 Jul 2026 05:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pwm/pwm-stm32.c:818:14-15: WARNING opportunity for
 min()
Message-ID: <202607100516.akn35vGg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: "Uwe Kleine-K=C3=B6nig" <ukleinek@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: fd0b06972a8f92d57358e62267f5925721c73c6e pwm: stm32: add support fo=
r stm32mp25
date:   1 year ago
:::::: branch date: 3 days ago
:::::: commit date: 1 year ago
config: hexagon-randconfig-r051-20260709 (https://download.01.org/0day-ci/a=
rchive/20260710/202607100516.akn35vGg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c27=
9890c85da307abe34f10333442bbf72a60644)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: fd0b06972a8f ("pwm: stm32: add support for stm32mp25")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607100516.akn35vGg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pwm/pwm-stm32.c:818:14-15: WARNING opportunity for min()

vim +818 drivers/pwm/pwm-stm32.c

7edf7369205baa1 Benjamin Gaignard 2017-01-20  795 =20
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  796  static unsigned int stm3=
2_pwm_detect_channels(struct stm32_timers *ddata,
19f1016ea9600ed Philipp Zabel     2023-10-19  797  					      unsigned int =
*num_enabled)
7edf7369205baa1 Benjamin Gaignard 2017-01-20  798  {
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  799  	struct regmap *regmap =
=3D ddata->regmap;
19f1016ea9600ed Philipp Zabel     2023-10-19  800  	u32 ccer, ccer_backup;
7edf7369205baa1 Benjamin Gaignard 2017-01-20  801 =20
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  802  	regmap_read(regmap, TIM=
_CCER, &ccer_backup);
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  803  	*num_enabled =3D hweigh=
t32(ccer_backup & TIM_CCER_CCXE);
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  804 =20
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  805  	if (ddata->ipidr) {
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  806  		u32 hwcfgr;
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  807  		unsigned int npwm;
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  808 =20
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  809  		/* Deduce from HWCFGR =
the number of outputs (MP25). */
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  810  		regmap_read(regmap, TI=
M_HWCFGR1, &hwcfgr);
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  811 =20
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  812  		/*
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  813  		 * Timers may have mor=
e capture/compare channels than the
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  814  		 * actual number of PW=
M channel outputs (e.g. TIM_CH[1..4]).
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  815  		 */
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  816  		npwm =3D FIELD_GET(TIM=
_HWCFGR1_NB_OF_CC, hwcfgr);
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  817 =20
fd0b06972a8f92d Fabrice Gasnier   2025-01-10 @818  		return npwm < STM32_MA=
X_PWM_OUTPUT ? npwm : STM32_MAX_PWM_OUTPUT;
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  819  	}
fd0b06972a8f92d Fabrice Gasnier   2025-01-10  820 =20
7edf7369205baa1 Benjamin Gaignard 2017-01-20  821  	/*
7edf7369205baa1 Benjamin Gaignard 2017-01-20  822  	 * If channels enable b=
its don't exist writing 1 will have no
7edf7369205baa1 Benjamin Gaignard 2017-01-20  823  	 * effect so we can det=
ect and count them.
7edf7369205baa1 Benjamin Gaignard 2017-01-20  824  	 */
e315bf700b404c3 Uwe Kleine-K=C3=B6nig  2024-02-14  825  	regmap_set_bits(re=
gmap, TIM_CCER, TIM_CCER_CCXE);
e315bf700b404c3 Uwe Kleine-K=C3=B6nig  2024-02-14  826  	regmap_read(regmap=
, TIM_CCER, &ccer);
e315bf700b404c3 Uwe Kleine-K=C3=B6nig  2024-02-14  827  	regmap_write(regma=
p, TIM_CCER, ccer_backup);
19f1016ea9600ed Philipp Zabel     2023-10-19  828 =20
41fa8f57c0d2692 Philipp Zabel     2023-10-19  829  	return hweight32(ccer &=
 TIM_CCER_CCXE);
7edf7369205baa1 Benjamin Gaignard 2017-01-20  830  }
7edf7369205baa1 Benjamin Gaignard 2017-01-20  831 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

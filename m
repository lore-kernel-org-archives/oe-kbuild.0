Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECBB279DAE
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 18:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770835667; cv=none; b=ZbaptRmfGxeRehE1w7WoaPPuBJbr9iT073ZKE0vXmGoUQAS136rRQizv6xaRueutxIIt0SNg+gFzyUNtyB3rLiJp0vD3nxfK8WeWh+841ZhbxQUAmYgwNQCIwYYYk4fdbb60JVgtU1eZ0WUO4H8A0y7Bo+TW138VZk9kdmk4Z6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770835667; c=relaxed/simple;
	bh=C+eaXxEJFZloiuI+x8t0TnUiBZFtF6ZAIJefUHb5f40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZjpGEY0KlqTYOcXUu+iCTA5SdidHj0K+WdMNln4yJY0U0OdMRSza/myjPzwe7mrDnpySepyUVLsxzALR3RBGUKieS/EmBu6v/fQDf/Advn1DxD+LfTjVcKg/Al0u1Ah4wp6D3/sVckjurJ1CLw437qb1uIt7KkHpaJVmMAA+Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GaTHcvu6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaTHcvu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770835666; x=1802371666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C+eaXxEJFZloiuI+x8t0TnUiBZFtF6ZAIJefUHb5f40=;
  b=GaTHcvu6f2CWTlsubDxUV/ye4zFScLO3jiiXz/UoTUu6BorwqieON0gq
   eLS9FT7BjKOr196tQ5kAIcv6swB+bXhU79agK1Dj+tAfgsUnYhSZO8aDZ
   eM6PDxvwLvKYSjauqjBc7yXytBsNEey+8uraVV0WxrBK+3n9vaqq1+vlr
   eho2u+rBxzvCOM2OAaSlfl58nQqeIVYrpdHzxt56ESFwY4V7v8O4nfEUI
   NttG/Dig0mlwI3dD0Ykbo8NTshP7+29phODlnypcbK46GodutXqvmBfNk
   aGmxTntzwbNEkU08oTdGLrbm92gfBZc//f8TyK+p3/leMyFbr0nQWs5EA
   Q==;
X-CSE-ConnectionGUID: 8UbZeHarSNaPDaoB9uA4xA==
X-CSE-MsgGUID: a9CmtMU/SQy9/mc/15vdWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83095163"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="83095163"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 10:47:46 -0800
X-CSE-ConnectionGUID: kju08ntFQKyN+QPicFbaRQ==
X-CSE-MsgGUID: u/yISUqdTkKtmB9SoS9SQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="212356055"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Feb 2026 10:47:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqFFW-00000000qGq-1L7Q;
	Wed, 11 Feb 2026 18:47:42 +0000
Date: Thu, 12 Feb 2026 02:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] HID: winwing: Enable rumble effects
Message-ID: <202602120209.xYKh9QQp-lkp@intel.com>
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
In-Reply-To: <20260211053116.GA20357@altimeter-info>
References: <20260211053116.GA20357@altimeter-info>
TO: Ivan Gorinov <linux-kernel@altimeter.info>
TO: Jiri Kosina <jikos@kernel.org>
CC: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.19 next-20260211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Gorinov/HID-winwing-Enable-rumble-effects/20260211-133322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20260211053116.GA20357%40altimeter-info
patch subject: [PATCH RESEND] HID: winwing: Enable rumble effects
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: parisc-randconfig-r071-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120209.xYKh9QQp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602120209.xYKh9QQp-lkp@intel.com/

smatch warnings:
drivers/hid/hid-winwing.c:235 winwing_haptic_rumble() warn: address of NULL pointer 'data->hdev'
drivers/hid/hid-winwing.c:308 winwing_haptic_rumble_cb() warn: can 'data' even be NULL?
drivers/hid/hid-winwing.c:339 winwing_init_ff() warn: variable dereferenced before check 'data' (see line 333)

vim +235 drivers/hid/hid-winwing.c

c4c97b07cd09c03 Ivan Gorinov 2026-02-11  220  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  221  static int winwing_haptic_rumble(struct winwing_drv_data *data)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  222  {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  223  	__u8 *buf;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  224  	__u8 m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  225  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  226  	if (!data)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  227  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  228  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  229  	buf = data->report_rumble;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  230  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  231  	if (!buf)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  232  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  233  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  234  	if (!data->hdev) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11 @235  		hid_err(data->hdev, "data->hdev == NULL\n");
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  236  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  237  	}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  238  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  239  	if (!data->hdev->ll_driver) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  240  		hid_err(data->hdev, "data->hdev->ll_driver == NULL\n");
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  241  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  242  	}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  243  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  244  	m = convert_magnitude(data->rumble.strong_magnitude);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  245  	if (m != data->rumble_left) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  246  		int ret;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  247  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  248  		buf[0] = 0x02;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  249  		buf[1] = 0x01;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  250  		buf[2] = 0xbf;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  251  		buf[3] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  252  		buf[4] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  253  		buf[5] = 0x03;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  254  		buf[6] = 0x49;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  255  		buf[7] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  256  		buf[8] = m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  257  		buf[9] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  258  		buf[10] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  259  		buf[11] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  260  		buf[12] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  261  		buf[13] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  262  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  263  		ret = hid_hw_output_report(data->hdev, buf, 14);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  264  		if (ret < 0) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  265  			hid_err(data->hdev, "error %d (%*ph)\n", ret, 14, buf);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  266  			return ret;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  267  		}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  268  		data->rumble_left = m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  269  	}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  270  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  271  	m = convert_magnitude(data->rumble.weak_magnitude);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  272  	if (m != data->rumble_right) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  273  		int ret;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  274  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  275  		buf[0] = 0x02;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  276  		buf[1] = 0x03;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  277  		buf[2] = 0xbf;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  278  		buf[3] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  279  		buf[4] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  280  		buf[5] = 0x03;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  281  		buf[6] = 0x49;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  282  		buf[7] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  283  		buf[8] = m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  284  		buf[9] = 0x00;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  285  		buf[10] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  286  		buf[11] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  287  		buf[12] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  288  		buf[13] = 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  289  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  290  		ret = hid_hw_output_report(data->hdev, buf, 14);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  291  		if (ret < 0) {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  292  			hid_err(data->hdev, "error %d (%*ph)\n", ret, 14, buf);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  293  			return ret;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  294  		}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  295  		data->rumble_right = m;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  296  	}
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  297  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  298  	return 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  299  }
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  300  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  301  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  302  static void winwing_haptic_rumble_cb(struct work_struct *work)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  303  {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  304  	struct winwing_drv_data *data;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  305  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  306  	data = container_of(work, struct winwing_drv_data, rumble_work);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  307  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11 @308  	if (data)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  309  		winwing_haptic_rumble(data);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  310  }
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  311  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  312  static int winwing_play_effect(struct input_dev *dev, void *context,
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  313  		struct ff_effect *effect)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  314  {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  315  	struct winwing_drv_data *data = (struct winwing_drv_data *) context;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  316  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  317  	if (effect->type != FF_RUMBLE)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  318  		return 0;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  319  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  320  	if (!data)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  321  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  322  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  323  	data->rumble = effect->u.rumble;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  324  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  325  	return schedule_work(&data->rumble_work);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  326  }
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  327  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  328  static int winwing_init_ff(struct hid_device *hdev, struct hid_input *hidinput)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  329  {
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  330  	struct winwing_drv_data *data;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  331  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  332  	data = (struct winwing_drv_data *) hid_get_drvdata(hdev);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11 @333  	data->report_rumble = devm_kzalloc(&hdev->dev, MAX_REPORT, GFP_KERNEL);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  334  	data->rumble_left = -1;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  335  	data->rumble_right = -1;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  336  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  337  	input_set_capability(hidinput->input, EV_FF, FF_RUMBLE);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  338  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11 @339  	if (!data)
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  340  		return -EINVAL;
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  341  
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  342  	return input_ff_create_memless(hidinput->input, data,
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  343  			winwing_play_effect);
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  344  }
c4c97b07cd09c03 Ivan Gorinov 2026-02-11  345  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

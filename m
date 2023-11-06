Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422118AEB
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoPfiyHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699281466; x=1730817466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PsuUIHPcWM1tuSCf4Ti0nmU+gHSLc9ajeXFeLOkDMuc=;
  b=MoPfiyHQTfylrAuEqUhIIy2D2OckD9bOx/0Zfi9YAnu+jagwiZdfOmC2
   Y3wlR7TPmhWw7kQ9L+EZ9UL7qAw6pHtfKuUOzSFIl22o/9oWZUcTuqngw
   fUsKmY/syoZSuyKaUS+j7DM2HHDRBK2yWUcPlAs1HcCVYceInFLQXaLx0
   07IwqsOawrdZUtYiM9nw4ALkBvYnASqEw0wsC0Vs3EWdl7nttd8zhD6dZ
   Nl6IQtVR9KbF222Ti3fWBYPZZMKjP4cotsF118Zgyajmk5IqGsk/DBZME
   poE44d5nwAjrs4b2ZOPtDIpUyVP0BaxbzGG38mC2ISth8c6tGn6MmOLow
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="374319897"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="374319897"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 06:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="762330172"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="762330172"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Nov 2023 06:26:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r00Yc-0006TI-1u;
	Mon, 06 Nov 2023 14:26:26 +0000
Date: Mon, 6 Nov 2023 22:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pinchartl:mtk/v6.6/thp7312/fixups 5/5]
 drivers/media/i2c/thp7312.c:1049 thp7312_set_focus() error: uninitialized
 symbol 'new_state'.
Message-ID: <202311062245.5hdXGBzd-lkp@intel.com>
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
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Laurent,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/thp7312/fixups
head:   e16a701c1ccadbb92d46e6b9004d83f2ba14f3be
commit: e16a701c1ccadbb92d46e6b9004d83f2ba14f3be [5/5] fixup! media: i2c: Add driver for THine THP7312
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-141-20231016 (https://download.01.org/0day-ci/archive/20231106/202311062245.5hdXGBzd-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062245.5hdXGBzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311062245.5hdXGBzd-lkp@intel.com/

smatch warnings:
drivers/media/i2c/thp7312.c:1049 thp7312_set_focus() error: uninitialized symbol 'new_state'.

vim +/new_state +1049 drivers/media/i2c/thp7312.c

75997e37fcd3e0 Paul Elder 2023-06-20   989  
75997e37fcd3e0 Paul Elder 2023-06-20   990  static int thp7312_set_focus(struct thp7312_device *thp7312)
75997e37fcd3e0 Paul Elder 2023-06-20   991  {
75997e37fcd3e0 Paul Elder 2023-06-20   992  	enum thp7312_focus_state new_state;
75997e37fcd3e0 Paul Elder 2023-06-20   993  	bool continuous;
75997e37fcd3e0 Paul Elder 2023-06-20   994  	u8 af_control;
75997e37fcd3e0 Paul Elder 2023-06-20   995  	u8 af_setting;
75997e37fcd3e0 Paul Elder 2023-06-20   996  	int ret = 0;
75997e37fcd3e0 Paul Elder 2023-06-20   997  
75997e37fcd3e0 Paul Elder 2023-06-20   998  	/* Start by programming the manual focus position if it has changed. */
75997e37fcd3e0 Paul Elder 2023-06-20   999  	if (thp7312->focus_absolute->is_new) {
75997e37fcd3e0 Paul Elder 2023-06-20  1000  		unsigned int value;
75997e37fcd3e0 Paul Elder 2023-06-20  1001  
75997e37fcd3e0 Paul Elder 2023-06-20  1002  		value = thp7312_focus_values[thp7312->focus_absolute->val];
75997e37fcd3e0 Paul Elder 2023-06-20  1003  
75997e37fcd3e0 Paul Elder 2023-06-20  1004  		ret = cci_write(thp7312->regmap,
75997e37fcd3e0 Paul Elder 2023-06-20  1005  				THP7312_REG_MANUAL_FOCUS_POSITION, value, NULL);
75997e37fcd3e0 Paul Elder 2023-06-20  1006  		if (ret)
75997e37fcd3e0 Paul Elder 2023-06-20  1007  			return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1008  	}
75997e37fcd3e0 Paul Elder 2023-06-20  1009  
75997e37fcd3e0 Paul Elder 2023-06-20  1010  	/* Calculate the new focus state. */
75997e37fcd3e0 Paul Elder 2023-06-20  1011  	switch (thp7312->focus_state) {
75997e37fcd3e0 Paul Elder 2023-06-20  1012  	case THP7312_FOCUS_STATE_MANUAL:
75997e37fcd3e0 Paul Elder 2023-06-20  1013  	default:
75997e37fcd3e0 Paul Elder 2023-06-20  1014  		if (thp7312->focus_auto->val)
75997e37fcd3e0 Paul Elder 2023-06-20  1015  			new_state = THP7312_FOCUS_STATE_AUTO;
75997e37fcd3e0 Paul Elder 2023-06-20  1016  		else if (thp7312->focus_start->is_new)
75997e37fcd3e0 Paul Elder 2023-06-20  1017  			new_state = THP7312_FOCUS_STATE_ONESHOT;
75997e37fcd3e0 Paul Elder 2023-06-20  1018  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1019  
75997e37fcd3e0 Paul Elder 2023-06-20  1020  	case THP7312_FOCUS_STATE_AUTO:
75997e37fcd3e0 Paul Elder 2023-06-20  1021  		if (!thp7312->focus_auto->val)
75997e37fcd3e0 Paul Elder 2023-06-20  1022  			new_state = THP7312_FOCUS_STATE_LOCKED;
75997e37fcd3e0 Paul Elder 2023-06-20  1023  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1024  
75997e37fcd3e0 Paul Elder 2023-06-20  1025  	case THP7312_FOCUS_STATE_LOCKED:
75997e37fcd3e0 Paul Elder 2023-06-20  1026  		if (thp7312->focus_auto->val)
75997e37fcd3e0 Paul Elder 2023-06-20  1027  			new_state = THP7312_FOCUS_STATE_AUTO;
75997e37fcd3e0 Paul Elder 2023-06-20  1028  		else if (thp7312->focus_start->is_new)
75997e37fcd3e0 Paul Elder 2023-06-20  1029  			new_state = THP7312_FOCUS_STATE_ONESHOT;
75997e37fcd3e0 Paul Elder 2023-06-20  1030  		else if (thp7312->focus_absolute->is_new)
75997e37fcd3e0 Paul Elder 2023-06-20  1031  			new_state = THP7312_FOCUS_STATE_MANUAL;
75997e37fcd3e0 Paul Elder 2023-06-20  1032  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1033  
75997e37fcd3e0 Paul Elder 2023-06-20  1034  	case THP7312_FOCUS_STATE_ONESHOT:
75997e37fcd3e0 Paul Elder 2023-06-20  1035  		if (thp7312->focus_auto->val)
75997e37fcd3e0 Paul Elder 2023-06-20  1036  			new_state = THP7312_FOCUS_STATE_AUTO;
75997e37fcd3e0 Paul Elder 2023-06-20  1037  		else if (thp7312->focus_start->is_new)
75997e37fcd3e0 Paul Elder 2023-06-20  1038  			new_state = THP7312_FOCUS_STATE_ONESHOT;
75997e37fcd3e0 Paul Elder 2023-06-20  1039  		else if (thp7312->focus_absolute->is_new)
75997e37fcd3e0 Paul Elder 2023-06-20  1040  			new_state = THP7312_FOCUS_STATE_MANUAL;
75997e37fcd3e0 Paul Elder 2023-06-20  1041  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1042  	}
75997e37fcd3e0 Paul Elder 2023-06-20  1043  
75997e37fcd3e0 Paul Elder 2023-06-20  1044  	/*
75997e37fcd3e0 Paul Elder 2023-06-20  1045  	 * If neither the state nor the focus method has changed, and no new
75997e37fcd3e0 Paul Elder 2023-06-20  1046  	 * one-shot focus is requested, there's nothing new to program to the
75997e37fcd3e0 Paul Elder 2023-06-20  1047  	 * hardware.
75997e37fcd3e0 Paul Elder 2023-06-20  1048  	 */
75997e37fcd3e0 Paul Elder 2023-06-20 @1049  	if (thp7312->focus_state == new_state &&
75997e37fcd3e0 Paul Elder 2023-06-20  1050  	    !thp7312->focus_method->is_new && !thp7312->focus_start->is_new)
75997e37fcd3e0 Paul Elder 2023-06-20  1051  		return 0;
75997e37fcd3e0 Paul Elder 2023-06-20  1052  
75997e37fcd3e0 Paul Elder 2023-06-20  1053  	continuous = new_state == THP7312_FOCUS_STATE_MANUAL ||
75997e37fcd3e0 Paul Elder 2023-06-20  1054  		     new_state == THP7312_FOCUS_STATE_ONESHOT;
75997e37fcd3e0 Paul Elder 2023-06-20  1055  
75997e37fcd3e0 Paul Elder 2023-06-20  1056  	switch (thp7312->focus_method->val) {
75997e37fcd3e0 Paul Elder 2023-06-20  1057  	case THP7312_FOCUS_METHOD_CONTRAST:
75997e37fcd3e0 Paul Elder 2023-06-20  1058  	default:
75997e37fcd3e0 Paul Elder 2023-06-20  1059  		af_setting = continuous
75997e37fcd3e0 Paul Elder 2023-06-20  1060  			   ? THP7312_REG_AF_SETTING_CONTINUOUS_CONTRAST
75997e37fcd3e0 Paul Elder 2023-06-20  1061  			   : THP7312_REG_AF_SETTING_ONESHOT_CONTRAST;
75997e37fcd3e0 Paul Elder 2023-06-20  1062  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1063  	case THP7312_FOCUS_METHOD_PDAF:
75997e37fcd3e0 Paul Elder 2023-06-20  1064  		af_setting = continuous
75997e37fcd3e0 Paul Elder 2023-06-20  1065  			   ? THP7312_REG_AF_SETTING_CONTINUOUS_PDAF
75997e37fcd3e0 Paul Elder 2023-06-20  1066  			   : THP7312_REG_AF_SETTING_ONESHOT_PDAF;
75997e37fcd3e0 Paul Elder 2023-06-20  1067  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1068  	case THP7312_FOCUS_METHOD_HYBRID:
75997e37fcd3e0 Paul Elder 2023-06-20  1069  		af_setting = continuous
75997e37fcd3e0 Paul Elder 2023-06-20  1070  			   ? THP7312_REG_AF_SETTING_CONTINUOUS_HYBRID
75997e37fcd3e0 Paul Elder 2023-06-20  1071  			   : THP7312_REG_AF_SETTING_ONESHOT_HYBRID;
75997e37fcd3e0 Paul Elder 2023-06-20  1072  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1073  	}
75997e37fcd3e0 Paul Elder 2023-06-20  1074  
75997e37fcd3e0 Paul Elder 2023-06-20  1075  	switch (new_state) {
75997e37fcd3e0 Paul Elder 2023-06-20  1076  	case THP7312_FOCUS_STATE_MANUAL:
75997e37fcd3e0 Paul Elder 2023-06-20  1077  	default:
75997e37fcd3e0 Paul Elder 2023-06-20  1078  		af_control = THP7312_REG_AF_CONTROL_MANUAL;
75997e37fcd3e0 Paul Elder 2023-06-20  1079  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1080  	case THP7312_FOCUS_STATE_AUTO:
75997e37fcd3e0 Paul Elder 2023-06-20  1081  	case THP7312_FOCUS_STATE_ONESHOT:
75997e37fcd3e0 Paul Elder 2023-06-20  1082  		af_control = THP7312_REG_AF_CONTROL_AF;
75997e37fcd3e0 Paul Elder 2023-06-20  1083  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1084  	case THP7312_FOCUS_STATE_LOCKED:
75997e37fcd3e0 Paul Elder 2023-06-20  1085  		af_control = THP7312_REG_AF_CONTROL_LOCK;
75997e37fcd3e0 Paul Elder 2023-06-20  1086  		break;
75997e37fcd3e0 Paul Elder 2023-06-20  1087  	}
75997e37fcd3e0 Paul Elder 2023-06-20  1088  
75997e37fcd3e0 Paul Elder 2023-06-20  1089  	cci_write(thp7312->regmap, THP7312_REG_AF_SETTING, af_setting, &ret);
75997e37fcd3e0 Paul Elder 2023-06-20  1090  
75997e37fcd3e0 Paul Elder 2023-06-20  1091  	if (new_state == THP7312_FOCUS_STATE_MANUAL &&
75997e37fcd3e0 Paul Elder 2023-06-20  1092  	    (thp7312->focus_state == THP7312_FOCUS_STATE_AUTO ||
75997e37fcd3e0 Paul Elder 2023-06-20  1093  	     thp7312->focus_state == THP7312_FOCUS_STATE_ONESHOT)) {
75997e37fcd3e0 Paul Elder 2023-06-20  1094  		/* When switching to manual state, lock AF first. */
75997e37fcd3e0 Paul Elder 2023-06-20  1095  		cci_write(thp7312->regmap, THP7312_REG_AF_CONTROL,
75997e37fcd3e0 Paul Elder 2023-06-20  1096  			  THP7312_REG_AF_CONTROL_LOCK, &ret);
75997e37fcd3e0 Paul Elder 2023-06-20  1097  	}
75997e37fcd3e0 Paul Elder 2023-06-20  1098  
75997e37fcd3e0 Paul Elder 2023-06-20  1099  	cci_write(thp7312->regmap, THP7312_REG_AF_CONTROL, af_control, &ret);
75997e37fcd3e0 Paul Elder 2023-06-20  1100  
75997e37fcd3e0 Paul Elder 2023-06-20  1101  	if (ret)
75997e37fcd3e0 Paul Elder 2023-06-20  1102  		return ret;
75997e37fcd3e0 Paul Elder 2023-06-20  1103  
75997e37fcd3e0 Paul Elder 2023-06-20  1104  	thp7312->focus_state = new_state;
75997e37fcd3e0 Paul Elder 2023-06-20  1105  
75997e37fcd3e0 Paul Elder 2023-06-20  1106  	return 0;
75997e37fcd3e0 Paul Elder 2023-06-20  1107  }
75997e37fcd3e0 Paul Elder 2023-06-20  1108  

:::::: The code at line 1049 was first introduced by commit
:::::: 75997e37fcd3e03d0b4cd663baf147b3712e9c2a media: i2c: Add driver for THine THP7312

:::::: TO: Paul Elder <paul.elder@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

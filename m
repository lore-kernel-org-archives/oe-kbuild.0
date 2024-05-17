Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4AB384
	for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 00:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715904831; cv=none; b=bNS2BA5T+64UeeXaotkVzpbT145EDPdSU9LdaFGsa+uLvBUw9IFd2eJN4RC4jcZUFWdrkE1tu7gfr7ZPHOHv5Sqr3a2wERkpK6SjZ+8EDOM8jfRR5YmOloS9r2+147FxH7ywFyiBdxoRoJZhMi3WMvN1I/zSntuN1kWm2ega9rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715904831; c=relaxed/simple;
	bh=Ge0PLB1H0jKarztlcu6AOGCzlpNhbY4C2qYlioCdSl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WvMAFvs0BfrxEfE9/lsYUCVt8VyJlksPhZthC+alivslo4VowLnvYhwfCsAgDDltdUxiAayfPopm+LwQgXDYcF6UKue7wq+nkh+Qmrv6AJh2prubwavkhoLVa8j848onbXYSNe18r8DuzNALxGb7jYMTW+Nph55Gn3jjy8p19UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQHmYCsD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQHmYCsD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715904829; x=1747440829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ge0PLB1H0jKarztlcu6AOGCzlpNhbY4C2qYlioCdSl0=;
  b=ZQHmYCsDY6YKnwc6z8W6U7ijia6riBMs42Al130/UC0oYDeaOgfFSERx
   ShqZseJk0FvXJd3acO3wfISBJ4sqacxPk6ghFGZOLdjF3Oir/5Pgs7qJJ
   Htq4hTeUkjD823h41/th3Q71l7vuv6GFxXpfQqoiAJ9RtTMMShOAfvC2N
   pXMT8Z8g7OAxi6wOEd4j1pczKQiob18QNSTBdtL1yVacTqDbOS30SoRFw
   b7CmeG4e6y8TyQ8jg/D2/JbD+bSCAyrDIsupwyNgE2r8HPHeg7S+yE4qP
   VX6W9nTvI5iadL3uBzmS7wiS2YX+c3pLiaumr3Zu4NYHvActt7qCdNC8l
   g==;
X-CSE-ConnectionGUID: LWVeNzqAQ1KxttGI6xzOvg==
X-CSE-MsgGUID: Z8QT+e6rTU+41cKPJb9VAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11900687"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="11900687"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 17:13:49 -0700
X-CSE-ConnectionGUID: pnOlvE05ShOC6wYF4XjNog==
X-CSE-MsgGUID: KuWgu6fDTWij+MU+TBjkGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="32212043"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 May 2024 17:13:46 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7lEG-000F1A-1x;
	Fri, 17 May 2024 00:13:44 +0000
Date: Fri, 17 May 2024 08:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] iio:proximity:hx9031as: Add TYHX HX9031AS/HX9023S sensor
 driver
Message-ID: <202405170824.uhEslLI0-lkp@intel.com>
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
In-Reply-To: <SN7PR12MB8101EDFA7F91A59761095A28A4E72@SN7PR12MB8101.namprd12.prod.outlook.com>
References: <SN7PR12MB8101EDFA7F91A59761095A28A4E72@SN7PR12MB8101.namprd12.prod.outlook.com>
TO: Yasin Lee <yasin.lee.x@outlook.com>
TO: jic23@kernel.org
CC: lars@metafoo.de
CC: swboyd@chromium.org
CC: nuno.a@analog.com
CC: andy.shevchenko@gmail.com
CC: u.kleine-koenig@pengutronix.de
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: yasin.lee.x@gmail.com
CC: yasin.lee.x@outlook.com

Hi Yasin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yasin-Lee/iio-proximity-hx9031as-Add-TYHX-HX9031AS-HX9023S-sensor-driver/20240515-083021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/SN7PR12MB8101EDFA7F91A59761095A28A4E72%40SN7PR12MB8101.namprd12.prod.outlook.com
patch subject: [PATCH] iio:proximity:hx9031as: Add TYHX HX9031AS/HX9023S sensor driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r081-20240516 (https://download.01.org/0day-ci/archive/20240517/202405170824.uhEslLI0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405170824.uhEslLI0-lkp@intel.com/

smatch warnings:
drivers/iio/proximity/hx9031as.c:1118 hx9031as_raw_data_show() error: snprintf() is printing too much 8192 vs 512
drivers/iio/proximity/hx9031as.c:1240 hx9031as_channel_en_show() error: snprintf() is printing too much 8192 vs 512
drivers/iio/proximity/hx9031as.c:1466 hx9031as_threshold_show() error: snprintf() is printing too much 8192 vs 512
drivers/iio/proximity/hx9031as.c:1491 hx9031as_dump_show() error: snprintf() is printing too much 8192 vs 1024
drivers/iio/proximity/hx9031as.c:1513 hx9031as_offset_dac_show() error: snprintf() is printing too much 8192 vs 512

vim +1118 drivers/iio/proximity/hx9031as.c

5e5a419c9407f6 Yasin Lee 2024-05-10  1109  
5e5a419c9407f6 Yasin Lee 2024-05-10  1110  static ssize_t hx9031as_raw_data_show(struct file *file, char __user *user_buf, size_t count, loff_t *ppos)
5e5a419c9407f6 Yasin Lee 2024-05-10  1111  {
5e5a419c9407f6 Yasin Lee 2024-05-10  1112  	char buf[BUF_SIZE] = {0};
5e5a419c9407f6 Yasin Lee 2024-05-10  1113  	char *p = buf;
5e5a419c9407f6 Yasin Lee 2024-05-10  1114  	int ii = 0;
5e5a419c9407f6 Yasin Lee 2024-05-10  1115  
5e5a419c9407f6 Yasin Lee 2024-05-10  1116  	hx9031as_sample();
5e5a419c9407f6 Yasin Lee 2024-05-10  1117  	for (ii = 0; ii < HX9031AS_CH_NUM; ii++) {
5e5a419c9407f6 Yasin Lee 2024-05-10 @1118  		p += snprintf(p, PAGE_SIZE, "ch[%d]: DIFF=%-8d, RAW=%-8d, OFFSET=%-8d, BL=%-8d, LP=%-8d\n",
5e5a419c9407f6 Yasin Lee 2024-05-10  1119  						ii, hx9031as_pdata.diff[ii], hx9031as_pdata.raw[ii], hx9031as_pdata.dac[ii],
5e5a419c9407f6 Yasin Lee 2024-05-10  1120  						hx9031as_pdata.bl[ii], hx9031as_pdata.lp[ii]);
5e5a419c9407f6 Yasin Lee 2024-05-10  1121  	}
5e5a419c9407f6 Yasin Lee 2024-05-10  1122  
5e5a419c9407f6 Yasin Lee 2024-05-10  1123  	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
5e5a419c9407f6 Yasin Lee 2024-05-10  1124  }
5e5a419c9407f6 Yasin Lee 2024-05-10  1125  
5e5a419c9407f6 Yasin Lee 2024-05-10  1126  static const struct file_operations hx9031as_raw_data_fops = {
5e5a419c9407f6 Yasin Lee 2024-05-10  1127  	.read = hx9031as_raw_data_show,
5e5a419c9407f6 Yasin Lee 2024-05-10  1128  };
5e5a419c9407f6 Yasin Lee 2024-05-10  1129  
5e5a419c9407f6 Yasin Lee 2024-05-10  1130  static ssize_t hx9031as_reg_write_store(struct file *file, const char __user *user_buf, size_t count, loff_t *ppos)
5e5a419c9407f6 Yasin Lee 2024-05-10  1131  {
5e5a419c9407f6 Yasin Lee 2024-05-10  1132  	int ret = -1;
5e5a419c9407f6 Yasin Lee 2024-05-10  1133  	unsigned int reg_address = 0;
5e5a419c9407f6 Yasin Lee 2024-05-10  1134  	unsigned int val = 0;
5e5a419c9407f6 Yasin Lee 2024-05-10  1135  	uint8_t addr = 0;
5e5a419c9407f6 Yasin Lee 2024-05-10  1136  	uint8_t tx_buf[1] = {0};
5e5a419c9407f6 Yasin Lee 2024-05-10  1137  	char buf[BUF_SIZE];
5e5a419c9407f6 Yasin Lee 2024-05-10  1138  
5e5a419c9407f6 Yasin Lee 2024-05-10  1139  	ENTER;
5e5a419c9407f6 Yasin Lee 2024-05-10  1140  	if (count > BUF_SIZE)
5e5a419c9407f6 Yasin Lee 2024-05-10  1141  		return -EINVAL;
5e5a419c9407f6 Yasin Lee 2024-05-10  1142  
5e5a419c9407f6 Yasin Lee 2024-05-10  1143  	if (copy_from_user(buf, user_buf, count))
5e5a419c9407f6 Yasin Lee 2024-05-10  1144  		return -EFAULT;
5e5a419c9407f6 Yasin Lee 2024-05-10  1145  
5e5a419c9407f6 Yasin Lee 2024-05-10  1146  	if (sscanf(buf, "%x,%x", &reg_address, &val) != 2) {
5e5a419c9407f6 Yasin Lee 2024-05-10  1147  		PRINT_ERR("please input two HEX numbers: aa,bb (aa: reg_address, bb: value_to_be_set)\n");
5e5a419c9407f6 Yasin Lee 2024-05-10  1148  		return -EINVAL;
5e5a419c9407f6 Yasin Lee 2024-05-10  1149  	}
5e5a419c9407f6 Yasin Lee 2024-05-10  1150  
5e5a419c9407f6 Yasin Lee 2024-05-10  1151  	addr = (uint8_t)reg_address;
5e5a419c9407f6 Yasin Lee 2024-05-10  1152  	tx_buf[0] = (uint8_t)val;
5e5a419c9407f6 Yasin Lee 2024-05-10  1153  
5e5a419c9407f6 Yasin Lee 2024-05-10  1154  	ret = hx9031as_write(addr, tx_buf, 1);
5e5a419c9407f6 Yasin Lee 2024-05-10  1155  	if (ret != 0)
5e5a419c9407f6 Yasin Lee 2024-05-10  1156  		PRINT_ERR("hx9031as_write failed\n");
5e5a419c9407f6 Yasin Lee 2024-05-10  1157  
5e5a419c9407f6 Yasin Lee 2024-05-10  1158  	PRINT_INF("WRITE:Reg0x%02X=0x%02X\n", addr, tx_buf[0]);
5e5a419c9407f6 Yasin Lee 2024-05-10  1159  	return count;
5e5a419c9407f6 Yasin Lee 2024-05-10  1160  }
5e5a419c9407f6 Yasin Lee 2024-05-10  1161  
5e5a419c9407f6 Yasin Lee 2024-05-10  1162  static const struct file_operations hx9031as_reg_write_fops = {
5e5a419c9407f6 Yasin Lee 2024-05-10  1163  	.write = hx9031as_reg_write_store,
5e5a419c9407f6 Yasin Lee 2024-05-10  1164  };
5e5a419c9407f6 Yasin Lee 2024-05-10  1165  
5e5a419c9407f6 Yasin Lee 2024-05-10  1166  static ssize_t hx9031as_reg_read_store(struct file *file, const char __user *user_buf, size_t count, loff_t *ppos)
5e5a419c9407f6 Yasin Lee 2024-05-10  1167  {
5e5a419c9407f6 Yasin Lee 2024-05-10  1168  	int ret = -1;
5e5a419c9407f6 Yasin Lee 2024-05-10  1169  	unsigned long reg_address = 0;
5e5a419c9407f6 Yasin Lee 2024-05-10  1170  	uint8_t addr = 0;
5e5a419c9407f6 Yasin Lee 2024-05-10  1171  	uint8_t rx_buf[1] = {0};
5e5a419c9407f6 Yasin Lee 2024-05-10  1172  	char buf[BUF_SIZE];
5e5a419c9407f6 Yasin Lee 2024-05-10  1173  
5e5a419c9407f6 Yasin Lee 2024-05-10  1174  	ENTER;
5e5a419c9407f6 Yasin Lee 2024-05-10  1175  	if (count > BUF_SIZE)
5e5a419c9407f6 Yasin Lee 2024-05-10  1176  		return -EINVAL;
5e5a419c9407f6 Yasin Lee 2024-05-10  1177  
5e5a419c9407f6 Yasin Lee 2024-05-10  1178  	if (copy_from_user(buf, user_buf, count))
5e5a419c9407f6 Yasin Lee 2024-05-10  1179  		return -EFAULT;
5e5a419c9407f6 Yasin Lee 2024-05-10  1180  
5e5a419c9407f6 Yasin Lee 2024-05-10  1181  	if (kstrtoul(buf, 16, &reg_address)) {
5e5a419c9407f6 Yasin Lee 2024-05-10  1182  		PRINT_ERR("please input a HEX number\n");
5e5a419c9407f6 Yasin Lee 2024-05-10  1183  		return -EINVAL;
5e5a419c9407f6 Yasin Lee 2024-05-10  1184  	}
5e5a419c9407f6 Yasin Lee 2024-05-10  1185  	addr = (uint8_t)reg_address;
5e5a419c9407f6 Yasin Lee 2024-05-10  1186  
5e5a419c9407f6 Yasin Lee 2024-05-10  1187  	ret = hx9031as_read(addr, rx_buf, 1);
5e5a419c9407f6 Yasin Lee 2024-05-10  1188  	if (ret != 0)
5e5a419c9407f6 Yasin Lee 2024-05-10  1189  		PRINT_ERR("hx9031as_read failed\n");
5e5a419c9407f6 Yasin Lee 2024-05-10  1190  
5e5a419c9407f6 Yasin Lee 2024-05-10  1191  	PRINT_INF("READ:Reg0x%02X=0x%02X\n", addr, rx_buf[0]);
5e5a419c9407f6 Yasin Lee 2024-05-10  1192  	return count;
5e5a419c9407f6 Yasin Lee 2024-05-10  1193  }
5e5a419c9407f6 Yasin Lee 2024-05-10  1194  
5e5a419c9407f6 Yasin Lee 2024-05-10  1195  static const struct file_operations hx9031as_reg_read_fops = {
5e5a419c9407f6 Yasin Lee 2024-05-10  1196  	.write = hx9031as_reg_read_store,
5e5a419c9407f6 Yasin Lee 2024-05-10  1197  };
5e5a419c9407f6 Yasin Lee 2024-05-10  1198  
5e5a419c9407f6 Yasin Lee 2024-05-10  1199  static ssize_t hx9031as_channel_en_store(struct file *file, const char __user *user_buf, size_t count, loff_t *ppos)
5e5a419c9407f6 Yasin Lee 2024-05-10  1200  {
5e5a419c9407f6 Yasin Lee 2024-05-10  1201  	int ch_id = 0;
5e5a419c9407f6 Yasin Lee 2024-05-10  1202  	int en = 0;
5e5a419c9407f6 Yasin Lee 2024-05-10  1203  	char buf[BUF_SIZE];
5e5a419c9407f6 Yasin Lee 2024-05-10  1204  
5e5a419c9407f6 Yasin Lee 2024-05-10  1205  	ENTER;
5e5a419c9407f6 Yasin Lee 2024-05-10  1206  	if (count > BUF_SIZE)
5e5a419c9407f6 Yasin Lee 2024-05-10  1207  		return -EINVAL;
5e5a419c9407f6 Yasin Lee 2024-05-10  1208  
5e5a419c9407f6 Yasin Lee 2024-05-10  1209  	if (copy_from_user(buf, user_buf, count))
5e5a419c9407f6 Yasin Lee 2024-05-10  1210  		return -EFAULT;
5e5a419c9407f6 Yasin Lee 2024-05-10  1211  
5e5a419c9407f6 Yasin Lee 2024-05-10  1212  	if (sscanf(buf, "%d,%d", &ch_id, &en) != 2) {
5e5a419c9407f6 Yasin Lee 2024-05-10  1213  		PRINT_ERR("please input two DEC numbers: ch_id,en (ch_id: channel number, en: 1=enable, 0=disable)\n");
5e5a419c9407f6 Yasin Lee 2024-05-10  1214  		return -EINVAL;
5e5a419c9407f6 Yasin Lee 2024-05-10  1215  	}
5e5a419c9407f6 Yasin Lee 2024-05-10  1216  
5e5a419c9407f6 Yasin Lee 2024-05-10  1217  	if ((ch_id >= HX9031AS_CH_NUM) || (ch_id < 0)) {
5e5a419c9407f6 Yasin Lee 2024-05-10  1218  		PRINT_ERR("channel number out of range, the effective number is 0~%d\n", HX9031AS_CH_NUM - 1);
5e5a419c9407f6 Yasin Lee 2024-05-10  1219  		return -EINVAL;
5e5a419c9407f6 Yasin Lee 2024-05-10  1220  	}
5e5a419c9407f6 Yasin Lee 2024-05-10  1221  
5e5a419c9407f6 Yasin Lee 2024-05-10  1222  	if ((hx9031as_pdata.channel_used_flag >> ch_id) & 0x01)
5e5a419c9407f6 Yasin Lee 2024-05-10  1223  		hx9031as_ch_en_hal(ch_id, (en > 0) ? 1 : 0);
5e5a419c9407f6 Yasin Lee 2024-05-10  1224  	else
5e5a419c9407f6 Yasin Lee 2024-05-10  1225  		PRINT_ERR("ch_%d is unused, you can not enable or disable an unused channel\n", ch_id);
5e5a419c9407f6 Yasin Lee 2024-05-10  1226  
5e5a419c9407f6 Yasin Lee 2024-05-10  1227  	return count;
5e5a419c9407f6 Yasin Lee 2024-05-10  1228  }
5e5a419c9407f6 Yasin Lee 2024-05-10  1229  
5e5a419c9407f6 Yasin Lee 2024-05-10  1230  static ssize_t hx9031as_channel_en_show(struct file *file, char __user *user_buf, size_t count, loff_t *ppos)
5e5a419c9407f6 Yasin Lee 2024-05-10  1231  {
5e5a419c9407f6 Yasin Lee 2024-05-10  1232  	char buf[BUF_SIZE] = {0};
5e5a419c9407f6 Yasin Lee 2024-05-10  1233  	char *p = buf;
5e5a419c9407f6 Yasin Lee 2024-05-10  1234  	int ii = 0;
5e5a419c9407f6 Yasin Lee 2024-05-10  1235  
5e5a419c9407f6 Yasin Lee 2024-05-10  1236  	for (ii = 0; ii < HX9031AS_CH_NUM; ii++) {
5e5a419c9407f6 Yasin Lee 2024-05-10  1237  		if ((hx9031as_pdata.channel_used_flag >> ii) & 0x1) {
5e5a419c9407f6 Yasin Lee 2024-05-10  1238  			PRINT_INF("hx9031as_pdata.chs_info[%d].enabled=%d\n",
5e5a419c9407f6 Yasin Lee 2024-05-10  1239  						ii, hx9031as_pdata.chs_info[ii].enabled);
5e5a419c9407f6 Yasin Lee 2024-05-10 @1240  			p += snprintf(p, PAGE_SIZE, "hx9031as_pdata.chs_info[%d].enabled=%d\n",
5e5a419c9407f6 Yasin Lee 2024-05-10  1241  						ii, hx9031as_pdata.chs_info[ii].enabled);
5e5a419c9407f6 Yasin Lee 2024-05-10  1242  		}
5e5a419c9407f6 Yasin Lee 2024-05-10  1243  	}
5e5a419c9407f6 Yasin Lee 2024-05-10  1244  
5e5a419c9407f6 Yasin Lee 2024-05-10  1245  	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
5e5a419c9407f6 Yasin Lee 2024-05-10  1246  }
5e5a419c9407f6 Yasin Lee 2024-05-10  1247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

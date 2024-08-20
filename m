Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C2018E345
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Aug 2024 16:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724169949; cv=none; b=Yum0HqvdbAJhqeHJIbhKLm1GeRH1WVZQccRnbD53DPgvS1H/Hg8epg2k7zd3XjzaYC5s1ROO0q5hra8PrlqH92SBRdhuUCWQKARBWbNs2bS89Y3aLll5RgE84RmLcj6usIYqK8ZXGSnLC20SUBkEQeLu0fsvjSHswQEVAt6GTHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724169949; c=relaxed/simple;
	bh=UwgpuPsWfa1OG8HP53pcUvT+bL89j13oHXJ2xHu4Xas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=inFBheA6Cna+zeco0Qh89wgkfbY2xQDuG1K592zHel7n/iiQb2S5LnTfv80DO4lochVQVRpiz+QK2HxwOq4RyD40bRTMtsydAwkjo8E7LdtTaRuM8ZjQIUQoIbqsoEdYVJQjquFnd9ba4q5rYikeJxQOE1WDxAD8leh7lKPK4XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bniu5Ctz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bniu5Ctz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724169946; x=1755705946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UwgpuPsWfa1OG8HP53pcUvT+bL89j13oHXJ2xHu4Xas=;
  b=Bniu5Ctz2Z5FlCqkK8Sz9C5QiDDncrnlLGn3pOdN30i1ggu5DQw+LqKx
   KoSPuWQIdqOBJfnFhxmvF2k4DJBIM/qdSGr4rDqGFWrRDAYw3tb5S54Lz
   4qLwKfNP6wQ8Wnk2p3y8FA1EYsZLxZZD4cIKaXHzbD3+8ztV865o8nxR/
   1VbNZ6abFacWyhEX4wPm01C0E6vT7JbjBzICe1FCwc1AJNp62UWIL7KwV
   Lak9sy/ykfYL75dbzg57AurHsM1PmU+JF7JQAbPnyWv9b4wwtA46HBklZ
   dl+2D7aCLmpC0b76pecW6/lTbN9TN35Kr2NVW2oxjyBqn6IQl3KBbj7Ee
   w==;
X-CSE-ConnectionGUID: I5BYVdF5SZ23EUpdibbTgA==
X-CSE-MsgGUID: 4s63/IDyQvKp1mYqLA8GQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22629607"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="22629607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 09:05:45 -0700
X-CSE-ConnectionGUID: tULH51kwRcWa53nvHuKgmw==
X-CSE-MsgGUID: z1vc/5A1QVuLZlxBmaqCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="61550820"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2024 09:05:45 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgRMb-000ANw-2a;
	Tue, 20 Aug 2024 16:05:41 +0000
Date: Wed, 21 Aug 2024 00:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 303/447]
 drivers/net/wireless/ath/ath6kl/debug.c:1077 ath6kl_regwrite_write() warn:
 potential spectre issue 'buf' [w]
Message-ID: <202408202320.4Kc7PlN5-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2e5eb501c913b2c9440308f4afe547f0cb6a7678
commit: dc12b935152047b1e7b1fedab6f1860bd79b7228 [303/447] drivers/net/wireless/ath/ath6kl: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240820 (https://download.01.org/0day-ci/archive/20240820/202408202320.4Kc7PlN5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408202320.4Kc7PlN5-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ath/ath6kl/debug.c:1077 ath6kl_regwrite_write() warn: potential spectre issue 'buf' [w]
drivers/net/wireless/ath/ath6kl/debug.c:1227 ath6kl_force_roam_write() warn: potential spectre issue 'buf' [w]
drivers/net/wireless/ath/ath6kl/debug.c:1258 ath6kl_roam_mode_write() warn: potential spectre issue 'buf' [w]
drivers/net/wireless/ath/ath6kl/debug.c:1391 ath6kl_create_qos_write() warn: potential spectre issue 'buf' [w]
drivers/net/wireless/ath/ath6kl/debug.c:1568 ath6kl_delete_qos_write() warn: potential spectre issue 'buf' [w]
drivers/net/wireless/ath/ath6kl/debug.c:1614 ath6kl_bgscan_int_write() warn: potential spectre issue 'buf' [w]
drivers/net/wireless/ath/ath6kl/debug.c:1653 ath6kl_listen_int_write() warn: potential spectre issue 'buf' [w]
drivers/net/wireless/ath/ath6kl/debug.c:1705 ath6kl_power_params_write() warn: potential spectre issue 'buf' [w]

vim +/buf +1077 drivers/net/wireless/ath/ath6kl/debug.c

252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1063  
dc12b935152047b Jens Axboe                2024-04-08  1064  static ssize_t ath6kl_regwrite_write(struct kiocb *iocb, struct iov_iter *from)
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1065  {
dc12b935152047b Jens Axboe                2024-04-08  1066  	struct ath6kl *ar = iocb->ki_filp->private_data;
dc12b935152047b Jens Axboe                2024-04-08  1067  	size_t count = iov_iter_count(from);
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1068  	char buf[32];
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1069  	char *sptr, *token;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1070  	unsigned int len = 0;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1071  	u32 reg_addr, reg_val;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1072  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1073  	len = min(count, sizeof(buf) - 1);
dc12b935152047b Jens Axboe                2024-04-08  1074  	if (!copy_from_iter_full(buf, len, from))
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1075  		return -EFAULT;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1076  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05 @1077  	buf[len] = '\0';
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1078  	sptr = buf;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1079  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1080  	token = strsep(&sptr, "=");
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1081  	if (!token)
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1082  		return -EINVAL;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1083  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1084  	if (kstrtou32(token, 0, &reg_addr))
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1085  		return -EINVAL;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1086  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1087  	if (!ath6kl_dbg_is_diag_reg_valid(reg_addr))
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1088  		return -EINVAL;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1089  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1090  	if (kstrtou32(sptr, 0, &reg_val))
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1091  		return -EINVAL;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1092  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1093  	ar->debug.diag_reg_addr_wr = reg_addr;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1094  	ar->debug.diag_reg_val_wr = reg_val;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1095  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1096  	if (ath6kl_diag_write32(ar, ar->debug.diag_reg_addr_wr,
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1097  				cpu_to_le32(ar->debug.diag_reg_val_wr)))
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1098  		return -EIO;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1099  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1100  	return count;
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1101  }
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1102  
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1103  static const struct file_operations fops_diag_reg_write = {
dc12b935152047b Jens Axboe                2024-04-08  1104  	.read_iter = ath6kl_regwrite_read,
dc12b935152047b Jens Axboe                2024-04-08  1105  	.write_iter = ath6kl_regwrite_write,
234e34058290121 Stephen Boyd              2012-04-05  1106  	.open = simple_open,
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1107  	.owner = THIS_MODULE,
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1108  	.llseek = default_llseek,
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1109  };
252c068b9fba574 Vasanthakumar Thiagarajan 2011-09-05  1110  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1111  int ath6kl_debug_roam_tbl_event(struct ath6kl *ar, const void *buf,
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1112  				size_t len)
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1113  {
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1114  	const struct wmi_target_roam_tbl *tbl;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1115  	u16 num_entries;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1116  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1117  	if (len < sizeof(*tbl))
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1118  		return -EINVAL;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1119  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1120  	tbl = (const struct wmi_target_roam_tbl *) buf;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1121  	num_entries = le16_to_cpu(tbl->num_entries);
df75786b9233be9 Gustavo A. R. Silva       2019-04-03  1122  	if (struct_size(tbl, info, num_entries) > len)
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1123  		return -EINVAL;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1124  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1125  	if (ar->debug.roam_tbl == NULL ||
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1126  	    ar->debug.roam_tbl_len < (unsigned int) len) {
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1127  		kfree(ar->debug.roam_tbl);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1128  		ar->debug.roam_tbl = kmalloc(len, GFP_ATOMIC);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1129  		if (ar->debug.roam_tbl == NULL)
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1130  			return -ENOMEM;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1131  	}
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1132  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1133  	memcpy(ar->debug.roam_tbl, buf, len);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1134  	ar->debug.roam_tbl_len = len;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1135  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1136  	if (test_bit(ROAM_TBL_PEND, &ar->flag)) {
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1137  		clear_bit(ROAM_TBL_PEND, &ar->flag);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1138  		wake_up(&ar->event_wq);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1139  	}
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1140  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1141  	return 0;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1142  }
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1143  
dc12b935152047b Jens Axboe                2024-04-08  1144  static ssize_t ath6kl_roam_table_read(struct kiocb *iocb, struct iov_iter *to)
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1145  {
dc12b935152047b Jens Axboe                2024-04-08  1146  	struct ath6kl *ar = iocb->ki_filp->private_data;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1147  	int ret;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1148  	long left;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1149  	struct wmi_target_roam_tbl *tbl;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1150  	u16 num_entries, i;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1151  	char *buf;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1152  	unsigned int len, buf_len;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1153  	ssize_t ret_cnt;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1154  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1155  	if (down_interruptible(&ar->sem))
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1156  		return -EBUSY;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1157  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1158  	set_bit(ROAM_TBL_PEND, &ar->flag);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1159  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1160  	ret = ath6kl_wmi_get_roam_tbl_cmd(ar->wmi);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1161  	if (ret) {
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1162  		up(&ar->sem);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1163  		return ret;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1164  	}
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1165  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1166  	left = wait_event_interruptible_timeout(
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1167  		ar->event_wq, !test_bit(ROAM_TBL_PEND, &ar->flag), WMI_TIMEOUT);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1168  	up(&ar->sem);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1169  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1170  	if (left <= 0)
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1171  		return -ETIMEDOUT;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1172  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1173  	if (ar->debug.roam_tbl == NULL)
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1174  		return -ENOMEM;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1175  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1176  	tbl = (struct wmi_target_roam_tbl *) ar->debug.roam_tbl;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1177  	num_entries = le16_to_cpu(tbl->num_entries);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1178  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1179  	buf_len = 100 + num_entries * 100;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1180  	buf = kzalloc(buf_len, GFP_KERNEL);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1181  	if (buf == NULL)
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1182  		return -ENOMEM;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1183  	len = 0;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1184  	len += scnprintf(buf + len, buf_len - len,
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1185  			 "roam_mode=%u\n\n"
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1186  			 "# roam_util bssid rssi rssidt last_rssi util bias\n",
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1187  			 le16_to_cpu(tbl->roam_mode));
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1188  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1189  	for (i = 0; i < num_entries; i++) {
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1190  		struct wmi_bss_roam_info *info = &tbl->info[i];
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1191  		len += scnprintf(buf + len, buf_len - len,
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1192  				 "%d %pM %d %d %d %d %d\n",
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1193  				 a_sle32_to_cpu(info->roam_util), info->bssid,
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1194  				 info->rssi, info->rssidt, info->last_rssi,
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1195  				 info->util, info->bias);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1196  	}
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1197  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1198  	if (len > buf_len)
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1199  		len = buf_len;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1200  
dc12b935152047b Jens Axboe                2024-04-08  1201  	ret_cnt = simple_copy_to_iter(buf, &iocb->ki_pos, len, to);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1202  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1203  	kfree(buf);
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1204  	return ret_cnt;
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1205  }
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1206  
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1207  static const struct file_operations fops_roam_table = {
dc12b935152047b Jens Axboe                2024-04-08  1208  	.read_iter = ath6kl_roam_table_read,
234e34058290121 Stephen Boyd              2012-04-05  1209  	.open = simple_open,
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1210  	.owner = THIS_MODULE,
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1211  	.llseek = default_llseek,
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1212  };
4b28a80dd6713c4 Jouni Malinen             2011-10-11  1213  
dc12b935152047b Jens Axboe                2024-04-08  1214  static ssize_t ath6kl_force_roam_write(struct kiocb *iocb,
dc12b935152047b Jens Axboe                2024-04-08  1215  				       struct iov_iter *from)
1261875f7a0a22d Jouni Malinen             2011-10-11  1216  {
dc12b935152047b Jens Axboe                2024-04-08  1217  	struct ath6kl *ar = iocb->ki_filp->private_data;
dc12b935152047b Jens Axboe                2024-04-08  1218  	size_t count = iov_iter_count(from);
1261875f7a0a22d Jouni Malinen             2011-10-11  1219  	int ret;
1261875f7a0a22d Jouni Malinen             2011-10-11  1220  	char buf[20];
1261875f7a0a22d Jouni Malinen             2011-10-11  1221  	size_t len;
1261875f7a0a22d Jouni Malinen             2011-10-11  1222  	u8 bssid[ETH_ALEN];
1261875f7a0a22d Jouni Malinen             2011-10-11  1223  
1261875f7a0a22d Jouni Malinen             2011-10-11  1224  	len = min(count, sizeof(buf) - 1);
dc12b935152047b Jens Axboe                2024-04-08  1225  	if (!copy_from_iter_full(buf, len, from))
1261875f7a0a22d Jouni Malinen             2011-10-11  1226  		return -EFAULT;
1261875f7a0a22d Jouni Malinen             2011-10-11 @1227  	buf[len] = '\0';
1261875f7a0a22d Jouni Malinen             2011-10-11  1228  
ade983307453cf6 Andy Shevchenko           2013-04-25  1229  	if (!mac_pton(buf, bssid))
1261875f7a0a22d Jouni Malinen             2011-10-11  1230  		return -EINVAL;
1261875f7a0a22d Jouni Malinen             2011-10-11  1231  
1261875f7a0a22d Jouni Malinen             2011-10-11  1232  	ret = ath6kl_wmi_force_roam_cmd(ar->wmi, bssid);
1261875f7a0a22d Jouni Malinen             2011-10-11  1233  	if (ret)
1261875f7a0a22d Jouni Malinen             2011-10-11  1234  		return ret;
1261875f7a0a22d Jouni Malinen             2011-10-11  1235  
1261875f7a0a22d Jouni Malinen             2011-10-11  1236  	return count;
1261875f7a0a22d Jouni Malinen             2011-10-11  1237  }
1261875f7a0a22d Jouni Malinen             2011-10-11  1238  
1261875f7a0a22d Jouni Malinen             2011-10-11  1239  static const struct file_operations fops_force_roam = {
dc12b935152047b Jens Axboe                2024-04-08  1240  	.write_iter = ath6kl_force_roam_write,
234e34058290121 Stephen Boyd              2012-04-05  1241  	.open = simple_open,
1261875f7a0a22d Jouni Malinen             2011-10-11  1242  	.owner = THIS_MODULE,
1261875f7a0a22d Jouni Malinen             2011-10-11  1243  	.llseek = default_llseek,
1261875f7a0a22d Jouni Malinen             2011-10-11  1244  };
1261875f7a0a22d Jouni Malinen             2011-10-11  1245  
dc12b935152047b Jens Axboe                2024-04-08  1246  static ssize_t ath6kl_roam_mode_write(struct kiocb *iocb, struct iov_iter *from)
1261875f7a0a22d Jouni Malinen             2011-10-11  1247  {
dc12b935152047b Jens Axboe                2024-04-08  1248  	struct ath6kl *ar = iocb->ki_filp->private_data;
dc12b935152047b Jens Axboe                2024-04-08  1249  	size_t count = iov_iter_count(from);
1261875f7a0a22d Jouni Malinen             2011-10-11  1250  	int ret;
1261875f7a0a22d Jouni Malinen             2011-10-11  1251  	char buf[20];
1261875f7a0a22d Jouni Malinen             2011-10-11  1252  	size_t len;
1261875f7a0a22d Jouni Malinen             2011-10-11  1253  	enum wmi_roam_mode mode;
1261875f7a0a22d Jouni Malinen             2011-10-11  1254  
1261875f7a0a22d Jouni Malinen             2011-10-11  1255  	len = min(count, sizeof(buf) - 1);
dc12b935152047b Jens Axboe                2024-04-08  1256  	if (!copy_from_iter_full(buf, len, from))
1261875f7a0a22d Jouni Malinen             2011-10-11  1257  		return -EFAULT;
1261875f7a0a22d Jouni Malinen             2011-10-11 @1258  	buf[len] = '\0';
1261875f7a0a22d Jouni Malinen             2011-10-11  1259  	if (len > 0 && buf[len - 1] == '\n')
1261875f7a0a22d Jouni Malinen             2011-10-11  1260  		buf[len - 1] = '\0';
1261875f7a0a22d Jouni Malinen             2011-10-11  1261  
1261875f7a0a22d Jouni Malinen             2011-10-11  1262  	if (strcasecmp(buf, "default") == 0)
1261875f7a0a22d Jouni Malinen             2011-10-11  1263  		mode = WMI_DEFAULT_ROAM_MODE;
1261875f7a0a22d Jouni Malinen             2011-10-11  1264  	else if (strcasecmp(buf, "bssbias") == 0)
1261875f7a0a22d Jouni Malinen             2011-10-11  1265  		mode = WMI_HOST_BIAS_ROAM_MODE;
1261875f7a0a22d Jouni Malinen             2011-10-11  1266  	else if (strcasecmp(buf, "lock") == 0)
1261875f7a0a22d Jouni Malinen             2011-10-11  1267  		mode = WMI_LOCK_BSS_MODE;
1261875f7a0a22d Jouni Malinen             2011-10-11  1268  	else
1261875f7a0a22d Jouni Malinen             2011-10-11  1269  		return -EINVAL;
1261875f7a0a22d Jouni Malinen             2011-10-11  1270  
1261875f7a0a22d Jouni Malinen             2011-10-11  1271  	ret = ath6kl_wmi_set_roam_mode_cmd(ar->wmi, mode);
1261875f7a0a22d Jouni Malinen             2011-10-11  1272  	if (ret)
1261875f7a0a22d Jouni Malinen             2011-10-11  1273  		return ret;
1261875f7a0a22d Jouni Malinen             2011-10-11  1274  
1261875f7a0a22d Jouni Malinen             2011-10-11  1275  	return count;
1261875f7a0a22d Jouni Malinen             2011-10-11  1276  }
1261875f7a0a22d Jouni Malinen             2011-10-11  1277  

:::::: The code at line 1077 was first introduced by commit
:::::: 252c068b9fba57493940af344b6d92ee3c278941 ath6kl: Add debugfs support to write a chip register

:::::: TO: Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>
:::::: CC: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

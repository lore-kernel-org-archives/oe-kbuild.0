Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAF41448E9
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Mar 2024 23:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711926599; cv=none; b=fLIvacAS/X0dAt4bnzvepT5gQLgHDUleUuMc6kylzB2aKpKBIbarjfcsTdfI0nU/a7tQtIfH6m6APOzjC95Iy+NVBnUA6Fd4fo5ae585bseVLq9TcCXF5udzYyjhWDAah81UiyDubtnmqE9VFEReVqYA0h7ri2smJAkNXIDt25Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711926599; c=relaxed/simple;
	bh=LM+E9pZfj88Xc+r1CMtPdqADSD8ZnvoDRT856thuolk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nc2Ebqc82SjyrMOwpcN4noKIFVpfWTY7vOuPhQQgvwmJXRDV22ackwrvIEqWAxNPHND7idYMQnBt1PoLI6zQA7SP2zXAW7nXL2aRT7uEZBHzPszzXQSCw5rAEh0PtKTorjFM2rE1pkBLDFv5ZXGAojcvGTorMFs4wz8eawDivOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Igu5AS3a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Igu5AS3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711926597; x=1743462597;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LM+E9pZfj88Xc+r1CMtPdqADSD8ZnvoDRT856thuolk=;
  b=Igu5AS3anpdvvIIIEbt5XawTZFjgLcdBRAI9jUHvJGKbl8O20kBTzsEa
   1V1dkgY4acCKLdYsFDlj8FdN+7Fyhds9v+oDsi5NSDtiJlfic4p154jF6
   sbwmPb9F2A4gqZaHywubyZOyEVrO1Hlm3oEKlkcQlGTnHbhi7FTgi8umY
   qTQa3pH2pFwiy8j4qG9nPG7MWc5LHYfSO4ffzbFIDA42wlOSlHCuo5T9i
   iOMROCykqptMUAlelbupYQoCrrx07hzIQxoSoW11BKlkgsZc823zACxGr
   1fxOFGKakK0J30onTYvAx84/XN8tlHxWkBuIlvTVNlxV5Yzbvsk5WS67f
   Q==;
X-CSE-ConnectionGUID: DBiVbaATRvuI+e6zVYwmNA==
X-CSE-MsgGUID: vtMu0QE1Sk2KENfHUZEnNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7234084"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="7234084"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 16:09:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="22212790"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2024 16:09:54 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr4JE-0001Tg-0t;
	Sun, 31 Mar 2024 23:09:52 +0000
Date: Mon, 1 Apr 2024 07:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1131/2532] drivers/pwm/core.c:1282
 pwm_cdev_ioctl() warn: potential spectre issue 'cdata->pwm' [r]
Message-ID: <202404010703.o1yYkXrA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: 0835e5c8704297e91b54071c3bbcd0c05c63bd3f [1131/2532] pwm: Add support for pwmchip devices for faster and easier userspace access
:::::: branch date: 4 days ago
:::::: commit date: 7 days ago
config: m68k-randconfig-r071-20240326 (https://download.01.org/0day-ci/archive/20240401/202404010703.o1yYkXrA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404010703.o1yYkXrA-lkp@intel.com/

New smatch warnings:
drivers/pwm/core.c:1282 pwm_cdev_ioctl() warn: potential spectre issue 'cdata->pwm' [r]
drivers/pwm/core.c:1284 pwm_cdev_ioctl() warn: possible spectre second half.  'pwm'
drivers/pwm/core.c:1368 pwm_cdev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/pwm/core.c:1357 pwm_cdev_ioctl() warn: possible spectre second half.  'pwm'
drivers/pwm/core.c:1871 pwm_put() warn: variable dereferenced before check 'pwm' (see line 1869)

vim +1282 drivers/pwm/core.c

0835e5c8704297 Uwe Kleine-König 2024-03-17  1225  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1226  static long pwm_cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1227  {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1228  	int ret = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1229  	struct pwm_cdev_data *cdata = file->private_data;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1230  	struct pwm_chip *chip = cdata->chip;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1231  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1232  	mutex_lock(&pwm_lock);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1233  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1234  	if (!chip->operational) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1235  		ret = -ENODEV;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1236  		goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1237  	}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1238  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1239  	switch (cmd) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1240  	case PWM_IOCTL_GET_NUM_PWMS:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1241  		ret = chip->npwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1242  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1243  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1244  	case PWM_IOCTL_REQUEST:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1245  		{
0835e5c8704297 Uwe Kleine-König 2024-03-17  1246  			unsigned int hwpwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1247  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1248  			ret = get_user(hwpwm, (unsigned int __user *)arg);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1249  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1250  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1251  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1252  			ret = pwm_cdev_request(cdata, hwpwm);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1253  		}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1254  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1255  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1256  	case PWM_IOCTL_FREE:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1257  		{
0835e5c8704297 Uwe Kleine-König 2024-03-17  1258  			unsigned int hwpwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1259  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1260  			ret = get_user(hwpwm, (unsigned int __user *)arg);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1261  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1262  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1263  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1264  			ret = pwm_cdev_free(cdata, hwpwm);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1265  		}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1266  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1267  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1268  	case PWM_IOCTL_GET:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1269  		{
0835e5c8704297 Uwe Kleine-König 2024-03-17  1270  			struct pwmchip_state cstate;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1271  			struct pwm_state state;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1272  			struct pwm_device *pwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1273  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1274  			ret = copy_from_user(&cstate, (struct pwmchip_state __user *)arg, sizeof(cstate));
0835e5c8704297 Uwe Kleine-König 2024-03-17  1275  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1276  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1277  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1278  			ret = pwm_cdev_request(cdata, cstate.hwpwm);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1279  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1280  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1281  
0835e5c8704297 Uwe Kleine-König 2024-03-17 @1282  			pwm = cdata->pwm[cstate.hwpwm];
0835e5c8704297 Uwe Kleine-König 2024-03-17  1283  
0835e5c8704297 Uwe Kleine-König 2024-03-17 @1284  			ret = pwm_get_state_hw(pwm, &state);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1285  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1286  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1287  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1288  			if (state.enabled) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1289  				cstate.period = state.period;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1290  				if (state.polarity == PWM_POLARITY_NORMAL) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1291  					cstate.duty_offset = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1292  					cstate.duty_cycle = state.duty_cycle;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1293  				} else {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1294  					cstate.duty_offset = state.duty_cycle;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1295  					cstate.duty_cycle = state.period - state.duty_cycle;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1296  				}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1297  			} else {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1298  				cstate.period = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1299  				cstate.duty_cycle = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1300  				cstate.duty_offset = 0;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1301  			}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1302  			ret = copy_to_user((struct pwmchip_state __user *)arg, &cstate, sizeof(cstate));
0835e5c8704297 Uwe Kleine-König 2024-03-17  1303  		}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1304  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1305  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1306  	case PWM_IOCTL_APPLY:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1307  		{
0835e5c8704297 Uwe Kleine-König 2024-03-17  1308  			struct pwmchip_state cstate;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1309  			struct pwm_state state = { };
0835e5c8704297 Uwe Kleine-König 2024-03-17  1310  			struct pwm_device *pwm;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1311  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1312  			ret = copy_from_user(&cstate, (struct pwmchip_state __user *)arg, sizeof(cstate));
0835e5c8704297 Uwe Kleine-König 2024-03-17  1313  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1314  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1315  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1316  			if (cstate.period > 0 &&
0835e5c8704297 Uwe Kleine-König 2024-03-17  1317  			    (cstate.duty_cycle > cstate.period ||
0835e5c8704297 Uwe Kleine-König 2024-03-17  1318  			     cstate.duty_offset >= cstate.period)) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1319  				ret = -EINVAL;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1320  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1321  			}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1322  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1323  			/*
0835e5c8704297 Uwe Kleine-König 2024-03-17  1324  			 * While the API provides a duty_offset member
0835e5c8704297 Uwe Kleine-König 2024-03-17  1325  			 * to describe (among others) also inversed
0835e5c8704297 Uwe Kleine-König 2024-03-17  1326  			 * polarity wave forms, the translation into the
0835e5c8704297 Uwe Kleine-König 2024-03-17  1327  			 * traditional representation with a (binary) polarity
0835e5c8704297 Uwe Kleine-König 2024-03-17  1328  			 * isn't trivial because the lowlevel drivers round
0835e5c8704297 Uwe Kleine-König 2024-03-17  1329  			 * duty_cycle down when applying a setting and so in the
0835e5c8704297 Uwe Kleine-König 2024-03-17  1330  			 * representation with duty_offset the rounding is
0835e5c8704297 Uwe Kleine-König 2024-03-17  1331  			 * inconsistent. I have no idea what's the best way to
0835e5c8704297 Uwe Kleine-König 2024-03-17  1332  			 * fix that, so to not commit to a solution yet, just
0835e5c8704297 Uwe Kleine-König 2024-03-17  1333  			 * refuse requests with .duty_offset that would yield
0835e5c8704297 Uwe Kleine-König 2024-03-17  1334  			 * inversed polarity for now.
0835e5c8704297 Uwe Kleine-König 2024-03-17  1335  			 */
0835e5c8704297 Uwe Kleine-König 2024-03-17  1336  			if (cstate.duty_cycle < cstate.period &&
0835e5c8704297 Uwe Kleine-König 2024-03-17  1337  			    cstate.duty_offset + cstate.duty_cycle >= cstate.period) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1338  				ret = -EINVAL;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1339  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1340  			}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1341  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1342  			ret = pwm_cdev_request(cdata, cstate.hwpwm);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1343  			if (ret)
0835e5c8704297 Uwe Kleine-König 2024-03-17  1344  				goto out_unlock;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1345  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1346  			pwm = cdata->pwm[cstate.hwpwm];
0835e5c8704297 Uwe Kleine-König 2024-03-17  1347  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1348  			if (cstate.period > 0) {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1349  				state.enabled = true;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1350  				state.period = cstate.period;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1351  				state.polarity = PWM_POLARITY_NORMAL;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1352  				state.duty_cycle = cstate.duty_cycle;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1353  			} else {
0835e5c8704297 Uwe Kleine-König 2024-03-17  1354  				state.enabled = false;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1355  			}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1356  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1357  			ret = pwm_apply_might_sleep(pwm, &state);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1358  		}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1359  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1360  
0835e5c8704297 Uwe Kleine-König 2024-03-17  1361  	default:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1362  		ret = -ENOTTY;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1363  		break;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1364  	}
0835e5c8704297 Uwe Kleine-König 2024-03-17  1365  out_unlock:
0835e5c8704297 Uwe Kleine-König 2024-03-17  1366  	mutex_unlock(&pwm_lock);
0835e5c8704297 Uwe Kleine-König 2024-03-17  1367  
0835e5c8704297 Uwe Kleine-König 2024-03-17 @1368  	return ret;
0835e5c8704297 Uwe Kleine-König 2024-03-17  1369  }
0835e5c8704297 Uwe Kleine-König 2024-03-17  1370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

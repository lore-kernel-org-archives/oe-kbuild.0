Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E8BA45
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 07:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725952628; cv=none; b=CT2qNacRe1sv7ms48kGcC/lwJ5vf3frPryQnIyCx2S7jITUrNCzN5u7sgOWZy3Q7icSF1ANwN2dM3SIW9W9d6p07CqMJcKCz7GlVKNffoTZDi5ZX2AqcYQuUZJ0ZO39dWbsaznZ4jTHk2MF07JNOv6WMS3c3AqYpGPaLZw0Egnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725952628; c=relaxed/simple;
	bh=5BUtYxoMgiJN1yo5t/sxYHaoBP6epnUy/MXui/KkQl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/sG/dQh1Rl4sH1c4VHVcNrWcGzwYeVQJX3CfmnTkUCX1YHr4c6U7lZBrmm+MyFL+nS6wwhZ0rOj3fCRTzY80wYGrjb6kkuVbuGg72xKNLyUipYlM2sRtuEZ8pf4M5eGThJ2OIGFqNX843Ha9mq/NrgL61en4k2qZ2EbmM/Dhxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EM68M21U; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EM68M21U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725952626; x=1757488626;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5BUtYxoMgiJN1yo5t/sxYHaoBP6epnUy/MXui/KkQl4=;
  b=EM68M21Ul2Ahv1L+7MkhijnNEmPvqfez5C140hXwLl1zImbXoTZAL/Ln
   U+/uIKMNunGLFCV19aVo3fMNU0j6p4BpA0RwyJAGjoiPuMCPye86MMQsb
   I/neINLxGwvrnZ3Sn5N9+CUEv5CVasnLf9FhywOVWKPHX/XtnKejVdPPe
   UUyDhz5NLFiY5uIwcIS8dH9XahtI0NG66hzXFcjMbhr4mDIqZH02hwN2g
   Uh5Tmi2rp5mWV3Be4dvP4CsGikfnmZLn3mexm7ZKv1meKsvpXutHM5ing
   ht8wT+CMaSXIPjzU8zJQd53sut2OsZWDg1J3sb5wdTd30ZhRmv7Qee0hY
   Q==;
X-CSE-ConnectionGUID: HzIoadBWQ82A/2ziAiQjkQ==
X-CSE-MsgGUID: zqXmv0cMRtKRu6GShoHFYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28572879"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="28572879"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 00:16:52 -0700
X-CSE-ConnectionGUID: QDgYUt+hTriFWbd5rnI+MQ==
X-CSE-MsgGUID: HxaDD9RySgiZ1zU3/osPGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66563908"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2024 00:16:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snv7I-0000DG-2k;
	Tue, 10 Sep 2024 07:16:48 +0000
Date: Tue, 10 Sep 2024 15:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ukleinek:pwm/chardev 17/20] drivers/pwm/core.c:1733
 pwm_cdev_ioctl() warn: potential spectre issue 'cdata->pwm' [r]
Message-ID: <202409101520.1ygRewId-lkp@intel.com>
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
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/chardev
head:   c0afe400b52825e23de3ebdcbaa4229d6b38eeda
commit: 00c9f1181dc351e1e6041ba6e41e4c30b12b6a27 [17/20] pwm: Add support for pwmchip devices for faster and easier userspace access
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: microblaze-randconfig-r073-20240909 (https://download.01.org/0day-ci/archive/20240910/202409101520.1ygRewId-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409101520.1ygRewId-lkp@intel.com/

New smatch warnings:
drivers/pwm/core.c:1733 pwm_cdev_ioctl() warn: potential spectre issue 'cdata->pwm' [r]
drivers/pwm/core.c:1741 pwm_cdev_ioctl() warn: possible spectre second half.  'pwm'

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.
drivers/pwm/core.c:1780 pwm_cdev_ioctl() warn: possible spectre second half.  'pwm'
drivers/pwm/core.c:1827 pwm_cdev_ioctl() warn: possible spectre second half.  'pwm'

vim +1733 drivers/pwm/core.c

00c9f1181dc351 Uwe Kleine-König 2024-07-29  1677  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1678  static long pwm_cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1679  {
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1680  	int ret = 0;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1681  	struct pwm_cdev_data *cdata = file->private_data;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1682  	struct pwm_chip *chip = cdata->chip;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1683  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1684  	guard(mutex)(&pwm_lock);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1685  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1686  	if (!chip->operational)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1687  		return -ENODEV;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1688  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1689  	switch (cmd) {
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1690  	case PWM_IOCTL_REQUEST:
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1691  		{
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1692  			unsigned int hwpwm;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1693  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1694  			ret = get_user(hwpwm, (unsigned int __user *)arg);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1695  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1696  				return ret;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1697  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1698  			return pwm_cdev_request(cdata, hwpwm);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1699  		}
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1700  		break;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1701  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1702  	case PWM_IOCTL_FREE:
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1703  		{
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1704  			unsigned int hwpwm;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1705  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1706  			ret = get_user(hwpwm, (unsigned int __user *)arg);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1707  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1708  				return ret;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1709  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1710  			return pwm_cdev_free(cdata, hwpwm);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1711  		}
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1712  		break;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1713  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1714  	case PWM_IOCTL_ROUNDWF:
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1715  		{
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1716  			struct pwmchip_waveform cwf;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1717  			struct pwm_waveform wf;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1718  			struct pwm_device *pwm;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1719  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1720  			ret = copy_from_user(&cwf,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1721  					     (struct pwmchip_waveform __user *)arg,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1722  					     sizeof(cwf));
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1723  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1724  				return -EFAULT;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1725  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1726  			if (cwf.__pad != 0)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1727  				return -EINVAL;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1728  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1729  			ret = pwm_cdev_request(cdata, cwf.hwpwm);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1730  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1731  				return ret;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1732  
00c9f1181dc351 Uwe Kleine-König 2024-07-29 @1733  			pwm = cdata->pwm[cwf.hwpwm];
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1734  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1735  			wf = (struct pwm_waveform) {
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1736  				.period_length_ns = cwf.period_length_ns,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1737  				.duty_length_ns = cwf.duty_length_ns,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1738  				.duty_offset_ns = cwf.duty_offset_ns,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1739  			};
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1740  
00c9f1181dc351 Uwe Kleine-König 2024-07-29 @1741  			ret = pwm_round_waveform_might_sleep(pwm, &wf);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1742  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1743  				return ret;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1744  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1745  			cwf = (struct pwmchip_waveform) {
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1746  				.hwpwm = cwf.hwpwm,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1747  				.period_length_ns = wf.period_length_ns,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1748  				.duty_length_ns = wf.duty_length_ns,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1749  				.duty_offset_ns = wf.duty_offset_ns,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1750  			};
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1751  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1752  			return copy_to_user((struct pwmchip_waveform __user *)arg,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1753  					    &cwf, sizeof(cwf));
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1754  		}
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1755  		break;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1756  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1757  	case PWM_IOCTL_GETWF:
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1758  		{
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1759  			struct pwmchip_waveform cwf;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1760  			struct pwm_waveform wf;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1761  			struct pwm_device *pwm;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1762  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1763  			ret = copy_from_user(&cwf,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1764  					     (struct pwmchip_waveform __user *)arg,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1765  					     sizeof(cwf));
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1766  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1767  				return -EFAULT;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1768  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1769  			if (cwf.__pad != 0) {
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1770  				pr_warn("huh\n");
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1771  				return -EINVAL;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1772  			}
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1773  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1774  			ret = pwm_cdev_request(cdata, cwf.hwpwm);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1775  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1776  				return ret;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1777  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1778  			pwm = cdata->pwm[cwf.hwpwm];
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1779  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1780  			ret = pwm_get_waveform_might_sleep(pwm, &wf);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1781  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1782  				return ret;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1783  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1784  			cwf.period_length_ns = wf.period_length_ns;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1785  			cwf.duty_length_ns = wf.duty_length_ns;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1786  			cwf.duty_offset_ns = wf.duty_offset_ns;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1787  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1788  			return copy_to_user((struct pwmchip_waveform __user *)arg,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1789  					    &cwf, sizeof(cwf));
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1790  		}
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1791  		break;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1792  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1793  	case PWM_IOCTL_SETROUNDEDWF:
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1794  	case PWM_IOCTL_SETEXACTWF:
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1795  		{
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1796  			struct pwmchip_waveform cwf;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1797  			struct pwm_waveform wf;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1798  			struct pwm_device *pwm;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1799  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1800  			ret = copy_from_user(&cwf,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1801  					     (struct pwmchip_waveform __user *)arg,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1802  					     sizeof(cwf));
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1803  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1804  				return -EFAULT;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1805  			if (cwf.__pad != 0) {
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1806  				pr_warn("huh\n");
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1807  				return -EINVAL;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1808  			}
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1809  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1810  			if (cwf.period_length_ns > 0 &&
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1811  			    (cwf.duty_length_ns > cwf.period_length_ns ||
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1812  			     cwf.duty_offset_ns >= cwf.period_length_ns))
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1813  				return -EINVAL;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1814  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1815  			ret = pwm_cdev_request(cdata, cwf.hwpwm);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1816  			if (ret)
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1817  				return ret;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1818  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1819  			pwm = cdata->pwm[cwf.hwpwm];
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1820  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1821  			wf = (struct pwm_waveform){
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1822  				.period_length_ns = cwf.period_length_ns,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1823  				.duty_length_ns = cwf.duty_length_ns,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1824  				.duty_offset_ns = cwf.duty_offset_ns,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1825  			};
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1826  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1827  			return pwm_set_waveform_might_sleep(pwm, &wf,
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1828  							    cmd == PWM_IOCTL_SETEXACTWF);
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1829  		}
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1830  		break;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1831  
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1832  	default:
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1833  		return -ENOTTY;
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1834  	}
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1835  }
00c9f1181dc351 Uwe Kleine-König 2024-07-29  1836  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

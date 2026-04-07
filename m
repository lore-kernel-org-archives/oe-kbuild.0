Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEA42D73B8
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 04:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534560; cv=none; b=EyjRU+6B3whHig9iWKp8ieW3eWqmAbNuyzdMRoFDJsBiGPfYYXHivfiA4ZB4xtilkksuZikokHQMbm1ymNSNmbvNtQuEjrsr6ZEqKuu7aT5Agvc4I93pvYxYa9TVEPLJZ726JVNMh9V72QbDxrgfdDuE7ipF/F84+pA00z5Ckgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534560; c=relaxed/simple;
	bh=LjJK86Sya6W0U55t2g9rE2YURAU0LXnxzHp1puPZD6Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KUkixb/Cke3gWnM+lT1I+b8lrVa4/j/qQgBYifiv+1sU1DacYJO8EJmdpbQWZsLm0d/zyFy+ruxoz24FfFYMcWvltMRAwPtIgcaQXfgGRfLOwG6UuOKsb1nHNuyoaf9mQImSvWfLzd8c7xKXCisnWxPJvpryamQDT/BS057Idro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRg56Vcu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRg56Vcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534559; x=1807070559;
  h=date:from:to:cc:subject:message-id;
  bh=LjJK86Sya6W0U55t2g9rE2YURAU0LXnxzHp1puPZD6Y=;
  b=NRg56VcuwmY+RIBR4cDgOywfJscoOuTOi6ivku+KkNfCsuJQu7ijuqay
   Ae4KrNlEyPiyO/7Ri8jLIosRmqrtxFnuXzCial8kyKNeEgh5z4DSibvJG
   D2bJM4Yf5PU7aN94YcbV33s6Aca1ST4boC2Vj0nkndkSt30/czII3kQBX
   ep7jfSDd1trxrlHXeWcRhzTxAJS6Chy71C7NxpoFbR05E0qSrIZsJjmwd
   3/i8lGh9qEXjMUVpgrunRsvEoIFFxcZyxiFQCZsSHE7bNyjO6ccmrXUnv
   mBR266rWDnSykU7LgrzRMhQWdRz8z1hji2+irzyzhJtqSLLWsa1edhxot
   g==;
X-CSE-ConnectionGUID: lPVJfZ1vQn+nuVabQxpYQQ==
X-CSE-MsgGUID: netUt23DSSGJ3QhGiaPUYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76386016"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76386016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:02:38 -0700
X-CSE-ConnectionGUID: hGwNyjpaQnu3X2Jugz68AA==
X-CSE-MsgGUID: V4ssAq77Sgy83I+JelHwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227957158"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 21:02:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xe5-0000000008D-3oty;
	Tue, 07 Apr 2026 04:02:33 +0000
Date: Tue, 07 Apr 2026 12:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9740/12133]
 drivers/soc/qcom/wcnss_ctrl.c:269 wcnss_download_nv() warn: 'fw' from
 request_firmware() not released on lines: 225.
Message-ID: <202604060902.awXdPsBh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rosen Penev <rosenp@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
commit: 908061f0ad30aa08ce211c6a8f95d29102e570bd [9740/12133] soc: qcom: wcnss: simplify allocation of req
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: sparc64-randconfig-r072-20260406 (https://download.01.org/0day-ci/archive/20260406/202604060902.awXdPsBh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604060902.awXdPsBh-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/wcnss_ctrl.c:269 wcnss_download_nv() warn: 'fw' from request_firmware() not released on lines: 225.

vim +/fw +269 drivers/soc/qcom/wcnss_ctrl.c

ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  192  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  193  /**
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  194   * wcnss_download_nv() - send nv binary to WCNSS
6be2b3d0848d1e Bjorn Andersson     2016-06-06  195   * @wcnss:	wcnss_ctrl state handle
6be2b3d0848d1e Bjorn Andersson     2016-06-06  196   * @expect_cbc:	indicator to caller that an cbc event is expected
6be2b3d0848d1e Bjorn Andersson     2016-06-06  197   *
6be2b3d0848d1e Bjorn Andersson     2016-06-06  198   * Returns 0 on success. Negative errno on failure.
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  199   */
6be2b3d0848d1e Bjorn Andersson     2016-06-06  200  static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  201  {
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  202  	const struct firmware *fw;
ac3f2784200d49 Bjorn Andersson     2021-03-11  203  	struct device *dev = wcnss->dev;
908061f0ad30aa Rosen Penev         2026-03-26  204  	struct wcnss_download_nv_req *req;
82ec0c290d1a73 Bjorn Andersson     2021-03-11  205  	const char *nvbin = NVBIN_FILE;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  206  	const void *data;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  207  	ssize_t left;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  208  	int ret;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  209  
82ec0c290d1a73 Bjorn Andersson     2021-03-11  210  	ret = of_property_read_string(dev->of_node, "firmware-name", &nvbin);
82ec0c290d1a73 Bjorn Andersson     2021-03-11  211  	if (ret < 0 && ret != -EINVAL)
b066a2c430f3f8 Krzysztof Kozlowski 2024-07-03  212  		return ret;
82ec0c290d1a73 Bjorn Andersson     2021-03-11  213  
82ec0c290d1a73 Bjorn Andersson     2021-03-11  214  	ret = request_firmware(&fw, nvbin, dev);
6be2b3d0848d1e Bjorn Andersson     2016-06-06  215  	if (ret < 0) {
82ec0c290d1a73 Bjorn Andersson     2021-03-11  216  		dev_err(dev, "Failed to load nv file %s: %d\n", nvbin, ret);
b066a2c430f3f8 Krzysztof Kozlowski 2024-07-03  217  		return ret;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  218  	}
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  219  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  220  	data = fw->data;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  221  	left = fw->size;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  222  
908061f0ad30aa Rosen Penev         2026-03-26  223  	req = kzalloc_flex(*req, fragment, NV_FRAGMENT_SIZE);
908061f0ad30aa Rosen Penev         2026-03-26  224  	if (!req)
908061f0ad30aa Rosen Penev         2026-03-26  225  		return -ENOMEM;
908061f0ad30aa Rosen Penev         2026-03-26  226  
908061f0ad30aa Rosen Penev         2026-03-26  227  	req->frag_size = NV_FRAGMENT_SIZE;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  228  	req->hdr.type = WCNSS_DOWNLOAD_NV_REQ;
908061f0ad30aa Rosen Penev         2026-03-26  229  	req->hdr.len = struct_size(req, fragment, NV_FRAGMENT_SIZE);
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  230  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  231  	req->last = 0;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  232  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  233  	req->seq = 0;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  234  	do {
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  235  		if (left <= NV_FRAGMENT_SIZE) {
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  236  			req->last = 1;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  237  			req->frag_size = left;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  238  			req->hdr.len = sizeof(*req) + left;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  239  		}
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  240  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  241  		memcpy(req->fragment, data, req->frag_size);
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  242  
5052de8deff561 Bjorn Andersson     2017-03-27  243  		ret = rpmsg_send(wcnss->channel, req, req->hdr.len);
6be2b3d0848d1e Bjorn Andersson     2016-06-06  244  		if (ret < 0) {
ac3f2784200d49 Bjorn Andersson     2021-03-11  245  			dev_err(dev, "failed to send smd packet\n");
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  246  			goto release_fw;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  247  		}
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  248  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  249  		/* Increment for next fragment */
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  250  		req->seq++;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  251  
90c29ed7627b6b Bjorn Andersson     2018-02-27  252  		data += NV_FRAGMENT_SIZE;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  253  		left -= NV_FRAGMENT_SIZE;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  254  	} while (left > 0);
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  255  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  256  	ret = wait_for_completion_timeout(&wcnss->ack, WCNSS_REQUEST_TIMEOUT);
6be2b3d0848d1e Bjorn Andersson     2016-06-06  257  	if (!ret) {
ac3f2784200d49 Bjorn Andersson     2021-03-11  258  		dev_err(dev, "timeout waiting for nv upload ack\n");
6be2b3d0848d1e Bjorn Andersson     2016-06-06  259  		ret = -ETIMEDOUT;
6be2b3d0848d1e Bjorn Andersson     2016-06-06  260  	} else {
6be2b3d0848d1e Bjorn Andersson     2016-06-06  261  		*expect_cbc = wcnss->ack_status == WCNSS_ACK_COLD_BOOTING;
6be2b3d0848d1e Bjorn Andersson     2016-06-06  262  		ret = 0;
6be2b3d0848d1e Bjorn Andersson     2016-06-06  263  	}
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  264  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  265  release_fw:
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  266  	release_firmware(fw);
908061f0ad30aa Rosen Penev         2026-03-26  267  	kfree(req);
6be2b3d0848d1e Bjorn Andersson     2016-06-06  268  
6be2b3d0848d1e Bjorn Andersson     2016-06-06 @269  	return ret;
6be2b3d0848d1e Bjorn Andersson     2016-06-06  270  }
6be2b3d0848d1e Bjorn Andersson     2016-06-06  271  

:::::: The code at line 269 was first introduced by commit
:::::: 6be2b3d0848d1ed3e78e416cc4ae9007e85c7533 soc: qcom: wcnss_ctrl: Make wcnss_ctrl parent the other components

:::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
:::::: CC: Andy Gross <andy.gross@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

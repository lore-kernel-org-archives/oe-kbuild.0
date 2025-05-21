Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE1B22C321
	for <oe-kbuild@lists.linux.dev>; Wed, 21 May 2025 02:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747793704; cv=none; b=fkbus/a5jpxGM0LeojxpGW40KkRz4G3Vg0zqoZwLgX8rWfXJXqZ51Xv3zPN6h7DJLu+kvyWQ6QpyxdUrZ7itGzPeabO2+lkHyCFO+IkQOht8LlQT3KVIK5B+Xpyeoh94zes/lYWmhXSmaHbFAtbA84RnoXAAgyinZHWOwpBi2y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747793704; c=relaxed/simple;
	bh=W/ffaTAFdJ6EaYvKJgVl1RfDQS+kDqT7oIsOd3BOmAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4utJvIvtQnIP3FyA/peKU9sSirboEtfB0euM1dGZer883ne+RdqaRjDSdB7DtttIf7Fnj6SHLAAajMgw8feW4c6M1B68l4SYq3fIYBecrQ0i9PGmjdXYcxjLImUUiiJOFbEb0MsiI26Bua82Nn2tVDdD3YZYiob8ka78poZhbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYFweieq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYFweieq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747793702; x=1779329702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/ffaTAFdJ6EaYvKJgVl1RfDQS+kDqT7oIsOd3BOmAc=;
  b=UYFweieqwyLcp9BVsEvCXDVtRuH9gZ5dFb+0zNYTSmwk40vbKUryUrYX
   HcBWI8/jj2pzHvMtfjHcjsKaCJsMTLKEjF+sL/T7q39SPhou0K6/+jtF1
   x/JbHfF3AJcLuHpWj2fOFVY2EIlBZ30lDHq0KgjGF0EG26s3ZArFsIBuX
   3JRa6D2NQ7z4rrIkT4Em/wj9Fnb+SQr3GLs6Ub9Vvb4Vi9io9Yc1wjFbu
   0Jssy5eeHmgXGd3h6TgMScOSRb9OZP8DT8KQtDApD1vDPFnDLzptBPjoc
   MFn1YkOVIhkHrVsW465rOHNxikNjpWIscSjGmv7ug3Zt/9ITCSN6kJbZB
   Q==;
X-CSE-ConnectionGUID: CWsHLXtLTg+1O3clyPN8bg==
X-CSE-MsgGUID: WfXjtVpQQkCfQTikexChcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60392158"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60392158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 19:15:01 -0700
X-CSE-ConnectionGUID: 35+m8IYFSAafyL+mBwnUBw==
X-CSE-MsgGUID: OgNJEOobS0uUb64YUiMAVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139916446"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 May 2025 19:15:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHYyw-000NmC-0L;
	Wed, 21 May 2025 02:14:58 +0000
Date: Wed, 21 May 2025 10:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 3/3] rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL
 uAPI
Message-ID: <202505211038.sqqVX8kO-lkp@intel.com>
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
In-Reply-To: <20250519150823.62350-4-dawei.li@linux.dev>
References: <20250519150823.62350-4-dawei.li@linux.dev>
TO: Dawei Li <dawei.li@linux.dev>
TO: andersson@kernel.org
TO: mathieu.poirier@linaro.org
CC: linux-remoteproc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: dawei.li@linux.dev
CC: set_pte_at@outlook.com

Hi Dawei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Dawei-Li/rpmsg-char-Reuse-eptdev-logic-for-anonymous-device/20250519-231006
base:   92a09c47464d040866cf2b4cd052bc60555185fb
patch link:    https://lore.kernel.org/r/20250519150823.62350-4-dawei.li%40linux.dev
patch subject: [PATCH v3 3/3] rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL uAPI
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: powerpc64-randconfig-r072-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211038.sqqVX8kO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505211038.sqqVX8kO-lkp@intel.com/

smatch warnings:
drivers/rpmsg/rpmsg_ctrl.c:140 rpmsg_ctrldev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +140 drivers/rpmsg/rpmsg_ctrl.c

617d32938d1be0 Arnaud Pouliquen 2022-01-24   73  
617d32938d1be0 Arnaud Pouliquen 2022-01-24   74  static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
617d32938d1be0 Arnaud Pouliquen 2022-01-24   75  				unsigned long arg)
617d32938d1be0 Arnaud Pouliquen 2022-01-24   76  {
617d32938d1be0 Arnaud Pouliquen 2022-01-24   77  	struct rpmsg_ctrldev *ctrldev = fp->private_data;
74317ea5240801 Dawei Li         2025-05-19   78  	struct rpmsg_endpoint_fd_info ept_fd_info;
617d32938d1be0 Arnaud Pouliquen 2022-01-24   79  	void __user *argp = (void __user *)arg;
617d32938d1be0 Arnaud Pouliquen 2022-01-24   80  	struct rpmsg_endpoint_info eptinfo;
617d32938d1be0 Arnaud Pouliquen 2022-01-24   81  	struct rpmsg_channel_info chinfo;
8109517b394e6d Arnaud Pouliquen 2022-01-24   82  	struct rpmsg_device *rpdev;
8109517b394e6d Arnaud Pouliquen 2022-01-24   83  	int ret = 0;
74317ea5240801 Dawei Li         2025-05-19   84  	int fd = -1;
617d32938d1be0 Arnaud Pouliquen 2022-01-24   85  
74317ea5240801 Dawei Li         2025-05-19   86  	if (cmd == RPMSG_CREATE_EPT_IOCTL || cmd == RPMSG_CREATE_DEV_IOCTL ||
74317ea5240801 Dawei Li         2025-05-19   87  	    cmd == RPMSG_RELEASE_DEV_IOCTL) {
617d32938d1be0 Arnaud Pouliquen 2022-01-24   88  		if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
617d32938d1be0 Arnaud Pouliquen 2022-01-24   89  			return -EFAULT;
617d32938d1be0 Arnaud Pouliquen 2022-01-24   90  
617d32938d1be0 Arnaud Pouliquen 2022-01-24   91  		memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
617d32938d1be0 Arnaud Pouliquen 2022-01-24   92  		chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
617d32938d1be0 Arnaud Pouliquen 2022-01-24   93  		chinfo.src = eptinfo.src;
617d32938d1be0 Arnaud Pouliquen 2022-01-24   94  		chinfo.dst = eptinfo.dst;
74317ea5240801 Dawei Li         2025-05-19   95  	} else if (cmd == RPMSG_CREATE_EPT_FD_IOCTL) {
74317ea5240801 Dawei Li         2025-05-19   96  		if (copy_from_user(&ept_fd_info, argp, sizeof(ept_fd_info)))
74317ea5240801 Dawei Li         2025-05-19   97  			return -EFAULT;
74317ea5240801 Dawei Li         2025-05-19   98  
74317ea5240801 Dawei Li         2025-05-19   99  		memcpy(chinfo.name, ept_fd_info.name, RPMSG_NAME_SIZE);
74317ea5240801 Dawei Li         2025-05-19  100  		chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
74317ea5240801 Dawei Li         2025-05-19  101  		chinfo.src = ept_fd_info.src;
74317ea5240801 Dawei Li         2025-05-19  102  		chinfo.dst = ept_fd_info.dst;
74317ea5240801 Dawei Li         2025-05-19  103  	}
617d32938d1be0 Arnaud Pouliquen 2022-01-24  104  
8109517b394e6d Arnaud Pouliquen 2022-01-24  105  	mutex_lock(&ctrldev->ctrl_lock);
8109517b394e6d Arnaud Pouliquen 2022-01-24  106  	switch (cmd) {
8109517b394e6d Arnaud Pouliquen 2022-01-24  107  	case RPMSG_CREATE_EPT_IOCTL:
8109517b394e6d Arnaud Pouliquen 2022-01-24  108  		ret = rpmsg_chrdev_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo);
8109517b394e6d Arnaud Pouliquen 2022-01-24  109  		break;
8109517b394e6d Arnaud Pouliquen 2022-01-24  110  
8109517b394e6d Arnaud Pouliquen 2022-01-24  111  	case RPMSG_CREATE_DEV_IOCTL:
8109517b394e6d Arnaud Pouliquen 2022-01-24  112  		rpdev = rpmsg_create_channel(ctrldev->rpdev, &chinfo);
8109517b394e6d Arnaud Pouliquen 2022-01-24  113  		if (!rpdev) {
8109517b394e6d Arnaud Pouliquen 2022-01-24  114  			dev_err(&ctrldev->dev, "failed to create %s channel\n", chinfo.name);
8109517b394e6d Arnaud Pouliquen 2022-01-24  115  			ret = -ENXIO;
8109517b394e6d Arnaud Pouliquen 2022-01-24  116  		}
8109517b394e6d Arnaud Pouliquen 2022-01-24  117  		break;
8109517b394e6d Arnaud Pouliquen 2022-01-24  118  
8109517b394e6d Arnaud Pouliquen 2022-01-24  119  	case RPMSG_RELEASE_DEV_IOCTL:
8109517b394e6d Arnaud Pouliquen 2022-01-24  120  		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
8109517b394e6d Arnaud Pouliquen 2022-01-24  121  		if (ret)
8109517b394e6d Arnaud Pouliquen 2022-01-24  122  			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
8109517b394e6d Arnaud Pouliquen 2022-01-24  123  				chinfo.name, ret);
8109517b394e6d Arnaud Pouliquen 2022-01-24  124  		break;
8109517b394e6d Arnaud Pouliquen 2022-01-24  125  
74317ea5240801 Dawei Li         2025-05-19  126  	case RPMSG_CREATE_EPT_FD_IOCTL:
74317ea5240801 Dawei Li         2025-05-19  127  		ret = rpmsg_anonymous_eptdev_create(ctrldev->rpdev, &ctrldev->dev, chinfo,
74317ea5240801 Dawei Li         2025-05-19  128  						    ept_fd_info.flags, &fd);
74317ea5240801 Dawei Li         2025-05-19  129  		if (!ret) {
74317ea5240801 Dawei Li         2025-05-19  130  			ept_fd_info.fd = fd;
74317ea5240801 Dawei Li         2025-05-19  131  			ret = copy_to_user(argp, &ept_fd_info, sizeof(ept_fd_info));
74317ea5240801 Dawei Li         2025-05-19  132  		}
74317ea5240801 Dawei Li         2025-05-19  133  		break;
74317ea5240801 Dawei Li         2025-05-19  134  
8109517b394e6d Arnaud Pouliquen 2022-01-24  135  	default:
8109517b394e6d Arnaud Pouliquen 2022-01-24  136  		ret = -EINVAL;
8109517b394e6d Arnaud Pouliquen 2022-01-24  137  	}
8109517b394e6d Arnaud Pouliquen 2022-01-24  138  	mutex_unlock(&ctrldev->ctrl_lock);
8109517b394e6d Arnaud Pouliquen 2022-01-24  139  
8109517b394e6d Arnaud Pouliquen 2022-01-24 @140  	return ret;
617d32938d1be0 Arnaud Pouliquen 2022-01-24  141  };
617d32938d1be0 Arnaud Pouliquen 2022-01-24  142  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

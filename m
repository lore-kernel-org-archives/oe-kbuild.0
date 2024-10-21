Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482181FAC4C
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 18:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729533945; cv=none; b=KpTFPUGqlCnnxl8VpT/LaUxT+eZMK3Ra0HwBgumqz48lHS/w1fvFoHCrHmP6uM9r3t8bw0QA+BrEx5CY28a60F11asiM2I+nTuXvz93hAdaZUscauiX8iEyqIDYqL0XxcGINp0EE8rQq9S5uL1Fkj0JG2zFWOHFz5RDqO710w+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729533945; c=relaxed/simple;
	bh=p66wnfbz6xOyL2d9pWfaow/TZheABm3QqBxRsMGbkLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=abh3c1KdpLjJu902XxiHVrx2FPkhxk/E8h2h0fUngL46DIbiVtm/Xo2OpHoVrS6MDElL0lKua7mhFdopjC0rr8oFxfrQQiKKZsiaDzUo+3Be+vSlVD1+aIn8CpH8XU9c3EXi6LI7Qvz6z08zo7Qaz6kpbC8gf1T/jrSvxhq+JEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BheotNjK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BheotNjK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729533943; x=1761069943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p66wnfbz6xOyL2d9pWfaow/TZheABm3QqBxRsMGbkLE=;
  b=BheotNjKX0q8q2DA5ACfxQ3+0EbWeUL4wP4J+ARH2P5eCriMNH2gAKe8
   V97m40mL8ciCW4O9wKNbgGTNQG4KQjsGBMR5mj9QmsPfdJxrffPOMwLFA
   bnP/t/bohbzNgo62sjc+pYr3C/63nTLPbJeZGRHciq/9f93xJ36i7b5SW
   rEpe7e0v/5Q5iMvmB98LtMrA6oQg5PmK/VbU22LKsuMIMO6N1GT4uDXfd
   Fx/P257850KV/mXhuc+hSzv8aIJ9BExoqfQrHsJymfk9ltwF9zuios0Fe
   syhW15KZnDfTLtMZJowRAV6hlVwC34D8Ep3W1s+VLfGwhrkbDzfNYkFOG
   g==;
X-CSE-ConnectionGUID: sq8cFKPgTEmtHrIA0Cqjsw==
X-CSE-MsgGUID: svl3onuSROKv4RCXzgXM4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40154846"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40154846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 11:05:42 -0700
X-CSE-ConnectionGUID: H/0CwpdbTuqk+QM000bKYQ==
X-CSE-MsgGUID: 4uIjJIJPSuGJCebRj9XsOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="80005216"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2024 11:05:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2wmh-000SV0-0a;
	Mon, 21 Oct 2024 18:05:39 +0000
Date: Tue, 22 Oct 2024 02:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 01/13] media: v4l2-ctrls-api: fix error handling for
 v4l2_g_ctrl()
Message-ID: <202410220105.oP6D4QD7-lkp@intel.com>
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
In-Reply-To: <4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab+huawei@kernel.org>
References: <4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab+huawei@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

Hi Mauro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-stage/master]
[also build test WARNING on linus/master v6.12-rc4]
[cannot apply to next-20241021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/media-v4l2-ctrls-api-fix-error-handling-for-v4l2_g_ctrl/20241018-181159
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/4d36ccf66f48a870c9bc0f7e9fda595505c4d342.1729230718.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v2 01/13] media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20241021 (https://download.01.org/0day-ci/archive/20241022/202410220105.oP6D4QD7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410220105.oP6D4QD7-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-api.c:825 set_ctrl_lock() warn: inconsistent returns 'ctrl->handler->lock'.

vim +825 drivers/media/v4l2-core/v4l2-ctrls-api.c

71c689dc2e732d4 Hans Verkuil          2021-04-27  810  
71c689dc2e732d4 Hans Verkuil          2021-04-27  811  /* Helper function for VIDIOC_S_CTRL compatibility */
71c689dc2e732d4 Hans Verkuil          2021-04-27  812  static int set_ctrl_lock(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl,
71c689dc2e732d4 Hans Verkuil          2021-04-27  813  			 struct v4l2_ext_control *c)
71c689dc2e732d4 Hans Verkuil          2021-04-27  814  {
71c689dc2e732d4 Hans Verkuil          2021-04-27  815  	int ret;
71c689dc2e732d4 Hans Verkuil          2021-04-27  816  
71c689dc2e732d4 Hans Verkuil          2021-04-27  817  	v4l2_ctrl_lock(ctrl);
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  818  	ret = user_to_new(c, ctrl);
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  819  	if (ret)
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  820  		return ret;
71c689dc2e732d4 Hans Verkuil          2021-04-27  821  	ret = set_ctrl(fh, ctrl, 0);
71c689dc2e732d4 Hans Verkuil          2021-04-27  822  	if (!ret)
54c5e2c49a4358b Mauro Carvalho Chehab 2024-10-18  823  		ret = cur_to_user(c, ctrl);
71c689dc2e732d4 Hans Verkuil          2021-04-27  824  	v4l2_ctrl_unlock(ctrl);
71c689dc2e732d4 Hans Verkuil          2021-04-27 @825  	return ret;
71c689dc2e732d4 Hans Verkuil          2021-04-27  826  }
71c689dc2e732d4 Hans Verkuil          2021-04-27  827  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

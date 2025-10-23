Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F9E1A2C0B
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Oct 2025 02:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761187058; cv=none; b=njiuj3M4tmC5RjGVmxqMr44Y4rcvhSWCmg+C02MaK8EH6Vc69zMxSE5ugDXUdthgIJlTV0kNrljkCm1a4W9QEINwMppEL7XsMnktGQOS9m1wLVOLanl2qs2wH7qtq4B9lCKnaZd+h1evzPOP/r8AzcOsvQ4kbgbNY+JWnI4mzbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761187058; c=relaxed/simple;
	bh=Mf+nhDoXX0fmBT2Sd9v7ZZFQyICwkk2+xSPAnIpfrYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XoUab/DedlhpxdwjTEdPgxcpOU8CTWJu7zVodsR5x7bsOt6kZiqcd5xmlt1kTptaA7vH9qNbXAKFMSIM2ekFJCk1bItSaLJJ1a3rgUmACCV5YLRjGwhbAd314dESCMGeoHWRK8qTByPXam3Y1Zptu9ckfRrX6q78ePcBxL4LXMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSLtvYrn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSLtvYrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761187056; x=1792723056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mf+nhDoXX0fmBT2Sd9v7ZZFQyICwkk2+xSPAnIpfrYE=;
  b=kSLtvYrniIPCzaxRauIy/nJ/FbKc+dP/AK9nUMKLiB8BTz/GCnpnmRPc
   g7cvy7pQlRjBh92gJ01Z6VwDqKKyA09LEqjHaceNPmm8Dh9F4Rorogoc8
   b1cyqP1SwFl4aUR2UiLolCVWC7SwdUdsbmVPUgHwoh/Pijw/Yqtd+E28L
   c4xrAJ0rowe/jtVoAFy8Qg0OJjalcxhPwsSuHzTKqde82rRWcvkAhm76z
   miJ6xdKEPDVZ4xVaeYw1QXh8qnsyAyAmLVg3cmKFXQeHmJp1RVsy+6A0x
   1opxahYvFSKrWDLmNjEAEeAu/6EEsyq1SzQf8unKIEsV/ET1P8DffKB6X
   w==;
X-CSE-ConnectionGUID: MXUrhiPsQtOC9qqCqRswFA==
X-CSE-MsgGUID: c62HINlMQruiqkG764tNSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63255775"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="63255775"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 19:37:36 -0700
X-CSE-ConnectionGUID: o3eGemrYQTCj3iD7BtoyEQ==
X-CSE-MsgGUID: mCj0EAEiQ9i01Tn21DsArg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="207693807"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Oct 2025 19:37:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBlCj-000Cwd-2b;
	Thu, 23 Oct 2025 02:37:30 +0000
Date: Thu, 23 Oct 2025 10:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [usb:usb-testing 45/48] drivers/usb/typec/mux/ps883x.c:171
 ps883x_sw_set() warn: inconsistent returns '&retimer->lock'.
Message-ID: <202510231023.aJ09O6pk-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Jack Pham <jack.pham@oss.qualcomm.com>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   93741bd104ce07a790519ecee3a331ee7cf61ae3
commit: f83cb615cb7a615f9c15787f914a8eee1c6e93d4 [45/48] usb: typec: ps883x: Cache register settings, not Type-C mode
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231023.aJ09O6pk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510231023.aJ09O6pk-lkp@intel.com/

smatch warnings:
drivers/usb/typec/mux/ps883x.c:171 ps883x_sw_set() warn: inconsistent returns '&retimer->lock'.

vim +171 drivers/usb/typec/mux/ps883x.c

257a087c8b5206 Abel Vesa     2025-02-06  144  
257a087c8b5206 Abel Vesa     2025-02-06  145  static int ps883x_sw_set(struct typec_switch_dev *sw,
257a087c8b5206 Abel Vesa     2025-02-06  146  			 enum typec_orientation orientation)
257a087c8b5206 Abel Vesa     2025-02-06  147  {
257a087c8b5206 Abel Vesa     2025-02-06  148  	struct ps883x_retimer *retimer = typec_switch_get_drvdata(sw);
257a087c8b5206 Abel Vesa     2025-02-06  149  	int ret = 0;
257a087c8b5206 Abel Vesa     2025-02-06  150  
257a087c8b5206 Abel Vesa     2025-02-06  151  	ret = typec_switch_set(retimer->typec_switch, orientation);
257a087c8b5206 Abel Vesa     2025-02-06  152  	if (ret)
257a087c8b5206 Abel Vesa     2025-02-06  153  		return ret;
257a087c8b5206 Abel Vesa     2025-02-06  154  
257a087c8b5206 Abel Vesa     2025-02-06  155  	mutex_lock(&retimer->lock);
257a087c8b5206 Abel Vesa     2025-02-06  156  
257a087c8b5206 Abel Vesa     2025-02-06  157  	if (retimer->orientation != orientation) {
257a087c8b5206 Abel Vesa     2025-02-06  158  		retimer->orientation = orientation;
257a087c8b5206 Abel Vesa     2025-02-06  159  
f83cb615cb7a61 Konrad Dybcio 2025-10-14  160  		ret = regmap_assign_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
f83cb615cb7a61 Konrad Dybcio 2025-10-14  161  					 CONN_STATUS_0_ORIENTATION_REVERSED,
f83cb615cb7a61 Konrad Dybcio 2025-10-14  162  					 orientation == TYPEC_ORIENTATION_REVERSE);
f83cb615cb7a61 Konrad Dybcio 2025-10-14  163  		if (ret) {
f83cb615cb7a61 Konrad Dybcio 2025-10-14  164  			dev_err(&retimer->client->dev, "failed to set orientation: %d\n", ret);
f83cb615cb7a61 Konrad Dybcio 2025-10-14  165  			return ret;
f83cb615cb7a61 Konrad Dybcio 2025-10-14  166  		}
257a087c8b5206 Abel Vesa     2025-02-06  167  	}
257a087c8b5206 Abel Vesa     2025-02-06  168  
257a087c8b5206 Abel Vesa     2025-02-06  169  	mutex_unlock(&retimer->lock);
257a087c8b5206 Abel Vesa     2025-02-06  170  
257a087c8b5206 Abel Vesa     2025-02-06 @171  	return ret;
257a087c8b5206 Abel Vesa     2025-02-06  172  }
257a087c8b5206 Abel Vesa     2025-02-06  173  

:::::: The code at line 171 was first introduced by commit
:::::: 257a087c8b5206e046048de6053fc8b3fa1af814 usb: typec: Add support for Parade PS8830 Type-C Retimer

:::::: TO: Abel Vesa <abel.vesa@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

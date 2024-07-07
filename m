Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23774405
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720337209; cv=none; b=s0SHSS+TnZMzodx13w035bPbLcqasSBKCYUJ9MBejhQjCScVD1qOxdjarP3VfzPRRoK55Lw3Oa/Jss3D3tx93ZE24hPpsAYLjH5Ug3I+EuDVK/jjVchjN3JrUOF10C7yGw13QoQvNmxxo4Zlqv0dhrdDtPX6qt+alpBMVlEpgo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720337209; c=relaxed/simple;
	bh=AFsqW3ZfD+bkBxwKFG2IT+kAIJweO6X9jc6Sj4/9uZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ur31BClfsUw3cOFMUvfPUkMsN7i8p0LEOGPKl4uH5/l9Re7BF5UwNEaM1t9OHJLGtXYF70+VbzMfxbLxzQCnUaol4fHvNe5dmbzJyararlOPsB0WxK7u2VJr/fVlI5s2fcyYlgIUtEuR69QfTnpnY/VaktsN2+yB4s+6T2qxbW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gu9m+DbT; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gu9m+DbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720337207; x=1751873207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AFsqW3ZfD+bkBxwKFG2IT+kAIJweO6X9jc6Sj4/9uZg=;
  b=Gu9m+DbT6w9WER7ZQViqh7xexUrtz04iiTuC2TYy9mVDq6S+NJUDtr/a
   lEL4SQd0Sj8q1xHaVQRpafoaYGcIE8Tff+hqGaI/ZRTSk6n/tY8t1OKIf
   wUHWfHhDVwCoAPE3H6ABtaH/c9DWgTi/d70gQNc7qUHW0jKKwrmYCZKWp
   OkR7P1aeyAr6QSOrApF80Hy4wPpmbLtRwvh7V8D4L3iwSVS35S+G6RR82
   5816GBn5nbzPLJbxpRBhiVLs9EF5TwmIW7+0XbeVd8YFfpQhR0Ey0uMCf
   CGkFLP8ZmwQeUHfMCXXMNCkSuKV+46yRHmVKud5e1XLLHXQ/OuDX330ab
   Q==;
X-CSE-ConnectionGUID: y9fSYgjsSRKZ92rsx9uN3Q==
X-CSE-MsgGUID: M5/mWKTfR/SQQEp4fbpbIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17664154"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="17664154"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 00:26:40 -0700
X-CSE-ConnectionGUID: N2vISVKgThKITf6SifokkQ==
X-CSE-MsgGUID: QNnyD1aJRFOwFqirzn8OlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; 
   d="scan'208";a="70406753"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2024 00:26:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQMI9-000Uiw-0Y;
	Sun, 07 Jul 2024 07:26:37 +0000
Date: Sun, 7 Jul 2024 15:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/6] Bluetooth: hci_qca: schedule a devm action for
 disabling the clock
Message-ID: <202407071507.psxpAmvT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/bluetooth/hci_qca.c:2499:9: sparse: sparse: statement expected after case label"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240705-hci_qca_refactor-v1-2-e2442121c13e@linaro.org>
References: <20240705-hci_qca_refactor-v1-2-e2442121c13e@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Marcel Holtmann <marcel@holtmann.org>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
TO: Rocky Liao <quic_rjliao@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: linux-bluetooth@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0b58e108042b0ed28a71cd7edf5175999955b233]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/dt-bindings-bluetooth-qualcomm-describe-the-inputs-from-PMU-for-wcn7850/20240706-055822
base:   0b58e108042b0ed28a71cd7edf5175999955b233
patch link:    https://lore.kernel.org/r/20240705-hci_qca_refactor-v1-2-e2442121c13e%40linaro.org
patch subject: [PATCH 2/6] Bluetooth: hci_qca: schedule a devm action for disabling the clock
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-063-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071507.psxpAmvT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071507.psxpAmvT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407071507.psxpAmvT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/bluetooth/hci_qca.c:2499:9: sparse: sparse: statement expected after case label

vim +2499 drivers/bluetooth/hci_qca.c

05ba533c5c1155 Thierry Escande                2018-03-29  2478  
05ba533c5c1155 Thierry Escande                2018-03-29  2479  static void qca_serdev_remove(struct serdev_device *serdev)
05ba533c5c1155 Thierry Escande                2018-03-29  2480  {
05ba533c5c1155 Thierry Escande                2018-03-29  2481  	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
054ec5e94a46b0 Venkata Lakshmi Narayana Gubba 2020-09-10  2482  	struct qca_power *power = qcadev->bt_power;
05ba533c5c1155 Thierry Escande                2018-03-29  2483  
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2484  	switch (qcadev->btsoc_type) {
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2485  	case QCA_WCN3988:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2486  	case QCA_WCN3990:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2487  	case QCA_WCN3991:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2488  	case QCA_WCN3998:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2489  	case QCA_WCN6750:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2490  	case QCA_WCN6855:
e0c1278ac89b03 Neil Armstrong                 2023-08-16  2491  	case QCA_WCN7850:
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2492  		if (power->vregs_on) {
c2d7827338618a Balakrishna Godavarthi         2018-08-22  2493  			qca_power_shutdown(&qcadev->serdev_hu);
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2494  			break;
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2495  		}
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2496  		fallthrough;
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2497  
691d54d0f7cb14 Neil Armstrong                 2023-08-16  2498  	default:
691d54d0f7cb14 Neil Armstrong                 2023-08-16 @2499  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  2500  
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  2501  	hci_uart_unregister_device(&qcadev->serdev_hu);
05ba533c5c1155 Thierry Escande                2018-03-29  2502  }
05ba533c5c1155 Thierry Escande                2018-03-29  2503  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

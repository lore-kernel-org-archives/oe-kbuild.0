Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009DB1EB5FD
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 22:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764972266; cv=none; b=tudUDYN/+XkxX/M7BQ2Aj63W/dH81BMGRzXKc+sVb0hX+UVuhSgKdQK75oPWN0NenvJVgSuGNNKpVrDyyJsF45SaOGO0XDbvG75kH1aKahsvHCtIl0YeOEdwL/Exx3VA3vn9CWfT8iq5YjCrhgNXrFig6yj6BUhMHacQXVBvywU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764972266; c=relaxed/simple;
	bh=UMYlQFhFNecQpXcI5PfIj5r8DBnNUZy6yCsm8zIu1Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cq8cku8xTfusvhzg3ssOcAhHo2eS7k8gkvghxjL/vXLTLSUBfXl8vTBeRB+BzuAmtpAOjoyhHFMSLZu6FSYLNkKUBjoKeq7gPfrxJbdoudHzg6PolZ0afzQdW4lOh5lTReUwuKRypssIZbdMflqSZEeMh8HMaTtPQfvl154bzEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C0kOJjZy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C0kOJjZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764972266; x=1796508266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UMYlQFhFNecQpXcI5PfIj5r8DBnNUZy6yCsm8zIu1Hg=;
  b=C0kOJjZypLiAuuJ3DsJd2Jt4eQmJ5yHNjjF+DyAy4hyOr9tq92RZAieg
   KXCrS7EBa+l8G9ECvk+Fj5wuL/YVxFsFi+AGYod01OVsRBQ7TdTgq/W56
   CPJZQCC94AAGTLhtpdkKwe7JxjdIkAlw/04MpeEQRNdx5kf/NGhFmZWtm
   dEc1ZMJZ9BUerzI9BYGNzbzVQAEiGSDzlYHllBZYYv66ZN/7NZ4p/u43m
   Q9Ebf7TJ8/2LombSZwFBA/IVKkaDJqJLNc8BRiOkwpxBC/BMly/GarNnZ
   Hi+SKMvUIMl3VSpTJuTkWN93qwWqET56PuUetzJTK4NFYOYHuq7oaCOLA
   w==;
X-CSE-ConnectionGUID: pOzj3kQWR4GVTx8EOLRWCQ==
X-CSE-MsgGUID: O7PNOcw+S/emyNmBvYdvFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66896036"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="66896036"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 14:04:25 -0800
X-CSE-ConnectionGUID: yBh+0f1BRPK1EP7dEJfvOQ==
X-CSE-MsgGUID: KRCZNwGpTzm1GHSVDDH3Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="195839484"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 14:04:23 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRduW-00000000FaH-3QFJ;
	Fri, 05 Dec 2025 22:04:20 +0000
Date: Sat, 6 Dec 2025 06:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: qcom: Support firmware-managed resource
 states for power management
Message-ID: <202512060556.pgIgFNxx-lkp@intel.com>
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
In-Reply-To: <20251127-controller_scmi_upstream-v1-2-38bcca513c28@oss.qualcomm.com>
References: <20251127-controller_scmi_upstream-v1-2-38bcca513c28@oss.qualcomm.com>
TO: Sriram Dash <sriram.dash@oss.qualcomm.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Wesley Cheng <quic_wcheng@quicinc.com>
TO: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: jack.pham@oss.qualcomm.com
CC: faisal.hassan@oss.qualcomm.com
CC: krishna.kurapati@oss.qualcomm.com
CC: andersson@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Sriram Dash <sriram.dash@oss.qualcomm.com>
CC: Konrad Dybcio <konradybcio@kernel.org>
CC: Shazad Hussain <shazad.hussain@oss.qualcomm.com>

Hi Sriram,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c77a6544d8a2364e4bee1b52890f577be27b7296]

url:    https://github.com/intel-lab-lkp/linux/commits/Sriram-Dash/dt-bindings-usb-qcom-snps-dwc3-Add-support-for-firmware-managed-resources/20251127-183548
base:   c77a6544d8a2364e4bee1b52890f577be27b7296
patch link:    https://lore.kernel.org/r/20251127-controller_scmi_upstream-v1-2-38bcca513c28%40oss.qualcomm.com
patch subject: [PATCH 2/2] usb: dwc3: qcom: Support firmware-managed resource states for power management
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: nios2-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251206/202512060556.pgIgFNxx-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512060556.pgIgFNxx-lkp@intel.com/

smatch warnings:
drivers/usb/dwc3/dwc3-qcom.c:801 dwc3_qcom_probe() error: uninitialized symbol 'ret'.

vim +/ret +801 drivers/usb/dwc3/dwc3-qcom.c

21188e8d6d7590 Krishna Kurapati   2025-09-07  668  
2bc02355f8ba2c Lee Jones          2019-06-17  669  static int dwc3_qcom_probe(struct platform_device *pdev)
2bc02355f8ba2c Lee Jones          2019-06-17  670  {
1881a32fe14df8 Bjorn Andersson    2025-04-14  671  	struct dwc3_probe_data	probe_data = {};
2bc02355f8ba2c Lee Jones          2019-06-17  672  	struct device		*dev = &pdev->dev;
a4333c3a6ba9ca Manu Gautam        2018-05-09  673  	struct dwc3_qcom	*qcom;
1881a32fe14df8 Bjorn Andersson    2025-04-14  674  	struct resource		res;
1881a32fe14df8 Bjorn Andersson    2025-04-14  675  	struct resource		*r;
e33ebb133a245a Bjorn Andersson    2025-05-08  676  	int			ret;
a4333c3a6ba9ca Manu Gautam        2018-05-09  677  	bool			ignore_pipe_clk;
e3fafbd8e36530 Johan Hovold       2022-08-04  678  	bool			wakeup_source;
a4333c3a6ba9ca Manu Gautam        2018-05-09  679  
a4333c3a6ba9ca Manu Gautam        2018-05-09  680  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
a4333c3a6ba9ca Manu Gautam        2018-05-09  681  	if (!qcom)
a4333c3a6ba9ca Manu Gautam        2018-05-09  682  		return -ENOMEM;
a4333c3a6ba9ca Manu Gautam        2018-05-09  683  
a4333c3a6ba9ca Manu Gautam        2018-05-09  684  	qcom->dev = &pdev->dev;
a4333c3a6ba9ca Manu Gautam        2018-05-09  685  
79456073227880 Sriram Dash        2025-11-27  686  	qcom->fw_managed = device_get_match_data(dev);
79456073227880 Sriram Dash        2025-11-27  687  	if (qcom->fw_managed) {
79456073227880 Sriram Dash        2025-11-27  688  		ret = dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_INIT);
79456073227880 Sriram Dash        2025-11-27  689  		if (ret < 0)
79456073227880 Sriram Dash        2025-11-27  690  			return ret;
79456073227880 Sriram Dash        2025-11-27  691  	}
79456073227880 Sriram Dash        2025-11-27  692  
a4333c3a6ba9ca Manu Gautam        2018-05-09  693  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
a4333c3a6ba9ca Manu Gautam        2018-05-09  694  	if (IS_ERR(qcom->resets)) {
79456073227880 Sriram Dash        2025-11-27  695  		dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
60d5b71933c4f1 Andrew Halaney     2023-06-05  696  			      "failed to get resets\n");
79456073227880 Sriram Dash        2025-11-27  697  		goto resources_off;
a4333c3a6ba9ca Manu Gautam        2018-05-09  698  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  699  
e33ebb133a245a Bjorn Andersson    2025-05-08  700  	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
e33ebb133a245a Bjorn Andersson    2025-05-08  701  	if (ret < 0)
e33ebb133a245a Bjorn Andersson    2025-05-08  702  		return dev_err_probe(dev, ret, "failed to get clocks\n");
e33ebb133a245a Bjorn Andersson    2025-05-08  703  	qcom->num_clocks = ret;
e33ebb133a245a Bjorn Andersson    2025-05-08  704  
a4333c3a6ba9ca Manu Gautam        2018-05-09  705  	ret = reset_control_assert(qcom->resets);
a4333c3a6ba9ca Manu Gautam        2018-05-09  706  	if (ret) {
a4333c3a6ba9ca Manu Gautam        2018-05-09  707  		dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
79456073227880 Sriram Dash        2025-11-27  708  		goto resources_off;
a4333c3a6ba9ca Manu Gautam        2018-05-09  709  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  710  
a4333c3a6ba9ca Manu Gautam        2018-05-09  711  	usleep_range(10, 1000);
a4333c3a6ba9ca Manu Gautam        2018-05-09  712  
a4333c3a6ba9ca Manu Gautam        2018-05-09  713  	ret = reset_control_deassert(qcom->resets);
a4333c3a6ba9ca Manu Gautam        2018-05-09  714  	if (ret) {
a4333c3a6ba9ca Manu Gautam        2018-05-09  715  		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
ef8abc0ba49ce7 Krishna Kurapati   2025-07-09  716  		return ret;
a4333c3a6ba9ca Manu Gautam        2018-05-09  717  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  718  
e33ebb133a245a Bjorn Andersson    2025-05-08  719  	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
e33ebb133a245a Bjorn Andersson    2025-05-08  720  	if (ret < 0)
ef8abc0ba49ce7 Krishna Kurapati   2025-07-09  721  		return ret;
a4333c3a6ba9ca Manu Gautam        2018-05-09  722  
1881a32fe14df8 Bjorn Andersson    2025-04-14  723  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
4c0fca65d10548 Dan Carpenter      2025-04-23  724  	if (!r) {
4c0fca65d10548 Dan Carpenter      2025-04-23  725  		ret = -EINVAL;
1881a32fe14df8 Bjorn Andersson    2025-04-14  726  		goto clk_disable;
4c0fca65d10548 Dan Carpenter      2025-04-23  727  	}
1881a32fe14df8 Bjorn Andersson    2025-04-14  728  	res = *r;
1881a32fe14df8 Bjorn Andersson    2025-04-14  729  	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
1881a32fe14df8 Bjorn Andersson    2025-04-14  730  
1881a32fe14df8 Bjorn Andersson    2025-04-14  731  	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
4c0fca65d10548 Dan Carpenter      2025-04-23  732  	if (!qcom->qscratch_base) {
4c0fca65d10548 Dan Carpenter      2025-04-23  733  		dev_err(dev, "failed to map qscratch region\n");
4c0fca65d10548 Dan Carpenter      2025-04-23  734  		ret = -ENOMEM;
41717b88abf1ca Krishna Kurapati   2024-03-05  735  		goto clk_disable;
a4333c3a6ba9ca Manu Gautam        2018-05-09  736  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  737  
2dc9f137e19426 Bjorn Andersson    2025-04-14  738  	ret = dwc3_qcom_setup_irq(qcom, pdev);
2bc02355f8ba2c Lee Jones          2019-06-17  739  	if (ret) {
2bc02355f8ba2c Lee Jones          2019-06-17  740  		dev_err(dev, "failed to setup IRQs, err=%d\n", ret);
41717b88abf1ca Krishna Kurapati   2024-03-05  741  		goto clk_disable;
a4333c3a6ba9ca Manu Gautam        2018-05-09  742  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  743  
a4333c3a6ba9ca Manu Gautam        2018-05-09  744  	/*
a4333c3a6ba9ca Manu Gautam        2018-05-09  745  	 * Disable pipe_clk requirement if specified. Used when dwc3
a4333c3a6ba9ca Manu Gautam        2018-05-09  746  	 * operates without SSPHY and only HS/FS/LS modes are supported.
a4333c3a6ba9ca Manu Gautam        2018-05-09  747  	 */
a4333c3a6ba9ca Manu Gautam        2018-05-09  748  	ignore_pipe_clk = device_property_read_bool(dev,
a4333c3a6ba9ca Manu Gautam        2018-05-09  749  				"qcom,select-utmi-as-pipe-clk");
a4333c3a6ba9ca Manu Gautam        2018-05-09  750  	if (ignore_pipe_clk)
a4333c3a6ba9ca Manu Gautam        2018-05-09  751  		dwc3_qcom_select_utmi_clk(qcom);
a4333c3a6ba9ca Manu Gautam        2018-05-09  752  
21188e8d6d7590 Krishna Kurapati   2025-09-07  753  	qcom->mode = usb_get_dr_mode(dev);
21188e8d6d7590 Krishna Kurapati   2025-09-07  754  
21188e8d6d7590 Krishna Kurapati   2025-09-07  755  	if (qcom->mode == USB_DR_MODE_HOST) {
21188e8d6d7590 Krishna Kurapati   2025-09-07  756  		qcom->current_role = USB_ROLE_HOST;
21188e8d6d7590 Krishna Kurapati   2025-09-07  757  	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
21188e8d6d7590 Krishna Kurapati   2025-09-07  758  		qcom->current_role = USB_ROLE_DEVICE;
21188e8d6d7590 Krishna Kurapati   2025-09-07  759  		dwc3_qcom_vbus_override_enable(qcom, true);
21188e8d6d7590 Krishna Kurapati   2025-09-07  760  	} else {
21188e8d6d7590 Krishna Kurapati   2025-09-07  761  		if ((device_property_read_bool(dev, "usb-role-switch")) &&
21188e8d6d7590 Krishna Kurapati   2025-09-07  762  		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
21188e8d6d7590 Krishna Kurapati   2025-09-07  763  			qcom->current_role = USB_ROLE_HOST;
21188e8d6d7590 Krishna Kurapati   2025-09-07  764  		else
21188e8d6d7590 Krishna Kurapati   2025-09-07  765  			qcom->current_role = USB_ROLE_DEVICE;
21188e8d6d7590 Krishna Kurapati   2025-09-07  766  	}
21188e8d6d7590 Krishna Kurapati   2025-09-07  767  
21188e8d6d7590 Krishna Kurapati   2025-09-07  768  	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
21188e8d6d7590 Krishna Kurapati   2025-09-07  769  
1881a32fe14df8 Bjorn Andersson    2025-04-14  770  	qcom->dwc.dev = dev;
1881a32fe14df8 Bjorn Andersson    2025-04-14  771  	probe_data.dwc = &qcom->dwc;
1881a32fe14df8 Bjorn Andersson    2025-04-14  772  	probe_data.res = &res;
1881a32fe14df8 Bjorn Andersson    2025-04-14  773  	probe_data.ignore_clocks_and_resets = true;
7298c06d58e23c Frank Li           2025-09-29  774  	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
1881a32fe14df8 Bjorn Andersson    2025-04-14  775  	ret = dwc3_core_probe(&probe_data);
2bc02355f8ba2c Lee Jones          2019-06-17  776  	if (ret)  {
1881a32fe14df8 Bjorn Andersson    2025-04-14  777  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
41717b88abf1ca Krishna Kurapati   2024-03-05  778  		goto clk_disable;
a4333c3a6ba9ca Manu Gautam        2018-05-09  779  	}
a4333c3a6ba9ca Manu Gautam        2018-05-09  780  
bea46b9815154a Sandeep Maheswaram 2020-07-27  781  	ret = dwc3_qcom_interconnect_init(qcom);
bea46b9815154a Sandeep Maheswaram 2020-07-27  782  	if (ret)
1881a32fe14df8 Bjorn Andersson    2025-04-14  783  		goto remove_core;
bea46b9815154a Sandeep Maheswaram 2020-07-27  784  
e3fafbd8e36530 Johan Hovold       2022-08-04  785  	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
e3fafbd8e36530 Johan Hovold       2022-08-04  786  	device_init_wakeup(&pdev->dev, wakeup_source);
d9be8d5c5b032e Sandeep Maheswaram 2022-06-13  787  
a4333c3a6ba9ca Manu Gautam        2018-05-09  788  	qcom->is_suspended = false;
a4333c3a6ba9ca Manu Gautam        2018-05-09  789  
a4333c3a6ba9ca Manu Gautam        2018-05-09  790  	return 0;
a4333c3a6ba9ca Manu Gautam        2018-05-09  791  
1881a32fe14df8 Bjorn Andersson    2025-04-14  792  remove_core:
1881a32fe14df8 Bjorn Andersson    2025-04-14  793  	dwc3_core_remove(&qcom->dwc);
a4333c3a6ba9ca Manu Gautam        2018-05-09  794  clk_disable:
e33ebb133a245a Bjorn Andersson    2025-05-08  795  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
a4333c3a6ba9ca Manu Gautam        2018-05-09  796  
79456073227880 Sriram Dash        2025-11-27  797  resources_off:
79456073227880 Sriram Dash        2025-11-27  798  	if (qcom->fw_managed)
79456073227880 Sriram Dash        2025-11-27  799  		dev_pm_opp_set_level(qcom->dev, DWC3_QCOM_FW_MANAGED_EXIT);
79456073227880 Sriram Dash        2025-11-27  800  
a4333c3a6ba9ca Manu Gautam        2018-05-09 @801  	return ret;
a4333c3a6ba9ca Manu Gautam        2018-05-09  802  }
a4333c3a6ba9ca Manu Gautam        2018-05-09  803  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

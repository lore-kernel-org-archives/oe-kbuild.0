Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4F0190051
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741265100; cv=none; b=tMjNURkjBNSMQ4+feuFGlyGI14AgnBuRUnMA9G3heRkRs5x39ZVRY+CUMzKZ0/2PKvdkTw24jr6wbd5lpXP7IPki+81kx/ERBip+1J874CnYJzbf3uebamE9Tj4FJt1vym28+zedc7LeG67stAJr7RmmVCZp/b8SdULxEGYhYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741265100; c=relaxed/simple;
	bh=QrwE6qQaWClvAsv2NPIl8wvybDUJbwCjAzQUDC6hY5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dcr4eIiBNJDXZrAWKCFAQSPgEOrnF+CrC9W1Xii4sUv9Kv7WnTJvBc/aFOWGiCsGGzSezXsT7DOY90ZxwRD3pekOatCGP4OGCFlo8Ih2s/AGk3AvnTFVxDxlVFJoXBNYCe7nyvxV5HwJ8sl/UtsXLH5D08LbxDUVhgC6VVqTQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR6Higjy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR6Higjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741265098; x=1772801098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QrwE6qQaWClvAsv2NPIl8wvybDUJbwCjAzQUDC6hY5o=;
  b=KR6HigjyLRhNWuAeU8xexmjgMehtjZUQd/gIff9eXTzbC6gYH4k/4qG3
   XrQuXnqgn1YAbL6hO5fyk7h/8MC8S4gV5JQix0tqrsFuSuBT6xHthG9M0
   RU/umH3neQd3CMFvqdxPUm2q5VNMdIYoL1sdwBmf/TNWfh0raXpbW9hTn
   kSLWWFxC1wJGGkeesv8tCvE/m/+plk7MJpj3SFIP2OuwRwzivJ0sMTyq+
   H3PPagrqLVavy4ALhhLrACxLjXLjBQlM0+ug5/CWzTOU/WfFklt+Ix7tW
   dnmpknoa/niaegwH6qf5lOlSnAj9u10w4wtx8sNz7orYBWm5IxDN6w8Oq
   Q==;
X-CSE-ConnectionGUID: S1jRmnw+RACVfk4GVc8u/w==
X-CSE-MsgGUID: JHICCHyYQTWSBs0ZpZlzPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46195922"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="46195922"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 04:44:57 -0800
X-CSE-ConnectionGUID: s0a0H+yFQOqk43Or7um7xg==
X-CSE-MsgGUID: 7yd9OuoETUytFeU7+X+ziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119020067"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Mar 2025 04:44:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqAam-000N46-33;
	Thu, 06 Mar 2025 12:44:51 +0000
Date: Thu, 6 Mar 2025 20:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Message-ID: <202503062058.nvyGtZNX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
References: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
TO: Kaustubh Pandey <quic_kapandey@quicinc.com>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: quic_rpavan@quicinc.com
CC: quic_sharathv@quicinc.com
CC: quic_sarata@quicinc.com

Hi Kaustubh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaustubh-Pandey/arm64-dts-qcom-qcom6490-idp-Add-IPA-nodes/20250304-234447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250304152133.GA2763820%40hu-kapandey-hyd.qualcomm.com
patch subject: [PATCH] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250306/202503062058.nvyGtZNX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503062058.nvyGtZNX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503062058.nvyGtZNX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dts:119.31-122.5: ERROR (duplicate_label): /reserved-memory/ipa-fw@8b300000: Duplicate label 'ipa_fw_mem' on /reserved-memory/ipa-fw@8b300000 and /reserved-memory/ipa-fw@8b700000
   ERROR: Input tree has errors, aborting (use -f to force output)

vim +/ipa_fw_mem +119 arch/arm64/boot/dts/qcom/qcm6490-idp.dts

9af6a9f32ad002 Komal Bajaj         2023-11-29   29  
9af6a9f32ad002 Komal Bajaj         2023-11-29   30  / {
9af6a9f32ad002 Komal Bajaj         2023-11-29   31  	model = "Qualcomm Technologies, Inc. QCM6490 IDP";
9af6a9f32ad002 Komal Bajaj         2023-11-29   32  	compatible = "qcom,qcm6490-idp", "qcom,qcm6490";
9af6a9f32ad002 Komal Bajaj         2023-11-29   33  	chassis-type = "embedded";
9af6a9f32ad002 Komal Bajaj         2023-11-29   34  
9af6a9f32ad002 Komal Bajaj         2023-11-29   35  	aliases {
9af6a9f32ad002 Komal Bajaj         2023-11-29   36  		serial0 = &uart5;
9af6a9f32ad002 Komal Bajaj         2023-11-29   37  	};
9af6a9f32ad002 Komal Bajaj         2023-11-29   38  
629c635eafbaf1 Ritesh Kumar        2024-02-15   39  	pm8350c_pwm_backlight: backlight {
629c635eafbaf1 Ritesh Kumar        2024-02-15   40  		compatible = "pwm-backlight";
629c635eafbaf1 Ritesh Kumar        2024-02-15   41  		pwms = <&pm8350c_pwm 3 65535>;
629c635eafbaf1 Ritesh Kumar        2024-02-15   42  		enable-gpios = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
629c635eafbaf1 Ritesh Kumar        2024-02-15   43  		pinctrl-0 = <&pmic_lcd_bl_en>;
629c635eafbaf1 Ritesh Kumar        2024-02-15   44  		pinctrl-names = "default";
629c635eafbaf1 Ritesh Kumar        2024-02-15   45  	};
629c635eafbaf1 Ritesh Kumar        2024-02-15   46  
9af6a9f32ad002 Komal Bajaj         2023-11-29   47  	chosen {
9af6a9f32ad002 Komal Bajaj         2023-11-29   48  		stdout-path = "serial0:115200n8";
9af6a9f32ad002 Komal Bajaj         2023-11-29   49  	};
9af6a9f32ad002 Komal Bajaj         2023-11-29   50  
629c635eafbaf1 Ritesh Kumar        2024-02-15   51  	lcd_disp_bias: regulator-lcd-disp-bias {
629c635eafbaf1 Ritesh Kumar        2024-02-15   52  		compatible = "regulator-fixed";
629c635eafbaf1 Ritesh Kumar        2024-02-15   53  		regulator-name = "lcd_disp_bias";
629c635eafbaf1 Ritesh Kumar        2024-02-15   54  		regulator-min-microvolt = <5500000>;
629c635eafbaf1 Ritesh Kumar        2024-02-15   55  		regulator-max-microvolt = <5500000>;
629c635eafbaf1 Ritesh Kumar        2024-02-15   56  		gpio = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
629c635eafbaf1 Ritesh Kumar        2024-02-15   57  		enable-active-high;
629c635eafbaf1 Ritesh Kumar        2024-02-15   58  		pinctrl-0 = <&lcd_disp_bias_en>;
629c635eafbaf1 Ritesh Kumar        2024-02-15   59  		pinctrl-names = "default";
629c635eafbaf1 Ritesh Kumar        2024-02-15   60  	};
629c635eafbaf1 Ritesh Kumar        2024-02-15   61  
511b4858dc8a1b Hui Liu             2024-03-11   62  	gpio-keys {
511b4858dc8a1b Hui Liu             2024-03-11   63  		compatible = "gpio-keys";
511b4858dc8a1b Hui Liu             2024-03-11   64  
511b4858dc8a1b Hui Liu             2024-03-11   65  		pinctrl-0 = <&key_vol_up_default>;
511b4858dc8a1b Hui Liu             2024-03-11   66  		pinctrl-names = "default";
511b4858dc8a1b Hui Liu             2024-03-11   67  
511b4858dc8a1b Hui Liu             2024-03-11   68  		key-volume-up {
511b4858dc8a1b Hui Liu             2024-03-11   69  			label = "Volume_up";
511b4858dc8a1b Hui Liu             2024-03-11   70  			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
511b4858dc8a1b Hui Liu             2024-03-11   71  			linux,code = <KEY_VOLUMEUP>;
511b4858dc8a1b Hui Liu             2024-03-11   72  			wakeup-source;
511b4858dc8a1b Hui Liu             2024-03-11   73  			debounce-interval = <15>;
511b4858dc8a1b Hui Liu             2024-03-11   74  			linux,can-disable;
511b4858dc8a1b Hui Liu             2024-03-11   75  		};
511b4858dc8a1b Hui Liu             2024-03-11   76  	};
511b4858dc8a1b Hui Liu             2024-03-11   77  
9af6a9f32ad002 Komal Bajaj         2023-11-29   78  	reserved-memory {
9af6a9f32ad002 Komal Bajaj         2023-11-29   79  		xbl_mem: xbl@80700000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29   80  			reg = <0x0 0x80700000 0x0 0x100000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29   81  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29   82  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29   83  
9af6a9f32ad002 Komal Bajaj         2023-11-29   84  		cdsp_secure_heap_mem: cdsp-secure-heap@81800000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29   85  			reg = <0x0 0x81800000 0x0 0x1e00000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29   86  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29   87  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29   88  
9af6a9f32ad002 Komal Bajaj         2023-11-29   89  		camera_mem: camera@84300000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29   90  			reg = <0x0 0x84300000 0x0 0x500000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29   91  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29   92  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29   93  
9af6a9f32ad002 Komal Bajaj         2023-11-29   94  		wpss_mem: wpss@84800000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29   95  			reg = <0x0 0x84800000 0x0 0x1900000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29   96  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29   97  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29   98  
9af6a9f32ad002 Komal Bajaj         2023-11-29   99  		adsp_mem: adsp@86100000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  100  			reg = <0x0 0x86100000 0x0 0x2800000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  101  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  102  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  103  
9af6a9f32ad002 Komal Bajaj         2023-11-29  104  		cdsp_mem: cdsp@88900000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  105  			reg = <0x0 0x88900000 0x0 0x1e00000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  106  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  107  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  108  
9af6a9f32ad002 Komal Bajaj         2023-11-29  109  		video_mem: video@8a700000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  110  			reg = <0x0 0x8a700000 0x0 0x700000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  111  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  112  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  113  
9af6a9f32ad002 Komal Bajaj         2023-11-29  114  		cvp_mem: cvp@8ae00000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  115  			reg = <0x0 0x8ae00000 0x0 0x500000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  116  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  117  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  118  
9af6a9f32ad002 Komal Bajaj         2023-11-29 @119  		ipa_fw_mem: ipa-fw@8b300000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  120  			reg = <0x0 0x8b300000 0x0 0x10000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  121  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  122  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  123  
9af6a9f32ad002 Komal Bajaj         2023-11-29  124  		ipa_gsi_mem: ipa-gsi@8b310000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  125  			reg = <0x0 0x8b310000 0x0 0xa000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  126  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  127  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  128  
9af6a9f32ad002 Komal Bajaj         2023-11-29  129  		gpu_microcode_mem: gpu-microcode@8b31a000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  130  			reg = <0x0 0x8b31a000 0x0 0x2000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  131  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  132  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  133  
9af6a9f32ad002 Komal Bajaj         2023-11-29  134  		mpss_mem: mpss@8b800000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  135  			reg = <0x0 0x8b800000 0x0 0xf600000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  136  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  137  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  138  
9af6a9f32ad002 Komal Bajaj         2023-11-29  139  		tz_stat_mem: tz-stat@c0000000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  140  			reg = <0x0 0xc0000000 0x0 0x100000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  141  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  142  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  143  
9af6a9f32ad002 Komal Bajaj         2023-11-29  144  		tags_mem: tags@c0100000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  145  			reg = <0x0 0xc0100000 0x0 0x1200000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  146  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  147  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  148  
9af6a9f32ad002 Komal Bajaj         2023-11-29  149  		qtee_mem: qtee@c1300000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  150  			reg = <0x0 0xc1300000 0x0 0x500000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  151  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  152  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  153  
408e1776516149 Krzysztof Kozlowski 2024-02-13  154  		trusted_apps_mem: trusted-apps@c1800000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  155  			reg = <0x0 0xc1800000 0x0 0x1c00000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  156  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  157  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  158  
9af6a9f32ad002 Komal Bajaj         2023-11-29  159  		debug_vm_mem: debug-vm@d0600000 {
9af6a9f32ad002 Komal Bajaj         2023-11-29  160  			reg = <0x0 0xd0600000 0x0 0x100000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  161  			no-map;
9af6a9f32ad002 Komal Bajaj         2023-11-29  162  		};
9af6a9f32ad002 Komal Bajaj         2023-11-29  163  	};
9af6a9f32ad002 Komal Bajaj         2023-11-29  164  
9af6a9f32ad002 Komal Bajaj         2023-11-29  165  	vph_pwr: vph-pwr-regulator {
9af6a9f32ad002 Komal Bajaj         2023-11-29  166  		compatible = "regulator-fixed";
9af6a9f32ad002 Komal Bajaj         2023-11-29  167  		regulator-name = "vph_pwr";
aa56130e88de50 Komal Bajaj         2023-12-20  168  		regulator-min-microvolt = <3700000>;
aa56130e88de50 Komal Bajaj         2023-12-20  169  		regulator-max-microvolt = <3700000>;
9af6a9f32ad002 Komal Bajaj         2023-11-29  170  	};
9af6a9f32ad002 Komal Bajaj         2023-11-29  171  };
9af6a9f32ad002 Komal Bajaj         2023-11-29  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

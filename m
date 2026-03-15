Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7322D739C
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 17:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595541; cv=none; b=Lh5YyAPfx3ox30BFvWcEJF/hV+9PGh441w24v+4QivRt5Th9q8KBvfR284NNQ7kVy/2E+g3rmr6aJ0d8OVz81akv2IAxQBskjff2D0FYqJg3G/ct+gS2IOpQV1+Mct6/GUl45jSE3JOKy3q9QY4tom87ICcuAD7KYIqbyqzJ/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595541; c=relaxed/simple;
	bh=sp2/FcVPhdxfuFGrxBhbzIUICoxb9z2ENLr/8I67yjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ljIg5uMK2K6WIOg515h5LPxzuNHoXLfAG3KYCmYY6ymwd2uG3++/xUBRuGkSLxmrdNNT7/U12bQntJ0nNSw0n0cBPSUq5D1oJMLdTN0ZOTL/OVV8tiL3qS7C1EKCTvWmv3mUfD3EGnFeFPxG5P/XD4+YymD7/DEn6IpNs2aYaP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBeIbDz9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBeIbDz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773595539; x=1805131539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sp2/FcVPhdxfuFGrxBhbzIUICoxb9z2ENLr/8I67yjs=;
  b=nBeIbDz9beD0WncOYlMcqUl1hjzCmO879y35gHchwSXgLMP1acL3CNkQ
   eacUD7+mDQ/CBaQ1q3WMxH7EmTDZ/Q/EaFudRyqiGHkgrspZL0PJgXfR1
   kO3mQ7ZpWCwY3UFTnadZ3/6apKqiwqj5WP/QfyYiiskaxV3EUGWm/Gj8a
   y68jJKs0Sb+zfj+Io/Eb30A6C/d4Yj/j9NJHYcz14Kv6aT2nplrcMTq6y
   Yh1gZCXkzs8tDO5wryXOxkmwtUkyOcJDXneovH3FdhbBOep4gkzBMXVhQ
   XLrCynmyW2PGJ6TTZ+v0FVvDnnjzGVStCBmbuULxigpmttkiON1H3IPoW
   w==;
X-CSE-ConnectionGUID: vj53OUXKTlq+LlgBdTJeoQ==
X-CSE-MsgGUID: vDAovpcJRLGt0ahk02XA7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74508633"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="74508633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 10:25:39 -0700
X-CSE-ConnectionGUID: ZzG6AP3MQ46p8PwfVKb4EQ==
X-CSE-MsgGUID: QG96FHGLRU6sVQpsZ3n4Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="226675357"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Mar 2026 10:25:37 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1pDa-0000000045R-3sk2;
	Sun, 15 Mar 2026 17:25:34 +0000
Date: Sun, 15 Mar 2026 18:24:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/5] dt-bindings: irq: Add Qualcomm MSM VIC binding
Message-ID: <202603151805.29IMcyy2-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260315111705.118544-1-aljoshua.hell@gmail.com>
References: <20260315111705.118544-1-aljoshua.hell@gmail.com>
TO: j0sh1x <aljoshua.hell@gmail.com>
TO: tglx@kernel.org
CC: linux-kernel@vger.kernel.org
CC: subsystem@vger.kernel.org
CC: dominikkobinski314@gmail.com
CC: j0sh1x <aljoshua.hell@gmail.com>

Hi j0sh1x,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.16-rc1 next-20260313]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/j0sh1x/irqchip-Add-Qualcomm-MSM-VIC-driver/20260315-192045
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260315111705.118544-1-aljoshua.hell%40gmail.com
patch subject: [PATCH 1/5] dt-bindings: irq: Add Qualcomm MSM VIC binding
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: openrisc-randconfig-2052-20260315 (https://download.01.org/0day-ci/archive/20260315/202603151805.29IMcyy2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603151805.29IMcyy2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603151805.29IMcyy2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml: ignoring, error parsing file
--
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:46:31: mapping values are not allowed here
--
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:4:1: [error] missing document start "---" (document-start)
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:13:18: [error] string value is redundantly quoted with any quotes (quoted-strings)
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:17:4: [error] missing starting space in comment (comments)
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:18:5: [error] duplication of key "description" in mapping (key-duplicates)
   Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:18:18: [error] string value is redundantly quoted with any quotes (quoted-strings)
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:19:5: [error] duplication of key "required" in mapping (key-duplicates)
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:20:5: [error] duplication of key "type" in mapping (key-duplicates)
   Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:24:18: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:29:18: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:34:18: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:39:18: [error] string value is redundantly quoted with any quotes (quoted-strings)
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:72:6: [error] no new line character at the end of file (new-line-at-end-of-file)
>> Documentation/devicetree/bindings/interrupt-controller/qcom,msm-vic.yaml:46:31: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

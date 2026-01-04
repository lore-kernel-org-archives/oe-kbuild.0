Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B6A1E515
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 00:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767487046; cv=none; b=QdYITUJ1SLQ5TTkkVlKBUp0r/XMYwKEKNK1s7+W3x/AwtVzxvMjnlUJ8VMSoyotp0X17zxaLXe/O/AZOwR09D3HoTvNwhVXT1tlkh33a+7jWNqIh16loimessoJ2R5YjWhfzSOOEMkUZL4aJHEjydX3OOFW+ohaXZiSR8mVQB7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767487046; c=relaxed/simple;
	bh=5fMpgXJXJ+Gh0EPz9CbxDY9SmbXDeWjXVtvDG8XKDcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZDaMbIR5/yenn6MCJLxUrzbUd7gFsopYFsnKqaOQHuSuv2PLNhSjPk33Kfc7pVmDa+226yUjnJmBxW5UQMuWlfGewyN7l38Q8YCgOrm7dNKPByg8U1E8f6DsTOdt6qZQDmwJNfuZM6XefRAgYBQ6+bU3GISEnNvpW9mfn+cfJyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvTIeVYJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvTIeVYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767487044; x=1799023044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5fMpgXJXJ+Gh0EPz9CbxDY9SmbXDeWjXVtvDG8XKDcw=;
  b=JvTIeVYJ6WkQFqHWtQ+cwUKsTGL4u5Muq5713VsGSXvgOhvnwJv4GAJK
   QhL/Jw4HydJ5Ubs2GdXRObM7lHhsEtm+YoqZ5WIss1JJnpUtWQbgzwiTF
   r4uZh/ARVRkrYEaXl6/Purz4M6IHCmk7WfSKMWUcg+MUT9860yZQLyxjm
   QIhOQmDFtsvKH/yulETweDZIRJ4Dce5d4FqgEULNPTf9IgU1yK7xwYfI2
   UZXzgPX9Gg/QT6YLP23HwOkJdc9/3qM62RtfyVw0AnIpkUyGuqPu+bsgG
   /lr+AP7kOBW5IeHVlNCt3aBoh/M8hAlA49k7o4TIHs1KNjTJVDjscG8wW
   g==;
X-CSE-ConnectionGUID: uQ2f2WQhSpaFO0FYyfsJbA==
X-CSE-MsgGUID: qQ+zhwAaSH64X39QX1sbXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68845087"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68845087"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 16:37:23 -0800
X-CSE-ConnectionGUID: iemBw81zQGCtdCvE0myybQ==
X-CSE-MsgGUID: /7cXxoMVTgGTF/SG83HEYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="201956630"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jan 2026 16:37:22 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcC7U-000000000nJ-1j8a;
	Sun, 04 Jan 2026 00:37:20 +0000
Date: Sun, 4 Jan 2026 01:36:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <202601040137.XYgJVZue-lkp@intel.com>
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
In-Reply-To: <20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com>
TO: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: sumit.garg@kernel.org
CC: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Hi Varadarajan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Varadarajan-Narayanan/arm64-dts-qcom-ipq9574-Enable-eMMC-variant/20260102-184816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260102104638.3802715-1-varadarajan.narayanan%40oss.qualcomm.com
patch subject: [PATCH] arm64: dts: qcom: ipq9574: Enable eMMC variant
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260103 (https://download.01.org/0day-ci/archive/20260104/202601040137.XYgJVZue-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040137.XYgJVZue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601040137.XYgJVZue-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

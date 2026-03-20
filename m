Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F643090E2
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Mar 2026 06:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773987332; cv=none; b=p5JjOmlWNkyJuD+w1tLfUp6C0HfOgVdvkaNAOQbseiZmq5usP2dMSDzbNS2/H3eDjz5eoaj7zWEKXqfg2qv9kHNeytNyf6VsoGd6Su/nUCAPV0YxmSOvOA8+ru/8BmziZPxSPB1uh0AeKJUCu0lpaf0OaLQjYMttBzOOTT/hpU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773987332; c=relaxed/simple;
	bh=pSewP7+P9Hx5mNSKbdqsa1u6oZGlcXQOLeGVKqUDxt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/9uk4goipsUEOFtDVlflOarFrSK9XHJhJjOEP+zxsJQhweoFdO1WNUY0Ki0jlBXKq5HgwDIZ0L6UgijUmhB2WLjomYqeF6n+EhbzLHioxOK3S4qGBoc/KWhFb3nehgUZkFdqifWRQjd3/c8ElFJScENmuN0MhoKDbf0AA4XYn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4I5R4rY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4I5R4rY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773987330; x=1805523330;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pSewP7+P9Hx5mNSKbdqsa1u6oZGlcXQOLeGVKqUDxt0=;
  b=S4I5R4rYX26rKDtS6+gSifp4kuuvk+6H1sIMtf58c8KhcaQknhLxHygo
   hOg4LJiyPkGwCjD/YDPMnkbMc0kF4KURN1RjxWza+lzvax2usVkjgQFVv
   8nHJBAfjKrH4APo1ecJI8XyuIPewF9Xwp0CNtdfdi7S5PTnrnaUJvy2Hi
   gRp1rgh40zT1p6YKUCBeRVZ+lDVbED472z6hQinhRTXhPB9cjzhTSGewk
   ZHAJi92pANlg/6MOmpAj/uamMUyWL3wiKyyLKJEOLxwcvgDUQ942u8yyK
   RVV2pN85U9f2cZOPF0mKjdOvmtK+jZwU7XI+upA9hTLV0pT2mdLtgfTzG
   A==;
X-CSE-ConnectionGUID: QIxKkbYlQ5iGIbNHupRG6g==
X-CSE-MsgGUID: MxXmMpQZTaSPcD0fLxFRQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92643089"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="92643089"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 23:15:30 -0700
X-CSE-ConnectionGUID: fhrJm6NySuamouF5Bfk3nQ==
X-CSE-MsgGUID: 7EAd3wDfRJ+fbtsZLrnY3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="253691539"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 19 Mar 2026 23:15:29 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3T8o-000000004z7-1wOQ;
	Fri, 20 Mar 2026 06:15:26 +0000
Date: Fri, 20 Mar 2026 07:14:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/5] dt-bindings: pci: Document the NVIDIA Tegra264 PCIe
 controller
Message-ID: <202603200723.Bh7b8npy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260319160110.2131954-4-thierry.reding@kernel.org>
References: <20260319160110.2131954-4-thierry.reding@kernel.org>
TO: Thierry Reding <thierry.reding@kernel.org>
TO: Thierry Reding <thierry.reding@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Jon Hunter <jonathanh@nvidia.com>
CC: linux-pci@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[cannot apply to pci/next pci/for-linus robh/for-next linus/master v6.16-rc1 next-20260319]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/soc-tegra-Update-BPMP-ABI-header/20260320-025556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20260319160110.2131954-4-thierry.reding%40kernel.org
patch subject: [PATCH 3/5] dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: openrisc-randconfig-2051-20260320 (https://download.01.org/0day-ci/archive/20260320/202603200723.Bh7b8npy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200723.Bh7b8npy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603200723.Bh7b8npy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml:61:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +61 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml

12a9b5ad8d4182 Thierry Reding 2026-03-19  50  
12a9b5ad8d4182 Thierry Reding 2026-03-19  51  required:
12a9b5ad8d4182 Thierry Reding 2026-03-19  52    - interrupt-map
12a9b5ad8d4182 Thierry Reding 2026-03-19  53    - interrupt-map-mask
12a9b5ad8d4182 Thierry Reding 2026-03-19  54    - iommu-map
12a9b5ad8d4182 Thierry Reding 2026-03-19  55    - msi-map
12a9b5ad8d4182 Thierry Reding 2026-03-19  56    - nvidia,bpmp
12a9b5ad8d4182 Thierry Reding 2026-03-19  57  
12a9b5ad8d4182 Thierry Reding 2026-03-19  58  allOf:
12a9b5ad8d4182 Thierry Reding 2026-03-19  59    - $ref: /schemas/pci/pci-host-bridge.yaml#
12a9b5ad8d4182 Thierry Reding 2026-03-19  60    - oneOf:
12a9b5ad8d4182 Thierry Reding 2026-03-19 @61      - description: C0 controller (no UPHY)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

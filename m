Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CD138F935
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 21:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557794; cv=none; b=AK2AVSWnxEfE7vZwZ5cWPpcBM/vM5dOCY/VNhcUZH2vDZm/asM3pTQAp8Xa5dIKqWF/dZjsJOG9Hb7V66pCt4VFeFgc2E6Sp8KO+MJqo1+fQM7irrPl4xIHe0LnxdTtvyPcGjaWoXpUd1lRKweIKV6XW4RYN134ZYN3mB7cFqis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557794; c=relaxed/simple;
	bh=t15HzDESWNiwwevVKEKMA3mz/XA10HcyTngeH9Ru5Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eVJfgRj+UJefVJYlM/wxmWuLRG4/xjW9H0XTliyEhEcqkmfYpSW8AjiGxg4u+WXNozJ9UxSjvn0cWcbsBDgutPylcwtLo2jPWAzyawshwp5s74IYZks8Y5RBaTiA+VkW3hdqn9HmN/Lu1iClZsBKYVwrBX2dcRpSGkIdMqefoZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnyvhnV2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnyvhnV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781557792; x=1813093792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t15HzDESWNiwwevVKEKMA3mz/XA10HcyTngeH9Ru5Cs=;
  b=DnyvhnV2FeeXIU7Z308XiSHNeOFoTOqvpqoSD3C3qZ14+RkG01aDe/MW
   NB5kc034FfQBuQ+U8A//KlA0mU3kvB+OoxmgoChnQdQx3F38Lc4DX8sVI
   +aFeFDin+e4WJxkZgOtcVH/2NdWHJkECHgptXaBR2glNgUfJWYugw4iwf
   8564VKZKG7fWyz3h8jo729SzpAHmrQZAEu8mGAD/YiT8NEX8HbdJbFdLk
   dvRh7fRN3SFrTJsJ+AWefy7Yudpfj77j7JCKrA6Nye5sq9ruI0eH0Xnlh
   LNW+oYhUv2MXXDPOec7c6+v8XEM2hwP0IjbiWdqjJ5dwKOKjOxI/5pfjr
   Q==;
X-CSE-ConnectionGUID: g9qPSDaiR72xlKBa1GwEfg==
X-CSE-MsgGUID: 0sTEnLrwQ4SkC8zL7n5fZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81449082"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="81449082"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 14:09:51 -0700
X-CSE-ConnectionGUID: K4YLSPOdSXaxIWLjqgD8AQ==
X-CSE-MsgGUID: 9d9K4enDQ/WTCP/YNRzYqw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jun 2026 14:09:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZEZ2-000000004y5-0i4Q;
	Mon, 15 Jun 2026 21:09:48 +0000
Date: Mon, 15 Jun 2026 23:09:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 2/2] scsi: ufs: core: Add support for static TX
 Equalization settings
Message-ID: <202606152309.d4ZWI89u-lkp@intel.com>
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
In-Reply-To: <20260615085027.2102882-3-can.guo@oss.qualcomm.com>
References: <20260615085027.2102882-3-can.guo@oss.qualcomm.com>
TO: Can Guo <can.guo@oss.qualcomm.com>
TO: krzk@kernel.org
TO: bvanassche@acm.org
TO: beanhuo@micron.com
TO: peter.wang@mediatek.com
TO: martin.petersen@oracle.com
TO: mani@kernel.org
CC: linux-scsi@vger.kernel.org
CC: Can Guo <can.guo@oss.qualcomm.com>
CC: Alim Akhtar <alim.akhtar@samsung.com>
CC: Avri Altman <avri.altman@wdc.com>
CC: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
CC: Nitin Rawat <quic_nitirawa@quicinc.com>
CC: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
CC: linux-kernel@vger.kernel.org

Hi Can,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next krzk-dt/for-next linus/master v7.1 next-20260615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Can-Guo/dt-bindings-ufs-Document-static-TX-Equalization-settings-properties/20260615-170015
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20260615085027.2102882-3-can.guo%40oss.qualcomm.com
patch subject: [PATCH v8 2/2] scsi: ufs: core: Add support for static TX Equalization settings
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: microblaze-randconfig-2051-20260615 (https://download.01.org/0day-ci/archive/20260615/202606152309.d4ZWI89u-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606152309.d4ZWI89u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606152309.d4ZWI89u-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml: properties:hisilicon,sap-dll-reg:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/mmc/hisilicon,hi3798cv200-dw-mshc.yaml: properties:hisilicon,sap-dll-reg:items:1: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/ufs/ufs-common.yaml: patternProperties:^txeq-preshoot-g[1-6]$:items: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/ufs/ufs-common.yaml: patternProperties:^txeq-deemphasis-g[1-6]$:items: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/ufs/ufs-common.yaml: properties:tx-precode-enable-g6:items: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml: properties:st,syscfg-dlyb:items:0: 'anyOf' conditional failed, one must be fixed:
   	'items' is a required property
   	'minItems' is a required property
   	'maxItems' is a required property
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml: properties:st,syscfg-dlyb:items:1: 'anyOf' conditional failed, one must be fixed:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D837F730
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Sep 2026 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057636; cv=none; b=N/weq0+DzhhNZuYlEpZUI0AM7K+7UJENFhDd2c9EHra2J9jQQhrmjX6QbUpqKWlMWi1xNCp4JF/Wm/koj6WTi7/GuoTxHweHIfaZtghbnfllGMW0NdddvZ/j4f34fDIPf72JbB0Z9sTknC6tdllS+E64HhmqV2aiy5fzrFsKlcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057636; c=relaxed/simple;
	bh=Zc3/nh96ElTfHjGKUZx7eEkhsIkGMkiZqb+FA7KjzCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XmAY5cm7aYp46nD02beF5iBQeWbOT01nI8WOFs2vOfklPdmPof0WGrvDPGVrCR/WQWVlodL4uQw+inUvDHiFJtIt37zDdBBZqFGKDYR+kbotTH9KFLjkQDTXC9YTvEmeVKNeMO9mshdUt05JORridOsrZVBgrmwitflGoTL4L4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHY6NlOS; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHY6NlOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790057634; x=1821593634;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zc3/nh96ElTfHjGKUZx7eEkhsIkGMkiZqb+FA7KjzCU=;
  b=fHY6NlOSbjnRmZXIX5jzTnAhC15LB6DUfWfk2uchzlOkOjSkZ7YPAFyi
   s0nyvji/QK4qR/1+OD2QRDVpnQaXoSt6b6dHoSTtfcejKdjdXx/8YRBIQ
   C4pi+D1NKbERuCyHjUQvXSTAbCen6JqrYJYZKfyaxeMnuj0A0YCZGekyO
   t25ZJvps8hIgKH/gQ2EXZAIvxjIQ/BlbPXWnuoKOIh0fSkAXZfdpqMnSj
   Xo8bA5VVJrDgktqiA75GSgKf9+u3OSAxlb9P0yUj51ksQhqC/LoR744ZJ
   jby6/7nOOf94VAzljR0gzAXBNdXaoWE8OtnXKXs2V2jD5/zKfsilC6Rqf
   w==;
X-CSE-ConnectionGUID: ZE7gg5KwTeaHHXY2vNouUQ==
X-CSE-MsgGUID: rU04V8sQTnOIKwZeCd/uWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1133499"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="1133499"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:13:54 -0700
X-CSE-ConnectionGUID: WFr6Qz1KRVCMZ2AT+tevGA==
X-CSE-MsgGUID: RhJdBi6FRriRkdysokiz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="271532198"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Sep 2026 23:13:54 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8tlD-000000000Fv-0veN;
	Tue, 22 Sep 2026 06:13:47 +0000
Date: Tue, 22 Sep 2026 08:12:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb:
 hdmi-receiver-cma (shared-dma-pool): Unevaluated properties are not allowed
 ('alignment', 'alloc-ranges', 'no-map', 'size' were unexpected)
Message-ID: <202609220851.QH8MmvDa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Maud Spierings <maud_spierings@hotmail.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: "Ond=C5=99ej Jirman" <megi@xff.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: ccc7f16ea2e33366f7b7005daad81e316f8cb6e4 arm64: dts: rockchip: Enab=
le HDMI receiver on orangepi 5 plus
date:   1 year, 1 month ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-2401-20260919 (https://download.01.org/0day-ci/arc=
hive/20260922/202609220851.QH8MmvDa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260922/202609220851.QH8MmvDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: ccc7f16ea2e3 ("arm64: dts: rockchip: Enable HDMI receiver on orang=
epi 5 plus")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609220851.QH8MmvDa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-d=
ma-pool.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: hdmi-receiver-c=
ma (shared-dma-pool): Unevaluated properties are not allowed ('alignment', =
'alloc-ranges', 'no-map', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-d=
ma-pool.yaml
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /npu@fdab0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /npu@fdac0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: /npu@fdad0000: =
failed to match any schema with compatible: ['rockchip,rk3588-rknn-core']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

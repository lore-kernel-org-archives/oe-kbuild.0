Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1902D3CFF4F
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Jul 2026 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105191; cv=none; b=HASCiwUY+i/8OdT/Cmvp8Kkg4Ld8oXpcRutsC4+Cc2MfUsFZfISNV7MeWKIX7toVwtwcLrIHDb18kDMqGICP5Pai900jN27WlisUoS7D5+6VehgEFeqPEOY1KHQp7zFvCZOOfEhC+wiE1ov99g2iM0uB1fCanV8PcMmPuN8kVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105191; c=relaxed/simple;
	bh=yprxONfK6E+zLKjkLE0NzUx9/9xLMsDR/Vgg2qZ/VNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jxl+4V1aP3HyY8sYMiXuLu3qDzSMthrxxP8sPc4F+nkKPS8a3zb881y6LO5Mbn8OAv47QR6yx4rGkVr3/OB1nP2Za8v0WqfkQPj2sOeDqBsOO2Wg2R/OSz0vq6LpUA8KnAo88Frxj7/GrNMOBrkH+p0xy4ftsgoluj4ynmgpicI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEC/8GmZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEC/8GmZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784105186; x=1815641186;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yprxONfK6E+zLKjkLE0NzUx9/9xLMsDR/Vgg2qZ/VNI=;
  b=eEC/8GmZ2SOgwxbWxGbvoU+QE2yhxArZVKcQNiZV9kAvAuKIRJyrjZCI
   zqMfwoPuTp8LiLLZOdkm6DaduBOjT+4t96FxeZWpiMGJRQtP/blT88nQm
   CXS1HZwTvwO5S9/qr1fXD5zLwSI6RXLBogRuG8Booh1QUpJKOPJSvWyQA
   bQj/wIIVVzvQKnODqQUvusFB/WvxYSYsOZH+LOUUU6GjyUC6So1Ca8dwj
   9WCe2gsLV5ZJHpbPz39VI8CaUevxwm7RqIC47Pon5HCol6Z3oeZBLS1Bn
   L88igWuQaGzlkZ+yHW/cl96sC8QZZl07D7az2FF8F8Xcrxlq4bK5mXR+i
   g==;
X-CSE-ConnectionGUID: SE3UGz+YQsymnfC8U9FXTQ==
X-CSE-MsgGUID: OqnYEc0BQa+7m3HprE9oZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83723059"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="83723059"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 01:46:10 -0700
X-CSE-ConnectionGUID: +8AH6W2CSEScH8yBJhX9YA==
X-CSE-MsgGUID: zuMXBoULRYqPdX4AC4bHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="255612870"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 15 Jul 2026 01:46:09 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjvFn-000000004Dl-0Brr;
	Wed, 15 Jul 2026 08:46:07 +0000
Date: Wed, 15 Jul 2026 10:45:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Documentation/devicetree/bindings/arm/psci.yaml:
 properties:reboot-mode:patternProperties:^mode-.*$: {'minItems': 1,
 'maxItems': 3, 'items': [{'description': 'arg1 (vendor-specific SYSTEM_RESET2
 reset_type)', 'minimum': 2147483648}, {'description': 'arg2 ...
Message-ID: <202607151050.3u0xuqV5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Shivendra-Pratap/pow=
er-reset-reboot-mode-Remove-devres-based-allocations/20260715-024522
head:   551f6bca8bd559897f4554e0448c661d798dfeb6
commit: 61e39e6f4b6a5a3dc39cd4db50550da83923c8e4 dt-bindings: arm: Document=
 reboot mode magic
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: openrisc-randconfig-2052-20260715 (https://download.01.org/0day-ci/=
archive/20260715/202607151050.3u0xuqV5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260715/202607151050.3u0xuqV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607151050.3u0xuqV5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/psci.yaml: properties:reboot-mode:=
patternProperties:^mode-.*$: {'minItems': 1, 'maxItems': 3, 'items': [{'des=
cription': 'arg1 (vendor-specific SYSTEM_RESET2 reset_type)', 'minimum': 21=
47483648}, {'description': 'arg2 (cookie_lo in 2-cell form, cookie_hi in 3-=
cell form)'}, {'description': 'arg3 (cookie_lo in 3-cell form)'}], 'descrip=
tion': 'Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The stri=
ng\nafter "mode-" maps a reboot mode to a vendor-specific reset.\nA vendor-=
specific reset takes two arguments, a 32-bit reset_type and a\n64-bit cooki=
e. The arguments are encoded as up to three 32-bit cells.\nEach mode proper=
ty is encoded as mode-xxx =3D <arg1[, arg2[, arg3]]>,\nwhere:\n- arg1 is re=
set_type and must be >=3D 0x80000000.\n- In 2-cell form, arg2 is lower 32 b=
its of cookie.\n- In 3-cell form, arg2 is high 32 bits of cookie\n  and arg=
3 is low 32 bits of cookie.\n\nAll values should be provided as per the PSC=
I SYSTEM_RESET2\nspecification.\n'} should not be valid under {'required': =
['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

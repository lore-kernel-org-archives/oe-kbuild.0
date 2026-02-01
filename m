Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76F019B5A7
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769932471; cv=none; b=RNVBI8ZlJPOOnXPi3JMMmRnw+O8y45kgjDjdYCgCyAyGx2g8QpzM/TK67ylm7FhqbvlRQgWb7dM/g45xmKqwRQr1OBUVhZtrIvrO1bTeRwPueAkYXHPF4uSXFUeKA39wDj1Vnp6+MdSx2qJ9NCCgEw682ZahsAghvLt5ZICdqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769932471; c=relaxed/simple;
	bh=Rk5FTQIKlQ6orvgrbJrVm+szfnJBaOB5kqrbs9MRieU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rTstxAEFU7hLRoJWS9k9wtIDfl7pKkSDKmXnvFqBZljl5TZKNsYS2an9rosqQbC375sqq4Y3bIHrD41ZFQfxgJo1OVNARbjuLkS6EzjsandS6a1Dg+I0bjBdF/w3B6kNDSkt0NZK7eEAgyd7eyBk1FAzAgf99MBKznfibzdv+qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWla5Bdd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWla5Bdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769932469; x=1801468469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rk5FTQIKlQ6orvgrbJrVm+szfnJBaOB5kqrbs9MRieU=;
  b=CWla5Bdd0tC99QodsLbtQ3cSs/Zq4711R96qAn2EW05lXpLemrimK1M/
   vOgtjToNVZ0o6JHlOaAt0i7QIkE3L4pMAuelew8Gnrk0cfdcId2VJb4/n
   FmJeI9cptt05N1k1sSkXsD7dlJ4Qj6dSrLo3X+gQwGheS9u66sEV50B7W
   fDrx0kCa0q+MkHxiJo2p/b3v6l9+tuWSVvm8weTn6CV+QJEAlgmPERixd
   TfAqMbx9Ea3ruMLWqPb5b6d6C9Nt2+gIcbvY0GhjRyAirlAAQqcsmwVa2
   4z8B08ngD/6zT5c2Y+o9xiI3iFv4ybJRl/hSLXd1e2sQkMIntNKuYvwig
   A==;
X-CSE-ConnectionGUID: 12+nuSxgTz6yGW/482zjhQ==
X-CSE-MsgGUID: AZj8vEBLSGOQYn8iLHJvHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="81858021"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="81858021"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 23:54:28 -0800
X-CSE-ConnectionGUID: BEnoS+EKSoKuJ9EidBkxdQ==
X-CSE-MsgGUID: 3xab89vRTNSyaULSGTFqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="213310745"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 31 Jan 2026 23:54:26 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmSHo-000000002vZ-0qOS;
	Sun, 01 Feb 2026 07:54:24 +0000
Date: Sun, 1 Feb 2026 08:53:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: media: Add bindings for dim2 compatible
 strings.
Message-ID: <202602010849.CKQ97NCf-lkp@intel.com>
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
In-Reply-To: <20260130141442.139640-1-harshdaniel66356@gmail.com>
References: <20260130141442.139640-1-harshdaniel66356@gmail.com>
TO: harshdaniel66356@gmail.com
TO: parthiban.veerasooran@microchip.com
TO: christian.gromm@microchip.com
TO: gregkh@linuxfoundation.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-staging@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Harsh Daniel <harshdaniel66356@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc7 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/harshdaniel66356-gmail-com/dt-bindings-media-Add-bindings-for-dim2-compatible-strings/20260130-221618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260130141442.139640-1-harshdaniel66356%40gmail.com
patch subject: [PATCH] dt-bindings: media: Add bindings for dim2 compatible strings.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260131 (https://download.01.org/0day-ci/archive/20260201/202602010849.CKQ97NCf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010849.CKQ97NCf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602010849.CKQ97NCf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: mlp@ec520000 (renesas,r8a77990-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible:0: 'renesas,r8a77990-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible: ['renesas,r8a77990-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: mlp@ec520000 (renesas,r8a77995-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible:0: 'renesas,r8a77995-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible: ['renesas,r8a77995-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77965-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77990-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible:0: 'renesas,r8a77990-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77990-mlp): compatible: ['renesas,r8a77990-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible:0: 'renesas,r8a77961-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77961-mlp): compatible: ['renesas,r8a77961-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible:0: 'renesas,r8a77965-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77965-mlp): compatible: ['renesas,r8a77965-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77951-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible:0: 'renesas,r8a7796-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77960-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7796-mlp): compatible: ['renesas,r8a7796-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77995-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible:0: 'renesas,r8a77995-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a77995-draak-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a77995-mlp): compatible: ['renesas,r8a77995-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
--
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): 'power-domains', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible:0: 'renesas,r8a7795-mlp' is not one of ['renesas,mlp', 'renesas,rcar-gen3-mlp']
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml
>> arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs-panel-aa104xd12.dtb: mlp@ec520000 (renesas,r8a7795-mlp): compatible: ['renesas,r8a7795-mlp', 'renesas,rcar-gen3-mlp'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,mlp.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

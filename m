Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BDE389E08
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211398; cv=none; b=dk62cTLRHxUmZRY4dV7GdAEcrc33ONA/OWJMxTE2Ummgw5jevYD9a39j6aU+XUHJ+s3Iepk2EaY4eG2FpN68YdhXZMaabop9C2OqA+W1YDZkoJMSf5VBy/PTcUsMqaD+zbjw4+SoTsS18hrY8f2tf1ZPBwUbeP8X4oh4Sjdbv/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211398; c=relaxed/simple;
	bh=oiu273bZJeXop2wjHEce94tsiqm7azz+FXyWxS8UpQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVKaYzeAH34JmX/LQToc+5WOpCl9Zqr9Zy3zqrQkielPyK7kIuTohkCY+9jtPelqOXxgH8BA9XK1Yy1ozc6ohvH1NR4Dw1u/fjqazVKdscuVIQJJJ6inp96lDYfeCREBLbJ8OPUJJ22wLuezOPQ853D9r6RwTL1GTEwIe/kszfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YV2Koh4q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YV2Koh4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775211394; x=1806747394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oiu273bZJeXop2wjHEce94tsiqm7azz+FXyWxS8UpQI=;
  b=YV2Koh4q3UKSRyHh0xHf88ftfsxxrBb88RtWj3Poo9yRIlZDR2kO4MuX
   EMvWKXUe1rNuPGxSFcHJFm3xM7oEWhWQUX4DcyKcPystLnbu3OOgcPHHj
   zXD8ypXuxMWaAXc6r6W93v/+ApsDbZ1uxNOXT8uZOhqYVJw77T8Zf+FTg
   ZvSlVlJpj5hYEd9cD81RdtQDnNeax2b8VPxoXMcsSRwrtKmxU0da0apRF
   x4SpaNX9VPbRSr488M5NfQiJyObHO9CBg66tOK9SoibjbdYdeh8itfCVM
   31/74osJf3t2hQi02jDxNQzMUFybj6CgH7lSnxYwA6vg0rL8fssTZLRJV
   A==;
X-CSE-ConnectionGUID: 11xJo7HkQRmGR1XvTNp+WQ==
X-CSE-MsgGUID: hjs/TDgwRzu9Fs9NcjxKoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76338215"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76338215"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 03:16:33 -0700
X-CSE-ConnectionGUID: +0PcYZtJSb6QM9PuvabDxg==
X-CSE-MsgGUID: Hcad/TZnQeO8DLYHbC7P8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="222867825"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Apr 2026 03:16:33 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8bZm-000000009Gz-2i7c;
	Fri, 03 Apr 2026 10:16:30 +0000
Date: Fri, 3 Apr 2026 12:15:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: sound: Convert pcm3060 to DT schema
Message-ID: <202604031208.j86jIMBW-lkp@intel.com>
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
In-Reply-To: <20260326153041.496811-1-padmashreess2006@gmail.com>
References: <20260326153041.496811-1-padmashreess2006@gmail.com>
TO: Padmashree S S <padmashreess2006@gmail.com>
TO: k.marinushkin@gmail.com
TO: lgirdwood@gmail.com
TO: broonie@kernel.org
CC: robh@kernel.org
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Padmashree S S <padmashreess2006@gmail.com>

Hi Padmashree,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v7.0-rc6 next-20260402]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Padmashree-S-S/dt-bindings-sound-Convert-pcm3060-to-DT-schema/20260329-162206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260326153041.496811-1-padmashreess2006%40gmail.com
patch subject: [PATCH] dt-bindings: sound: Convert pcm3060 to DT schema
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arc-randconfig-2052-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031208.j86jIMBW-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031208.j86jIMBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604031208.j86jIMBW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/pcm3060.yaml:45:7: [error] no new line character at the end of file (new-line-at-end-of-file)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +45 Documentation/devicetree/bindings/sound/pcm3060.yaml

39cbb0e557c64c Padmashree S S 2026-03-26  33  
39cbb0e557c64c Padmashree S S 2026-03-26  34  examples:
39cbb0e557c64c Padmashree S S 2026-03-26  35    - |
39cbb0e557c64c Padmashree S S 2026-03-26  36      i2c {
39cbb0e557c64c Padmashree S S 2026-03-26  37        #address-cells = <1>;
39cbb0e557c64c Padmashree S S 2026-03-26  38        #size-cells = <0>;
39cbb0e557c64c Padmashree S S 2026-03-26  39  
39cbb0e557c64c Padmashree S S 2026-03-26  40        pcm3060: audio-codec@46 {
39cbb0e557c64c Padmashree S S 2026-03-26  41          compatible = "ti,pcm3060";
39cbb0e557c64c Padmashree S S 2026-03-26  42          reg = <0x46>;
39cbb0e557c64c Padmashree S S 2026-03-26  43          ti,out-single-ended;
39cbb0e557c64c Padmashree S S 2026-03-26  44        };
39cbb0e557c64c Padmashree S S 2026-03-26 @45      };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

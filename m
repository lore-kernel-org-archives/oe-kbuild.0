Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A91638DCD
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720451430; cv=none; b=gYhWo0Ib2sVzy9kdvxJ/rEsjjG5I0Yzj1oc0owP6eKpPyx1GqTofpVZfSLH8ooav5e5N/lAFC0/qdimzDKMN4Zd94eKTsX2m8QcT786udI34v1IR6Mdjw41pM6lFNQp1bjaZQ1gq5uTiNfPaAffGmmFKzQdgKjY4FS0FC86pGsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720451430; c=relaxed/simple;
	bh=QT4d8rSQePbbgztH4L0yt1UkHvwjKj104toAhVlMlX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qqRuYe9axa8tZPladTH62TQoV1d+dNovA6vhQHPQmodhBpODRZD59DcKOee8ohZvufEtfWQX7GV+nedmkWIBAITGgh5OtgnE93H8qrpN+rkABn4hp7KGihz3+Bzefnp3t/OlstVOxSF868BBXMwsw87ub0Y3KZXyrmPn3Co30IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I51mqxcu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I51mqxcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720451428; x=1751987428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QT4d8rSQePbbgztH4L0yt1UkHvwjKj104toAhVlMlX4=;
  b=I51mqxcuA3Ph2LK2in/2vdfTr5tmYRkv/KVCGldEgXk4wahkdWg4lN8j
   UCXeGu+kQRolBnH7n2xyXuV8zA95u+ZyiKHuTyTZepLAJadpn/+OevOIl
   RmkQ8Ed4WqKufkG2op0et+gdan+Y6MlsIvqfI1DEsYHCGHrqJqPRqVpEm
   YJ5qUckNRigR/f5VLsQCtMSfpb+fKT7mkCGezppkOhbWlEkLo4tky7pAK
   5E5cLcgRj7A7mVMtZqRoR+Z6rsRcYoZxwPFeV871VQ+Yv8A8BsjkVgSu5
   CezeiAsnf492cRN0dEgjJS33HNCD37N6j7XZ3cj5p3tlSFB3cJXrl9l1R
   Q==;
X-CSE-ConnectionGUID: idqysnV/SnyQSLaMQvX2vQ==
X-CSE-MsgGUID: agChLU/qQLWt7YRY/pkXlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17366563"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="17366563"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 08:10:27 -0700
X-CSE-ConnectionGUID: L/N71PZhQxGJk8TcvgAutQ==
X-CSE-MsgGUID: IQD427ioQw+TrlGHq8DIiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="47456504"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Jul 2024 08:10:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQq0W-000Vof-04;
	Mon, 08 Jul 2024 15:10:24 +0000
Date: Mon, 8 Jul 2024 23:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 09/12] arm64: dts: renesas: r8a77980: Add missing iommus
 properties
Message-ID: <202407082236.NMHpwUto-lkp@intel.com>
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
In-Reply-To: <3259f4906e20ea626dcd45b7dd310155570b399c.1720430758.git.geert+renesas@glider.be>
References: <3259f4906e20ea626dcd45b7dd310155570b399c.1720430758.git.geert+renesas@glider.be>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Manish Chopra <manishc@marvell.com>
TO: Rahul Verma <rahulv@marvell.com>
TO: GR-Linux-NIC-Dev@marvell.com
TO: "David S . Miller" <davem@davemloft.net>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: netdev@vger.kernel.org
CC: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Geert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on linus/master v6.10-rc7 next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/arm64-dts-renesas-r8a774a1-Add-missing-iommus-properties/20240708-182610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/3259f4906e20ea626dcd45b7dd310155570b399c.1720430758.git.geert%2Brenesas%40glider.be
patch subject: [PATCH 09/12] arm64: dts: renesas: r8a77980: Add missing iommus properties
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240708/202407082236.NMHpwUto-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407082236.NMHpwUto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407082236.NMHpwUto-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: ethernet@e7400000: 'iommus' does not match any of the regexes: '@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/renesas,ether.yaml#
--
   arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dtb: hdmi@39: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
>> arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dtb: ethernet@e7400000: 'iommus' does not match any of the regexes: '@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/renesas,ether.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dtb: ethernet@e7400000: 'iommus' does not match any of the regexes: '@[0-9a-f]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/renesas,ether.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

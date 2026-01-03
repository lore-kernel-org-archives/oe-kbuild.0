Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC4E255F28
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jan 2026 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767460403; cv=none; b=AWIlIrYYfFIFsW34bKxixVvIH94/BrN2kCaspSOTlIoxKH++t88zuCpP7L9WgoYxqs/WtXqUkcOLNhM7hJJLnkaPloydXs8HkJJlw7tYeEQhZlGepmyUijroNyXI6O3ziOtgQH0ZGQtBVdl60L3vTskjj7RvaemRpbFem1H/8X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767460403; c=relaxed/simple;
	bh=2lKroIbyYGAkrhnDi+j5DLDZdEnQDFO34aNBttFeypA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WuMHllxeJ7aPVQ+MSGF5md7NlPkH4cG+bQbdH0rxZEjflDvlWf5BZ0hJh3pIsrm2w8rxA1g0WwvhUk26QD6mikVp73m6ayxX0dN8Q7Obc1i8cCYSJVSYv4/b3AeUVPWh50Iv3Y4H42qibXJov+THAP0sELiPURK8xD/OmS76Tzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUPfdEzu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUPfdEzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767460401; x=1798996401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2lKroIbyYGAkrhnDi+j5DLDZdEnQDFO34aNBttFeypA=;
  b=YUPfdEzuQSf+jKAWsJvPOtSsjc+fQ/a/+UCtpSbbARziB1J5NiK52qNp
   ZOGczQrpOmwpLytuCvS307fjjUWL7i5EGxN3DEmS11e3KyEkeJ0G2Icfk
   vPrdAQr7IUv1mS5qSJUZjWIw0GWvIGDIz9EOqvICcpASdZLVlxjPjcuv9
   IrNB+1FI7rcdeEKPS40stw+irHZKsUdy6BOw7ajNr1BxKCqIpVvhVrp19
   JTpYf2RnF5fDKUyd/iFB5SLpiBIJ4CynUQqC2QV6b9WO9ErpwNKKnSgbI
   WVGxp21D0REaDPVP4EcnQdLX3jjxALZKAr2/EzEioD6TG9B7rTbU/aNnE
   Q==;
X-CSE-ConnectionGUID: PTp7gfCpT2i9OJR/cPHTPQ==
X-CSE-MsgGUID: qOWOKMfZRh2k1F+W1o90OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68807357"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68807357"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 09:13:20 -0800
X-CSE-ConnectionGUID: GJ67zd/pRSiqY7mx7JK6BA==
X-CSE-MsgGUID: ZpZ4q5UKS/+kgvpG/xpZ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="225527088"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jan 2026 09:13:19 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc5Bl-000000000jZ-2gHC;
	Sat, 03 Jan 2026 17:13:17 +0000
Date: Sat, 3 Jan 2026 18:12:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] dt-bindings: crypto: eip93: add support for
 Mediatek MT7621 SoC
Message-ID: <202601031832.ZAAMObxI-lkp@intel.com>
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
In-Reply-To: <20260102155341.3682013-2-olek2@wp.pl>
References: <20260102155341.3682013-2-olek2@wp.pl>
TO: Aleksander Jan Bajkowski <olek2@wp.pl>
TO: benjamin.larsson@genexis.eu
TO: chester.a.unal@arinc9.com
TO: davem@davemloft.net
TO: angelogioacchino.delregno@collabora.com
TO: ansuelsmth@gmail.com
TO: conor+dt@kernel.org
TO: herbert@gondor.apana.org.au
TO: krzk+dt@kernel.org
TO: matthias.bgg@gmail.com
TO: robh@kernel.org
TO: sergio.paracuellos@gmail.com
TO: tsbogend@alpha.franken.de
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-crypto@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-mediatek@lists.infradead.org
TO: linux-mips@vger.kernel.org
CC: Aleksander Jan Bajkowski <olek2@wp.pl>

Hi Aleksander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master robh/for-next linus/master v6.16-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksander-Jan-Bajkowski/dt-bindings-crypto-eip93-add-support-for-Mediatek-MT7621-SoC/20260102-235536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20260102155341.3682013-2-olek2%40wp.pl
patch subject: [PATCH v3 2/3] dt-bindings: crypto: eip93: add support for Mediatek MT7621 SoC
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: openrisc-randconfig-2052-20260103 (https://download.01.org/0day-ci/archive/20260103/202601031832.ZAAMObxI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601031832.ZAAMObxI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601031832.ZAAMObxI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml:35:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

vim +35 Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml

bbbbd1d149e8b2 Christian Marangi        2025-01-14   8  
bbbbd1d149e8b2 Christian Marangi        2025-01-14   9  maintainers:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  10    - Christian Marangi <ansuelsmth@gmail.com>
bbbbd1d149e8b2 Christian Marangi        2025-01-14  11  
bbbbd1d149e8b2 Christian Marangi        2025-01-14  12  description: |
bbbbd1d149e8b2 Christian Marangi        2025-01-14  13    The Inside Secure SafeXcel EIP-93 is a cryptographic engine IP block
bbbbd1d149e8b2 Christian Marangi        2025-01-14  14    integrated in varios devices with very different and generic name from
bbbbd1d149e8b2 Christian Marangi        2025-01-14  15    PKTE to simply vendor+EIP93. The real IP under the hood is actually
bbbbd1d149e8b2 Christian Marangi        2025-01-14  16    developed by Inside Secure and given to license to vendors.
bbbbd1d149e8b2 Christian Marangi        2025-01-14  17  
bbbbd1d149e8b2 Christian Marangi        2025-01-14  18    The IP block is sold with different model based on what feature are
bbbbd1d149e8b2 Christian Marangi        2025-01-14  19    needed and are identified with the final letter. Each letter correspond
bbbbd1d149e8b2 Christian Marangi        2025-01-14  20    to a specific set of feature and multiple letter reflect the sum of the
bbbbd1d149e8b2 Christian Marangi        2025-01-14  21    feature set.
bbbbd1d149e8b2 Christian Marangi        2025-01-14  22  
bbbbd1d149e8b2 Christian Marangi        2025-01-14  23    EIP-93 models:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  24      - EIP-93i: (basic) DES/Triple DES, AES, PRNG, IPsec ESP, SRTP, SHA1
bbbbd1d149e8b2 Christian Marangi        2025-01-14  25      - EIP-93ie: i + SHA224/256, AES-192/256
bbbbd1d149e8b2 Christian Marangi        2025-01-14  26      - EIP-93is: i + SSL/DTLS/DTLS, MD5, ARC4
bbbbd1d149e8b2 Christian Marangi        2025-01-14  27      - EIP-93ies: i + e + s
bbbbd1d149e8b2 Christian Marangi        2025-01-14  28      - EIP-93iw: i + AES-XCB-MAC, AES-CCM
bbbbd1d149e8b2 Christian Marangi        2025-01-14  29  
bbbbd1d149e8b2 Christian Marangi        2025-01-14  30  properties:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  31    compatible:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  32      oneOf:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  33        - items:
ea68b16ba9ed87 Aleksander Jan Bajkowski 2026-01-02  34            - enum:
ea68b16ba9ed87 Aleksander Jan Bajkowski 2026-01-02 @35              - airoha,en7581-eip93
ea68b16ba9ed87 Aleksander Jan Bajkowski 2026-01-02  36              - mediatek,mt7621-eip93
bbbbd1d149e8b2 Christian Marangi        2025-01-14  37            - const: inside-secure,safexcel-eip93ies
bbbbd1d149e8b2 Christian Marangi        2025-01-14  38        - items:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  39            - not: {}
bbbbd1d149e8b2 Christian Marangi        2025-01-14  40              description: Need a SoC specific compatible
bbbbd1d149e8b2 Christian Marangi        2025-01-14  41            - enum:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  42                - inside-secure,safexcel-eip93i
bbbbd1d149e8b2 Christian Marangi        2025-01-14  43                - inside-secure,safexcel-eip93ie
bbbbd1d149e8b2 Christian Marangi        2025-01-14  44                - inside-secure,safexcel-eip93is
bbbbd1d149e8b2 Christian Marangi        2025-01-14  45                - inside-secure,safexcel-eip93iw
bbbbd1d149e8b2 Christian Marangi        2025-01-14  46  
bbbbd1d149e8b2 Christian Marangi        2025-01-14  47    reg:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  48      maxItems: 1
bbbbd1d149e8b2 Christian Marangi        2025-01-14  49  
bbbbd1d149e8b2 Christian Marangi        2025-01-14  50    interrupts:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  51      maxItems: 1
bbbbd1d149e8b2 Christian Marangi        2025-01-14  52  
b36d02ca8cba9c Aleksander Jan Bajkowski 2026-01-02  53    clocks:
b36d02ca8cba9c Aleksander Jan Bajkowski 2026-01-02  54      maxItems: 1
b36d02ca8cba9c Aleksander Jan Bajkowski 2026-01-02  55  
b36d02ca8cba9c Aleksander Jan Bajkowski 2026-01-02  56    resets:
b36d02ca8cba9c Aleksander Jan Bajkowski 2026-01-02  57      maxItems: 1
b36d02ca8cba9c Aleksander Jan Bajkowski 2026-01-02  58  
bbbbd1d149e8b2 Christian Marangi        2025-01-14  59  required:
bbbbd1d149e8b2 Christian Marangi        2025-01-14  60    - compatible
bbbbd1d149e8b2 Christian Marangi        2025-01-14  61    - reg
bbbbd1d149e8b2 Christian Marangi        2025-01-14  62    - interrupts
b36d02ca8cba9c Aleksander Jan Bajkowski 2026-01-02  63    - clocks
b36d02ca8cba9c Aleksander Jan Bajkowski 2026-01-02  64    - resets
bbbbd1d149e8b2 Christian Marangi        2025-01-14  65  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

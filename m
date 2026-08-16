Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40EB3C4167
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786845496; cv=none; b=kZUcIQ+O6R4mUVxwHZ2r3a9kgA+5dD7res+6FxgdG1eBNlMz9p7y0iAeDUtDnZckvdiztd4ZY3F3Yr8HP327VFQTS6pbA+1BlXG9D2emxzrkA0BrtP60BJ6YHkoJ2ZOTA/8YsKLBCIblqptbwZVhhaMeMCtHZ1ISOWYTlWZTY30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786845496; c=relaxed/simple;
	bh=DrZ3YEk0W9INoUyP/nNs7g34zvG+HBJW8C1BC63ax5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UYMTMnQJ93qAZbiRFx1Fa7LK1MhIHrQMyTg24YEjjPj8+h3TjzNaFJ6IvnX0FPhxHmATWvz32WhrPcrfDjmcNRCx73BeyVeIGFOVPtpy/o5JQutiosugUTjKw9Q3j/Kn6GinS/k0IwMCmm12N/mrj714MJvkcb734Fy8tUu0MMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVsYwXHY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVsYwXHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786845494; x=1818381494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DrZ3YEk0W9INoUyP/nNs7g34zvG+HBJW8C1BC63ax5U=;
  b=lVsYwXHY3YtMEmqbTP92Mtd06CQuABPM17KP6ZfpURzg4Ht3VSgRCU6v
   hVX8jHwTspSmV7k3u3L2le5My6KwoQLJY9pj38YSwb+6pSnWzQo8fxoOW
   KHVml4soMYehc814E5TN+ZlPvMEQ1ATNJBZ5rhdxqGNOFhvLxMUkUkD8I
   QmQEx4MMgSb3XUDegI2wXgc1pIe2ZSZNKWtcO61LO7OqvLyNqbsC3/WQR
   gks5MKxkhxp4McI5QxQJ52mWg/Kzbgql0XG4Sh2Rs3lpLeaMZQFsLskSC
   +oIt4bjXzEEVGIjd8veMAtRVNJop7a7ymijfHCRBOnJb8x794zOCjuJ5c
   Q==;
X-CSE-ConnectionGUID: uVSVvVg5SWSBBMGMTWcYaA==
X-CSE-MsgGUID: 3nrdgr9OSCePUlDaB5TeiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="91182277"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="91182277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 18:58:13 -0700
X-CSE-ConnectionGUID: JwOo6/kIT5ezdSSD4ZHoeg==
X-CSE-MsgGUID: TYXOmoUvQXah+9w6CUCjMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="260797595"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 15 Aug 2026 18:58:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvQ8X-000000006Wr-3BCI;
	Sun, 16 Aug 2026 01:58:09 +0000
Date: Sun, 16 Aug 2026 03:57:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 =?us-ascii?Q?Documentation/devicetree/bindings/sound/openpandora,omap3?=
 =?us-ascii?Q?pandora-sound.yaml:10:2:?= [warning] wrong indentation:
 expected 2 but found 1 (indentation)
Message-ID: <202608160304.3FfmHOZb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "H. Nikolaus Schaller" <hns@goldelico.com>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/H-Nikolaus-Schaller/dt-bindings-twl-regulator-Add-bindings-for-exposing-ti-twl4030-regen/20260812-201259
head:   4f5559ad82b8debd2be982b089e18240288940e9
commit: 44971f13cae7486e3643ba685ac319be100b42ae ASoC: dt-bindings: add OpenPandora Sound Card
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arc-randconfig-2051-20260815 (https://download.01.org/0day-ci/archive/20260816/202608160304.3FfmHOZb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160304.3FfmHOZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160304.3FfmHOZb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:10:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:13:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:18:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:56:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml:62:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

vim +10 Documentation/devicetree/bindings/sound/openpandora,omap3pandora-sound.yaml

44971f13cae748 H. Nikolaus Schaller 2026-07-11   8  
44971f13cae748 H. Nikolaus Schaller 2026-07-11   9  maintainers:
44971f13cae748 H. Nikolaus Schaller 2026-07-11 @10   - H. Nikolaus Schaller <hns@goldelico.com>
44971f13cae748 H. Nikolaus Schaller 2026-07-11  11  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  12  description:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  13   The OpenPandora audio subsystem describes the routing links between the
44971f13cae748 H. Nikolaus Schaller 2026-07-11  14   OMAP3 McBSP interface, the external PCM1773 DAC, and the TWL4030 audio codec,
44971f13cae748 H. Nikolaus Schaller 2026-07-11  15   alongside amplifiers and power supplies.
44971f13cae748 H. Nikolaus Schaller 2026-07-11  16  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  17  properties:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  18   compatible:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  19     const: openpandora,omap3pandora-sound
44971f13cae748 H. Nikolaus Schaller 2026-07-11  20  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  21   status: true
44971f13cae748 H. Nikolaus Schaller 2026-07-11  22  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  23   label:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  24     $ref: /schemas/types.yaml#/definitions/string
44971f13cae748 H. Nikolaus Schaller 2026-07-11  25     description: User-visible name for this sound card.
44971f13cae748 H. Nikolaus Schaller 2026-07-11  26  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  27   amp-gpios:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  28     maxItems: 1
44971f13cae748 H. Nikolaus Schaller 2026-07-11  29     description: GPIO pin controlling the amplifier power state.
44971f13cae748 H. Nikolaus Schaller 2026-07-11  30  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  31   amp-supply:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  32     description: Regulator supplying power to the amplifier.
44971f13cae748 H. Nikolaus Schaller 2026-07-11  33  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  34   sound-dai:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  35     $ref: /schemas/types.yaml#/definitions/phandle-array
44971f13cae748 H. Nikolaus Schaller 2026-07-11  36     minItems: 2
44971f13cae748 H. Nikolaus Schaller 2026-07-11  37     maxItems: 2
44971f13cae748 H. Nikolaus Schaller 2026-07-11  38     description:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  39       Phandles to the audio CPU DAI (OMAP3 McBSP) and the codec DAI.
44971f13cae748 H. Nikolaus Schaller 2026-07-11  40  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  41   routing:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  42     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
44971f13cae748 H. Nikolaus Schaller 2026-07-11  43     description:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  44       A list of the connections between audio components.
44971f13cae748 H. Nikolaus Schaller 2026-07-11  45       Each entry is a pair of strings, the first being the connection's sink,
44971f13cae748 H. Nikolaus Schaller 2026-07-11  46       the second being the connection's source.
44971f13cae748 H. Nikolaus Schaller 2026-07-11  47  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  48   widgets:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  49     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
44971f13cae748 H. Nikolaus Schaller 2026-07-11  50     description:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  51       User-specified audio sound widgets.
44971f13cae748 H. Nikolaus Schaller 2026-07-11  52       Each entry is a pair of strings, the first being the widget type
44971f13cae748 H. Nikolaus Schaller 2026-07-11  53       (e.g., "Speaker", "Headphone", "Microphone", "Line") and the second being its name.
44971f13cae748 H. Nikolaus Schaller 2026-07-11  54  
44971f13cae748 H. Nikolaus Schaller 2026-07-11  55  required:
44971f13cae748 H. Nikolaus Schaller 2026-07-11  56   - compatible
44971f13cae748 H. Nikolaus Schaller 2026-07-11  57   - sound-dai
44971f13cae748 H. Nikolaus Schaller 2026-07-11  58  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

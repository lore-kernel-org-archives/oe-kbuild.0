Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBD25474F
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 01:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771033617; cv=none; b=tKrYxpZZ+ClwxXDxwcuGFX6WdFLbTjdRKg/MdEx+th2y2rhtx/Kggw7sNo6daF7ZFiOju6MEmEcowx+Reqq/iosWMARwIZk9ENk+4BEgxD20KaoH8uVK+0Zkw1dSxDgj5NfCNlG2/icN61VBds2sX+6Bq0NxhG7jcBmg5bU3Kc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771033617; c=relaxed/simple;
	bh=7NT4cB4gwXES3KxAKXocnAdLdsWDjFkMIrWH9PbnE0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PJptHymHjul1eUlRwDUTwI3yiDdghOd3kN/xyL4k5438JLFm+4M1RDJuagY0Fod+/iDN72wJXO7ohRe1+i4iSGNP52ldzIb0vJeL51iiIngyodkf0z5IXtd1uXQ80+L6ElryeiaOCjwPMRl6e5lDUXFzLtqIOoCJ1urGx77e8so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkxtrgQX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkxtrgQX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771033615; x=1802569615;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7NT4cB4gwXES3KxAKXocnAdLdsWDjFkMIrWH9PbnE0k=;
  b=gkxtrgQXe3YWK0Qj1x1fjhkO4avxokkU6RiWvvIJ269wxGPH0wf7o9Re
   +Ti0NQRRLjWE/qgU+ZmFYCRr7SsEi8c8Pak/UVoOOs3Ty3VyZMdSqILYy
   2xDhkcn6smr+uBSo13Lv/5xgu0NgS+n41idSSU5/i8Qg5tdlZ0pLz4/Uk
   2k3Yx2Mu3z3K2DfWM8YADPCz/N4SR7/KfQee4swju/Qq0n8+6abAOevJm
   +mJwrib4QyvrLJXU+H0e7jtBFk4N5YIbfuR7ips9S/3oJua46ZBE7/Xl7
   7y1mFnc+1OvEcH8W1ylF6rW9Qq0oUKTCoZttinsBRiTEevLGai2F63IHv
   Q==;
X-CSE-ConnectionGUID: mWmKhJGYRjOCKjfpJBFPAw==
X-CSE-MsgGUID: i/tk8ZQuQ8SFZ7j86CWDYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72209843"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72209843"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 17:46:54 -0800
X-CSE-ConnectionGUID: hOp6IswTQwidj72v5BY0gA==
X-CSE-MsgGUID: kIwMyRrXQm6ItqAAAXT1SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="211947709"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 17:46:53 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr4kF-000000001jV-1KaZ;
	Sat, 14 Feb 2026 01:46:51 +0000
Date: Sat, 14 Feb 2026 02:46:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/5] dt-bindings: iio: adc: ad4080: add AD4880 support
Message-ID: <202602140208.PyZVLhoN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260213144742.16394-5-antoniu.miclaus@analog.com>
References: <20260213144742.16394-5-antoniu.miclaus@analog.com>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Michael Hennerich <Michael.Hennerich@analog.com>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Olivier Moysan <olivier.moysan@foss.st.com>
TO: Mark Brown <broonie@kernel.org>
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-spi@vger.kernel.org

Hi Antoniu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on broonie-spi/for-next linus/master v6.19 next-20260213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/spi-allow-ancillary-devices-to-share-parent-s-chip-selects/20260213-225621
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260213144742.16394-5-antoniu.miclaus%40analog.com
patch subject: [PATCH v3 4/5] dt-bindings: iio: adc: ad4080: add AD4880 support
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arc-randconfig-2051-20260213 (https://download.01.org/0day-ci/archive/20260214/202602140208.PyZVLhoN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140208.PyZVLhoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602140208.PyZVLhoN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml: maintainers:0: 'Christopher Ruehl chris.ruehl@gtsys.com.hk' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
>> Documentation/devicetree/bindings/iio/adc/adi,ad4080.yaml: properties:io-backends: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'Backend for channel A (primary)'}, {'description': 'Backend for channel B (secondary)'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
   Documentation/devicetree/bindings/input/syna,rmi4.yaml: maintainers:1: 'Matthias Schiffer <matthias.schiffer@ew.tq-group.com' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
   Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml: maintainers:0: 'Frank Li <Frank Li@nxp.com>' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
   Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml: maintainers:2: 'Seung-Woo Kim <sw0312.kim@samsung.com' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

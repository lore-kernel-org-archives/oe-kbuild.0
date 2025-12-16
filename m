Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70E423EA8B
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 02:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852871; cv=none; b=WKEa9vg7sEGHQTJ2O2BEyZoNsvljccB1OIf0/ndyTnWZLvqAKGnjLZ0eutz2jN4MVHJrLpCE6XCfJcRcedxi7DLLYgDNxuzTrlB3x3nXn4jkg/k1GAoKIGhwtkgiVeQasrCQ3btGkaJtaYCNuaeDCOQmjw8jEMkSZaDWuXWJZtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852871; c=relaxed/simple;
	bh=Tr/jjnLhvbqW0nB3C9e7tSWOIm9juqEQ4Xp+fEOHbEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZoLdQT2aPKoOR0kNYaSJAyl0n0pMdV//vwQnwfNt2k+btnsMR6mdDTZT5/fj+zlNcV2/5lg3yhbidjCubecqF85woAK2UTcz4Ltxdz4vKt6nlhbONquGm+TPWbxsfOPhc6KRfM8Y1wwQnW23J8qh9TvGJv1ixeQZSJKo+rkq06Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQ1n+zgY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQ1n+zgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765852870; x=1797388870;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tr/jjnLhvbqW0nB3C9e7tSWOIm9juqEQ4Xp+fEOHbEo=;
  b=dQ1n+zgYm19g29xGpT+d99SQ5TWLK85GbldkM0cXWs4HXEG0pZh9Re60
   mWez06enARG6NJS6Rnx7vi+DZyRpnhFFnhNOofxG4Z3NBemLl8JvIos6h
   sditGGPoU4Uw4uby3eWkAPEQUYj1qczkymw5GZRWWszwK4kAIX4j5JX5t
   4CLndqy7ZN11m5QDtK0+uHJkBebKWvFncGR/CVl8Smh5ITc/81Kqo8lwR
   96CLVWfO9qyJREc2IvJDModYj9/gaFVL3JU6BDKGCOrvyxMKMx5U/Njir
   is3iByQRSw/BJhytwGSnyQFo1dOMCDSgvh6EgmtLAlLkUAZNBHnFVLyQi
   g==;
X-CSE-ConnectionGUID: l96fO6YlTKqfYNV0pVpJRQ==
X-CSE-MsgGUID: CezoA9WjTgCb4MfjW6OsDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85358336"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="85358336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 18:41:09 -0800
X-CSE-ConnectionGUID: XxC1VOJNQHO4mWsbhzotTg==
X-CSE-MsgGUID: ANIOXRVLR9SGBdd9K8YFWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="198146792"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Dec 2025 18:41:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVKzq-000000002uO-06Ci;
	Tue, 16 Dec 2025 02:41:06 +0000
Date: Tue, 16 Dec 2025 03:40:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <202512160313.xQWscEOe-lkp@intel.com>
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
In-Reply-To: <20251209154706.529784-4-fabiobaltieri@chromium.org>
References: <20251209154706.529784-4-fabiobaltieri@chromium.org>
TO: Fabio Baltieri <fabiobaltieri@chromium.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Benson Leung <bleung@chromium.org>
TO: Guenter Roeck <groeck@chromium.org>
CC: Fabio Baltieri <fabiobaltieri@chromium.org>
CC: "Tzung-Bi Shih" <tzungbi@kernel.org>
CC: Simon Glass <sjg@chromium.org>
CC: linux-input@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: chrome-platform@lists.linux.dev
CC: linux-kernel@vger.kernel.orga

Hi Fabio,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus robh/for-next linus/master v6.16-rc1]
[cannot apply to next-20251215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-Baltieri/Input-cros_ec_keyb-clarify-key-event-error-message/20251209-235043
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20251209154706.529784-4-fabiobaltieri%40chromium.org
patch subject: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and f-keymap props
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251216/202512160313.xQWscEOe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160313.xQWscEOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512160313.xQWscEOe-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: Documentation/devicetree/bindings/input/google,cros-ec-keyb.example.dts:83.9-89 Properties must precede subnodes
>> FATAL ERROR: Unable to parse input tree

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml:83:11: [warning] wrong indentation: expected 12 but found 10 (indentation)
   Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml:85:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

vim +83 Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml

50d68feee01039 Ricardo Cañuelo 2020-10-21   9  
50d68feee01039 Ricardo Cañuelo 2020-10-21  10  maintainers:
50d68feee01039 Ricardo Cañuelo 2020-10-21  11    - Simon Glass <sjg@chromium.org>
50d68feee01039 Ricardo Cañuelo 2020-10-21  12    - Benson Leung <bleung@chromium.org>
50d68feee01039 Ricardo Cañuelo 2020-10-21  13  
50d68feee01039 Ricardo Cañuelo 2020-10-21  14  description: |
50d68feee01039 Ricardo Cañuelo 2020-10-21  15    Google's ChromeOS EC Keyboard is a simple matrix keyboard
50d68feee01039 Ricardo Cañuelo 2020-10-21  16    implemented on a separate EC (Embedded Controller) device. It provides
50d68feee01039 Ricardo Cañuelo 2020-10-21  17    a message for reading key scans from the EC. These are then converted
52dc6d3bea3b85 Stephen Boyd    2022-05-16  18    into keycodes for processing by the kernel. This device also supports
52dc6d3bea3b85 Stephen Boyd    2022-05-16  19    switches/buttons like power and volume buttons.
50d68feee01039 Ricardo Cañuelo 2020-10-21  20  
50d68feee01039 Ricardo Cañuelo 2020-10-21  21  properties:
50d68feee01039 Ricardo Cañuelo 2020-10-21  22    compatible:
d95bca4fbde0a2 Stephen Boyd    2022-05-18  23      oneOf:
52dc6d3bea3b85 Stephen Boyd    2022-05-16  24        - description: ChromeOS EC with only buttons/switches
d95bca4fbde0a2 Stephen Boyd    2022-05-18  25          const: google,cros-ec-keyb-switches
52dc6d3bea3b85 Stephen Boyd    2022-05-16  26        - description: ChromeOS EC with keyboard and possibly buttons/switches
50d68feee01039 Ricardo Cañuelo 2020-10-21  27          const: google,cros-ec-keyb
50d68feee01039 Ricardo Cañuelo 2020-10-21  28  
50d68feee01039 Ricardo Cañuelo 2020-10-21  29    google,needs-ghost-filter:
50d68feee01039 Ricardo Cañuelo 2020-10-21  30      description:
50d68feee01039 Ricardo Cañuelo 2020-10-21  31        Enable a ghost filter for the matrix keyboard. This is recommended
50d68feee01039 Ricardo Cañuelo 2020-10-21  32        if the EC does not have its own logic or hardware for this.
50d68feee01039 Ricardo Cañuelo 2020-10-21  33      type: boolean
50d68feee01039 Ricardo Cañuelo 2020-10-21  34  
311a27da627139 Philip Chen     2021-02-22  35    function-row-physmap:
4e71ed985389ce Rob Herring     2022-05-19  36      $ref: /schemas/types.yaml#/definitions/uint32-array
311a27da627139 Philip Chen     2021-02-22  37      minItems: 1
311a27da627139 Philip Chen     2021-02-22  38      maxItems: 15
311a27da627139 Philip Chen     2021-02-22  39      description: |
311a27da627139 Philip Chen     2021-02-22  40        An ordered u32 array describing the rows/columns (in the scan matrix)
311a27da627139 Philip Chen     2021-02-22  41        of top row keys from physical left (KEY_F1) to right. Each entry
311a27da627139 Philip Chen     2021-02-22  42        encodes the row/column as:
311a27da627139 Philip Chen     2021-02-22  43        (((row) & 0xFF) << 24) | (((column) & 0xFF) << 16)
311a27da627139 Philip Chen     2021-02-22  44        where the lower 16 bits are reserved. This property is specified only
311a27da627139 Philip Chen     2021-02-22  45        when the keyboard has a custom design for the top row keys.
311a27da627139 Philip Chen     2021-02-22  46  
70fff14a38ad73 Fabio Baltieri  2025-12-09  47    fn-key:
70fff14a38ad73 Fabio Baltieri  2025-12-09  48      $ref: /schemas/types.yaml#/definitions/uint32
70fff14a38ad73 Fabio Baltieri  2025-12-09  49      description: |
70fff14a38ad73 Fabio Baltieri  2025-12-09  50        An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
70fff14a38ad73 Fabio Baltieri  2025-12-09  51        col, code) macro, code is ignored.
70fff14a38ad73 Fabio Baltieri  2025-12-09  52  
70fff14a38ad73 Fabio Baltieri  2025-12-09  53    fn-keymap:
70fff14a38ad73 Fabio Baltieri  2025-12-09  54      $ref: /schemas/types.yaml#/definitions/uint32-array
70fff14a38ad73 Fabio Baltieri  2025-12-09  55      minItems: 1
70fff14a38ad73 Fabio Baltieri  2025-12-09  56      maxItems: 32
70fff14a38ad73 Fabio Baltieri  2025-12-09  57      description: |
70fff14a38ad73 Fabio Baltieri  2025-12-09  58        An array of u32 mapping the row, column and codes for the function keys,
70fff14a38ad73 Fabio Baltieri  2025-12-09  59        use the MATRIX_KEY macro to define the elements.
70fff14a38ad73 Fabio Baltieri  2025-12-09  60  
52dc6d3bea3b85 Stephen Boyd    2022-05-16  61  dependencies:
c6f3b684c2c4e8 Linus Walleij   2023-02-21  62    function-row-physmap: [ 'linux,keymap' ]
52dc6d3bea3b85 Stephen Boyd    2022-05-16  63    google,needs-ghost-filter: [ 'linux,keymap' ]
52dc6d3bea3b85 Stephen Boyd    2022-05-16  64  
50d68feee01039 Ricardo Cañuelo 2020-10-21  65  required:
50d68feee01039 Ricardo Cañuelo 2020-10-21  66    - compatible
50d68feee01039 Ricardo Cañuelo 2020-10-21  67  
70fff14a38ad73 Fabio Baltieri  2025-12-09  68  allOf:
70fff14a38ad73 Fabio Baltieri  2025-12-09  69    - if:
52dc6d3bea3b85 Stephen Boyd    2022-05-16  70        properties:
52dc6d3bea3b85 Stephen Boyd    2022-05-16  71          compatible:
52dc6d3bea3b85 Stephen Boyd    2022-05-16  72            contains:
52dc6d3bea3b85 Stephen Boyd    2022-05-16  73              const: google,cros-ec-keyb
52dc6d3bea3b85 Stephen Boyd    2022-05-16  74      then:
77987b872fcfea Rob Herring     2023-03-21  75        $ref: /schemas/input/matrix-keymap.yaml#
52dc6d3bea3b85 Stephen Boyd    2022-05-16  76        required:
52dc6d3bea3b85 Stephen Boyd    2022-05-16  77          - keypad,num-rows
52dc6d3bea3b85 Stephen Boyd    2022-05-16  78          - keypad,num-columns
52dc6d3bea3b85 Stephen Boyd    2022-05-16  79          - linux,keymap
70fff14a38ad73 Fabio Baltieri  2025-12-09  80    - if:
70fff14a38ad73 Fabio Baltieri  2025-12-09  81        anyOf:
70fff14a38ad73 Fabio Baltieri  2025-12-09  82          - required:
70fff14a38ad73 Fabio Baltieri  2025-12-09 @83            - fn-key
70fff14a38ad73 Fabio Baltieri  2025-12-09  84          - required:
70fff14a38ad73 Fabio Baltieri  2025-12-09  85            - fn-keymap
70fff14a38ad73 Fabio Baltieri  2025-12-09  86      then:
70fff14a38ad73 Fabio Baltieri  2025-12-09  87        required:
70fff14a38ad73 Fabio Baltieri  2025-12-09  88          - fn-key
70fff14a38ad73 Fabio Baltieri  2025-12-09  89          - fn-keymap
52dc6d3bea3b85 Stephen Boyd    2022-05-16  90  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

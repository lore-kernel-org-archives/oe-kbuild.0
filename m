Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC05029E0F7
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 17:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767201594; cv=none; b=QzF+f12KA6DNZ0RIMdtNuiX0sBemX3p50Y0tT2UmGhKUZg5ZFCpL+5LWDabaHbn1T9P5wssUp+Mn3DvepkyHNoKYAbYIa9kWc3hBhY58om/f/7rwP1223ZaSNvdXqrvCNpMPegKzoXPRfbGe5eTq/981LBm39axR/SLTU4lgJMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767201594; c=relaxed/simple;
	bh=WJTvBICIeg9NU5ikq7joGzBt+9BA0xt6ELm65qkNPM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cKPrYW0rShMzjA65PFAqlFZiOdvOx66YpZw1qFm8KcCosa802j7IUZ89Vwyf327q5241bHVg3Cg6m+DxCJv/6VndoNN/UocYAb27zC8ywZfcWk8YTJM36nbux2b8m6/gbNB31Kvv6jbdx2Rh9CjbDQxLHUWS6+evuDwI2maZJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfrjDe5B; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfrjDe5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767201592; x=1798737592;
  h=date:from:to:cc:subject:message-id;
  bh=WJTvBICIeg9NU5ikq7joGzBt+9BA0xt6ELm65qkNPM0=;
  b=IfrjDe5BqG/apS53TFSiP2mwJJbx568/eF5dpuhGI0MY8Xl5s6+9juDS
   AwcMXr7R7lnTD4EMuX/c1BL/tfKMwxkPB+cLX0OL8XRZayfMw0Wqm2sre
   ELDAs5wEwNahwBX++gS9/tDBdaK+EPAiE31+UQCmrCD7TJ6YjpzEm85yX
   lWB3VbnxgtXu0bmn/8ftj3mTH8BxMGmazasiTGXLSCyzhT31WMLl1RhNG
   /gAYlxPaN/g71nrGFYEwh9RnC0k3FmDH6vUhY78dvPJ+CT5RDANFeRymv
   65dM/3cwt0YlCj0LVebK7xABQ+2l+WqHVpOAMe3Q/LAhOgEvkJhFBYBr1
   A==;
X-CSE-ConnectionGUID: gQKbn0mBTl2dJ0VRKSc0UQ==
X-CSE-MsgGUID: tsD1tNy3RJufY9sPCynExg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94234901"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="94234901"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 09:19:51 -0800
X-CSE-ConnectionGUID: ozkJJsP6SUGGVQFS209mFA==
X-CSE-MsgGUID: L7dlSfqNR/i5m4rQ3AO/UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="201236395"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 31 Dec 2025 09:19:49 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vazrP-0000000004r-2w1P;
	Wed, 31 Dec 2025 17:19:47 +0000
Date: Wed, 31 Dec 2025 18:19:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 6/14]
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml:212:6: [warning]
 wrong indentation: expected 6 but found 5 (indentation)
Message-ID: <202512311812.OHJ6bED4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a8805fb8a49841ef67f240537e28ed40ce539661
commit: 1ed6a1e08e61d88da8aaee79dae0f5fdb1963218 [6/14] dt-bindings: pinctrl: pincfg-node: add restrictions on conflicting properties
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arc-randconfig-2051-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311812.OHJ6bED4-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311812.OHJ6bED4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512311812.OHJ6bED4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml:212:6: [warning] wrong indentation: expected 6 but found 5 (indentation)

vim +212 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

3af50e548019f6 Rob Herring    2019-11-07    8  
3af50e548019f6 Rob Herring    2019-11-07    9  maintainers:
3af50e548019f6 Rob Herring    2019-11-07   10    - Linus Walleij <linus.walleij@linaro.org>
3af50e548019f6 Rob Herring    2019-11-07   11  
3af50e548019f6 Rob Herring    2019-11-07   12  description:
3af50e548019f6 Rob Herring    2019-11-07   13    Many data items that are represented in a pin configuration node are common
3af50e548019f6 Rob Herring    2019-11-07   14    and generic. Pin control bindings should use the properties defined below
3af50e548019f6 Rob Herring    2019-11-07   15    where they are applicable; not all of these properties are relevant or useful
3af50e548019f6 Rob Herring    2019-11-07   16    for all hardware or binding structures. Each individual binding document
3af50e548019f6 Rob Herring    2019-11-07   17    should state which of these generic properties, if any, are used, and the
3af50e548019f6 Rob Herring    2019-11-07   18    structure of the DT nodes that contain these properties.
3af50e548019f6 Rob Herring    2019-11-07   19  
3af50e548019f6 Rob Herring    2019-11-07   20  properties:
3af50e548019f6 Rob Herring    2019-11-07   21    bias-disable:
3af50e548019f6 Rob Herring    2019-11-07   22      type: boolean
3af50e548019f6 Rob Herring    2019-11-07   23      description: disable any pin bias
3af50e548019f6 Rob Herring    2019-11-07   24  
3af50e548019f6 Rob Herring    2019-11-07   25    bias-high-impedance:
3af50e548019f6 Rob Herring    2019-11-07   26      type: boolean
3af50e548019f6 Rob Herring    2019-11-07   27      description: high impedance mode ("third-state", "floating")
3af50e548019f6 Rob Herring    2019-11-07   28  
3af50e548019f6 Rob Herring    2019-11-07   29    bias-bus-hold:
3af50e548019f6 Rob Herring    2019-11-07   30      type: boolean
3af50e548019f6 Rob Herring    2019-11-07   31      description: latch weakly
3af50e548019f6 Rob Herring    2019-11-07   32  
3af50e548019f6 Rob Herring    2019-11-07   33    bias-pull-up:
3af50e548019f6 Rob Herring    2019-11-07   34      oneOf:
3af50e548019f6 Rob Herring    2019-11-07   35        - type: boolean
3af50e548019f6 Rob Herring    2019-11-07   36        - $ref: /schemas/types.yaml#/definitions/uint32
3af50e548019f6 Rob Herring    2019-11-07   37      description: pull up the pin. Takes as optional argument on hardware
3af50e548019f6 Rob Herring    2019-11-07   38        supporting it the pull strength in Ohm.
3af50e548019f6 Rob Herring    2019-11-07   39  
3af50e548019f6 Rob Herring    2019-11-07   40    bias-pull-down:
3af50e548019f6 Rob Herring    2019-11-07   41      oneOf:
3af50e548019f6 Rob Herring    2019-11-07   42        - type: boolean
3af50e548019f6 Rob Herring    2019-11-07   43        - $ref: /schemas/types.yaml#/definitions/uint32
3af50e548019f6 Rob Herring    2019-11-07   44      description: pull down the pin. Takes as optional argument on hardware
3af50e548019f6 Rob Herring    2019-11-07   45        supporting it the pull strength in Ohm.
3af50e548019f6 Rob Herring    2019-11-07   46  
3af50e548019f6 Rob Herring    2019-11-07   47    bias-pull-pin-default:
3af50e548019f6 Rob Herring    2019-11-07   48      oneOf:
3af50e548019f6 Rob Herring    2019-11-07   49        - type: boolean
3af50e548019f6 Rob Herring    2019-11-07   50        - $ref: /schemas/types.yaml#/definitions/uint32
3af50e548019f6 Rob Herring    2019-11-07   51      description: use pin-default pull state. Takes as optional argument on
3af50e548019f6 Rob Herring    2019-11-07   52        hardware supporting it the pull strength in Ohm.
3af50e548019f6 Rob Herring    2019-11-07   53  
3af50e548019f6 Rob Herring    2019-11-07   54    drive-push-pull:
b2b701b31e1c58 Rob Herring    2022-04-29   55      oneOf:
b2b701b31e1c58 Rob Herring    2022-04-29   56        - type: boolean
b2b701b31e1c58 Rob Herring    2022-04-29   57        - $ref: /schemas/types.yaml#/definitions/uint32
b2b701b31e1c58 Rob Herring    2022-04-29   58          enum: [ 0, 1 ]
b2b701b31e1c58 Rob Herring    2022-04-29   59          deprecated: true
3af50e548019f6 Rob Herring    2019-11-07   60      description: drive actively high and low
3af50e548019f6 Rob Herring    2019-11-07   61  
3af50e548019f6 Rob Herring    2019-11-07   62    drive-open-drain:
b2b701b31e1c58 Rob Herring    2022-04-29   63      oneOf:
b2b701b31e1c58 Rob Herring    2022-04-29   64        - type: boolean
b2b701b31e1c58 Rob Herring    2022-04-29   65        - $ref: /schemas/types.yaml#/definitions/uint32
b2b701b31e1c58 Rob Herring    2022-04-29   66          const: 1    # No known cases of 0
b2b701b31e1c58 Rob Herring    2022-04-29   67          deprecated: true
3af50e548019f6 Rob Herring    2019-11-07   68      description: drive with open drain
3af50e548019f6 Rob Herring    2019-11-07   69  
3af50e548019f6 Rob Herring    2019-11-07   70    drive-open-source:
3af50e548019f6 Rob Herring    2019-11-07   71      type: boolean
3af50e548019f6 Rob Herring    2019-11-07   72      description: drive with open source
3af50e548019f6 Rob Herring    2019-11-07   73  
3af50e548019f6 Rob Herring    2019-11-07   74    drive-strength:
3af50e548019f6 Rob Herring    2019-11-07   75      $ref: /schemas/types.yaml#/definitions/uint32
3af50e548019f6 Rob Herring    2019-11-07   76      description: sink or source at most X mA
3af50e548019f6 Rob Herring    2019-11-07   77  
3af50e548019f6 Rob Herring    2019-11-07   78    drive-strength-microamp:
3af50e548019f6 Rob Herring    2019-11-07   79      description: sink or source at most X uA
3af50e548019f6 Rob Herring    2019-11-07   80  
3af50e548019f6 Rob Herring    2019-11-07   81    input-enable:
3af50e548019f6 Rob Herring    2019-11-07   82      type: boolean
3af50e548019f6 Rob Herring    2019-11-07   83      description: enable input on pin (no effect on output, such as
3af50e548019f6 Rob Herring    2019-11-07   84        enabling an input buffer)
3af50e548019f6 Rob Herring    2019-11-07   85  
3af50e548019f6 Rob Herring    2019-11-07   86    input-disable:
3af50e548019f6 Rob Herring    2019-11-07   87      type: boolean
3af50e548019f6 Rob Herring    2019-11-07   88      description: disable input on pin (no effect on output, such as
3af50e548019f6 Rob Herring    2019-11-07   89        disabling an input buffer)
3af50e548019f6 Rob Herring    2019-11-07   90  
3af50e548019f6 Rob Herring    2019-11-07   91    input-schmitt-enable:
3af50e548019f6 Rob Herring    2019-11-07   92      type: boolean
3af50e548019f6 Rob Herring    2019-11-07   93      description: enable schmitt-trigger mode
3af50e548019f6 Rob Herring    2019-11-07   94  
3af50e548019f6 Rob Herring    2019-11-07   95    input-schmitt-disable:
3af50e548019f6 Rob Herring    2019-11-07   96      type: boolean
3af50e548019f6 Rob Herring    2019-11-07   97      description: disable schmitt-trigger mode
3af50e548019f6 Rob Herring    2019-11-07   98  
737df10956c425 Inochi Amaoto  2024-07-18   99    input-schmitt-microvolt:
737df10956c425 Inochi Amaoto  2024-07-18  100      description: threshold strength for schmitt-trigger
737df10956c425 Inochi Amaoto  2024-07-18  101  
3af50e548019f6 Rob Herring    2019-11-07  102    input-debounce:
736ed7ce0a5d10 Rob Herring    2024-01-24  103      $ref: /schemas/types.yaml#/definitions/uint32-array
3af50e548019f6 Rob Herring    2019-11-07  104      description: Takes the debounce time in usec as argument or 0 to disable
3af50e548019f6 Rob Herring    2019-11-07  105        debouncing
3af50e548019f6 Rob Herring    2019-11-07  106  
3af50e548019f6 Rob Herring    2019-11-07  107    power-source:
3af50e548019f6 Rob Herring    2019-11-07  108      $ref: /schemas/types.yaml#/definitions/uint32
3af50e548019f6 Rob Herring    2019-11-07  109      description: select between different power supplies
3af50e548019f6 Rob Herring    2019-11-07  110  
3af50e548019f6 Rob Herring    2019-11-07  111    low-power-enable:
3af50e548019f6 Rob Herring    2019-11-07  112      type: boolean
3af50e548019f6 Rob Herring    2019-11-07  113      description: enable low power mode
3af50e548019f6 Rob Herring    2019-11-07  114  
3af50e548019f6 Rob Herring    2019-11-07  115    low-power-disable:
3af50e548019f6 Rob Herring    2019-11-07  116      type: boolean
3af50e548019f6 Rob Herring    2019-11-07  117      description: disable low power mode
3af50e548019f6 Rob Herring    2019-11-07  118  
3af50e548019f6 Rob Herring    2019-11-07  119    output-disable:
3af50e548019f6 Rob Herring    2019-11-07  120      type: boolean
3af50e548019f6 Rob Herring    2019-11-07  121      description: disable output on a pin (such as disable an output buffer)
3af50e548019f6 Rob Herring    2019-11-07  122  
3af50e548019f6 Rob Herring    2019-11-07  123    output-enable:
3af50e548019f6 Rob Herring    2019-11-07  124      type: boolean
3af50e548019f6 Rob Herring    2019-11-07  125      description: enable output on a pin without actively driving it
3af50e548019f6 Rob Herring    2019-11-07  126        (such as enabling an output buffer)
3af50e548019f6 Rob Herring    2019-11-07  127  
7388fa8acfce2c Lad Prabhakar  2021-10-27  128    output-impedance-ohms:
7388fa8acfce2c Lad Prabhakar  2021-10-27  129      description: set the output impedance of a pin to at most X ohms
7388fa8acfce2c Lad Prabhakar  2021-10-27  130  
3af50e548019f6 Rob Herring    2019-11-07  131    output-low:
3af50e548019f6 Rob Herring    2019-11-07  132      type: boolean
3af50e548019f6 Rob Herring    2019-11-07  133      description: set the pin to output mode with low level
3af50e548019f6 Rob Herring    2019-11-07  134  
3af50e548019f6 Rob Herring    2019-11-07  135    output-high:
3af50e548019f6 Rob Herring    2019-11-07  136      type: boolean
3af50e548019f6 Rob Herring    2019-11-07  137      description: set the pin to output mode with high level
3af50e548019f6 Rob Herring    2019-11-07  138  
3af50e548019f6 Rob Herring    2019-11-07  139    sleep-hardware-state:
3af50e548019f6 Rob Herring    2019-11-07  140      type: boolean
3af50e548019f6 Rob Herring    2019-11-07  141      description: indicate this is sleep related state which will be
3af50e548019f6 Rob Herring    2019-11-07  142        programmed into the registers for the sleep state.
3af50e548019f6 Rob Herring    2019-11-07  143  
3af50e548019f6 Rob Herring    2019-11-07  144    slew-rate:
3af50e548019f6 Rob Herring    2019-11-07  145      $ref: /schemas/types.yaml#/definitions/uint32
3af50e548019f6 Rob Herring    2019-11-07  146      description: set the slew rate
3af50e548019f6 Rob Herring    2019-11-07  147  
3af50e548019f6 Rob Herring    2019-11-07  148    skew-delay:
3af50e548019f6 Rob Herring    2019-11-07  149      $ref: /schemas/types.yaml#/definitions/uint32
3af50e548019f6 Rob Herring    2019-11-07  150      description:
3af50e548019f6 Rob Herring    2019-11-07  151        this affects the expected clock skew on input pins
3af50e548019f6 Rob Herring    2019-11-07  152        and the delay before latching a value to an output
3af50e548019f6 Rob Herring    2019-11-07  153        pin. Typically indicates how many double-inverters are
3af50e548019f6 Rob Herring    2019-11-07  154        used to delay the signal.
6a0e321ea73569 Rob Herring    2020-10-05  155  
5c284d086bcf3b Antonio Borneo 2025-10-23  156    skew-delay-input-ps:
5c284d086bcf3b Antonio Borneo 2025-10-23  157      description:
5c284d086bcf3b Antonio Borneo 2025-10-23  158        this affects the expected clock skew in ps on an input pin.
5c284d086bcf3b Antonio Borneo 2025-10-23  159  
5c284d086bcf3b Antonio Borneo 2025-10-23  160    skew-delay-output-ps:
5c284d086bcf3b Antonio Borneo 2025-10-23  161      description:
5c284d086bcf3b Antonio Borneo 2025-10-23  162        this affects the expected delay in ps before latching a value to
5c284d086bcf3b Antonio Borneo 2025-10-23  163        an output pin.
5c284d086bcf3b Antonio Borneo 2025-10-23  164  
1ed6a1e08e61d8 Conor Dooley   2025-11-21  165  allOf:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  166    - if:
5c284d086bcf3b Antonio Borneo 2025-10-23  167        required:
5c284d086bcf3b Antonio Borneo 2025-10-23  168          - skew-delay
5c284d086bcf3b Antonio Borneo 2025-10-23  169      then:
5c284d086bcf3b Antonio Borneo 2025-10-23  170        properties:
5c284d086bcf3b Antonio Borneo 2025-10-23  171          skew-delay-input-ps: false
5c284d086bcf3b Antonio Borneo 2025-10-23  172          skew-delay-output-ps: false
5c284d086bcf3b Antonio Borneo 2025-10-23  173  
1ed6a1e08e61d8 Conor Dooley   2025-11-21  174    - if:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  175        required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  176          - input-disable
1ed6a1e08e61d8 Conor Dooley   2025-11-21  177      then:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  178        properties:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  179          input-enable: false
1ed6a1e08e61d8 Conor Dooley   2025-11-21  180  
1ed6a1e08e61d8 Conor Dooley   2025-11-21  181    - if:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  182        required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  183          - output-disable
1ed6a1e08e61d8 Conor Dooley   2025-11-21  184      then:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  185        properties:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  186          output-enable: false
1ed6a1e08e61d8 Conor Dooley   2025-11-21  187          output-impedance-ohms: false
1ed6a1e08e61d8 Conor Dooley   2025-11-21  188  
1ed6a1e08e61d8 Conor Dooley   2025-11-21  189    - if:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  190        required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  191          - output-low
1ed6a1e08e61d8 Conor Dooley   2025-11-21  192      then:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  193        properties:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  194          output-high: false
1ed6a1e08e61d8 Conor Dooley   2025-11-21  195  
1ed6a1e08e61d8 Conor Dooley   2025-11-21  196    - if:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  197        required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  198          - low-power-enable
1ed6a1e08e61d8 Conor Dooley   2025-11-21  199      then:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  200        properties:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  201          low-power-disable: false
1ed6a1e08e61d8 Conor Dooley   2025-11-21  202  
1ed6a1e08e61d8 Conor Dooley   2025-11-21  203    - if:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  204        required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  205          - input-schmitt-disable
1ed6a1e08e61d8 Conor Dooley   2025-11-21  206      then:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  207        properties:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  208          input-schmitt-enable: false
1ed6a1e08e61d8 Conor Dooley   2025-11-21  209          input-schmitt-microvolt: false
1ed6a1e08e61d8 Conor Dooley   2025-11-21  210  
1ed6a1e08e61d8 Conor Dooley   2025-11-21  211    - if:
1ed6a1e08e61d8 Conor Dooley   2025-11-21 @212       required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  213         - drive-strength
1ed6a1e08e61d8 Conor Dooley   2025-11-21  214      then:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  215        properties:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  216          drive-strength-microamp: false
1ed6a1e08e61d8 Conor Dooley   2025-11-21  217  
1ed6a1e08e61d8 Conor Dooley   2025-11-21  218    - if:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  219        anyOf:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  220          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  221              - drive-open-source
1ed6a1e08e61d8 Conor Dooley   2025-11-21  222          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  223              - drive-open-drain
1ed6a1e08e61d8 Conor Dooley   2025-11-21  224          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  225              - drive-push-pull
1ed6a1e08e61d8 Conor Dooley   2025-11-21  226      then:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  227        oneOf:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  228          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  229              - drive-open-source
1ed6a1e08e61d8 Conor Dooley   2025-11-21  230          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  231              - drive-open-drain
1ed6a1e08e61d8 Conor Dooley   2025-11-21  232          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  233              - drive-push-pull
1ed6a1e08e61d8 Conor Dooley   2025-11-21  234  
1ed6a1e08e61d8 Conor Dooley   2025-11-21  235    - if:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  236        anyOf:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  237          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  238              - bias-disable
1ed6a1e08e61d8 Conor Dooley   2025-11-21  239          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  240              - bias-high-impedance
1ed6a1e08e61d8 Conor Dooley   2025-11-21  241          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  242              - bias-bus-hold
1ed6a1e08e61d8 Conor Dooley   2025-11-21  243          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  244              - bias-pull-up
1ed6a1e08e61d8 Conor Dooley   2025-11-21  245          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  246              - bias-pull-down
1ed6a1e08e61d8 Conor Dooley   2025-11-21  247          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  248              - bias-pull-pin-default
1ed6a1e08e61d8 Conor Dooley   2025-11-21  249      then:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  250        oneOf:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  251          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  252              - bias-disable
1ed6a1e08e61d8 Conor Dooley   2025-11-21  253          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  254              - bias-high-impedance
1ed6a1e08e61d8 Conor Dooley   2025-11-21  255          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  256              - bias-bus-hold
1ed6a1e08e61d8 Conor Dooley   2025-11-21  257          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  258              - bias-pull-up
1ed6a1e08e61d8 Conor Dooley   2025-11-21  259          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  260              - bias-pull-down
1ed6a1e08e61d8 Conor Dooley   2025-11-21  261          - required:
1ed6a1e08e61d8 Conor Dooley   2025-11-21  262              - bias-pull-pin-default
1ed6a1e08e61d8 Conor Dooley   2025-11-21  263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

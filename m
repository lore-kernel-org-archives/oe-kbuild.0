Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C827381B1A
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650749; cv=none; b=rOgsH90Z4dggDYB4H94lERRMYseaXnuwq6MRYAh0A54TNlz2DBqWzdcpasMGvU2nlJiPtGVdrWKeOlEU+EASwDZCBdTE70uqshoYDbEwCgauCqaxMr5wuNdQIKRNDxg0bmYxO7gp+kAmgyXOZ7vRPXuEhJhhQ8zr9D71NTWH+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650749; c=relaxed/simple;
	bh=GDrifIMi3lnt3uRI/4ZyBWOYdzAgavhMrg/3jb3mdM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dAJ/S6B00D2jcFI1cqqJ6+ZsSpip4c0eiY7hvbC2ju75whkqUGVRlQ9bCRVXNOjh3vw4mnIftw0C9rIMLC928l39aHWV0tYipG1IjK/FwEL7VF7Eqll00/co21bTRuE/lPOGtABbGwEw1egsyfaQpAtWeWlwKjjc3W1NeqA1VQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/HKvLDn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/HKvLDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773650745; x=1805186745;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GDrifIMi3lnt3uRI/4ZyBWOYdzAgavhMrg/3jb3mdM8=;
  b=c/HKvLDnZJDDHxjQnNP97nT71QPxvtGJRG9180OlQaId5uArkcoBCk7I
   XJX1QuP0sDPYfpX3gidWC/6iOMaKNVRDBqqm2rFteRGiOVHX1mlflQpyK
   xdQoD8LYIHmEqFmHa9qdHW/wdBi/sX3AV8sLg1L6z4prL+ea7u56Izo8X
   Rzms/FPVA9YfrXQjwOYQLaj9Yw+3Yy//Ip/b1IlAZYSc7fKPAZVRVuWdi
   6uN+aqlE9UIYEAFb6DpRtsIj0kmbmFXNy7g4MF4mu+uOzLKfHTnCGFsYV
   Z3g/jpYdoyQhflLp/9Lv3MdUbaqqYpR7v2ltfc6gLUh6xXOeQ8HsFSR58
   Q==;
X-CSE-ConnectionGUID: R9vHxYy8S0mvl2KCv3S11w==
X-CSE-MsgGUID: QPs7KJ+9TnynO56/ph5GfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="78554409"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="78554409"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 01:45:44 -0700
X-CSE-ConnectionGUID: ZVQxIed1QaacGV1IRgp2cQ==
X-CSE-MsgGUID: iYCSAVn0SgGEzz5cvTk8iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="217699747"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Mar 2026 01:45:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w23a0-000000004Bp-1dS0;
	Mon, 16 Mar 2026 08:45:40 +0000
Date: Mon, 16 Mar 2026 09:45:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v26 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <202603160903.zPqeEb9w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260309-upstream_i2c-v26-1-5fedcff8ffe8@aspeedtech.com>
References: <20260309-upstream_i2c-v26-1-5fedcff8ffe8@aspeedtech.com>
TO: Ryan Chen <ryan_chen@aspeedtech.com>
TO: jk@codeconstruct.com.au
TO: andriy.shevchenko@linux.intel.com
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
TO: Rayn Chen <rayn_chen@aspeedtech.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-i2c@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: Ryan Chen <ryan_chen@aspeedtech.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-binding=
s-i2c-Split-AST2600-binding-into-a-new-YAML/20260309-145620
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260309-upstream_i2c-v26-1-5fedcf=
f8ffe8%40aspeedtech.com
patch subject: [PATCH v26 1/4] dt-bindings: i2c: Split AST2600 binding into=
 a new YAML
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-2052-20260309 (https://download.01.org/0day-ci/archi=
ve/20260316/202603160903.zPqeEb9w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260316/202603160903.zPqeEb9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603160903.zPqeEb9w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: / (aspeed,ast2600-ev=
b-a1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['aspeed,ast2600-evb-a1', 'aspeed,ast2600-evb', 'aspeed,ast2600'] is to=
o long
   	'aspeed,ast2600-evb-a1' is not one of ['delta,ahe50dc-bmc', 'facebook,g=
alaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,=
olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
   	'aspeed,ast2600-evb-a1' is not one of ['amd,daytonax-bmc', 'amd,ethanol=
x-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,altrad8-bmc', 'a=
srock,e3c246d4i-bmc', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asro=
ck,spc621d8hm3-bmc', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook=
,cmm-bmc', 'facebook,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yam=
p-bmc', 'facebook,yosemitev2-bmc', 'facebook,wedge400-bmc', 'facebook,wedge=
400-data64-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mihawk-bmc', 'ibm,mowg=
li-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,witherspoon-bmc', 'ingras=
ys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-bmc', 'inspur,on5263=
m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'lenovo,hr630-bmc', '=
lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,centriq2400-rep-bmc', '=
supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bmc', 'yadro,nicole-b=
mc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', 'yadro,vegman-sx20-b=
mc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	'aspeed,ast2600' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/lpc@1e78900=
0/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: i2c@80 (aspeed,ast26=
00-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: i2c@80 (aspeed,ast26=
00-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: i2c@100 (aspeed,ast2=
600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: i2c@100 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: i2c@180 (aspeed,ast2=
600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: i2c@180 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: i2c@200 (aspeed,ast2=
600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/lpc@1e789000/l=
hc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: i2c@80 (aspeed,ast2600-=
i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: i2c@80 (aspeed,ast2600-=
i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: i2c@100 (aspeed,ast2600=
-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: i2c@100 (aspeed,ast2600=
-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: i2c@180 (aspeed,ast2600=
-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: i2c@180 (aspeed,ast2600=
-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: i2c@200 (aspeed,ast2600=
-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: i2c@80 (aspe=
ed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: i2c@80 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: i2c@100 (asp=
eed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: i2c@100 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: i2c@180 (asp=
eed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: i2c@180 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: i2c@200 (asp=
eed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:672.10-692.4: =
Warning (avoid_unnecessary_addr_size): /ahb/apb/bus@1e78a000/i2c@480/gpio@7=
7: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or=
 child "reg" or "ranges" property
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/lpc@=
1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast26=
00-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c@80 (aspee=
d,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c@80 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c@100 (aspe=
ed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c@100 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c@180 (aspe=
ed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: i2c@180 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@=
1e78a000/i2c@180/psu@58: failed to match any schema with compatible: ['pmbu=
s']
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9000 (aspeed,=
ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9100 (aspeed,=
ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/lpc@1e789000=
/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: i2c@80 (aspeed,ast260=
0-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: i2c@80 (aspeed,ast260=
0-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was une=
xpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: i2c@100 (aspeed,ast26=
00-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: i2c@100 (aspeed,ast26=
00-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: i2c@180 (aspeed,ast26=
00-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: i2c@180 (aspeed,ast26=
00-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: i2c@200 (aspeed,ast26=
00-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: i2c@80 (aspeed=
,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: i2c@80 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: i2c@100 (aspee=
d,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: i2c@100 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: i2c@180 (aspee=
d,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: i2c@200 (aspee=
d,ast2600-i2c-bus): reg: [[512, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: i2c@280 (aspee=
d,ast2600-i2c-bus): reg: [[640, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c@80 (aspe=
ed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c@80 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c@100 (asp=
eed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c@100 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c@180 (asp=
eed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c@180 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: i2c@200 (asp=
eed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/lpc@=
1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast26=
00-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: i2c@80 (aspee=
d,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: i2c@80 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: i2c@100 (aspe=
ed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: i2c@100 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: i2c@180 (aspe=
ed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: i2c@180 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: i2c@200 (aspe=
ed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/lpc@=
1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast26=
00-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: i2c@80 (aspee=
d,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: i2c@80 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: i2c@100 (aspe=
ed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: i2c@100 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: i2c@180 (aspe=
ed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: i2c@180 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: i2c@200 (aspe=
ed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: /ahb/apb/lpc@1e=
789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600=
-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: i2c@80 (aspeed,=
ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: i2c@80 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: i2c@100 (aspeed=
,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: i2c@100 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: i2c@180 (aspeed=
,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: i2c@180 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dtb: i2c@200 (aspeed=
,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/apb/lpc@1e=
789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600=
-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: i2c@80 (aspeed,=
ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: i2c@80 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: i2c@100 (aspeed=
,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: i2c@100 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: i2c@180 (aspeed=
,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: i2c@180 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: i2c@200 (aspeed=
,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: /ahb/apb/l=
pc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,as=
t2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: i2c@80 (as=
peed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: i2c@80 (as=
peed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequen=
cy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: i2c@100 (a=
speed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: i2c@100 (a=
speed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-freque=
ncy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: i2c@180 (a=
speed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: i2c@180 (a=
speed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-freque=
ncy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dtb: i2c@200 (a=
speed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/apb/lpc@1e78=
9000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-l=
hc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: i2c@80 (aspeed,as=
t2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: i2c@80 (aspeed,as=
t2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: i2c@100 (aspeed,a=
st2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: i2c@100 (aspeed,a=
st2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' wa=
s unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: i2c@180 (aspeed,a=
st2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: i2c@180 (aspeed,a=
st2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' wa=
s unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: i2c@200 (aspeed,a=
st2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('mella=
nox,multi-host', 'ncsi-channel', 'ncsi-ctrl,no-channel-monitor', 'ncsi-ctrl=
,start-redo-probe', 'ncsi-package', 'ncsi-rexmit', 'ncsi-timeout' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000 (aspeed,ast2600-mac): 'ncsi-ctrl,no-channel-monitor', 'ncsi-ctrl,sta=
rt-redo-probe' do not match any of the regexes: '^#.*', '^(at25|bm|devbus|d=
macap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^=
(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-single|=
#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5=
m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts|vsc8531),.*', =
'^100ask,.*', '^70mai,.*', '^8dev,.*', '^9tripod,.*', '^GEFanuc,.*', '^IBM,=
=2E*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9#+\\-._@]{0,63}$', =
'^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*=
', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^actions=
,.*', '^actiontec,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapt=
eva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*',=
 '^advantech,.*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*=
', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^algoltek,.*', '^allegr=
o,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvision,.*', '^allo,=
=2E*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.*', '^altr,.*'=
, '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amediatech,.*', '^a=
mlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams,.*', '^amstao=
s,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anlogic,.*', '^an=
vo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^a=
rasan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^ardui=
no,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,=
=2E*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.=
*', '^asix,.*', '^asl-tek,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*'=
, '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axe=
ntia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', =
'^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bestar,.*', '^=
bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^=
blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi=
,.*', '^bsh,.*', '^bst,.*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^=
bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^=
calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '^capella,.*', '^cas=
coda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*'=
, '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree=
,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^ch=
rontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.=
*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*=
', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', '^compulab,.*', '^c=
omvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '=
^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*'=
, '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^c=
ubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',=
 '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,=
=2E*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*'=
, '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dim=
onoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dli=
nk,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dra=
gino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '=
^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^ec=
onet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^=
egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^el=
gin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,=
=2E*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', =
'^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*', '^endless,.*', '^=
ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*', '^epcos,.*', '^e=
pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*', '^euk=
rea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^exc=
ito,.*', '^exegin,.*', '^ezchip,.*', '^ezurio,.*', '^facebook,.*', '^fairch=
ild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^=
fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^fitipower=
,.*', '^flipkart,.*', '^focaltech,.*', '^forlinx,.*', '^foursemi,.*', '^fox=
link,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^f=
sl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^ga=
rdena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuyin=
g,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^g=
enexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', =
'^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelic=
o,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', =
'^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^h=
aoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*',=
 '^hideep,.*', '^himax,.*', '^hinlink,.*', '^hirschmann,.*', '^hisi,.*', '^=
hisilicon,.*', '^hit,.*', '^hitex,.*', '^hitron,.*', '^holt,.*', '^holtek,.=
*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*',=
 '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*'=
, '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hyni=
x,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei=
,.*', '^ifi,.*', '^ifm,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*=
', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indiedroid,.*', '^in=
et-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '=
^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insign=
al,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^=
inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '=
^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iw=
ave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*',=
 '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.=
*', '^jutouch,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '=
^khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingno=
vel,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '=
^kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', =
'^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^le=
ez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*',=
 '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^linear=
technology,.*', '^linkease,.*', '^linksprite,.*', '^linksys,.*', '^linutron=
ix,.*', '^linux,.*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*',=
 '^lltc,.*', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.=
*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*=
', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^manti=
x,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^m=
axim,.*', '^maxlinear,.*', '^maxtor,.*', '^mayqueen,.*', '^mbvl,.*', '^mcub=
e,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^medion,.*', '^megachips,.=
*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.=
*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^=
methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*=
', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrot=
ik,.*', '^milianke,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*'=
, '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*'=
, '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech=
,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^=
mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^m=
ulti-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^=
myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neo=
node,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^=
netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*'=
, '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^=
nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novate=
k,.*', '^novtech,.*', '^nuclei,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvot=
on,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct=
,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^on=
ie,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,=
=2E*', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*',=
 '^openwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*=
', '^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^=
oxsemi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', =
'^particle,.*', '^pda,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', =
'^phicomm,.*', '^phontech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9=
]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plath=
ome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^p=
olaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', =
'^pov,.*', '^powertip,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^prim=
eview,.*', '^primux,.*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^pur=
ism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodia=
n,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*=
', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumf=
eld,.*', '^raydium,.*', '^raystar,.*', '^rda,.*', '^realtek,.*', '^relfor,.=
*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retronix,.*', '^rev=
otics,.*', '^rex,.*', '^rfdigital,.*', '^richtek,.*', '^ricoh,.*', '^rikoma=
gic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*=
', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*',=
 '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '=
^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^s=
chulercontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*',=
 '^seirobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^senso=
rtek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^=
sharp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*',=
 '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '=
^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*'=
, '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^si=
liconmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*',=
 '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^s=
kov,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', =
'^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidru=
n,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,=
=2E*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^s=
prd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-er=
icsson,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', =
'^ste,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', =
'^summit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*=
', '^swir,.*', '^syna,.*', '^synaptics,.*', '^synology,.*', '^synopsys,.*',=
 '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.=
*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^te=
chnologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*=
', '^tempo,.*', '^tenda,.*', '^tenstorrent,.*', '^terasic,.*', '^tesla,.*',=
 '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thunder=
comm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topee=
t,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,=
=2E*', '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^t=
q,.*', '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^tr=
uly,.*', '^tsd,.*', '^turing,.*', '^tuxedo,.*', '^tyan,.*', '^tyhx,.*', '^u=
-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispa=
ce,.*', '^ugoos,.*', '^ultrarisc,.*', '^ultratronik,.*', '^uni-t,.*', '^uni=
west,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,=
=2E*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.*',=
 '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*', =
'^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '=
^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*', '^=
vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*=
', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexl=
er,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi=
,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^winstar=
,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wol=
fvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor,.*=
', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xlnx,.=
*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', '^y=
es-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '^yo=
nes-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*', '^=
zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.=
*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/lp=
c@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast=
2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: i2c@80 (asp=
eed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: i2c@80 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: i2c@100 (as=
peed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: i2c@100 (as=
peed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequen=
cy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: i2c@180 (as=
peed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: i2c@180 (as=
peed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequen=
cy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: i2c@200 (as=
peed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: gpio@1e780000 (a=
speed,ast2600-gpio): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer=
=2Eyaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/lpc@1e7=
89000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-=
lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: serial@1e78d000 =
(ns16550a): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer=
=2Eyaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: serial@1e78f000 =
(ns16550a): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer=
=2Eyaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: i2c@80 (aspeed,a=
st2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: i2c@80 (aspeed,a=
st2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' wa=
s unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: i2c@100 (aspeed,=
ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: i2c@100 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: i2c@180 (aspeed,=
ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: i2c@180 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: i2c@200 (aspeed,=
ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: i2c@80 (aspeed=
,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: i2c@80 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: i2c@100 (aspee=
d,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: i2c@100 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: i2c@180 (aspee=
d,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: i2c@180 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: i2c@200 (aspee=
d,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb/=
lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,a=
st2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: i2c@80 (a=
speed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: i2c@80 (a=
speed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-freque=
ncy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: i2c@100 (=
aspeed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: i2c@100 (=
aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequ=
ency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: i2c@180 (=
aspeed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: i2c@200 (=
aspeed,ast2600-i2c-bus): reg: [[512, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: i2c@200 (=
aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequ=
ency' was unexpected)
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: ethernet@1e6=
70000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('mellan=
ox,multi-host' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: ethernet@1e6=
90000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('mellan=
ox,multi-host' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c@80 (aspe=
ed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c@80 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c@100 (asp=
eed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c@100 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c@180 (asp=
eed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c@180 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: i2c@200 (asp=
eed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: /ahb/apb/lpc=
@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2=
600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: i2c@80 (aspe=
ed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: i2c@80 (aspe=
ed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: i2c@100 (asp=
eed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: i2c@100 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: i2c@180 (asp=
eed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: i2c@180 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dtb: i2c@200 (asp=
eed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: /ahb/apb/lpc@1e789=
000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lh=
c']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: i2c@80 (aspeed,ast=
2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: i2c@80 (aspeed,ast=
2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was =
unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: i2c@100 (aspeed,as=
t2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: i2c@100 (aspeed,as=
t2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: i2c@180 (aspeed,as=
t2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: i2c@180 (aspeed,as=
t2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-balcones.dtb: i2c@200 (aspeed,as=
t2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/lpc@1e78=
9000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-l=
hc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c@80 (aspeed,as=
t2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c@80 (aspeed,as=
t2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c@100 (aspeed,a=
st2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c@100 (aspeed,a=
st2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' wa=
s unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c@180 (aspeed,a=
st2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c@180 (aspeed,a=
st2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' wa=
s unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: i2c@200 (aspeed,a=
st2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:159.18-166.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node h=
as a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:328.18-335.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefif=
o@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:86.19-103.4: Warning=
 (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cel=
ls/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" pr=
operty
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/lpc@1e7890=
00/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc=
']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c@80 (aspeed,ast2=
600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c@80 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: tca9554@20 (ti,tca9=
554): '#address-cells', '#size-cells' do not match any of the regexes: '^(h=
og-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c@100 (aspeed,ast=
2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c@100 (aspeed,ast=
2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was =
unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c@180 (aspeed,ast=
2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: i2c@180 (aspeed,ast=
2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was =
unexpected)
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:2877.18-2884.6: Warn=
ing (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@4,0=
/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:3252.18-3259.6: Warn=
ing (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@5,0=
/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:3627.18-3634.6: Warn=
ing (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@6,0=
/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:4002.18-4009.6: Warn=
ing (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@7,0=
/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/lpc@1e7890=
00/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc=
']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c@80 (aspeed,ast2=
600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c@80 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c@100 (aspeed,ast=
2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c@100 (aspeed,ast=
2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was =
unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c@180 (aspeed,ast=
2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c@180 (aspeed,ast=
2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was =
unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: i2c@200 (aspeed,ast=
2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/lpc@1e789000/=
lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c@80 (aspeed,ast2600=
-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c@80 (aspeed,ast2600=
-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was unex=
pected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c@100 (aspeed,ast260=
0-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c@100 (aspeed,ast260=
0-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was une=
xpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c@180 (aspeed,ast260=
0-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c@180 (aspeed,ast260=
0-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was une=
xpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: i2c@200 (aspeed,ast260=
0-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:159.18-166.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node h=
as a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:328.18-335.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefif=
o@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:810.18-817.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefif=
o@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1185.18-1192.6: Warning (=
unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbef=
ifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/lpc@1e7890=
00/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc=
']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c@80 (aspeed,ast2=
600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c@80 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: tca9554@20 (ti,tca9=
554): '#address-cells', '#size-cells' do not match any of the regexes: '^(h=
og-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c@100 (aspeed,ast=
2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c@100 (aspeed,ast=
2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was =
unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c@180 (aspeed,ast=
2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c@180 (aspeed,ast=
2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was =
unexpected)
--
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:159.18-166.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node h=
as a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:328.18-335.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefif=
o@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:810.18-817.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefif=
o@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1185.18-1192.6: Warning (=
unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbef=
ifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c@80 (aspeed=
,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c@80 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: tca9554@20 (ti=
,tca9554): '#address-cells', '#size-cells' do not match any of the regexes:=
 '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c@100 (aspee=
d,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c@100 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c@180 (aspee=
d,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c@180 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
--
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:159.18-166.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node h=
as a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:328.18-335.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefif=
o@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:810.18-817.6: Warning (un=
it_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@2,0/sbefif=
o@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1185.18-1192.6: Warning (=
unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbef=
ifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/lpc@1e7=
89000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-=
lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c@80 (aspeed,a=
st2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c@80 (aspeed,a=
st2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' wa=
s unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: tca9554@20 (ti,t=
ca9554): '#address-cells', '#size-cells' do not match any of the regexes: '=
^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c@100 (aspeed,=
ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c@100 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c@180 (aspeed,=
ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c@180 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb/lpc@1e789000/=
lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: i2c@80 (aspeed,ast2600=
-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: i2c@100 (aspeed,ast260=
0-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: i2c@100 (aspeed,ast260=
0-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was une=
xpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: i2c@180 (aspeed,ast260=
0-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: i2c@180 (aspeed,ast260=
0-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was une=
xpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: i2c@200 (aspeed,ast260=
0-i2c-bus): reg: [[512, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: i2c@200 (aspeed,ast260=
0-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was une=
xpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: i2c@280 (aspeed,ast260=
0-i2c-bus): reg: [[640, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:611.27-616.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/lpc-ctrl@80: duplicate unit-a=
ddress (also used in node /ahb/apb/lpc@1e789000/lpc-snoop@80)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/lpc@1e7890=
00/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc=
']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: i2c@80 (aspeed,ast2=
600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: i2c@80 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: i2c@100 (aspeed,ast=
2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: i2c@100 (aspeed,ast=
2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was =
unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: led-controller@60 (=
nxp,pca9552): 'led@10', 'led@11', 'led@12', 'led@13', 'led@14', 'led@15' do=
 not match any of the regexes: '^led@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: i2c@180 (aspeed,ast=
2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: i2c@180 (aspeed,ast=
2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was =
unexpected)
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/lp=
c@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast=
2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@80 (asp=
eed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@80 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@100 (as=
peed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@100 (as=
peed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequen=
cy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@180 (as=
peed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@180 (as=
peed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequen=
cy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@200 (as=
peed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: /ahb/apb/lpc@1e=
789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600=
-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: i2c@80 (aspeed,=
ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: i2c@80 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: i2c@100 (aspeed=
,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: i2c@100 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: i2c@180 (aspeed=
,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: i2c@180 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dtb: i2c@200 (aspeed=
,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts:283.18-285.6: Warning=
 (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: no=
de has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts:384.18-386.6: Warning=
 (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sb=
efifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: serial@1e783000 (snp=
s,dw-apb-uart): Unevaluated properties are not allowed ('no-loopback-test' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.=
yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: serial@1e784000 (snp=
s,dw-apb-uart): Unevaluated properties are not allowed ('no-loopback-test' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.=
yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/lpc@1e78900=
0/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: i2c@80 (aspeed,ast26=
00-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: i2c@80 (aspeed,ast26=
00-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: i2c@100 (aspeed,ast2=
600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: i2c@100 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: i2c@180 (aspeed,ast2=
600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: i2c@180 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: i2c@200 (aspeed,ast2=
600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: gpio@1e780000 (a=
speed,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '', 'BMC=
_FLASH_MUX_SEL', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', 'BMC_FWSPI_RST_N', '', 'GPIO_1_BMC_3V3', '', '', '', =
'', '', 'JTAG_MUX_A', 'JTAG_MUX_B', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', 'SCMFPGA_SPARE_GPIO1_3V3', 'SCMFPGA_=
SPARE_GPIO2_3V3', 'SCMFPGA_SPARE_GPIO3_3V3', 'SCMFPGA_SPARE_GPIO4_3V3', 'SC=
MFPGA_SPARE_GPIO5_3V3', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/apb/lpc@1e7=
89000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-=
lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: i2c@80 (aspeed,a=
st2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: i2c@100 (aspeed,=
ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: i2c@180 (aspeed,=
ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: i2c@180 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: i2c@200 (aspeed,=
ast2600-i2c-bus): reg: [[512, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: i2c@280 (aspeed,=
ast2600-i2c-bus): reg: [[640, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: i2c@280 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: i2c@300 (aspeed,=
ast2600-i2c-bus): reg: [[768, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: i2c@300 (aspeed,=
ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' w=
as unexpected)
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9000 (aspeed=
,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9100 (aspeed=
,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: gpio@1e780000 (aspee=
d,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', 'PLTRST_N', '', 'PWR_DEBUG_N',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', 'PREQ_N', 'TCK_MUX_SEL', '',=
 '', '', '', '', 'PWRGD_SYS_PWROK', '', 'PRDY_N', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', 'SYS_BMC_PWRBTN_R_N', 'SYS_P=
WRBTN_N', 'FM_MB_RST_BTN', 'RST_BMC_RSTBTN_OUT_N', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'FP_ID_=
BTN_SCM_N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', 'SMI', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'F=
M_BMC_READY_N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/apb/lpc@1e78900=
0/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: i2c@80 (aspeed,ast26=
00-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: i2c@80 (aspeed,ast26=
00-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: i2c@100 (aspeed,ast2=
600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: i2c@100 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: i2c@180 (aspeed,ast2=
600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: i2c@180 (aspeed,ast2=
600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' was u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: i2c@200 (aspeed,ast2=
600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: gpio@1e7800=
00 (aspeed,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '',=
 'alert-psu0-smb-r-n', 'bmc-ready', '', 'assert-cpu0-prochot-r-n', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', 'reset-sgpio-r-n', '', '', '',=
 '', '', 'scm-jtag-mux-select', '', '', '', '', '', '', '', '', '', 'reset-=
out', 'power-out', '', '', '', '', '', '', '', '', 'irq-bmc-cpu0-buf-nmi-n'=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ncsi-oc=
p-clk-en-n', '', '', '', '', '', '', '', '', '', '', '', 'cpu1-thermal-trip=
-n', '', '', '', '', '', '', '', '', '', 'cpu0-prochot-n', '', 'cpu1-procho=
t-n', '', 'cpu0-pe-rst0', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', 'PCH_SLP_S4_BMC_N', 'cpu0-thermtrip-n', 'alert-psu1-smb-r-n'=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'bios-rec=
overy-buf-n', '', 'assert-cpu1-prochot-r-n', '', 'power-chassis-good', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', 'platform-type', ''=
, '', '', '', '', '', '', '', '', '', '', '', 'cpld-power-break-n', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/apb/lp=
c@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast=
2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: i2c@80 (asp=
eed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: i2c@80 (asp=
eed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequenc=
y' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: i2c@100 (as=
peed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: i2c@100 (as=
peed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequen=
cy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: i2c@180 (as=
peed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: i2c@180 (as=
peed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequen=
cy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: i2c@200 (as=
peed,ast2600-i2c-bus): reg: [[512, 128]] is too short
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: gpio@1e78=
0000 (aspeed,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '=
', 'presence-ps0', 'power-chassis-good', '', '', '', '', 'presence-ps1', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', 'power-chassis-control', '', '', '',=
 '', '', 'jtag-mux', '', '', '', '', '', '', '', '', '', 'reset-button', 'p=
ower-button', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', 'tck-mux', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', 'nmi-button', '', '', '', '', '',=
 '', '', '', '', '', 'power-config-full-load', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/=
lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,a=
st2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: i2c@80 (a=
speed,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: i2c@80 (a=
speed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-freque=
ncy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: i2c@100 (=
aspeed,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: i2c@180 (=
aspeed,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: i2c@180 (=
aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequ=
ency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: i2c@200 (=
aspeed,ast2600-i2c-bus): reg: [[512, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: i2c@200 (=
aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequ=
ency' was unexpected)
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dts:105.19-134.4: W=
arning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #addre=
ss-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "rang=
es" property
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:631.36-635.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9000 (=
aspeed,ast2600-adc0): 'vref' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9100 (=
aspeed,ast2600-adc1): 'vref' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/lpc@1=
e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast260=
0-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c@80 (aspeed=
,ast2600-i2c-bus): reg: [[128, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c@80 (aspeed=
,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c@100 (aspee=
d,ast2600-i2c-bus): reg: [[256, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c@100 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c@180 (aspee=
d,ast2600-i2c-bus): reg: [[384, 128]] is too short
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: i2c@180 (aspee=
d,ast2600-i2c-bus): Unevaluated properties are not allowed ('bus-frequency'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.y=
aml
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: pca9535@20 (nx=
p,pca9535): '#address-cells', '#size-cells' do not match any of the regexes=
: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

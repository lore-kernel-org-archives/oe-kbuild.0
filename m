Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C7F38C435
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 23:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772579007; cv=none; b=OgEdTgVt0FM6b+PB1DQ3T593IVtdXF2MLii8WKBt3qZAiSXLdYfAgHPiemzlQvRH2uCiC5Z30z2UzkslrD4q3U3GcOJXEd22eLQVZRbSvpfe6NvZqDM5e3aX4AYV3ypnxVaNKY5rFCVdNnpvhO8uLTFAcdykuqYlSdujQ02q0VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772579007; c=relaxed/simple;
	bh=5e3RYnQ4TzJvHiI6kywd5hQ151bctU0Jw2SgJogZfUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NJmb148YgdhwzJVq2RXIJRJ1SPsJDKz2FVSapkcmMQkUQ72PvSPoCdbTs0x3ra24cwJ/SR/zwCpVU42Fyy+4QBzj8803EGajU18B8cTYOM4pwIVW3bsxe431RtZ6jVRTcH6ef8ZSYHj9DLgZtCyFAZ3fzobuKq+lDtZGxAG+Auo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ne/kfZqQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ne/kfZqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772579005; x=1804115005;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5e3RYnQ4TzJvHiI6kywd5hQ151bctU0Jw2SgJogZfUw=;
  b=ne/kfZqQR4FeqIM9ToQq0qUZ4hmkqWZ9kNwiAvXx6D7Z4JjwbLDRAxHw
   8hf2quzMaXMWNt/xQ9B9qOdwt03fEpwDd6NYAoxacd4XyCiyA5QDH/p1c
   5tZ7ippTKRA3nfjuyFP0ZnRCkos+7TONsrg3WDamAuPJIQb2XfqlgAlgE
   7LEI+njzYFaNIptHOzue4zU9lBUufufVZZSt3ADNazeAc7UTMlMMT0gZL
   uNzmnfQMGp+YYffcThW9ah7ff5VEd5HbjDKVZLPA6YVknVD9Tz92KGB6x
   berkt2bYj6hfoHhUCiHrqV8tIQLt1mxN/RHBnlf5zMGL9VT5dahAOs6wh
   g==;
X-CSE-ConnectionGUID: Lj0MLVCYQuSqtoTC5t0o7g==
X-CSE-MsgGUID: abz6jHWtRhSGK1v4I1c9xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73681531"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73681531"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 15:03:24 -0800
X-CSE-ConnectionGUID: Poh6wHA9TV+Z5juACeLX8g==
X-CSE-MsgGUID: +N3DwUTbQEWGbhTOnze61A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="217308310"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2026 15:03:22 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxYls-000000001ZN-28Ub;
	Tue, 03 Mar 2026 23:03:20 +0000
Date: Wed, 4 Mar 2026 00:03:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 01/11] dt-bindings: mfd: ti,bq25703a: Expand to include
 BQ25792
Message-ID: <202603032343.HMeJD6Ti-lkp@intel.com>
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
In-Reply-To: <20260303-bq25792-v1-1-e6e5e0033458@flipper.net>
References: <20260303-bq25792-v1-1-e6e5e0033458@flipper.net>
TO: Alexey Charkov <alchark@flipper.net>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Chris Morgan <macromorgan@hotmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Sebastian Reichel <sre@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: Alexey Charkov <alchark@flipper.net>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d517cb8cea012f43b069617fc8179b45404f8018]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bi=
ndings-mfd-ti-bq25703a-Expand-to-include-BQ25792/20260303-234353
base:   d517cb8cea012f43b069617fc8179b45404f8018
patch link:    https://lore.kernel.org/r/20260303-bq25792-v1-1-e6e5e0033458=
%40flipper.net
patch subject: [PATCH 01/11] dt-bindings: mfd: ti,bq25703a: Expand to inclu=
de BQ25792
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: microblaze-randconfig-2051-20260303 (https://download.01.org/0day-c=
i/archive/20260303/202603032343.HMeJD6Ti-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260303/202603032343.HMeJD6Ti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603032343.HMeJD6Ti-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: ignoring, error =
in schema: properties: allOf
--
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: properties: 'all=
Of' should not be valid under {'$ref': '#/definitions/json-schema-prop-name=
s'}
   	hint: A json-schema keyword was found instead of a DT property name.
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: properties:allOf=
: [{'if': {'properties': {'compatible': {'const': 'ti,bq25703a'}}}, 'then':=
 {'properties': {'input-current-limit-microamp': {'minimum': 500000, 'maxim=
um': 6350000, 'default': 5000000}, 'regulators': {'properties': {'vbus': {'=
properties': {'regulator-min-microamp': {'minimum': 0, 'maximum': 6350000},=
 'regulator-max-microamp': {'minimum': 0, 'maximum': 6350000}, 'regulator-m=
in-microvolt': {'minimum': 4480000, 'maximum': 20800000}, 'regulator-max-mi=
crovolt': {'minimum': 4480000, 'maximum': 20800000}}}}}}}}, {'if': {'proper=
ties': {'compatible': {'const': 'ti,bq25792'}}}, 'then': {'properties': {'i=
nput-current-limit-microamp': {'minimum': 1000000, 'maximum': 3300000, 'def=
ault': 3000000}, 'regulators': {'properties': {'vbus': {'properties': {'reg=
ulator-min-microamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-max-mi=
croamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-min-microvolt': {'m=
inimum': 2800000, 'maximum': 22000000}, 'regulator-max-microvolt': {'minimu=
m': 2800000, 'maximum': 22000000}}}}}}}}] is not of type 'object', 'boolean'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: properties:allOf=
: [{'if': {'properties': {'compatible': {'const': 'ti,bq25703a'}}}, 'then':=
 {'properties': {'input-current-limit-microamp': {'minimum': 500000, 'maxim=
um': 6350000, 'default': 5000000}, 'regulators': {'properties': {'vbus': {'=
properties': {'regulator-min-microamp': {'minimum': 0, 'maximum': 6350000},=
 'regulator-max-microamp': {'minimum': 0, 'maximum': 6350000}, 'regulator-m=
in-microvolt': {'minimum': 4480000, 'maximum': 20800000}, 'regulator-max-mi=
crovolt': {'minimum': 4480000, 'maximum': 20800000}}}}}}}}, {'if': {'proper=
ties': {'compatible': {'const': 'ti,bq25792'}}}, 'then': {'properties': {'i=
nput-current-limit-microamp': {'minimum': 1000000, 'maximum': 3300000, 'def=
ault': 3000000}, 'regulators': {'properties': {'vbus': {'properties': {'reg=
ulator-min-microamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-max-mi=
croamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-min-microvolt': {'m=
inimum': 2800000, 'maximum': 22000000}, 'regulator-max-microvolt': {'minimu=
m': 2800000, 'maximum': 22000000}}}}}}}}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: properties:allOf=
: [{'if': {'properties': {'compatible': {'const': 'ti,bq25703a'}}}, 'then':=
 {'properties': {'input-current-limit-microamp': {'minimum': 500000, 'maxim=
um': 6350000, 'default': 5000000}, 'regulators': {'properties': {'vbus': {'=
properties': {'regulator-min-microamp': {'minimum': 0, 'maximum': 6350000},=
 'regulator-max-microamp': {'minimum': 0, 'maximum': 6350000}, 'regulator-m=
in-microvolt': {'minimum': 4480000, 'maximum': 20800000}, 'regulator-max-mi=
crovolt': {'minimum': 4480000, 'maximum': 20800000}}}}}}}}, {'if': {'proper=
ties': {'compatible': {'const': 'ti,bq25792'}}}, 'then': {'properties': {'i=
nput-current-limit-microamp': {'minimum': 1000000, 'maximum': 3300000, 'def=
ault': 3000000}, 'regulators': {'properties': {'vbus': {'properties': {'reg=
ulator-min-microamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-max-mi=
croamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-min-microvolt': {'m=
inimum': 2800000, 'maximum': 22000000}, 'regulator-max-microvolt': {'minimu=
m': 2800000, 'maximum': 22000000}}}}}}}}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: properties:allOf=
: [{'if': {'properties': {'compatible': {'const': 'ti,bq25703a'}}}, 'then':=
 {'properties': {'input-current-limit-microamp': {'minimum': 500000, 'maxim=
um': 6350000, 'default': 5000000}, 'regulators': {'properties': {'vbus': {'=
properties': {'regulator-min-microamp': {'minimum': 0, 'maximum': 6350000},=
 'regulator-max-microamp': {'minimum': 0, 'maximum': 6350000}, 'regulator-m=
in-microvolt': {'minimum': 4480000, 'maximum': 20800000}, 'regulator-max-mi=
crovolt': {'minimum': 4480000, 'maximum': 20800000}}}}}}}}, {'if': {'proper=
ties': {'compatible': {'const': 'ti,bq25792'}}}, 'then': {'properties': {'i=
nput-current-limit-microamp': {'minimum': 1000000, 'maximum': 3300000, 'def=
ault': 3000000}, 'regulators': {'properties': {'vbus': {'properties': {'reg=
ulator-min-microamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-max-mi=
croamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-min-microvolt': {'m=
inimum': 2800000, 'maximum': 22000000}, 'regulator-max-microvolt': {'minimu=
m': 2800000, 'maximum': 22000000}}}}}}}}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: properties:allOf=
: [{'if': {'properties': {'compatible': {'const': 'ti,bq25703a'}}}, 'then':=
 {'properties': {'input-current-limit-microamp': {'minimum': 500000, 'maxim=
um': 6350000, 'default': 5000000}, 'regulators': {'properties': {'vbus': {'=
properties': {'regulator-min-microamp': {'minimum': 0, 'maximum': 6350000},=
 'regulator-max-microamp': {'minimum': 0, 'maximum': 6350000}, 'regulator-m=
in-microvolt': {'minimum': 4480000, 'maximum': 20800000}, 'regulator-max-mi=
crovolt': {'minimum': 4480000, 'maximum': 20800000}}}}}}}}, {'if': {'proper=
ties': {'compatible': {'const': 'ti,bq25792'}}}, 'then': {'properties': {'i=
nput-current-limit-microamp': {'minimum': 1000000, 'maximum': 3300000, 'def=
ault': 3000000}, 'regulators': {'properties': {'vbus': {'properties': {'reg=
ulator-min-microamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-max-mi=
croamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-min-microvolt': {'m=
inimum': 2800000, 'maximum': 22000000}, 'regulator-max-microvolt': {'minimu=
m': 2800000, 'maximum': 22000000}}}}}}}}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: properties:allOf=
: [{'if': {'properties': {'compatible': {'const': 'ti,bq25703a'}}}, 'then':=
 {'properties': {'input-current-limit-microamp': {'minimum': 500000, 'maxim=
um': 6350000, 'default': 5000000}, 'regulators': {'properties': {'vbus': {'=
properties': {'regulator-min-microamp': {'minimum': 0, 'maximum': 6350000},=
 'regulator-max-microamp': {'minimum': 0, 'maximum': 6350000}, 'regulator-m=
in-microvolt': {'minimum': 4480000, 'maximum': 20800000}, 'regulator-max-mi=
crovolt': {'minimum': 4480000, 'maximum': 20800000}}}}}}}}, {'if': {'proper=
ties': {'compatible': {'const': 'ti,bq25792'}}}, 'then': {'properties': {'i=
nput-current-limit-microamp': {'minimum': 1000000, 'maximum': 3300000, 'def=
ault': 3000000}, 'regulators': {'properties': {'vbus': {'properties': {'reg=
ulator-min-microamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-max-mi=
croamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-min-microvolt': {'m=
inimum': 2800000, 'maximum': 22000000}, 'regulator-max-microvolt': {'minimu=
m': 2800000, 'maximum': 22000000}}}}}}}}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: properties:allOf=
: [{'if': {'properties': {'compatible': {'const': 'ti,bq25703a'}}}, 'then':=
 {'properties': {'input-current-limit-microamp': {'minimum': 500000, 'maxim=
um': 6350000, 'default': 5000000}, 'regulators': {'properties': {'vbus': {'=
properties': {'regulator-min-microamp': {'minimum': 0, 'maximum': 6350000},=
 'regulator-max-microamp': {'minimum': 0, 'maximum': 6350000}, 'regulator-m=
in-microvolt': {'minimum': 4480000, 'maximum': 20800000}, 'regulator-max-mi=
crovolt': {'minimum': 4480000, 'maximum': 20800000}}}}}}}}, {'if': {'proper=
ties': {'compatible': {'const': 'ti,bq25792'}}}, 'then': {'properties': {'i=
nput-current-limit-microamp': {'minimum': 1000000, 'maximum': 3300000, 'def=
ault': 3000000}, 'regulators': {'properties': {'vbus': {'properties': {'reg=
ulator-min-microamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-max-mi=
croamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-min-microvolt': {'m=
inimum': 2800000, 'maximum': 22000000}, 'regulator-max-microvolt': {'minimu=
m': 2800000, 'maximum': 22000000}}}}}}}}] is not of type 'object', 'boolean'
>> Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml: properties:allOf=
: [{'if': {'properties': {'compatible': {'const': 'ti,bq25703a'}}}, 'then':=
 {'properties': {'input-current-limit-microamp': {'minimum': 500000, 'maxim=
um': 6350000, 'default': 5000000}, 'regulators': {'properties': {'vbus': {'=
properties': {'regulator-min-microamp': {'minimum': 0, 'maximum': 6350000},=
 'regulator-max-microamp': {'minimum': 0, 'maximum': 6350000}, 'regulator-m=
in-microvolt': {'minimum': 4480000, 'maximum': 20800000}, 'regulator-max-mi=
crovolt': {'minimum': 4480000, 'maximum': 20800000}}}}}}}}, {'if': {'proper=
ties': {'compatible': {'const': 'ti,bq25792'}}}, 'then': {'properties': {'i=
nput-current-limit-microamp': {'minimum': 1000000, 'maximum': 3300000, 'def=
ault': 3000000}, 'regulators': {'properties': {'vbus': {'properties': {'reg=
ulator-min-microamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-max-mi=
croamp': {'minimum': 0, 'maximum': 3320000}, 'regulator-min-microvolt': {'m=
inimum': 2800000, 'maximum': 22000000}, 'regulator-max-microvolt': {'minimu=
m': 2800000, 'maximum': 22000000}}}}}}}}] is not of type 'object', 'boolean'
   Traceback (most recent call last):
     File "/usr/local/bin/dt-doc-validate", line 8, in <module>
       sys.exit(main())
                ~~~~^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py=
", line 66, in main
       ret |=3D check_doc(f)
              ~~~~~~~~~^^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py=
", line 37, in check_doc
       dtsch.check_schema_refs()
       ~~~~~~~~~~~~~~~~~~~~~~~^^

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

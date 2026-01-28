Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512BA2AF1B
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 01:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769563124; cv=none; b=Uj3AYar4wQB+o5Nm05zyTNvhb0y4YLxuNLXgtQLUn92qI6ePGB8x4reyacxkp4eIU99iHC/OGqKGtGEedPxkULFkaDHuv1IDgN7WATzewNHfwRlG2ZDhMjAHWOctHGga94D/jR0QlT8ZdtfvHDwlhK+9ndJp4J6ngMOypvdI1QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769563124; c=relaxed/simple;
	bh=WlUpecIIEPg31DzqtWEKzFLoeDv0H9/dqrcITxxB35k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QdoZdxbTeulqbD9dROkTK/CrdpbwA+Iyr+52j/QrVHMhDPul8YtRzXx/2FwlEEsW4V80ZJzwjqJITEiIbxbCD1UA3AKvRktd3welaRtrqwxEPw26MRcRGvbZQLEiC3oAi+32yXNTMxdCAvkqtiISHiGLuoX3QFQ0TzTPHy3e85A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDi28IPB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDi28IPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769563122; x=1801099122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WlUpecIIEPg31DzqtWEKzFLoeDv0H9/dqrcITxxB35k=;
  b=YDi28IPBgjRCOTHeeQfx2m7IAKjMD5Pq7HbubXFhWNlPa39IweylcnSN
   Akiq6wFI5uG4FhRWsGorpwoIrIUL6+x8gldBJaRpLgP8GFOYKtnpSE7lp
   dxbaO1ugaD2oYkofoXbpewAS1zzgjDO4DOmJFYSKqjmVXEXaIWOrDE3Nd
   a3hW54+GbCF+G2vrlRsBA1DTZ9FtiF5SAr1KZHThaIHs+jQy4MPOk87sX
   YTim/oYRfRf3EdIFr2t22pDWGUqzAFN3mm9uPw1Z30M7zSKr8R62YEM0y
   xdEMdvAm7AHQbkJVn2K4G4C7QLeyRT+Izk9O0KvJ5UFBztdmV757lQpJM
   g==;
X-CSE-ConnectionGUID: d96e+7DYRLi5yHg6XOIDMw==
X-CSE-MsgGUID: 4Sld/+vgRmWL81AMLsOhyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70672405"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70672405"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 17:18:41 -0800
X-CSE-ConnectionGUID: 5D/pL+0qRcOnNBoR/he7YQ==
X-CSE-MsgGUID: Zm754t56TF2Nb/jLzpxm3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212986978"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 17:18:41 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkuCc-000000001xl-3LNw;
	Wed, 28 Jan 2026 01:18:38 +0000
Date: Wed, 28 Jan 2026 02:17:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl:
 Add SA8775P and QCS8300 pinctrl
Message-ID: <202601280223.phpgEd6Y-lkp@intel.com>
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
In-Reply-To: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
TO: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Linus Walleij <linusw@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Srinivas Kandagatla <srini@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Mohammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next robh/for-next linus/master v6.16-rc1 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammad-Rafi-Shaik/dt-bindings-pinctrl-qcom-sm8450-lpass-lpi-pinctrl-Add-SA8775P-and-QCS8300-pinctrl/20260127-185807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20260127105511.3917491-1-mohammad.rafi.shaik%40oss.qualcomm.com
patch subject: [PATCH v3] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl: Add SA8775P and QCS8300 pinctrl
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: openrisc-randconfig-2051-20260127 (https://download.01.org/0day-ci/archive/20260128/202601280223.phpgEd6Y-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280223.phpgEd6Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601280223.phpgEd6Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf:1: {'items': [{'enum': ['qcom,qcs8300-lpass-lpi-pinctrl', 'qcom,sa8775p-lpass-lpi-pinctrl']}, {'const': 'qcom,sm8450-lpass-lpi-pinctrl'}], 'minItems': 1, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml
>> Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf:1: {'items': [{'enum': ['qcom,qcs8300-lpass-lpi-pinctrl', 'qcom,sa8775p-lpass-lpi-pinctrl']}, {'const': 'qcom,sm8450-lpass-lpi-pinctrl'}], 'minItems': 1, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

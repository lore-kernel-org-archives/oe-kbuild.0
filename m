Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D91173
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754159854; cv=none; b=GQoKvuPydfb5u/qcHl6IbLV/O7fa7Z64QsAVEudmKsg3CHOWv91ppXbLzhP51I9vZ40rgbhR/QCcYYGwFt77n84kUnZdcPmfZt3R65ep0iMIAWW5+PfwKVDfwr82osajzEUj2E9uRDpDC7seOHW9lYiWrEPBRKc4uapoRRIZ+QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754159854; c=relaxed/simple;
	bh=ENBEAoQr7LtIvW7IIn4pcfgzwmPEnjH5rhseWWTcw1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpUVlkWduPbKKrxJqX59HQQVOExzwAi711RM14RhhilZH3RwPdJwzoGOHcqjLMru6c/ZjGsb2VZObATNHtBH0dRtH1kAAQyQbS7c6db76Bp13x/bOf+1Fy2vMQy8lXZtkvY1PohnHrnVQ6dwyU/qEQ1PwBjR245dspBFWnbod4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0BELDYe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0BELDYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754159853; x=1785695853;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ENBEAoQr7LtIvW7IIn4pcfgzwmPEnjH5rhseWWTcw1I=;
  b=E0BELDYebGBO4GeLt1iNZpGkK5u+gGK5gehyqgAx+f99YF23nAyfTYih
   1jiii6U6XxkW1TMlEjZ1m1jsaXFtYMQobUXWJPjKsf5nqn1dfzpZe1Kb4
   YyOzj9IP2uFtPs5pBzrzk4Knv0GFJUYHYloaPW04EHi7FiYZRvcO4okfh
   1XKwKuAAoykCK8qNTKGwhHulR2wysF7n0Hoi+GyRyLspP2B8/h/SK9kW0
   kyU2Wtzz5n0w1HnmQe7cd9UqKcajW/iRQuHlLErj9KuJC+M1jLwD03y97
   VAQEdWXigO336wD+u/7y8rG6es0Z5Hq2s7arAYedtxqZhKSOZR6k5oTxH
   A==;
X-CSE-ConnectionGUID: BdV0MJi7RYeVQCvxxx0Nvw==
X-CSE-MsgGUID: q17RpkZzSbaYytJ9u5b9ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="67170232"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67170232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 11:37:32 -0700
X-CSE-ConnectionGUID: 2czejBVsRzeInZ3rw2267w==
X-CSE-MsgGUID: xqcI5EbWTS2Pfm8nMkmhCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194660482"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Aug 2025 11:37:31 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiH6n-0005Y0-1h;
	Sat, 02 Aug 2025 18:37:29 +0000
Date: Sun, 3 Aug 2025 02:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] dt-bindings: iio: magnetometer: document Infineon
 TLV493D 3D Magnetic sensor
Message-ID: <202508030225.bOQnZKTc-lkp@intel.com>
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
In-Reply-To: <20250802-tlv493d-sensor-v6_16-rc5-v2-2-e867df86ad93@gmail.com>
References: <20250802-tlv493d-sensor-v6_16-rc5-v2-2-e867df86ad93@gmail.com>
TO: Dixit Parmar <dixitparmar19@gmail.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Dixit Parmar <dixitparmar19@gmail.com>

Hi Dixit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7b8f8e20813f0179d8ef519541a3527e7661d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dixit-Parmar/iio-magnetometer-add-support-for-Infineon-TLV493D-3D-Magentic-sensor/20250802-144615
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250802-tlv493d-sensor-v6_16-rc5-v2-2-e867df86ad93%40gmail.com
patch subject: [PATCH v2 2/2] dt-bindings: iio: magnetometer: document Infineon TLV493D 3D Magnetic sensor
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arc-randconfig-051-20250803 (https://download.01.org/0day-ci/archive/20250803/202508030225.bOQnZKTc-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030225.bOQnZKTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508030225.bOQnZKTc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/magnetometer/infineon,tlv493d.yaml: vdd: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

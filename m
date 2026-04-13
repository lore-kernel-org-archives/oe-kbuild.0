Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF521C68F
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 23:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776124317; cv=none; b=epH0qHki77TnDEl5G+1KbryiNTGiwV5h80uarV4sxVPiu6SSFO2zGX2QT8PVg2PGqUS9gz0uMscx6JZghU5UpHzX7RM44DYey+qlpRZM7iGoWj1pW1pg3N/3nxA0DrxFc8TND/ogvoPhFQKNhr2RgXg9IU/iAoiQjwqlYj7RV2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776124317; c=relaxed/simple;
	bh=126q2X8oyQOMy4bhqEN01CU/5nUiDLVs0d1RqvbyuKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tDfyTJUHVkS4puyNgGyVJeH/k7QMU/uj2Kxh39vh263dJxABrI/8AvqP4gFKINnWFZd6jP259+3iHu29iQD1h1Ue1V+q0EaEox6j0Eof8F3a6shdKFDe0WBbNli3SIeTYLX2EijDwv21NSlfGc2fu0hbsbH0TkzaD4wYqGt+VWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWpSgPYv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWpSgPYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776124315; x=1807660315;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=126q2X8oyQOMy4bhqEN01CU/5nUiDLVs0d1RqvbyuKc=;
  b=HWpSgPYvX8ahJ/dO1SHNdBI36n4OtDIJG7lo+hy+VKvBJyJMsV8STTjt
   V3KlsyPj5SkDrjZmyMRcwIC5cctcBEuf/JP/4D2RwHGbvkw1i2+jTEChp
   GUX1XePnmgm5TX2ksfbRw4IuEf2oQVVMW9QRFIgtd1ta86SXR6DA91iZu
   p+vW/ys/4RTXjYDw1HmSOeRyCnVac4eJymJT7JmvBo4kVTDYhMhu2LLe3
   7ewDesp+zBbq88DV8wgwzJNHdQb9Y3wbsF//RM6zroOwMV0dFIWzvGdOi
   xnQHLvUWrcR8AgQzyiNkvU8cAtVhHU30KTP4vr1pDw8ODdyl8qy8/yZHo
   g==;
X-CSE-ConnectionGUID: F8gkmYrESTuxYYOiN7Ob0g==
X-CSE-MsgGUID: eLlrHwmzRauywzoIX4yiAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80933624"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="80933624"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 16:51:54 -0700
X-CSE-ConnectionGUID: EygIbR1rSxyFf0pHN70pag==
X-CSE-MsgGUID: TT/OqYyfRvKBBiytlKoq8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="253311140"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Apr 2026 16:51:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCR4I-000000000F7-3na7;
	Mon, 13 Apr 2026 23:51:50 +0000
Date: Tue, 14 Apr 2026 01:50:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] iio: dac: mcp47feb02: add MCP48FEB02 SPI driver to
 MCP47FEB02 I2C driver
Message-ID: <202604140142.SG6H9dEr-lkp@intel.com>
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
In-Reply-To: <20260403-mcp47feb02-fix2-v1-2-da60c773550e@microchip.com>
References: <20260403-mcp47feb02-fix2-v1-2-da60c773550e@microchip.com>
TO: Ariana Lazar <ariana.lazar@microchip.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Ariana Lazar <ariana.lazar@microchip.com>

Hi Ariana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8625d418d24bc0ff463267b26b7cb2e7a612495f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariana-Lazar/dt-bindings-iio-dac-add-support-for-Microchip-MCP48FEB02-to-MCP47FEB02/20260413-201326
base:   8625d418d24bc0ff463267b26b7cb2e7a612495f
patch link:    https://lore.kernel.org/r/20260403-mcp47feb02-fix2-v1-2-da60c773550e%40microchip.com
patch subject: [PATCH 2/2] iio: dac: mcp47feb02: add MCP48FEB02 SPI driver to MCP47FEB02 I2C driver
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: openrisc-randconfig-2052-20260413 (https://download.01.org/0day-ci/archive/20260414/202604140142.SG6H9dEr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140142.SG6H9dEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604140142.SG6H9dEr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml:245:22: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +245 Documentation/devicetree/bindings/iio/dac/microchip,mcp47feb02.yaml

4ba12d304175fd Ariana Lazar 2025-12-16    8  
4ba12d304175fd Ariana Lazar 2025-12-16    9  maintainers:
4ba12d304175fd Ariana Lazar 2025-12-16   10    - Ariana Lazar <ariana.lazar@microchip.com>
4ba12d304175fd Ariana Lazar 2025-12-16   11  
4ba12d304175fd Ariana Lazar 2025-12-16   12  description: |
09f9e21614c4bf Ariana Lazar 2026-04-03   13    Datasheets for MCP47F(E/V)B(0/1/2)(1/2/4/8) DAC with I2C Interface Families:
4ba12d304175fd Ariana Lazar 2025-12-16   14     Datasheet for MCP47FEB01, MCP47FEB11, MCP47FEB21, MCP47FEB02, MCP47FEB12,
4ba12d304175fd Ariana Lazar 2025-12-16   15     MCP47FEB22 can be found here:
4ba12d304175fd Ariana Lazar 2025-12-16   16       https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/20005375A.pdf
4ba12d304175fd Ariana Lazar 2025-12-16   17     Datasheet for MCP47FVB01, MCP47FVB11, MCP47FVB21, MCP47FVB02, MCP47FVB12,
4ba12d304175fd Ariana Lazar 2025-12-16   18     MCP47FVB22 can be found here:
4ba12d304175fd Ariana Lazar 2025-12-16   19       https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/20005405A.pdf
4ba12d304175fd Ariana Lazar 2025-12-16   20     Datasheet for MCP47FEB04, MCP47FEB14, MCP47FEB24, MCP47FEB08, MCP47FEB18,
4ba12d304175fd Ariana Lazar 2025-12-16   21     MCP47FEB28, MCP47FVB04, MCP47FVB14, MCP47FVB24, MCP47FVB08, MCP47FVB18,
4ba12d304175fd Ariana Lazar 2025-12-16   22     MCP47FVB28 can be found here:
4ba12d304175fd Ariana Lazar 2025-12-16   23       https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP47FXBX48-Data-Sheet-DS200006368A.pdf
09f9e21614c4bf Ariana Lazar 2026-04-03   24     Datasheets for MCP48F(E/V)B(0/1/2)(1/2/4/8) DAC with SPI Interface Families:
09f9e21614c4bf Ariana Lazar 2026-04-03   25     Datasheet for MCP48FEB01, MCP48FEB02, MCP48FEB11, MCP48FEB12, MCP48FEB21,
09f9e21614c4bf Ariana Lazar 2026-04-03   26     MCP48FEB22 can be found here:
09f9e21614c4bf Ariana Lazar 2026-04-03   27       https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/20005429B.pdf
09f9e21614c4bf Ariana Lazar 2026-04-03   28     Datasheet for MCP48FVB01, MCP48FVB02, MCP48FVB11, MCP48FVB12, MCP48FVB21,
09f9e21614c4bf Ariana Lazar 2026-04-03   29     MCP48FVB22 can be found here:
09f9e21614c4bf Ariana Lazar 2026-04-03   30       https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/20005466A.pdf
09f9e21614c4bf Ariana Lazar 2026-04-03   31     Datasheet for MCP48FEB04, MCP48FEB14, MCP48FEB24, MCP48FEB08, MCP48FEB18,
09f9e21614c4bf Ariana Lazar 2026-04-03   32     MCP48FEB28, MCP48FVB04, MCP48FVB14, MCP48FVB24, MCP48FVB08, MCP48FVB18,
09f9e21614c4bf Ariana Lazar 2026-04-03   33     MCP48FVB28 can be found here:
09f9e21614c4bf Ariana Lazar 2026-04-03   34       https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP48FXBX4-8-Family-Data-Sheet-DS20006362A.pdf
4ba12d304175fd Ariana Lazar 2025-12-16   35  
09f9e21614c4bf Ariana Lazar 2026-04-03   36    +------------+--------------+-------------+-------------+------------+------------+
09f9e21614c4bf Ariana Lazar 2026-04-03   37    | Device     |  Resolution  |   Channels  | Vref number |   Memory   | Interface  |
09f9e21614c4bf Ariana Lazar 2026-04-03   38    |------------|--------------|-------------|-------------|------------|------------|
09f9e21614c4bf Ariana Lazar 2026-04-03   39    | MCP47FEB01 |              |      1      |      1      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   40    | MCP47FEB02 |              |      2      |      1      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   41    | MCP47FEB04 |              |      4      |      2      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   42    | MCP47FEB08 |     8-bit    |      8      |      2      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   43    | MCP48FEB01 |              |      1      |      1      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   44    | MCP48FEB02 |              |      2      |      1      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   45    | MCP48FEB04 |              |      4      |      2      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   46    | MCP48FEB08 |              |      8      |      2      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   47    |------------|--------------|-------------|-------------|------------|------------|
09f9e21614c4bf Ariana Lazar 2026-04-03   48    | MCP47FEB11 |              |      1      |      1      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   49    | MCP47FEB12 |              |      2      |      1      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   50    | MCP47FEB14 |              |      4      |      2      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   51    | MCP47FEB18 |    10-bit    |      8      |      2      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   52    | MCP48FEB11 |              |      1      |      1      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   53    | MCP48FEB12 |              |      2      |      1      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   54    | MCP48FEB14 |              |      4      |      2      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   55    | MCP48FEB18 |              |      8      |      2      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   56    |------------|--------------|-------------|-------------|------------|------------|
09f9e21614c4bf Ariana Lazar 2026-04-03   57    | MCP47FEB21 |              |      1      |      1      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   58    | MCP47FEB22 |              |      2      |      1      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   59    | MCP47FEB24 |              |      4      |      2      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   60    | MCP47FEB28 |    12-bit    |      8      |      2      |   EEPROM   |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   61    | MCP48FEB21 |              |      1      |      1      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   62    | MCP48FEB22 |              |      2      |      1      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   63    | MCP48FEB24 |              |      4      |      2      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   64    | MCP48FEB28 |              |      8      |      2      |   EEPROM   |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   65    |------------|--------------|-------------|-------------|------------|------------|
09f9e21614c4bf Ariana Lazar 2026-04-03   66    | MCP47FVB01 |              |      1      |      1      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   67    | MCP47FVB02 |              |      2      |      1      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   68    | MCP47FVB04 |              |      4      |      2      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   69    | MCP47FVB08 |     8-bit    |      8      |      2      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   70    | MCP48FVB01 |              |      1      |      1      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   71    | MCP48FVB02 |              |      2      |      1      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   72    | MCP48FVB04 |              |      4      |      2      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   73    | MCP48FVB08 |              |      8      |      2      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   74    |------------|--------------|-------------|-------------|------------|------------|
09f9e21614c4bf Ariana Lazar 2026-04-03   75    | MCP47FVB11 |              |      1      |      1      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   76    | MCP47FVB12 |              |      2      |      1      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   77    | MCP47FVB14 |              |      4      |      2      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   78    | MCP47FVB18 |    10-bit    |      8      |      2      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   79    | MCP48FVB11 |              |      1      |      1      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   80    | MCP48FVB12 |              |      2      |      1      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   81    | MCP48FVB14 |              |      4      |      2      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   82    | MCP48FVB18 |              |      8      |      2      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   83    |------------|--------------|-------------|-------------|------------|------------|
09f9e21614c4bf Ariana Lazar 2026-04-03   84    | MCP47FVB21 |              |      1      |      1      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   85    | MCP47FVB22 |              |      2      |      1      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   86    | MCP47FVB24 |              |      4      |      2      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   87    | MCP47FVB28 |    12-bit    |      8      |      2      |   RAM      |    I2C     |
09f9e21614c4bf Ariana Lazar 2026-04-03   88    | MCP48FVB21 |              |      1      |      1      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   89    | MCP48FVB22 |              |      2      |      1      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   90    | MCP48FVB24 |              |      4      |      2      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   91    | MCP48FVB28 |              |      8      |      2      |   RAM      |    SPI     |
09f9e21614c4bf Ariana Lazar 2026-04-03   92    +------------+--------------+-------------+-------------+------------+------------+
4ba12d304175fd Ariana Lazar 2025-12-16   93  
4ba12d304175fd Ariana Lazar 2025-12-16   94  properties:
4ba12d304175fd Ariana Lazar 2025-12-16   95    compatible:
4ba12d304175fd Ariana Lazar 2025-12-16   96      enum:
4ba12d304175fd Ariana Lazar 2025-12-16   97        - microchip,mcp47feb01
4ba12d304175fd Ariana Lazar 2025-12-16   98        - microchip,mcp47feb02
09f9e21614c4bf Ariana Lazar 2026-04-03   99        - microchip,mcp47feb04
09f9e21614c4bf Ariana Lazar 2026-04-03  100        - microchip,mcp47feb08
09f9e21614c4bf Ariana Lazar 2026-04-03  101        - microchip,mcp47feb11
4ba12d304175fd Ariana Lazar 2025-12-16  102        - microchip,mcp47feb12
09f9e21614c4bf Ariana Lazar 2026-04-03  103        - microchip,mcp47feb14
09f9e21614c4bf Ariana Lazar 2026-04-03  104        - microchip,mcp47feb18
09f9e21614c4bf Ariana Lazar 2026-04-03  105        - microchip,mcp47feb21
4ba12d304175fd Ariana Lazar 2025-12-16  106        - microchip,mcp47feb22
09f9e21614c4bf Ariana Lazar 2026-04-03  107        - microchip,mcp47feb24
09f9e21614c4bf Ariana Lazar 2026-04-03  108        - microchip,mcp47feb28
4ba12d304175fd Ariana Lazar 2025-12-16  109        - microchip,mcp47fvb01
4ba12d304175fd Ariana Lazar 2025-12-16  110        - microchip,mcp47fvb02
4ba12d304175fd Ariana Lazar 2025-12-16  111        - microchip,mcp47fvb04
4ba12d304175fd Ariana Lazar 2025-12-16  112        - microchip,mcp47fvb08
09f9e21614c4bf Ariana Lazar 2026-04-03  113        - microchip,mcp47fvb11
09f9e21614c4bf Ariana Lazar 2026-04-03  114        - microchip,mcp47fvb12
09f9e21614c4bf Ariana Lazar 2026-04-03  115        - microchip,mcp47fvb14
4ba12d304175fd Ariana Lazar 2025-12-16  116        - microchip,mcp47fvb18
09f9e21614c4bf Ariana Lazar 2026-04-03  117        - microchip,mcp47fvb21
09f9e21614c4bf Ariana Lazar 2026-04-03  118        - microchip,mcp47fvb22
09f9e21614c4bf Ariana Lazar 2026-04-03  119        - microchip,mcp47fvb24
4ba12d304175fd Ariana Lazar 2025-12-16  120        - microchip,mcp47fvb28
09f9e21614c4bf Ariana Lazar 2026-04-03  121        - microchip,mcp48feb01
09f9e21614c4bf Ariana Lazar 2026-04-03  122        - microchip,mcp48feb02
09f9e21614c4bf Ariana Lazar 2026-04-03  123        - microchip,mcp48feb04
09f9e21614c4bf Ariana Lazar 2026-04-03  124        - microchip,mcp48feb08
09f9e21614c4bf Ariana Lazar 2026-04-03  125        - microchip,mcp48feb11
09f9e21614c4bf Ariana Lazar 2026-04-03  126        - microchip,mcp48feb12
09f9e21614c4bf Ariana Lazar 2026-04-03  127        - microchip,mcp48feb14
09f9e21614c4bf Ariana Lazar 2026-04-03  128        - microchip,mcp48feb18
09f9e21614c4bf Ariana Lazar 2026-04-03  129        - microchip,mcp48feb21
09f9e21614c4bf Ariana Lazar 2026-04-03  130        - microchip,mcp48feb22
09f9e21614c4bf Ariana Lazar 2026-04-03  131        - microchip,mcp48feb24
09f9e21614c4bf Ariana Lazar 2026-04-03  132        - microchip,mcp48feb28
09f9e21614c4bf Ariana Lazar 2026-04-03  133        - microchip,mcp48fvb01
09f9e21614c4bf Ariana Lazar 2026-04-03  134        - microchip,mcp48fvb02
09f9e21614c4bf Ariana Lazar 2026-04-03  135        - microchip,mcp48fvb04
09f9e21614c4bf Ariana Lazar 2026-04-03  136        - microchip,mcp48fvb08
09f9e21614c4bf Ariana Lazar 2026-04-03  137        - microchip,mcp48fvb11
09f9e21614c4bf Ariana Lazar 2026-04-03  138        - microchip,mcp48fvb12
09f9e21614c4bf Ariana Lazar 2026-04-03  139        - microchip,mcp48fvb14
09f9e21614c4bf Ariana Lazar 2026-04-03  140        - microchip,mcp48fvb18
09f9e21614c4bf Ariana Lazar 2026-04-03  141        - microchip,mcp48fvb21
09f9e21614c4bf Ariana Lazar 2026-04-03  142        - microchip,mcp48fvb22
09f9e21614c4bf Ariana Lazar 2026-04-03  143        - microchip,mcp48fvb24
09f9e21614c4bf Ariana Lazar 2026-04-03  144        - microchip,mcp48fvb28
4ba12d304175fd Ariana Lazar 2025-12-16  145  
4ba12d304175fd Ariana Lazar 2025-12-16  146    reg:
4ba12d304175fd Ariana Lazar 2025-12-16  147      maxItems: 1
4ba12d304175fd Ariana Lazar 2025-12-16  148  
09f9e21614c4bf Ariana Lazar 2026-04-03  149    spi-max-frequency:
09f9e21614c4bf Ariana Lazar 2026-04-03  150      maximum: 10000000
09f9e21614c4bf Ariana Lazar 2026-04-03  151  
4ba12d304175fd Ariana Lazar 2025-12-16  152    "#address-cells":
4ba12d304175fd Ariana Lazar 2025-12-16  153      const: 1
4ba12d304175fd Ariana Lazar 2025-12-16  154  
4ba12d304175fd Ariana Lazar 2025-12-16  155    "#size-cells":
4ba12d304175fd Ariana Lazar 2025-12-16  156      const: 0
4ba12d304175fd Ariana Lazar 2025-12-16  157  
4ba12d304175fd Ariana Lazar 2025-12-16  158    vdd-supply:
4ba12d304175fd Ariana Lazar 2025-12-16  159      description:
4ba12d304175fd Ariana Lazar 2025-12-16  160        Provides power to the chip and it could be used as reference voltage. The
4ba12d304175fd Ariana Lazar 2025-12-16  161        voltage is used to calculate scale. For parts without EEPROM at powerup
4ba12d304175fd Ariana Lazar 2025-12-16  162        this will be the selected as voltage reference.
4ba12d304175fd Ariana Lazar 2025-12-16  163  
4ba12d304175fd Ariana Lazar 2025-12-16  164    vref-supply:
4ba12d304175fd Ariana Lazar 2025-12-16  165      description: |
4ba12d304175fd Ariana Lazar 2025-12-16  166        Vref pin (it could be found as Vref0 into the datasheet) may be used as a
4ba12d304175fd Ariana Lazar 2025-12-16  167        voltage reference when this supply is specified. The internal reference
4ba12d304175fd Ariana Lazar 2025-12-16  168        will be taken into account for voltage reference besides VDD if this supply
4ba12d304175fd Ariana Lazar 2025-12-16  169        does not exist.
4ba12d304175fd Ariana Lazar 2025-12-16  170  
4ba12d304175fd Ariana Lazar 2025-12-16  171        This supply will be voltage reference for the following outputs:
4ba12d304175fd Ariana Lazar 2025-12-16  172          - for single-channel device: Vout0;
4ba12d304175fd Ariana Lazar 2025-12-16  173          - for dual-channel device: Vout0, Vout1;
4ba12d304175fd Ariana Lazar 2025-12-16  174          - for quad-channel device: Vout0, Vout2;
09f9e21614c4bf Ariana Lazar 2026-04-03  175          - for octal-channel device: Vout0, Vout2, Vout4, Vout6;
4ba12d304175fd Ariana Lazar 2025-12-16  176  
4ba12d304175fd Ariana Lazar 2025-12-16  177    vref1-supply:
4ba12d304175fd Ariana Lazar 2025-12-16  178      description: |
4ba12d304175fd Ariana Lazar 2025-12-16  179        Vref1 pin may be used as a voltage reference when this supply is specified.
4ba12d304175fd Ariana Lazar 2025-12-16  180        The internal reference will be taken into account for voltage reference
4ba12d304175fd Ariana Lazar 2025-12-16  181        beside VDD if this supply does not exist.
4ba12d304175fd Ariana Lazar 2025-12-16  182  
4ba12d304175fd Ariana Lazar 2025-12-16  183        This supply will be voltage reference for the following outputs:
4ba12d304175fd Ariana Lazar 2025-12-16  184          - for quad-channel device: Vout1, Vout3;
4ba12d304175fd Ariana Lazar 2025-12-16  185          - for octal-channel device: Vout1, Vout3, Vout5, Vout7;
4ba12d304175fd Ariana Lazar 2025-12-16  186  
4ba12d304175fd Ariana Lazar 2025-12-16  187    lat-gpios:
4ba12d304175fd Ariana Lazar 2025-12-16  188      description:
4ba12d304175fd Ariana Lazar 2025-12-16  189        LAT pin to be used as a hardware trigger to synchronously update the DAC
4ba12d304175fd Ariana Lazar 2025-12-16  190        channels. The pin is active Low. It could be also found as LAT0 in
4ba12d304175fd Ariana Lazar 2025-12-16  191        datasheet.
4ba12d304175fd Ariana Lazar 2025-12-16  192      maxItems: 1
4ba12d304175fd Ariana Lazar 2025-12-16  193  
4ba12d304175fd Ariana Lazar 2025-12-16  194    lat1-gpios:
4ba12d304175fd Ariana Lazar 2025-12-16  195      description:
4ba12d304175fd Ariana Lazar 2025-12-16  196        LAT1 pin to be used as a hardware trigger to synchronously update the odd
4ba12d304175fd Ariana Lazar 2025-12-16  197        DAC channels on devices with 4 and 8 channels. The pin is active Low.
4ba12d304175fd Ariana Lazar 2025-12-16  198      maxItems: 1
4ba12d304175fd Ariana Lazar 2025-12-16  199  
4ba12d304175fd Ariana Lazar 2025-12-16  200    microchip,vref-buffered:
4ba12d304175fd Ariana Lazar 2025-12-16  201      type: boolean
4ba12d304175fd Ariana Lazar 2025-12-16  202      description:
4ba12d304175fd Ariana Lazar 2025-12-16  203        Enable buffering of the external Vref/Vref0 pin in cases where the
4ba12d304175fd Ariana Lazar 2025-12-16  204        external reference voltage does not have sufficient current capability in
09f9e21614c4bf Ariana Lazar 2026-04-03  205        order not to drop its voltage when connected to the internal resistor
4ba12d304175fd Ariana Lazar 2025-12-16  206        ladder circuit.
4ba12d304175fd Ariana Lazar 2025-12-16  207  
4ba12d304175fd Ariana Lazar 2025-12-16  208    microchip,vref1-buffered:
4ba12d304175fd Ariana Lazar 2025-12-16  209      type: boolean
4ba12d304175fd Ariana Lazar 2025-12-16  210      description:
4ba12d304175fd Ariana Lazar 2025-12-16  211        Enable buffering of the external Vref1 pin in cases where the external
4ba12d304175fd Ariana Lazar 2025-12-16  212        reference voltage does not have sufficient current capability in order not
09f9e21614c4bf Ariana Lazar 2026-04-03  213        to drop its voltage when connected to the internal resistor ladder
4ba12d304175fd Ariana Lazar 2025-12-16  214        circuit.
4ba12d304175fd Ariana Lazar 2025-12-16  215  
4ba12d304175fd Ariana Lazar 2025-12-16  216  patternProperties:
4ba12d304175fd Ariana Lazar 2025-12-16  217    "^channel@[0-7]$":
4ba12d304175fd Ariana Lazar 2025-12-16  218      $ref: dac.yaml
4ba12d304175fd Ariana Lazar 2025-12-16  219      type: object
4ba12d304175fd Ariana Lazar 2025-12-16  220      description: Voltage output channel.
4ba12d304175fd Ariana Lazar 2025-12-16  221  
4ba12d304175fd Ariana Lazar 2025-12-16  222      properties:
4ba12d304175fd Ariana Lazar 2025-12-16  223        reg:
4ba12d304175fd Ariana Lazar 2025-12-16  224          description: The channel number.
09f9e21614c4bf Ariana Lazar 2026-04-03  225          maxItems: 1
4ba12d304175fd Ariana Lazar 2025-12-16  226  
4ba12d304175fd Ariana Lazar 2025-12-16  227        label:
4ba12d304175fd Ariana Lazar 2025-12-16  228          description: Unique name to identify which channel this is.
4ba12d304175fd Ariana Lazar 2025-12-16  229  
4ba12d304175fd Ariana Lazar 2025-12-16  230      required:
4ba12d304175fd Ariana Lazar 2025-12-16  231        - reg
4ba12d304175fd Ariana Lazar 2025-12-16  232  
4ba12d304175fd Ariana Lazar 2025-12-16  233      unevaluatedProperties: false
4ba12d304175fd Ariana Lazar 2025-12-16  234  
4ba12d304175fd Ariana Lazar 2025-12-16  235  required:
4ba12d304175fd Ariana Lazar 2025-12-16  236    - compatible
4ba12d304175fd Ariana Lazar 2025-12-16  237    - reg
4ba12d304175fd Ariana Lazar 2025-12-16  238    - vdd-supply
4ba12d304175fd Ariana Lazar 2025-12-16  239  
4ba12d304175fd Ariana Lazar 2025-12-16  240  allOf:
09f9e21614c4bf Ariana Lazar 2026-04-03  241    - if:
09f9e21614c4bf Ariana Lazar 2026-04-03  242        properties:
09f9e21614c4bf Ariana Lazar 2026-04-03  243          compatible:
09f9e21614c4bf Ariana Lazar 2026-04-03  244            contains:
09f9e21614c4bf Ariana Lazar 2026-04-03 @245              pattern: "mcp48"
09f9e21614c4bf Ariana Lazar 2026-04-03  246      then:
09f9e21614c4bf Ariana Lazar 2026-04-03  247        $ref: /schemas/spi/spi-peripheral-props.yaml#
4ba12d304175fd Ariana Lazar 2025-12-16  248    - if:
4ba12d304175fd Ariana Lazar 2025-12-16  249        properties:
4ba12d304175fd Ariana Lazar 2025-12-16  250          compatible:
4ba12d304175fd Ariana Lazar 2025-12-16  251            contains:
4ba12d304175fd Ariana Lazar 2025-12-16  252              enum:
4ba12d304175fd Ariana Lazar 2025-12-16  253                - microchip,mcp47feb01
4ba12d304175fd Ariana Lazar 2025-12-16  254                - microchip,mcp47feb11
4ba12d304175fd Ariana Lazar 2025-12-16  255                - microchip,mcp47feb21
4ba12d304175fd Ariana Lazar 2025-12-16  256                - microchip,mcp47fvb01
4ba12d304175fd Ariana Lazar 2025-12-16  257                - microchip,mcp47fvb11
4ba12d304175fd Ariana Lazar 2025-12-16  258                - microchip,mcp47fvb21
09f9e21614c4bf Ariana Lazar 2026-04-03  259                - microchip,mcp48feb01
09f9e21614c4bf Ariana Lazar 2026-04-03  260                - microchip,mcp48feb11
09f9e21614c4bf Ariana Lazar 2026-04-03  261                - microchip,mcp48feb21
09f9e21614c4bf Ariana Lazar 2026-04-03  262                - microchip,mcp48fvb01
09f9e21614c4bf Ariana Lazar 2026-04-03  263                - microchip,mcp48fvb11
09f9e21614c4bf Ariana Lazar 2026-04-03  264                - microchip,mcp48fvb21
4ba12d304175fd Ariana Lazar 2025-12-16  265      then:
4ba12d304175fd Ariana Lazar 2025-12-16  266        properties:
4ba12d304175fd Ariana Lazar 2025-12-16  267          lat1-gpios: false
4ba12d304175fd Ariana Lazar 2025-12-16  268          vref1-supply: false
4ba12d304175fd Ariana Lazar 2025-12-16  269          microchip,vref1-buffered: false
4ba12d304175fd Ariana Lazar 2025-12-16  270          channel@0:
4ba12d304175fd Ariana Lazar 2025-12-16  271            properties:
4ba12d304175fd Ariana Lazar 2025-12-16  272              reg:
4ba12d304175fd Ariana Lazar 2025-12-16  273                const: 0
4ba12d304175fd Ariana Lazar 2025-12-16  274        patternProperties:
4ba12d304175fd Ariana Lazar 2025-12-16  275          "^channel@[1-7]$": false
4ba12d304175fd Ariana Lazar 2025-12-16  276    - if:
4ba12d304175fd Ariana Lazar 2025-12-16  277        properties:
4ba12d304175fd Ariana Lazar 2025-12-16  278          compatible:
4ba12d304175fd Ariana Lazar 2025-12-16  279            contains:
4ba12d304175fd Ariana Lazar 2025-12-16  280              enum:
4ba12d304175fd Ariana Lazar 2025-12-16  281                - microchip,mcp47feb02
4ba12d304175fd Ariana Lazar 2025-12-16  282                - microchip,mcp47feb12
4ba12d304175fd Ariana Lazar 2025-12-16  283                - microchip,mcp47feb22
4ba12d304175fd Ariana Lazar 2025-12-16  284                - microchip,mcp47fvb02
4ba12d304175fd Ariana Lazar 2025-12-16  285                - microchip,mcp47fvb12
4ba12d304175fd Ariana Lazar 2025-12-16  286                - microchip,mcp47fvb22
09f9e21614c4bf Ariana Lazar 2026-04-03  287                - microchip,mcp48feb02
09f9e21614c4bf Ariana Lazar 2026-04-03  288                - microchip,mcp48feb12
09f9e21614c4bf Ariana Lazar 2026-04-03  289                - microchip,mcp48feb22
09f9e21614c4bf Ariana Lazar 2026-04-03  290                - microchip,mcp48fvb02
09f9e21614c4bf Ariana Lazar 2026-04-03  291                - microchip,mcp48fvb12
09f9e21614c4bf Ariana Lazar 2026-04-03  292                - microchip,mcp48fvb22
4ba12d304175fd Ariana Lazar 2025-12-16  293      then:
4ba12d304175fd Ariana Lazar 2025-12-16  294        properties:
4ba12d304175fd Ariana Lazar 2025-12-16  295          lat1-gpios: false
4ba12d304175fd Ariana Lazar 2025-12-16  296          vref1-supply: false
4ba12d304175fd Ariana Lazar 2025-12-16  297          microchip,vref1-buffered: false
4ba12d304175fd Ariana Lazar 2025-12-16  298        patternProperties:
4ba12d304175fd Ariana Lazar 2025-12-16  299          "^channel@[0-1]$":
4ba12d304175fd Ariana Lazar 2025-12-16  300            properties:
4ba12d304175fd Ariana Lazar 2025-12-16  301              reg:
4ba12d304175fd Ariana Lazar 2025-12-16  302                enum: [0, 1]
4ba12d304175fd Ariana Lazar 2025-12-16  303          "^channel@[2-7]$": false
4ba12d304175fd Ariana Lazar 2025-12-16  304    - if:
4ba12d304175fd Ariana Lazar 2025-12-16  305        properties:
4ba12d304175fd Ariana Lazar 2025-12-16  306          compatible:
4ba12d304175fd Ariana Lazar 2025-12-16  307            contains:
4ba12d304175fd Ariana Lazar 2025-12-16  308              enum:
4ba12d304175fd Ariana Lazar 2025-12-16  309                - microchip,mcp47feb04
4ba12d304175fd Ariana Lazar 2025-12-16  310                - microchip,mcp47feb14
4ba12d304175fd Ariana Lazar 2025-12-16  311                - microchip,mcp47feb24
09f9e21614c4bf Ariana Lazar 2026-04-03  312                - microchip,mcp47fvb04
09f9e21614c4bf Ariana Lazar 2026-04-03  313                - microchip,mcp47fvb14
09f9e21614c4bf Ariana Lazar 2026-04-03  314                - microchip,mcp47fvb24
09f9e21614c4bf Ariana Lazar 2026-04-03  315                - microchip,mcp48feb04
09f9e21614c4bf Ariana Lazar 2026-04-03  316                - microchip,mcp48feb14
09f9e21614c4bf Ariana Lazar 2026-04-03  317                - microchip,mcp48feb24
09f9e21614c4bf Ariana Lazar 2026-04-03  318                - microchip,mcp48fvb04
09f9e21614c4bf Ariana Lazar 2026-04-03  319                - microchip,mcp48fvb14
09f9e21614c4bf Ariana Lazar 2026-04-03  320                - microchip,mcp48fvb24
4ba12d304175fd Ariana Lazar 2025-12-16  321      then:
4ba12d304175fd Ariana Lazar 2025-12-16  322        patternProperties:
4ba12d304175fd Ariana Lazar 2025-12-16  323          "^channel@[0-3]$":
4ba12d304175fd Ariana Lazar 2025-12-16  324            properties:
4ba12d304175fd Ariana Lazar 2025-12-16  325              reg:
4ba12d304175fd Ariana Lazar 2025-12-16  326                enum: [0, 1, 2, 3]
4ba12d304175fd Ariana Lazar 2025-12-16  327          "^channel@[4-7]$": false
4ba12d304175fd Ariana Lazar 2025-12-16  328    - if:
4ba12d304175fd Ariana Lazar 2025-12-16  329        properties:
4ba12d304175fd Ariana Lazar 2025-12-16  330          compatible:
4ba12d304175fd Ariana Lazar 2025-12-16  331            contains:
4ba12d304175fd Ariana Lazar 2025-12-16  332              enum:
4ba12d304175fd Ariana Lazar 2025-12-16  333                - microchip,mcp47feb08
4ba12d304175fd Ariana Lazar 2025-12-16  334                - microchip,mcp47feb18
4ba12d304175fd Ariana Lazar 2025-12-16  335                - microchip,mcp47feb28
09f9e21614c4bf Ariana Lazar 2026-04-03  336                - microchip,mcp48fvb08
09f9e21614c4bf Ariana Lazar 2026-04-03  337                - microchip,mcp48fvb18
09f9e21614c4bf Ariana Lazar 2026-04-03  338                - microchip,mcp48fvb28
4ba12d304175fd Ariana Lazar 2025-12-16  339      then:
4ba12d304175fd Ariana Lazar 2025-12-16  340        patternProperties:
4ba12d304175fd Ariana Lazar 2025-12-16  341          "^channel@[0-7]$":
4ba12d304175fd Ariana Lazar 2025-12-16  342            properties:
4ba12d304175fd Ariana Lazar 2025-12-16  343              reg:
4ba12d304175fd Ariana Lazar 2025-12-16  344                enum: [0, 1, 2, 3, 4, 5, 6, 7]
4ba12d304175fd Ariana Lazar 2025-12-16  345    - if:
4ba12d304175fd Ariana Lazar 2025-12-16  346        not:
4ba12d304175fd Ariana Lazar 2025-12-16  347          required:
4ba12d304175fd Ariana Lazar 2025-12-16  348            - vref-supply
4ba12d304175fd Ariana Lazar 2025-12-16  349      then:
4ba12d304175fd Ariana Lazar 2025-12-16  350        properties:
4ba12d304175fd Ariana Lazar 2025-12-16  351          microchip,vref-buffered: false
4ba12d304175fd Ariana Lazar 2025-12-16  352    - if:
4ba12d304175fd Ariana Lazar 2025-12-16  353        not:
4ba12d304175fd Ariana Lazar 2025-12-16  354          required:
4ba12d304175fd Ariana Lazar 2025-12-16  355            - vref1-supply
4ba12d304175fd Ariana Lazar 2025-12-16  356      then:
4ba12d304175fd Ariana Lazar 2025-12-16  357        properties:
4ba12d304175fd Ariana Lazar 2025-12-16  358          microchip,vref1-buffered: false
4ba12d304175fd Ariana Lazar 2025-12-16  359  
09f9e21614c4bf Ariana Lazar 2026-04-03  360    - if:
09f9e21614c4bf Ariana Lazar 2026-04-03  361        properties:
09f9e21614c4bf Ariana Lazar 2026-04-03  362          compatible:
09f9e21614c4bf Ariana Lazar 2026-04-03  363            contains:
09f9e21614c4bf Ariana Lazar 2026-04-03  364              enum:
09f9e21614c4bf Ariana Lazar 2026-04-03  365                - microchip,mcp47feb01
09f9e21614c4bf Ariana Lazar 2026-04-03  366                - microchip,mcp47feb02
09f9e21614c4bf Ariana Lazar 2026-04-03  367                - microchip,mcp47feb04
09f9e21614c4bf Ariana Lazar 2026-04-03  368                - microchip,mcp47feb08
09f9e21614c4bf Ariana Lazar 2026-04-03  369                - microchip,mcp47feb11
09f9e21614c4bf Ariana Lazar 2026-04-03  370                - microchip,mcp47feb12
09f9e21614c4bf Ariana Lazar 2026-04-03  371                - microchip,mcp47feb14
09f9e21614c4bf Ariana Lazar 2026-04-03  372                - microchip,mcp47feb18
09f9e21614c4bf Ariana Lazar 2026-04-03  373                - microchip,mcp47feb21
09f9e21614c4bf Ariana Lazar 2026-04-03  374                - microchip,mcp47feb22
09f9e21614c4bf Ariana Lazar 2026-04-03  375                - microchip,mcp47feb24
09f9e21614c4bf Ariana Lazar 2026-04-03  376                - microchip,mcp47feb28
09f9e21614c4bf Ariana Lazar 2026-04-03  377                - microchip,mcp47fvb01
09f9e21614c4bf Ariana Lazar 2026-04-03  378                - microchip,mcp47fvb02
09f9e21614c4bf Ariana Lazar 2026-04-03  379                - microchip,mcp47fvb04
09f9e21614c4bf Ariana Lazar 2026-04-03  380                - microchip,mcp47fvb08
09f9e21614c4bf Ariana Lazar 2026-04-03  381                - microchip,mcp47fvb11
09f9e21614c4bf Ariana Lazar 2026-04-03  382                - microchip,mcp47fvb12
09f9e21614c4bf Ariana Lazar 2026-04-03  383                - microchip,mcp47fvb14
09f9e21614c4bf Ariana Lazar 2026-04-03  384                - microchip,mcp47fvb18
09f9e21614c4bf Ariana Lazar 2026-04-03  385                - microchip,mcp47fvb21
09f9e21614c4bf Ariana Lazar 2026-04-03  386                - microchip,mcp47fvb22
09f9e21614c4bf Ariana Lazar 2026-04-03  387                - microchip,mcp47fvb24
09f9e21614c4bf Ariana Lazar 2026-04-03  388                - microchip,mcp47fvb28
09f9e21614c4bf Ariana Lazar 2026-04-03  389      then:
09f9e21614c4bf Ariana Lazar 2026-04-03  390        properties:
09f9e21614c4bf Ariana Lazar 2026-04-03  391          spi-max-frequency: false
09f9e21614c4bf Ariana Lazar 2026-04-03  392  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

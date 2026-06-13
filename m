Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992763612EC
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jun 2026 03:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781321655; cv=none; b=J79yUOSJNzu6dXfegqwobOh/ToEAg0v96tHYF3w7qbNxZJIsDvf8y+/DDRcejjEIinCd3WUbHryw0RrGvgK95ZFiRbu+E0t/rxnL4wnIzaBp2Rl63iN/x79pE0peipxqRNg7tWJb+bX9KLJTabjCzhaxolPWe+HgCO+Lz5u9AiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781321655; c=relaxed/simple;
	bh=+zwP/zV/0A8Hk7JWlYCzZgto+smlXvVYc+M5YnfMgKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SOUCk+VNkRxhf+dBlnsZvtX7gjXeKIREqAAR8pIMPpnta4530jXtJGRZrsAv4HV5p0Jxn1zSmVYqMPQ4HnuMEZXKPEEYgFUfdV1TfboQiqVy+luYeXWDOCTm6FM9VuovmRQVVDC0DXCOhDnngedHPDhDIm+2jwW4Ew6xynX4TvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxpQXvaK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxpQXvaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781321653; x=1812857653;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+zwP/zV/0A8Hk7JWlYCzZgto+smlXvVYc+M5YnfMgKs=;
  b=AxpQXvaK+p2ipDwXXUygLsGK6PE7oxEXDdp/J5v52ImDIbScWC9zlL/2
   24Qb2tUi4+t3sOuqrtsBDLWF0AECSozNYoBCEwIgzFBVo+WNpN65sSZ+v
   2N9sNIofZqj6BzaxKOaz/T0hdioNEzUH/7TGZ+X17tbx2lWO2fidEJze5
   HWsUDejk9HjuBkIVwkOwwddgpdMt6wYt+8llmH8ycs3qaNEgECszvgzJh
   Lp/jSAteQvT7hqJnyoucivke749rEIx1CxjcCLbtTZxQ3DjAFfR10oyGo
   Qsa/MPss3ZFsRb9RNUd5OvLBXc5IyppjXfOXyP/bqiUD6qOlaKEMTTFrq
   A==;
X-CSE-ConnectionGUID: 6hjj7wlrR4yABk7qcecAww==
X-CSE-MsgGUID: 8U+SZxbvR8i3aPlshWjA/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86054237"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86054237"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 20:34:12 -0700
X-CSE-ConnectionGUID: 14WN0C9zRUuUvsFGVYBjXw==
X-CSE-MsgGUID: fAm3WKFRTGyXxzkOyWQpxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250896785"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2026 20:34:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYF8K-00000000PdS-1uMX;
	Sat, 13 Jun 2026 03:34:08 +0000
Date: Sat, 13 Jun 2026 11:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 16915/27391]
 drivers/iio/adc/navassa/platforms/linux_platform.c:110:16: error: assignment
 to '__va_list_tag (*)[1]' from incompatible pointer type '__va_list_tag **'
Message-ID: <202606131123.CAbnAG66-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Nuno Sa <noname.nuno@gmail.com>
TO: Nuno Sa <nuno.sa@analog.com>
CC: Alexandru Ardelean <ardeleanalex@gmail.com>

Hi Nuno,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: b0ac08326b9f4de1fb94e457b903e043b1008b44 [16915/27391] iio: adrv900=
2: add full path for include directories
:::::: branch date: 2 days ago
:::::: commit date: 5 years ago
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260613=
/202606131123.CAbnAG66-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260613/202606131123.CAbnAG66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606131123.CAbnAG66-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: drivers/iio/adc/navassa/boards/adrv9001/private/include: N=
o such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/iio/adc/navassa/boards/adrv9001/public/include/: N=
o such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/iio/adc/navassa/common/adi_libc/: No such file or =
directory [-Wmissing-include-dirs]
   drivers/iio/adc/navassa/platforms/linux_platform.c:32:9: warning: no pre=
vious prototype for 'linux_log_file_open' [-Wmissing-prototypes]
      32 | int32_t linux_log_file_open(void *devHalCfg, const char *filenam=
e)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:45:9: warning: no pre=
vious prototype for 'linux_log_file_flush' [-Wmissing-prototypes]
      45 | int32_t linux_log_file_flush(void *devHalCfg)
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:59:9: warning: no pre=
vious prototype for 'linux_log_file_close' [-Wmissing-prototypes]
      59 | int32_t linux_log_file_close(void *devHalCfg)
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:80:9: warning: no pre=
vious prototype for 'linux_log_write' [-Wmissing-prototypes]
      80 | int32_t linux_log_write(void *devHalCfg, uint32_t log_level, con=
st char *comment, va_list argp)
         |         ^~~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c: In function 'linux_l=
og_write':
>> drivers/iio/adc/navassa/platforms/linux_platform.c:110:16: error: assign=
ment to '__va_list_tag (*)[1]' from incompatible pointer type '__va_list_ta=
g **' [-Werror=3Dincompatible-pointer-types]
     110 |         vaf.va =3D &argp;
         |                ^
   drivers/iio/adc/navassa/platforms/linux_platform.c: At top level:
   drivers/iio/adc/navassa/platforms/linux_platform.c:148:9: warning: no pr=
evious prototype for 'linux_spi_write' [-Wmissing-prototypes]
     148 | int32_t linux_spi_write(void *devHalCfg, const uint8_t txData[],=
 uint32_t numTxBytes)
         |         ^~~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:189:9: warning: no pr=
evious prototype for 'linux_spi_read' [-Wmissing-prototypes]
     189 | int32_t linux_spi_read(void *devHalCfg, const uint8_t txData[], =
uint8_t rxData[],
         |         ^~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:224:9: warning: no pr=
evious prototype for 'linux_wait_us' [-Wmissing-prototypes]
     224 | int32_t linux_wait_us(void *devHalCfg, uint32_t time_us)
         |         ^~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:237:9: warning: no pr=
evious prototype for 'linux_hw_open' [-Wmissing-prototypes]
     237 | int32_t linux_hw_open(void *devHalCfg)
         |         ^~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:250:9: warning: no pr=
evious prototype for 'linux_hw_close' [-Wmissing-prototypes]
     250 | int32_t linux_hw_close(void *devHalCfg)
         |         ^~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:268:9: warning: no pr=
evious prototype for 'linux_hw_reset' [-Wmissing-prototypes]
     268 | int32_t linux_hw_reset(void *devHalCfg, uint8_t pinLevel)
         |         ^~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:286:9: warning: no pr=
evious prototype for 'linux_mcs_pulse' [-Wmissing-prototypes]
     286 | int32_t linux_mcs_pulse(void* devHalCfg, uint8_t numberOfPulses)
         |         ^~~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:291:9: warning: no pr=
evious prototype for 'linux_ssi_reset' [-Wmissing-prototypes]
     291 | int32_t linux_ssi_reset(void* devHalCfg)
         |         ^~~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:296:9: warning: no pr=
evious prototype for 'linux_image_page_get' [-Wmissing-prototypes]
     296 | int32_t linux_image_page_get(void *devHalCfg, const char *ImageP=
ath, uint32_t pageIndex,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:322:9: warning: no pr=
evious prototype for 'linux_rx_gain_table_entry_get' [-Wmissing-prototypes]
     322 | int32_t linux_rx_gain_table_entry_get(void *devHalCfg, const cha=
r *rxGainTablePath,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/navassa/platforms/linux_platform.c:367:9: warning: no pr=
evious prototype for 'linux_tx_atten_table_entry_get' [-Wmissing-prototypes]
     367 | int32_t linux_tx_atten_table_entry_get(void *devHalCfg, const ch=
ar *txAttenTablePath,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_DSA
   Depends on [n]: NET [=3Dy] && HAVE_NET_DSA [=3Dn] && (BRIDGE [=3Dy] || B=
RIDGE [=3Dy]=3Dn)
   Selected by [y]:
   - KERNEL_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for COMMON_CLK_AD9545_SPI
   Depends on [n]: COMMON_CLK [=3Dn] && REGMAP_SPI [=3Dy]
   Selected by [y]:
   - CLK_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for COMMON_CLK_AD9545
   Depends on [n]: COMMON_CLK [=3Dn]
   Selected by [y]:
   - CLK_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for ADF5355
   Depends on [n]: IIO [=3Dy] && SPI [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for AXI_ADXCVR
   Depends on [n]: IIO [=3Dy] && JESD204 [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for AD9528
   Depends on [n]: IIO [=3Dy] && SPI [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for USB_ULPI
   Depends on [n]: USB_SUPPORT [=3Dy] && (ARM || ARM64)
   Selected by [y]:
   - USB_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for HMC7044
   Depends on [n]: IIO [=3Dy] && SPI [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for AD9361
   Depends on [n]: IIO [=3Dy] && SPI [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for LTC6952
   Depends on [n]: IIO [=3Dy] && SPI [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for ADF4360
   Depends on [n]: IIO [=3Dy] && SPI [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for USB_OTG
   Depends on [n]: USB_SUPPORT [=3Dy] && USB [=3Dy] && PM [=3Dn]
   Selected by [y]:
   - USB_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for AD9523
   Depends on [n]: IIO [=3Dy] && SPI [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for ADXL345_I2C
   Depends on [n]: IIO [=3Dy] && INPUT_ADXL34X [=3Dy]=3Dn && I2C [=3Dy]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy] && I2C [=3Dy]
   WARNING: unmet direct dependencies detected for ADXL345_SPI
   Depends on [n]: IIO [=3Dy] && INPUT_ADXL34X [=3Dy]=3Dn && SPI [=3Dy]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy] && SPI [=3Dy]
   WARNING: unmet direct dependencies detected for CF_AXI_DDS
   Depends on [n]: IIO [=3Dy] && SPI [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for AXI_JESD204_TX
   Depends on [n]: IIO [=3Dy] && JESD204 [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for AXI_JESD204_RX
   Depends on [n]: IIO [=3Dy] && JESD204 [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for COMMON_CLK_AD9545_I2C
   Depends on [n]: COMMON_CLK [=3Dn] && REGMAP_I2C [=3Dy]
   Selected by [y]:
   - CLK_ALL_ADI_DRIVERS [=3Dy]
   WARNING: unmet direct dependencies detected for AD9517
   Depends on [n]: IIO [=3Dy] && SPI [=3Dy] && COMMON_CLK [=3Dn]
   Selected by [y]:
   - IIO_ALL_ADI_DRIVERS [=3Dy]


vim +110 drivers/iio/adc/navassa/platforms/linux_platform.c

0624deb30a3a79 Nuno S=C3=A1 2020-07-23   49 =20
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   50  /**
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   51   * \brief Gracefully closes th=
e log file(s).
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   52   *
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   53   * \param devHalCfg Pointer to=
 device instance specific platform settings
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   54   *
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   55   * \retval ADI_HAL_OK Function=
 completed successfully, no action required
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   56   * \retval ADI_HAL_NULL_PTR Th=
e function has been called with a null pointer
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   57   * \retval ADI_HAL_LOGGING_FAI=
L Error while flushing or closing the log file.
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   58   */
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  @59  int32_t linux_log_file_close(v=
oid *devHalCfg)
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   60  {
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   61  	return ADI_COMMON_ERR_OK;
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   62  }
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   63 =20
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   64  /**
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   65   * \brief Writes a message to =
the currently open logFile specified in the
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   66   *        adi_hal_LogCfg_t of =
the devHalCfg structure passed
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   67   *
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   68   * Uses the vfprintf functiona=
lity to allow the user to supply the format and
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   69   * the number of argument's th=
at will be logged.
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   70   *
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   71   * \param devHalCfg Pointer to=
 device instance specific platform settings
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   72   * \param logLevel the log lev=
el to be written into
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   73   * \param comment the string t=
o include in the line added to the log.
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   74   * \param argp variable argume=
nt list to be printed
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   75   *
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   76   * \retval ADI_COMMON_ERR_OK F=
unction completed successfully, no action required
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   77   * \retval ADI_COMMON_ERR_NULL=
_PARAM The function has been called with a null pointer
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   78   * \retval ADI_COMMON_ERR_API_=
FAIL If the function failed to flush to write
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   79   */
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   80  int32_t linux_log_write(void *=
devHalCfg, uint32_t log_level, const char *comment, va_list argp)
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   81  {
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   82  	int ret;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   83  	struct adrv9002_hal_cfg *hal_=
cfg =3D devHalCfg;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   84  	struct device *dev =3D &hal_c=
fg->spi->dev;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   85  	struct va_format vaf;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   86  	char fmt[512] =3D { 0 };
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   87  	const char * const log_level_=
char[] =3D {
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   88  		[ADI_LOGLEVEL_TRACE] =3D "[T=
RACE]",
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   89  		[ADI_LOGLEVEL_DEBUG] =3D "[D=
EBUG]",
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   90  		[ADI_LOGLEVEL_INFO] =3D "[IN=
FO]",
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   91  		[ADI_LOGLEVEL_WARN] =3D "[WA=
RN]",
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   92  		[ADI_LOGLEVEL_ERROR] =3D "[E=
RROR]",
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   93  		[ADI_LOGLEVEL_FATAL] =3D "[F=
ATAL]"
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   94  	};
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   95 =20
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   96  	if (!hal_cfg)
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   97  		return ADI_COMMON_ERR_NULL_P=
ARAM;
0624deb30a3a79 Nuno S=C3=A1 2020-07-23   98 =20
653fc5633ae7ef Nuno S=C3=A1 2020-10-06   99  	if (log_level =3D=3D ADI_LOGL=
EVEL_NONE)
0624deb30a3a79 Nuno S=C3=A1 2020-07-23  100  		/* If logging disabled, exit=
 gracefully */
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  101  		return ADI_COMMON_ERR_OK;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  102  	else if (log_level > ADI_LOGL=
EVEL_FATAL)
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  103  		return ADI_COMMON_ERR_INV_PA=
RAM;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  104 =20
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  105  	ret =3D snprintf(fmt, sizeof(=
fmt), "%s: %s", log_level_char[log_level], comment);
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  106  	if (ret < 0)
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  107  		return ADI_COMMON_ERR_API_FA=
IL;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  108 =20
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  109  	vaf.fmt =3D fmt;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06 @110  	vaf.va =3D &argp;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  111 =20
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  112  	switch (log_level) {
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  113  	case ADI_LOGLEVEL_TRACE:
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  114  	case ADI_LOGLEVEL_DEBUG:
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  115  		dev_dbg_ratelimited(dev, "%p=
V", &vaf);
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  116  		break;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  117  	case ADI_LOGLEVEL_INFO:
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  118  		dev_info(dev, "%pV", &vaf);
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  119  		break;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  120  	case ADI_LOGLEVEL_WARN:
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  121  		dev_warn(dev, "%pV", &vaf);
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  122  		break;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  123  	case ADI_LOGLEVEL_ERROR:
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  124  		dev_err(dev, "%pV", &vaf);
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  125  		break;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  126  	case ADI_LOGLEVEL_FATAL:
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  127  		dev_crit(dev, "%pV", &vaf);
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  128  		break;
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  129  	}
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  130 =20
653fc5633ae7ef Nuno S=C3=A1 2020-10-06  131  	return ADI_COMMON_ERR_OK;
0624deb30a3a79 Nuno S=C3=A1 2020-07-23  132  }
0624deb30a3a79 Nuno S=C3=A1 2020-07-23  133 =20

:::::: The code at line 110 was first introduced by commit
:::::: 653fc5633ae7ef15158e91ac01ae509440ead745 iio: adrv9002: Fix linux_pl=
atform hal

:::::: TO: Nuno S=C3=A1 <nuno.sa@analog.com>
:::::: CC: Alexandru Ardelean <ardeleanalex@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

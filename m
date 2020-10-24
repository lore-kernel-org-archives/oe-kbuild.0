Content-Type: multipart/mixed; boundary="===============3283781531164296016=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [radeon-alex:amd-staging-drm-next 744/765] drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:2280 sienna_cichlid_dump_pptable() error: buffer overflow 'pptable->SkuReserved' 8 <= 8
Date: Sat, 24 Oct 2020 08:51:54 +0800
Message-ID: <202010240851.9QSqsdan-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3283781531164296016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: dri-devel(a)lists.freedesktop.org
TO: Likun Gao <Likun.Gao@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-staging-drm-next
head:   1e5c252665ac026e977cd87fb8fcdb6f0bc0b759
commit: 62b1f5006728492c79182d960635d749d84f71ec [744/765] drm/amd/pm: upda=
te driver if file for sienna cichlid
:::::: branch date: 6 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-m031-20201022 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:2280 sien=
na_cichlid_dump_pptable() error: buffer overflow 'pptable->SkuReserved' 8 <=
=3D 8

vim +2280 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c

ea8139d8d59bd6f drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Wenhui S=
heng 2020-07-10  1766  =

b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1767  static void sienna_cichlid_dump_pptable(struct smu_c=
ontext *smu)
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1768  {
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1769  	struct smu_table_context *table_context =3D &smu->s=
mu_table;
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1770  	PPTable_t *pptable =3D table_context->driver_pptabl=
e;
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1771  	int i;
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1772  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1773  	dev_info(smu->adev->dev, "Dumped PPTable:\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1774  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1775  	dev_info(smu->adev->dev, "Version =3D 0x%08x\n", pp=
table->Version);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1776  	dev_info(smu->adev->dev, "FeaturesToRun[0] =3D 0x%0=
8x\n", pptable->FeaturesToRun[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1777  	dev_info(smu->adev->dev, "FeaturesToRun[1] =3D 0x%0=
8x\n", pptable->FeaturesToRun[1]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1778  =

b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1779  	for (i =3D 0; i < PPT_THROTTLER_COUNT; i++) {
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1780  		dev_info(smu->adev->dev, "SocketPowerLimitAc[%d] =
=3D 0x%x\n", i, pptable->SocketPowerLimitAc[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1781  		dev_info(smu->adev->dev, "SocketPowerLimitAcTau[%d=
] =3D 0x%x\n", i, pptable->SocketPowerLimitAcTau[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1782  		dev_info(smu->adev->dev, "SocketPowerLimitDc[%d] =
=3D 0x%x\n", i, pptable->SocketPowerLimitDc[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1783  		dev_info(smu->adev->dev, "SocketPowerLimitDcTau[%d=
] =3D 0x%x\n", i, pptable->SocketPowerLimitDcTau[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1784  	}
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1785  =

b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1786  	for (i =3D 0; i < TDC_THROTTLER_COUNT; i++) {
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1787  		dev_info(smu->adev->dev, "TdcLimit[%d] =3D 0x%x\n"=
, i, pptable->TdcLimit[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1788  		dev_info(smu->adev->dev, "TdcLimitTau[%d] =3D 0x%x=
\n", i, pptable->TdcLimitTau[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1789  	}
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1790  =

b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1791  	for (i =3D 0; i < TEMP_COUNT; i++) {
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1792  		dev_info(smu->adev->dev, "TemperatureLimit[%d] =3D=
 0x%x\n", i, pptable->TemperatureLimit[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1793  	}
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1794  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1795  	dev_info(smu->adev->dev, "FitLimit =3D 0x%x\n", ppt=
able->FitLimit);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1796  	dev_info(smu->adev->dev, "TotalPowerConfig =3D 0x%x=
\n", pptable->TotalPowerConfig);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1797  	dev_info(smu->adev->dev, "TotalPowerPadding[0] =3D =
0x%x\n", pptable->TotalPowerPadding[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1798  	dev_info(smu->adev->dev, "TotalPowerPadding[1] =3D =
0x%x\n", pptable->TotalPowerPadding[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1799  	dev_info(smu->adev->dev, "TotalPowerPadding[2] =3D =
0x%x\n", pptable->TotalPowerPadding[2]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1800  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1801  	dev_info(smu->adev->dev, "ApccPlusResidencyLimit =
=3D 0x%x\n", pptable->ApccPlusResidencyLimit);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1802  	for (i =3D 0; i < NUM_SMNCLK_DPM_LEVELS; i++) {
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1803  		dev_info(smu->adev->dev, "SmnclkDpmFreq[%d] =3D 0x=
%x\n", i, pptable->SmnclkDpmFreq[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1804  		dev_info(smu->adev->dev, "SmnclkDpmVoltage[%d] =3D=
 0x%x\n", i, pptable->SmnclkDpmVoltage[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1805  	}
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1806  	dev_info(smu->adev->dev, "PaddingAPCC[0] =3D 0x%x\n=
", pptable->PaddingAPCC[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1807  	dev_info(smu->adev->dev, "PaddingAPCC[1] =3D 0x%x\n=
", pptable->PaddingAPCC[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1808  	dev_info(smu->adev->dev, "PaddingAPCC[2] =3D 0x%x\n=
", pptable->PaddingAPCC[2]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1809  	dev_info(smu->adev->dev, "PaddingAPCC[3] =3D 0x%x\n=
", pptable->PaddingAPCC[3]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1810  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1811  	dev_info(smu->adev->dev, "ThrottlerControlMask =3D =
0x%x\n", pptable->ThrottlerControlMask);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1812  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1813  	dev_info(smu->adev->dev, "FwDStateMask =3D 0x%x\n",=
 pptable->FwDStateMask);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1814  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1815  	dev_info(smu->adev->dev, "UlvVoltageOffsetSoc =3D 0=
x%x\n", pptable->UlvVoltageOffsetSoc);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1816  	dev_info(smu->adev->dev, "UlvVoltageOffsetGfx =3D 0=
x%x\n", pptable->UlvVoltageOffsetGfx);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1817  	dev_info(smu->adev->dev, "MinVoltageUlvGfx =3D 0x%x=
\n", pptable->MinVoltageUlvGfx);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1818  	dev_info(smu->adev->dev, "MinVoltageUlvSoc =3D 0x%x=
\n", pptable->MinVoltageUlvSoc);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1819  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1820  	dev_info(smu->adev->dev, "SocLIVmin =3D 0x%x\n", pp=
table->SocLIVmin);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1821  	dev_info(smu->adev->dev, "PaddingLIVmin =3D 0x%x\n"=
, pptable->PaddingLIVmin);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1822  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1823  	dev_info(smu->adev->dev, "GceaLinkMgrIdleThreshold =
=3D 0x%x\n", pptable->GceaLinkMgrIdleThreshold);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1824  	dev_info(smu->adev->dev, "paddingRlcUlvParams[0] =
=3D 0x%x\n", pptable->paddingRlcUlvParams[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1825  	dev_info(smu->adev->dev, "paddingRlcUlvParams[1] =
=3D 0x%x\n", pptable->paddingRlcUlvParams[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1826  	dev_info(smu->adev->dev, "paddingRlcUlvParams[2] =
=3D 0x%x\n", pptable->paddingRlcUlvParams[2]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1827  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1828  	dev_info(smu->adev->dev, "MinVoltageGfx =3D 0x%x\n"=
, pptable->MinVoltageGfx);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1829  	dev_info(smu->adev->dev, "MinVoltageSoc =3D 0x%x\n"=
, pptable->MinVoltageSoc);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1830  	dev_info(smu->adev->dev, "MaxVoltageGfx =3D 0x%x\n"=
, pptable->MaxVoltageGfx);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1831  	dev_info(smu->adev->dev, "MaxVoltageSoc =3D 0x%x\n"=
, pptable->MaxVoltageSoc);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1832  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1833  	dev_info(smu->adev->dev, "LoadLineResistanceGfx =3D=
 0x%x\n", pptable->LoadLineResistanceGfx);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1834  	dev_info(smu->adev->dev, "LoadLineResistanceSoc =3D=
 0x%x\n", pptable->LoadLineResistanceSoc);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1835  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1836  	dev_info(smu->adev->dev, "VDDGFX_TVmin =3D 0x%x\n",=
 pptable->VDDGFX_TVmin);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1837  	dev_info(smu->adev->dev, "VDDSOC_TVmin =3D 0x%x\n",=
 pptable->VDDSOC_TVmin);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1838  	dev_info(smu->adev->dev, "VDDGFX_Vmin_HiTemp =3D 0x=
%x\n", pptable->VDDGFX_Vmin_HiTemp);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1839  	dev_info(smu->adev->dev, "VDDGFX_Vmin_LoTemp =3D 0x=
%x\n", pptable->VDDGFX_Vmin_LoTemp);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1840  	dev_info(smu->adev->dev, "VDDSOC_Vmin_HiTemp =3D 0x=
%x\n", pptable->VDDSOC_Vmin_HiTemp);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1841  	dev_info(smu->adev->dev, "VDDSOC_Vmin_LoTemp =3D 0x=
%x\n", pptable->VDDSOC_Vmin_LoTemp);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1842  	dev_info(smu->adev->dev, "VDDGFX_TVminHystersis =3D=
 0x%x\n", pptable->VDDGFX_TVminHystersis);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1843  	dev_info(smu->adev->dev, "VDDSOC_TVminHystersis =3D=
 0x%x\n", pptable->VDDSOC_TVminHystersis);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1844  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1845  	dev_info(smu->adev->dev, "[PPCLK_GFXCLK]\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1846  			"  .VoltageMode          =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1847  			"  .SnapToDiscrete       =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1848  			"  .NumDiscreteLevels    =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1849  			"  .padding              =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1850  			"  .ConversionToAvfsClk{m =3D 0x%08x b =3D 0x%08x=
}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1851  			"  .SsCurve            {a =3D 0x%08x b =3D 0x%08x=
 c =3D 0x%08x}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1852  			"  .SsFmin               =3D 0x%04x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1853  			"  .Padding_16           =3D 0x%04x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1854  			pptable->DpmDescriptor[PPCLK_GFXCLK].VoltageMode,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1855  			pptable->DpmDescriptor[PPCLK_GFXCLK].SnapToDiscre=
te,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1856  			pptable->DpmDescriptor[PPCLK_GFXCLK].NumDiscreteL=
evels,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1857  			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1858  			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionTo=
AvfsClk.m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1859  			pptable->DpmDescriptor[PPCLK_GFXCLK].ConversionTo=
AvfsClk.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1860  			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1861  			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1862  			pptable->DpmDescriptor[PPCLK_GFXCLK].SsCurve.c,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1863  			pptable->DpmDescriptor[PPCLK_GFXCLK].SsFmin,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1864  			pptable->DpmDescriptor[PPCLK_GFXCLK].Padding16);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1865  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1866  	dev_info(smu->adev->dev, "[PPCLK_SOCCLK]\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1867  			"  .VoltageMode          =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1868  			"  .SnapToDiscrete       =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1869  			"  .NumDiscreteLevels    =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1870  			"  .padding              =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1871  			"  .ConversionToAvfsClk{m =3D 0x%08x b =3D 0x%08x=
}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1872  			"  .SsCurve            {a =3D 0x%08x b =3D 0x%08x=
 c =3D 0x%08x}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1873  			"  .SsFmin               =3D 0x%04x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1874  			"  .Padding_16           =3D 0x%04x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1875  			pptable->DpmDescriptor[PPCLK_SOCCLK].VoltageMode,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1876  			pptable->DpmDescriptor[PPCLK_SOCCLK].SnapToDiscre=
te,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1877  			pptable->DpmDescriptor[PPCLK_SOCCLK].NumDiscreteL=
evels,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1878  			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1879  			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionTo=
AvfsClk.m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1880  			pptable->DpmDescriptor[PPCLK_SOCCLK].ConversionTo=
AvfsClk.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1881  			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1882  			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1883  			pptable->DpmDescriptor[PPCLK_SOCCLK].SsCurve.c,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1884  			pptable->DpmDescriptor[PPCLK_SOCCLK].SsFmin,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1885  			pptable->DpmDescriptor[PPCLK_SOCCLK].Padding16);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1886  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1887  	dev_info(smu->adev->dev, "[PPCLK_UCLK]\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1888  			"  .VoltageMode          =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1889  			"  .SnapToDiscrete       =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1890  			"  .NumDiscreteLevels    =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1891  			"  .padding              =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1892  			"  .ConversionToAvfsClk{m =3D 0x%08x b =3D 0x%08x=
}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1893  			"  .SsCurve            {a =3D 0x%08x b =3D 0x%08x=
 c =3D 0x%08x}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1894  			"  .SsFmin               =3D 0x%04x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1895  			"  .Padding_16           =3D 0x%04x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1896  			pptable->DpmDescriptor[PPCLK_UCLK].VoltageMode,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1897  			pptable->DpmDescriptor[PPCLK_UCLK].SnapToDiscrete,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1898  			pptable->DpmDescriptor[PPCLK_UCLK].NumDiscreteLev=
els,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1899  			pptable->DpmDescriptor[PPCLK_UCLK].Padding,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1900  			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAv=
fsClk.m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1901  			pptable->DpmDescriptor[PPCLK_UCLK].ConversionToAv=
fsClk.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1902  			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1903  			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1904  			pptable->DpmDescriptor[PPCLK_UCLK].SsCurve.c,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1905  			pptable->DpmDescriptor[PPCLK_UCLK].SsFmin,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1906  			pptable->DpmDescriptor[PPCLK_UCLK].Padding16);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1907  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1908  	dev_info(smu->adev->dev, "[PPCLK_FCLK]\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1909  			"  .VoltageMode          =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1910  			"  .SnapToDiscrete       =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1911  			"  .NumDiscreteLevels    =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1912  			"  .padding              =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1913  			"  .ConversionToAvfsClk{m =3D 0x%08x b =3D 0x%08x=
}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1914  			"  .SsCurve            {a =3D 0x%08x b =3D 0x%08x=
 c =3D 0x%08x}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1915  			"  .SsFmin               =3D 0x%04x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1916  			"  .Padding_16           =3D 0x%04x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1917  			pptable->DpmDescriptor[PPCLK_FCLK].VoltageMode,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1918  			pptable->DpmDescriptor[PPCLK_FCLK].SnapToDiscrete,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1919  			pptable->DpmDescriptor[PPCLK_FCLK].NumDiscreteLev=
els,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1920  			pptable->DpmDescriptor[PPCLK_FCLK].Padding,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1921  			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAv=
fsClk.m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1922  			pptable->DpmDescriptor[PPCLK_FCLK].ConversionToAv=
fsClk.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1923  			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1924  			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1925  			pptable->DpmDescriptor[PPCLK_FCLK].SsCurve.c,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1926  			pptable->DpmDescriptor[PPCLK_FCLK].SsFmin,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1927  			pptable->DpmDescriptor[PPCLK_FCLK].Padding16);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1928  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1929  	dev_info(smu->adev->dev, "[PPCLK_DCLK_0]\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1930  			"  .VoltageMode          =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1931  			"  .SnapToDiscrete       =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1932  			"  .NumDiscreteLevels    =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1933  			"  .padding              =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1934  			"  .ConversionToAvfsClk{m =3D 0x%08x b =3D 0x%08x=
}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1935  			"  .SsCurve            {a =3D 0x%08x b =3D 0x%08x=
 c =3D 0x%08x}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1936  			"  .SsFmin               =3D 0x%04x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1937  			"  .Padding_16           =3D 0x%04x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1938  			pptable->DpmDescriptor[PPCLK_DCLK_0].VoltageMode,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1939  			pptable->DpmDescriptor[PPCLK_DCLK_0].SnapToDiscre=
te,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1940  			pptable->DpmDescriptor[PPCLK_DCLK_0].NumDiscreteL=
evels,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1941  			pptable->DpmDescriptor[PPCLK_DCLK_0].Padding,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1942  			pptable->DpmDescriptor[PPCLK_DCLK_0].ConversionTo=
AvfsClk.m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1943  			pptable->DpmDescriptor[PPCLK_DCLK_0].ConversionTo=
AvfsClk.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1944  			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1945  			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1946  			pptable->DpmDescriptor[PPCLK_DCLK_0].SsCurve.c,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1947  			pptable->DpmDescriptor[PPCLK_DCLK_0].SsFmin,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1948  			pptable->DpmDescriptor[PPCLK_DCLK_0].Padding16);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1949  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1950  	dev_info(smu->adev->dev, "[PPCLK_VCLK_0]\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1951  			"  .VoltageMode          =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1952  			"  .SnapToDiscrete       =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1953  			"  .NumDiscreteLevels    =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1954  			"  .padding              =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1955  			"  .ConversionToAvfsClk{m =3D 0x%08x b =3D 0x%08x=
}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1956  			"  .SsCurve            {a =3D 0x%08x b =3D 0x%08x=
 c =3D 0x%08x}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1957  			"  .SsFmin               =3D 0x%04x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1958  			"  .Padding_16           =3D 0x%04x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1959  			pptable->DpmDescriptor[PPCLK_VCLK_0].VoltageMode,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1960  			pptable->DpmDescriptor[PPCLK_VCLK_0].SnapToDiscre=
te,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1961  			pptable->DpmDescriptor[PPCLK_VCLK_0].NumDiscreteL=
evels,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1962  			pptable->DpmDescriptor[PPCLK_VCLK_0].Padding,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1963  			pptable->DpmDescriptor[PPCLK_VCLK_0].ConversionTo=
AvfsClk.m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1964  			pptable->DpmDescriptor[PPCLK_VCLK_0].ConversionTo=
AvfsClk.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1965  			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1966  			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1967  			pptable->DpmDescriptor[PPCLK_VCLK_0].SsCurve.c,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1968  			pptable->DpmDescriptor[PPCLK_VCLK_0].SsFmin,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1969  			pptable->DpmDescriptor[PPCLK_VCLK_0].Padding16);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1970  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1971  	dev_info(smu->adev->dev, "[PPCLK_DCLK_1]\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1972  			"  .VoltageMode          =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1973  			"  .SnapToDiscrete       =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1974  			"  .NumDiscreteLevels    =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1975  			"  .padding              =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1976  			"  .ConversionToAvfsClk{m =3D 0x%08x b =3D 0x%08x=
}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1977  			"  .SsCurve            {a =3D 0x%08x b =3D 0x%08x=
 c =3D 0x%08x}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1978  			"  .SsFmin               =3D 0x%04x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1979  			"  .Padding_16           =3D 0x%04x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1980  			pptable->DpmDescriptor[PPCLK_DCLK_1].VoltageMode,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1981  			pptable->DpmDescriptor[PPCLK_DCLK_1].SnapToDiscre=
te,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1982  			pptable->DpmDescriptor[PPCLK_DCLK_1].NumDiscreteL=
evels,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1983  			pptable->DpmDescriptor[PPCLK_DCLK_1].Padding,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1984  			pptable->DpmDescriptor[PPCLK_DCLK_1].ConversionTo=
AvfsClk.m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1985  			pptable->DpmDescriptor[PPCLK_DCLK_1].ConversionTo=
AvfsClk.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1986  			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1987  			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1988  			pptable->DpmDescriptor[PPCLK_DCLK_1].SsCurve.c,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1989  			pptable->DpmDescriptor[PPCLK_DCLK_1].SsFmin,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1990  			pptable->DpmDescriptor[PPCLK_DCLK_1].Padding16);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1991  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  1992  	dev_info(smu->adev->dev, "[PPCLK_VCLK_1]\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1993  			"  .VoltageMode          =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1994  			"  .SnapToDiscrete       =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1995  			"  .NumDiscreteLevels    =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1996  			"  .padding              =3D 0x%02x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1997  			"  .ConversionToAvfsClk{m =3D 0x%08x b =3D 0x%08x=
}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1998  			"  .SsCurve            {a =3D 0x%08x b =3D 0x%08x=
 c =3D 0x%08x}\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  1999  			"  .SsFmin               =3D 0x%04x\n"
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2000  			"  .Padding_16           =3D 0x%04x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2001  			pptable->DpmDescriptor[PPCLK_VCLK_1].VoltageMode,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2002  			pptable->DpmDescriptor[PPCLK_VCLK_1].SnapToDiscre=
te,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2003  			pptable->DpmDescriptor[PPCLK_VCLK_1].NumDiscreteL=
evels,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2004  			pptable->DpmDescriptor[PPCLK_VCLK_1].Padding,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2005  			pptable->DpmDescriptor[PPCLK_VCLK_1].ConversionTo=
AvfsClk.m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2006  			pptable->DpmDescriptor[PPCLK_VCLK_1].ConversionTo=
AvfsClk.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2007  			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2008  			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2009  			pptable->DpmDescriptor[PPCLK_VCLK_1].SsCurve.c,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2010  			pptable->DpmDescriptor[PPCLK_VCLK_1].SsFmin,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2011  			pptable->DpmDescriptor[PPCLK_VCLK_1].Padding16);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2012  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2013  	dev_info(smu->adev->dev, "FreqTableGfx\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2014  	for (i =3D 0; i < NUM_GFXCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2015  		dev_info(smu->adev->dev, "  .[%02d] =3D 0x%x\n", i=
, pptable->FreqTableGfx[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2016  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2017  	dev_info(smu->adev->dev, "FreqTableVclk\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2018  	for (i =3D 0; i < NUM_VCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2019  		dev_info(smu->adev->dev, "  .[%02d] =3D 0x%x\n", i=
, pptable->FreqTableVclk[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2020  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2021  	dev_info(smu->adev->dev, "FreqTableDclk\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2022  	for (i =3D 0; i < NUM_DCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2023  		dev_info(smu->adev->dev, "  .[%02d] =3D 0x%x\n", i=
, pptable->FreqTableDclk[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2024  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2025  	dev_info(smu->adev->dev, "FreqTableSocclk\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2026  	for (i =3D 0; i < NUM_SOCCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2027  		dev_info(smu->adev->dev, "  .[%02d] =3D 0x%x\n", i=
, pptable->FreqTableSocclk[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2028  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2029  	dev_info(smu->adev->dev, "FreqTableUclk\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2030  	for (i =3D 0; i < NUM_UCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2031  		dev_info(smu->adev->dev, "  .[%02d] =3D 0x%x\n", i=
, pptable->FreqTableUclk[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2032  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2033  	dev_info(smu->adev->dev, "FreqTableFclk\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2034  	for (i =3D 0; i < NUM_FCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2035  		dev_info(smu->adev->dev, "  .[%02d] =3D 0x%x\n", i=
, pptable->FreqTableFclk[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2036  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2037  	dev_info(smu->adev->dev, "Paddingclks[0] =3D 0x%x\n=
",  pptable->Paddingclks[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2038  	dev_info(smu->adev->dev, "Paddingclks[1] =3D 0x%x\n=
",  pptable->Paddingclks[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2039  	dev_info(smu->adev->dev, "Paddingclks[2] =3D 0x%x\n=
",  pptable->Paddingclks[2]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2040  	dev_info(smu->adev->dev, "Paddingclks[3] =3D 0x%x\n=
",  pptable->Paddingclks[3]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2041  	dev_info(smu->adev->dev, "Paddingclks[4] =3D 0x%x\n=
",  pptable->Paddingclks[4]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2042  	dev_info(smu->adev->dev, "Paddingclks[5] =3D 0x%x\n=
",  pptable->Paddingclks[5]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2043  	dev_info(smu->adev->dev, "Paddingclks[6] =3D 0x%x\n=
",  pptable->Paddingclks[6]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2044  	dev_info(smu->adev->dev, "Paddingclks[7] =3D 0x%x\n=
",  pptable->Paddingclks[7]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2045  	dev_info(smu->adev->dev, "Paddingclks[8] =3D 0x%x\n=
",  pptable->Paddingclks[8]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2046  	dev_info(smu->adev->dev, "Paddingclks[9] =3D 0x%x\n=
",  pptable->Paddingclks[9]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2047  	dev_info(smu->adev->dev, "Paddingclks[10] =3D 0x%x\=
n", pptable->Paddingclks[10]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2048  	dev_info(smu->adev->dev, "Paddingclks[11] =3D 0x%x\=
n", pptable->Paddingclks[11]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2049  	dev_info(smu->adev->dev, "Paddingclks[12] =3D 0x%x\=
n", pptable->Paddingclks[12]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2050  	dev_info(smu->adev->dev, "Paddingclks[13] =3D 0x%x\=
n", pptable->Paddingclks[13]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2051  	dev_info(smu->adev->dev, "Paddingclks[14] =3D 0x%x\=
n", pptable->Paddingclks[14]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2052  	dev_info(smu->adev->dev, "Paddingclks[15] =3D 0x%x\=
n", pptable->Paddingclks[15]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2053  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2054  	dev_info(smu->adev->dev, "DcModeMaxFreq\n");
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2055  	dev_info(smu->adev->dev, "  .PPCLK_GFXCLK =3D 0x%x\=
n", pptable->DcModeMaxFreq[PPCLK_GFXCLK]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2056  	dev_info(smu->adev->dev, "  .PPCLK_SOCCLK =3D 0x%x\=
n", pptable->DcModeMaxFreq[PPCLK_SOCCLK]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2057  	dev_info(smu->adev->dev, "  .PPCLK_UCLK   =3D 0x%x\=
n", pptable->DcModeMaxFreq[PPCLK_UCLK]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2058  	dev_info(smu->adev->dev, "  .PPCLK_FCLK   =3D 0x%x\=
n", pptable->DcModeMaxFreq[PPCLK_FCLK]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2059  	dev_info(smu->adev->dev, "  .PPCLK_DCLK_0 =3D 0x%x\=
n", pptable->DcModeMaxFreq[PPCLK_DCLK_0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2060  	dev_info(smu->adev->dev, "  .PPCLK_VCLK_0 =3D 0x%x\=
n", pptable->DcModeMaxFreq[PPCLK_VCLK_0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2061  	dev_info(smu->adev->dev, "  .PPCLK_DCLK_1 =3D 0x%x\=
n", pptable->DcModeMaxFreq[PPCLK_DCLK_1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2062  	dev_info(smu->adev->dev, "  .PPCLK_VCLK_1 =3D 0x%x\=
n", pptable->DcModeMaxFreq[PPCLK_VCLK_1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2063  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2064  	dev_info(smu->adev->dev, "FreqTableUclkDiv\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2065  	for (i =3D 0; i < NUM_UCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2066  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->FreqTableUclkDiv[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2067  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2068  	dev_info(smu->adev->dev, "FclkBoostFreq =3D 0x%x\n"=
, pptable->FclkBoostFreq);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2069  	dev_info(smu->adev->dev, "FclkParamPadding =3D 0x%x=
\n", pptable->FclkParamPadding);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2070  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2071  	dev_info(smu->adev->dev, "Mp0clkFreq\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2072  	for (i =3D 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2073  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->Mp0clkFreq[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2074  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2075  	dev_info(smu->adev->dev, "Mp0DpmVoltage\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2076  	for (i =3D 0; i < NUM_MP0CLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2077  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->Mp0DpmVoltage[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2078  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2079  	dev_info(smu->adev->dev, "MemVddciVoltage\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2080  	for (i =3D 0; i < NUM_UCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2081  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->MemVddciVoltage[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2082  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2083  	dev_info(smu->adev->dev, "MemMvddVoltage\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2084  	for (i =3D 0; i < NUM_UCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2085  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->MemMvddVoltage[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2086  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2087  	dev_info(smu->adev->dev, "GfxclkFgfxoffEntry =3D 0x=
%x\n", pptable->GfxclkFgfxoffEntry);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2088  	dev_info(smu->adev->dev, "GfxclkFinit =3D 0x%x\n", =
pptable->GfxclkFinit);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2089  	dev_info(smu->adev->dev, "GfxclkFidle =3D 0x%x\n", =
pptable->GfxclkFidle);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2090  	dev_info(smu->adev->dev, "GfxclkSource =3D 0x%x\n",=
 pptable->GfxclkSource);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2091  	dev_info(smu->adev->dev, "GfxclkPadding =3D 0x%x\n"=
, pptable->GfxclkPadding);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2092  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2093  	dev_info(smu->adev->dev, "GfxGpoSubFeatureMask =3D =
0x%x\n", pptable->GfxGpoSubFeatureMask);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2094  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2095  	dev_info(smu->adev->dev, "GfxGpoEnabledWorkPolicyMa=
sk =3D 0x%x\n", pptable->GfxGpoEnabledWorkPolicyMask);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2096  	dev_info(smu->adev->dev, "GfxGpoDisabledWorkPolicyM=
ask =3D 0x%x\n", pptable->GfxGpoDisabledWorkPolicyMask);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2097  	dev_info(smu->adev->dev, "GfxGpoPadding[0] =3D 0x%x=
\n", pptable->GfxGpoPadding[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2098  	dev_info(smu->adev->dev, "GfxGpoVotingAllow =3D 0x%=
x\n", pptable->GfxGpoVotingAllow);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2099  	dev_info(smu->adev->dev, "GfxGpoPadding32[0] =3D 0x=
%x\n", pptable->GfxGpoPadding32[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2100  	dev_info(smu->adev->dev, "GfxGpoPadding32[1] =3D 0x=
%x\n", pptable->GfxGpoPadding32[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2101  	dev_info(smu->adev->dev, "GfxGpoPadding32[2] =3D 0x=
%x\n", pptable->GfxGpoPadding32[2]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2102  	dev_info(smu->adev->dev, "GfxGpoPadding32[3] =3D 0x=
%x\n", pptable->GfxGpoPadding32[3]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2103  	dev_info(smu->adev->dev, "GfxDcsFopt =3D 0x%x\n", p=
ptable->GfxDcsFopt);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2104  	dev_info(smu->adev->dev, "GfxDcsFclkFopt =3D 0x%x\n=
", pptable->GfxDcsFclkFopt);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2105  	dev_info(smu->adev->dev, "GfxDcsUclkFopt =3D 0x%x\n=
", pptable->GfxDcsUclkFopt);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2106  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2107  	dev_info(smu->adev->dev, "DcsGfxOffVoltage =3D 0x%x=
\n", pptable->DcsGfxOffVoltage);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2108  	dev_info(smu->adev->dev, "DcsMinGfxOffTime =3D 0x%x=
\n", pptable->DcsMinGfxOffTime);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2109  	dev_info(smu->adev->dev, "DcsMaxGfxOffTime =3D 0x%x=
\n", pptable->DcsMaxGfxOffTime);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2110  	dev_info(smu->adev->dev, "DcsMinCreditAccum =3D 0x%=
x\n", pptable->DcsMinCreditAccum);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2111  	dev_info(smu->adev->dev, "DcsExitHysteresis =3D 0x%=
x\n", pptable->DcsExitHysteresis);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2112  	dev_info(smu->adev->dev, "DcsTimeout =3D 0x%x\n", p=
ptable->DcsTimeout);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2113  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2114  	dev_info(smu->adev->dev, "DcsParamPadding[0] =3D 0x=
%x\n", pptable->DcsParamPadding[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2115  	dev_info(smu->adev->dev, "DcsParamPadding[1] =3D 0x=
%x\n", pptable->DcsParamPadding[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2116  	dev_info(smu->adev->dev, "DcsParamPadding[2] =3D 0x=
%x\n", pptable->DcsParamPadding[2]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2117  	dev_info(smu->adev->dev, "DcsParamPadding[3] =3D 0x=
%x\n", pptable->DcsParamPadding[3]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2118  	dev_info(smu->adev->dev, "DcsParamPadding[4] =3D 0x=
%x\n", pptable->DcsParamPadding[4]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2119  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2120  	dev_info(smu->adev->dev, "FlopsPerByteTable\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2121  	for (i =3D 0; i < RLC_PACE_TABLE_NUM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2122  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->FlopsPerByteTable[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2123  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2124  	dev_info(smu->adev->dev, "LowestUclkReservedForUlv =
=3D 0x%x\n", pptable->LowestUclkReservedForUlv);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2125  	dev_info(smu->adev->dev, "vddingMem[0] =3D 0x%x\n",=
 pptable->PaddingMem[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2126  	dev_info(smu->adev->dev, "vddingMem[1] =3D 0x%x\n",=
 pptable->PaddingMem[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2127  	dev_info(smu->adev->dev, "vddingMem[2] =3D 0x%x\n",=
 pptable->PaddingMem[2]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2128  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2129  	dev_info(smu->adev->dev, "UclkDpmPstates\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2130  	for (i =3D 0; i < NUM_UCLK_DPM_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2131  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->UclkDpmPstates[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2132  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2133  	dev_info(smu->adev->dev, "UclkDpmSrcFreqRange\n");
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2134  	dev_info(smu->adev->dev, "  .Fmin =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2135  		pptable->UclkDpmSrcFreqRange.Fmin);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2136  	dev_info(smu->adev->dev, "  .Fmax =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2137  		pptable->UclkDpmSrcFreqRange.Fmax);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2138  	dev_info(smu->adev->dev, "UclkDpmTargFreqRange\n");
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2139  	dev_info(smu->adev->dev, "  .Fmin =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2140  		pptable->UclkDpmTargFreqRange.Fmin);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2141  	dev_info(smu->adev->dev, "  .Fmax =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2142  		pptable->UclkDpmTargFreqRange.Fmax);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2143  	dev_info(smu->adev->dev, "UclkDpmMidstepFreq =3D 0x=
%x\n", pptable->UclkDpmMidstepFreq);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2144  	dev_info(smu->adev->dev, "UclkMidstepPadding =3D 0x=
%x\n", pptable->UclkMidstepPadding);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2145  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2146  	dev_info(smu->adev->dev, "PcieGenSpeed\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2147  	for (i =3D 0; i < NUM_LINK_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2148  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->PcieGenSpeed[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2149  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2150  	dev_info(smu->adev->dev, "PcieLaneCount\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2151  	for (i =3D 0; i < NUM_LINK_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2152  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->PcieLaneCount[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2153  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2154  	dev_info(smu->adev->dev, "LclkFreq\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2155  	for (i =3D 0; i < NUM_LINK_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2156  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->LclkFreq[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2157  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2158  	dev_info(smu->adev->dev, "FanStopTemp =3D 0x%x\n", =
pptable->FanStopTemp);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2159  	dev_info(smu->adev->dev, "FanStartTemp =3D 0x%x\n",=
 pptable->FanStartTemp);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2160  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2161  	dev_info(smu->adev->dev, "FanGain\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2162  	for (i =3D 0; i < TEMP_COUNT; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2163  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->FanGain[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2164  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2165  	dev_info(smu->adev->dev, "FanPwmMin =3D 0x%x\n", pp=
table->FanPwmMin);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2166  	dev_info(smu->adev->dev, "FanAcousticLimitRpm =3D 0=
x%x\n", pptable->FanAcousticLimitRpm);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2167  	dev_info(smu->adev->dev, "FanThrottlingRpm =3D 0x%x=
\n", pptable->FanThrottlingRpm);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2168  	dev_info(smu->adev->dev, "FanMaximumRpm =3D 0x%x\n"=
, pptable->FanMaximumRpm);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2169  	dev_info(smu->adev->dev, "MGpuFanBoostLimitRpm =3D =
0x%x\n", pptable->MGpuFanBoostLimitRpm);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2170  	dev_info(smu->adev->dev, "FanTargetTemperature =3D =
0x%x\n", pptable->FanTargetTemperature);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2171  	dev_info(smu->adev->dev, "FanTargetGfxclk =3D 0x%x\=
n", pptable->FanTargetGfxclk);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2172  	dev_info(smu->adev->dev, "FanPadding16 =3D 0x%x\n",=
 pptable->FanPadding16);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2173  	dev_info(smu->adev->dev, "FanTempInputSelect =3D 0x=
%x\n", pptable->FanTempInputSelect);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2174  	dev_info(smu->adev->dev, "FanPadding =3D 0x%x\n", p=
ptable->FanPadding);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2175  	dev_info(smu->adev->dev, "FanZeroRpmEnable =3D 0x%x=
\n", pptable->FanZeroRpmEnable);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2176  	dev_info(smu->adev->dev, "FanTachEdgePerRev =3D 0x%=
x\n", pptable->FanTachEdgePerRev);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2177  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2178  	dev_info(smu->adev->dev, "FuzzyFan_ErrorSetDelta =
=3D 0x%x\n", pptable->FuzzyFan_ErrorSetDelta);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2179  	dev_info(smu->adev->dev, "FuzzyFan_ErrorRateSetDelt=
a =3D 0x%x\n", pptable->FuzzyFan_ErrorRateSetDelta);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2180  	dev_info(smu->adev->dev, "FuzzyFan_PwmSetDelta =3D =
0x%x\n", pptable->FuzzyFan_PwmSetDelta);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2181  	dev_info(smu->adev->dev, "FuzzyFan_Reserved =3D 0x%=
x\n", pptable->FuzzyFan_Reserved);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2182  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2183  	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTA=
GE_GFX] =3D 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_GFX]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2184  	dev_info(smu->adev->dev, "OverrideAvfsGb[AVFS_VOLTA=
GE_SOC] =3D 0x%x\n", pptable->OverrideAvfsGb[AVFS_VOLTAGE_SOC]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2185  	dev_info(smu->adev->dev, "dBtcGbGfxDfllModelSelect =
=3D 0x%x\n", pptable->dBtcGbGfxDfllModelSelect);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2186  	dev_info(smu->adev->dev, "Padding8_Avfs =3D 0x%x\n"=
, pptable->Padding8_Avfs);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2187  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2188  	dev_info(smu->adev->dev, "qAvfsGb[AVFS_VOLTAGE_GFX]=
{a =3D 0x%x b =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2189  			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2190  			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2191  			pptable->qAvfsGb[AVFS_VOLTAGE_GFX].c);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2192  	dev_info(smu->adev->dev, "qAvfsGb[AVFS_VOLTAGE_SOC]=
{a =3D 0x%x b =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2193  			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2194  			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2195  			pptable->qAvfsGb[AVFS_VOLTAGE_SOC].c);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2196  	dev_info(smu->adev->dev, "dBtcGbGfxPll{a =3D 0x%x b=
 =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2197  			pptable->dBtcGbGfxPll.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2198  			pptable->dBtcGbGfxPll.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2199  			pptable->dBtcGbGfxPll.c);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2200  	dev_info(smu->adev->dev, "dBtcGbGfxAfll{a =3D 0x%x =
b =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2201  			pptable->dBtcGbGfxDfll.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2202  			pptable->dBtcGbGfxDfll.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2203  			pptable->dBtcGbGfxDfll.c);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2204  	dev_info(smu->adev->dev, "dBtcGbSoc{a =3D 0x%x b =
=3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2205  			pptable->dBtcGbSoc.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2206  			pptable->dBtcGbSoc.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2207  			pptable->dBtcGbSoc.c);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2208  	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_GFX=
]{m =3D 0x%x b =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2209  			pptable->qAgingGb[AVFS_VOLTAGE_GFX].m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2210  			pptable->qAgingGb[AVFS_VOLTAGE_GFX].b);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2211  	dev_info(smu->adev->dev, "qAgingGb[AVFS_VOLTAGE_SOC=
]{m =3D 0x%x b =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2212  			pptable->qAgingGb[AVFS_VOLTAGE_SOC].m,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2213  			pptable->qAgingGb[AVFS_VOLTAGE_SOC].b);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2214  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2215  	dev_info(smu->adev->dev, "PiecewiseLinearDroopIntGf=
xDfll\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2216  	for (i =3D 0; i < NUM_PIECE_WISE_LINEAR_DROOP_MODEL=
_VF_POINTS; i++) {
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2217  		dev_info(smu->adev->dev, "		Fset[%d] =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2218  			i, pptable->PiecewiseLinearDroopIntGfxDfll.Fset[i=
]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2219  		dev_info(smu->adev->dev, "		Vdroop[%d] =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2220  			i, pptable->PiecewiseLinearDroopIntGfxDfll.Vdroop=
[i]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2221  	}
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2222  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2223  	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS=
_VOLTAGE_GFX]{a =3D 0x%x b =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2224  			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2225  			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2226  			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_GFX].c=
);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2227  	dev_info(smu->adev->dev, "qStaticVoltageOffset[AVFS=
_VOLTAGE_SOC]{a =3D 0x%x b =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2228  			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2229  			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2230  			pptable->qStaticVoltageOffset[AVFS_VOLTAGE_SOC].c=
);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2231  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2232  	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_GFX] =
=3D 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_GFX]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2233  	dev_info(smu->adev->dev, "DcTol[AVFS_VOLTAGE_SOC] =
=3D 0x%x\n", pptable->DcTol[AVFS_VOLTAGE_SOC]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2234  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2235  	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE=
_GFX] =3D 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_GFX]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2236  	dev_info(smu->adev->dev, "DcBtcEnabled[AVFS_VOLTAGE=
_SOC] =3D 0x%x\n", pptable->DcBtcEnabled[AVFS_VOLTAGE_SOC]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2237  	dev_info(smu->adev->dev, "Padding8_GfxBtc[0] =3D 0x=
%x\n", pptable->Padding8_GfxBtc[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2238  	dev_info(smu->adev->dev, "Padding8_GfxBtc[1] =3D 0x=
%x\n", pptable->Padding8_GfxBtc[1]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2239  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2240  	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_GFX=
] =3D 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_GFX]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2241  	dev_info(smu->adev->dev, "DcBtcMin[AVFS_VOLTAGE_SOC=
] =3D 0x%x\n", pptable->DcBtcMin[AVFS_VOLTAGE_SOC]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2242  	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_GFX=
] =3D 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_GFX]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2243  	dev_info(smu->adev->dev, "DcBtcMax[AVFS_VOLTAGE_SOC=
] =3D 0x%x\n", pptable->DcBtcMax[AVFS_VOLTAGE_SOC]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2244  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2245  	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_GFX]=
 =3D 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_GFX]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2246  	dev_info(smu->adev->dev, "DcBtcGb[AVFS_VOLTAGE_SOC]=
 =3D 0x%x\n", pptable->DcBtcGb[AVFS_VOLTAGE_SOC]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2247  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2248  	dev_info(smu->adev->dev, "XgmiDpmPstates\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2249  	for (i =3D 0; i < NUM_XGMI_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2250  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->XgmiDpmPstates[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2251  	dev_info(smu->adev->dev, "XgmiDpmSpare[0] =3D 0x%02=
x\n", pptable->XgmiDpmSpare[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2252  	dev_info(smu->adev->dev, "XgmiDpmSpare[1] =3D 0x%02=
x\n", pptable->XgmiDpmSpare[1]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2253  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2254  	dev_info(smu->adev->dev, "DebugOverrides =3D 0x%x\n=
", pptable->DebugOverrides);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2255  	dev_info(smu->adev->dev, "ReservedEquation0{a =3D 0=
x%x b =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2256  			pptable->ReservedEquation0.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2257  			pptable->ReservedEquation0.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2258  			pptable->ReservedEquation0.c);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2259  	dev_info(smu->adev->dev, "ReservedEquation1{a =3D 0=
x%x b =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2260  			pptable->ReservedEquation1.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2261  			pptable->ReservedEquation1.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2262  			pptable->ReservedEquation1.c);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2263  	dev_info(smu->adev->dev, "ReservedEquation2{a =3D 0=
x%x b =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2264  			pptable->ReservedEquation2.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2265  			pptable->ReservedEquation2.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2266  			pptable->ReservedEquation2.c);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2267  	dev_info(smu->adev->dev, "ReservedEquation3{a =3D 0=
x%x b =3D 0x%x c =3D 0x%x}\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2268  			pptable->ReservedEquation3.a,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2269  			pptable->ReservedEquation3.b,
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2270  			pptable->ReservedEquation3.c);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2271  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2272  	dev_info(smu->adev->dev, "SkuReserved[0] =3D 0x%x\n=
", pptable->SkuReserved[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2273  	dev_info(smu->adev->dev, "SkuReserved[1] =3D 0x%x\n=
", pptable->SkuReserved[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2274  	dev_info(smu->adev->dev, "SkuReserved[2] =3D 0x%x\n=
", pptable->SkuReserved[2]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2275  	dev_info(smu->adev->dev, "SkuReserved[3] =3D 0x%x\n=
", pptable->SkuReserved[3]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2276  	dev_info(smu->adev->dev, "SkuReserved[4] =3D 0x%x\n=
", pptable->SkuReserved[4]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2277  	dev_info(smu->adev->dev, "SkuReserved[5] =3D 0x%x\n=
", pptable->SkuReserved[5]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2278  	dev_info(smu->adev->dev, "SkuReserved[6] =3D 0x%x\n=
", pptable->SkuReserved[6]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2279  	dev_info(smu->adev->dev, "SkuReserved[7] =3D 0x%x\n=
", pptable->SkuReserved[7]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05 @2280  	dev_info(smu->adev->dev, "SkuReserved[8] =3D 0x%x\n=
", pptable->SkuReserved[8]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2281  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2282  	dev_info(smu->adev->dev, "GamingClk[0] =3D 0x%x\n",=
 pptable->GamingClk[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2283  	dev_info(smu->adev->dev, "GamingClk[1] =3D 0x%x\n",=
 pptable->GamingClk[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2284  	dev_info(smu->adev->dev, "GamingClk[2] =3D 0x%x\n",=
 pptable->GamingClk[2]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2285  	dev_info(smu->adev->dev, "GamingClk[3] =3D 0x%x\n",=
 pptable->GamingClk[3]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2286  	dev_info(smu->adev->dev, "GamingClk[4] =3D 0x%x\n",=
 pptable->GamingClk[4]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2287  	dev_info(smu->adev->dev, "GamingClk[5] =3D 0x%x\n",=
 pptable->GamingClk[5]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2288  =

b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2289  	for (i =3D 0; i < NUM_I2C_CONTROLLERS; i++) {
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2290  		dev_info(smu->adev->dev, "I2cControllers[%d]:\n", =
i);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2291  		dev_info(smu->adev->dev, "                   .Enab=
led =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2292  				pptable->I2cControllers[i].Enabled);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2293  		dev_info(smu->adev->dev, "                   .Spee=
d =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2294  				pptable->I2cControllers[i].Speed);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2295  		dev_info(smu->adev->dev, "                   .Slav=
eAddress =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2296  				pptable->I2cControllers[i].SlaveAddress);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2297  		dev_info(smu->adev->dev, "                   .Cont=
rollerPort =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2298  				pptable->I2cControllers[i].ControllerPort);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2299  		dev_info(smu->adev->dev, "                   .Cont=
rollerName =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2300  				pptable->I2cControllers[i].ControllerName);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2301  		dev_info(smu->adev->dev, "                   .Ther=
malThrottler =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2302  				pptable->I2cControllers[i].ThermalThrotter);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2303  		dev_info(smu->adev->dev, "                   .I2cP=
rotocol =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2304  				pptable->I2cControllers[i].I2cProtocol);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2305  		dev_info(smu->adev->dev, "                   .Padd=
ingConfig =3D 0x%x\n",
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2306  				pptable->I2cControllers[i].PaddingConfig);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2307  	}
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2308  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2309  	dev_info(smu->adev->dev, "GpioScl =3D 0x%x\n", ppta=
ble->GpioScl);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2310  	dev_info(smu->adev->dev, "GpioSda =3D 0x%x\n", ppta=
ble->GpioSda);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2311  	dev_info(smu->adev->dev, "FchUsbPdSlaveAddr =3D 0x%=
x\n", pptable->FchUsbPdSlaveAddr);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2312  	dev_info(smu->adev->dev, "I2cSpare[0] =3D 0x%x\n", =
pptable->I2cSpare[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2313  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2314  	dev_info(smu->adev->dev, "Board Parameters:\n");
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2315  	dev_info(smu->adev->dev, "VddGfxVrMapping =3D 0x%x\=
n", pptable->VddGfxVrMapping);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2316  	dev_info(smu->adev->dev, "VddSocVrMapping =3D 0x%x\=
n", pptable->VddSocVrMapping);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2317  	dev_info(smu->adev->dev, "VddMem0VrMapping =3D 0x%x=
\n", pptable->VddMem0VrMapping);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2318  	dev_info(smu->adev->dev, "VddMem1VrMapping =3D 0x%x=
\n", pptable->VddMem1VrMapping);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2319  	dev_info(smu->adev->dev, "GfxUlvPhaseSheddingMask =
=3D 0x%x\n", pptable->GfxUlvPhaseSheddingMask);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2320  	dev_info(smu->adev->dev, "SocUlvPhaseSheddingMask =
=3D 0x%x\n", pptable->SocUlvPhaseSheddingMask);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2321  	dev_info(smu->adev->dev, "VddciUlvPhaseSheddingMask=
 =3D 0x%x\n", pptable->VddciUlvPhaseSheddingMask);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2322  	dev_info(smu->adev->dev, "MvddUlvPhaseSheddingMask =
=3D 0x%x\n", pptable->MvddUlvPhaseSheddingMask);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2323  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2324  	dev_info(smu->adev->dev, "GfxMaxCurrent =3D 0x%x\n"=
, pptable->GfxMaxCurrent);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2325  	dev_info(smu->adev->dev, "GfxOffset =3D 0x%x\n", pp=
table->GfxOffset);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2326  	dev_info(smu->adev->dev, "Padding_TelemetryGfx =3D =
0x%x\n", pptable->Padding_TelemetryGfx);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2327  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2328  	dev_info(smu->adev->dev, "SocMaxCurrent =3D 0x%x\n"=
, pptable->SocMaxCurrent);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2329  	dev_info(smu->adev->dev, "SocOffset =3D 0x%x\n", pp=
table->SocOffset);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2330  	dev_info(smu->adev->dev, "Padding_TelemetrySoc =3D =
0x%x\n", pptable->Padding_TelemetrySoc);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2331  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2332  	dev_info(smu->adev->dev, "Mem0MaxCurrent =3D 0x%x\n=
", pptable->Mem0MaxCurrent);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2333  	dev_info(smu->adev->dev, "Mem0Offset =3D 0x%x\n", p=
ptable->Mem0Offset);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2334  	dev_info(smu->adev->dev, "Padding_TelemetryMem0 =3D=
 0x%x\n", pptable->Padding_TelemetryMem0);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2335  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2336  	dev_info(smu->adev->dev, "Mem1MaxCurrent =3D 0x%x\n=
", pptable->Mem1MaxCurrent);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2337  	dev_info(smu->adev->dev, "Mem1Offset =3D 0x%x\n", p=
ptable->Mem1Offset);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2338  	dev_info(smu->adev->dev, "Padding_TelemetryMem1 =3D=
 0x%x\n", pptable->Padding_TelemetryMem1);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2339  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2340  	dev_info(smu->adev->dev, "MvddRatio =3D 0x%x\n", pp=
table->MvddRatio);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2341  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2342  	dev_info(smu->adev->dev, "AcDcGpio =3D 0x%x\n", ppt=
able->AcDcGpio);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2343  	dev_info(smu->adev->dev, "AcDcPolarity =3D 0x%x\n",=
 pptable->AcDcPolarity);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2344  	dev_info(smu->adev->dev, "VR0HotGpio =3D 0x%x\n", p=
ptable->VR0HotGpio);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2345  	dev_info(smu->adev->dev, "VR0HotPolarity =3D 0x%x\n=
", pptable->VR0HotPolarity);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2346  	dev_info(smu->adev->dev, "VR1HotGpio =3D 0x%x\n", p=
ptable->VR1HotGpio);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2347  	dev_info(smu->adev->dev, "VR1HotPolarity =3D 0x%x\n=
", pptable->VR1HotPolarity);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2348  	dev_info(smu->adev->dev, "GthrGpio =3D 0x%x\n", ppt=
able->GthrGpio);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2349  	dev_info(smu->adev->dev, "GthrPolarity =3D 0x%x\n",=
 pptable->GthrPolarity);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2350  	dev_info(smu->adev->dev, "LedPin0 =3D 0x%x\n", ppta=
ble->LedPin0);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2351  	dev_info(smu->adev->dev, "LedPin1 =3D 0x%x\n", ppta=
ble->LedPin1);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2352  	dev_info(smu->adev->dev, "LedPin2 =3D 0x%x\n", ppta=
ble->LedPin2);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2353  	dev_info(smu->adev->dev, "LedEnableMask =3D 0x%x\n"=
, pptable->LedEnableMask);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2354  	dev_info(smu->adev->dev, "LedPcie =3D 0x%x\n", ppta=
ble->LedPcie);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2355  	dev_info(smu->adev->dev, "LedError =3D 0x%x\n", ppt=
able->LedError);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2356  	dev_info(smu->adev->dev, "LedSpare1[0] =3D 0x%x\n",=
 pptable->LedSpare1[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2357  	dev_info(smu->adev->dev, "LedSpare1[1] =3D 0x%x\n",=
 pptable->LedSpare1[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2358  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2359  	dev_info(smu->adev->dev, "PllGfxclkSpreadEnabled =
=3D 0x%x\n", pptable->PllGfxclkSpreadEnabled);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2360  	dev_info(smu->adev->dev, "PllGfxclkSpreadPercent =
=3D 0x%x\n", pptable->PllGfxclkSpreadPercent);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2361  	dev_info(smu->adev->dev, "PllGfxclkSpreadFreq =3D 0=
x%x\n",    pptable->PllGfxclkSpreadFreq);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2362  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2363  	dev_info(smu->adev->dev, "DfllGfxclkSpreadEnabled =
=3D 0x%x\n", pptable->DfllGfxclkSpreadEnabled);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2364  	dev_info(smu->adev->dev, "DfllGfxclkSpreadPercent =
=3D 0x%x\n", pptable->DfllGfxclkSpreadPercent);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2365  	dev_info(smu->adev->dev, "DfllGfxclkSpreadFreq =3D =
0x%x\n",    pptable->DfllGfxclkSpreadFreq);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2366  =

f0f3d68e67ea2f7 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-06-24  2367  	dev_info(smu->adev->dev, "UclkSpreadPadding =3D 0x%=
x\n", pptable->UclkSpreadPadding);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2368  	dev_info(smu->adev->dev, "UclkSpreadFreq =3D 0x%x\n=
", pptable->UclkSpreadFreq);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2369  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2370  	dev_info(smu->adev->dev, "FclkSpreadEnabled =3D 0x%=
x\n", pptable->FclkSpreadEnabled);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2371  	dev_info(smu->adev->dev, "FclkSpreadPercent =3D 0x%=
x\n", pptable->FclkSpreadPercent);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2372  	dev_info(smu->adev->dev, "FclkSpreadFreq =3D 0x%x\n=
", pptable->FclkSpreadFreq);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2373  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2374  	dev_info(smu->adev->dev, "MemoryChannelEnabled =3D =
0x%x\n", pptable->MemoryChannelEnabled);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2375  	dev_info(smu->adev->dev, "DramBitWidth =3D 0x%x\n",=
 pptable->DramBitWidth);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2376  	dev_info(smu->adev->dev, "PaddingMem1[0] =3D 0x%x\n=
", pptable->PaddingMem1[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2377  	dev_info(smu->adev->dev, "PaddingMem1[1] =3D 0x%x\n=
", pptable->PaddingMem1[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2378  	dev_info(smu->adev->dev, "PaddingMem1[2] =3D 0x%x\n=
", pptable->PaddingMem1[2]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2379  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2380  	dev_info(smu->adev->dev, "TotalBoardPower =3D 0x%x\=
n", pptable->TotalBoardPower);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2381  	dev_info(smu->adev->dev, "BoardPowerPadding =3D 0x%=
x\n", pptable->BoardPowerPadding);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2382  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2383  	dev_info(smu->adev->dev, "XgmiLinkSpeed\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2384  	for (i =3D 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2385  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->XgmiLinkSpeed[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2386  	dev_info(smu->adev->dev, "XgmiLinkWidth\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2387  	for (i =3D 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2388  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->XgmiLinkWidth[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2389  	dev_info(smu->adev->dev, "XgmiFclkFreq\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2390  	for (i =3D 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2391  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->XgmiFclkFreq[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2392  	dev_info(smu->adev->dev, "XgmiSocVoltage\n");
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2393  	for (i =3D 0; i < NUM_XGMI_PSTATE_LEVELS; i++)
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2394  		dev_info(smu->adev->dev, "  .[%d] =3D 0x%x\n", i, =
pptable->XgmiSocVoltage[i]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2395  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2396  	dev_info(smu->adev->dev, "HsrEnabled =3D 0x%x\n", p=
ptable->HsrEnabled);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2397  	dev_info(smu->adev->dev, "VddqOffEnabled =3D 0x%x\n=
", pptable->VddqOffEnabled);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2398  	dev_info(smu->adev->dev, "PaddingUmcFlags[0] =3D 0x=
%x\n", pptable->PaddingUmcFlags[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2399  	dev_info(smu->adev->dev, "PaddingUmcFlags[1] =3D 0x=
%x\n", pptable->PaddingUmcFlags[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2400  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2401  	dev_info(smu->adev->dev, "BoardReserved[0] =3D 0x%x=
\n", pptable->BoardReserved[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2402  	dev_info(smu->adev->dev, "BoardReserved[1] =3D 0x%x=
\n", pptable->BoardReserved[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2403  	dev_info(smu->adev->dev, "BoardReserved[2] =3D 0x%x=
\n", pptable->BoardReserved[2]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2404  	dev_info(smu->adev->dev, "BoardReserved[3] =3D 0x%x=
\n", pptable->BoardReserved[3]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2405  	dev_info(smu->adev->dev, "BoardReserved[4] =3D 0x%x=
\n", pptable->BoardReserved[4]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2406  	dev_info(smu->adev->dev, "BoardReserved[5] =3D 0x%x=
\n", pptable->BoardReserved[5]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2407  	dev_info(smu->adev->dev, "BoardReserved[6] =3D 0x%x=
\n", pptable->BoardReserved[6]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2408  	dev_info(smu->adev->dev, "BoardReserved[7] =3D 0x%x=
\n", pptable->BoardReserved[7]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2409  	dev_info(smu->adev->dev, "BoardReserved[8] =3D 0x%x=
\n", pptable->BoardReserved[8]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2410  	dev_info(smu->adev->dev, "BoardReserved[9] =3D 0x%x=
\n", pptable->BoardReserved[9]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2411  	dev_info(smu->adev->dev, "BoardReserved[10] =3D 0x%=
x\n", pptable->BoardReserved[10]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2412  =

d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2413  	dev_info(smu->adev->dev, "MmHubPadding[0] =3D 0x%x\=
n", pptable->MmHubPadding[0]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2414  	dev_info(smu->adev->dev, "MmHubPadding[1] =3D 0x%x\=
n", pptable->MmHubPadding[1]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2415  	dev_info(smu->adev->dev, "MmHubPadding[2] =3D 0x%x\=
n", pptable->MmHubPadding[2]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2416  	dev_info(smu->adev->dev, "MmHubPadding[3] =3D 0x%x\=
n", pptable->MmHubPadding[3]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2417  	dev_info(smu->adev->dev, "MmHubPadding[4] =3D 0x%x\=
n", pptable->MmHubPadding[4]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2418  	dev_info(smu->adev->dev, "MmHubPadding[5] =3D 0x%x\=
n", pptable->MmHubPadding[5]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2419  	dev_info(smu->adev->dev, "MmHubPadding[6] =3D 0x%x\=
n", pptable->MmHubPadding[6]);
d9811cfc0ebdf50 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Evan Qua=
n    2020-06-05  2420  	dev_info(smu->adev->dev, "MmHubPadding[7] =3D 0x%x\=
n", pptable->MmHubPadding[7]);
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2421  }
b455159c053130d drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c Likun Ga=
o    2020-05-29  2422  =


:::::: The code at line 2280 was first introduced by commit
:::::: d9811cfc0ebdf50e5a3f43ad8397749e880a8960 drm/amd/powerplay: use MGPU=
 friendly err/warn/info/dbg messages

:::::: TO: Evan Quan <evan.quan@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3283781531164296016==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3283781531164296016==--


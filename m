Content-Type: multipart/mixed; boundary="===============7857306487459656166=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 1440/2818] sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:55:2: warning: Value stored to 'pdm_ctrl' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 12 Dec 2021 11:43:12 +0800
Message-ID: <202112121130.Q9Cu5N6u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7857306487459656166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   b4852fbf90916fdc2f1e0e282e100f7e0e889d77
commit: b86615571e3d8bd49bcc434a42d9070e2806e35d [1440/2818] CHROMIUM: ASoC=
: amd: enable renoir audio driver build
:::::: branch date: 21 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-c001-20211210 (https://download.01.org/0day-ci/arch=
ive/20211212/202112121130.Q9Cu5N6u-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout b86615571e3d8bd49bcc434a42d9070e2806e35d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   sound/soc/codecs/tas2764.c:54:23: warning: Value stored to 'tas2764' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tas2764_priv *tas2764 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/codecs/tas2764.c:54:23: note: Value stored to 'tas2764' during=
 its initialization is never read
           struct tas2764_priv *tas2764 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/gpu/drm/i915/i915_gpu_error.c:1018:2: warning: Call to function =
'strcpy' is insecure as it does not provide bounding of the memory buffer. =
Replace unbounded copy functions with analogous functions that support leng=
th arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAP=
I.strcpy]
           strcpy(dst->name, name);
           ^~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:1018:2: note: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119
           strcpy(dst->name, name);
           ^~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:1282:3: warning: Call to function =
'strcpy' is insecure as it does not provide bounding of the memory buffer. =
Replace unbounded copy functions with analogous functions that support leng=
th arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAP=
I.strcpy]
                   strcpy(e->comm, task->comm);
                   ^~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:1282:3: note: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119
                   strcpy(e->comm, task->comm);
                   ^~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:1326:2: warning: Call to function =
'strcpy' is insecure as it does not provide bounding of the memory buffer. =
Replace unbounded copy functions with analogous functions that support leng=
th arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAP=
I.strcpy]
           strcpy(c->name, name);
           ^~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:1326:2: note: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119
           strcpy(c->name, name);
           ^~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:1715:3: warning: Value stored to '=
len' is never read [clang-analyzer-deadcode.DeadStores]
                   len +=3D scnprintf(error->error_msg + len,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_gpu_error.c:1715:3: note: Value stored to 'len=
' is never read
                   len +=3D scnprintf(error->error_msg + len,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:55:2: warning: Value stored to '=
pdm_ctrl' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_ctrl =3D 0x00;
           ^          ~~~~
   sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:55:2: note: Value stored to 'pdm=
_ctrl' is never read
           pdm_ctrl =3D 0x00;
           ^          ~~~~
>> sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:107:2: warning: Value stored to =
'pdm_dma_enable' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_dma_enable =3D 0x00;
           ^                ~~~~
   sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:107:2: note: Value stored to 'pd=
m_dma_enable' is never read
           pdm_dma_enable =3D 0x00;
           ^                ~~~~
>> sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:123:2: warning: Value stored to =
'pdm_enable' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_enable =3D 0x00;
           ^            ~~~~
   sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:123:2: note: Value stored to 'pd=
m_enable' is never read
           pdm_enable =3D 0x00;
           ^            ~~~~
   sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:124:2: warning: Value stored to =
'pdm_dma_enable' is never read [clang-analyzer-deadcode.DeadStores]
           pdm_dma_enable  =3D 0x00;
           ^                 ~~~~
   sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:124:2: note: Value stored to 'pd=
m_dma_enable' is never read
           pdm_dma_enable  =3D 0x00;
           ^                 ~~~~
   sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:131:3: warning: Value stored to =
'pdm_dma_enable' is never read [clang-analyzer-deadcode.DeadStores]
                   pdm_dma_enable =3D 0x00;
                   ^                ~~~~
   sound/soc/amd/renoir/acp3x-rn-pdm-dma.c:131:3: note: Value stored to 'pd=
m_dma_enable' is never read
                   pdm_dma_enable =3D 0x00;
                   ^                ~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/i915/display/i9xx_plane.c:1009:3: warning: Value stored =
to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
                   offset =3D intel_de_read(dev_priv, DSPOFFSET(i9xx_plane)=
);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1009:3: note: Value stored to =
'offset' is never read
                   offset =3D intel_de_read(dev_priv, DSPOFFSET(i9xx_plane)=
);
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1013:4: warning: Value stored =
to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
                           offset =3D intel_de_read(dev_priv,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1013:4: note: Value stored to =
'offset' is never read
                           offset =3D intel_de_read(dev_priv,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1016:4: warning: Value stored =
to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
                           offset =3D intel_de_read(dev_priv,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/i9xx_plane.c:1016:4: note: Value stored to =
'offset' is never read
                           offset =3D intel_de_read(dev_priv,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/i915/display/skl_universal_plane.c:2308:2: warning: Valu=
e stored to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
           offset =3D intel_de_read(dev_priv, PLANE_OFFSET(pipe, plane_id));
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/skl_universal_plane.c:2308:2: note: Value s=
tored to 'offset' is never read
           offset =3D intel_de_read(dev_priv, PLANE_OFFSET(pipe, plane_id));
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/pdm_ctrl +55 sound/soc/amd/renoir/acp3x-rn-pdm-dma.c

2dce795e59f452 Vijendar Mukunda 2021-04-15   49  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   50  static void enable_pdm_clo=
ck(void __iomem *acp_base)
2dce795e59f452 Vijendar Mukunda 2021-04-15   51  {
2dce795e59f452 Vijendar Mukunda 2021-04-15   52  	u32 pdm_clk_enable, pdm_c=
trl;
2dce795e59f452 Vijendar Mukunda 2021-04-15   53  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   54  	pdm_clk_enable =3D ACP_PD=
M_CLK_FREQ_MASK;
2dce795e59f452 Vijendar Mukunda 2021-04-15  @55  	pdm_ctrl =3D 0x00;
2dce795e59f452 Vijendar Mukunda 2021-04-15   56  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   57  	rn_writel(pdm_clk_enable,=
 acp_base + ACP_WOV_CLK_CTRL);
2dce795e59f452 Vijendar Mukunda 2021-04-15   58  	pdm_ctrl =3D rn_readl(acp=
_base + ACP_WOV_MISC_CTRL);
2dce795e59f452 Vijendar Mukunda 2021-04-15   59  	pdm_ctrl |=3D ACP_WOV_MIS=
C_CTRL_MASK;
2dce795e59f452 Vijendar Mukunda 2021-04-15   60  	rn_writel(pdm_ctrl, acp_b=
ase + ACP_WOV_MISC_CTRL);
2dce795e59f452 Vijendar Mukunda 2021-04-15   61  }
2dce795e59f452 Vijendar Mukunda 2021-04-15   62  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   63  static void enable_pdm_int=
errupts(void __iomem *acp_base)
2dce795e59f452 Vijendar Mukunda 2021-04-15   64  {
2dce795e59f452 Vijendar Mukunda 2021-04-15   65  	u32 ext_int_ctrl;
2dce795e59f452 Vijendar Mukunda 2021-04-15   66  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   67  	ext_int_ctrl =3D rn_readl=
(acp_base + ACP_EXTERNAL_INTR_CNTL);
2dce795e59f452 Vijendar Mukunda 2021-04-15   68  	ext_int_ctrl |=3D PDM_DMA=
_INTR_MASK;
2dce795e59f452 Vijendar Mukunda 2021-04-15   69  	rn_writel(ext_int_ctrl, a=
cp_base + ACP_EXTERNAL_INTR_CNTL);
2dce795e59f452 Vijendar Mukunda 2021-04-15   70  }
2dce795e59f452 Vijendar Mukunda 2021-04-15   71  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   72  static void disable_pdm_in=
terrupts(void __iomem *acp_base)
2dce795e59f452 Vijendar Mukunda 2021-04-15   73  {
2dce795e59f452 Vijendar Mukunda 2021-04-15   74  	u32 ext_int_ctrl;
2dce795e59f452 Vijendar Mukunda 2021-04-15   75  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   76  	ext_int_ctrl =3D rn_readl=
(acp_base + ACP_EXTERNAL_INTR_CNTL);
2dce795e59f452 Vijendar Mukunda 2021-04-15   77  	ext_int_ctrl &=3D ~PDM_DM=
A_INTR_MASK;
2dce795e59f452 Vijendar Mukunda 2021-04-15   78  	rn_writel(ext_int_ctrl, a=
cp_base + ACP_EXTERNAL_INTR_CNTL);
2dce795e59f452 Vijendar Mukunda 2021-04-15   79  }
2dce795e59f452 Vijendar Mukunda 2021-04-15   80  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   81  static bool check_pdm_dma_=
status(void __iomem *acp_base)
2dce795e59f452 Vijendar Mukunda 2021-04-15   82  {
2dce795e59f452 Vijendar Mukunda 2021-04-15   83  	bool pdm_dma_status;
2dce795e59f452 Vijendar Mukunda 2021-04-15   84  	u32 pdm_enable, pdm_dma_e=
nable;
2dce795e59f452 Vijendar Mukunda 2021-04-15   85  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   86  	pdm_dma_status =3D false;
2dce795e59f452 Vijendar Mukunda 2021-04-15   87  	pdm_enable =3D rn_readl(a=
cp_base + ACP_WOV_PDM_ENABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15   88  	pdm_dma_enable =3D rn_rea=
dl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15   89  	if ((pdm_enable & ACP_PDM=
_ENABLE) && (pdm_dma_enable &
2dce795e59f452 Vijendar Mukunda 2021-04-15   90  	     ACP_PDM_DMA_EN_STATU=
S))
2dce795e59f452 Vijendar Mukunda 2021-04-15   91  		pdm_dma_status =3D true;
2dce795e59f452 Vijendar Mukunda 2021-04-15   92  	return pdm_dma_status;
2dce795e59f452 Vijendar Mukunda 2021-04-15   93  }
2dce795e59f452 Vijendar Mukunda 2021-04-15   94  =

2dce795e59f452 Vijendar Mukunda 2021-04-15   95  static int start_pdm_dma(v=
oid __iomem *acp_base)
2dce795e59f452 Vijendar Mukunda 2021-04-15   96  {
2dce795e59f452 Vijendar Mukunda 2021-04-15   97  	u32 pdm_enable;
2dce795e59f452 Vijendar Mukunda 2021-04-15   98  	u32 pdm_dma_enable;
2dce795e59f452 Vijendar Mukunda 2021-04-15   99  	int timeout;
2dce795e59f452 Vijendar Mukunda 2021-04-15  100  =

2dce795e59f452 Vijendar Mukunda 2021-04-15  101  	pdm_enable =3D 0x01;
2dce795e59f452 Vijendar Mukunda 2021-04-15  102  	pdm_dma_enable  =3D 0x01;
2dce795e59f452 Vijendar Mukunda 2021-04-15  103  =

2dce795e59f452 Vijendar Mukunda 2021-04-15  104  	enable_pdm_clock(acp_base=
);
2dce795e59f452 Vijendar Mukunda 2021-04-15  105  	rn_writel(pdm_enable, acp=
_base + ACP_WOV_PDM_ENABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15  106  	rn_writel(pdm_dma_enable,=
 acp_base + ACP_WOV_PDM_DMA_ENABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15 @107  	pdm_dma_enable =3D 0x00;
2dce795e59f452 Vijendar Mukunda 2021-04-15  108  	timeout =3D 0;
2dce795e59f452 Vijendar Mukunda 2021-04-15  109  	while (++timeout < ACP_CO=
UNTER) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  110  		pdm_dma_enable =3D rn_re=
adl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15  111  		if ((pdm_dma_enable & 0x=
02) =3D=3D ACP_PDM_DMA_EN_STATUS)
2dce795e59f452 Vijendar Mukunda 2021-04-15  112  			return 0;
2dce795e59f452 Vijendar Mukunda 2021-04-15  113  		udelay(DELAY_US);
2dce795e59f452 Vijendar Mukunda 2021-04-15  114  	}
2dce795e59f452 Vijendar Mukunda 2021-04-15  115  	return -ETIMEDOUT;
2dce795e59f452 Vijendar Mukunda 2021-04-15  116  }
2dce795e59f452 Vijendar Mukunda 2021-04-15  117  =

2dce795e59f452 Vijendar Mukunda 2021-04-15  118  static int stop_pdm_dma(vo=
id __iomem *acp_base)
2dce795e59f452 Vijendar Mukunda 2021-04-15  119  {
2dce795e59f452 Vijendar Mukunda 2021-04-15  120  	u32 pdm_enable, pdm_dma_e=
nable;
2dce795e59f452 Vijendar Mukunda 2021-04-15  121  	int timeout;
2dce795e59f452 Vijendar Mukunda 2021-04-15  122  =

2dce795e59f452 Vijendar Mukunda 2021-04-15 @123  	pdm_enable =3D 0x00;
2dce795e59f452 Vijendar Mukunda 2021-04-15  124  	pdm_dma_enable  =3D 0x00;
2dce795e59f452 Vijendar Mukunda 2021-04-15  125  =

2dce795e59f452 Vijendar Mukunda 2021-04-15  126  	pdm_enable =3D rn_readl(a=
cp_base + ACP_WOV_PDM_ENABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15  127  	pdm_dma_enable =3D rn_rea=
dl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15  128  	if (pdm_dma_enable & 0x01=
) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  129  		pdm_dma_enable =3D 0x02;
2dce795e59f452 Vijendar Mukunda 2021-04-15  130  		rn_writel(pdm_dma_enable=
, acp_base + ACP_WOV_PDM_DMA_ENABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15  131  		pdm_dma_enable =3D 0x00;
2dce795e59f452 Vijendar Mukunda 2021-04-15  132  		timeout =3D 0;
2dce795e59f452 Vijendar Mukunda 2021-04-15  133  		while (++timeout < ACP_C=
OUNTER) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  134  			pdm_dma_enable =3D rn_r=
eadl(acp_base +
2dce795e59f452 Vijendar Mukunda 2021-04-15  135  						  ACP_WOV_PDM_DMA_EN=
ABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15  136  			if ((pdm_dma_enable & 0=
x02) =3D=3D 0x00)
2dce795e59f452 Vijendar Mukunda 2021-04-15  137  				break;
2dce795e59f452 Vijendar Mukunda 2021-04-15  138  			udelay(DELAY_US);
2dce795e59f452 Vijendar Mukunda 2021-04-15  139  		}
2dce795e59f452 Vijendar Mukunda 2021-04-15  140  		if (timeout =3D=3D ACP_C=
OUNTER)
2dce795e59f452 Vijendar Mukunda 2021-04-15  141  			return -ETIMEDOUT;
2dce795e59f452 Vijendar Mukunda 2021-04-15  142  	}
2dce795e59f452 Vijendar Mukunda 2021-04-15  143  	if (pdm_enable =3D=3D ACP=
_PDM_ENABLE) {
2dce795e59f452 Vijendar Mukunda 2021-04-15  144  		pdm_enable =3D ACP_PDM_D=
ISABLE;
2dce795e59f452 Vijendar Mukunda 2021-04-15  145  		rn_writel(pdm_enable, ac=
p_base + ACP_WOV_PDM_ENABLE);
2dce795e59f452 Vijendar Mukunda 2021-04-15  146  	}
2dce795e59f452 Vijendar Mukunda 2021-04-15  147  	rn_writel(0x01, acp_base =
+ ACP_WOV_PDM_FIFO_FLUSH);
2dce795e59f452 Vijendar Mukunda 2021-04-15  148  	return 0;
2dce795e59f452 Vijendar Mukunda 2021-04-15  149  }
2dce795e59f452 Vijendar Mukunda 2021-04-15  150  =


:::::: The code@line 55 was first introduced by commit
:::::: 2dce795e59f452c6e526029669aa2c269bb99dfc CHROMIUM: ASoC: amd: acp dr=
iver changes to support I2S and dmic

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Guenter Roeck <groeck@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7857306487459656166==--


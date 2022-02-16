Content-Type: multipart/mixed; boundary="===============1429757110785778788=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Add SC8180x to hw catalog
Date: Wed, 16 Feb 2022 13:00:49 +0800
Message-ID: <202202161250.lumbNQEf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1429757110785778788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220215043353.1256754-2-bjorn.andersson@linaro.org>
References: <20220215043353.1256754-2-bjorn.andersson@linaro.org>
TO: Bjorn Andersson <bjorn.andersson@linaro.org>

Hi Bjorn,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on v5.17-rc4 next-20220215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bjorn-Andersson/drm-msm-dp=
u-Add-INTF_5-interrupts/20220215-123310
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: mips-randconfig-s031-20220216 (https://download.01.org/0day-ci/arch=
ive/20220216/202202161250.lumbNQEf-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/2ad34ad9a2871f13cf0948eec=
c12d7faabcee788
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bjorn-Andersson/drm-msm-dpu-Add-IN=
TF_5-interrupts/20220215-123310
        git checkout 2ad34ad9a2871f13cf0948eecc12d7faabcee788
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1124:46: sparse: sparse: =
excessive elements in array initializer

vim +1124 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

386fced3f76f6ba Jonathan Marek 2020-07-10  1117  =

2ad34ad9a2871f1 Rob Clark      2022-02-14  1118  static const struct dpu_pe=
rf_cfg sc8180x_perf_data =3D {
2ad34ad9a2871f1 Rob Clark      2022-02-14  1119  	.max_bw_low =3D 9600000,
2ad34ad9a2871f1 Rob Clark      2022-02-14  1120  	.max_bw_high =3D 9600000,
2ad34ad9a2871f1 Rob Clark      2022-02-14  1121  	.min_core_ib =3D 2400000,
2ad34ad9a2871f1 Rob Clark      2022-02-14  1122  	.min_llcc_ib =3D 800000,
2ad34ad9a2871f1 Rob Clark      2022-02-14  1123  	.min_dram_ib =3D 800000,
2ad34ad9a2871f1 Rob Clark      2022-02-14 @1124  	.danger_lut_tbl =3D {0xf,=
 0xffff, 0x0, 0x0},
2ad34ad9a2871f1 Rob Clark      2022-02-14  1125  	.qos_lut_tbl =3D {
2ad34ad9a2871f1 Rob Clark      2022-02-14  1126  		{.nentry =3D ARRAY_SIZE(=
sc8180x_qos_linear),
2ad34ad9a2871f1 Rob Clark      2022-02-14  1127  		.entries =3D sc8180x_qos=
_linear
2ad34ad9a2871f1 Rob Clark      2022-02-14  1128  		},
2ad34ad9a2871f1 Rob Clark      2022-02-14  1129  		{.nentry =3D ARRAY_SIZE(=
sc8180x_qos_macrotile),
2ad34ad9a2871f1 Rob Clark      2022-02-14  1130  		.entries =3D sc8180x_qos=
_macrotile
2ad34ad9a2871f1 Rob Clark      2022-02-14  1131  		},
2ad34ad9a2871f1 Rob Clark      2022-02-14  1132  		{.nentry =3D ARRAY_SIZE(=
sc7180_qos_nrt),
2ad34ad9a2871f1 Rob Clark      2022-02-14  1133  		.entries =3D sc7180_qos_=
nrt
2ad34ad9a2871f1 Rob Clark      2022-02-14  1134  		},
2ad34ad9a2871f1 Rob Clark      2022-02-14  1135  		/* TODO: macrotile-qseed=
 is different from macrotile */
2ad34ad9a2871f1 Rob Clark      2022-02-14  1136  	},
2ad34ad9a2871f1 Rob Clark      2022-02-14  1137  	.cdp_cfg =3D {
2ad34ad9a2871f1 Rob Clark      2022-02-14  1138  		{.rd_enable =3D 1, .wr_e=
nable =3D 1},
2ad34ad9a2871f1 Rob Clark      2022-02-14  1139  		{.rd_enable =3D 1, .wr_e=
nable =3D 0}
2ad34ad9a2871f1 Rob Clark      2022-02-14  1140  	},
2ad34ad9a2871f1 Rob Clark      2022-02-14  1141  	.clk_inefficiency_factor =
=3D 105,
2ad34ad9a2871f1 Rob Clark      2022-02-14  1142  	.bw_inefficiency_factor =
=3D 120,
2ad34ad9a2871f1 Rob Clark      2022-02-14  1143  };
2ad34ad9a2871f1 Rob Clark      2022-02-14  1144  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1429757110785778788==--


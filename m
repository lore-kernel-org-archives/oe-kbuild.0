Content-Type: multipart/mixed; boundary="===============0307741810290080743=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1948 dpu_hw_catalog_init() warn: possible memory leak of 'dpu_cfg'
Date: Sun, 21 Aug 2022 13:18:41 +0800
Message-ID: <202208211344.YIwVJkR3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0307741810290080743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15b3f48a4339e3c16acf18624e2b7f60bc5e9a2c
commit: de7d480f5e8ca6eace02a725abdadb9ea13294ef drm/msm/dpu: make dpu hard=
ware catalog static const
date:   7 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
config: microblaze-randconfig-m041-20220820 (https://download.01.org/0day-c=
i/archive/20220821/202208211344.YIwVJkR3-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1948 dpu_hw_catalog_init() w=
arn: possible memory leak of 'dpu_cfg'

Old smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1953 dpu_hw_catalog_init() w=
arn: possible memory leak of 'dpu_cfg'

vim +/dpu_cfg +1948 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

de7d480f5e8ca6 Dmitry Baryshkov  2022-06-02  1936  =

de7d480f5e8ca6 Dmitry Baryshkov  2022-06-02  1937  const struct dpu_mdss_cf=
g *dpu_hw_catalog_init(u32 hw_rev)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1938  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1939  	int i;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1940  	struct dpu_mdss_cfg *dp=
u_cfg;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1941  =

de7d480f5e8ca6 Dmitry Baryshkov  2022-06-02  1942  	dpu_cfg =3D kzalloc(siz=
eof(*dpu_cfg), GFP_KERNEL);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1943  	if (!dpu_cfg)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1944  		return ERR_PTR(-ENOMEM=
);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1945  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1946  	for (i =3D 0; i < ARRAY=
_SIZE(cfg_handler); i++) {
de7d480f5e8ca6 Dmitry Baryshkov  2022-06-02  1947  		if (cfg_handler[i].hw_=
rev =3D=3D hw_rev)
de7d480f5e8ca6 Dmitry Baryshkov  2022-06-02 @1948  			return cfg_handler[i]=
.dpu_cfg;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1949  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1950  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1951  	DPU_ERROR("unsupported =
chipset id:%X\n", hw_rev);
3208496720a180 Dmitry Baryshkov  2022-06-02  1952  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1953  	return ERR_PTR(-ENODEV);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1954  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  1955  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0307741810290080743==--


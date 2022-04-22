Content-Type: multipart/mixed; boundary="===============8372423617111692199=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 5/7] clk: mediatek: Switch to clk_hw provider APIs
Date: Sat, 23 Apr 2022 03:06:35 +0800
Message-ID: <202204230237.VEpN4Hnl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8372423617111692199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220419081246.2546159-6-wenst@chromium.org>
References: <20220419081246.2546159-6-wenst@chromium.org>
TO: "Chen-Yu Tsai" <wenst@chromium.org>

Hi Chen-Yu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/clk-med=
iatek-Move-to-struct-clk_hw-provider-APIs/20220419-161619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4694e44e4f2d8a6aa941814b51ef82b0d949adb1
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/mediatek/clk-apmixed.c:99:9: warning: Returning pointer to l=
ocal variable 'init' that will be invalid when returning. [returnDanglingLi=
fetime]
    return &tx->hw;
           ^
   drivers/clk/mediatek/clk-apmixed.c:85:16: note: Address of variable take=
n here.
    tx->hw.init =3D &init;
                  ^
   drivers/clk/mediatek/clk-apmixed.c:94:6: note: Assuming condition is fal=
se
    if (ret) {
        ^
   drivers/clk/mediatek/clk-apmixed.c:99:9: note: Address of variable taken=
 here.
    return &tx->hw;
           ^
   drivers/clk/mediatek/clk-apmixed.c:77:23: note: Variable created here.
    struct clk_init_data init =3D {};
                         ^
   drivers/clk/mediatek/clk-apmixed.c:99:9: note: Returning pointer to loca=
l variable 'init' that will be invalid when returning.
    return &tx->hw;
           ^
--
>> drivers/clk/mediatek/clk-cpumux.c:90:9: warning: Returning pointer to lo=
cal variable 'init' that will be invalid when returning. [returnDanglingLif=
etime]
    return &cpumux->hw;
           ^
   drivers/clk/mediatek/clk-cpumux.c:82:20: note: Address of variable taken=
 here.
    cpumux->hw.init =3D &init;
                      ^
   drivers/clk/mediatek/clk-cpumux.c:85:6: note: Assuming condition is false
    if (ret) {
        ^
   drivers/clk/mediatek/clk-cpumux.c:90:9: note: Address of variable taken =
here.
    return &cpumux->hw;
           ^
   drivers/clk/mediatek/clk-cpumux.c:66:23: note: Variable created here.
    struct clk_init_data init;
                         ^
   drivers/clk/mediatek/clk-cpumux.c:90:9: note: Returning pointer to local=
 variable 'init' that will be invalid when returning.
    return &cpumux->hw;
           ^
--
>> drivers/clk/mediatek/clk-gate.c:190:9: warning: Returning pointer to loc=
al variable 'init' that will be invalid when returning. [returnDanglingLife=
time]
    return &cg->hw;
           ^
   drivers/clk/mediatek/clk-gate.c:182:16: note: Address of variable taken =
here.
    cg->hw.init =3D &init;
                  ^
   drivers/clk/mediatek/clk-gate.c:185:6: note: Assuming condition is false
    if (ret) {
        ^
   drivers/clk/mediatek/clk-gate.c:190:9: note: Address of variable taken h=
ere.
    return &cg->hw;
           ^
   drivers/clk/mediatek/clk-gate.c:164:23: note: Variable created here.
    struct clk_init_data init =3D {};
                         ^
   drivers/clk/mediatek/clk-gate.c:190:9: note: Returning pointer to local =
variable 'init' that will be invalid when returning.
    return &cg->hw;
           ^
--
>> drivers/clk/mediatek/clk-mux.c:175:9: warning: Returning pointer to loca=
l variable 'init' that will be invalid when returning. [returnDanglingLifet=
ime]
    return &clk_mux->hw;
           ^
   drivers/clk/mediatek/clk-mux.c:167:21: note: Address of variable taken h=
ere.
    clk_mux->hw.init =3D &init;
                       ^
   drivers/clk/mediatek/clk-mux.c:170:6: note: Assuming condition is false
    if (ret) {
        ^
   drivers/clk/mediatek/clk-mux.c:175:9: note: Address of variable taken he=
re.
    return &clk_mux->hw;
           ^
   drivers/clk/mediatek/clk-mux.c:151:23: note: Variable created here.
    struct clk_init_data init =3D {};
                         ^
   drivers/clk/mediatek/clk-mux.c:175:9: note: Returning pointer to local v=
ariable 'init' that will be invalid when returning.
    return &clk_mux->hw;
           ^
--
>> drivers/clk/mediatek/clk-pll.c:364:9: warning: Returning pointer to loca=
l variable 'init' that will be invalid when returning. [returnDanglingLifet=
ime]
    return &pll->hw;
           ^
   drivers/clk/mediatek/clk-pll.c:345:17: note: Address of variable taken h=
ere.
    pll->hw.init =3D &init;
                   ^
   drivers/clk/mediatek/clk-pll.c:359:6: note: Assuming condition is false
    if (ret) {
        ^
   drivers/clk/mediatek/clk-pll.c:364:9: note: Address of variable taken he=
re.
    return &pll->hw;
           ^
   drivers/clk/mediatek/clk-pll.c:321:23: note: Variable created here.
    struct clk_init_data init =3D {};
                         ^
   drivers/clk/mediatek/clk-pll.c:364:9: note: Returning pointer to local v=
ariable 'init' that will be invalid when returning.
    return &pll->hw;
           ^

vim +/init +99 drivers/clk/mediatek/clk-apmixed.c

cdb2bab78aff97 James Liao   2015-05-20   72  =

4694e44e4f2d8a Chen-Yu Tsai 2022-04-19   73  struct clk_hw * __init mtk_clk=
_register_ref2usb_tx(const char *name,
cdb2bab78aff97 James Liao   2015-05-20   74  			const char *parent_name, vo=
id __iomem *reg)
cdb2bab78aff97 James Liao   2015-05-20   75  {
cdb2bab78aff97 James Liao   2015-05-20   76  	struct mtk_ref2usb_tx *tx;
cdb2bab78aff97 James Liao   2015-05-20   77  	struct clk_init_data init =3D=
 {};
4694e44e4f2d8a Chen-Yu Tsai 2022-04-19   78  	int ret;
cdb2bab78aff97 James Liao   2015-05-20   79  =

cdb2bab78aff97 James Liao   2015-05-20   80  	tx =3D kzalloc(sizeof(*tx), G=
FP_KERNEL);
cdb2bab78aff97 James Liao   2015-05-20   81  	if (!tx)
cdb2bab78aff97 James Liao   2015-05-20   82  		return ERR_PTR(-ENOMEM);
cdb2bab78aff97 James Liao   2015-05-20   83  =

cdb2bab78aff97 James Liao   2015-05-20   84  	tx->base_addr =3D reg;
cdb2bab78aff97 James Liao   2015-05-20   85  	tx->hw.init =3D &init;
cdb2bab78aff97 James Liao   2015-05-20   86  =

cdb2bab78aff97 James Liao   2015-05-20   87  	init.name =3D name;
cdb2bab78aff97 James Liao   2015-05-20   88  	init.ops =3D &mtk_ref2usb_tx_=
ops;
cdb2bab78aff97 James Liao   2015-05-20   89  	init.parent_names =3D &parent=
_name;
cdb2bab78aff97 James Liao   2015-05-20   90  	init.num_parents =3D 1;
cdb2bab78aff97 James Liao   2015-05-20   91  =

4694e44e4f2d8a Chen-Yu Tsai 2022-04-19   92  	ret =3D clk_hw_register(NULL,=
 &tx->hw);
cdb2bab78aff97 James Liao   2015-05-20   93  =

4694e44e4f2d8a Chen-Yu Tsai 2022-04-19   94  	if (ret) {
cdb2bab78aff97 James Liao   2015-05-20   95  		kfree(tx);
4694e44e4f2d8a Chen-Yu Tsai 2022-04-19   96  		return ERR_PTR(ret);
4694e44e4f2d8a Chen-Yu Tsai 2022-04-19   97  	}
cdb2bab78aff97 James Liao   2015-05-20   98  =

4694e44e4f2d8a Chen-Yu Tsai 2022-04-19  @99  	return &tx->hw;
cdb2bab78aff97 James Liao   2015-05-20  100  }
32b028fb1d09a0 Miles Chen   2021-09-02  101  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8372423617111692199==--


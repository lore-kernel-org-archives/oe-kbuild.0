Content-Type: multipart/mixed; boundary="===============0772564208975598380=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/5] clk: mediatek: Switch to clk_hw provider APIs
Date: Fri, 20 May 2022 01:43:58 +0800
Message-ID: <202205200146.UKeHNLbu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0772564208975598380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220519071610.423372-5-wenst@chromium.org>
References: <20220519071610.423372-5-wenst@chromium.org>
TO: "Chen-Yu Tsai" <wenst@chromium.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
CC: "Chen-Yu Tsai" <wenst@chromium.org>
CC: "Chun-Jie Chen" <chun-jie.chen@mediatek.com>
CC: Miles Chen <miles.chen@mediatek.com>
CC: "Rex-BC Chen" <rex-bc.chen@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: linux-clk(a)vger.kernel.org
CC: linux-mediatek(a)lists.infradead.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org

Hi Chen-Yu,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[cannot apply to v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/clk-med=
iatek-Move-to-struct-clk_hw-provider-APIs/20220519-151909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: h8300-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 791b14b4387747251f80ea0e712573fa431d655f
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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
>> drivers/clk/mediatek/clk-pll.c:360:9: warning: Returning pointer to loca=
l variable 'init' that will be invalid when returning. [returnDanglingLifet=
ime]
    return &pll->hw;
           ^
   drivers/clk/mediatek/clk-pll.c:341:17: note: Address of variable taken h=
ere.
    pll->hw.init =3D &init;
                   ^
   drivers/clk/mediatek/clk-pll.c:355:6: note: Assuming condition is false
    if (ret) {
        ^
   drivers/clk/mediatek/clk-pll.c:360:9: note: Address of variable taken he=
re.
    return &pll->hw;
           ^
   drivers/clk/mediatek/clk-pll.c:317:23: note: Variable created here.
    struct clk_init_data init =3D {};
                         ^
   drivers/clk/mediatek/clk-pll.c:360:9: note: Returning pointer to local v=
ariable 'init' that will be invalid when returning.
    return &pll->hw;
           ^

vim +/init +175 drivers/clk/mediatek/clk-mux.c

a3ae549917f163 Owen Chen     2019-03-05  145  =

791b14b4387747 Chen-Yu Tsai  2022-05-19  146  static struct clk_hw *mtk_clk=
_register_mux(const struct mtk_mux *mux,
a3ae549917f163 Owen Chen     2019-03-05  147  				 struct regmap *regmap,
a3ae549917f163 Owen Chen     2019-03-05  148  				 spinlock_t *lock)
a3ae549917f163 Owen Chen     2019-03-05  149  {
a3ae549917f163 Owen Chen     2019-03-05  150  	struct mtk_clk_mux *clk_mux;
571cfadcc628dd Weiyi Lu      2020-05-27  151  	struct clk_init_data init =
=3D {};
791b14b4387747 Chen-Yu Tsai  2022-05-19  152  	int ret;
a3ae549917f163 Owen Chen     2019-03-05  153  =

a3ae549917f163 Owen Chen     2019-03-05  154  	clk_mux =3D kzalloc(sizeof(*=
clk_mux), GFP_KERNEL);
a3ae549917f163 Owen Chen     2019-03-05  155  	if (!clk_mux)
a3ae549917f163 Owen Chen     2019-03-05  156  		return ERR_PTR(-ENOMEM);
a3ae549917f163 Owen Chen     2019-03-05  157  =

a3ae549917f163 Owen Chen     2019-03-05  158  	init.name =3D mux->name;
a3ae549917f163 Owen Chen     2019-03-05  159  	init.flags =3D mux->flags | =
CLK_SET_RATE_PARENT;
a3ae549917f163 Owen Chen     2019-03-05  160  	init.parent_names =3D mux->p=
arent_names;
a3ae549917f163 Owen Chen     2019-03-05  161  	init.num_parents =3D mux->nu=
m_parents;
710573dee31b4c Chun-Jie Chen 2021-07-26  162  	init.ops =3D mux->ops;
a3ae549917f163 Owen Chen     2019-03-05  163  =

a3ae549917f163 Owen Chen     2019-03-05  164  	clk_mux->regmap =3D regmap;
a3ae549917f163 Owen Chen     2019-03-05  165  	clk_mux->data =3D mux;
a3ae549917f163 Owen Chen     2019-03-05  166  	clk_mux->lock =3D lock;
a3ae549917f163 Owen Chen     2019-03-05  167  	clk_mux->hw.init =3D &init;
a3ae549917f163 Owen Chen     2019-03-05  168  =

791b14b4387747 Chen-Yu Tsai  2022-05-19  169  	ret =3D clk_hw_register(NULL=
, &clk_mux->hw);
791b14b4387747 Chen-Yu Tsai  2022-05-19  170  	if (ret) {
a3ae549917f163 Owen Chen     2019-03-05  171  		kfree(clk_mux);
791b14b4387747 Chen-Yu Tsai  2022-05-19  172  		return ERR_PTR(ret);
a3ae549917f163 Owen Chen     2019-03-05  173  	}
a3ae549917f163 Owen Chen     2019-03-05  174  =

791b14b4387747 Chen-Yu Tsai  2022-05-19 @175  	return &clk_mux->hw;
a3ae549917f163 Owen Chen     2019-03-05  176  }
a3ae549917f163 Owen Chen     2019-03-05  177  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0772564208975598380==--

